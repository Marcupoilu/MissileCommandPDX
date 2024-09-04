class("UnlockPassive").extends(Unlock)

function UnlockPassive:init(name, image, description, condition, upgrade)
    UnlockPassive.super.init(self,name, image, description, condition, upgrade)
end

function UnlockPassive:applyUnlock()
    UnlockPassive.super.applyUnlock(self)
end