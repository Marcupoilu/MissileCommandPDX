import "bulletAura.lua"

class("Aura").extends(Weapon)

function Aura:init(attackSpeed, x, y, speed, damage, projectileAmount, scale, duration)
    Aura.super.init(self, attackSpeed, speed, damage, projectileAmount, scale)
    self.x = x
    self.duration = duration
    self.y = y
    self.tick = 600
    -- self:debugLevel(10)
end

function Aura:changeLevel()
    self.level += 1
    if self.level == 2 then
        self.damage += 0.25
    end
    if self.level == 3 then
        self.scale += 0.5
    end
    if self.level == 4 then
        self.tick -= 300
    end
    if self.level == 5 then
        self.damage += 0.15
        self.scale += 0.25
        self.tick -= 100
    end
end

function Aura:shoot()
    local bullet = BulletPool:get(BulletAura)
    if bullet then
        bullet:reset(self.x, self.y, self.speed, self.damage, angle, self.scale, self.duration, nil, self.tick)
    else
        bullet = BulletAura(self.x, self.y, self.speed, self.damage, angle, self.scale, self.duration, nil, self.tick)
        BulletPool:release(bullet) -- On l'ajoute au pool pour la prochaine fois
    end
end