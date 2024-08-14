class("BulletShockwave").extends(Bullet)

local bulletImage = gfx.image.new("images/bulletShockwave" )

function BulletShockwave:init(x,y,speed, damage, offsetCrank, scale)
    BulletShockwave.super.init(self,x,y,speed, damage, offsetCrank, scale)
    self:setImage(bulletImage)
    self.hp = 1
    self.rot = 0
    self.power = 5
    self:setRotation(self.originAngle + 90)
end
function BulletShockwave:update()
    self.radius += self.speed + (((player.projectileSpeedBonus*self.speed)/100))
    self:moveTo(self.radius*math.cos(math.rad(self.originAngle + self.offset)) + self.originPosition.x, self.radius*math.sin(math.rad(self.originAngle + self.offset)) + self.originPosition.y)
end