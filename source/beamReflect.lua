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

function BeamReflect:shoot()
    BeamReflect.super.shoot()
    local angles = cutAngle(self.projectileAmount + player.projectileAmount)
    for key, angle in ipairs(angles) do
        bulletBeamReflect = BulletBeamReflect(self.x, self.y - 20, self.speed, self.damage+((player.damageBonus*self.damage)/100), angle, self.scale+((player.scaleBonus*self.scale)/100), self.duration, self.hp)
    end
end