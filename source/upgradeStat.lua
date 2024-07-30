class("UpgradeStat").extends(Upgrade)
table.insert(Upgrade.types, UpgradeStat)

function UpgradeStat:init(stat, value, descriptionText, image)
    UpgradeStat.super.init(self)
    self.stat = stat
    self.value = value
end

function UpgradeStat:update()
    UpgradeStat.super.update(self)
end

function UpgradeStat:ApplyUpgrade()
    player[self.stat] = value
end