class("Beam").extends(Weapon)

function Beam:init(attackSpeed, x, y, damage, projectileAmount, scale)
    Beam.super.init(self, attackSpeed, damage, projectileAmount, scale)
    -- self:debugLevel(10)
    self.x = x
    self.y = y
end

function Beam:changeLevel()
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

function Beam:shoot()
    Beam.super.shoot()
    local angles = cutAngle(self.projectileAmount + player.projectileAmount)
    for key, angle in ipairs(angles) do
        bulletBeam = BulletBeam(self.x, self.y - 20, 5, self.damage+((player.damageBonus*self.damage)/100), angle, self.scale+((player.scaleBonus*self.scale)/100))
    end
end