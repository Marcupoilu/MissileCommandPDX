class("Game").extends()

-- local interval = minutes_to_milliseconds(0.25)
-- local intervalTime = interval

function Game:init(maxPool, level)
    enemyPoolLimit = maxPool
    gfx.setBackgroundColor(gfx.kColorBlack)
    generate = false
    playdate.resetElapsedTime()
    player.weapons = {}
    player.passives = {}
    createWavesData()
    createUpgradesData()
    CreateWeaponsData()
    -- createCannonsData()
    self.level = table.findByParam(wavesData, "Level", level)
    self.waves = table.findByParam(wavesData, "Level", level).Waves
    interval = minutes_to_milliseconds(0.25)
    intervalTime = interval
    targetTime = interval*table.count(self.waves)/1000
    -- targetTime = 5
    self.waveNumber = 1
    self.finish = false
    time = 0
    musicPlayer:stop()
    musicPlayer:load("audio/"..self.level.Music)
    musicPlayer:play(0)
    table.each(bullets, function (b)
        b:remove()
    end)
    self.bgsprite = gfx.sprite.new(self.level.Background)
    self.bgsprite:setCenter(0,0)
    self.bgsprite:moveTo(0,0)
    self.bgsprite:setZIndex(-9999)
    self.bgsprite:add()
    self:startGame()
end

function Game:startGame()
    -- for key, value in pairs(playdate.timer.allTimers()) do
    --     print(value)
    --     value:remove()
    -- end
    table.each(player.shopUnlocks, function (su)
        su.count = su.countMax
    end)
    if bulletSprite ~= nil then
        bulletSprite:remove()
    end
    table.each(player.chosenCanon.weapons, function (w)
        -- w.level = 1
        local weapon = table.findByParam(weaponsData, "className", w.className)
        -- weapon:reset()
        printTable(player.chosenCanon)
        for i = 1, player.chosenCanon.weaponLevel-2, 1 do
            weapon:changeLevel()
        end
        player:addWeapon(weapon)
    end)
    createUpgradesData()
    table.each(player.chosenCanon.weapons, function (w)
        local weapon = table.findByParam(player.shopUnlocks, "type", w.className)
        weapon.count -= 1
    end)
    player:updateCannon()
    -- player:addWeapon(table.findByParam(weaponsData, "className", "SimpleCannon"))
    -- local passive = getUpgradePassive("attackSpeedBonus")
    -- passive.count -= 1
    -- player:addPassive(passive)
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
    -- uiManager:createInventory(12,225,21,weaponUpgrades)
    
    self.waves[self.waveNumber]:startWave()
    print("START WAVE : ", self.waveNumber)

    -- self.timer = playdate.timer.new(interval, self.changeWave, self)
    -- self.timer.repeats = true
end

function timeLeft(x)
    local remaining_time = targetTime - x
    if remaining_time < 0 then remaining_time = 0 end
    local minutes = math.floor(remaining_time / 60)
    local secondes = math.floor(remaining_time % 60)
    return string.format("%02d:%02d", minutes, secondes) 
end

function Game:update()
    -- print(table.count(playdate.timer.allTimers()))
    -- table.each(playdate.timer.allTimers(), function (t)
    --     printTable(t)
    -- end)
    if self.finish == true then
        return
    end
    if time >= targetTime then
        self:endGame()
        return
    end
    table.each(beams, function(beam)
        beam:update()   
    end)
    time += deltaTime

    intervalTime -= refreshRate
    if intervalTime <= 0 then
        intervalTime = interval
        self:changeWave()
    end
    -- table.each(debugRects, function(rect)
    --     gfx.setColor(gfx.kColorWhite)
    --     gfx.drawRect(rect)
    -- end)
    debugRects = {}
    
end

function Game:changeWave()
    self.waveNumber += 1
    print("START WAVE : ", self.waveNumber)
    if self.waveNumber >= table.count(self.waves) then
        return
    end
    self.waves[self.waveNumber]:startWave()
end

function Game:endGame()
    lockInput = false
    if self.level.Level == playerBonus.gameData.mapCount then
        if playerBonus.gameData.mapCount < table.count(wavesData) then
            playerBonus.gameData.mapCount += 1
        end
    end
    
    self.finish = true
    table.each(spawners, function (s)
        s:stopSpawn()
    end)
    enemiesCopy = table.shallowcopy(enemies)
    for key, value in pairs(enemiesCopy) do
        enemyManager:death(value)
    end
    bulletsCopy = table.shallowcopy(bullets)
    for key, value in pairs(bulletsCopy) do
        value:destroyWithParticles()
    end   
    player.success = true
    table.each(unlocksData, function (unlock)
        if table.contains(player.unlocks, unlock) == false and unlock.condition ~= nil then
            if unlock.condition:checkCondition() == true then
                unlock:applyUnlock()
                table.insert(player.currentUnlocks, unlock)
            end
        end
    end)
    playdate.timer.new(300, function ()
        self.bgsprite:remove()
        playdate.update = winScreenUpdate
    end)    
end

function Game:loseGame()
    lockInput = false
    self.finish = true
    table.each(spawners, function (s)
        s:stopSpawn()
    end)
    player.cannonGunSprite:setVisible(false)  
    enemiesCopy = table.shallowcopy(enemies)
    for key, value in pairs(enemiesCopy) do
        enemyManager:death(value)
    end
    bulletsCopy = table.shallowcopy(bullets)
    for key, value in pairs(bulletsCopy) do
        value:destroyWithParticles()
    end 
    player.success = false
    table.each(unlocksData, function (unlock)
        if table.contains(player.unlocks, unlock) == false and unlock.condition ~= nil then
            if unlock.condition:checkCondition() == true then
                unlock:applyUnlock()
                table.insert(player.currentUnlocks, unlock)
            end
        end
    end)
    playdate.timer.new(500, function ()
        self.bgsprite:remove()
        playdate.display.setOffset(0, 0)
        playdate.update = winScreenUpdate
    end)
end