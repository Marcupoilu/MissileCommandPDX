class("BulletFlamethrower").extends(Bullet)

local bulletImage = gfx.image.new("images/bulletExplosion" )
local p = ParticleCircle(0,0)

function BulletFlamethrower:init(x,y,speed, damage, offsetCrank, scale, duration)
    BulletPlasma.super.init(self,x,y,speed, damage, offsetCrank, scale, duration)
    self.duration = duration
    self.hp = 100000
    self.tick = 10
    self:setCenter(0.5,0.5)
    local w,h = self:getSize()
    p:setSize(10 + ((player.scaleBonus*10)/100), 10+ ((player.scaleBonus*10)/100))
    p:setColor(gfx.kColorWhite)
    p:setMode(Particles.modes.DECAY)
    p:setDecay(1)
    p:setSpeed(4 + ((player.projectileSpeedBonus*4)/100), 4 + ((player.projectileSpeedBonus*4)/100))
    self:setImage(bulletImage)
end

function BulletFlamethrower:update()
    local rotation = player.cannonGunSprite:getRotation()
    
    rotation = rotation % 360
    
    local particleX = player.cannonGunSprite.x  +(50 ) * math.cos(math.rad(player.cannonGunSprite:getRotation() - 90))
    local particleY = player.cannonGunSprite.y  +(50 ) * math.sin(math.rad(player.cannonGunSprite:getRotation() - 90))
    p:moveTo(particleX, particleY)

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
        p:add(10) 
        p:setSpread(0, angleMax)
        p:add(10) 
    else
        p:setSpread(angleMin, angleMax)
        p:add(20) 
    end
    for key, particle in pairs(p:getParticles()) do
        local rect = playdate.geometry.rect.new(particle.x, particle.y, 10 + ((player.scaleBonus*10)/100),10 + ((player.scaleBonus*10)/100))
        table.insert(debugRects, rect)
        for key, value in pairs(gfx.sprite.getAllSprites()) do
            if value:isa(Enemy) then
                local width, height = value:getSize()
                local enemyRect = playdate.geometry.rect.new(value.x - width/2, value.y - height/2, width, height)
                table.insert(debugRects, enemyRect)
                if rect:intersects(enemyRect) then
                    value:touchEnemy(self)
                end
            end
        end
    end
end