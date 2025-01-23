class("BulletToxicVape").extends(Bullet)


function BulletToxicVape:init(x,y,speed, damage, offsetCrank, scale, duration, tickNumber, spread, tickTime, tick)
    BulletToxicVape.super.init(self,x,y,speed, damage, offsetCrank, scale, duration)
    self.hp = 100000
    self.tick = tick
    self.tickNumber = tickNumber
    self.tickTime = tickTime
    -- self:setCenter(0.5,1)
end

function BulletToxicVape:reset(x, y, speed, damage, angle, scale, duration, tickNumber, spread, tickTime, tick)
    self:init(x, y, speed, damage, angle, scale, duration, tickNumber, spread, tickTime, tick)
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

function BulletToxicVape:update()
    if not self.active then return end

    BulletToxicVape.super.update(self)
    self:animate()
end