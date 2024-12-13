class("SimpleCannon").extends(Weapon)


function SimpleCannon:init(attackSpeed, x, y, speed, damage, projectileAmount, scale)
    SimpleCannon.super.init(self, attackSpeed, speed, damage, projectileAmount, scale)
    -- self:debugLevel(10)
    self.x = x
    self.y = y
end

function SimpleCannon:changeLevel()
    self.level += 1
    if self.level == 2 then
        self.damage += 0.1
        self.attackSpeed -= 25
        self.scale += 0.1
    end
    if self.level == 3 then
        self.speed += 0.25
    end
    if self.level == 4 then
        self.attackSpeed -= 50
        self.scale += 0.1
    end
    if self.level == 5 then
        self.projectileAmount += 1
        self.damage += 0.1
    end
    if self.level == 6 then
        self.attackSpeed -= 25
        self.scale += 0.1
        self.speed += 0.25
    end
    if self.level == 7 then
        self.damage += 0.15
    end
    if self.level == 8 then
        self.attackSpeed -= 50
        self.scale += 0.1
        self.speed += 0.5
    end
    if self.level == 9 then
        self.damage += 0.15
        self.scale += 0.2
        self.speed += 0.5

    end
    if self.level == 10 then
        self.projectileAmount += 1
        self.damage += 0.5
        self.attackSpeed -= 50
        self.scale += 0.5
        self.speed += 1
    end
end

function SimpleCannon:shoot()
    SimpleCannon.super.shoot()
  
    local angles = cutAngle(self.projectileAmount + player.projectileAmount)
    for key, angle in ipairs(angles) do
        bullet = Bullet(self.x, self.y, self.speed, self.damage, angle, self.scale, nil, gfx.image.new("images/bullets/bullet_cannon" ))
    end
end