class("Projectile").extends(gfx.sprite)

-- local p = ParticleCircle(0,0)

function Projectile:init(x,y,speed, damage, offsetCrank, scale, duration)
    Projectile.super.init(self)
    self.originPosition = {}
    self.width, self.height = player.cannonGunSprite:getSize()
    self.originAngle = player.cannonGunSprite:getRotation() - 90
    self.originPosition.x = player.cannonGunSprite.x +(self.height+10) * math.cos(math.rad(self.originAngle))
    self.originPosition.y = player.cannonGunSprite.y +(self.height+10) * math.sin(math.rad(self.originAngle))
    self:moveTo(self.originPosition.x,self.originPosition.y)
    self.x = self.originPosition.x
    self.y = self.originPosition.y
    self.hp = 1
    self:setGroups({2})
    self:setCollidesWithGroups({3})
    self.speed = speed + ((player.projectileSpeedBonus*speed)/100)
    self.damage = damage
    self.scale =  scale + ((player.scaleBonus*scale)/100)
    local baseSize = self:getSize()
    self.scale = math.ceil(baseSize  * self.scale) / baseSize
    self:setScale(self.scale)
    self:setCenter(0.5, 0.5)
    

    if duration ~= nil then
        self.duration = duration + ((player.durationBonus*duration)/100)
    end
    self.radius = 0
    self.offset = offsetCrank
    if self:isa(BulletAura) == false and self:isa(BulletBlackHole) == false then
        self:setRotation(self.originAngle + 90)
    end
    if self.duration ~= nil or self.duration ~= 0 then
        self.timer = playdate.timer.new(toMilliseconds(self.duration), function() self:destroy() end) 
    end
    table.insert(bullets, self)
end

function Projectile:updateDurationTimer(newDuration)
    self.timer:remove()
    self.timer = playdate.timer.new(toMilliseconds(newDuration), function() self:destroy() end) 
end

function Projectile:update()
end

function Projectile:destroy()
    if self:isa(BulletPlasma) == true then 
        p:moveTo(self.x, self.y)
        p:setSize(5,6)
        p:setColor(gfx.kColorWhite)
        p:setMode(Particles.modes.DECAY)
        p:setSpeed(3, 7)
        p:add(1)
    end
    if table.contains(beams, self) then
        table.remove(beams, indexOf(beams, self))
    end
    if self.timer ~= nil then
        playdate.timer.remove(self.timer)
    end
    self:remove()
end

function Projectile:destroyWithParticles()
        p:moveTo(self.x, self.y)
        p:setSize(5,6)
        p:setColor(gfx.kColorWhite)
        p:setMode(Particles.modes.DECAY)
        p:setSpeed(3, 7)
        p:add(1)
    if table.contains(beams, self) then
        table.remove(beams, indexOf(beams, self))
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