class("UpgradeWeapon").extends(Upgrade)
table.insert(Upgrade.types, UpgradeWeapon)


function UpgradeWeapon:init(weapon)
    UpgradeWeapon.super.init(self)
    self.weapon = weapon
end

function UpgradeWeapon:update()
    UpgradeWeapon.super.update(self)
end

function UpgradeWeapon:ApplyUpgrade()
    
    if player.weapons["weapon"] ~= nil then
        player.weapons["weapon"].level += 1
    else
        table.insert(player.weapons, self.weapon())
    end
end