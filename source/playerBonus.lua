class("PlayerBonus").extends()

function PlayerBonus:init()
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
        cannons = {table.findByParam(cannonsData, "name", "Defender"),table.findByParam(cannonsData, "name", "Blaster")},
        unlocks = {},
        shopUnlocks = {
            table.findByParam(upgradesData, "type", "SimpleCannon"),
            table.findByParam(upgradesData, "type", "Beam"),
            table.findByParam(upgradesData, "type", "Rocket"),
            table.findByParam(upgradesData, "type", "Rocket"),
            getUpgradePassive("projectileSpeedBonus"),
            getUpgradePassive("scaleBonus"),
            getUpgradePassive("hpMax"),
            getUpgradePassive("damageBonus")
        }
    }

    gameDataLoad = playdate.datastore.read()
    if gameDataLoad then
        self.gameData = gameDataLoad
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