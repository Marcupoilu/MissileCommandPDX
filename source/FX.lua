class("FX").extends(gfx.sprite)

function FX:init(x,y,animationData)
    FX.super.init(self,x,y)
    self:moveTo(x,y)
    self:add()
    self.animations = {}
    if animationsData[animationData] ~= nil then
        for key, animationData in pairs(animationsData[animationData]) do
            table.insert(self.animations, {Name=animationData.Name, Animation=gfx.animation.loop.new(animationData.Delay, animationData.Source, animationData.Loop)})
        end
    end
    self.state = "Idle"
    
    self:updateImage(bulletImage)
    self:setCenter(0.5, 0.5)
    self:setRotation(math.random(1,360))
end

function FX:animate()
    if table.getsize(self.animations) > 0 then
        self.currentAnimation = table.findByParam(self.animations, "Name", self.state).Animation
        self:setImage(self.currentAnimation:image())
        if self.currentAnimation.currentFrame >= self.currentAnimation.endFrame then
            self:remove()
        end
    end
end

function FX:update()
    FX.super.update(self)
    -- self:animate()
    -- playdate.timer.new(300, function ()
    --     self:remove()
    -- end)
end

function FX:updateImage(bulletImage)
    if table.getsize(self.animations) <= 0 then
        self:setImage(bulletImage)
    else
        self.currentAnimation = table.findByParam(self.animations, "Name", self.state).Animation
        self:setImage(self.currentAnimation:image())
    end
end