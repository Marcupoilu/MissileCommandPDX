class("BulletRocket").extends(Bullet)

local bulletImage = gfx.image.new("images/bullets/bullet_rocket" )

function BulletRocket:init(x,y,speed, damage, offsetCrank, scale, duration, explosionDamage)
    BulletRocket.super.init(self,x,y,speed, damage, offsetCrank, scale, duration, bulletImage)
    self:clearCollideRect()
    self.lineS = {}
    self.hp = 1
    self.explosionDamage = explosionDamage
    self:setRotation(self.originAngle + 90)
    playdate.timer.new(50, function() self:setCollideRect(0,0,self:getSize()) end)
end

function BulletRocket:reset(x, y, speed, damage, angle, scale, duration, explosionDamage)
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

function BulletRocket:update()
    if not self.active then return end

    BulletRocket.super.update(self)
    self:animate()
    self.radius += self.speed + (((player.projectileSpeedBonus*self.speed)/100)) * deltaTime
    self:moveTo(self.radius*math.cos(math.rad(self.originAngle + self.offset)) + self.originPosition.x, self.radius*math.sin(math.rad(self.originAngle + self.offset)) + self.originPosition.y)
end