import "bulletAura.lua"

class("Aura").extends(Weapon)

function Aura:init(attackSpeed, x, y, damage, projectileAmount, scale, duration)
    Aura.super.init(self, attackSpeed, damage, projectileAmount, scale)
    self.speed = 4
    self.x = x
    self.duration = duration
    self.y = y
    -- self:debugLevel(10)
end

function Aura:changeLevel()
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

function Aura:shoot()
    bulletAura = BulletAura(self.x, self.y, self.speed, self.damage+((player.damageBonus*self.damage)/100), angle, self.scale+((player.scaleBonus*self.scale)/100), self.duration)
end