class("Xwing").extends(Enemy)

local enemyImage = gfx.image.new("images/enemy_small_triangle")

function Xwing:init(x,y,speed,hp,xp,damage)
    Xwing.super.init(self,x,y,speed,hp,xp, damage, enemyImage)
end

function Xwing:update()
    self:moveTo(self.x, self.y + self.speed)
    Xwing.super.update(self)
end