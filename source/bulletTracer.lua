class("BulletTracer").extends(Projectile)


function BulletTracer:init(x,y,speed, damage, offsetCrank, scale, duration)
    BulletTracer.super.init(self, x,y,speed, damage, offsetCrank, scale, duration)
    self.scale = scale
    self.maxLength = 240
    self.currentLength = 0
    self.startPos = {x=x,y=y}
    self.endPos = {x=0,y=0}
    self.angle = crankPosition
    self.startPos.x = player.x 
    self.startPos.y = player.y
    self.radius += self.speed + (((player.projectileSpeedBonus*self.speed)/100)) * deltaTime
    self.direction = {x=0, y=1}
    self.direction.x = self.radius*math.cos(math.rad(self.angle + self.offset))* deltaTime
    self.direction.y = self.radius*math.sin(math.rad(self.angle + self.offset))* deltaTime
    self.lineS = playdate.geometry.lineSegment.new(self.startPos.x, self.startPos.y, self.endPos.x, self.endPos.y)
    self.playerPos = {}
    self.playerPos.x = player.cannonGunSprite.x
    self.playerPos.y = player.cannonGunSprite.y
    self.offsetHeight = 35
    self.tick = 150
end

function BulletTracer:reset(x, y, speed, damage, angle, scale, duration)
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
    self.resetTick = true
    self.active = true
    table.insert(beams, self)
end

function BulletTracer:endBeam()
    table.remove(beams, indexOf(beams, self))
end

function BulletTracer:update()
    if not self.active then return end

    BulletTracer.super.update(self)

    self.startPos.x = self.playerPos.x +(self.height+self.offsetHeight) * math.cos(math.rad((self.originAngle)))
    self.startPos.y = self.playerPos.y +(self.height+self.offsetHeight) * math.sin(math.rad((self.originAngle)))
    
    self.radius += self.speed + (((player.projectileSpeedBonus*self.speed)/100)) * deltaTime
    self.direction.x = self.radius*math.cos(math.rad((self.originAngle) + self.offset)) * deltaTime
    self.direction.y = self.radius*math.sin(math.rad((self.originAngle) + self.offset)) * deltaTime
    self.currentLength = self.currentLength + self.speed + (((player.projectileSpeedBonus*self.speed)/100)) * deltaTime
    
    if self.currentLength > self.maxLength then
        self.currentLength = self.maxLength
    end
    
    
    self.endPos.x = self.startPos.x + self.direction.x * self.currentLength
    self.endPos.y = self.startPos.y + self.direction.y * self.currentLength
    
    if self.endPos.x <= 0 or self.endPos.x >= 400 then
        self.originAngle = 180-self.originAngle
        self.playerPos.x = self.endPos.x
        self.playerPos.y = self.endPos.y
        self.radius = 0
        self.offsetHeight = 0    
    end
    if self.endPos.y <= 0 or self.endPos.y >= 205 then
        self.originAngle =  -self.originAngle
        self.playerPos.x = self.endPos.x
        self.playerPos.y = self.endPos.y
        self.radius = 0  
        self.offsetHeight = 0  
    end
    self.playerPos.x = math.clamp(self.playerPos.x, 1, 399)
    self.playerPos.y = math.clamp(self.playerPos.y, 1, 204)
    table.each(gfx.sprite.querySpriteInfoAlongLine(self.startPos.x, self.startPos.y, self.endPos.x, self.endPos.y), 
    function(collision)
        if collision.sprite:isa(Enemy) then
            enemyManager:touchEnemy(self, collision.sprite, true)
            -- collision.sprite:loseHp(self.damage + ((player.damageBonus*self.damage)/100))
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