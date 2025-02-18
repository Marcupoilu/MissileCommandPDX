import "bulletRocket.lua"

class("Rocket").extends(Weapon)

function Rocket:init(attackSpeed, x, y, speed, damage, projectileAmount, scale, duration)
    Rocket.super.init(self, attackSpeed, speed, damage, projectileAmount, scale)
    self.x = x
    self.duration = duration
    self.explosionDamage = 5
    self.y = y
    -- self:debugLevel(10)
end

function Rocket:changeLevel()
    self.level += 1
    if self.level == 2 then
        self.scale += 0.25
        self.speed += 2
        self.explosionDamage += 2
    end
    if self.level == 3 then
        self.projectileAmount += 1
        self.explosionDamage += 2
    end
    if self.level == 4 then
        self.attackSpeed -= 1000
        self.speed += 2
    end
    if self.level == 5 then
        self.projectileAmount += 1
        self.explosionDamage += 2
        self.scale += 0.25
        self.speed += 2
    end
end

function Rocket:shoot()
    Rocket.super.shoot()
    local angles = cutAngle(self.projectileAmount + player.projectileAmount)
    for key, angle in ipairs(angles) do
        local bullet = BulletPool:get(BulletRocket)
        if bullet then
            bullet:reset(self.x, self.y, self.speed, self.damage, angle, self.scale, self.duration, self.explosionDamage)
        else
            bullet = BulletRocket(self.x, self.y, self.speed, self.damage, angle, self.scale, self.duration, self.explosionDamage)
            BulletPool:release(bullet) -- On l'ajoute au pool pour la prochaine fois
        end
    end
end