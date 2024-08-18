class("BulletFlamethrower").extends(Bullet)

local bulletImage = gfx.image.new("images/bulletExplosion" )
local p = ParticleCircle(0,0)

function BulletFlamethrower:init(x,y,speed, damage, offsetCrank, scale, duration)
    BulletPlasma.super.init(self,x,y,speed, damage, offsetCrank, scale, duration)
    duration = duration
    self.hp = 100000
    self.tick = 50
    self:setCenter(0.5,0.5)
    local w,h = self:getSize()
    p:setSize(10 + ((player.scaleBonus*10)/100), 10+ ((player.scaleBonus*10)/100))
    self:setImage(bulletImage)
end

function BulletFlamethrower:update()
    local rotation = player.cannonGunSprite:getRotation()
    
    rotation = rotation % 360
    
    local particleX = player.cannonGunSprite.x  +(50 ) * math.cos(math.rad(player.cannonGunSprite:getRotation() - 90))
    local particleY = player.cannonGunSprite.y  +(50 ) * math.sin(math.rad(player.cannonGunSprite:getRotation() - 90))
    p:moveTo(particleX, particleY)
    self:moveTo(p.x, p.y)
    self:setSize(10 + ((player.scaleBonus*10)/100), 50+ ((player.scaleBonus*10)/100))
    p:setColor(gfx.kColorWhite)
    p:setMode(Particles.modes.DECAY)
    p:setSpeed(7, 7)

    local spreadAngle = 90 
    local halfSpread = spreadAngle / 2

    local angleMin = rotation - halfSpread
    local angleMax = rotation + halfSpread

    if angleMin < 0 then
        angleMin = angleMin + 360
    end
    if angleMax > 360 then
        angleMax = angleMax - 360
    end
        angleMax = math.round(angleMax)
        angleMin = math.round(angleMin)

    if angleMin > angleMax then
        p:setSpread(angleMin, 360)
        p:add(5) 
        p:setSpread(0, angleMax)
        p:add(5) 
    else
        p:setSpread(angleMin, angleMax)
        p:add(10) 
    end
    for key, particle in pairs(p:getParticles()) do
        printTable(particle)
    end
    local width, height = self:getSize()
    width = width +((player.scaleBonus*width)/100)
    height = height +((player.scaleBonus*height)/100)
    self:setCollideRect(0 ,0 ,width,height)
end