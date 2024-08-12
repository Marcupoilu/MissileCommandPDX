class("Game").extends()

local interval = minutes_to_milliseconds(0.5)


function Game:init()
    -- Collections --
    particles = {}
    upgrades = upgradesData
    enemies = {}
    spawners = {}
    beams = {}
    player = Player({x=200,y=190}, {x=200,y=175})
    shake = ScreenShake()
    uiManager = UiManager()
    gfx.setBackgroundColor(gfx.kColorBlack)
    gfx.clear()
    generate = false
    playdate.resetElapsedTime()
    self.gameTime = minutes_to_milliseconds(30)
    self.waves = wavesData
    self.waveNumber = 1
end

function Game:startGame()
    -- player:addWeapon(table.findByParam(weaponsData, "className", "SimpleCannon"))
    -- player:addWeapon(table.findByParam(weaponsData, "className", "Beam"))
    -- player:addWeapon(table.findByParam(weaponsData, "className", "Wiper"))
    -- player:addWeapon(table.findByParam(weaponsData, "className", "Plasma"))
    player:addWeapon(table.findByParam(weaponsData, "className", "Serpentine"))

    self.waves[self.waveNumber]:startWave()
    playdate.timer.new(interval, self.changeWave, self).repeats = true
end

function Game:update()
    -- playdate.timer.new(1000, function() self:changeWave() end)
    table.each(beams, function(beam)
        beam:update()
    end)
    if playdate.getElapsedTime() >= self.gameTime then
        print("game win")
    end
end

function Game:changeWave()
        self.waveNumber += 1
        self.waves[self.waveNumber]:startWave()
end