import "bulletTracer.lua"

class("Tracer").extends(Weapon)

function Tracer:init(attackSpeed, x, y, speed, damage, projectileAmount, scale, duration)
    Tracer.super.init(self, attackSpeed, speed, damage, projectileAmount, scale)
    self.x = x
    self.duration = duration
    self.y = y
    -- self:debugLevel(10)
end

function Tracer:changeLevel()
    self.level += 1
    if self.level == 2 then
        self.attackSpeed -= 100
        self.scale += 0.1
    end
    if self.level == 3 then
        self.attackSpeed -= 100
        self.damage += 0.1
        self.duration += 0.2
    end
    if self.level == 4 then
        self.attackSpeed -= 100
        self.scale += 0.1
    end
    if self.level == 5 then
        self.attackSpeed -= 100
        self.projectileAmount += 1
        self.scale += 0.1
        self.duration += 0.2
    end
    if self.level == 6 then
        self.attackSpeed -= 100
        self.damage += 0.1
    end
    if self.level == 7 then
        self.attackSpeed -= 100
        self.scale += 0.1
        self.duration += 0.2
    end
    if self.level == 8 then
        self.attackSpeed -= 100
        self.damage += 0.1
    end
    if self.level == 9 then
        self.attackSpeed -= 100
        self.scale += 0.1
    end
    if self.level == 10 then
        self.attackSpeed -= 200
        self.damage += 0.2
        self.projectileAmount += 1
        self.scale += 0.5
        self.speed += 1
        self.duration += 0.5
    end
end

function Tracer:shoot()
    Tracer.super.shoot()
    local angles = cutAngle(self.projectileAmount + player.projectileAmount)
    for key, angle in ipairs(angles) do
        bulletTracer = BulletTracer(self.x, self.y - 20, self.speed, self.damage, angle, self.scale, self.duration)
    end
end