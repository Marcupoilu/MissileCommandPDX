class("BulletToxicVape").extends(Bullet)

local p = ParticleCircle(0,0)

function BulletToxicVape:init(x,y,speed, damage, offsetCrank, scale, duration, tickNumber, spread)
    BulletToxicVape.super.init(self,x,y,speed, damage, offsetCrank, scale, duration)
    self.hp = 100000
    self.tick = 10
    self.tickNumber = tickNumber
    self.spread = spread
    self.spreadDuration = 10
    self:setCenter(0.5,0.5)
    p:setSize(10 + ((player.scaleBonus*10)/100), 10+ ((player.scaleBonus*10)/100))
    p:setSpeed(4 + ((player.projectileSpeedBonus*4)/100) , 4 + ((player.projectileSpeedBonus*4)/100))
    p:setMode(Particles.modes.DECAY)
    p:setColor(gfx.kColorWhite)
    p:setDecay(0.2)
end

function BulletToxicVape:update()
    self.spreadDuration -= 1
    if self.spreadDuration > 0 then
        local rotation = self.originAngle + 90
        rotation = rotation % 360
        self.radius += self.speed * deltaTime
        local particleX = player.cannonGunSprite.x  +(50 ) * math.cos(math.rad(self.originAngle))
        local particleY = player.cannonGunSprite.y  +(50 ) * math.sin(math.rad(self.originAngle))
        p:moveTo(self.radius*math.cos(math.rad(self.originAngle + self.offset)) + self.originPosition.x, self.radius*math.sin(math.rad(self.originAngle + self.offset)) + self.originPosition.y)
        local spreadAngle = self.spread 
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
                    value:dotEnemy(self)
                end
            end
        end
    end
end