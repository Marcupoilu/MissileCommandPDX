class("Saucer").extends(Enemy)

local enemyImage = gfx.image.new("images/enemy")

function Saucer:init(x,y,speed,hp,xp,damage)
    Saucer.super.init(self,x,y,speed,hp,xp, damage, enemyImage)
end

function Saucer:update()
    self:moveTo(self.x, self.y + self.speed)
    Saucer.super.update(self)
end