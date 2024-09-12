class("Bullet").extends(Projectile)

-- local bulletImage = gfx.image.new("images/bullet" )

function Bullet:init(x,y,speed, damage, offsetCrank, scale, duration, bulletImage)
    self:moveTo(x,y)
    self:add()
    self.animations = {}
    if animationsData[self["className"]] ~= nil then
        for key, animationData in pairs(animationsData[self["className"]]) do
            table.insert(self.animations, {Name=animationData.Name, Animation=gfx.animation.loop.new(animationData.Delay, animationData.Source, animationData.Loop)})
        end
    end
    self.state = "Idle"

    self:updateImage(bulletImage)
    
    Bullet.super.init(self,x,y,speed, damage, offsetCrank, scale, duration)
    
    local baseSize = self:getSize()
    self.scale = math.ceil(baseSize  * self.scale) / baseSize
    self:setScale(self.scale)

    self:updateImage(bulletImage)
    self:setCenter(0.5, 0.5)
    self:setCollideRect(0,0,self:getSize())
end

function Bullet:animate()
    if table.getsize(self.animations) > 0 then
        self.currentAnimation = table.findByParam(self.animations, "Name", self.state).Animation
        self:setImage(self.currentAnimation:image())
    end
end

function Bullet:update()
    Bullet.super.update(self)
    self.radius += self.speed + (((player.projectileSpeedBonus*self.speed)/100)) * deltaTime
    self:moveTo(self.radius*math.cos(math.rad(self.originAngle + self.offset)) + self.originPosition.x, self.radius*math.sin(math.rad(self.originAngle + self.offset)) + self.originPosition.y)
    if self.x > playdate.display.getWidth() or self.y > playdate.display.getHeight() or self.x < 0 or self.y < 0 then
        self:remove()
    end
end

function Bullet:updateImage(bulletImage)
    if table.getsize(self.animations) <= 0 then
        self:setImage(bulletImage)
    else
        self.currentAnimation = table.findByParam(self.animations, "Name", self.state).Animation
        self:setImage(self.currentAnimation:image())
    end
end