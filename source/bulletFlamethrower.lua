class("BulletFlamethrower").extends(Bullet)

local bulletImage = gfx.image.new("images/bulletExplosion" )

function BulletFlamethrower:init(x,y,speed, damage, offsetCrank, scale, duration)
    BulletPlasma.super.init(self,x,y,speed, damage, offsetCrank, scale, duration)
    self.duration = duration
    self.hp = 100000
    self.tick = 10
    self:setCenter(0.5,0.5)
    local w,h = self:getSize()
    self.p = ParticleCircle(0,0)
    self.p:setSize(20 + ((player.scaleBonus*20)/100), 20+ ((player.scaleBonus*20)/100))
    self.p:setColor(gfx.kColorWhite)
    self.p:setMode(Particles.modes.DECAY)
    self.p:setDecay(1)
    self.p:setSpeed(4 + ((player.projectileSpeedBonus*4)/100), 4 + ((player.projectileSpeedBonus*4)/100))
    printTable(self.p)
    playdate.timer.new(toMilliseconds(self.duration), function ()
        self.p:remove()
    end)
end

function BulletFlamethrower:update()
    local rotation = player.cannonGunSprite:getRotation()
    
    rotation = rotation % 360
    
    local particleX = player.cannonGunSprite.x  +(50 ) * math.cos(math.rad(player.cannonGunSprite:getRotation() - 90))
    local particleY = player.cannonGunSprite.y  +(50 ) * math.sin(math.rad(player.cannonGunSprite:getRotation() - 90))
    self.p:moveTo(particleX, particleY)

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
        self.p:setSpread(angleMin, 360)
        self.p:add(1) 
        self.p:setSpread(0, angleMax)
        self.p:add(1) 
    else
        self.p:setSpread(angleMin, angleMax)
        self.p:add(2) 
    end
    for key, particle in pairs(self.p:getParticles()) do
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