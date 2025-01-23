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
        local bullet = BulletPool:get(BulletOrbital)
        if bullet then
            bullet:reset(self.x, self.y, self.speed, self.damage, angle, self.scale, self.duration)
        else
            bullet = BulletOrbital(self.x, self.y, self.speed, self.damage, angle, self.scale, self.duration)
            BulletPool:release(bullet) -- On l'ajoute au pool pour la prochaine fois
        end
        -- if bullet == nil then return end
        playdate.timer.new(200, function ()
            local bullet2 = BulletPool:get(BulletOrbital)
            if bullet2 then
                bullet2:reset(self.x, self.y, self.speed, self.damage, angle, self.scale, self.duration, bullet.originAngle, bullet.originPosition)
            else
                BulletOrbital(self.x, self.y, self.speed, self.damage, angle, self.scale, self.duration, bullet.originAngle, bullet.originPosition)
                BulletPool:release(bullet2) -- On l'ajoute au pool pour la prochaine fois
            end
            playdate.timer.new(200, function ()
                local bullet3 = BulletPool:get(BulletOrbital)
                if bullet3 then
                    bullet3:reset(self.x, self.y, self.speed, self.damage, angle, self.scale, self.duration, bullet.originAngle, bullet.originPosition)
                else
                    BulletOrbital(self.x, self.y, self.speed, self.damage, angle, self.scale, self.duration, bullet.originAngle, bullet.originPosition)
                    BulletPool:release(bullet3) -- On l'ajoute au pool pour la prochaine fois
                end
            end)
        end)
    end
end