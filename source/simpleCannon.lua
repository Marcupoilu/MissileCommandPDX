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
        self.damage += 0.5
        self.scale += 0.25
    end
    if self.level == 3 then
        self.projectileAmount += 1
        self.speed += 2
    end
    if self.level == 4 then
        self.attackSpeed -= 100
        self.scale += 0.25
        self.speed += 3
    end
    if self.level == 5 then
        self.projectileAmount += 1
        self.damage += 0.5
        self.attackSpeed -= 100
    end
end

function SimpleCannon:shoot()
    SimpleCannon.super.shoot()
  
    local angles = cutAngle(self.projectileAmount + player.projectileAmount)
    for key, angle in ipairs(angles) do
        local bullet = BulletPool:get(Bullet)
        if bullet then
            bullet:reset(self.x, self.y, self.speed, self.damage, angle, self.scale, toMilliseconds(3), gfx.image.new("images/bullets/bullet_cannon" ))
        else
            bullet = Bullet(self.x, self.y, self.speed, self.damage, angle, self.scale, toMilliseconds(3), gfx.image.new("images/bullets/bullet_cannon" ))
            BulletPool:release(bullet) -- On l'ajoute au pool pour la prochaine fois
        end    
    end
end