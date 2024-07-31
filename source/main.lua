gfx = playdate.graphics

import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"
import "mathExtensions.lua"
import "tableExtensions.lua"
import "sequence.lua"
import "screenShake.lua"
import "player.lua"
import "weapon.lua"
import "bullet.lua"
import "simpleCannon.lua"
import "enemy.lua"
import "spawner.lua"
import "saucer.lua"
import "enemySpawner.lua"
import "saucerSpawner.lua"
import "horizontalLayout.lua"
import "uiSprite.lua"
import "ui.lua"
import "upgrade.lua"
import "upgradeStat.lua"
import "upgradeWeapon.lua"
import "uiManager.lua"
import "pdParticles.lua"

particles = {}
upgrades = {}
player = Player({x=200,y=190}, {x=200,y=175})
table.insert(upgrades, UpgradeStat("attackSpeedBonus", 10, "+10% Attack \n       Speed", "images/attackSpeedUp"))
table.insert(upgrades, UpgradeStat("damageBonus", 10, "+10% Damage", "images/damageUp"))
table.insert(upgrades, UpgradeWeapon("simpleCannon", "SimpleCannon", "Cannon", "", "images/simpleCannon"))
shake = ScreenShake()
local spawnPositionX = 32
SaucerSpawner(math.random(500,1000), spawnPositionX, 0)
uiManager = UiManager()
table.insert(player.weapons,SimpleCannon(350, player.cannonGunSprite.x, player.cannonGunSprite.y, 1))
gfx.setBackgroundColor(gfx.kColorBlack)
gfx.clear()

game = function()
    for key, value in pairs(gfx.sprite.getAllSprites()) do
        value:setImageDrawMode(gfx.kDrawModeInverted)
    end
    crankPosition = playdate.getCrankPosition()
    player:update()
    gfx.sprite.update()
    Particles:update()
    playdate.timer.updateTimers()
end

test = false

levelUpUpdate = function()
    if(test == false) then
        test = true
        uiManager:generateUpgrades()
    end
    gfx.clear()
    uiManager:levelUpDisplay()
    sequence.update()
end

playdate.update = levelUpUpdate