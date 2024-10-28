class("BulletLaserDome").extends(Projectile)

-- local p = ParticleCircle(0,0)

function BulletLaserDome:init(x,y,speed, damage, offsetCrank, scale, angle)
    BulletLaserDome.super.init(self, x,y,speed, damage, offsetCrank, scale)
    self.maxLength = 240
    self.currentLength = 0
    self.startPos = {x=x,y=y}
    self.endPos = {x=0,y=0}
    self.angle = angle
    self.startPos.x = player.x 
    self.startPos.y = player.y - 10
    self.radius += self.speed + (((player.projectileSpeedBonus*self.speed)/100)) * deltaTime
    self.direction = {x=0, y=1}
    self.direction.x = self.radius*math.cos(math.rad(self.angle + self.offset))* deltaTime
    self.direction.y = self.radius*math.sin(math.rad(self.angle + self.offset))* deltaTime
    self.duration = nil
    self.lineS = playdate.geometry.lineSegment.new(self.startPos.x, self.startPos.y, self.endPos.x, self.endPos.y)
    self.lasers = {}
    self.tick = 300
    table.insert(beams, self)
end

function BulletLaserDome:endBeam()
    table.remove(beams, indexOf(beams, self))
end

function BulletLaserDome:update()
    BulletLaserDome.super.update(self)
    self.radius += self.speed + (((player.projectileSpeedBonus*self.speed)/100)) * deltaTime
    self.direction.x = self.radius*math.cos(math.rad(self.angle - 90 + self.offset)) * deltaTime
    self.direction.y = self.radius*math.sin(math.rad(self.angle - 90 + self.offset)) * deltaTime
    self.currentLength = self.currentLength + self.speed + (((player.projectileSpeedBonus*self.speed)/100)) * deltaTime
    if self.currentLength > self.maxLength then
        self.currentLength = self.maxLength
    end

    
    self.endPos.x = self.startPos.x + self.direction.x * self.currentLength
    self.endPos.y = self.startPos.y + self.direction.y * self.currentLength
    table.each(gfx.sprite.querySpriteInfoAlongLine(self.startPos.x, self.startPos.y, self.endPos.x, self.endPos.y), 
    function(collision)
        if collision.sprite:isa(Enemy) then
            enemyManager:touchEnemy(self, collision.sprite, true)
        end
    end)
    gfx.setLineCapStyle(gfx.kLineCapStyleRound)
    gfx.setColor(gfx.kColorWhite)
    gfx.setLineWidth(self.scale)
    self.lineS.x1 = self.startPos.x
    self.lineS.y1 = self.startPos.y
    self.lineS.x2 = self.endPos.x
    self.lineS.y2 = self.endPos.y
    gfx.drawLine(self.lineS)
end