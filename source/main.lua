gfx = playdate.graphics

import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"
import "player.lua"


local player = Player:new();
local player2 = Player:new();
local player3 = Player:new();
player:init({x=200,y=220}, {x=200,y=210});
-- player2:Init( {x=50,y=220}, {x=50,y=210})
-- player3:Init({x=350,y=220}, {x=350,y=210})

function playdate.update()

    crankPosition = playdate.getCrankPosition()

    player:update()

    gfx.sprite.update()
    playdate.timer.updateTimers()

end

