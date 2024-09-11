import "bulletDrone.lua"
class("Drone").extends(Weapon)


function Drone:init(attackSpeed, x, y, speed, damage, projectileAmount, scale, duration)
    Drone.super.init(self, attackSpeed, speed, damage, projectileAmount, scale)
    -- self:debugLevel(10)
    self.duration = duration
    self.x = x
    self.y = y
end

function Drone:changeLevel()
    self.level += 1
    if self.level == 2 then
        self.attackSpeed -= 10
        self.scale += 0.1
    end
    if self.level == 3 then
        self.attackSpeed -= 10
    end
    if self.level == 4 then
        self.attackSpeed -= 10
        self.scale += 0.1
    end
    if self.level == 5 then
        self.attackSpeed -= 10
        self.projectileAmount += 1
        self.scale += 0.1
    end
    if self.level == 6 then
        self.attackSpeed -= 10
    end
    if self.level == 7 then
        self.attackSpeed -= 10
        self.scale += 0.1
    end
    if self.level == 8 then
        self.attackSpeed -= 10
    end
    if self.level == 9 then
        self.attackSpeed -= 10
        self.scale += 0.1
    end
    if self.level == 10 then
        self.attackSpeed -= 50
        self.projectileAmount += 1
        self.scale += 0.1
    end
end

function Drone:shoot()
    Drone.super.shoot()
    local angles = cutAngle(self.projectileAmount + player.projectileAmount)
    for key, angle in ipairs(angles) do
        bulletDrone = BulletDrone(self.x, self.y, self.speed, self.damage+((player.damageBonus*self.damage)/100), angle, self.scale, self.duration, self.projectileAmount)
    end
end