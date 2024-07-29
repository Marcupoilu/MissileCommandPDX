class("Enemy").extends(gfx.sprite)

local enemyImage = gfx.image.new("images/enemy")

function Enemy:init(x,y,speed,hp, xp, damage, enemyImage)
    Enemy.super.init(self)
    self.speed = speed
    self.hp = hp
    self.damage = damage
    self.xpReward = xp
    self:setScale(0.8)
    self:setImage(enemyImage)
    self:setCollideRect(0,0,self:getSize())
    self:moveTo(x,y)
    self:add()
end

function Enemy:update()
    if self.x > playdate.display.getWidth() or self.y > playdate.display.getHeight() or self.x < 0 or self.y < 0 then
        self:remove()
    end
    local collisions = self:overlappingSprites()
    for index, value in pairs(collisions) do
        if value:isa(Bullet) then
            local p = ParticleCircle(value.x,value.y)
            p:setSize(4,4)
            p:setMode(Particles.modes.DECAY)
            p:setSpeed(3, 5)
            p:add(10)
            self:loseHp(value.damage)
            value:remove()
        end
        if value:isa(UISprite) or value:getTag() == 1 then
            shake:setShakeAmount(15)
            player:loseHp(self.damage)
            self:death()
        end
    end
end

function Enemy:loseHp(value)
    self.hp -= value
    if(self.hp <= 0) then
        self:death()
    end
end

function Enemy:death()
    shake:setShakeAmount(5)
    local p = ParticleCircle(self.x,self.y)
    p:setSize(7,7)
    p:setMode(Particles.modes.DECAY)
    p:setSpeed(3, 7)
    p:add(20)
    player:gainXP(self.xpReward)
    self:remove()
end