class("Saucer").extends(Enemy)

-- local sourceIdle = gfx.imagetable.new("images/enemy_saucer")
-- local animationIdle = gfx.animation.loop.new(50, sourceIdle, true)

function Saucer:init(x,y,speed,hp,xp,damage, enemyImage, core)
    Saucer.super.init(self,x,y,speed,hp,xp, damage, enemyImage, core)
    self.angle = 180 - self.offset
    self.originAngle = self.angle
end

function Saucer:update()
    Saucer.super.update(self)
    self.radius += self.speed * deltaTime
    self:moveTo(self.radius*math.cos(math.rad(self.angle)) + self.originPosition.x, self.radius*math.sin(math.rad(self.angle)) + self.originPosition.y)
end