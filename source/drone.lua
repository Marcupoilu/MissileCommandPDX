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
        self.attackSpeed -= 1000
        self.duration += 1000
    end
    if self.level == 3 then
        self.projectileAmount += 1
        self.speed += 2
    end
    if self.level == 4 then
        self.damage += 0.25
        self.attackSpeed -= 1000
    end
    if self.level == 5 then
        self.projectileAmount += 1
        self.duration += 1000
    end
end

function Drone:shoot()
    Drone.super.shoot()
    local angles = cutAngle(self.projectileAmount + player.projectileAmount)
    for key, angle in ipairs(angles) do
        local bullet = BulletPool:get(BulletDrone)
        if bullet then
            bullet:reset(self.x, self.y, self.speed, self.damage, angle, self.scale, self.duration, self.projectileAmount)
        else
            bullet = BulletDrone(self.x, self.y, self.speed, self.damage, angle, self.scale, self.duration, self.projectileAmount)
            BulletPool:release(bullet) -- On l'ajoute au pool pour la prochaine fois
        end        
    end
end