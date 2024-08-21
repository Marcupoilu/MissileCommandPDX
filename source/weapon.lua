class("Weapon").extends()


function Weapon:init(attackSpeed, speed, damage, projectileAmount, scale, duration)
    self.attackSpeed = attackSpeed
    self.duration = duration
    self.speed = speed
    self.level = 1
    self.scale = scale
    self.damage = damage
    self.projectileAmount = projectileAmount
    -- self:startShooting()
end

function Weapon:debugLevel(level)
    for i = 1, level-1, 1 do
        self:changeLevel()
    end
end

function Weapon:startShooting()
    playdate.timer.new(self.attackSpeed-((player.attackSpeedBonus*self.attackSpeed)/100), function()
        self:shoot()
        self:startShooting()
    end)
end

function Weapon:shoot()
end