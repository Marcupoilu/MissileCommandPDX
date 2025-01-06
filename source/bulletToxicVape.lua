class("BulletToxicVape").extends(Bullet)


function BulletToxicVape:init(x,y,speed, damage, offsetCrank, scale, duration, tickNumber, spread, tickTime, tick)
    BulletToxicVape.super.init(self,x,y,speed, damage, offsetCrank, scale, duration)
    self.hp = 100000
    self.tick = tick
    self.tickNumber = tickNumber
    self.tickTime = tickTime
    -- self:setCenter(0.5,1)
end

function BulletToxicVape:update()
    BulletToxicVape.super.update(self)
    self:animate()
end