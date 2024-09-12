class("UnlockPassive").extends(Unlock)

function UnlockPassive:init(name, image, description, condition, upgrade, descriptionUnlocked)
    UnlockPassive.super.init(self,name, image, description, condition, upgrade, descriptionUnlocked)
end

function UnlockPassive:applyUnlock()
    UnlockPassive.super.applyUnlock(self)
end