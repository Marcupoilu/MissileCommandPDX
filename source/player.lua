class("Player").extends()

function Player:init( basePosition, gunPosition)
    local cannonBase = gfx.image.new("images/cannon_base")
    local cannonGun = gfx.image.new("images/cannon_gun")
    assert( cannonBase ) -- make sure <he image was where we thought
    assert( cannonGun ) -- make sure the image was where we thought
    self.x = gunPosition.x
    self.y = gunPosition.y
    self.level = 1
    self.hpMax = 10
    self.hp = self.hpMax
    self.xp = 0
    self.xpMax = 5
    self.xpBonus = 0
    self.damageBonus = 0
    self.attackSpeedBonus = 0
    self.scaleBonus = 0 
    self.projectileAmount = 0
    self.regenerationRate = 0
    self.projectileSpeedBonus = 0
    self.cannonBaseSprite = gfx.sprite.new( cannonBase )
    self.cannonBaseSprite:setTag(1)
    self.cannonBaseSprite:setCollideRect(0,0,self.cannonBaseSprite:getSize())
    self.cannonBaseSprite:setGroups({1})
    self.cannonGunSprite = gfx.sprite.new( cannonGun )
    self.cannonGunSprite:setCenter(0.5, 0.875)
    self.cannonBaseSprite:moveTo( basePosition.x, basePosition.y ) -- this is where the center of the sprite is placed; (200,120) is the center of the Playdate screen
    self.cannonGunSprite:moveTo( gunPosition.x, gunPosition.y ) -- this is where the center of the sprite is placed; (200,120) is the center of the Playdate screen
    self.cannonBaseSprite:add() -- This is critical!
    self.cannonGunSprite:add() -- This is critical!
    self.weapons = {}
    self.timer = playdate.timer.new(30000 - (((self.regenerationRate*30000)/100)), self.regeneration, self)
    self.timer.repeats = true
end

function Player:update()
    local na = normalizeAngle(crankPosition)
    if math.between(na, 0, 180) then
        self.cannonGunSprite:setRotation(crankPosition)
    end
end

function Player:addWeapon(weapon)
    table.insert(self.weapons, weapon)
    weapon:startShooting()
end

function Player:regeneration()
    if(self.regenerationRate == 0) then return end
    if(self.hp < self.hpMax) then
        self.hp += 1
        uiManager:updateHPDisplay()
        print("regen")
    end
end

function Player:gainXP(xp)
    self.xp += xp
    if(self.xp >= self.xpMax) then
        self:levelUp()
    end
end

function Player:levelUp()
    self.level += 1
    if math.between(self.level, 1,2) then
        self.xpMax += 5
    end
    if math.between(self.level, 3,20) then
        self.xpMax += 10
    end
    if math.between(self.level, 21,40) then
        self.xpMax += 13
    end
    if self.level >= 41 then
        self.xpMax += 16
    end
    self.xp = 0
    playdate.update = levelUpUpdate
end

function Player:loseHp(value)
    self.hp -= value
    uiManager:updateHPDisplay()
    if(self.hp <= 0) then
        self:death()
    end
end

function Player:death()
    playdate.restart()
end