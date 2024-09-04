class("UnlockCannon").extends(Unlock)

function UnlockCannon:init(name, image, description, condition, upgrade)
    UnlockCannon.super.init(self,name, image, description, condition, upgrade)
end

function UnlockCannon:applyUnlock()
    UnlockCannon.super.applyUnlock(self)
end