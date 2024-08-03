class("UpgradeWeapon").extends(Upgrade)
table.insert(Upgrade.types, UpgradeWeapon)


function UpgradeWeapon:init(weapon, type, name, descriptionText, image)
    UpgradeWeapon.super.init(self, descriptionText, image)
    self.weapon = nil
    self.type = type
    self.name = name
    self:updateDescriptionText()
end

function UpgradeWeapon:updateDescriptionText()
    if player == nil then
        return
    end
    for key, value in pairs(player.weapons) do
        if value["className"] == self.type then
            self.weapon = value
            self.descriptionText = self.name.." \n        level  "..value.level+1
            return
        end
    end
        self.descriptionText = "New weapon : "..string.char(10)..self.name
end

function UpgradeWeapon:update()
    UpgradeWeapon.super.update(self)
end

function UpgradeWeapon:applyUpgrade()
    
    if self.weapon ~= nil then
        table.findByParam(player.weapons,"className", self.type):changeLevel()
    else
        table.insert(player.weapons, _G[type]())
    end
end