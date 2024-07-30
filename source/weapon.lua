class("Weapon").extends()


function Weapon:init(attackSpeed)
    self.attackSpeed = attackSpeed
    self.level = 1
    self:startShooting()
end

function Weapon:startShooting()
    playdate.timer.performAfterDelay(self.attackSpeed-((self.attackSpeedBonus*self.attackSpeed)/100), function()
        self:shoot()
        self:startShooting()
    end)
end

function Weapon:levelUp()
    self.level += 1
end

function Weapon:shoot()
end