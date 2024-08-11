class("Projectile").extends(gfx.sprite)


function Projectile:init(x,y,speed, damage, offsetCrank, scale)
    Projectile.super.init(self)
    self.x = x
    self.y = y
    self.hp = 1
    self:setGroups({2})
    self:setCollidesWithGroups({2})
    self.speed = speed
    self.damage = damage
    self.scale = scale
    self.originAngle = crankPosition - 90
    self.originPosition = {x=x,y=y}
    self.radius = 0
    self.offset = offsetCrank
end

function Projectile:update()
end

function  Projectile:loseHp(damage)
    self.hp -= damage
    if self.hp <= 0 then
        self:remove()
    end
end