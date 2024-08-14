class("BulletPlasma").extends(Bullet)

local bulletImage = gfx.image.new("images/bulletPlasma" )

function BulletPlasma:init(x,y,speed, damage, offsetCrank, scale, duration)
    BulletPlasma.super.init(self,x,y,speed, damage, offsetCrank, scale, duration)
    self:setImage(bulletImage)
    self.hp = 3
    self.rot = 0
    self.tick = 300
    self.collisionResponse = gfx.sprite.kCollisionTypeBounce
    self.currentCollision = false
end

function BulletPlasma:update()
    self.rot += self.speed
    self:setRotation(self.rot)
    if self.x <= 0 or self.x >= 400 then
        self.originAngle = 180-self.originAngle
        self.originPosition.x = self.x
        self.originPosition.y = self.y
        self.radius = 0
    end
    if self.y <= 0 or self.y >= 240 then
        self.originAngle =  -self.originAngle
        self.originPosition.x = self.x
        self.originPosition.y = self.y
        self.radius = 0
    end
    self.radius += self.speed + (((player.projectileSpeedBonus*self.speed)/100))
    self:moveTo(self.radius*math.cos(math.rad(self.originAngle + self.offset)) + self.originPosition.x, self.radius*math.sin(math.rad(self.originAngle + self.offset)) + self.originPosition.y)
end