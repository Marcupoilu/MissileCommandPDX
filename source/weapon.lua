class("Weapon").extends()


function Weapon:init(attackSpeed)
    self.attackSpeed = attackSpeed
    self:startShooting()
end

function Weapon:startShooting()
    playdate.timer.performAfterDelay(self.attackSpeed, function()
        self:shoot()
        self:startShooting()
    end)
end

function Weapon:shoot()
end