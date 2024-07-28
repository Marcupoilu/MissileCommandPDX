class("Enemy").extends(gfx.sprite)

local enemyImage = gfx.image.new("images/enemy")

function Enemy:init(x,y,speed,hp)
    Bullet.super.init(self)
    self.speed = speed
    self.hp = hp
    self.xpReward = 1
    self:setImage(enemyImage)
    self:setCollideRect(0,0,self:getSize())
    self:moveTo(x,y)
    self:add()
end

function Enemy:update()
    self:moveTo(self.x, self.y + self.speed)
    if self.x > playdate.display.getWidth() or self.y > playdate.display.getHeight() or self.x < 0 or self.y < 0 then
        self:remove()
    end
    local collisions = self:overlappingSprites()
    for index, value in pairs(collisions) do
        if value:isa(Bullet) then
            self:loseHp(value.damage)
            value:remove()
        end
        if value:isa(UISprite) then
            shake:setShakeAmount(5)
            self:death()
        end
    end
end

function Enemy:loseHp(value)
    self.hp -= value
    if(self.hp <= 0) then
        player.xp += self.xpReward
        self:death()
    end
end

function Enemy:death()
    self:remove()
end