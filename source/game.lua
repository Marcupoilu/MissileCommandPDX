class("Game").extends()

local interval = minutes_to_milliseconds(0.5)
local bg = gfx.image.new("images/backgrounds/bg_01")
local bgsprite = gfx.sprite.new(bg)
bgsprite:setCenter(0,0)
bgsprite:moveTo(0,0)
bgsprite:setZIndex(-9999)

function Game:init(maxPool, level)
    enemyPoolLimit = maxPool
    gfx.setBackgroundColor(gfx.kColorBlack)
    gfx.clear()
    generate = false
    playdate.resetElapsedTime()
    self.waves = table.findByParam(wavesData, "Level", level).Waves
    self.waveNumber = 1
    self.finish = false
    time = 0

    bgsprite:add()

    self:startGame()
end

function Game:startGame()
    spawners = {}
    for key, value in pairs(playdate.timer.allTimers()) do
        value:remove()
    end
    player.weapons = {}
    CreateWeaponsData()
    table.each(player.chosenCanon.weapons, function (w)
        player:addWeapon(w)
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
    playdate.timer.new(interval, self.changeWave, self).repeats = true
end

function timeLeft(x)
    local remaining_time = targetTime - x
    if remaining_time < 0 then remaining_time = 0 end  -- S'assurer que le temps restant ne soit pas négatif
    local minutes = math.floor(remaining_time / 60)
    local secondes = math.floor(remaining_time % 60)
    return string.format("%02d:%02d", minutes, secondes)
end

function Game:update()
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
    -- table.each(debugRects, function(rect)
    --     gfx.setColor(gfx.kColorWhite)
    --     gfx.drawRect(rect)
    -- end)
    debugRects = {}
    
end

function Game:changeWave()
        self.waveNumber += 1
        self.waves[self.waveNumber]:startWave()
end

function Game:endGame()
    self.finish = true
    table.each(spawners, function (s)
        s:stopSpawn()
    end)
    enemiesCopy = table.shallowcopy(enemies)
    for key, value in pairs(enemiesCopy) do
        value:death()
    end
    bulletsCopy = table.shallowcopy(bullets)
    for key, value in pairs(bulletsCopy) do
        value:destroyWithParticles()
    end   
    player.success = true
    table.each(unlocksData, function (unlock)
        if table.contains(player.unlocks, unlock) == false then
            if unlock.condition:checkCondition() == true then
                unlock:applyUnlock()
                table.insert(player.currentUnlocks, unlock)
            end
        end
    end)
    playdate.timer.new(300, function ()
        playdate.update = winScreenUpdate
    end)    
end

function Game:loseGame()
    self.finish = true
    table.each(spawners, function (s)
        s:stopSpawn()
    end)
    p:moveTo(player.x, player.y)
    p:setSize(10,10)
    p:setColor(gfx.kColorWhite)
    p:setMode(Particles.modes.DECAY)
    p:setSpeed(3, 7)
    p:add(5)
    player.cannonGunSprite:setVisible(false)  
    enemiesCopy = table.shallowcopy(enemies)
    for key, value in pairs(enemiesCopy) do
        value:death()
    end
    bulletsCopy = table.shallowcopy(bullets)
    for key, value in pairs(bulletsCopy) do
        value:destroyWithParticles()
    end 
    player.success = false
    table.each(unlocksData, function (unlock)
        if table.contains(player.unlocks, unlock) == false then
            if unlock.condition:checkCondition() == true then
                unlock:applyUnlock()
                table.insert(player.currentUnlocks, unlock)
            end
        end
    end)
    playdate.timer.new(500, function ()
        playdate.display.setOffset(0, 0)
        playdate.update = winScreenUpdate
    end)
end