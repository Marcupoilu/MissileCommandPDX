gfx = playdate.graphics

import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"
import "mathExtensions.lua"
import "tableExtensions.lua"
import "sequence.lua"
import "pdParticles.lua"
import "screenShake.lua"
import "player.lua"
import "weapon.lua"
import "bullet.lua"
import "simpleCannon.lua"
import "enemiesData.lua"
import "enemy.lua"
import "spawner.lua"
import "saucer.lua"
import "enemySpawner.lua"
import "saucerSpawner.lua"
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

-- Collections
particles = {}
upgrades = {}
enemies = {}
spawners = {}
-- // 
player = Player({x=200,y=190}, {x=200,y=175})
shake = ScreenShake()
uiManager = UiManager()
table.insert(player.weapons,SimpleCannon(500, player.cannonGunSprite.x, player.cannonGunSprite.y, 1, 1, 0.2))
table.insert(upgrades, UpgradeStat("attackSpeedBonus", 10, "+10% Attack \n       Speed", "images/attackSpeedUp"))
table.insert(upgrades, UpgradeStat("damageBonus", 10, "+10% Damage", "images/damageUp"))
table.insert(upgrades, UpgradeWeapon("simpleCannon", "SimpleCannon", "Cannon", "", "images/simpleCannon" ))
game = Game()
game:startGame()
gfx.setBackgroundColor(gfx.kColorBlack)
gfx.clear()

gameUpdate = function()
    crankPosition = playdate.getCrankPosition()
    player:update()
    gfx.sprite.update()
    Particles:update()
    playdate.timer.updateTimers()
    game:update()
end

generate = false

levelUpUpdate = function()
    if(generate == false) then
        -- kill all enemies at level up
        table.each(enemies, function(x)x:remove() end)
        generate = true
        uiManager:generateUpgrades()
    end
    gfx.clear()
    uiManager:levelUpDisplay()
    sequence.update()
end

playdate.update = gameUpdate