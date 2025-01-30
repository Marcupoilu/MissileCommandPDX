class("Game").extends()

function Game:init(maxPool, level)
    enemyPoolLimit = maxPool
    gfx.setBackgroundColor(gfx.kColorBlack)
    generate = false
    playdate.resetElapsedTime()
    
    player.weapons, player.passives = {}, {}
    createWavesData()
    createUpgradesData()
    CreateWeaponsData()
    
    self.level = table.findByParam(wavesData, "Level", level)
    self.waves = self.level.Waves
    
    interval = minutes_to_milliseconds(0.25)
    intervalTime = interval
    targetTime = interval * #self.waves / 1000
    
    self.waveNumber = 1
    self.finish = false
    time = 0
    
    musicPlayer:stop()
    musicPlayer:load("audio/" .. self.level.Music)
    musicPlayer:play(0)
    
    for _, b in ipairs(bullets) do b:remove() end
    for _, e in ipairs(enemies) do e:remove() end
    
    bullets, enemies = {}, {}
    
    self.bgsprite = gfx.sprite.new(self.level.Background)
    self.bgsprite:setCenter(0, 0)
    self.bgsprite:moveTo(0, 0)
    self.bgsprite:setZIndex(-9999)
    self.bgsprite:add()
    
    self:startGame()
end

function Game:startGame()
    for _, su in ipairs(player.shopUnlocks) do su.count = su.countMax end
    
    if bulletSprite then bulletSprite:remove() end
    
    for _, w in ipairs(player.chosenCanon.weapons) do
        local weapon = table.findByParam(weaponsData, "className", w.className)
        print(player.chosenCanon.weaponLevel)
        for _ = 1, player.chosenCanon.weaponLevel -1 do
            weapon:changeLevel()
        end
        player:addWeapon(weapon)
    end
    
    createUpgradesData()
    for _, w in ipairs(player.chosenCanon.weapons) do
        local weapon = table.findByParam(player.shopUnlocks, "type", w.className)
        weapon.count = weapon.count - 1
    end
        -- player:addWeapon(table.findByParam(weaponsData, "className", "Beam"))
    -- player:addWeapon(table.findByParam(weaponsData, "className", "Wiper"))
    -- player:addWeapon(table.findByParam(weaponsData, "className", "Plasma"))
    -- player:addWeapon(table.findByParam(weaponsData, "className", "Serpentine"))
    -- player:addWeapon(table.findByParam(weaponsData, "className", "Shockwave"))
    -- player:addWeapon(table.findByParam(weaponsData, "className", "Rocket"))
    -- player:addWeapon(table.findByParam(weaponsData, "className", "Guided"))
    -- player:addWeapon(table.findByParam(weaponsData, "className", "Flamethrower"))
    -- player:addWeapon(table.findByParam(weaponsData, "className", "Freezer"))
    -- player:addWeapon(table.findByParam(weaponsData, "className", "LaserDome"))
    -- player:addWeapon(table.findByParam(weaponsData, "className", "ToxicVape"))
    -- player:addWeapon(table.findByParam(weaponsData, "className", "Aura"))
    -- player:addWeapon(table.findByParam(weaponsData, "className", "Blackhole"))
    -- player:addWeapon(table.findByParam(weaponsData, "className", "Drone"))
    -- player:addWeapon(table.findByParam(weaponsData, "className", "Orbital"))
    -- player:addWeapon(table.findByParam(weaponsData, "className", "BeamReflect"))
    -- player:addWeapon(table.findByParam(weaponsData, "className", "Tracer"))
    
    player:updateCannon()
    self.waves[self.waveNumber]:startWave()
    print("START WAVE : ", self.waveNumber)
end

function timeLeft(x)
    local remaining_time = math.max(0, math.floor(targetTime - x)) -- Assure un entier positif
    local minutes = math.floor(remaining_time / 60)
    local secondes = remaining_time % 60
    return string.format("%02d:%02d", minutes, secondes)
end


function Game:update()
    if self.finish then return end
    
    if time >= targetTime then
        self:endGame()
        return
    end
    
    for _, beam in ipairs(beams) do beam:update() end
    
    time = time + deltaTime
    intervalTime = intervalTime - refreshRate
    
    if intervalTime <= 0 then
        intervalTime = interval
        self:changeWave()
    end
    
    uiManager.updatePlayerInfo()
end

function Game:changeWave()
    self.waveNumber = self.waveNumber + 1
    print("START WAVE : ", self.waveNumber)
    if self.waveNumber < #self.waves then
        self.waves[self.waveNumber]:startWave()
    end
end

function Game:endGame()
    -- uiManager:OpenAndCloseMenu()
    lockInput = false
    self.finish = true
    
    if self.level.Level == playerBonus.gameData.mapCount and playerBonus.gameData.mapCount < #wavesData then
        playerBonus.gameData.mapCount = playerBonus.gameData.mapCount + 1
    end
    
    for _, s in ipairs(spawners) do s:stopSpawn() end
    for _, e in ipairs(enemies) do enemyManager:death(e) end
    for _, b in ipairs(bullets) do b:destroyWithParticles() end
    
    player.success = true
    for _, unlock in ipairs(unlocksData) do
        if not table.contains(player.unlocks, unlock) and unlock.condition and unlock.condition:checkCondition() then
            unlock:applyUnlock()
            table.insert(player.currentUnlocks, unlock)
        end
    end
    
    playdate.timer.new(300, function()
        self.bgsprite:remove()
        playdate.update = winScreenUpdate
    end)
end

function Game:loseGame()
    lockInput = false
    self.finish = true
    
    for _, s in ipairs(spawners) do s:stopSpawn() end
    player.cannonGunSprite:setVisible(false)
    
    for _, e in ipairs(enemies) do enemyManager:death(e) end
    for _, b in ipairs(bullets) do b:destroyWithParticles() end
    
    player.success = false
    for _, unlock in ipairs(unlocksData) do
        if not table.contains(player.unlocks, unlock) and unlock.condition and unlock.condition:checkCondition() then
            unlock:applyUnlock()
            table.insert(player.currentUnlocks, unlock)
        end
    end
    
    playdate.timer.new(500, function()
        self.bgsprite:remove()
        playdate.display.setOffset(0, 0)
        playdate.update = winScreenUpdate
    end)
end
