class("Enemy").extends(gfx.sprite)

local p = ParticleCircle(0,0)

function Enemy:init(x,y,speed,hp, xp, damage, enemyImage)
    Enemy.super.init(self)
    self.animations = {}
    self:setGroups({3})
    self:setCollidesWithGroups({1,2})
    if animationsData[self["className"]] ~= nil then
        for key, animationData in pairs(animationsData[self["className"]]) do
            table.insert(self.animations, {Name=animationData.Name, Animation=gfx.animation.loop.new(animationData.Delay, animationData.Source, animationData.Loop)})
        end
    end
    table.insert(enemies, self)
    self.speed = speed
    self.originalSpeed = self.speed
    self.radius = 0
    self.angle = 0
    self.offset = 90
    self.originAngle = 0
    self.originPosition = {}
    self.hp = hp
    self.damage = damage
    self.xpReward = xp
    self.state = "Idle"
    self.currentOverlappingSprites = {} 
    self:setScale(0.8)
    if table.getsize(self.animations) <= 0 then
        self:setImage(enemyImage)
    else
        self.currentAnimation = table.findByParam(self.animations, "Name", self.state).Animation
        self:setImage(self.currentAnimation:image())
    end

    self:setCollideRect(0,0,self:getSize())
    self:moveTo(x,y)
    self:add()
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
    if self.x > playdate.display.getWidth() or self.y > playdate.display.getHeight() or self.x < 0 or self.y < 0 then
        self:remove()
    end
    local collisions = self:overlappingSprites()
    for index, value in pairs(collisions) do
        if value:isa(Bullet) and table.contains(self.currentOverlappingSprites, value) == false then
            self:touchEnemy(value)
            if value:isa(BulletShockwave) then
                self.radius = 0
                self.originPosition.x = self.x
                self.originPosition.y = self.y
                self.angle = value.originAngle
                self.speed *= value.power
                playdate.timer.new(100, function() 
                    self.speed = self.originalSpeed 
                    self.radius = 0
                    self.originPosition.x = self.x
                    self.originPosition.y = self.y
                    self.angle = self.originAngle 
                end)
            end
            table.insert(self.currentOverlappingSprites, value)
            if value.tick ~= nil then
                playdate.timer.new(value.tick, function() table.remove(self.currentOverlappingSprites, indexOf(self.currentOverlappingSprites, value)) end)
            end
        end
        if value:isa(UISprite) or value:getTag() == 1 then
            shake:setShakeAmount(15)
            player:loseHp(self.damage)
            self:death()
        end
    end
end

function Enemy:touchEnemy(value)
    p:moveTo(value.x, value.y)
    p:setSize(8,8)
    p:setColor(gfx.kColorWhite)
    p:setMode(Particles.modes.DECAY)
    p:setSpeed(3, 5)
    p:add(10)
    self:loseHp(value.damage + ((player.damageBonus*value.damage)/100))
    value:loseHp(1)
end

function Enemy:loseHp(value)
    self.hp -= value
    if(self.hp <= 0) then
        player:gainXP(self.xpReward + (((player.xpBonus*self.xpReward)/100)))
        self:death()
    end
end

function Enemy:death()
    shake:setShakeAmount(5)
    p:moveTo(self.x, self.y)
    p:setSize(7,7)
    p:setColor(gfx.kColorWhite)
    p:setMode(Particles.modes.DECAY)
    p:setSpeed(3, 7)
    p:add(20)
    table.remove(enemies, indexOf(enemies, self))
    self:remove()
end