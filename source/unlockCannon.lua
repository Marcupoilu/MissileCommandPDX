class("UnlockCannon").extends(Unlock)

function UnlockCannon:init(name, image, description, condition, upgrade, descriptionUnlocked, cost, level,levelMax,multiplyer)
    UnlockCannon.super.init(self,name, image, description, condition, upgrade, descriptionUnlocked, cost, level,levelMax,multiplyer)
end

function UnlockCannon:applyUnlock()
    UnlockCannon.super.applyUnlock(self)
end