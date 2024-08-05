class("BulletBeam").extends(Bullet)

function BulletBeam:init(x,y,speed, damage, offsetCrank, scale)
    BulletBeam.super.init(self, x,y,speed, damage, offsetCrank, scale)
    -- self.radius += self.speed + (((player.projectileSpeedBonus*self.speed)/100))
    -- self:setCollideRect(0,0,self:getSize())
    -- self:moveTo(x,y)
    -- self:add()
end

function BulletBeam:update()
    -- if self.x > playdate.display.getWidth() or self.y > playdate.display.getHeight() or self.x < 0 or self.y < 0 then
    --     self:remove()
    -- end
end