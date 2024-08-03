class("Saucer").extends(Enemy)

local enemyImage = gfx.image.new("images/enemy")
local sourceIdle = gfx.imagetable.new("images/enemy_saucer")
printTable(playdate.graphics.animation)
local animationIdle = gfx.animation.loop.new(50, sourceIdle, true)

function Saucer:init(x,y,speed,hp,xp,damage)
    Saucer.super.init(self,x,y,speed,hp,xp, damage, enemyImage)
    self.animatedSprite = gfx.sprite.new(animationIdle:image())
    self.animatedSprite:add()
end

function Saucer:update()
    self:moveTo(self.x, self.y + self.speed)
    Saucer.super.update(self)
    self.animatedSprite:moveTo(self.x,self.y)
    self.animatedSprite:setImage(animationIdle:image())
end