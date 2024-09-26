class("PlayerBonus").extends()

function PlayerBonus:init()
    -- playdate.datastore.delete()
    self:start()
end

function PlayerBonus:start()
    self.gameData = 
    {
        hpMax = 0,
        shield = 0,
        xpBonus = 0,
        damageBonus = 0,
        attackSpeedBonus = 0,
        scaleBonus = 0, 
        projectileAmount = 0,
        regenerationRate = 0,
        projectileSpeedBonus = 0,
        durationBonus = 0,
        lives = 0,
        rerolls = 0,
        enemiesKilled = 0,
        levelMaxReached = 1,
        mapCount = 1,
        core = 1000,
        success = false,
        cannons = {table.findByParam(cannonsData, "id", "blaster")},
        unlocks = {},
        shopUnlocks = {
            table.findByParam(upgradesData, "type", "SimpleCannon"),
            table.findByParam(upgradesData, "type", "Beam"),
            table.findByParam(upgradesData, "type", "Rocket"),
            table.findByParam(upgradesData, "type", "Plasma"),
            getUpgradePassive("projectileSpeedBonus"),
            getUpgradePassive("scaleBonus"),
            getUpgradePassive("hpMax"),
            getUpgradePassive("damageBonus")
        },
        shopItems = {
            table.findByParam(shopItemsData, "name", "Speed Up"),
            table.findByParam(shopItemsData, "name", "Scale Up"),
            table.findByParam(shopItemsData, "name", "HP Up"),
            table.findByParam(shopItemsData, "name", "Damage Up")
        }
    }

    gameDataLoad = playdate.datastore.read()
    if gameDataLoad then
        self.gameData = gameDataLoad
        -- unserialize cannons
        local cannons = table.shallowcopy(self.gameData.cannons)
        self.gameData.cannons = {}
        table.each(cannons, function (cannon)
            table.insert(self.gameData.cannons, table.findByParam(cannonsData, "id", cannon.id ))
        end)

        -- unserialize unlocks 
        local unlocks = table.shallowcopy(self.gameData.unlocks)
        self.gameData.unlocks = {}
        table.each(unlocks, function (unlock)
            table.insert(self.gameData.unlocks, table.findByParam(unlocksData, "name", unlock.name ))
        end)

        -- unserialize unlocks 
        local shopUnlocks = table.shallowcopy(self.gameData.shopUnlocks)
        self.gameData.shopUnlocks = {}
        table.each(shopUnlocks, function (upgrade)
            if upgrade.super.className == "UpgradeWeapon" then
                table.insert(self.gameData.shopUnlocks, table.findByParam(upgradesData, "type", upgrade.type ))
            end
            if upgrade.super.className == "UpgradeStat" then
                table.insert(self.gameData.shopUnlocks, getUpgradePassiveByName(upgrade.name))
            end
        end)

        -- unserialize upgrades 
        local shopItems = table.shallowcopy(self.gameData.shopItems)
        
        self.gameData.shopItems = {}
        table.each(shopItems, function (shopItem)
            shopItem.unlock = table.findByParam(unlocksData, "name", shopItem.name)
            if shopItem.name == "Speed Up" then
                shopItem.unlock = UnlockPassive("Speed Up", gfx.image.new("images/ui/icons/projectileSpeed"), "", nil, getUpgradePassive("projectileSpeedBonus"), "+10% Projectile Speed")
            end
            if shopItem.name == "Scale Up" then
                shopItem.unlock = UnlockPassive("Scale Up", gfx.image.new("images/ui/icons/projectileScale"), "", nil, getUpgradePassive("scaleBonus"), "+10% Projectile Scale")
            end
            if shopItem.name == "HP Up" then
                shopItem.unlock = UnlockPassive("HP Up", gfx.image.new("images/ui/icons/hpMax"), "", nil, getUpgradePassive("hpMax"), "+10 HP")
            end
            if shopItem.name == "Damage Up" then
                shopItem.unlock = UnlockPassive("Damage Up", gfx.image.new("images/ui/icons/damageUp"), "", nil, getUpgradePassive("damageBonus"), "+10% Damage Bonus")
            end
            table.insert(self.gameData.shopItems, shopItem)
        end)
    end
end

function PlayerBonus:saveGame()
    playdate.datastore.write(self.gameData)
end

function playdate.gameWillTerminate()
    print("terminate")
    playerBonus:saveGame()
end

function playdate.deviceWillSleep()
    playerBonus:saveGame()
end

function PlayerBonus:addPassive(passive)
    table.each(passive.stats, function (stat)
        self.gameData[stat.name] += stat.value
    end)
end