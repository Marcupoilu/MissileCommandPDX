class("EnemyManager").extends(gfx.sprite)

local p = ParticleCircle(0, 0)
p:setSize(5, 6)
p:setColor(gfx.kColorWhite)
p:setMode(Particles.modes.DECAY)
p:setSpeed(3, 7)

local math_deg = math.deg
local math_atan = math.atan

function EnemyManager:init()
    EnemyManager.super.init(self)
end

function EnemyManager:changeState(state)
    if self.state ~= state then
        self.state = state
    end
end

function EnemyManager:update()
    for _, enemy in ipairs(enemies) do
        if #enemy.animations > 0 then
            local anim = table.findByParam(enemy.animations, "Name", enemy.state)
            if anim then
                enemy.currentAnimation = anim.Animation
                enemy:setImage(enemy.currentAnimation:image())
            end
        end

        local collisions = enemy:overlappingSprites()
        for _, value in ipairs(collisions) do
            if value:isa(Bullet) and not table.contains(enemy.currentOverlappingSprites, value) then
                if value:isa(BulletAura) and not enemy:alphaCollision(value) then
                    return
                end

                if value:isa(BulletBlackhole) then
                    local dx, dy = value.x - enemy.x, value.y - enemy.y
                    enemy.radius = 0
                    enemy.originPosition.x, enemy.originPosition.y = enemy.x, enemy.y
                    enemy.angle = math_deg(math_atan(dy, dx))
                end

                if value:isa(BulletDrone) then
                    local sprite = gfx.sprite.new(gfx.image.new("images/bullets/bullet_drone"))
                    sprite:moveTo(value.x, value.y)
                    sprite:add()
                    playdate.timer.new(toMilliseconds(value.duration), function() sprite:remove() end)
                    local angles = cutAngle(value.projectileAmount + player.projectileAmount)
                    for _, angle in ipairs(angles) do
                        BulletDroneLaser(value.x, value.y, value.speed / 2, value.damage, angle, value.scale * 4, value.duration, 0)
                    end
                    value:loseHp(1)
                    return
                end

                if not value:isa(BulletBlackhole) and not value:isa(BulletDrone) and not value:isa(BulletToxicVape) then
                    self:touchEnemy(value, enemy)
                end
                if value:isa(BulletToxicVape) then
                    self:dotEnemy(value, enemy)
                end
                if value:isa(BulletShockwave) then
                    enemy.radius = 0
                    enemy.originPosition.x, enemy.originPosition.y = enemy.x, enemy.y
                    enemy.angle = value.originAngle
                    enemy.speed = enemy.speed * value.power
                    enemy.overrideDirection = true
                    playdate.timer.new(100, function()
                        enemy.speed = enemy.originSpeed
                        enemy.overrideDirection = false
                    end)
                end
                if value:isa(BulletRocket) then
                    BulletExplosion(enemy.x, enemy.y, value.speed, value.damage + (player.damageBonus * value.damage / 100), angle, value.scale, value.duration, value.explosionDamage)
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

function EnemyManager:touchEnemy(value, enemy, bulletHp)
    if table.contains(enemy.currentOverlappingSprites, value) then return end
    enemy:setImageDrawMode(gfx.kDrawModeFillWhite)
    playdate.timer.new(100, function() enemy:setImageDrawMode(gfx.kDrawModeCopy) end)
    p:moveTo(enemy.x, enemy.y)
    p:add(1)
    p:update()
    self:loseHp(value.damage + (player.damageBonus * value.damage / 100), enemy, value.className)
    if bulletHp == nil then value:loseHp(1) end
    table.insert(enemy.currentOverlappingSprites, value)
    if value.tick then
        playdate.timer.new(value.tick, function() table.remove(enemy.currentOverlappingSprites, indexOf(enemy.currentOverlappingSprites, value)) end)
    end
end

function EnemyManager:dotEnemy(value, enemy)
    if table.contains(enemy.currentOverlappingSprites, value) then return end
    p:moveTo(enemy.x, enemy.y)
    p:add(1)
    p:update()    table.insert(enemy.currentOverlappingSprites, value)
    table.insert(enemy.dotValues, value.tickNumber)
    self:dotTimer(value, enemy)
end

function EnemyManager:dotTimer(value, enemy)
    for _, dotValue in ipairs(enemy.dotValues) do
        playdate.timer.new(toMilliseconds(1), function()
            if dotValue <= 0 or enemy.dead then return end
            p:moveTo(enemy.x, enemy.y)
            p:add(1)
            p:update()
            self:loseHp(value.damage + (player.damageBonus * value.damage / 100), enemy)
            dotValue = dotValue - 1
            self:dotTimer(value, enemy)
        end)
    end
end

function EnemyManager:loseHp(value, enemy, className)
    enemy.hp = enemy.hp - value
    if enemy.hp <= 0 then
        player:gainXP(enemy.xpReward + (player.xpBonus * enemy.xpReward / 100))
        playerBonus.gameData.core = playerBonus.gameData.core + enemy.core
        player.enemiesKilled = player.enemiesKilled + 1
        playerBonus.gameData.enemiesKilled = playerBonus.gameData.enemiesKilled + 1
        self:death(enemy)
    end
end

function EnemyManager:death(enemy)
    local index = indexOf(enemies, enemy)
    if not index then return end
    table.remove(enemies, index)
    enemy.dead = true
    enemy:remove()
end

function EnemyManager:stop(value, enemy)
    enemy.speed = 0
    if value then
        playdate.timer.new(toMilliseconds(value), function() enemy.speed = enemy.originSpeed end)
    end
end