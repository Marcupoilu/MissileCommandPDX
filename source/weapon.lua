class("Weapon").extends()


function Weapon:init(attackSpeed, damage, projectileAmount, scale)
    self.attackSpeed = attackSpeed
    self.level = 1
    self.scale = scale
    self.damage = damage
    self.projectileAmount = projectileAmount
    self:startShooting()
end

function Weapon:startShooting()
    playdate.timer.performAfterDelay(self.attackSpeed-((player.attackSpeedBonus*self.attackSpeed)/100), function()
        self:shoot()
        self:startShooting()
    end)
end

function Weapon:shoot()
end