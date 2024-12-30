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
        self.attackSpeed -= 500
        self.damage += 0.5
    end
    if self.level == 3 then
        self.damage += 0.5
    end
    if self.level == 4 then
        self.attackSpeed -= 500
    end
    if self.level == 5 then
        self.attackSpeed -= 1000
        self.damage += 0.5
    end
    if self.level == 6 then
        self.damage += 0.5
    end
    if self.level == 7 then
        self.attackSpeed -= 500
        self.damage += 0.5
    end
    if self.level == 8 then
        self.attackSpeed -= 500
    end
    if self.level == 9 then
        self.damage += 0.5
    end
    if self.level == 10 then
        self.attackSpeed -= 2000
        self.damage += 1
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