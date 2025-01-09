import "bulletShockwave.lua"

class("Shockwave").extends(Weapon)

function Shockwave:init(attackSpeed, x, y, speed, damage, projectileAmount, scale, duration)
    Shockwave.super.init(self, attackSpeed, speed, damage, projectileAmount, scale)
    self.x = x
    self.duration = duration
    self.y = y
    self.hp = 3
    self.power = 5
    -- self:debugLevel(10)
end

function Shockwave:changeLevel()
    self.level += 1
    if self.level == 2 then
        self.power += 3
        self.damage += 0.25
        self.scale += 0.25
    end
    if self.level == 3 then
        self.projectileAmount += 1
        self.hp += 2
        self.scale += 0.25
    end
    if self.level == 4 then
        self.attackSpeed -= 1000
        self.duration += 3
        self.hp += 2
    end
    if self.level == 5 then
        self.projectileAmount += 1
        self.attackSpeed -= 500
        self.hp += 2
        self.power += 3
    end
end

function Shockwave:shoot()
    Shockwave.super.shoot()
    local angles = cutAngle(self.projectileAmount + player.projectileAmount)
    for key, angle in ipairs(angles) do
        bulletShockwave = BulletShockwave(self.x, self.y - 20, self.speed, self.damage, angle, self.scale, self.duration, self.power, self.hp)
    end
end