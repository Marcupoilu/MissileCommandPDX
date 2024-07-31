class("Weapon").extends()


function Weapon:init(attackSpeed, damage)
    self.attackSpeed = attackSpeed
    self.level = 1
    self.damage = damage
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