class("BulletSerpentine").extends(Bullet)

local bulletImage = gfx.image.new("images/bulletSerpentine" )

function BulletSerpentine:init(x,y,speed, damage, offsetCrank, scale)
    BulletSerpentine.super.init(self,x,y,speed, damage, offsetCrank, scale,bulletImage)
    self:setImage(bulletImage)
    self.hp = 5
    self.rot = 0
    self.amp = 75
    self.freq = 35
end
function BulletSerpentine:update()
    self.radius += self.speed + (((player.projectileSpeedBonus*self.speed)/100))
    local time = playdate.getElapsedTime()
    local sinusoidalOffset = self.amp * math.sin(self.freq*time)
    print(sinusoidalOffset)
    self:moveTo(self.radius*math.cos(math.rad(self.originAngle + self.offset)) + self.originPosition.x, self.radius*math.sin(math.rad(self.originAngle + self.offset)) + self.originPosition.y + sinusoidalOffset)
end