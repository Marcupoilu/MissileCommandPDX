class("EnemyLargeTwo").extends(Xwing)


function EnemyLargeTwo:init(x,y,speed,hp,xp,damage, enemyImage, core)
    EnemyLargeTwo.super.init(self,x,y,speed,hp,xp, damage, enemyImage, core)
    self.boss = true
end

function EnemyLargeTwo:update()
    EnemyLargeTwo.super.update(self)
end