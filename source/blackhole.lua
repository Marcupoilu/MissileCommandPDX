import "bulletBlackhole.lua"

class("Blackhole").extends(Weapon)

function Blackhole:init(attackSpeed, x, y, speed, damage, projectileAmount, scale, duration)
    Blackhole.super.init(self, attackSpeed, speed, damage, projectileAmount, scale)
    self.x = x
    self.duration = duration
    self.y = y
    -- self:debugLevel(10)
end

function Blackhole:changeLevel()
    self.level += 1
    if self.level == 2 then
        self.duration += 500
    end
    if self.level == 3 then
        self.projectileAmount += 1
        self.scale += 0.25
    end
    if self.level == 4 then
        self.attackSpeed -= 500
        self.scale += 0.25
    end
    if self.level == 5 then
        self.projectileAmount += 1
        self.scale += 0.25
        self.duration += 500
        self.attackSpeed -= 1000
    end
end

function Blackhole:shoot()
    Blackhole.super.shoot()
    local angles = cutAngle(self.projectileAmount + player.projectileAmount)
    for key, angle in ipairs(angles) do
        local bullet = BulletPool:get(BulletBlackhole)
        if bullet then
            bullet:reset(self.x, self.y, self.speed, self.damage, angle, self.scale, self.duration)
        else
            bullet = BulletBlackhole(self.x, self.y, self.speed, self.damage, angle, self.scale, self.duration)
            BulletPool:release(bullet) -- On l'ajoute au pool pour la prochaine fois
        end
    end
end