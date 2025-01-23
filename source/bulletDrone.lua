class("BulletDrone").extends(Bullet)

local bulletImage = gfx.image.new("images/bullets/bullet_drone" )

function BulletDrone:init(x,y,speed, damage, offsetCrank, scale, duration, projectileAmount)
    BulletDrone.super.init(self,x,y,speed, damage, offsetCrank, scale, duration, bulletImage)
    self.projectileAmount = projectileAmount
    self.hp = 1
end

function BulletDrone:reset(x, y, speed, damage, angle, scale, duration, projectileAmount)
    self:init(x, y, speed, damage, angle, scale, duration, projectileAmount)
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

function BulletDrone:update()
    if not self.active then return end
    BulletDrone.super.update(self)
    self:animate()
    self.radius += self.speed * deltaTime
    self:moveTo(self.radius*math.cos(math.rad(self.originAngle + self.offset)) + self.originPosition.x, self.radius*math.sin(math.rad(self.originAngle + self.offset)) + self.originPosition.y)
end