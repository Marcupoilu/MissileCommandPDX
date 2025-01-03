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
        self.attackSpeed -= 50
        self.scale += 0.1
        self.hp += 1
    end
    if self.level == 3 then
        self.speed += 0.5
        self.power += 1
    end
    if self.level == 4 then
        self.attackSpeed -= 50
        self.scale += 0.1
        self.hp += 1
    end
    if self.level == 5 then
        self.attackSpeed -= 100
        self.projectileAmount += 1
        self.scale += 0.1
    end
    if self.level == 6 then
        self.attackSpeed -= 50
        self.speed += 0.5
        self.power += 1
        self.hp += 1
    end
    if self.level == 7 then
        self.scale += 0.1
        self.power += 1
    end
    if self.level == 8 then
        self.attackSpeed -= 50
        self.scale += 0.1
        self.hp += 1
    end
    if self.level == 9 then
        self.scale += 0.1
        self.power += 1
    end
    if self.level == 10 then
        self.attackSpeed -= 200
        self.projectileAmount += 1
        self.scale += 0.5
        self.speed += 1
        self.hp += 1
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