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
        self.duration += 2
    end
    if self.level == 3 then
        self.projectileAmount += 1
    end
    if self.level == 4 then
        self.attackSpeed -= 2000
        self.scale += 0.25
    end
    if self.level == 5 then
        self.projectileAmount += 1
        self.scale += 0.25
        self.duration += 1
        self.attackSpeed -= 1000
    end
end

function Blackhole:shoot()
    Blackhole.super.shoot()
    local angles = cutAngle(self.projectileAmount + player.projectileAmount)
    for key, angle in ipairs(angles) do
        bulletBlackhole = BulletBlackhole(self.x, self.y - 20, self.speed, self.damage, angle, self.scale, self.duration)
    end
end