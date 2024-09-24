class("UnlockPassive").extends(Unlock)

function UnlockPassive:init(name, image, description, condition, upgrade, descriptionUnlocked, cost, level,levelMax,multiplyer)
    UnlockPassive.super.init(self,name, image, description, condition, upgrade, descriptionUnlocked, cost, level,levelMax,multiplyer)
end

function UnlockPassive:applyUnlock()

    UnlockPassive.super.applyUnlock(self)
end