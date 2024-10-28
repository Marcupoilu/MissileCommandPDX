class("BulletShockwave").extends(Bullet)

local bulletImage = gfx.image.new("images/bullets/bullet_shockwave" )

function BulletShockwave:init(x,y,speed, damage, offsetCrank, scale, duration, power, hp)
    BulletShockwave.super.init(self,x,y,speed, damage, offsetCrank, scale, duration, bulletImage)
    -- self:setImage(bulletImage)
    self.hp = hp
    self.rot = 0
    self.power = power
    self:setRotation(self.originAngle + 90)
end
function BulletShockwave:update()
    BulletShockwave.super.update(self)
    self:animate()
    self.radius += self.speed + (((player.projectileSpeedBonus*self.speed)/100)) * deltaTime
    self:moveTo(self.radius*math.cos(math.rad(self.originAngle + self.offset)) + self.originPosition.x, self.radius*math.sin(math.rad(self.originAngle + self.offset)) + self.originPosition.y)
end