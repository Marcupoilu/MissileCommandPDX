class("Game").extends()


function Game:init()
    -- Collections --
    particles = {}
    upgrades = upgradesData
    enemies = {}
    spawners = {}
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
    table.insert(player.weapons,SimpleCannon(500, player.cannonGunSprite.x, player.cannonGunSprite.y, 1, 1, 0.2))
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
        self.waves[self.waveNumber]:startWave()
        -- Placez ici l'action que vous souhaitez exécuter
    end
end