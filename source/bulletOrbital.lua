class("BulletOrbital").extends(Bullet)

local bulletImage = gfx.image.new("images/bullets/bullet_orbital" )

function BulletOrbital:init(x,y,speed, damage, offsetCrank, scale, duration, originAngle, originPosition)
    BulletOrbital.super.init(self,x,y,speed, damage, offsetCrank, scale, duration, bulletImage)
    self.hp = 1
    self.rot = 0
    -- self:setCenter(0,0)
    -- self:moveTo(self.originPosition.x,self.originPosition.y - 30)
    if originAngle ~= nil then
        self.originAngle = originAngle
    end
    if originPosition ~= nil then
        self.originPosition = originPosition
    end
    self.amp = 2
    self.freq = 300
    self.time = 0
end


function BulletOrbital:update()
    if not self.active then return end

    BulletOrbital.super.update(self)
    local x = math.cos(self.originAngle)
    local y = math.sin(self.originAngle)

    self.originPosition.x = self.x
    self.originPosition.y = self.y
    
    self.radius = self.speed * deltaTime
    
    self.time += deltaTime
    local angleRad = math.rad(self.time * self.freq)  -- Utiliser `self.time` pour un mouvement circulaire constant
    
    local baseX = self.radius * math.cos(math.rad(self.originAngle + self.offset)) + self.originPosition.x
    local baseY = self.radius * math.sin(math.rad(self.originAngle + self.offset)) + self.originPosition.y
    local waveX = -self.amp * math.cos(angleRad)
    local waveY = -self.amp * math.sin(angleRad)
    -- local waveX = 0
    -- local waveY = 0
    self:moveTo(baseX + waveX, baseY + waveY)
    -- if self.x > playdate.display.getWidth() or self.y > playdate.display.getHeight() or self.x < 0 or self.y < 0 then
    --     self:remove()
    -- end
end