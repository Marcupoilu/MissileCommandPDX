gfx = playdate.graphics

import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"
import "weapon.lua"
import "simpleCannon.lua"
import "bullet.lua"
import "enemy.lua"
import "spawner.lua"
import "enemySpawner.lua"
import "player.lua"
import "ui.lua"


local player = Player({x=200,y=190}, {x=200,y=175});
local spawners = {}
local spawnPositionX = 32
EnemySpawner(math.random(3000,5000), spawnPositionX, 0)
-- for i = 0, 5 do
--     spawners[i] = EnemySpawner(math.random(3000,5000), spawnPositionX, 0)
--     spawnPositionX += 85
-- end


function playdate.update()

    crankPosition = playdate.getCrankPosition()

    player:update()

    gfx.sprite.update()
    playdate.timer.updateTimers()

end

