class("Player").extends()

function Player:init(basePosition, gunPosition)
    -- Chargement des images et initialisation des sprites
    self.cannonBase = gfx.image.new("images/player/bases/base_cannon")
    self.cannonGun = gfx.image.new("images/player/guns/gun_cannon")
    self.x, self.y = gunPosition.x, gunPosition.y
    self.cannonBaseSprite = gfx.sprite.new(self.cannonBase)
    self.cannonBaseSprite:setZIndex(0)
    self.cannonBaseSprite:setTag(1)
    self.cannonBaseSprite:setGroups({1})
    self.cannonGunSprite = gfx.sprite.new(self.cannonGun)
    self.cannonGunSprite:setZIndex(-1)
    self.cannonGunSprite:setCenter(0.5, 1)
    
    self.cannonBaseSprite:moveTo(basePosition.x, basePosition.y)
    self.cannonGunSprite:moveTo(gunPosition.x, gunPosition.y)
    
    self.cannonBaseSprite:add()
    self.cannonGunSprite:add()
    self.cannonBaseSprite:setVisible(false)
    self.cannonBaseSprite:setCollideRect(0, 0, self.cannonGunSprite:getSize())
    
    -- Initialisation des propriétés du joueur
    self.cannons = playerBonus.gameData.cannons

    self.unlocks = {}
    self.shopUnlocks = {}
    self.currentUnlocks = {}
    self.chosenCanon = nil
    self.bulletHpBonus = 0
    self.level = 1
    self.hpMax = 10 + playerBonus.gameData.hpMax
    self.hp = self.hpMax
    self.shield = playerBonus.gameData.shield or 0
    self.xp, self.xpMax, self.xpBonus = 0, 3, playerBonus.gameData.xpBonus or 0
    self.damageBonus = playerBonus.gameData.damageBonus or 0
    self.attackSpeedBonus = playerBonus.gameData.attackSpeedBonus or 0
    self.scaleBonus = playerBonus.gameData.scaleBonus or 0
    self.projectileAmount = playerBonus.gameData.projectileAmount or 0
    self.regenerationRate = playerBonus.gameData.regenerationRate or 0
    self.projectileSpeedBonus = playerBonus.gameData.projectileSpeedBonus or 0
    self.durationBonus = playerBonus.gameData.durationBonus or 0
end

function Player:start()
    self.weapons = {}
    self.passives = {}
    self:resetPassiveInventory()
    uiManager:createInventory(300, 222, 29, self.passives)
    self.level = 1
    self.hpMax = 10 + playerBonus.gameData.hpMax
    self.hp = self.hpMax
    self.bulletHpBonus = playerBonus.gameData.bulletHpBonus or 0
    self.shield = playerBonus.gameData.shield or 0
    self.xp, self.xpMax, self.xpBonus = 0, 3, playerBonus.gameData.xpBonus or 0
    self.damageBonus = playerBonus.gameData.damageBonus or 0
    self.attackSpeedBonus = playerBonus.gameData.attackSpeedBonus or 0
    self.scaleBonus = playerBonus.gameData.scaleBonus or 0
    self.projectileAmount = playerBonus.gameData.projectileAmount or 0
    self.regenerationRate = playerBonus.gameData.regenerationRate or 0
    self.projectileSpeedBonus = playerBonus.gameData.projectileSpeedBonus or 0
    self.durationBonus = playerBonus.gameData.durationBonus or 0
    self.lives = 1 + playerBonus.gameData.lives
    self.rerolls = 1 + playerBonus.gameData.rerolls
    self.weaponNumber, self.passiveNumber = 0, 0
    self.weaponNumberMax, self.passiveNumberMax = 3, 3
    self.core, self.runLevel, self.enemiesKilled = 0, 1, 0
    self.success = false
    self.unlocks = playerBonus.gameData.unlocks
    self.shopUnlocks = playerBonus.gameData.shopUnlocks
    self.cannons = playerBonus.gameData.cannons
    self.currentUnlocks = {}
    self.cannonGunSprite:setVisible(true)
    self.regenerationTimer = 30000 - (self.regenerationRate*30000/100)
end

function Player:updateCannon()
    self.cannonGun = self.chosenCanon.image
    self.cannonBase = self.chosenCanon.imageBase
    self.cannonGunSprite:setImage(self.cannonGun)
    self.cannonBaseSprite:setImage(self.cannonBase)
    self.cannonBaseSprite:setCollideRect(0, 0, self.cannonBaseSprite:getSize())
end

function Player:update()
    if not bot then
        crankPosition = playdate.getCrankPosition() -- cache la position de la manivelle
    end
    local na = normalizeAngle(crankPosition)
    if math.between(na, 30, 145) then
        self.cannonGunSprite:setRotation(crankPosition)
    elseif math.between(na, 145, 270) then
        self.cannonGunSprite:setRotation(60)
    elseif math.between(na, 29, 360) then
        print(na)
        self.cannonGunSprite:setRotation(300)
    end
    self.regenerationTimer -= refreshRate
    if self.regenerationTimer <= 0 then
        self.regenerationTimer = 30000 - (self.regenerationRate*30000/100)
        self:regeneration()
    end
end

function Player:updateCannonPosition()
    local _, gunLength = self.cannonGunSprite:getSize()
    local baseX, baseY = self.cannonBaseSprite:getPosition()
    local angleRad = math.rad(self.cannonGunSprite:getRotation())
    local offsetX, offsetY = gunLength * math.sin(angleRad), gunLength * math.cos(angleRad)
    self.cannonGunSprite:moveTo(baseX + offsetX, baseY - offsetY)
end

function Player:addWeapon(weapon)
    if self.weaponNumber < self.weaponNumberMax then
        self.weaponNumber += 1
        table.insert(self.weapons, weapon)
        weapon:shoot()
        weapon:startShooting()

        local weaponUpgrades = {}
        for _, w in ipairs(self.weapons) do
            local upgrade = table.findByParam(upgradesData, "type", w.className)
            if upgrade then
                table.insert(weaponUpgrades, upgrade)
            end
        end

        for _, i in ipairs(uiManager.inventoryWeapons) do i:remove() end
        uiManager.inventoryWeapons = {}
        -- table.each(inventorySpritesWeapons, function (is)
        --     is:remove()
        -- end)
        uiManager:createInventory(13, 225, 31, weaponUpgrades)
    end
end

function Player:addPassive(passive)
    for _, stat in ipairs(passive.stats) do
        self[stat.name] += stat.value
    end
    if not table.contains(self.passives, passive) and not passive.inventory then
        table.insert(self.passives, passive)
        self.passiveNumber += 1
    end
    uiManager:createInventory(300, 222, 29, self.passives)

    self:resetPassiveInventory()
end

function Player:resetPassiveInventory()
    for _, i in ipairs(uiManager.inventoryPassives) do i:remove() end
    uiManager.inventoryPassives = {}
    -- table.each(inventorySpritesPassives, function (is)
    --     is:remove()
    -- end)
    uiManager:createInventory(300, 222, 29, self.passives)

end

function Player:regeneration()
    if self.hp < self.hpMax then
        self.hp += 1
    end
end

function Player:gainXP(xp)
    self.xp += xp
    if self.xp >= self.xpMax then
        self:levelUp()
    end
end

function Player:checkLevel()
    if self.xp >= self.xpMax then
        self:levelUp()
    end
end

function Player:levelUp()
    self.level += 1
    uiManager:updatePlayerInfo()
    self.xp = self.xp - self.xpMax
    -- self.rerolls += 1
    playerBonus.gameData.level += 1
    if math.between(self.level, 1, 4) then
        self.xpMax += 3
    elseif math.between(self.level, 5, 10) then
        self.xpMax += 7
    elseif math.between(self.level, 11, 20) then
        self.xpMax += 15
    elseif math.between(self.level, 21, 40) then
        self.xpMax += 25
    else
        self.xpMax += 50
    end
    playdate.timer.new(toMilliseconds(0.5), function()
        if game.finish == true then return end
        -- game.timer:pause()
        -- table.each(self.weapons, function (w)
        --     w.timer:pause()
        -- end)
        table.each(spawners, function (s)
            s:stop()
        end)
        soundSamplerLevelUp:play()
        playdate.update = levelUpUpdate
    end)
end

function Player:loseHp(value)
    local trueValue = math.max(1, value - self.shield)
    self.hp -= trueValue
    if self.hp <= 0 then
        self.lives -= 1
        if self.lives <= 0 then
            self:death()
        else
            self.hp = self.hpMax
        end
    end
end

function Player:death()
    game:loseGame()
end
