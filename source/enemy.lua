class("Enemy").extends(gfx.sprite)

function Enemy:init(x, y, speed, hp, xp, damage, enemyImage, core)
    Enemy.super.init(self)
    self.spawner = nil
    table.insert(enemies, self)
    self.animations = {}
    self.core = core
    self:setGroups({3})
    self:setCollidesWithGroups({1, 2})
    
    if animationsData[self.className] then
        for _, animationData in pairs(animationsData[self.className]) do
            table.insert(self.animations, {
                Name = animationData.Name,
                Animation = gfx.animation.loop.new(animationData.Delay, animationData.Source, animationData.Loop)
            })
        end
    end
    
    self.speed = speed
    self.originSpeed = speed
    self.hp = hp
    self.damage = damage
    self.xpReward = xp
    self.dead = false
    self.state = "Idle"
    self.currentOverlappingSprites = {}
    self.frameCount = 0
    self.shockwaveTimer = 0
    self.freezeTimer = 0
    self.overrideDirection = false
    self.dotValues = 0
    self.dotTimer = 0
    self.dotDamage = 0
    self.blinkAmount = 0
    self.originPosition = { x = x, y = y }
    
    if enemyImage then
        self.enemyImage = enemyImage
    end
    
    if #self.animations <= 0 then
        self:setImage(enemyImage)
    else
        self.currentAnimation = table.findByParam(self.animations, "Name", self.state).Animation
        self:setImage(self.currentAnimation:image())
    end
    
    self:setCollideRect(0, 0, self:getSize())
    self:moveTo(x, y)
    self.active = false
    self:add()
end

function Enemy:update()
    if not self.active then return end
    
    -- Optimisation de la gestion des balles en itérant sur une copie
    local newOverlappingSprites = {}
    for _, bullet in ipairs(self.currentOverlappingSprites) do
        if bullet.resetTick then
            bullet.resetTick = false
            if bullet.tickTime then
                bullet.tickTime = bullet.tick
            end
        elseif bullet.tickTime then
            bullet.tickTime -= refreshRate
            if bullet.tickTime > 0 then
                table.insert(newOverlappingSprites, bullet)
            end
        else
            table.insert(newOverlappingSprites, bullet)
        end
    end
    self.currentOverlappingSprites = newOverlappingSprites
    
    if self.dotValues > 0 then
        self.dotTimer -= refreshRate
        if self.dotTimer <= 0 then
            self.blinkAmount = 5
            enemyManager:loseHp(self.dotDamage + (player.damageBonus * self.dotDamage / 100), self)
            self.dotValues -= 1
            self.dotTimer = 300
        end
    end
    
    if self.blinkAmount > 0 then
        self.blinkAmount -= 1
    elseif self.drawMode ~= gfx.kDrawModeCopy then
        self:setImageDrawMode(gfx.kDrawModeCopy)
    end
    
    self.shockwaveTimer = math.max(0, self.shockwaveTimer - refreshRate)
    self.freezeTimer = math.max(0, self.freezeTimer - refreshRate)
    
    if self.shockwaveTimer == 0 and self.freezeTimer == 0 then
        self.speed = self.originSpeed
        self.overrideDirection = false
    end
end

function Enemy:changeState(state)
    if self.state ~= state then
        self.state = state
    end
end