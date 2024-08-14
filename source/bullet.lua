class("Bullet").extends(Projectile)

local bulletImage = gfx.image.new("images/bullet" )

function Bullet:init(x,y,speed, damage, offsetCrank, scale, duration)
    Bullet.super.init(self,x,y,speed, damage, offsetCrank, scale, duration)
    self.image = bulletImage
    self:setImage(bulletImage)
    -- self:setScale(scale)
    self:setCollideRect(0,0,self:getSize())
    self:moveTo(x,y)
    self:add()
end

function Bullet:update()
    self.radius += self.speed + (((player.projectileSpeedBonus*self.speed)/100))
    self:moveTo(self.radius*math.cos(math.rad(self.originAngle + self.offset)) + self.originPosition.x, self.radius*math.sin(math.rad(self.originAngle + self.offset)) + self.originPosition.y)
    if self.x > playdate.display.getWidth() or self.y > playdate.display.getHeight() or self.x < 0 or self.y < 0 then
        self:remove()
    end
end