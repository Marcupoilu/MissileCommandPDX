class("SimpleCannon").extends(Weapon)


function SimpleCannon:init(attackSpeed, x, y)
    SimpleCannon.super.init(self, attackSpeed)
    self.x = x
    self.y = y
end

function SimpleCannon:shoot()
    SimpleCannon.super.shoot()
    bullet = Bullet(self.x, self.y, 5, 1)
    -- bullet:init(self.x, self.y, 1)
end