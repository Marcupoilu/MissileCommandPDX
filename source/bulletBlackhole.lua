class("BulletBlackhole").extends(Bullet)

local bulletImage = gfx.image.new("images/bulletPlasma" )

function BulletBlackhole:init(x,y,speed, damage, offsetCrank, scale, duration)
    BulletBlackhole.super.init(self,x,y,speed, damage, offsetCrank, scale, duration, bulletImage)
    self.hp = 1000
    self.rot = 0
    self.tick = 300
    self.currentCollision = false
    self.particleSystem = {}
    self.radius = 70
    self:setCenter(0.5,0.5)
    -- local width,height = self:getSize()
    -- local scale = 1.5
    -- local newWidth = width * scale
    -- local newHeight = height * scale
    -- local offsetX = (newWidth - width) * 0.5
    -- local offsetY = (newHeight - height) * 0.5
    self:setCollideRect(0, 0, self:getSize())

end

function BulletBlackhole:update()
    self:animate()
    self:moveTo(self.radius*math.cos(math.rad(self.originAngle + self.offset)) + self.originPosition.x, self.radius*math.sin(math.rad(self.originAngle + self.offset)) + self.originPosition.y)
end