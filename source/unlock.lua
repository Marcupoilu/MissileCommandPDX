class("Unlock").extends()

function Unlock:init(name, image, description, condition, upgrade, descriptionUnlocked, cost, level, levelMax, multiplyer)
    Unlock.super.init(self)
    self.name = name
    self.image = image
    self.description = description
    self.descriptionUnlocked = descriptionUnlocked
    self.condition = condition
    self.unlocked = false
    self.upgrade = upgrade
    self.cost = cost
    self.level = level
    self.levelMax = levelMax
    self.multiplyer = multiplyer
end

function Unlock:applyUnlock()
    self.unlocked = true
    table.insert(playerBonus.gameData.unlocks, self)
    table.each(shopItemsData, function (shopItem)
        if shopItem.unlock == self then
            table.insert(playerBonus.gameData.shopItems, shopItem)
        end
    end)
    if self.upgrade ~= nil and self.className ~= "UnlockCannon" then
        table.insert(playerBonus.gameData.shopUnlocks, self.upgrade)
    end
end