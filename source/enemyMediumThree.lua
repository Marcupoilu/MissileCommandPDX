class("EnemyMediumThree").extends(EnemySmallThree)


function EnemyMediumThree:init(x,y,speed,hp,xp,damage, enemyImage, core)
    EnemyMediumThree.super.init(self,x,y,speed,hp,xp, damage, enemyImage, core)
    self.amp = 1
    self.freq = 200
end

function EnemyMediumThree:reset(x,y,speed,hp,xp,damage,enemyImage,core)
    self:init(x,y,speed,hp,xp,damage,enemyImage,core)
    self.active = true
    self:add()
end

function EnemyMediumThree:update()
    EnemyMediumThree.super.update(self)
end