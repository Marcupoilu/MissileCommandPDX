local pd <const> = playdate
local gfx <const> = pd.graphics

class('SpriteShake').extends(gfx.sprite)

function SpriteShake:init()
    self.shakeAmount = 0
    self.sprite = nil
    self:add()
end

function SpriteShake:setShakeAmount(amount, sprite)
    self.shakeAmount = amount
    self.sprite = sprite
    self.spritePos = {x = sprite.x, y = sprite.y}
end

function SpriteShake:update()
    if self.shakeAmount > 0 then
        local shakeAngle = math.random()*math.pi*2
        local shakeX = math.floor(math.cos(shakeAngle))*self.shakeAmount
        local shakeY = math.floor(math.sin(shakeAngle))*self.shakeAmount
        self.shakeAmount -= 1
        self.sprite.moveTo(shakeX, shakeY)
    else
        self.sprite.moveTo(self.spritePos.x, self.spritePos.y)
    end
end