class("EnemyLargeFour").extends(Xwing)


function EnemyLargeFour:init(x,y,speed,hp,xp,damage, enemyImage, core)
    EnemyLargeFour.super.init(self,x,y,speed,hp,xp, damage, enemyImage, core)
end

function EnemyLargeFour:update()
    EnemyLargeFour.super.update(self)
end