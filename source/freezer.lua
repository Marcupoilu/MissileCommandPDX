import "bulletFreezer.lua"
class("Freezer").extends(Weapon)

function Freezer:init(attackSpeed, x, y, speed, damage, projectileAmount, scale, duration)
    Freezer.super.init(self, attackSpeed, speed, damage, projectileAmount, scale)
    self.x = x
    self.duration = duration
    self.freezeDuration = 1
    self.y = y
    -- self:debugLevel(10)
end

function Freezer:changeLevel()
    self.level += 1
    if self.level == 2 then
        self.freezeDuration += 1
        self.scale += 0.25
    end
    if self.level == 3 then
        self.projectileAmount += 1
        self.attackSpeed -= 1000
    end
    if self.level == 4 then
        self.duration += 1
        self.scale += 0.25
    end
    if self.level == 5 then
        self.projectileAmount += 1
        self.attackSpeed -= 1000
    end
end

function Freezer:shoot()
    Freezer.super.shoot()
    local angles = cutAngle(self.projectileAmount + player.projectileAmount)
    for key, angle in ipairs(angles) do
        bulletFreezer = BulletFreezer(self.x, self.y - 20, self.speed, self.damage+((player.damageBonus*self.damage)/100), angle, self.scale, self.duration, self.freezeDuration)
    end
end