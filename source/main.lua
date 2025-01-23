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
import "bulletPool.lua"
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
createUpgradesData()
import "weaponsData.lua"
CreateWeaponsData()
import "cannon.lua"
import "cannonsData.lua"
createCannonsData()
import "condition.lua"
import "conditionWeaponLevel.lua"
import "conditionMapCleared.lua"
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
createWavesData()
-- Collections --
upgrades = upgradesData
enemies = {}
spawners = {}
enemyManager = EnemyManager()
debugRects = {}
beams = {}
bullets = {}
refreshRate = 1/playdate.display.getRefreshRate() * 1000
soundSamplerBossDeath = playdate.sound.sampleplayer.new("audio/bossDeath")
soundSamplerBullet = playdate.sound.sampleplayer.new("audio/bulletShoot")
soundSamplerCancel = playdate.sound.sampleplayer.new("audio/cancel")
soundSamplerConfirm = playdate.sound.sampleplayer.new("audio/confirm")
soundSamplerEnemyDeath = playdate.sound.sampleplayer.new("audio/enemyDeath")
soundSamplerEnemyImpact = playdate.sound.sampleplayer.new("audio/enemyImpact")
soundSamplerEnemyImpact:setVolume(0.5)
soundSamplerItemShopSound = playdate.sound.sampleplayer.new("audio/itemShopSound")
soundSamplerLevelUp = playdate.sound.sampleplayer.new("audio/levelup")
soundSamplerOpenCloseMenu = playdate.sound.sampleplayer.new("audio/openCloseMenu")
soundSamplerMenuClose = playdate.sound.sampleplayer.new("audio/door")
soundSamplerPlayerHit = playdate.sound.sampleplayer.new("audio/playerHit")
soundSamplerSelection = playdate.sound.sampleplayer.new("audio/selection")
soundSamplerUpgradeSelected = playdate.sound.sampleplayer.new("audio/upgradeSelected")
soundSamplerLaserBeam = playdate.sound.sampleplayer.new("audio/laserBeam")
soundSamplerLaserBeam:setVolume(0.3)

musicPlayer = playdate.sound.fileplayer.new("audio/5")
musicPlayer:setVolume(0.5)
musicPlayer:play(0)

-- Managers -- 
shake = ScreenShake()
playerBonus = PlayerBonus()
player = Player({x = 200, y = 197}, {x = 200, y = 220})
uiManager = UiManager()
time = 0
deltaTime = 0
crankPosition = playdate.getCrankPosition()
game = nil

-- Pooling x,y,speed,damage,offsetCrank, scale, duration, hp, tick

BulletPool:preload(Bullet, 20, 200, 175, 10, 0.7,0, 1, toMilliseconds(3))
BulletPool:preload(BulletSerpentine, 20, 200, 175, 6, 0.3, 0, 1, toMilliseconds(3))
BulletPool:preload(BulletAura, 2, 200, 175, 6, 0.3, 0, 1, toMilliseconds(3), tick)
BulletPool:preload(BulletBeam, 3, 200, 175, 120, 0.5, 0, 4, toMilliseconds(1.5))
BulletPool:preload(BulletBeamReflect, 10, 200, 175, 10, 2, 0, 3, toMilliseconds(3))
BulletPool:preload(BulletBlackhole, 3, 200, 175, 1, 1, 0, 1, toMilliseconds(2))
BulletPool:preload(BulletDrone, 3, 200, 175, 4, 0.5, 0, 1, toMilliseconds(3))
BulletPool:preload(BulletDroneLaser, 5, 200, 175, 4, 1, 1, 1, toMilliseconds(3), 0)
BulletPool:preload(BulletExplosion, 20, 200, 175, 4, 2, 0, 1, toMilliseconds(3), 2)
BulletPool:preload(BulletRocket, 20, 200, 175, 4, 0, 0, 1, toMilliseconds(3))
BulletPool:preload(BulletFlamethrower, 3, 200, 175, 0, 2, 0, 1, toMilliseconds(1))
BulletPool:preload(BulletFreezer, 3, 200, 175, 0, 2, 0, 1, toMilliseconds(1),1)
BulletPool:preload(BulletGuided, 3, 200, 175, 2, 0.5, 0, 1, toMilliseconds(3))
BulletPool:preload(BulletLaserDome, 2, 200, 175, 100, 1, 0, 2, toMilliseconds(3))
BulletPool:preload(BulletOrbital, 40, 200, 175, 50, 1, 0, 1, toMilliseconds(3))
BulletPool:preload(BulletPlasma, 20, 200, 175, 4, 0.75, 0, 1, toMilliseconds(5))
BulletPool:preload(BulletShockwave, 20, 200, 175, 4, 0.25, 0, 1, toMilliseconds(3),3 ,5)
BulletPool:preload(BulletToxicVape, 20, 200, 175, 2, 0.5, 0, 1, toMilliseconds(5),3 ,45, 300,500)
BulletPool:preload(BulletTracer, 6, 200, 175, 5, 0.5, 0, 1, toMilliseconds(4))

BulletPool:preload(Xwing, 50, 0, 0, 20, 1, 1, 1, gfx.image.new("images/enemies/small/enemy_small_01"), 1)
BulletPool:preload(EnemySmallTwo, 50, 0, 0, 20, 1, 1, 1, gfx.image.new("images/enemies/small/enemy_small_02"), 1)
BulletPool:preload(EnemySmallThree, 50, 0, 0, 20, 1, 1, 1, gfx.image.new("images/enemies/small/enemy_small_03"), 1)
BulletPool:preload(EnemySmallFour, 50, 0, 0, 20, 1, 1, 1, gfx.image.new("images/enemies/small/enemy_small_04"), 1)
BulletPool:preload(EnemySmallFive, 50, 0, 0, 20, 1, 1, 1, gfx.image.new("images/enemies/small/enemy_small_05"), 1)
BulletPool:preload(EnemySmallSix, 50, 0, 0, 20, 1, 1, 1, gfx.image.new("images/enemies/small/enemy_small_06"), 1)
BulletPool:preload(EnemySmallSeven, 50, 0, 0, 20, 1, 1, 1, gfx.image.new("images/enemies/small/enemy_small_07"), 1)
BulletPool:preload(EnemySmallEight, 50, 0, 0, 20, 1, 1, 1, gfx.image.new("images/enemies/small/enemy_small_08"), 1)
BulletPool:preload(EnemyMediumOne, 50, 0, 0, 20, 1, 1, 1, gfx.image.new("images/enemies/small/enemy_medium_01"), 1)
BulletPool:preload(EnemyMediumTwo, 50, 0, 0, 20, 1, 1, 1, gfx.image.new("images/enemies/small/enemy_medium_02"), 1)
BulletPool:preload(EnemyMediumThree, 50, 0, 0, 20, 1, 1, 1, gfx.image.new("images/enemies/small/enemy_medium_03"), 1)
BulletPool:preload(EnemyMediumFour, 50, 0, 0, 20, 1, 1, 1, gfx.image.new("images/enemies/small/enemy_medium_04"), 1)
BulletPool:preload(EnemyMediumFive, 50, 0, 0, 20, 1, 1, 1, gfx.image.new("images/enemies/small/enemy_medium_05"), 1)
BulletPool:preload(EnemyLargeOne, 50, 0, 0, 20, 1, 1, 1, gfx.image.new("images/enemies/small/enemy_large_01"), 1)
BulletPool:preload(EnemyLargeTwo, 50, 0, 0, 20, 1, 1, 1, gfx.image.new("images/enemies/small/enemy_large_02"), 1)
BulletPool:preload(EnemyLargeThree, 50, 0, 0, 20, 1, 1, 1, gfx.image.new("images/enemies/small/enemy_large_03"), 1)
BulletPool:preload(EnemyLargeFour, 50, 0, 0, 20, 1, 1, 1, gfx.image.new("images/enemies/small/enemy_large_04"), 1)


-- Cache des appels fréquents
local getElapsedTime = playdate.getElapsedTime
local resetElapsedTime = playdate.resetElapsedTime
local drawFPS = playdate.drawFPS
local updateTimers = playdate.timer.updateTimers
local spriteUpdate = gfx.sprite.update
local particleUpdate = Particles.update
local sequenceUpdate = sequence.update
playdate.getSystemMenu():addMenuItem("Main Menu", function ()
    playdate.restart("menu")
end)

-- Fonction principale de mise à jour du jeu
gameUpdate = function()
    -- Cache des valeurs calculées une seule fois par frame
    deltaTime = getElapsedTime()
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
    uiManager:updateLayout()      -- Mise à jour de l'interface utilisateur
    table.each(player.weapons, function (w)
        w:update()
    end)
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
    menuSound()
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
    menuSound()
end

-- Mise à jour de l'écran de déblocage
unlockScreenUpdate = function()
    deltaTime = getElapsedTime()
    resetElapsedTime()

    uiManager:unlockScreenUpdate() -- Mise à jour de l'interface de l'écran de déblocage
    updateTimers()                 -- Mise à jour des timers
    sequenceUpdate()               -- Mise à jour des séquences
    uiManager:displayTitle()       -- Affichage du titre
    menuSound()
end

-- Mise à jour de l'écran de la boutique
shopUpdate = function()
    deltaTime = getElapsedTime()
    resetElapsedTime()

    uiManager:shopUpdate() -- Mise à jour de l'interface de la boutique
    updateTimers()         -- Mise à jour des timers
    sequenceUpdate()       -- Mise à jour des séquences
    uiManager:displayTitle() -- Affichage du titre
    menuSound()
end

function menuSound()
    if playdate.buttonJustPressed(playdate.kButtonA) then
        soundSamplerConfirm:play()
    end
    if playdate.buttonJustPressed(playdate.kButtonB) then
        soundSamplerCancel:play()
    end
    if playdate.buttonJustPressed(playdate.kButtonRight) or playdate.buttonJustPressed(playdate.kButtonLeft) 
    or playdate.buttonJustPressed(playdate.kButtonUp) or playdate.buttonJustPressed(playdate.kButtonDown) then
        soundSamplerSelection:play()
    end
end

-- Définit la fonction de mise à jour principale par défaut
playdate.update = mainMenuUpdate
