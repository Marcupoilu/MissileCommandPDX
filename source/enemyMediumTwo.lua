class("EnemyMediumTwo").extends(EnemySmallFive)


function EnemyMediumTwo:init(x,y,speed,hp,xp,damage, enemyImage, core)
    EnemyMediumTwo.super.init(self,x,y,speed,hp,xp, damage, enemyImage, core)
end

function EnemyMediumTwo:update()
    EnemyMediumTwo.super.update(self)
end