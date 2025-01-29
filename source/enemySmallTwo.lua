class("EnemySmallTwo").extends(Enemy)

function EnemySmallTwo:init(x, y, speed, hp, xp, damage, enemyImage, core)
    EnemySmallTwo.super.init(self, x, y, speed, hp, xp, damage, enemyImage, core)
    
    self.originPosition = { x = x, y = y }
    self.overrideDirection = false
    self.amp, self.freq, self.time = 1, 3, 0

    self:updatePlayerPosition()
    self.randomPoint = { x = math.random(self:getSize(), 400 - self:getSize()), y = self.playerY }
end

function EnemySmallTwo:reset(x, y, speed, hp, xp, damage, enemyImage, core)
    self:init(x, y, speed, hp, xp, damage, enemyImage, core)
    self.active = true
    self:add()
end

function EnemySmallTwo:update()
    if not self.active then return end

    if not self.overrideDirection then
        self:updatePlayerPosition()
        self.angle = math.deg(math.atan(self.playerY - self.y, self.playerX - self.x))
    end

    EnemySmallTwo.super.update(self)

    self.time += deltaTime
    local waveOffset = self.amp * math.sin(self.time * self.freq)
    local angleRad = math.rad(self.angle)
    local moveRadius = self.speed * deltaTime

    local baseX = moveRadius * math.cos(angleRad) + self.x
    local baseY = moveRadius * math.sin(angleRad) + self.y
    local waveX = waveOffset * math.cos(angleRad + math.pi / 2)
    local waveY = waveOffset * math.sin(angleRad + math.pi / 2)

    self:moveTo(baseX + waveX, baseY + waveY)
end

function EnemySmallTwo:updatePlayerPosition()
    self.playerX = player.cannonBaseSprite.x
    self.playerY = player.cannonBaseSprite.y + 20
end
