class("BulletAura").extends(Bullet)

local bulletImage = gfx.image.new("images/bullets/bullet_auraPlain" )

function BulletAura:init(x,y,speed, damage, offsetCrank, scale, duration, tick)
    BulletAura.super.init(self,x,y,speed, damage, offsetCrank, scale, duration, bulletImage)
    self.hp = 1000
    self.rot = 0
    self.tick = tick
    self.currentCollision = false
    self:setCenter(0.5,0.5)
    self:setVisible(false)
    self.auraVisible = gfx.image.new("images/bullets/bullet_aura")
    self.auraVisibleSprite = gfx.sprite.new(self.auraVisible)
    self.auraVisibleSprite:setCenter(0.5,0.5)
    self.auraVisibleSprite:add()
    self.auraVisibleSprite:setVisible(true)
    self.auraVisibleSprite:setScale(self.scale)
    self:moveTo(player.cannonBaseSprite.x, player.cannonBaseSprite.y)
    self.auraVisibleSprite:moveTo(player.cannonBaseSprite.x, player.cannonBaseSprite.y)
    self.timerVisible = 30
end

function BulletAura:update()
    BulletAura.super.update(self)
    self.timerVisible -= refreshRate
    if self.timerVisible < 0 then
        self.timerVisible = 30
        if self.auraVisibleSprite:isVisible() then
            self.auraVisibleSprite:setVisible(false)
        else
            self.auraVisibleSprite:setVisible(true)
        end
    end
    self:animate()
end