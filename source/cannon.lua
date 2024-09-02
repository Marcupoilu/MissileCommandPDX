class("Cannon").extends()

function Cannon:init(name, weapons, passives, cost)
    Cannon.super.init(self)
    self.name = name
    self.weapons = weapons
    self.passives = passives
    self.cost = cost
end

function Cannon:update()
    Cannon.super.update(self)
end