class("BulletFreezer").extends(Projectile)

-- local p = ParticleCircle(0,0)

function BulletFreezer:init(x,y,speed, damage, offsetCrank, scale, duration, freezeDuration)
    BulletFreezer.super.init(self, x,y,speed, damage, offsetCrank, scale, duration)
    self.maxLength = 240
    self.currentLength = 0
    self.startPos = {x=x,y=y}
    self.endPos = {x=0,y=0}
    self.angle = crankPosition
    self.startPos.x = player.x 
    self.startPos.y = player.y
    self.freezeDuration = freezeDuration
    self.radius += self.speed + (((player.projectileSpeedBonus*self.speed)/100)) * deltaTime
    self.direction = {x=0, y=1}
    self.direction.x = self.radius*math.cos(math.rad(self.angle + self.offset))* deltaTime
    self.direction.y = self.radius*math.sin(math.rad(self.angle + self.offset))* deltaTime
    self.duration = duration
    self.lineS = playdate.geometry.lineSegment.new(self.startPos.x, self.startPos.y, self.endPos.x, self.endPos.y)
    self.lasers = {}
    -- playdate.timer.new(self.duration, self.endBeam, self)
end

function BulletFreezer:reset(x, y, speed, damage, angle, scale, duration, freezeDuration)
    self:init(x, y, speed, damage, angle, scale, duration, freezeDuration)
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
    self.resetTick = true
    self.active = true
    table.insert(beams, self)
end

function BulletFreezer:endBeam()
    table.remove(beams, indexOf(beams, self))
end

function BulletFreezer:update()
    if not self.active then return end

    BulletFreezer.super.update(self)
    self.angle = player.cannonGunSprite:getRotation()
    self.startPos.x = player.cannonGunSprite.x +(self.height+50) * math.cos(math.rad((self.angle - 90) ))
    self.startPos.y = player.cannonGunSprite.y +(self.height+50) * math.sin(math.rad((self.angle - 90) ))
    self.radius += self.speed + (((player.projectileSpeedBonus*self.speed)/100)) * deltaTime
    self.direction.x = self.radius*math.cos(math.rad((self.angle - 90) + self.offset)) * deltaTime
    self.direction.y = self.radius*math.sin(math.rad((self.angle - 90) + self.offset)) * deltaTime
    self.currentLength = self.currentLength + self.speed + (((player.projectileSpeedBonus*self.speed)/100)) * deltaTime

    if self.currentLength > self.maxLength then
        self.currentLength = self.maxLength
    end

    
    self.endPos.x = self.startPos.x + self.direction.x * self.currentLength
    self.endPos.y = self.startPos.y + self.direction.y * self.currentLength
    table.each(gfx.sprite.querySpriteInfoAlongLine(self.startPos.x, self.startPos.y, self.endPos.x, self.endPos.y), 
    function(collision)
        if collision.sprite:isa(Enemy) then
            -- self.endPos.x = collision.entryPoint.x
            -- self.endPos.y = collision.entryPoint.y
            enemyManager:stop(self.freezeDuration, collision.sprite)
        end
    end)
    gfx.setLineCapStyle(gfx.kLineCapStyleRound)
    gfx.setColor(gfx.kColorWhite)
    gfx.setLineWidth(math.random(math.floor(self.scale/3), math.floor(self.scale)))
    self.lineS.x1 = self.startPos.x
    self.lineS.y1 = self.startPos.y
    self.lineS.x2 = self.endPos.x
    self.lineS.y2 = self.endPos.y
    gfx.drawLine(self.lineS)
end