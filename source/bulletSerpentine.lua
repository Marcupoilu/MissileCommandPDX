class("BulletSerpentine").extends(Bullet)

local bulletImage = gfx.image.new("images/bullet" )

function BulletSerpentine:init(x,y,speed, damage, offsetCrank, scale)
    BulletSerpentine.super.init(self,x,y,speed, damage, offsetCrank, scale,bulletImage)
    self:setImage(bulletImage)
    self.hp = 5
    self.rot = 0
    self.amp = 10
    self.freq = 0.16
end
function BulletSerpentine:update()
    self.radius += self.speed + (((player.projectileSpeedBonus*self.speed)/100))
    local time = playdate.getCurrentTimeMilliseconds()
    local sinusoidalOffset = self.amp * math.sin(math.rad(self.originAngle)*self.freq*time)
    print(sinusoidalOffset)
    local cosOffset = self.amp * math.cos(math.rad(self.originAngle)*self.freq*time)

    self:moveTo(self.radius*math.cos(math.rad(self.originAngle + self.offset)) + self.originPosition.x + cosOffset, self.radius*math.sin(math.rad(self.originAngle + self.offset)) + self.originPosition.y + sinusoidalOffset)
end