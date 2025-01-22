class("Projectile").extends(gfx.sprite)

-- local p = ParticleCircle(0,0)

function Projectile:init(x,y,speed, damage, offsetCrank, scale, duration)
    Projectile.super.init(self)
    self.originPosition = {}
    self.width, self.height = player.cannonGunSprite:getSize()
    self.originAngle = player.cannonGunSprite:getRotation() - 90
    self.originPosition.x = player.cannonGunSprite.x +(self.height-10) * math.cos(math.rad(self.originAngle))
    self.originPosition.y = player.cannonGunSprite.y +(self.height-10) * math.sin(math.rad(self.originAngle))
    self:moveTo(self.originPosition.x,self.originPosition.y)
    self.x = self.originPosition.x
    self.y = self.originPosition.y
    self.hp = 1
    self:setGroups({2})
    self:setCollidesWithGroups({3})
    self.speed = speed + ((player.projectileSpeedBonus*speed)/100)
    self.damage = damage
    self.scale =  scale + ((player.scaleBonus*scale)/100)
    self.resetTick = false
    if duration ~= nil then
        self.duration = duration + ((player.durationBonus*duration)/100)
    end
    self.radius = 0
    self.offset = offsetCrank
    if self:isa(BulletAura) == false and self:isa(BulletBlackHole) == false then
        self:setRotation((self.originAngle + 90) + self.offset)
    end
    -- if self.duration ~= nil and self.duration ~= 0 then
        -- self.timer = playdate.timer.new(toMilliseconds(self.duration), function() self:destroy() end) 
    -- end
    table.insert(bullets, self)
    -- self.active = false
end

function Projectile:update()
    if self.duration == nil or self.duration == 0 then
        return
    end
    self.duration -= refreshRate
    if self.duration <= 0 then
        self:destroy()
        if self:isa(BulletAura) then
            self.auraVisibleSprite:remove()
        end
    end
end

function Projectile:reset(x, y, speed, damage, angle, scale, duration, hp)
    self:init(x, y, speed, damage, angle, scale, duration)
    -- self:moveTo(x, y)
    -- self.speed = speed
    -- self.damage = damage
    -- self.offsetCrank = angle
    -- self.scale = scale + ((player.scaleBonus*scale)/100)
    -- if duration ~= nil then
    --     self.duration = duration + ((player.durationBonus*duration)/100)
    -- end
    -- self.hp = 1
    -- self.radius = 0
    if hp ~= nil then
        self.hp = hp
    end
    if self.time ~= nil then
        self.time = 0
    end
    self.resetTick = true
    self.active = true
    self:add()
    soundSamplerBullet:play()
end

function Projectile:destroy()
    if self:isa(BulletBeam) then
        soundSamplerLaserBeam:stop()
    end
    if table.contains(beams, self) then
        table.remove(beams, indexOf(beams, self))
    end
    if self.timer ~= nil then
        playdate.timer.remove(self.timer)
    end
    BulletPool:release(self)
end

function Projectile:destroyWithParticles()
    if table.contains(beams, self) then
        table.remove(beams, indexOf(beams, self))
    end
    if self.timer ~= nil then
        playdate.timer.remove(self.timer)
    end
    BulletPool:release(self)
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