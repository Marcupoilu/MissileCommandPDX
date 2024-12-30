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
        self.attackSpeed -= 200
        self.duration += 0.2
        self.scale += 0.15
    end
    if self.level == 3 then
        self.scale += 0.15
        self.freezeDuration += 0.2
    end
    if self.level == 4 then
        self.attackSpeed -= 200
        self.duration += 0.2
        self.scale += 0.15
    end
    if self.level == 5 then
        self.projectileAmount += 1
        self.scale += 0.15
        self.duration += 0.2
        self.freezeDuration += 0.2
    end
    if self.level == 6 then
        self.attackSpeed -= 200
    end
    if self.level == 7 then
        self.scale += 0.15
        self.duration += 0.2
        self.freezeDuration += 0.2
    end
    if self.level == 8 then
        self.attackSpeed -= 200
    end
    if self.level == 9 then
        self.scale += 0.15
        self.duration += 0.2
    end
    if self.level == 10 then
        self.attackSpeed -= 200
        self.projectileAmount += 1
        self.scale += 0.6
        self.freezeDuration += 0.4
        self.duration += 0.5
    end
end

function Freezer:shoot()
    Freezer.super.shoot()
    local angles = cutAngle(self.projectileAmount + player.projectileAmount)
    for key, angle in ipairs(angles) do
        bulletFreezer = BulletFreezer(self.x, self.y - 20, self.speed, self.damage+((player.damageBonus*self.damage)/100), angle, self.scale, self.duration, self.freezeDuration)
    end
end