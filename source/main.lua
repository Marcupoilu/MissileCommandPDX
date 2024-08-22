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
import "saucer.lua"
import "xwing.lua"
import "enemySpawner.lua"
import "saucerSpawner.lua"
import "xWingSpawner.lua"
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

playdate.display.setRefreshRate(50)
p = ParticleCircle(0,0)
deltaTime = 0
game = Game()
crankPosition = playdate.getCrankPosition()
game:startGame()


gameUpdate = function()
    deltaTime = playdate.getElapsedTime()
    playdate.resetElapsedTime()
    crankPosition = playdate.getCrankPosition()
    player:update()
    gfx.sprite.update()
    Particles:update()
    playdate.timer.updateTimers()
    game:update()
    playdate.drawFPS(0, 0)
end


levelUpUpdate = function()
    deltaTime = playdate.getElapsedTime()
    playdate.resetElapsedTime()
    if(generate == false) then
        -- kill all enemies at level up
        -- table.each(enemies, function(x) x.dead = true x:remove() end)
        generate = true
        uiManager:generateUpgrades()
    end
    gfx.clear()
    uiManager:levelUpDisplay()
    sequence.update()
end

playdate.update = gameUpdate