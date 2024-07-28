gfx = playdate.graphics

import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"
import "weapon.lua"
import "simpleCannon.lua"
import "bullet.lua"
import "player.lua"
import "enemy.lua"
import "spawner.lua"
import "enemySpawner.lua"
import "ui.lua"


player = Player({x=200,y=190}, {x=200,y=175});
local spawnPositionX = 32
EnemySpawner(math.random(3000,5000), spawnPositionX, 0)


function playdate.update()

    crankPosition = playdate.getCrankPosition()

    player:update()

    gfx.sprite.update()
    playdate.timer.updateTimers()

end

