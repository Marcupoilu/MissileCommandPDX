class("EnemySmallSix").extends(Xwing)


function EnemySmallSix:init(x,y,speed,hp,xp,damage, enemyImage, core)
    EnemySmallSix.super.init(self,x,y,speed,hp,xp, damage, enemyImage, core)
end

function EnemySmallSix:update()
    
    EnemySmallSix.super.update(self)
end