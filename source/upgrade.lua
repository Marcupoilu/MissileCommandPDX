class("Upgrade").extends(gfx.sprite)


function Upgrade:init(x,y,width, height,radius)
    gfx.clear()
    Upgrade.super.init(self)
    self.x = x
    self.y = y 
    self.width = width
    self.height = height
    self.radius = radius
    local upgradeImage = gfx.image.new(size,size)
    gfx.pushContext()
    gfx.drawRoundRect(self.x, self.y,self.width, self.height,self.radius)
    gfx.popContext()
    self:setImage(upgradeImage)
    self:moveTo(self.x, self.y)
    self:add()
end

function Upgrade:update()
    Upgrade.super.update(self)
end