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
        self.attackSpeed -= 200
        self.scale += 0.1
    end
    if self.level == 3 then
        self.speed += 0.5
        self.duration += 0.2
        self.damage += 0.25
    end
    if self.level == 4 then
        self.attackSpeed -= 200
        self.scale += 0.1
    end
    if self.level == 5 then
        self.projectileAmount += 1
        self.scale += 0.1
        self.damage += 0.5
    end
    if self.level == 6 then
        self.attackSpeed -= 200
        self.speed += 0.5
        self.duration += 0.2
    end
    if self.level == 7 then
        self.scale += 0.1
        self.damage += 0.5
    end
    if self.level == 8 then
        self.attackSpeed -= 200
    end
    if self.level == 9 then
        self.scale += 0.1
        self.damage += 1
    end
    if self.level == 10 then
        self.attackSpeed -= 200
        self.projectileAmount += 1
        self.scale += 0.5
        self.speed += 1
        self.damage += 1
        self.duration += 0.6
    end
end

function Plasma:shoot()
    Plasma.super.shoot()
    local angles = cutAngle(self.projectileAmount + player.projectileAmount)
    for key, angle in ipairs(angles) do
        plasmaBullet = BulletPlasma(self.x, self.y - 20, self.speed, self.damage, angle, self.scale, self.duration)
    end
end