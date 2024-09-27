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
        self.attackSpeed -= 100
        self.scale += 0.1
        self.damage += 0.5
    end
    if self.level == 3 then
        self.attackSpeed -= 100
        self.speed += 0.5
    end
    if self.level == 4 then
        self.attackSpeed -= 100
        self.scale += 0.1
    end
    if self.level == 5 then
        self.attackSpeed -= 100
        self.projectileAmount += 1
        self.scale += 0.1
        self.damage += 0.5
    end
    if self.level == 6 then
        self.attackSpeed -= 100
        self.speed += 0.5
    end
    if self.level == 7 then
        self.attackSpeed -= 100
        self.scale += 0.1
        self.damage += 0.5
    end
    if self.level == 8 then
        self.attackSpeed -= 100
    end
    if self.level == 9 then
        self.attackSpeed -= 100
        self.scale += 0.1
    end
    if self.level == 10 then
        self.attackSpeed -= 200
        self.projectileAmount += 1
        self.scale += 0.5
        self.speed += 1
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