class("SimpleCannon").extends(Weapon)


function SimpleCannon:init(attackSpeed, x, y, damage, projectileAmount, scale)
    SimpleCannon.super.init(self, attackSpeed, damage, projectileAmount, scale)
    -- self:debugLevel(10)
    self.x = x
    self.y = y
end

function SimpleCannon:changeLevel()
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

function SimpleCannon:shoot()
    SimpleCannon.super.shoot()
    local angles = cutAngle(self.projectileAmount + player.projectileAmount)
    for key, angle in ipairs(angles) do
        bullet = Bullet(self.x, self.y, 5, self.damage+((player.damageBonus*self.damage)/100), angle, self.scale+((player.scaleBonus*self.scale)/100), 100000, gfx.image.new("images/bullet" ))
    end
end