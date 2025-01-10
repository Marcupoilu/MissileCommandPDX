class("Cannon").extends()

function Cannon:init(name, weapons, cost, image, imageBase, id)
    Cannon.super.init(self)
    self.name = name
    self.weapons = weapons
    self.cost = cost
    self.image = image
    self.imageBase = imageBase
    self.id = id
end

function Cannon:update()
    Cannon.super.update(self)
end