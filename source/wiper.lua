class("Wiper").extends(Weapon)

function Wiper:init(attackSpeed, x, y, damage, projectileAmount, scale, duration)
    Wiper.super.init(self, attackSpeed, damage, projectileAmount, scale)
    self.speed = 4
    self.x = x
    self.duration = duration
    self.y = y
    -- self:debugLevel(10)
end

function Wiper:changeLevel()
    self.level += 1
    if self.level == 2 then
        self.attackSpeed -= 10
    end
    if self.level == 3 then
        self.attackSpeed -= 10
    end
    if self.level == 4 then
        self.attackSpeed -= 10
        self.scale += 1
    end
    if self.level == 5 then
        self.attackSpeed -= 10
    end
    if self.level == 6 then
        self.attackSpeed -= 10
    end
    if self.level == 7 then
        self.attackSpeed -= 10
    end
    if self.level == 8 then
        self.attackSpeed -= 10
    end
    if self.level == 9 then
        self.attackSpeed -= 10
    end
    if self.level == 10 then
        self.attackSpeed -= 50
    end
end

function Wiper:shoot()
    Wiper.super.shoot()
    shake:setShakeAmount(30)
    gfx.clear(gfx.kColorWhite)
    table.each(enemies, function(x)
        x:loseHp(self.damage)
    end)
end