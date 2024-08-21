class("BulletExplosion").extends(Bullet)

local bulletImage = gfx.image.new("images/bulletExplosion" )

-- local p = ParticleCircle(0,0)

function BulletExplosion:init(x,y,speed, damage, offsetCrank, scale, duration, explosionDamage)
    duration = .5
    BulletExplosion.super.init(self, x,y,speed, damage, offsetCrank, scale, duration)
    self.damage = explosionDamage
    self.hp = 1000
    self.tick = 100
    self:setCenter(0.5,0.5)
    p:moveTo(x, y)
    p:setSize(20,20)
    p:setColor(gfx.kColorWhite)
    p:setMode(Particles.modes.DECAY)
    p:setSpeed(2+math.round(((player.scaleBonus*2)/100)), 2+math.round(((player.scaleBonus*2)/100)))
    p:setSpread(0,359)
    p:add(300)
end

function BulletExplosion:update()
    for key, particle in pairs(p:getParticles()) do
        local rect = playdate.geometry.rect.new(particle.x, particle.y, 10 + ((player.scaleBonus*10)/100),10 + ((player.scaleBonus*10)/100))
        table.insert(debugRects, rect)
        for key, value in pairs(gfx.sprite.getAllSprites()) do
            if value:isa(Enemy) then
                local width, height = value:getSize()
                local enemyRect = playdate.geometry.rect.new(value.x - width/2, value.y - height/2, width, height)
                table.insert(debugRects, enemyRect)
                if rect:intersects(enemyRect) then
                    value:touchEnemy(self)
                end
            end
        end
    end
end