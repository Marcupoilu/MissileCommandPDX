import "bulletRocket.lua"

class("Rocket").extends(Weapon)

function Rocket:init(attackSpeed, x, y, speed, damage, projectileAmount, scale, duration)
    Rocket.super.init(self, attackSpeed, speed, damage, projectileAmount, scale)
    self.x = x
    self.duration = duration
    self.explosionDamage = 2
    self.y = y
    -- self:debugLevel(10)
end

function Rocket:changeLevel()
    self.level += 1
    if self.level == 2 then
        self.attackSpeed -= 200
        self.scale += 0.1
        self.explosionDamage += 1
    end
    if self.level == 3 then
        self.speed += 0.5
    end
    if self.level == 4 then
        self.attackSpeed -= 200
        self.scale += 0.1
    end
    if self.level == 5 then
        self.projectileAmount += 1
        self.scale += 0.1
        self.explosionDamage += 1
    end
    if self.level == 6 then
        self.attackSpeed -= 200
        self.speed += 0.5
    end
    if self.level == 7 then
        self.scale += 0.1
    end
    if self.level == 8 then
        self.attackSpeed -= 200
    end
    if self.level == 9 then
        self.scale += 0.1
    end
    if self.level == 10 then
        self.attackSpeed -= 200
        self.projectileAmount += 1
        self.scale += 0.5
        self.speed += 1
        self.explosionDamage += 1
    end
end

function Rocket:shoot()
    Rocket.super.shoot()
    local angles = cutAngle(self.projectileAmount + player.projectileAmount)
    for key, angle in ipairs(angles) do
        bulletRocket = BulletRocket(self.x, self.y - 20, self.speed, self.damage, angle, self.scale, self.duration, self.explosionDamage)
    end
end