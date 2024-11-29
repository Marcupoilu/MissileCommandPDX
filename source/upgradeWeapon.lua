class("UpgradeWeapon").extends(Upgrade)
table.insert(Upgrade.types, UpgradeWeapon)


function UpgradeWeapon:init(type, name, descriptionText, image, count, rarity)
    UpgradeWeapon.super.init(self, descriptionText, image, count, rarity)
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
            self.descriptionText = string.upper(self.name).."\nlevel  "..value.level+1
            return
        end
    end
    self.weapon = nil
    self.descriptionText = "NEW WEAPON"..string.char(10)..self.name
end

function UpgradeWeapon:update()
    UpgradeWeapon.super.update(self)
end

function UpgradeWeapon:applyUpgrade()
    UpgradeWeapon.super.applyUpgrade(self)
    self:updateDescriptionText()
    if self.weapon ~= nil then
        table.findByParam(player.weapons,"className", self.type):changeLevel()
    else
        player:addWeapon(table.findByParam(weaponsData, "className", self.type))
        table.findByParam(weaponsData, "className", self.type):shoot()
    end
end