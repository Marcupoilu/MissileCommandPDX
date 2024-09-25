class("EnemyMediumThree").extends(EnemySmallThree)


function EnemyMediumThree:init(x,y,speed,hp,xp,damage, enemyImage, core)
    EnemyMediumThree.super.init(self,x,y,speed,hp,xp, damage, enemyImage, core)
end

function EnemyMediumThree:update()
    EnemyMediumThree.super.update(self)
end