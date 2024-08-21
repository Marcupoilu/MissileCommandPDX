class("BulletAura").extends(Bullet)

local bulletImage = gfx.image.new("images/bulletPlasma" )

function BulletAura:init(x,y,speed, damage, offsetCrank, scale, duration)
    BulletAura.super.init(self,x,y,speed, damage, offsetCrank, scale, duration, bulletImage)
    self.hp = 1000
    self.rot = 0
    self.tick = 300
    self.currentCollision = false
    self:setCenter(0.5,0.5)
    self:moveTo(player.cannonBaseSprite.x, player.cannonBaseSprite.y)
    self.particleSystem = {}
end

function BulletAura:update()
    self:animate()
end