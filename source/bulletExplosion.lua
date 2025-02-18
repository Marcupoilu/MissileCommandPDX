class("BulletExplosion").extends(Bullet)

local bulletImage = gfx.image.new("images/bullets/bullet_explosion" )

-- local p = ParticleCircle(0,0)

function BulletExplosion:init(x,y,speed, damage, offsetCrank, scale, duration, explosionDamage)
    duration = 133
    BulletExplosion.super.init(self, x,y,speed, damage, offsetCrank, scale, duration, bulletImage)
    self.damage = explosionDamage
    self.hp = 1000
    self:moveTo(x,y)
    self:setCollideRect(0, 0, self:getSize())
    -- self.tick = 100
end

function BulletExplosion:reset(x, y, speed, damage, angle, scale, duration, explosionDamage)
    self:init(x, y, speed, damage, angle, scale, duration, explosionDamage)
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

function BulletExplosion:update()
    if not self.active then return end

    BulletExplosion.super.update(self)
    self:animate()
end