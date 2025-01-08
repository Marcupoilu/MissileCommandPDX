class("EnemyManager").extends(gfx.sprite)

p = ParticleCircle(0, 0)
p:setSize(5, 6)
p:setColor(gfx.kColorWhite)
p:setMode(Particles.modes.DECAY)
p:setSpeed(3, 7)

local math_deg = math.deg
local math_atan = math.atan

function EnemyManager:init()
    EnemyManager.super.init(self)
    self.timers = {}
    self.droneBullets = {Bullet="", Time=0}
end

function EnemyManager:changeState(state)
    if self.state ~= state then
        self.state = state
    end
end

function EnemyManager:update()
    for _, bullet in ipairs(self.droneBullets) do
        bullet.Time -= refreshRate
        if bullet.Time <= 0 then
            bullet.Bullet:remove()
            table.remove(self.droneBullets, indexOf(self.droneBullets, bullet))
        end
    end
    for _, enemy in ipairs(enemies) do
        if #enemy.animations > 0 then
            local anim = table.findByParam(enemy.animations, "Name", enemy.state)
            if anim then
                enemy.currentAnimation = anim.Animation
                enemy:setImage(enemy.currentAnimation:image())
            end
        end

        -- Process collisions
        local collisions = enemy:overlappingSprites()
        for _, value in ipairs(collisions) do
            if value:isa(Bullet) and not table.contains(enemy.currentOverlappingSprites, value) then
                -- Process different bullet types
                if value:isa(BulletBlackhole) then self:processBlackholeBullet(value, enemy) end
                if value:isa(BulletDrone) then self:processDroneBullet(value, enemy) return end
                if value:isa(BulletToxicVape) then self:dotEnemy(value, enemy) end
                if value:isa(BulletShockwave) then self:processShockwaveBullet(value, enemy) end
                if value:isa(BulletRocket) then self:processRocketBullet(value, enemy) end
                
                -- Default bullet collision handling
                if not value:isa(BulletBlackhole) and not value:isa(BulletDrone) and not value:isa(BulletToxicVape) then
                    if value:isa(BulletAura) then
                        if enemy:alphaCollision(value) then 
                            self:touchEnemy(value, enemy)
                        else
                        end
                    else
                        self:touchEnemy(value, enemy)
                    end
                end
            end

            if value:isa(UISprite) or value:getTag() == 1 then
                shake:setShakeAmount(15)
                player:loseHp(enemy.damage)
                self:death(enemy)
            end
        end
    end
end

function EnemyManager:processBlackholeBullet(value, enemy)
    local dx, dy = value.x - enemy.x, value.y - enemy.y
    enemy.radius, enemy.angle = 0, math_deg(math_atan(dy, dx))
    enemy.originPosition.x, enemy.originPosition.y = enemy.x, enemy.y
    enemy.overrideDirection = true
end

function EnemyManager:processDroneBullet(value, enemy)
    local sprite = gfx.sprite.new(gfx.image.new("images/bullets/bullet_drone"))
    sprite:moveTo(value.x, value.y)
    sprite:add()
    local droneBullet = {Bullet=sprite, Time=value.duration}
    table.insert(self.droneBullets, droneBullet)
    local angles = cutAngle(value.projectileAmount + player.projectileAmount)
    for _, angle in ipairs(angles) do
        BulletDroneLaser(value.x, value.y, value.speed / 2, value.damage, angle, value.scale*4, value.duration, 0)
    end
    value:loseHp(1)
end

function EnemyManager:processShockwaveBullet(value, enemy)
    if enemy.overrideDirection then return end
    enemy.radius, enemy.angle = 0, value.originAngle
    enemy.originPosition.x, enemy.originPosition.y = enemy.x, enemy.y
    enemy.speed = enemy.speed * value.power
    enemy.overrideDirection = true
    enemy.shockwaveTimer = 200
end

function EnemyManager:processRocketBullet(value, enemy)
    BulletExplosion(enemy.x, enemy.y, value.speed, value.damage + (player.damageBonus * value.damage / 100), value.offset, value.scale, value.duration, value.explosionDamage)
end

function EnemyManager:touchEnemy(value, enemy, bulletHp)
    if table.contains(enemy.currentOverlappingSprites, value) then return end
    -- Vérifier si l'ennemi est déjà affecté par cette BulletAura récemment
    if value:isa(BulletAura) then
        enemy._auraTimers = enemy._auraTimers or {} -- Table pour stocker les timers des auras
        local lastHitTime = enemy._auraTimers[value] or 0
        local currentTime = playdate.getCurrentTimeMilliseconds()

        -- Vérifier le cooldown (X millisecondes définies par la BulletAura)
        if currentTime - lastHitTime < value.tick then return end
        enemy._auraTimers[value] = currentTime
    end

    -- Le reste du traitement pour tous les types de projectiles
    enemy:setImageDrawMode(gfx.kDrawModeFillWhite)
    enemy.blinkAmount = 5
    p:moveTo(enemy.x, enemy.y)
    p:add(1)
    soundSamplerEnemyImpact:play()
    self:loseHp(value.damage + (player.damageBonus * value.damage / 100), enemy, value.className)
    if not bulletHp then value:loseHp(1) end
    value.tickTime = value.tick

    -- Ajout de l'aura uniquement pour gérer la logique des autres bullets
    if not value:isa(BulletAura) then
        table.insert(enemy.currentOverlappingSprites, value)
    end
end


function EnemyManager:dotEnemy(value, enemy)
    if table.contains(enemy.currentOverlappingSprites, value) then return end
    p:moveTo(enemy.x, enemy.y)
    p:add(1)
    table.insert(enemy.currentOverlappingSprites, value)
    enemy.lastTickTime = value.tickTime
    enemy.dotTimer = value.tickTime
    enemy.dotDamage = value.damage
    enemy.dotValues += value.tickNumber
    -- self:dotTimer(value, enemy)
end

-- function EnemyManager:dotTimer(value, enemy)
--     for _, dotValue in ipairs(enemy.dotValues) do
--         table.insert(self.timers, playdate.timer.new(toMilliseconds(1), function()
--             if dotValue <= 0 or enemy.dead then return end
--             p:moveTo(enemy.x, enemy.y)
--             p:add(1)
--             p:update()
--             self:loseHp(value.damage + (player.damageBonus * value.damage / 100), enemy)
--             dotValue = dotValue - 1
--             self:dotTimer(value, enemy)
--         end))
--     end
-- end

function EnemyManager:loseHp(value, enemy, className)
    enemy.hp = enemy.hp - value
    if enemy.hp <= 0 then
        player:gainXP(enemy.xpReward + (player.xpBonus * enemy.xpReward / 100))
        player.core += enemy.core
        playerBonus.gameData.core += enemy.core
        player.enemiesKilled += 1
        playerBonus.gameData.enemiesKilled += 1
        self:death(enemy)
    end
end

function EnemyManager:death(enemy)
    local index = indexOf(enemies, enemy)
    if not index then return end
    enemy.dead = true
    if enemy.spawner then enemy.spawner.spawnCount -= 1 end
    table.each(self.timers, function(t) t:remove() end)
    enemy:remove()
    table.remove(enemies, index)
    if enemy.boss ~= nil then
        soundSamplerBossDeath:play()
    else
        soundSamplerEnemyDeath:play()
    end
end

function EnemyManager:stop(value, enemy)
    enemy.speed = 0
    enemy.freezeTimer = toMilliseconds(value)
end
