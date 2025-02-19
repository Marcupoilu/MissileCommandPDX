import "bulletLaserDome.lua"

class("LaserDome").extends(Weapon)

function LaserDome:init(attackSpeed, x, y, speed, damage, projectileAmount, scale, duration)
    LaserDome.super.init(self, attackSpeed, speed, damage, projectileAmount, scale, duration)
    self.x = x
    self.duration = duration
    self.y = y
    self.tick = 300
    self.spawned = false
    -- self:debugLevel(10)
end

function LaserDome:changeLevel()
    self.level += 1
    if self.level == 2 then
        self.speed += 2
        self.attackSpeed -= 1000
    end
    if self.level == 3 then
        self.damage += 0.5
        self.scale += 0.25
    end
    if self.level == 4 then
        self.damage += 0.5
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
    local bullet = BulletPool:get(BulletLaserDome)
    if bullet then
        bullet:reset(self.x, self.y, self.speed, self.damage, angle, self.scale, self.duration, self.tick)
    else
        bullet = BulletLaserDome(self.x, self.y, self.speed, self.damage, angle, self.scale, self.duration, self.tick)
        BulletPool:release(bullet) -- On l'ajoute au pool pour la prochaine fois
    end   
    self.spawned = true
end