import "bulletBeamReflect.lua"

class("BeamReflect").extends(Weapon)

function BeamReflect:init(attackSpeed, x, y, speed, damage, projectileAmount, scale, duration)
    BeamReflect.super.init(self, attackSpeed, speed, damage, projectileAmount, scale)
    self.hp = 4
    self.x = x
    self.duration = duration
    self.y = y
    -- self:debugLevel(10)
end

function BeamReflect:changeLevel()
    self.level += 1
    if self.level == 2 then
        self.damage += 1
        self.speed += 5
        self.hp += 1
    end
    if self.level == 3 then
        self.projectileAmount += 1
        self.attackSpeed -= 1000
        self.hp += 1
    end
    if self.level == 4 then
        self.attackSpeed -= 1000
        self.speed += 5
        self.hp += 1
    end
    if self.level == 5 then
        self.projectileAmount += 1
        self.damage += 1
        self.attackSpeed -= 1000
        self.duration += 1
        self.hp += 1
    end
end

function BeamReflect:shoot()
    BeamReflect.super.shoot()
    local angles = cutAngle(self.projectileAmount + player.projectileAmount)
    for key, angle in ipairs(angles) do
        local bullet = BulletPool:get(BulletBeamReflect)
        if bullet then
            bullet:reset(self.x, self.y, self.speed, self.damage, angle, self.scale, self.duration, self.hp)
        else
            bullet = BulletBeamReflect(self.x, self.y, self.speed, self.damage, angle, self.scale, self.duration, self.hp)
            BulletPool:release(bullet) -- On l'ajoute au pool pour la prochaine fois
        end
    end
end