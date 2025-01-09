class("BulletFlamethrower").extends(Bullet)

local bulletImage = gfx.image.new("images/bullets/bullet_shotgun" )

function BulletFlamethrower:init(x,y,speed, damage, offsetCrank, scale, duration)
    duration = 240
    BulletFlamethrower.super.init(self,x,y,speed, damage, offsetCrank, scale, duration, bulletImage)
    self.hp = 100000
    -- self.tick = 10
    -- self.scale += 1.5
    -- self:setScale(self.scale)
    self:setCenter(0.5, 1)
    -- print(math.cos(math.rad(self.originAngle) + self.originPosition.x))
    -- print(math.cos(math.rad(self.originAngle + self.offset) + self.originPosition.x))

    self:moveTo(math.cos(math.rad(self.originAngle + self.offset)) * 5 + self.originPosition.x, math.sin(math.rad(self.originAngle + self.offset)) * 5 + self.originPosition.y)
    -- self:setRotation((self.originAngle + 90) + self.offset)
end

function BulletFlamethrower:update()
    BulletFlamethrower.super.update(self)
    self:animate()
end