class("Unlock").extends()

function Unlock:init(name, image, description, condition, upgrade, descriptionUnlocked)
    Unlock.super.init(self)
    self.name = name
    self.image = image
    self.description = description
    self.descriptionUnlocked = descriptionUnlocked
    self.condition = condition
    self.unlocked = false
    self.upgrade = upgrade
end

function Unlock:applyUnlock()
    self.unlocked = true
    table.insert(playerBonus.gameData.unlocks, self)
    if upgrade ~= nil and self.className ~= "UnlockCannon" then
        table.insert(playerBonus.gameData.shopUnlocks, upgrade)
    end
end