class("BulletFlamethrower").extends(Bullet)

local bulletImage = gfx.image.new("images/bullets/bullet_shotgun" )

function BulletFlamethrower:init(x,y,speed, damage, offsetCrank, scale, duration)
    duration = 0.198
    BulletFlamethrower.super.init(self,x,y,speed, damage, offsetCrank, scale, duration, bulletImage)
    self.hp = 100000
    self.tick = 10
    -- self.scale += 1.5
    -- self:setScale(self.scale)
    self:setCenter(0.5, 1)
    self:moveTo(self.originPosition.x,self.originPosition.y + 5)
end

function BulletFlamethrower:update()
    self:animate()
end