class("BulletOrbital").extends(Bullet)

function BulletOrbital:init(x,y,speed, damage, offsetCrank, scale, duration, bulletImage, originAngle, originPosition)
    BulletOrbital.super.init(self,x,y,speed, damage, offsetCrank, scale, duration, bulletImage)
    self.hp = 1
    self.rot = 0
    self:setCenter(-1,-1)
    if originAngle ~= nil then
        self.originAngle = originAngle
    end
    if originPosition ~= nil then
        self.originPosition = originPosition
    end
end


function BulletOrbital:update()
    BulletOrbital.super.update(self)
    -- self:setRotation(self.rot)
    -- self.rot += 10
    self.radius += self.speed + (((player.projectileSpeedBonus*self.speed)/100)) * deltaTime
    self:moveTo(self.radius*math.cos(math.rad(self.originAngle + self.offset)) + self.originPosition.x, self.radius*math.sin(math.rad(self.originAngle + self.offset)) + self.originPosition.y)
    if self.x > playdate.display.getWidth() or self.y > playdate.display.getHeight() or self.x < 0 or self.y < 0 then
        self:remove()
    end
end