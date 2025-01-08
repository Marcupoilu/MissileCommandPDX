import "bulletPlasma.lua"

class("Plasma").extends(Weapon)

function Plasma:init(attackSpeed, x, y, speed, damage, projectileAmount, scale, duration)
    Plasma.super.init(self, attackSpeed, speed, damage, projectileAmount, scale)
    self.x = x
    self.duration = duration
    self.y = y
    -- self:debugLevel(10)
end

function Plasma:changeLevel()
    self.level += 1
    if self.level == 2 then
        self.speed += 4
        self.scale += 0.25
    end
    if self.level == 3 then
        self.projectileAmount += 1
        self.attackSpeed -= 1000
    end
    if self.level == 4 then
        self.damage += 0.25
        self.scale += 0.25
        self.duration += 1000
    end
    if self.level == 5 then
        self.projectileAmount += 1
        self.speed += 2
        self.attackSpeed -= 1000
    end
end

function Plasma:shoot()
    Plasma.super.shoot()
    local angles = cutAngle(self.projectileAmount + player.projectileAmount)
    for key, angle in ipairs(angles) do
        plasmaBullet = BulletPlasma(self.x, self.y - 20, self.speed, self.damage, angle, self.scale, self.duration)
    end
end