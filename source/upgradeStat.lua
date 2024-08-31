class("UpgradeStat").extends(Upgrade)
table.insert(Upgrade.types, UpgradeStat)

function UpgradeStat:init(stats, descriptionText, image, count, rarity, inventory)
    UpgradeStat.super.init(self, descriptionText, image, count, rarity)
    self.stats = stats
    self.inventory = inventory
end

function UpgradeStat:updateDescriptionText()
end

function UpgradeStat:update()
    UpgradeStat.super.update(self)
end

function UpgradeStat:applyUpgrade()
    UpgradeStat.super.applyUpgrade(self)
    table.each(self.stats, function (stat)
        player[stat.name] += stat.value
    end)
    if table.contains(player.passives, self) == false and self.inventory == nil then
        table.insert(player.passives, self)
        player.passiveNumber += 1
    end
end