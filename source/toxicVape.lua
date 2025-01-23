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
        self.damage += 0.25
        self.scale += 0.25
    end
    if self.level == 3 then
        self.projectileAmount += 1
        self.scale += 0.25
    end
    if self.level == 4 then
        self.tickNumber += 1
        self.tickTime -= 100
    end
    if self.level == 5 then
        self.projectileAmount += 1
        self.attackSpeed -= 1000
        self.speed += 3
    end
end

function ToxicVape:shoot()
    ToxicVape.super.shoot()
    local angles = cutAngle(self.projectileAmount + player.projectileAmount)
    for key, angle in ipairs(angles) do
        local bullet = BulletPool:get(BulletToxicVape)
        if bullet then
            bullet:reset(self.x, self.y, self.speed, self.damage, angle, self.scale, self.duration, self.tickNumber, self.spread, self.tickTime, self.tick)
        else
            bullet = BulletToxicVape(self.x, self.y, self.speed, self.damage, angle, self.scale, self.duration, self.tickNumber, self.spread, self.tickTime, self.tick)
            BulletPool:release(bullet) -- On l'ajoute au pool pour la prochaine fois
        end
    end
end