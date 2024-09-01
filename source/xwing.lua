class("Xwing").extends(Enemy)

local enemyImage = gfx.image.new("images/enemies/small/enemy_small_01")

function Xwing:init(x,y,speed,hp,xp,damage, core)
    Xwing.super.init(self,x,y,speed,hp,xp, damage, enemyImage, core)
    self.originPosition.x = self.x
    self.originPosition.y = self.y
    self.playerX = player.cannonBaseSprite.x
    self.playerY = player.cannonBaseSprite.y
end

function Xwing:update()
    self.angle = math.deg(math.atan(self.playerY - self.y, self.playerX - self.x) )
    Xwing.super.update(self)

    self.originPosition.x = self.x
    self.originPosition.y = self.y
    self.radius = self.speed * deltaTime
    self:moveTo(self.radius*math.cos(math.rad(self.angle)) + self.originPosition.x, self.radius*math.sin(math.rad(self.angle)) + self.originPosition.y)
end