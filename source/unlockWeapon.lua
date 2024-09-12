class("UnlockWeapon").extends(Unlock)

function UnlockWeapon:init(name, image, description, condition, upgrade, descriptionUnlocked)
    UnlockWeapon.super.init(self,name, image, description, condition, upgrade, descriptionUnlocked)
end

function UnlockWeapon:applyUnlock()
    UnlockWeapon.super.applyUnlock(self)
end