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
import "enemyManager.lua"
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
import "FX.lua"

playdate.display.setRefreshRate(50)

-- Collections --
upgrades = upgradesData
enemies = {}
enemyManager = EnemyManager()
debugRects = {}
beams = {}
bullets = {}
refreshRate = 1/playdate.display.getRefreshRate() * 1000

-- Managers -- 
shake = ScreenShake()
uiManager = UiManager()
time = 0
deltaTime = 0
crankPosition = playdate.getCrankPosition()
game = nil
playerBonus = PlayerBonus()
player = Player({x = 200, y = 197}, {x = 200, y = 200})

-- Cache des appels fréquents
local getElapsedTime = playdate.getElapsedTime
local resetElapsedTime = playdate.resetElapsedTime
local drawFPS = playdate.drawFPS
local updateTimers = playdate.timer.updateTimers
local spriteUpdate = gfx.sprite.update
local particleUpdate = Particles.update
local sequenceUpdate = sequence.update

-- Fonction principale de mise à jour du jeu
gameUpdate = function()
    -- Cache des valeurs calculées une seule fois par frame
    deltaTime = getElapsedTime()
    time += deltaTime
    resetElapsedTime()
    
    crankPosition = playdate.getCrankPosition() -- cache la position de la manivelle
    
    player:update()         -- Mise à jour du joueur
    enemyManager:update()   -- Mise à jour des ennemis
    spriteUpdate()          -- Mise à jour des sprites
    updateTimers()          -- Mise à jour des timers
    game:update()           -- Mise à jour du jeu principal
    table.each(spawners, function (s)
        s:update()
    end)
    uiManager:update()      -- Mise à jour de l'interface utilisateur
    drawFPS(0, 0)           -- Affichage des FPS pour le debugging
    particleUpdate()        -- Mise à jour des particules
    sequenceUpdate()        -- Mise à jour des séquences
    uiManager:displayTitle() -- Affichage du titre
end

-- Mise à jour lors de la montée de niveau
levelUpUpdate = function()
    deltaTime = getElapsedTime()
    resetElapsedTime()
    
    if generate == false then
        generate = true
        uiManager:generateUpgrades()
    end

    gfx.clear()             -- Nettoyage de l'écran
    uiManager:levelUpDisplay() -- Affichage de la montée de niveau
    sequenceUpdate()        -- Mise à jour des séquences
end

tween = false

-- Mise à jour de l'écran de victoire
winScreenUpdate = function()
    deltaTime = getElapsedTime()
    resetElapsedTime()
    
    if tween == false then
        endScreenTweet:restart() -- Redémarre l'animation de l'écran de fin
        tween = true
    end

    uiManager:winScreenUpdate() -- Mise à jour de l'interface de l'écran de victoire
    sequenceUpdate()            -- Mise à jour des séquences
    updateTimers()              -- Mise à jour des timers
    uiManager:displayTitle()    -- Affichage du titre
end

-- Mise à jour du menu principal
mainMenuUpdate = function()
    deltaTime = getElapsedTime()
    resetElapsedTime()

    uiManager:mainMenuUpdate() -- Mise à jour du menu principal
    updateTimers()             -- Mise à jour des timers
    sequenceUpdate()           -- Mise à jour des séquences
    uiManager:displayTitle()   -- Affichage du titre
end

-- Mise à jour de l'écran de déblocage
unlockScreenUpdate = function()
    deltaTime = getElapsedTime()
    resetElapsedTime()

    uiManager:unlockScreenUpdate() -- Mise à jour de l'interface de l'écran de déblocage
    updateTimers()                 -- Mise à jour des timers
    sequenceUpdate()               -- Mise à jour des séquences
    uiManager:displayTitle()       -- Affichage du titre
end

-- Mise à jour de l'écran de la boutique
shopUpdate = function()
    deltaTime = getElapsedTime()
    resetElapsedTime()

    uiManager:shopUpdate() -- Mise à jour de l'interface de la boutique
    updateTimers()         -- Mise à jour des timers
    sequenceUpdate()       -- Mise à jour des séquences
    uiManager:displayTitle() -- Affichage du titre
end

-- Définit la fonction de mise à jour principale par défaut
playdate.update = mainMenuUpdate
