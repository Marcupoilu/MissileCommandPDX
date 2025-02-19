class("BulletBeamReflect").extends(Projectile)


function BulletBeamReflect:init(x,y,speed, damage, offsetCrank, scale, duration, hp)
    BulletBeamReflect.super.init(self, x,y,speed, damage, offsetCrank, scale, duration)
    self.hp = hp
    self.maxLength = 10
    self.currentLength = 0
    self.startPos = {x=x,y=y}
    self.endPos = {x=0,y=0}
    self.angle = crankPosition
    self.startPos.x = player.x 
    self.startPos.y = player.y
    self.radius += self.speed + (((player.projectileSpeedBonus*self.speed)/100)) * deltaTime
    self.direction = {x=0, y=1}
    self.lineS = playdate.geometry.lineSegment.new(self.startPos.x, self.startPos.y, self.endPos.x, self.endPos.y)
    self.lasers = {}
    self.startPos.x = player.cannonGunSprite.x +(self.height+50) * math.cos(math.rad((self.originAngle) + self.offset))
    self.startPos.y = player.cannonGunSprite.y +(self.height+50) * math.sin(math.rad((self.originAngle) + self.offset))
    self.playerX = player.cannonGunSprite.x
    self.playerY = player.cannonGunSprite.y
    self.target = nil
    self.currentAngle = self.originAngle
    self.currentEnemy = nil
    self.tick = 200
end

function BulletBeamReflect:reset(x, y, speed, damage, angle, scale, duration, hp)
    self:init(x, y, speed, damage, angle, scale, duration, hp)
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

function BulletBeamReflect:endBeam()
    table.remove(beams, indexOf(beams, self))
end

function BulletBeamReflect:update()
    if not self.active then return end
    BulletBeamReflect.super.update(self)
    if self.target ~= nil then
        self.currentAngle = math.deg(math.atan(self.target.y - self.playerY, self.target.x - self.playerX))
    end
    self.startPos.x = self.playerX +(self.radius) * math.cos(math.rad((self.currentAngle)))
    self.startPos.y = self.playerY +(self.radius) * math.sin(math.rad((self.currentAngle)))

    self.radius += self.speed + (((player.projectileSpeedBonus*self.speed)/100)) * deltaTime
    self.direction.x = self.radius*math.cos(math.rad((self.currentAngle) + self.offset)) * deltaTime
    self.direction.y = self.radius*math.sin(math.rad((self.currentAngle) + self.offset)) * deltaTime
    self.currentLength = self.currentLength + self.speed + (((player.projectileSpeedBonus*self.speed)/100)) * deltaTime

    if self.currentLength > self.maxLength then
        self.currentLength = self.maxLength
    end

    self.endPos.x = self.startPos.x + self.direction.x * self.currentLength
    self.endPos.y = self.startPos.y + self.direction.y * self.currentLength

    table.each(gfx.sprite.querySpritesAlongLine(self.startPos.x, self.startPos.y, self.endPos.x, self.endPos.y), 
    function(collision)
        if collision:isa(Enemy) and collision ~= self.currentEnemy then
            self.target = getMinDistanceValue(collision, gfx.sprite.getAllSprites()  )
            self.currentEnemy = collision
            enemyManager:touchEnemy(self, collision, true)
            if self.target ~= nil then
                self.playerX = collision.x
                self.playerY = collision.y
                self.radius = 0
            end
            if self.hp <= 0 then
                self:destroy()
            end
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