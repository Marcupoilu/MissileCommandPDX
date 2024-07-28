class("Bullet").extends(gfx.sprite)

local bulletImage = gfx.image.new("images/bullet",15,15 )

function Bullet:init(x,y,speed, damage)
    Bullet.super.init(self)
    self.speed = speed
    self.damage = damage
    self:setImage(bulletImage)
    self:setScale(0.5)
    self.originAngle = crankPosition - 90
    self.originPosition = {x=x,y=y}
    self.radius = 0
    self:setCollideRect(0,0,self:getSize())
    self:moveTo(x,y)
    self:add()
end

function Bullet:update()
    self.radius += self.speed
    self:moveTo(self.radius*math.cos(math.rad(self.originAngle)) + self.originPosition.x, self.radius*math.sin(math.rad(self.originAngle)) + self.originPosition.y)
    if self.x > playdate.display.getWidth() or self.y > playdate.display.getHeight() or self.x < 0 or self.y < 0 then
        self:remove()
    end
end