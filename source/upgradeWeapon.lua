class("UpgradeWeapon").extends(Upgrade)
table.insert(Upgrade.types, UpgradeWeapon)


function UpgradeWeapon:init(weapon, type, name, descriptionText, image)
    print(descriptionText)
    UpgradeWeapon.super.init(self, descriptionText, image)
    self.weapon = weapon
    self.type = type
    if player.weapons[weapon] ~= nil then
        self.descriptionText = weapon.." level : "..player.weapons[weapon].level+1
    else
        self.descriptionText = "New weapon : "..string.char(10)..name
    end
end

function UpgradeWeapon:update()
    UpgradeWeapon.super.update(self)
end

function UpgradeWeapon:ApplyUpgrade()
    
    if player.weapons[weapon] ~= nil then
        player.weapons[weapon].level += 1
    else
        table.insert(player.weapons, self.type())
    end
end