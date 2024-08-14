class("Xwing").extends(Enemy)

local enemyImage = gfx.image.new("images/enemy_small_triangle")

function Xwing:init(x,y,speed,hp,xp,damage)
    Xwing.super.init(self,x,y,speed,hp,xp, damage, enemyImage)
    self.originAngle = self.angle
end

function Xwing:update()
    Xwing.super.update(self)
    self.angle = math.deg(math.atan(player.cannonBaseSprite.y + 20 - self.y,player.cannonBaseSprite.x - self.x) )
    self.radius += self.speed
    self:moveTo(self.radius*math.cos(math.rad(self.angle)) + self.originPosition.x, self.radius*math.sin(math.rad(self.angle)) + self.originPosition.y)
end