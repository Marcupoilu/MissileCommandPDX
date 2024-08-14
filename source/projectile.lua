class("Projectile").extends(gfx.sprite)


function Projectile:init(x,y,speed, damage, offsetCrank, scale, duration)
    Projectile.super.init(self)
    self.x = x
    self.y = y
    self.hp = 1
    self:setGroups({2})
    self:setCollidesWithGroups({3})
    self.speed = speed
    self.damage = damage
    -- self.scale = scale
    self.duration = duration
    self.originAngle = player.cannonGunSprite:getRotation() - 90
    self.originPosition = {x=x,y=y}
    self.radius = 0
    self.offset = offsetCrank
    -- self:moveTo()
    if self.duration ~= nil then
        playdate.timer.new(toMilliseconds(self.duration), function() self:remove() end) 
    end    
end

function Projectile:update()
end

function  Projectile:loseHp(damage)
    self.hp -= damage
    if self.hp <= 0 then
        self:remove()
    end
end

function Projectile:resetPosAndRot()
    self.originPosition.x = self.x
    self.originPosition.y = self.y
    self.radius = 0
end