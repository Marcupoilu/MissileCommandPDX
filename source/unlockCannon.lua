class("UnlockCannon").extends(Unlock)

function UnlockCannon:init(name, image, description, condition, upgrade, descriptionUnlocked)
    UnlockCannon.super.init(self,name, image, description, condition, upgrade, descriptionUnlocked)
end

function UnlockCannon:applyUnlock()
    UnlockCannon.super.applyUnlock(self)
end