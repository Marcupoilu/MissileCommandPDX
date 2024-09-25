class("EnemyMediumFour").extends(EnemySmallFour)


function EnemyMediumFour:init(x,y,speed,hp,xp,damage, enemyImage, core)
    EnemyMediumFour.super.init(self,x,y,speed,hp,xp, damage, enemyImage, core)
end

function EnemyMediumFour:update()
    EnemyMediumFour.super.update(self)
end