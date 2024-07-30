class("UpgradeWeapon").extends(Upgrade)
table.insert(Upgrade.types, UpgradeWeapon)


function UpgradeWeapon:init(weapon)
    UpgradeWeapon.super.init(self)
end

function UpgradeWeapon:update()
    UpgradeWeapon.super.update(self)
end

function UpgradeWeapon:ApplyUpgrade()
end