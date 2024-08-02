class("Upgrade").extends()
Upgrade.types = {}

function Upgrade:init(descriptionText, image)
    Upgrade.super.init(self)
    self.descriptionText = descriptionText
    self.image = gfx.image.new(image)
end

function Upgrade:updateDescriptionText()
end

function Upgrade:update()
    Upgrade.super.update(self)
end

function Upgrade:applyUpgrade()
end