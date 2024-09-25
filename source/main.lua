gfx = playdate.graphics

import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"
import "CoreLibs/animation"
import "mathExtensions.lua"
import "animationsData.lua"
import "tableExtensions.lua"
import "sequence.lua"
import "pdParticles.lua"
import "screenShake.lua"
import "spriteShake.lua"
import "player.lua"
import "weaponsSource.lua"
import "bulletDroneLaser.lua"
import "enemiesData.lua"
import "enemy.lua"
import "spawner.lua"
import "enemiesSource.lua"
import "enemySpawnerBase.lua"
import "saucerSpawner.lua"
import "enemySpawner.lua"
import "wave.lua"
import "wavesData.lua"
import "game.lua"
import "horizontalLayout.lua"
import "uiSprite.lua"
import "ui.lua"
import "upgrade.lua"
import "upgradeStat.lua"
import "upgradeWeapon.lua"
import "uiManager.lua"
import "upgradesData.lua"
import "weaponsData.lua"
CreateWeaponsData()
import "cannon.lua"
import "cannonsData.lua"
import "condition.lua"
import "conditionWeaponLevel.lua"
import "unlock.lua"
import "unlockWeapon.lua"
import "unlockPassive.lua"
import "unlockCannon.lua"
import "unlocksData.lua"
import "shopItem"
import "shopItemsData"
import "playerBonus.lua"

-- playdate.display.setRefreshRate(50)
p = ParticleCircle(0,0)
pWeapon = ParticleCircle(0,0)
pFlamethrower = ParticleCircle(0,0)
-- Collections --
particles = {}
upgrades = upgradesData
enemies = {}
debugRects = {}
beams = {}
bullets = {}
-- Managers -- 
shake = ScreenShake()
uiManager = UiManager()

targetTime = 15*60
time = 0
deltaTime = 0
crankPosition = playdate.getCrankPosition()
game = nil
playerBonus = PlayerBonus()
player = Player({x=200,y=202}, {x=200,y=200})
-- game:startGame()

gameUpdate = function()
    deltaTime = playdate.getElapsedTime()
    time += deltaTime
    playdate.resetElapsedTime()
    crankPosition = playdate.getCrankPosition()
    player:update()
    gfx.sprite.update()
    Particles:update()
    playdate.timer.updateTimers()
    game:update()
    uiManager:update()
    playdate.drawFPS(0, 0)
    sequence.update()
    uiManager:displayTitle()
end


levelUpUpdate = function()
    deltaTime = playdate.getElapsedTime()
    playdate.resetElapsedTime()
    if generate == false then
        generate = true
        uiManager:generateUpgrades()
    end
    gfx.clear()
    uiManager:levelUpDisplay()
    sequence.update()
end

tween = false

winScreenUpdate = function()
    deltaTime = playdate.getElapsedTime()
    playdate.resetElapsedTime()
    if tween == false then
        endScreenTweet:restart()
        tween = true
    end
    uiManager:winScreenUpdate()
    sequence.update()
    playdate.timer.updateTimers()
    uiManager:displayTitle()
end

mainMenuUpdate = function()
    deltaTime = playdate.getElapsedTime()
    playdate.resetElapsedTime()
    uiManager:mainMenuUpdate()
    playdate.timer.updateTimers()
    sequence.update()
    uiManager:displayTitle()
end

unlockScreenUpdate = function()
    deltaTime = playdate.getElapsedTime()
    playdate.resetElapsedTime()
    uiManager:unlockScreenUpdate()
    playdate.timer.updateTimers()
    sequence.update()
    uiManager:displayTitle()
end

shopUpdate = function()
    deltaTime = playdate.getElapsedTime()
    playdate.resetElapsedTime()
    uiManager:shopUpdate()
    playdate.timer.updateTimers()
    sequence.update()
    uiManager:displayTitle()
end

playdate.update = mainMenuUpdate
-- uiManager.OpenMenu()