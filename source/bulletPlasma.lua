class("BulletPlasma").extends(Bullet)

local bulletImage = gfx.image.new("images/bulletPlasma" )

function BulletPlasma:init(x,y,speed, damage, offsetCrank, scale)
    BulletPlasma.super.init(self,x,y,speed, damage, offsetCrank, scale,bulletImage)
    self:setImage(bulletImage)
    self.hp = 3
    self.rot = 0
    self.collisionResponse = gfx.sprite.kCollisionTypeBounce
end

function BulletPlasma:update()
    self.radius += self.speed + (((player.projectileSpeedBonus*self.speed)/100))
    self.rot += self.speed
    self:setRotation(self.rot)
    self:moveTo(self.radius*math.cos(math.rad(self.originAngle + self.offset)) + self.originPosition.x, self.radius*math.sin(math.rad(self.originAngle + self.offset)) + self.originPosition.y)
end