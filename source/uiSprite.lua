class("UISprite").extends(gfx.sprite)

function UISprite:new(o)
    o = o or {}
    setmetatable(o,self)
    self.__index = self
    return o
end

function UISprite:init( image, zIndex, centerX, centerY, posX, posY  )
    local uiImage = gfx.image.new(image)
    assert(uiImage)
    self.uiSprite = gfx.sprite.new(uiImage)
    self.uiSprite:setZIndex(zIndex)
    if not centerX then
        centerX = 0
    end
    if not centerY then
        centerY = 0
    end
    if not posX then
        posX = 200
    end
    if not posY then
        posY = 120
    end
    self.uiSprite:setCenter(centerX, centerY)
    self.uiSprite:moveTo(posX, posY)
    self.uiSprite:add()
end