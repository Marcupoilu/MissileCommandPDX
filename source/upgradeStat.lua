class("UpgradeStat").extends(Upgrade)
table.insert(Upgrade.types, UpgradeStat)

function UpgradeStat:init(stats, descriptionText, image, count, rarity, inventory, name)
    UpgradeStat.super.init(self, descriptionText, image, count, rarity)
    self.stats = stats
    self.inventory = inventory
    self.name = name
end

function UpgradeStat:updateDescriptionText()
end

function UpgradeStat:update()
    UpgradeStat.super.update(self)
end

function UpgradeStat:applyUpgrade()
    UpgradeStat.super.applyUpgrade(self)
    player:addPassive(self)
end