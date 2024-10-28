class("BulletExplosion").extends(Bullet)

local bulletImage = gfx.image.new("images/bullets/bullet_explosion" )

-- local p = ParticleCircle(0,0)

function BulletExplosion:init(x,y,speed, damage, offsetCrank, scale, duration, explosionDamage)
    duration = 1000
    BulletExplosion.super.init(self, x,y,speed, damage, offsetCrank, scale, duration, bulletImage)
    self.damage = explosionDamage
    self.hp = 1000
    self:moveTo(x,y)
    -- self.tick = 100
end

function BulletExplosion:update()
    BulletExplosion.super.update(self)
    self:animate()
end