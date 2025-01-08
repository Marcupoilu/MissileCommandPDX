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
        self.duration += 1000
        self.speed += 2
    end
    if self.level == 3 then
        self.tickTime -= 100
        self.scale += 0.25
    end
    if self.level == 4 then
        self.damage += 0.25
        self.attackSpeed -= 1000
    end
    if self.level == 5 then
        self.speed += 10
    end
end

function LaserDome:shoot()
    LaserDome.super.shoot()
    -- if self.spawned == true then
    --     return 
    -- end
    local angle = 0
    print("spawn")
    bulletLaserDome = BulletLaserDome(self.x, self.y - 20, self.speed, self.damage, angle, self.scale, 270)
    -- bulletLaserDome = BulletLaserDome(self.x, self.y - 20, self.speed, self.damage, angle, self.scale, 90)
    self.spawned = true
end