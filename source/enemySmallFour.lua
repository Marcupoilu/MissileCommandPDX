class("EnemySmallFour").extends(Enemy)


function EnemySmallFour:init(x,y,speed,hp,xp,damage, enemyImage, core)
    EnemySmallFour.super.init(self,x,y,speed,hp,xp, damage, enemyImage, core)
    self.originPosition.x = self.x
    self.originPosition.y = self.y
    self.playerX = player.cannonBaseSprite.x
    self.playerY = player.cannonBaseSprite.y
    self.overrideDirection = false
    self.amp = 2
    self.freq = 5
    self.time = 0
    local rand = math.random()
    self.randomPoint = {x=math.random(self:getSize(), 400 - self:getSize()),y=self.playerY}
    if rand == 0 then
        self.currentPoint = {x=self.randomPoint.x,y=self.randomPoint.y}
    else
        self.currentPoint = {x=self.playerX,y=self.playerY}
    end
end

function EnemySmallFour:update()
    if self.overrideDirection == false then
        self.angle = math.deg(math.atan(self.currentPoint.y - self.y, self.currentPoint.x - self.x) )
    end
    
    EnemySmallFour.super.update(self)

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