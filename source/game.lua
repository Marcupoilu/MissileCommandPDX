class("Game").extends()

local interval = minutes_to_milliseconds(0.5)


function Game:init()
    -- Collections --
    particles = {}
    upgrades = upgradesData
    enemies = {}
    spawners = {}
    beams = {}
    player = Player({x=200,y=207}, {x=200,y=197})
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
    -- player:addWeapon(table.findByParam(weaponsData, "className", "Serpentine"))
    -- player:addWeapon(table.findByParam(weaponsData, "className", "Shockwave"))
    -- player:addWeapon(table.findByParam(weaponsData, "className", "Rocket"))
    -- player:addWeapon(table.findByParam(weaponsData, "className", "Guided"))
    player:addWeapon(table.findByParam(weaponsData, "className", "Flamethrower"))

    self.waves[self.waveNumber]:startWave()
    playdate.timer.new(interval, self.changeWave, self).repeats = true
end

function Game:update()
    -- playdate.timer.new(1000, function() self:changeWave() end)
    table.each(beams, function(beam)
        beam:update()
    end)
end

function Game:changeWave()
        self.waveNumber += 1
        if self.waveNumber >= table.count(self.waves) then
            self:endGame()
            return
        end
        self.waves[self.waveNumber]:startWave()
end

function Game:endGame()
    print("fin de game")
end