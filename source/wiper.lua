class("Wiper").extends(Weapon)

function Wiper:init(attackSpeed, x, y, speed, damage, projectileAmount, scale, duration)
    Wiper.super.init(self, attackSpeed, speed, damage, projectileAmount, scale)
    self.x = x
    self.duration = duration
    self.y = y
    -- self:debugLevel(10)
end

function Wiper:changeLevel()
    self.level += 1
    if self.level == 2 then
        self.attackSpeed -= 2000
    end
    if self.level == 3 then
        self.damage += 3
    end
    if self.level == 4 then
        self.attackSpeed -= 2000
    end
    if self.level == 5 then
        self.attackSpeed -= 1000
        self.damage += 3
    end
end

function Wiper:shoot()
    Wiper.super.shoot()
    shake:setShakeAmount(30)
    gfx.clear(gfx.kColorWhite)
    enemiesCopy = table.shallowcopy(enemies)
    for key, value in pairs(enemiesCopy) do
        enemyManager:touchEnemy(self, value, true)
    end
end