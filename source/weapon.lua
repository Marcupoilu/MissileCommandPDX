class("Weapon").extends()


function Weapon:init(attackSpeed, speed, damage, projectileAmount, scale, duration)
    self.attackSpeed = attackSpeed
    self.duration = duration
    self.speed = speed
    self.level = 1
    self.scale = scale
    self.damage = damage
    self.projectileAmount = projectileAmount
    self.timer = nil
    -- self:startShooting()
end

function Weapon:debugLevel(level)
    for i = 1, level-1, 1 do
        self:changeLevel()
    end
end

function Weapon:startShooting()
    self.timer = playdate.timer.new(self.attackSpeed-((player.attackSpeedBonus*self.attackSpeed)/100), function()
        self:shoot()
    end)
    if not self.timer.repeats then
        self.timer.repeats = true
    end
end

function Weapon:shoot()
end