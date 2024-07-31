class("Player").extends()

function Player:init( basePosition, gunPosition)
    local cannonBase = gfx.image.new("images/cannon_base")
    local cannonGun = gfx.image.new("images/cannon_gun")
    assert( cannonBase ) -- make sure <he image was where we thought
    assert( cannonGun ) -- make sure the image was where we thought
    self.hpMax = 10
    self.hp = self.hpMax
    self.xp = 0
    self.xpMax = 10
    self.damageBonus = 0
    self.attackSpeedBonus = 0
    self.cannonBaseSprite = gfx.sprite.new( cannonBase )
    self.cannonBaseSprite:setTag(1)
    self.cannonBaseSprite:setCollideRect(0,0,self.cannonBaseSprite:getSize())
    self.cannonGunSprite = gfx.sprite.new( cannonGun )
    self.cannonGunSprite:setCenter(0.5, 0.875)
    self.cannonBaseSprite:moveTo( basePosition.x, basePosition.y ) -- this is where the center of the sprite is placed; (200,120) is the center of the Playdate screen
    self.cannonGunSprite:moveTo( gunPosition.x, gunPosition.y ) -- this is where the center of the sprite is placed; (200,120) is the center of the Playdate screen
    self.cannonBaseSprite:add() -- This is critical!
    self.cannonGunSprite:add() -- This is critical!
    self.weapons = {}
end

function Player:update()
    self.cannonGunSprite:setRotation(crankPosition)
end

function Player:gainXP(xp)
    self.xp += xp
    if(self.xp >= self.xpMax) then
        self:levelUp()
    end
end

function Player:levelUp()
    self.xpMax *= 2
    self.xp = 0
    playdate.update = levelUpUpdate
    -- uiManager:levelUpDisplay()
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