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
        success = false,
        cannons = {table.findByParam(cannonsData, "id", "blaster"),table.findByParam(cannonsData, "id", "laser")},
        unlocks = {table.findByParam(unlocksData, "name", "Orbital"),table.findByParam(unlocksData, "name", "Aura"),table.findByParam(unlocksData, "name", "Duration"),table.findByParam(unlocksData, "name", "Life Up"),table.findByParam(unlocksData, "name", "Laser"), table.findByParam(unlocksData, "name", "Orbiter")},
        shopUnlocks = {
            table.findByParam(upgradesData, "type", "SimpleCannon"),
            table.findByParam(upgradesData, "type", "Beam"),
            table.findByParam(upgradesData, "type", "Rocket"),
            table.findByParam(upgradesData, "type", "Plasma"),
            getUpgradePassive("projectileSpeedBonus"),
            getUpgradePassive("scaleBonus"),
            getUpgradePassive("hpMax"),
            getUpgradePassive("damageBonus")
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
            if upgrade.className == "UpgradeWeapon" then
                table.insert(self.gameData.shopUnlocks, table.findByParam(upgradesData, "type", upgrade.type ))
            end
            if upgrade.className == "UpgradeStat" then
                getUpgradePassiveByName(upgrade.name)
            end
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