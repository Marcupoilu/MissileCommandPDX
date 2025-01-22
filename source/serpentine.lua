import "bulletSerpentine.lua"

class("Serpentine").extends(Weapon)

function Serpentine:init(attackSpeed, x, y, speed, damage, projectileAmount, scale, duration)
    Serpentine.super.init(self, attackSpeed, speed, damage, projectileAmount, scale)
    self.x = x
    self.duration = duration
    self.y = y
    self.hp = 3
    -- self:debugLevel(10)
end

function Serpentine:changeLevel()
    self.level += 1
    if self.level == 2 then
        self.attackSpeed -= 200
        self.hp += 1
    end
    if self.level == 3 then
        self.projectileAmount += 1
        self.hp += 1
    end
    if self.level == 4 then
        self.damage += 0.3
        self.scale += 0.25
    end
    if self.level == 5 then
        self.damage += 0.4
        self.projectileAmount += 1
        self.attackSpeed -= 100
        self.hp +=1
    end
end

function Serpentine:shoot()
    Serpentine.super.shoot()
    local angles = cutAngle(self.projectileAmount + player.projectileAmount)
    for key, angle in ipairs(angles) do
        local bullet = BulletPool:get(BulletSerpentine)
        if bullet then
            bullet:reset(self.x, self.y, self.speed, self.damage, angle, self.scale, self.duration, self.hp)
        else
            bullet = BulletSerpentine(self.x, self.y, self.speed, self.damage, angle, self.scale, self.duration, self.hp)
            BulletPool:release(bullet)
        end
    end
end