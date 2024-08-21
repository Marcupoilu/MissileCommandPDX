class("Projectile").extends(gfx.sprite)

-- local p = ParticleCircle(0,0)

function Projectile:init(x,y,speed, damage, offsetCrank, scale, duration)
    Projectile.super.init(self)
    self.x = x
    self.y = y
    self.hp = 1
    self:setGroups({2})
    self:setCollidesWithGroups({3})
    self.speed = speed
    self.damage = damage
    self.scale = scale + ((player.scaleBonus*scale)/100)
    self:setScale(self.scale)
    self.duration = duration
    self.originAngle = player.cannonGunSprite:getRotation() - 90
    self.originPosition = {x=x,y=y}
    self.radius = 0
    self.offset = offsetCrank
    self.width, self.height = player.cannonGunSprite:getSize()
    self.originPosition.x = player.cannonGunSprite.x +(self.height+10) * math.cos(math.rad(self.originAngle))
    self.originPosition.y = player.cannonGunSprite.y +(self.height+10) * math.sin(math.rad(self.originAngle))
    self:moveTo(self.originPosition.x,self.originPosition.y)
    if self:isa(BulletPlasma) == false and self:isa(BulletAura) == false then
        self:setRotation(self.originAngle + 90)
    end
    if self.duration ~= nil or self.duration ~= 0 then
        self.timer = playdate.timer.new(toMilliseconds(self.duration), function() self:destroy() end) 
    end
end

function Projectile:updateDurationTimer(newDuration)
    self.timer:remove()
    self.timer = playdate.timer.new(toMilliseconds(newDuration), function() self:destroy() end) 
end

function Projectile:update()
end

function Projectile:destroy()
    if self:isa(Plasma) == true then 
        p:moveTo(self.x, self.y)
        p:setSize(5,6)
        p:setColor(gfx.kColorWhite)
        p:setMode(Particles.modes.DECAY)
        p:setSpeed(3, 7)
        p:add(20)
    end
    if self.timer ~= nil then
        playdate.timer.remove(self.timer)
    end
    self:remove()
end

function  Projectile:loseHp(damage)
    self.hp -= damage
    if self.hp <= 0 then
        self:destroy()
    end
end

function Projectile:resetPosAndRot()
    self.originPosition.x = self.x
    self.originPosition.y = self.y
    self.radius = 0
end