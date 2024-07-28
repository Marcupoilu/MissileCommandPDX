class("Player").extends()

-- function Player:new(o)
--     o = o or {}
--     setmetatable(o,self)
--     self.__index = self
--     return o
-- end

function Player:init( basePosition, gunPosition)
    
    local cannonBase = gfx.image.new("images/cannon_base")
    local cannonGun = gfx.image.new("images/cannon_gun")
    assert( cannonBase ) -- make sure <he image was where we thought
    assert( cannonGun ) -- make sure the image was where we thought
    self.cannonBaseSprite = gfx.sprite.new( cannonBase )
    self.cannonGunSprite = gfx.sprite.new( cannonGun )
    self.cannonGunSprite:setCenter(0.5, 0.875)
    self.cannonBaseSprite:moveTo( basePosition.x, basePosition.y ) -- this is where the center of the sprite is placed; (200,120) is the center of the Playdate screen
    self.cannonGunSprite:moveTo( gunPosition.x, gunPosition.y ) -- this is where the center of the sprite is placed; (200,120) is the center of the Playdate screen
    self.cannonBaseSprite:add() -- This is critical!
    self.cannonGunSprite:add() -- This is critical!
    self.simpleCannon = SimpleCannon(1000, gunPosition.x, gunPosition.y)
end

function Player:update()
    self.cannonGunSprite:setRotation(crankPosition)
end
