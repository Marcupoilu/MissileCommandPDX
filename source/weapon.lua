class("Weapon").extends()


function Weapon:init(attackSpeed, speed, damage, projectileAmount, scale, duration)
    self.attackSpeed = attackSpeed
    self.duration = duration
    self.speed = speed
    self.level = 1
    self.scale = scale
    self.damage = damage
    self.projectileAmount = projectileAmount
    self.timer = 0
    self.started = false
    self.originAttackSpeed = attackSpeed
    self.originDuration = duration
    self.originSpeed = speed
    self.originLevel = 1
    self.originScale = scale
    self.originDamage = damage
    self.originProjectileAmount = projectileAmount
    -- self:startShooting()
end

function Weapon:reset()
    self.attackSpeed = self.originAttackSpeed
    self.duration = self.originDuration
    self.speed = self.originSpeed
    self.level = self.originLevel
    self.scale = self.originScale
    self.damage = self.originDamage
    self.projectileAmount = self.originProjectileAmount
    self.started = false
end

function Weapon:debugLevel(level)
    for i = 1, level-1, 1 do
        self:changeLevel()
    end
end

function Weapon:startShooting()
    -- self.timer = playdate.timer.new(self.attackSpeed-((player.attackSpeedBonus*self.attackSpeed)/100), function()
    --     self:shoot()
    -- end)
    -- if not self.timer.repeats then
    --     self.timer.repeats = true
    -- end
    self.timer = self.attackSpeed-((player.attackSpeedBonus*self.attackSpeed)/100)
    self.started = true
end

function Weapon:update()
    if self.started then
        self.timer -= refreshRate
        if self.timer <= 0 then
            self:shoot()
            self.timer = self.attackSpeed-((player.attackSpeedBonus*self.attackSpeed)/100)
        end
    end
end

function Weapon:shoot()
end