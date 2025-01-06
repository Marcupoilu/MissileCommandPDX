import "bulletToxicVape.lua"

class("ToxicVape").extends(Weapon)

function ToxicVape:init(attackSpeed, x, y, speed, damage, projectileAmount, scale, duration)
    ToxicVape.super.init(self, attackSpeed, speed, damage, projectileAmount, scale)
    self.x = x
    self.duration = duration
    self.tickNumber = 3
    self.tickTime = 300
    self.tick = 500
    self.spread = 45
    self.y = y
    -- self:debugLevel(10)
end

function ToxicVape:changeLevel()
    self.level += 1
    if self.level == 2 then
        self.attackSpeed -= 100
        self.scale += 0.1
        self.damage += 0.5
    end
    if self.level == 3 then
        self.attackSpeed -= 100
        self.speed += 0.5
        self.tickNumber += 1
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
        self.tickNumber += 1
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
        self.tickNumber += 1
    end
end

function ToxicVape:shoot()
    ToxicVape.super.shoot()
    local angles = cutAngle(self.projectileAmount + player.projectileAmount)
    for key, angle in ipairs(angles) do
        bulletToxicVape = BulletToxicVape(self.x, self.y - 20, self.speed, self.damage, angle, self.scale, self.duration, self.tickNumber, self.spread, self.tickTime, self.tick)
    end
end