class("BulletExplosion").extends(Bullet)

local bulletImage = gfx.image.new("images/bulletExplosion" )

local p = ParticleCircle(0,0)

function BulletExplosion:init(x,y,speed, damage, offsetCrank, scale, duration)
    duration = .5
    BulletExplosion.super.init(self, x,y,speed, damage, offsetCrank, scale, duration)
    self.hp = 1000
    self.tick = 100
    p:moveTo(x, y)
    p:setSize(20,20)
    p:setColor(gfx.kColorWhite)
    p:setMode(Particles.modes.DECAY)
    p:setSpeed(2+math.round(((player.scaleBonus*2)/100)), 2+math.round(((player.scaleBonus*2)/100)))
    p:setSpread(0,359)
    p:add(300)
    self:setImage(bulletImage)
    local width, height = self:getSize()
    width = width +((player.scaleBonus*width)/100)
    height = height +((player.scaleBonus*height)/100)
    self:setCollideRect(0 - width/3,0-height/3,width,height)
end

function BulletExplosion:update()
end