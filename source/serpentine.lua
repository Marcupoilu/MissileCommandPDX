import "bulletSerpentine.lua"

class("Serpentine").extends(Weapon)

function Serpentine:init(attackSpeed, x, y, speed, damage, projectileAmount, scale, duration)
    Serpentine.super.init(self, attackSpeed, speed, damage, projectileAmount, scale)
    self.x = x
    self.duration = duration
    self.y = y
    -- self:debugLevel(10)
end

function Serpentine:changeLevel()
    self.level += 1
    if self.level == 2 then
        self.attackSpeed -= 50
        self.scale += 0.1
    end
    if self.level == 3 then
        -- self.attackSpeed -= 100
        self.speed += 0.2
        self.damage += 0.1
    end
    if self.level == 4 then
        self.attackSpeed -= 50
        self.scale += 0.1
    end
    if self.level == 5 then
        self.projectileAmount += 1
        self.scale += 0.2
        self.damage += 0.1
        self.speed += 0.1
    end
    if self.level == 6 then
        self.attackSpeed -= 50
        self.speed += 0.2
    end
    if self.level == 7 then
        self.scale += 0.1
        self.damage += 0.1
    end
    if self.level == 8 then
        self.attackSpeed -= 50
        self.scale += 0.1
        self.damage += 0.1
    end
    if self.level == 9 then
        self.scale += 0.1
        self.speed += 0.1
        self.damage += 0.1
    end
    if self.level == 10 then
        self.attackSpeed -= 100
        self.projectileAmount += 1
        self.scale += 0.5
        self.speed += 0.5
        self.damage += 0.2
    end
end

function Serpentine:shoot()
    Serpentine.super.shoot()
    local angles = cutAngle(self.projectileAmount + player.projectileAmount)
    for key, angle in ipairs(angles) do
        serpentineBullet = BulletSerpentine(self.x, self.y - 20, self.speed, self.damage+((player.damageBonus*self.damage)/100), angle, self.scale+((player.scaleBonus*self.scale)/100), self.duration)
    end
end