class("EnemySmallTwo").extends(Enemy)


function EnemySmallTwo:init(x,y,speed,hp,xp,damage, enemyImage, core)
    EnemySmallTwo.super.init(self,x,y,speed,hp,xp, damage, enemyImage, core)
    self.originPosition.x = self.x
    self.originPosition.y = self.y
    self.playerX = player.cannonBaseSprite.x
    self.playerY = player.cannonBaseSprite.y + 20
    self.overrideDirection = false
    self.amp = 2
    self.freq = 5
    self.time = 0
    self.randomPoint = {x=math.random(self:getSize(), 400 - self:getSize()),y=self.playerY}
end

function EnemySmallTwo:update()
    if self.overrideDirection == false then
        self.angle = math.deg(math.atan(self.randomPoint.y - self.y, self.randomPoint.x - self.x) )
    end
    
    -- EnemySmallTwo.super.update(self)

    self.originPosition.x = self.x
    self.originPosition.y = self.y
    self.radius = self.speed * deltaTime
    self.time += deltaTime
    local waveOffset = self.amp * math.sin(self.time * self.freq)

    local angleRad = math.rad(self.angle)
    local baseX = self.radius * math.cos(angleRad) + self.originPosition.x
    local baseY = self.radius * math.sin(angleRad) + self.originPosition.y

    local waveX = waveOffset * math.cos(angleRad + math.pi / 2)
    local waveY = waveOffset * math.sin(angleRad + math.pi / 2)
    self:moveTo(baseX + waveX, baseY + waveY)
end