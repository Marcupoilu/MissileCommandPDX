class("Beam").extends(Weapon)

function Beam:init(attackSpeed, x, y, speed, damage, projectileAmount, scale, duration)
    Beam.super.init(self, attackSpeed, speed, damage, projectileAmount, scale)
    self.x = x
    self.duration = duration
    self.y = y
    -- self:debugLevel(10)
end

function Beam:changeLevel()
    self.level += 1
    if self.level == 2 then
        self.damage += 0.5
        self.scale += 0.25
    end
    if self.level == 3 then
        self.projectileAmount += 1
        self.duration += 500
    end
    if self.level == 4 then
        self.scale += 0.25
        self.damage += 0.5
    end
    if self.level == 5 then
        self.projectileAmount += 1
        self.damage += 0.5
        self.attackSpeed -= 500
    end
end

function Beam:shoot()
    Beam.super.shoot()
    local angles = cutAngle(self.projectileAmount + player.projectileAmount)
    soundSamplerLaserBeam:play(0)
    for key, angle in ipairs(angles) do
        local bullet = BulletPool:get(BulletBeam)
        if bullet then
            bullet:reset(self.x, self.y, self.speed, self.damage, angle, self.scale, self.duration)
        else
            bullet = BulletBeam(self.x, self.y, self.speed, self.damage, angle, self.scale, self.duration)
            BulletPool:release(bullet) -- On l'ajoute au pool pour la prochaine fois
        end
    end
end