class("Enemy").extends(gfx.sprite)

-- local p = ParticleCircle(0,0)

function Enemy:init(x,y,speed,hp, xp, damage, enemyImage, core)
    Enemy.super.init(self)
    self.spawner = nil
    table.insert(enemies, self)
    self.animations = {}
    self.core = core
    self:setGroups({3})
    self:setCollidesWithGroups({1,2})
    if animationsData[self["className"]] ~= nil then
        for key, animationData in pairs(animationsData[self["className"]]) do
            table.insert(self.animations, {Name=animationData.Name, Animation=gfx.animation.loop.new(animationData.Delay, animationData.Source, animationData.Loop)})
        end
    end
    self.dotValues = {}
    self.spritePos = {}
    self.speed = speed
    self.originSpeed = speed
    self.radius = 0
    self.angle = 0
    self.shakeAmount = 0
    self.offset = 90
    self.originAngle = 0
    self.originPosition = {}
    self.hp = hp
    self.damage = damage
    self.xpReward = xp
    self.dead = false
    self.state = "Idle"
    self.currentOverlappingSprites = {} 
    self.timer = nil
    self.frameCount = 0
    -- self.fx = FX(self.x, self.y, "AnimationHit")
    -- self:setScale(1)
    if table.getsize(self.animations) <= 0 then
        self:setImage(enemyImage)
    else
        self.currentAnimation = table.findByParam(self.animations, "Name", self.state).Animation
        self:setImage(self.currentAnimation:image())
    end
    
    self:setCollideRect(0,0,self:getSize())
    self:moveTo(x,y)
    self:add()

end

function Enemy:changeState(state)
    if self.state == state then
        return
    end
    self.state = state
end