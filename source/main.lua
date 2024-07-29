gfx = playdate.graphics

import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"
import "screenShake.lua"
import "weapon.lua"
import "simpleCannon.lua"
import "bullet.lua"
import "player.lua"
import "enemy.lua"
import "spawner.lua"
import "saucer.lua"
import "enemySpawner.lua"
import "saucerSpawner.lua"
import "horizontalLayout.lua"
import "uiSprite.lua"
import "ui.lua"
import "uiManager.lua"
import "pdParticles.lua"

particles = {}
player = Player({x=200,y=190}, {x=200,y=175})
shake = ScreenShake()
local spawnPositionX = 32
SaucerSpawner(math.random(500,1000), spawnPositionX, 0)
uiManager = UiManager()


gfx.setBackgroundColor(gfx.kColorBlack)
local game = function()
    for key, value in pairs(gfx.sprite.getAllSprites()) do
        value:setImageDrawMode(gfx.kDrawModeInverted)
    end
    crankPosition = playdate.getCrankPosition()
    player:update()
    gfx.sprite.update()
    Particles:update()
    playdate.timer.updateTimers()
end

playdate.update = game

