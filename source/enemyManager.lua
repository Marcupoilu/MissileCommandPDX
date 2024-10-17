class("EnemyManager").extends(gfx.sprite)

local p = ParticleCircle(0,0)
p:setSize(5,6)
p:setColor(gfx.kColorWhite)
p:setMode(Particles.modes.DECAY)
p:setSpeed(3, 7)

function EnemyManager:init()
    EnemyManager.super.init(self)
end

function EnemyManager:changeState(state)
    if self.state == state then
        return
    end
    self.state = state
end

function EnemyManager:update()
    -- p:update()

    for key, enemy in pairs(enemies) do
        if table.getsize(enemy.animations) > 0 then
            enemy.currentAnimation = table.findByParam(enemy.animations, "Name", enemy.state).Animation
            enemy:setImage(enemy.currentAnimation:image())
        end
            

        local collisions = enemy:overlappingSprites()
        for index, value in pairs(collisions) do
            if value:isa(Bullet) and table.contains(enemy.currentOverlappingSprites, value) == false then
                if value:isa(BulletAura) then
                    if enemy:alphaCollision(value) == false then
                        return
                    end
                end
                if value:isa(BulletBlackhole) then
                    local dx = value.x - enemy.x
                    local dy = value.y - enemy.y
                    enemy.radius = 0
                    enemy.originPosition.x = enemy.x
                    enemy.originPosition.y = enemy.y
                    enemy.angle = math.deg(math.atan(dy, dx))
                end
                if value:isa(BulletDrone) then
                    -- value:updateDurationTimer(value.duration)
                    local sprite = gfx.sprite.new(gfx.image.new("images/bullets/bullet_drone" ))
                    sprite:moveTo(value.x, value.y)
                    sprite:add()
                    playdate.timer.new(toMilliseconds(value.duration), function() sprite:remove() end)
                    local angles = cutAngle(value.projectileAmount + player.projectileAmount)
                    for key, angle in ipairs(angles) do
                         BulletDroneLaser(value.x, value.y, value.speed/2, value.damage, angle, value.scale*4, value.duration, 0)
                    end
                    -- value.speed = 0
                    value:loseHp(1)
                    return
                end
                if value:isa(BulletBlackhole) == false and value:isa(BulletDrone) == false and value:isa(BulletToxicVape) == false then

                    self:touchEnemy(value, enemy)
                end
                if value:isa(BulletToxicVape) == true then
                    self:dotEnemy(value, enemy)
                end
                if value:isa(BulletShockwave) then
                    enemy.radius = 0
                    enemy.originPosition.x = enemy.x
                    enemy.originPosition.y = enemy.y
                    enemy.angle = value.originAngle
                    enemy.speed *= value.power
                    if enemy.overrideDirection ~= nil then
                        enemy.overrideDirection = true
                    end
                    playdate.timer.new(100, function() 
                        enemy.speed = enemy.originSpeed 
                        enemy.radius = 0
                        enemy.originPosition.x = enemy.x
                        enemy.originPosition.y = enemy.y
                        enemy.angle = enemy.originAngle 
                        if enemy.overrideDirection ~= nil then
                            enemy.overrideDirection = false
                        end
                    end)
                end
                if value:isa(BulletRocket) then
                    BulletExplosion(enemy.x, enemy.y, value.speed, value.damage+((player.damageBonus*value.damage)/100), angle, value.scale, value.duration, value.explosionDamage)
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
    if table.contains(enemy.currentOverlappingSprites, value) == true then return end
    enemy:setImageDrawMode(gfx.kDrawModeFillWhite)
    playdate.timer.new(100, function ()
        enemy:setImageDrawMode(gfx.kDrawModeCopy)
    end)
    -- FX(enemy.x, enemy.y, "AnimationHit", true)
    p:moveTo(enemy.x, enemy.y)
    p:add(1)
    p:update()
    -- self.fx:add()
    -- self.fx:moveTo(self.x,self.y)
    -- self.fx.currentAnimation.frame = 1
    self:loseHp(value.damage + ((player.damageBonus*value.damage)/100), enemy, value.className)
    if bulletHp == nil then
        value:loseHp(1)
    end
    table.insert(enemy.currentOverlappingSprites, value)
    if value.tick ~= nil then
        playdate.timer.new(value.tick, function() table.remove(enemy.currentOverlappingSprites, indexOf(enemy.currentOverlappingSprites, value)) end)
    end
end

function EnemyManager:dotEnemy(value, enemy)
    if table.contains(enemy.currentOverlappingSprites, value) == true then return end
    FX(self.x, self.y, "AnimationHit", true)

    -- self.fx:add()
    -- self.fx:moveTo(self.x,self.y)
    -- self.fx.currentAnimation.frame = 1
    table.insert(enemy.currentOverlappingSprites, value)
    table.insert(enemy.dotValues, value.tickNumber)
    self:dotTimer(value, enemy)
end
function EnemyManager:dotTimer(value, enemy)
    for key, dotValue in pairs(enemy.dotValues) do
        playdate.timer.new(toMilliseconds(1),
        function()
            if dotValue <= 0 or enemy.dead == true then   
                return   
            end
            FX(enemy.x, enemy.y, "AnimationHit", true)

            -- enemy.fx:add()
            -- enemy.fx:moveTo(enemy.x,enemy.y)
            -- enemy.fx.currentAnimation.frame = 1

            self:loseHp(value.damage + ((player.damageBonus*value.damage)/100), enemy)
            dotValue -= 1
            self:dotTimer(value, enemy)
        end)
    end
end

function EnemyManager:loseHp(value, enemy, className)
    enemy.hp -= value
    if(enemy.hp <= 0) then
        player:gainXP(enemy.xpReward + (((player.xpBonus*enemy.xpReward)/100)))
        playerBonus.gameData.core += enemy.core
        player.enemiesKilled += 1
        playerBonus.gameData.enemiesKilled += 1
        self:death(enemy)
    end
end

function EnemyManager:death(enemy)
    -- FX(enemy.x, enemy.y, "AnimationHit", true)

    -- enemy.fx:add()
    -- enemy.fx:moveTo(enemy.x,enemy.y)
    -- enemy.fx.currentAnimation.frame = 1
    if indexOf(enemies, enemy) == nil then return end
    table.remove(enemies, indexOf(enemies, enemy))
    enemy.dead = true
    enemy:remove()
end

function EnemyManager:stop(value, enemy)
    enemy.speed = 0
    if value ~= nil then
        playdate.timer.new(toMilliseconds(value), function() enemy.speed = enemy.originSpeed end)
    end
end