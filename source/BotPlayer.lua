class('BotPlayer').extends()

function BotPlayer:init(player)
    self.player = player
    self.targetEnemy = nil
end

function BotPlayer:update()
    self:findTarget()
    self:aimAtTarget()
end

function BotPlayer:findTarget()
    local closestDist = math.huge
    local closestEnemy = nil
    
    for _, enemy in ipairs(enemies) do
        local dist = self:distanceToPlayer(enemy)
        if dist < closestDist then
            closestDist = dist
            closestEnemy = enemy
        end
    end
    
    self.targetEnemy = closestEnemy
end

function BotPlayer:distanceToPlayer(enemy)
    local dx = enemy.x - 200  -- Position du canon au centre bas (200, 240)
    local dy = enemy.y - 240
    return math.sqrt(dx * dx + dy * dy)
end

function BotPlayer:aimAtTarget()
    if self.targetEnemy then
        -- Récupération de la position actuelle du canon
        local baseX, baseY = self.player.cannonGunSprite:getPosition()

        -- Calcul de la direction vers l'ennemi
        local dx = self.targetEnemy.x - baseX
        local dy = self.targetEnemy.y - baseY
        local targetAngle = math.deg(math.atan(dy, dx)) -- atan2 gère correctement l'orientation

        -- Normalisation de l'angle entre 0 et 360
        if targetAngle < 0 then targetAngle = targetAngle + 360 end

        crankPosition = targetAngle
        self.player.cannonGunSprite:setRotation(normalizeAngle(crankPosition))

        -- print("[BotPlayer] Vise l'ennemi - Angle cible:", targetAngle, "CrankPosition:", crankPosition)
    end
end


function BotPlayer:levelUp()
    table.each(ups, function (up)
        print(up.name)
    end)
    -- levelUpIndex = math.random(1, 3) -- Choisit une upgrade aléatoire
    soundSamplerUpgradeSelected:play()
    generate = false
    ups[indexOf(ups, findMinUpgradeWeapon(ups))]:applyUpgrade()
    -- game.timer:start()
    -- table.each(player.weapons, function (w)
    --     w.timer:start()
    -- end)
    table.each(spawners, function (s)
        s:resume()
    end)
    playdate.update = gameUpdate
    player:checkLevel()
end

function findMinUpgradeWeapon(tbl)
    if not tbl or type(tbl) ~= "table" or #tbl == 0 then
        return nil -- Retourne nil si la table est vide ou invalide
    end
    
    local upgradeWeapons = {}
    local minElement = tbl[1]
    local minCount = minElement.count
    
    for _, element in ipairs(tbl) do
        if element.count ~= nil and (not minCount or element.count < minCount) then
            minElement = element
            minCount = element.count
        end
        if element.className == "UpgradeWeapon" then
            table.insert(upgradeWeapons, element)
        end
    end
    
    if #upgradeWeapons > 0 then
        minElement = upgradeWeapons[1]
        minCount = minElement.count
        local sameCountElements = {minElement}
        
        for i = 2, #upgradeWeapons do
            local element = upgradeWeapons[i]
            if element.count < minCount then
                minElement = element
                minCount = element.count
                sameCountElements = {minElement}
            elseif element.count == minCount then
                table.insert(sameCountElements, element)
            end
        end
        
        if #sameCountElements > 1 then
            minElement = sameCountElements[math.random(#sameCountElements)]
        end
    end
    
    return minElement
end
