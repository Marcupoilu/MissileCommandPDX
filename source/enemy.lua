class("Enemy").extends(gfx.sprite)

-- local p = ParticleCircle(0,0)

function Enemy:init(x,y,speed,hp, xp, damage, enemyImage, core)
    Enemy.super.init(self)
    self.animations = {}
    self.core = core
    self:setGroups({3})
    self:setCollidesWithGroups({1,2})
    if animationsData[self["className"]] ~= nil then
        for key, animationData in pairs(animationsData[self["className"]]) do
            table.insert(self.animations, {Name=animationData.Name, Animation=gfx.animation.loop.new(animationData.Delay, animationData.Source, animationData.Loop)})
        end
    end
    self.dotValues = {}
    self.spritePos = {}
    self.speed = speed
    self.originSpeed = speed
    self.radius = 0
    self.angle = 0
    self.shakeAmount = 0
    self.offset = 90
    self.originAngle = 0
    self.originPosition = {}
    self.hp = hp
    self.damage = damage
    self.xpReward = xp
    self.dead = false
    self.state = "Idle"
    self.currentOverlappingSprites = {} 
    self.timer = nil
    -- self:setScale(1)
    if table.getsize(self.animations) <= 0 then
        self:setImage(enemyImage)
    else
        self.currentAnimation = table.findByParam(self.animations, "Name", self.state).Animation
        self:setImage(self.currentAnimation:image())
    end
    
    self:setCollideRect(0,0,self:getSize())
    self:moveTo(x,y)
    self:add()
    table.insert(enemies, self)
end

function Enemy:changeState(state)
    if self.state == state then
        return
    end
    self.state = state
end

function Enemy:update()
    if table.getsize(self.animations) > 0 then
        self.currentAnimation = table.findByParam(self.animations, "Name", self.state).Animation
        self:setImage(self.currentAnimation:image())
    end
    -- if self.x > playdate.display.getWidth() or self.y > playdate.display.getHeight() or self.x < 0 or self.y < 0 then
    --     self:remove()
    -- end
    local collisions = self:overlappingSprites()
    for index, value in pairs(collisions) do
        if value:isa(Bullet) and table.contains(self.currentOverlappingSprites, value) == false then
            if value:isa(BulletAura) then
                if self:alphaCollision(value) == false then
                    return
                end
            end
            if value:isa(BulletBlackhole) then
                local dx = value.x - self.x
                local dy = value.y - self.y
                self.radius = 0
                self.originPosition.x = self.x
                self.originPosition.y = self.y
                self.angle = math.deg(math.atan(dy, dx))
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
            if value:isa(bulletBlackhole) == false and value:isa(BulletDrone) == false then
                self:touchEnemy(value)
            end
            if value:isa(BulletShockwave) then
                self.radius = 0
                self.originPosition.x = self.x
                self.originPosition.y = self.y
                self.angle = value.originAngle
                self.speed *= value.power
                if self.overrideDirection ~= nil then
                    self.overrideDirection = true
                end
                playdate.timer.new(100, function() 
                    self.speed = self.originSpeed 
                    self.radius = 0
                    self.originPosition.x = self.x
                    self.originPosition.y = self.y
                    self.angle = self.originAngle 
                    if self.overrideDirection ~= nil then
                        self.overrideDirection = false
                    end
                end)
            end
            if value:isa(BulletRocket) then
                BulletExplosion(self.x, self.y, value.speed, value.damage+((player.damageBonus*value.damage)/100), angle, value.scale+((player.scaleBonus*value.scale)/100), value.duration, value.explosionDamage)
            end
        end
        if value:isa(UISprite) or value:getTag() == 1 then
            shake:setShakeAmount(15)
            player:loseHp(self.damage)
            self:death()
        end
    end
end

function Enemy:touchEnemy(value, bulletHp)
    if table.contains(self.currentOverlappingSprites, value) == true then return end
    p:moveTo(self.x, self.y)
    p:setSize(10,10)
    p:setColor(gfx.kColorWhite)
    p:setMode(Particles.modes.DECAY)
    p:setSpeed(3, 5)
    p:add(1)
    self:loseHp(value.damage + ((player.damageBonus*value.damage)/100), value.className)
    if bulletHp == nil then
        value:loseHp(1)
    end
    table.insert(self.currentOverlappingSprites, value)
    if value.tick ~= nil then
        playdate.timer.new(value.tick, function() table.remove(self.currentOverlappingSprites, indexOf(self.currentOverlappingSprites, value)) end)
    end
end

function Enemy:dotEnemy(value)
    if table.contains(self.currentOverlappingSprites, value) == true then return end
    p:moveTo(self.x, self.y)
    p:setSize(10,10)
    p:setColor(gfx.kColorWhite)
    p:setMode(Particles.modes.DECAY)
    p:setSpeed(3, 5)
    p:add(1)
    table.insert(self.currentOverlappingSprites, value)
    table.insert(self.dotValues, value.tickNumber)
    self:dotTimer(value)
end
function Enemy:dotTimer(value)
    for key, dotValue in pairs(self.dotValues) do
        playdate.timer.new(toMilliseconds(1),
        function()
            if dotValue <= 0 or self.dead == true then   
                return   
            end
            p:moveTo(self.x, self.y)
            p:setSize(10,10)
            p:setColor(gfx.kColorWhite)
            p:setMode(Particles.modes.DECAY)
            p:setSpeed(3, 5)
            p:add(1)
            self:loseHp(value.damage + ((player.damageBonus*value.damage)/100))
            dotValue -= 1
            self:dotTimer(value)
        end)
    end
end

function Enemy:loseHp(value, className)
    self.hp -= value
    if(self.hp <= 0) then
        player:gainXP(self.xpReward + (((player.xpBonus*self.xpReward)/100)))
        playerBonus.gameData.core += self.core
        player.enemiesKilled += 1
        playerBonus.gameData.enemiesKilled += 1
        self:death()
    end
end

function Enemy:death()
    -- shake:setShakeAmount(5)
    p:moveTo(self.x, self.y)
    p:setSize(7,7)
    p:setColor(gfx.kColorWhite)
    p:setMode(Particles.modes.DECAY)
    p:setSpeed(3, 7)
    p:add(1)
    table.remove(enemies, indexOf(enemies, self))
    self.dead = true
    self:remove()
end

function Enemy:stop(value)
    self.speed = 0
    if value ~= nil then
        playdate.timer.new(toMilliseconds(value), function() self.speed = self.originSpeed end)
    end
end