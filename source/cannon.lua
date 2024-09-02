class("Cannon").extends()

function Cannon:init(name, weapons, passives, cost, image)
    Cannon.super.init(self)
    self.name = name
    self.weapons = weapons
    self.passives = passives
    self.cost = cost
    self.image = image
end

function Cannon:update()
    Cannon.super.update(self)
end