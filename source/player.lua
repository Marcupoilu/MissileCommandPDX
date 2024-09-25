class("Player").extends()

function Player:init( basePosition, gunPosition)
    self.cannonBase = gfx.image.new("images/player/bases/base_cannon")
    self.cannonGun = gfx.image.new("images/player/guns/gun_cannon")
    self.x = gunPosition.x
    self.y = gunPosition.y
    self.cannonBaseSprite = gfx.sprite.new( self.cannonBase )
    self.cannonBaseSprite:setZIndex(0)
    self.cannonBaseSprite:setTag(1)
    self.cannonBaseSprite:setCollideRect(0,0,self.cannonBaseSprite:getSize())
    self.cannonBaseSprite:setGroups({1})
    self.cannonGunSprite = gfx.sprite.new( self.cannonGun )
    self.cannonGunSprite:setZIndex(-1)
    self.cannonGunSprite:setCenter(0.5, 1)
    self.cannonBaseSprite:moveTo( basePosition.x, basePosition.y )
    self.cannonGunSprite:moveTo( gunPosition.x, gunPosition.y )
    self.cannonBaseSprite:add()
    self.cannonGunSprite:add()
    self.cannons = playerBonus.gameData.cannons
    self.weapons = {}
    self.passives = {}
    self.unlocks = {}
    self.shopUnlocks = {}
    self.currentUnlocks = {}
    self.chosenCanon = nil
end

function Player:start()
    self.level = 1
    self.hpMax = 1 + playerBonus.gameData.hpMax
    self.hp = self.hpMax
    self.shield = 0 + playerBonus.gameData.shield
    self.xp = 0
    self.xpMax = 1
    self.xpBonus = 0 + playerBonus.gameData.xpBonus
    self.damageBonus = 0 + playerBonus.gameData.damageBonus
    self.attackSpeedBonus = 0 + playerBonus.gameData.attackSpeedBonus
    self.scaleBonus = 10 + playerBonus.gameData.scaleBonus
    self.projectileAmount = 0 + playerBonus.gameData.projectileAmount
    self.regenerationRate = 0 + playerBonus.gameData.regenerationRate
    self.projectileSpeedBonus = 0 + playerBonus.gameData.projectileSpeedBonus
    self.durationBonus = 0 + playerBonus.gameData.durationBonus
    self.lives = 1 + playerBonus.gameData.lives
    self.rerolls = 100 + playerBonus.gameData.rerolls
    self.weaponNumber = 0
    self.passiveNumber = 0
    self.weaponNumberMax = 4
    self.passiveNumberMax = 4
    self.core = 0
    self.runLevel = 1
    self.enemiesKilled = 0
    self.success = false
    self.unlocks = playerBonus.gameData.unlocks
    self.shopUnlocks = playerBonus.gameData.shopUnlocks
    self.cannons = playerBonus.gameData.cannons
    self.currentUnlocks = {}
    self.cannonGunSprite:setVisible(true)
    self.timer = playdate.timer.new(30000 - (((self.regenerationRate*30000)/100)), self.regeneration, self)
    self.timer.repeats = true
end

function Player:updateCannon()
    self.cannonGun = self.chosenCanon.image
    self.cannonBase = self.chosenCanon.imageBase
    self.cannonGunSprite:setImage(self.cannonGun)
    self.cannonBaseSprite:setImage(self.cannonBase)
    self.cannonBaseSprite:setCollideRect(0,0, self.cannonBaseSprite:getSize())
end

function Player:update()
    local na = normalizeAngle(crankPosition)
    if math.between(na, 0, 180) then
        self.cannonGunSprite:setRotation(crankPosition)
        -- self:updateCannonPosition()
    end
    if math.between(na, 181, 270) then
        self.cannonGunSprite:setRotation(90)
        -- self:updateCannonPosition()
    end
    if math.between(na, 271, 360) then
        self.cannonGunSprite:setRotation(270)
        -- self:updateCannonPosition()
    end

    -- c'est la que tu fais ton truc de ouf en rotation
    -- self.cannonGunSprite:moveTo(self.cannonBaseSprite.x + 10 * math.sin(math.rad(self.cannonGunSprite:getRotation())), self.cannonBaseSprite.y - 10 * math.cos(math.rad(self.cannonGunSprite:getRotation())) + 13)
end

function Player:updateCannonPosition()
    local width, gunLength = self.cannonGunSprite:getSize()
    local baseX, baseY = self.cannonBaseSprite:getPosition()

    -- Calculer la position du canon pour qu'il soit positionné correctement par rapport à la base
    local angleRad = math.rad(self.cannonGunSprite:getRotation())
    local offsetX = gunLength * math.sin(angleRad)
    local offsetY = gunLength * math.cos(angleRad)
    
    self.cannonGunSprite:moveTo(baseX + offsetX, baseY - offsetY)
end

function Player:addWeapon(weapon)
    player.weaponNumber += 1
    table.insert(self.weapons, weapon)
    weapon:shoot()
    weapon:startShooting()
    local weaponUpgrades = {}
    table.each(self.weapons, function(w) 
        table.insert(weaponUpgrades, table.findByParam(upgradesData, "type", w.className))
     end)
     table.each(uiManager.inventoryWeapons, function(i) i:remove() end)
     uiManager.inventoryWeapons = {}
    uiManager:createInventory(13,225,20,weaponUpgrades)
end

function Player:addPassive(passive)
    table.each(passive.stats, function (stat)
        self[stat.name] += stat.value
    end)
    if table.contains(self.passives, passive) == false and passive.inventory == nil then
        table.insert(self.passives, passive)
        self.passiveNumber += 1
    end
    table.each(uiManager.inventoryPassives, function(i) i:remove() end)
    uiManager.inventoryPassives = {}
    uiManager:createInventory(297,224,21,self.passives)
end

function Player:regeneration()
    if(self.regenerationRate == 0) then return end
    if(self.hp < self.hpMax) then
        self.hp += 10
    end
end

function Player:gainXP(xp)
    self.xp += xp
    if(self.xp >= self.xpMax) then
        self:levelUp()
    end
end

function Player:levelUp()
    self.level += 1
    if math.between(self.level, 1,2) then
        self.xpMax += 5
    end
    if math.between(self.level, 3,20) then
        self.xpMax += 10
    end
    if math.between(self.level, 21,40) then
        self.xpMax += 13
    end
    if self.level >= 41 then
        self.xpMax += 16
    end
    self.xp = 0
    playdate.timer.new(toMilliseconds(.5), function ()
        playdate.update = levelUpUpdate
    end)
end

function Player:loseHp(value)
    local trueValue = value - self.shield
    if trueValue <= 0 then
        trueValue = 1
    end
    self.hp -= trueValue
    if(self.hp <= 0) then
        self.lives -= 1
        if self.lives <= 0 then
            self:death()
            return
        end
        self.hp = self.hpMax
    end
end

function Player:death()
    game:loseGame()
end