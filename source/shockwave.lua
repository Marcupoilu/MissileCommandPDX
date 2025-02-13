import "bulletShockwave.lua"

class("Shockwave").extends(Weapon)

function Shockwave:init(attackSpeed, x, y, speed, damage, projectileAmount, scale, duration)
    Shockwave.super.init(self, attackSpeed, speed, damage, projectileAmount, scale)
    self.x = x
    self.duration = duration
    self.y = y
    self.hp = 3
    self.power = 5
end

function Shockwave:changeLevel()
    self.level += 1
    if self.level == 2 then
        self.power += 3
        self.damage += 0.25
        self.scale += 0.1
    end
    if self.level == 3 then
        self.projectileAmount += 1
        self.hp += 3
        self.scale += 0.1
    end
    if self.level == 4 then
        self.attackSpeed -= 1000
        self.duration += 3
        self.hp += 3
        self.scale += 0.1
    end
    if self.level == 5 then
        self.projectileAmount += 1
        self.attackSpeed -= 500
        self.hp += 3
        self.power += 3
        self.scale += 0.1
    end
end

function Shockwave:shoot()
    Shockwave.super.shoot()
    local angles = cutAngle(self.projectileAmount + player.projectileAmount)
    for key, angle in ipairs(angles) do
        local bullet = BulletPool:get(BulletShockwave)
        if bullet then
            bullet:reset(self.x, self.y, self.speed, self.damage, angle, self.scale, self.duration, self.power, self.hp)
        else
            bullet = BulletShockwave(self.x, self.y, self.speed, self.damage, angle, self.scale, self.duration, self.power, self.hp)
            BulletPool:release(bullet) -- On l'ajoute au pool pour la prochaine fois
        end
    end
end