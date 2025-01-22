class("Bullet").extends(Projectile)

function Bullet:init(x, y, speed, damage, offsetCrank, scale, duration, bulletImage)
    -- Initialize the Bullet object
    self:moveTo(x, y)
    self:add()
    if self.className == "Bullet" then
        bulletImage = gfx.image.new("images/bullets/bullet_cannon")
    end
    -- Set up animations if available
    self.animations = {}
    local animData = animationsData[self.className]
    if animData then
        for _, animationData in pairs(animData) do
            table.insert(self.animations, {
                Name = animationData.Name,
                Animation = gfx.animation.loop.new(animationData.Delay, animationData.Source, animationData.Loop)
            })
        end
    end

    -- Set initial state and image
    self.state = "Idle"
    self:updateImage(bulletImage)
    
    Bullet.super.init(self, x, y, speed, damage, offsetCrank, scale, duration)
    local modifiedScale = self.scale
    self.scale = math.ceil(self:getSize() * modifiedScale) / self:getSize()
    
    -- Pre-compute scale for better performance
    self:setScale(self.scale)
    self:updateImage(bulletImage)
    self:setCenter(0.5, 0.5)
    self:setCollideRect(0, 0, self:getSize())
end

function Bullet:animate()
    if #self.animations > 0 then
        local currentAnim = table.findByParam(self.animations, "Name", self.state)
        if currentAnim then
            self.currentAnimation = currentAnim.Animation
            if not self:isa(BulletAura) then
                self:setImage(self.currentAnimation:image())
            end
        end
    end
end

function Bullet:update()
    if not self.active then return end
    Bullet.super.update(self)
    
    -- Destroy the bullet if it goes out of screen bounds
    local halfSize = self:getSize() / 2
    if self.x - halfSize > playdate.display:getWidth() or 
       self.y - halfSize > playdate.display:getHeight() or 
       self.x + halfSize < 0 or 
       self.y + halfSize < 0 then
        self:destroy()
        return
    end
    
    -- Update position if Bullet is the base class (not subclassed)
    if self.className == "Bullet" or self.className == "BulletToxicVape" then
        self.radius += self.speed + (((player.projectileSpeedBonus*self.speed)/100)) * deltaTime
        self:moveTo(self.radius*math.cos(math.rad(self.originAngle + self.offset)) + self.originPosition.x, self.radius*math.sin(math.rad(self.originAngle + self.offset)) + self.originPosition.y)
    end
end

function Bullet:updateImage(bulletImage)
    if #self.animations == 0 then
        self:setImage(bulletImage)
    else
        local currentAnim = table.findByParam(self.animations, "Name", self.state)
        if currentAnim then
            self.currentAnimation = currentAnim.Animation
            self:setImage(self.currentAnimation:image())
        end
    end
end

