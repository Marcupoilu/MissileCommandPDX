class("BulletShockwave").extends(Bullet)

local bulletImage = gfx.image.new("images/bullets/bullet_shockwave" )

function BulletShockwave:init(x,y,speed, damage, offsetCrank, scale, duration, power, hp)
    BulletShockwave.super.init(self,x,y,speed, damage, offsetCrank, scale, duration, bulletImage)
    -- self:setImage(bulletImage)
    self.hp = hp
    self.rot = 0
    self.power = power
    self:setRotation(self.originAngle + 90)
end

function BulletShockwave:reset(x, y, speed, damage, angle, scale, duration, power, hp)
    self:init(x, y, speed, damage, angle, scale, duration, power, hp)
    -- self:moveTo(x, y)
    -- self.speed = speed
    -- self.damage = damage
    -- self.offsetCrank = angle
    -- self.scale = scale + ((player.scaleBonus*scale)/100)
    -- if duration ~= nil then
    --     self.duration = duration + ((player.durationBonus*duration)/100)
    -- end
    -- self.hp = 1
    -- self.radius = 0
    self.resetTick = true
    self.active = true
end

function BulletShockwave:update()
    if not self.active then return end

    BulletShockwave.super.update(self)
    self:animate()
    self.radius += self.speed + (((player.projectileSpeedBonus*self.speed)/100)) * deltaTime
    self:moveTo(self.radius*math.cos(math.rad(self.originAngle + self.offset)) + self.originPosition.x, self.radius*math.sin(math.rad(self.originAngle + self.offset)) + self.originPosition.y)
end