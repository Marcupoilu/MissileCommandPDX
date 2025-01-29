class("EnemyManager").extends(gfx.sprite)

local p = ParticleCircle(0, 0)
p:setSize(5, 6)
p:setColor(gfx.kColorWhite)
p:setMode(Particles.modes.DECAY)
p:setSpeed(3, 7)

local math_deg, math_atan = math.deg, math.atan
local table_insert, table_remove = table.insert, table.remove

function EnemyManager:init()
    EnemyManager.super.init(self)
    self.timers = {}
    self.droneBullets = {}
end

function EnemyManager:update()
    -- Mise à jour des balles drones
    for i = #self.droneBullets, 1, -1 do
        local bullet = self.droneBullets[i]
        bullet.Time -= refreshRate
        if bullet.Time <= 0 then
            bullet.Bullet:remove()
            table_remove(self.droneBullets, i)
        end
    end
    
    -- Mise à jour des ennemis
    for i = #enemies, 1, -1 do
        local enemy = enemies[i]
        if enemy.animations and #enemy.animations > 0 then
            local anim = table.findByParam(enemy.animations, "Name", enemy.state)
            if anim then
                enemy.currentAnimation = anim.Animation
                enemy:setImage(enemy.currentAnimation:image())
            end
        end

        -- Vérification des collisions
        local collisions = enemy:overlappingSprites()
        for _, obj in ipairs(collisions) do
            if obj:isa(Bullet) and not table.contains(enemy.currentOverlappingSprites, obj) then
                self:handleBulletCollision(obj, enemy)
            elseif obj:isa(UISprite) or obj:getTag() == 1 then
                shake:setShakeAmount(15)
                player:loseHp(enemy.damage)
                self:death(enemy)
            end
        end
    end
end

function EnemyManager:handleBulletCollision(value, enemy)
    if value:isa(BulletBlackhole) then 
        self:processBlackholeBullet(value, enemy) 
    elseif value:isa(BulletDrone) then 
        self:processDroneBullet(value, enemy) 
        return 
    elseif value:isa(BulletToxicVape) then 
        self:dotEnemy(value, enemy) 
    elseif value:isa(BulletShockwave) then 
        self:processShockwaveBullet(value, enemy) 
    elseif value:isa(BulletRocket) then 
        self:processRocketBullet(value, enemy) 
    else
        if value:isa(BulletAura) or value:isa(bulletFlamethrower) then
            if enemy:alphaCollision(value) then 
                self:touchEnemy(value, enemy) 
            end
        else
            self:touchEnemy(value, enemy) 
        end
    end
end

function EnemyManager:processBlackholeBullet(value, enemy)
    enemy.radius, enemy.angle = 0, math_deg(math_atan(value.y - enemy.y, value.x - enemy.x))
    enemy.originPosition.x, enemy.originPosition.y = enemy.x, enemy.y
    enemy.overrideDirection = true
end

function EnemyManager:processDroneBullet(value, enemy)
    local sprite = gfx.sprite.new(gfx.image.new("images/bullets/bullet_drone"))
    sprite:moveTo(value.x, value.y)
    sprite:add()
    table_insert(self.droneBullets, {Bullet = sprite, Time = value.duration * 1.5})
    local angles = cutAngle(value.projectileAmount + player.projectileAmount)
    for _, angle in ipairs(angles) do
        local bullet = BulletPool:get(BulletDroneLaser) or BulletDroneLaser(value.x, value.y, value.speed / 6, value.damage, angle, value.scale * 4, value.duration * 1.5, 0)
        bullet:reset(value.x, value.y, value.speed / 6, value.damage, angle, value.scale * 4, value.duration * 1.5, 0)
        BulletPool:release(bullet)
    end
    value:loseHp(1)
end

function EnemyManager:touchEnemy(value, enemy)
    if table.contains(enemy.currentOverlappingSprites, value) then return end
    enemy:setImageDrawMode(gfx.kDrawModeFillWhite)
    enemy.blinkAmount = 5
    soundSamplerEnemyImpact:play()
    self:loseHp(value.damage + (player.damageBonus * value.damage / 100), enemy)
    value:loseHp(1)
    value.tickTime = value.tick
    table_insert(enemy.currentOverlappingSprites, value)
end

function EnemyManager:dotEnemy(value, enemy)
    if table.contains(enemy.currentOverlappingSprites, value) then return end
    table_insert(enemy.currentOverlappingSprites, value)
    enemy.lastTickTime, enemy.dotTimer, enemy.dotDamage = value.tickTime, value.tickTime, value.damage
    enemy.dotValues = enemy.dotValues + value.tickNumber
end

function EnemyManager:loseHp(value, enemy)
    enemy.hp = enemy.hp - value
    if enemy.hp <= 0 then
        player:gainXP(enemy.xpReward + (player.xpBonus * enemy.xpReward / 100))
        player.core = player.core + enemy.core
        playerBonus.gameData.core = playerBonus.gameData.core + enemy.core
        player.enemiesKilled = player.enemiesKilled + 1
        playerBonus.gameData.enemiesKilled = playerBonus.gameData.enemiesKilled + 1
        self:death(enemy)
    end
end

function EnemyManager:death(enemy)
    local index = indexOf(enemies, enemy)
    if not index then return end
    p:moveTo(enemy.x, enemy.y)
    p:add(1)
    enemy.dead = true
    if enemy.spawner then enemy.spawner.spawnCount = enemy.spawner.spawnCount - 1 end
    BulletPool:release(enemy)
    table_remove(enemies, index)
    if enemy.boss ~= nil then
        soundSamplerBossDeath :play()
    else
        soundSamplerEnemyDeath:play()
    end
end

function EnemyManager:stop(value, enemy)
    enemy.speed = 0
    enemy.freezeTimer = toMilliseconds(value)
end
