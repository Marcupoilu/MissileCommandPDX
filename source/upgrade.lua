class("Upgrade").extends()
Upgrade.types = {}

function Upgrade:init(descriptionText, image, count, rarity)
    Upgrade.super.init(self)
    self.descriptionText = descriptionText
    self.path = image
    self.image = gfx.image.new(image)
    self.countMax = count
    self.count = count
    self.rarity = rarity
end

function Upgrade:updateDescriptionText()
end

function Upgrade:update()
    Upgrade.super.update(self)
end

function Upgrade:applyUpgrade()
    self.count -= 1
end