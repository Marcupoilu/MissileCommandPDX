import "bulletFlamethrower.lua"

class("Flamethrower").extends(Weapon)

function Flamethrower:init(attackSpeed, x, y, speed, damage, projectileAmount, scale, duration)
    Flamethrower.super.init(self, attackSpeed, speed, damage, projectileAmount, scale)
    self.x = x
    self.duration = duration
    self.y = y
    -- self:debugLevel(10)
end

function Flamethrower:changeLevel()
    self.level += 1
    if self.level == 2 then
        self.attackSpeed -= 250
        self.scale += 0.25
    end
    if self.level == 3 then
        self.projectileAmount += 1
        self.attackSpeed -= 250
    end
    if self.level == 4 then
        self.damage += 2
        self.scale += 0.25
    end
    if self.level == 5 then
        self.projectileAmount += 1
        self.scale += 0.25
        self.damage += 1
    end
end

function Flamethrower:shoot()
    Flamethrower.super.shoot()
    local angles = cutAngle(self.projectileAmount + player.projectileAmount)
    for key, angle in ipairs(angles) do
        bulletFlamethrower = BulletFlamethrower(self.x, self.y - 20, self.speed, self.damage+((player.damageBonus*self.damage)/100), angle, self.scale, self.duration)
    end
end