class("EnemyMediumOne").extends(Xwing)


function EnemyMediumOne:init(x,y,speed,hp,xp,damage, enemyImage, core)
    EnemyMediumOne.super.init(self,x,y,speed,hp,xp, damage, enemyImage, core)
end

function EnemyMediumOne:update()
    EnemyMediumOne.super.update(self)
end