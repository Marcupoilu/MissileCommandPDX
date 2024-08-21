class("BulletDrone").extends(Bullet)

local bulletImage = gfx.image.new("images/bullet" )

function BulletDrone:init(x,y,speed, damage, offsetCrank, scale, duration, projectileAmount)
    BulletDrone.super.init(self,x,y,speed, damage, offsetCrank, scale, duration, bulletImage)
    print(self.duration)
    self.projectileAmount = projectileAmount
    self.hp = 1
end

function BulletDrone:update()
    self:animate()
    self.radius += self.speed + (((player.projectileSpeedBonus*self.speed)/100)) * deltaTime
    self:moveTo(self.radius*math.cos(math.rad(self.originAngle + self.offset)) + self.originPosition.x, self.radius*math.sin(math.rad(self.originAngle + self.offset)) + self.originPosition.y)
end