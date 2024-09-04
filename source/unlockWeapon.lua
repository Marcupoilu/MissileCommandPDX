class("UnlockWeapon").extends(Unlock)

function UnlockWeapon:init(name, image, description, condition, upgrade)
    UnlockWeapon.super.init(self,name, image, description, condition, upgrade)
end

function UnlockWeapon:applyUnlock()
    UnlockWeapon.super.applyUnlock(self)
end