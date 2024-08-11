class("UISprite").extends(gfx.sprite)

function UISprite:init( image, zIndex, centerX, centerY, posX, posY, collider  )
    local uiImage = gfx.image.new(image)
    assert(uiImage)
    self:setImage(uiImage)
    self:setZIndex(zIndex)
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
    self:setCenter(centerX, centerY)
    self:moveTo(posX, posY)
    self:add()
    if collider == true then
        self:setCollideRect(0,0,self:getSize())
        self:setGroups({1})
    end
end