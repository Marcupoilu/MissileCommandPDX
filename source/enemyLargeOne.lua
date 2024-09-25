class("EnemyLargeOne").extends(EnemySmallFive)


function EnemyLargeOne:init(x,y,speed,hp,xp,damage, enemyImage, core)
    EnemyLargeOne.super.init(self,x,y,speed,hp,xp, damage, enemyImage, core)
end

function EnemyLargeOne:update()
    EnemyLargeOne.super.update(self)
end