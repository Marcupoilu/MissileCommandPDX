class("UpgradeWeapon").extends(Upgrade)
table.insert(Upgrade.types, UpgradeWeapon)


function UpgradeWeapon:init(weapon, type, name, descriptionText, image)
    UpgradeWeapon.super.init(self, descriptionText, image)
    self.weapon = nil
    self.type = type
    for key, value in pairs(player.weapons) do
        if value["className"] == type then
            self.weapon = value
            self.descriptionText = weapon.." \n        level  "..value.level+1
            return
        end
    end
        self.descriptionText = "New weapon : "..string.char(10)..name
end

function UpgradeWeapon:update()
    UpgradeWeapon.super.update(self)
end

function UpgradeWeapon:ApplyUpgrade()
    
    if self.weapon ~= nil then
        table.findByParam(player.weapons,"className", self.type).level += 1
    else
        table.insert(player.weapons, _G[type]())
    end
end