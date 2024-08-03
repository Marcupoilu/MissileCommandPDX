class("Game").extends()


function Game:init()
    playdate.resetElapsedTime()
    self.gameTime = minutes_to_milliseconds(30)
    self.waves = wavesData
    self.waveNumber = 1
end

function Game:startGame()
    self.waves[self.waveNumber]:startWave()
end

function Game:update()
    self:changeWave()
    if playdate.getElapsedTime() >= self.gameTime then
        print("game win")
    end
end

function Game:changeWave()
    -- current_time est le temps écoulé en millisecondes
    local interval = 1 * 60 * 1000 -- 1 minute en millisecondes

    if playdate.getElapsedTime() % interval == 0 then
        self.waveNumber += 1
        print("new wave"..self.waveNumber)
        self.waves[self.waveNumber]:startWave()
        -- Placez ici l'action que vous souhaitez exécuter
    end
end