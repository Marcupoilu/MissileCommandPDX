class("SimpleCannon").extends(Weapon)


function SimpleCannon:init(attackSpeed, x, y, damage)
    SimpleCannon.super.init(self, attackSpeed, damage)
    self.x = x
    self.y = y
end

function SimpleCannon:shoot()
    SimpleCannon.super.shoot()
    bullet = Bullet(self.x, self.y, 5, self.damage+((player.damageBonus*self.damage)/100))
end