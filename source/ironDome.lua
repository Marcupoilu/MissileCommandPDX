class("IronDome").extends(Weapon)

function IronDome:init(attackSpeed, x, y, damage, projectileAmount, scale, duration)
    IronDome.super.init(self, attackSpeed, damage, projectileAmount, scale)
    self.speed = 4
    self.x = x
    self.duration = duration
    self.y = y
    -- self:debugLevel(10)
end

function IronDome:changeLevel()
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

function IronDome:shoot()
    IronDome.super.shoot()
    shake:setShakeAmount(30)
    gfx.clear(gfx.kColorWhite)
    
end