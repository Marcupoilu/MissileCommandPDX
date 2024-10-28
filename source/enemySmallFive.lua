class("EnemySmallFive").extends(Enemy)


function EnemySmallFive:init(x,y,speed,hp,xp,damage, enemyImage, core)
    EnemySmallFive.super.init(self,x,y,speed,hp,xp, damage, enemyImage, core)
    self.originPosition.x = self.x
    self.originPosition.y = self.y
    self.playerX = player.cannonBaseSprite.x
    self.playerY = player.cannonBaseSprite.y +20
    self.overrideDirection = false
    self.amp = 2
    self.freq = 5
    self.time = 0
    local rand = math.random(0,1)
    self.randomPoint = {x=math.random(self:getSize(), 400 - self:getSize()),y=self.playerY}
    if rand == 0 then
        self.currentPoint = {x=self.randomPoint.x,y=self.randomPoint.y}
    else
        self.currentPoint = {x=self.playerX,y=self.playerY}
    end
end

function EnemySmallFive:update()
    if self.overrideDirection == false then
        self.angle = math.deg(math.atan(self.currentPoint.y - self.y, self.currentPoint.x - self.x) )
    end
    
    EnemySmallFive.super.update(self)
    self.originPosition.x = self.x
    self.originPosition.y = self.y
    self.radius = self.speed * deltaTime
    self:moveTo(self.radius*math.cos(math.rad(self.angle)) + self.originPosition.x, self.radius*math.sin(math.rad(self.angle)) + self.originPosition.y)
end