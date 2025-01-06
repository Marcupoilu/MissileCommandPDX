import "bulletLaserDome.lua"

class("LaserDome").extends(Weapon)

function LaserDome:init(attackSpeed, x, y, speed, damage, projectileAmount, scale, duration)
    LaserDome.super.init(self, attackSpeed, speed, damage, projectileAmount, scale)
    self.x = x
    self.duration = duration
    self.y = y
    self.spawned = false
    -- self:debugLevel(10)
end

function LaserDome:changeLevel()
    self.level += 1
    if self.level == 2 then
        self.scale += 0.1
        self.damage += 0.15
    end
    if self.level == 3 then
        self.scale += 0.1
        self.damage += 0.15
    end
    if self.level == 4 then
        self.scale += 0.1
        self.damage += 0.15
    end
    if self.level == 5 then
        self.scale += 0.1
        self.damage += 0.3
    end
    if self.level == 6 then
        self.scale += 0.1
        self.damage += 0.15
    end
    if self.level == 7 then
        self.scale += 0.1
        self.damage += 0.15
    end
    if self.level == 8 then
        self.scale += 0.1
        self.damage += 0.15
    end
    if self.level == 9 then
        self.scale += 0.1
        self.damage += 0.2
    end
    if self.level == 10 then
        self.scale += 0.2
        self.damage += 0.6
    end
end

function LaserDome:shoot()
    LaserDome.super.shoot()
    if self.spawned == true then
        return 
    end
    local angle = 0
    bulletLaserDome = BulletLaserDome(self.x, self.y - 20, self.speed, self.damage, angle, self.scale, 270)
    bulletLaserDome = BulletLaserDome(self.x, self.y - 20, self.speed, self.damage, angle, self.scale, 90)
    self.spawned = true
end