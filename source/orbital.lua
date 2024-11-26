import "bulletOrbital.lua"

class("Orbital").extends(Weapon)


function Orbital:init(attackSpeed, x, y, speed, damage, projectileAmount, scale, duration)
    Orbital.super.init(self, attackSpeed, speed, damage, projectileAmount, scale, duration)
    -- self:debugLevel(10)
    self.x = x
    self.y = y
end

function Orbital:changeLevel()
    self.level += 1
    if self.level == 2 then
        self.attackSpeed -= 100
        self.scale += 0.1
        self.damage += 0.5
    end
    if self.level == 3 then
        self.attackSpeed -= 100
        self.speed += 0.5
    end
    if self.level == 4 then
        self.attackSpeed -= 100
        self.scale += 0.1
    end
    if self.level == 5 then
        self.attackSpeed -= 100
        self.projectileAmount += 1
        self.scale += 0.1
        self.damage += 0.5
    end
    if self.level == 6 then
        self.attackSpeed -= 100
        self.speed += 0.5
    end
    if self.level == 7 then
        self.attackSpeed -= 100
        self.scale += 0.1
        self.damage += 0.5
    end
    if self.level == 8 then
        self.attackSpeed -= 100
    end
    if self.level == 9 then
        self.attackSpeed -= 100
        self.scale += 0.1
    end
    if self.level == 10 then
        self.attackSpeed -= 200
        self.projectileAmount += 1
        self.scale += 0.5
        self.speed += 1
        self.damage += 1
    end
end

function Orbital:shoot()
    Orbital.super.shoot()
    local angles = cutAngle(self.projectileAmount + player.projectileAmount)
    for key, angle in ipairs(angles) do
        bulletOrbital = BulletOrbital(self.x, self.y, self.speed, self.damage, angle, self.scale, self.duration, gfx.image.new("images/bullets/bullet_orbital" ))
        playdate.timer.new(200, function ()
            BulletOrbital(self.x, self.y, self.speed, self.damage, angle, self.scale, self.duration, gfx.image.new("images/bullets/bullet_orbital" ), bulletOrbital.originAngle, bulletOrbital.originPosition)
            playdate.timer.new(200, function ()
                BulletOrbital(self.x, self.y, self.speed, self.damage, angle, self.scale, self.duration, gfx.image.new("images/bullets/bullet_orbital" ),bulletOrbital.originAngle, bulletOrbital.originPosition)
            end)
        end)
    end
end