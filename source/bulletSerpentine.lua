class("BulletSerpentine").extends(Bullet)

local bulletImage = gfx.image.new("images/bullets/bullet_serpentine" )

function BulletSerpentine:init(x,y,speed, damage, offsetCrank, scale, duration, hp)
    BulletSerpentine.super.init(self,x,y,speed, damage, offsetCrank, scale, duration, bulletImage)
    -- self:setImage(bulletImage)
    self.hp = hp
    self.rot = 0
    self.amp = 10
    self.freq = 20
    self.time = 0
end

function BulletSerpentine:update()
    if not self.active then return end

    BulletSerpentine.super.update(self)
    -- self:animate()
    self.radius += self.speed + (((player.projectileSpeedBonus*self.speed)/100)) * deltaTime
    self.time += deltaTime
    local waveOffset = self.amp * math.sin(self.time * self.freq)

    local angleRad = math.rad(self.originAngle + self.offset)
    local baseX = self.radius * math.cos(angleRad) + self.originPosition.x
    local baseY = self.radius * math.sin(angleRad) + self.originPosition.y

    local waveX = waveOffset * math.cos(angleRad + math.pi / 2)
    local waveY = waveOffset * math.sin(angleRad + math.pi / 2)
    self:moveTo(baseX + waveX, baseY + waveY)
end