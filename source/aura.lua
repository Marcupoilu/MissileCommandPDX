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
        self.scale += 0.1
    end
    if self.level == 3 then
        self.scale += 0.1
        self.damage += 0.05
    end
    if self.level == 4 then
        self.scale += 0.1
    end
    if self.level == 5 then
        self.scale += 0.25
        self.damage += 0.1
        self.tick -= 150
    end
    if self.level == 6 then
        self.scale += 0.1
    end
    if self.level == 7 then
        self.scale += 0.1
        self.damage += 0.05
    end
    if self.level == 8 then
        self.scale += 0.1
    end
    if self.level == 9 then
        self.scale += 0.1
        self.damage += 0.05
    end
    if self.level == 10 then
        self.scale += 0.25
        self.damage += 0.25
        self.tick -= 150
    end
end

function Aura:shoot()
    bulletAura = BulletAura(self.x, self.y, self.speed, self.damage, angle, self.scale, self.duration, self.tick)
end