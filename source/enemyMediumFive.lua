class("EnemyMediumFive").extends(Xwing)


function EnemyMediumFive:init(x,y,speed,hp,xp,damage, enemyImage, core)
    EnemyMediumFive.super.init(self,x,y,speed,hp,xp, damage, enemyImage, core)
end

function EnemyMediumFive:update()
    EnemyMediumFive.super.update(self)
end