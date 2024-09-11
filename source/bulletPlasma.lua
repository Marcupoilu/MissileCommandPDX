class("BulletPlasma").extends(Bullet)

local bulletImage = gfx.image.new("images/bullets/bullet_Plasma" )

function BulletPlasma:init(x,y,speed, damage, offsetCrank, scale, duration)
    BulletPlasma.super.init(self,x,y,speed, damage, offsetCrank, scale, duration, bulletImage)
    self.hp = 1000
    self.rot = 0
    self.tick = 300
    self.currentCollision = false
    self.particleSystem = {}
end

function BulletPlasma:update()
    self:animate()
    -- self.rot += self.speed
    -- self:setRotation(self.rot)
    if self.x <= 0 or self.x >= 400 then
        self.originAngle = 180-self.originAngle
        self:resetPosAndRot()
    end
    if self.y <= 0 or self.y >= 240 then
        self.originAngle =  -self.originAngle
        self:resetPosAndRot()
    end
    self.radius += self.speed + (((player.projectileSpeedBonus*self.speed)/100)) * deltaTime
    self:moveTo(self.radius*math.cos(math.rad(self.originAngle + self.offset)) + self.originPosition.x, self.radius*math.sin(math.rad(self.originAngle + self.offset)) + self.originPosition.y)
end