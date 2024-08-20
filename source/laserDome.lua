import "bulletLaserDome.lua"

class("LaserDome").extends(Weapon)

function LaserDome:init(attackSpeed, x, y, damage, projectileAmount, scale, duration)
    LaserDome.super.init(self, attackSpeed, damage, projectileAmount, scale)
    self.speed = 100
    self.x = x
    self.duration = duration
    self.y = y
    self.spawned = false
    -- self:debugLevel(10)
end

function LaserDome:changeLevel()
    self.level += 1
    if self.level == 2 then
        self.attackSpeed -= 10
        self.scale += 1
    end
    if self.level == 3 then
        self.attackSpeed -= 10
    end
    if self.level == 4 then
        self.attackSpeed -= 10
        self.scale += 1
    end
    if self.level == 5 then
        self.attackSpeed -= 10
        self.projectileAmount += 1
        self.scale += 1
    end
    if self.level == 6 then
        self.attackSpeed -= 10
    end
    if self.level == 7 then
        self.attackSpeed -= 10
        self.scale += 1
    end
    if self.level == 8 then
        self.attackSpeed -= 10
    end
    if self.level == 9 then
        self.attackSpeed -= 10
        self.scale += 1
    end
    if self.level == 10 then
        self.attackSpeed -= 50
        self.projectileAmount += 1
        self.scale += 5
        self.speed += 10
    end
end

function LaserDome:shoot()
    LaserDome.super.shoot()
    if self.spawned == true then
        return 
    end
    local angle = 0
    bulletLaserDome = BulletLaserDome(self.x, self.y - 20, self.speed, self.damage+((player.damageBonus*self.damage)/100), angle, self.scale+((player.scaleBonus*self.scale)/100), 270)
    bulletLaserDome = BulletLaserDome(self.x, self.y - 20, self.speed, self.damage+((player.damageBonus*self.damage)/100), angle, self.scale+((player.scaleBonus*self.scale)/100), 90)
    self.spawned = true
end