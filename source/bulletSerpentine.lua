class("BulletSerpentine").extends(Bullet)

local bulletImage = gfx.image.new("images/bulletSerpentine" )

function BulletSerpentine:init(x,y,speed, damage, offsetCrank, scale)
    BulletSerpentine.super.init(self,x,y,speed, damage, offsetCrank, scale,bulletImage)
    self:setImage(bulletImage)
    self.hp = 5
    self.rot = 0
    self.amp = 10
    self.freq = 0.16
    self:setRotation(self.originAngle + 90)
end
function BulletSerpentine:update()
    self.radius += self.speed + (((player.projectileSpeedBonus*self.speed)/100))
    local time = playdate.getCurrentTimeMilliseconds()
    local waveOffset = self.amp * math.sin(time * self.freq)

    local angleRad = math.rad(self.originAngle)
    local baseX = self.radius * math.cos(angleRad) + self.originPosition.x
    local baseY = self.radius * math.sin(angleRad) + self.originPosition.y

    local waveX = waveOffset * math.cos(angleRad + math.pi / 2)
    local waveY = waveOffset * math.sin(angleRad + math.pi / 2)
    self:moveTo(baseX + waveX, baseY + waveY)
end