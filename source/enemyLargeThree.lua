class("EnemyLargeThree").extends(EnemyMediumFive)


function EnemyLargeThree:init(x,y,speed,hp,xp,damage, enemyImage, core)
    EnemyLargeThree.super.init(self,x,y,speed,hp,xp, damage, enemyImage, core)
    self.boss = true
end

function EnemyLargeThree:update()
    EnemyLargeThree.super.update(self)
end