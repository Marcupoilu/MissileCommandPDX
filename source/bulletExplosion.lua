class("BulletExplosion").extends(Bullet)

local bulletImage = gfx.image.new("images/bullets/bullet_explosion" )

-- local p = ParticleCircle(0,0)

function BulletExplosion:init(x,y,speed, damage, offsetCrank, scale, duration, explosionDamage)
    print(x,y)
    duration = 0.295
    BulletExplosion.super.init(self, x,y,speed, damage, offsetCrank, scale, duration, bulletImage)
    self.damage = explosionDamage
    self.hp = 1000
    self:moveTo(x,y)
    -- self.tick = 100
end

function BulletExplosion:update()
    self:animate()
end