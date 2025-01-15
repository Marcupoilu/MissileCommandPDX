class("UpgradeStat").extends(Upgrade)
table.insert(Upgrade.types, UpgradeStat)

function UpgradeStat:init(stats, descriptionText, image, count, rarity, inventory, name)
    UpgradeStat.super.init(self, descriptionText, image, count, rarity)
    self.stats = stats
    self.baseDescription = descriptionText
    self.inventory = inventory
    self.name = name
end

function UpgradeStat:updateDescriptionText()
    if player == nil then
        return
    end
    for key, value in pairs(player.passives) do
        if value["name"] == self.name then
            self.descriptionText = string.upper(self.baseDescription).."\nlevel  "..value.countMax - value.count +1
            return
        end
    end
    self.descriptionText = "NEW PASSIVE"..string.char(10)..self.baseDescription
end

function UpgradeStat:update()
    UpgradeStat.super.update(self)
end

function UpgradeStat:applyUpgrade()
    UpgradeStat.super.applyUpgrade(self)
    player:addPassive(self)
end