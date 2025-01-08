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
        self.speed += 10
        self.scale += 0.25
    end
    if self.level == 3 then
        self.projectileAmount += 1
        self.damage += 0.5
    end
    if self.level == 4 then
        self.attackSpeed -= 1000
        self.damage += 0.5
    end
    if self.level == 5 then
        self.projectileAmount += 1
        self.speed += 10
        self.scale += 0.25
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