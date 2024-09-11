class("BulletFlamethrower").extends(Bullet)

local bulletImage = gfx.image.new("images/bulletExplosion" )

function BulletFlamethrower:init(x,y,speed, damage, offsetCrank, scale, duration)
    BulletFlamethrower.super.init(self,x,y,speed, damage, offsetCrank, scale, duration)
    self.duration = duration
    self.hp = 100000
    self.tick = 10
    self:setCenter(0.5,1)
    local w,h = self:getSize()
    pFlamethrower:setSize(20 + ((player.scaleBonus*20)/100), 20+ ((player.scaleBonus*20)/100))
    pFlamethrower:setColor(gfx.kColorWhite)
    pFlamethrower:setMode(Particles.modes.DECAY)
    pFlamethrower:setDecay(1)
    pFlamethrower:setSpeed(4, 4)
end

function BulletFlamethrower:update()
    local rotation = player.cannonGunSprite:getRotation()
    
    rotation = rotation % 360
    
    local particleX = player.cannonGunSprite.x  +(50 ) * math.cos(math.rad(player.cannonGunSprite:getRotation() - 90))
    local particleY = player.cannonGunSprite.y  +(50 ) * math.sin(math.rad(player.cannonGunSprite:getRotation() - 90))
    pFlamethrower:moveTo(particleX, particleY)

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
        pFlamethrower:setSpread(angleMin, 360)
        pFlamethrower:add(1) 
        pFlamethrower:setSpread(0, angleMax)
        pFlamethrower:add(1) 
    else
        pFlamethrower:setSpread(angleMin, angleMax)
        pFlamethrower:add(2) 
    end
    for key, particle in pairs(pFlamethrower:getParticles()) do
        local rect = playdate.geometry.rect.new(particle.x, particle.y, 10 + ((player.scaleBonus*10)/100),10 + ((player.scaleBonus*10)/100))
        -- table.insert(debugRects, rect)
        for key, value in pairs(gfx.sprite.getAllSprites()) do
            if value:isa(Enemy) then
                local width, height = value:getSize()
                local enemyRect = playdate.geometry.rect.new(value.x - width/2, value.y - height/2, width, height)
                -- table.insert(debugRects, enemyRect)
                if rect:intersects(enemyRect) then
                    value:touchEnemy(self)
                end
            end
        end
    end
end