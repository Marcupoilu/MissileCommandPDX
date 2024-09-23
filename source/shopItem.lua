class("ShopItem").extends()

function ShopItem:init(name,unlock, cost, level, levelMax, multiplyer)
    ShopItem.super.init(self)
    self.name = name
    self.unlock = unlock
    self.cost = cost
    self.level = level
    self.levelMax = levelMax
    self.multiplyer = multiplyer
end

function ShopItem:buy()
    
end