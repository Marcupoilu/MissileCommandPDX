class("EnemySmallEight").extends(Xwing)


function EnemySmallEight:init(x,y,speed,hp,xp,damage, enemyImage, core)
    EnemySmallEight.super.init(self,x,y,speed,hp,xp, damage, enemyImage, core)
end

function EnemySmallEight:update()
    EnemySmallEight.super.update(self)
end