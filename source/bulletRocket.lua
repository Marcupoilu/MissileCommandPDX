class("BulletRocket").extends(Bullet)

local bulletImage = gfx.image.new("images/bulletRocket" )

function BulletRocket:init(x,y,speed, damage, offsetCrank, scale, duration)
    BulletRocket.super.init(self,x,y,speed, damage, offsetCrank, scale, duration)
    self:clearCollideRect()
    self:setImage(bulletImage)
    self.lineS = {}
    self.hp = 1
    self.rot = 0
    self.power = 5
    self:setRotation(self.originAngle + 90)
    playdate.timer.new(50, function() self:setCollideRect(0,0,self:getSize()) end)
end
function BulletRocket:update()
    self.radius += self.speed + (((player.projectileSpeedBonus*self.speed)/100))
    self:moveTo(self.radius*math.cos(math.rad(self.originAngle + self.offset)) + self.originPosition.x, self.radius*math.sin(math.rad(self.originAngle + self.offset)) + self.originPosition.y)
end