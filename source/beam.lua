class("Beam").extends(Weapon)

function Beam:init(attackSpeed, x, y, speed, damage, projectileAmount, scale, duration)
    Beam.super.init(self, attackSpeed, speed, damage, projectileAmount, scale)
    self.x = x
    self.duration = duration
    self.y = y
    -- self:debugLevel(10)
end

function Beam:changeLevel()
    self.level += 1
    if self.level == 2 then
        self.attackSpeed -= 100
        self.damage += 0.1
        self.scale += 0.1
    end
    if self.level == 3 then
        self.attackSpeed -= 100
        self.duration += 0.2
    end
    if self.level == 4 then
        self.attackSpeed -= 100
        self.damage += 0.1
        self.scale += 0.1
    end
    if self.level == 5 then
        self.attackSpeed -= 300
        self.damage += 0.15
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
        self.attackSpeed -= 500
        self.damage += 0.2
        self.projectileAmount += 1
        self.scale += 0.5
        self.speed += 1
        self.duration += 0.5
    end
end

function Beam:shoot()
    Beam.super.shoot()
    local angles = cutAngle(self.projectileAmount + player.projectileAmount)
    soundSamplerLaserBeam:play(0)
    for key, angle in ipairs(angles) do
        bulletBeam = BulletBeam(self.x, self.y - 20, self.speed, self.damage, angle, self.scale, self.duration)
    end
end