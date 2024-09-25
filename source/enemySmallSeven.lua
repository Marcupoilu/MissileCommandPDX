class("EnemySmallSeven").extends(EnemySmallFive)


function EnemySmallSeven:init(x,y,speed,hp,xp,damage, enemyImage, core)
    EnemySmallSeven.super.init(self,x,y,speed,hp,xp, damage, enemyImage, core)
end

function EnemySmallSeven:update()
    
    EnemySmallSeven.super.update(self)
end