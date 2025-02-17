function math.clamp(a, min, max)
    if min > max then
        min, max = max, min
    end
    return math.max(min, math.min(max, a))
end

function math.ring(a, min, max)
    if min > max then
        min, max = max, min
    end
    return min + (a-min)%(max-min)
end

function math.ringInvert(a, min, max)
    -- if min > max then
    --     min, max = max, min
    -- end
    return min - (a-min)%(max-min)
end

function math.ring_int(a, min, max)
    return math.ring(a, min, max+1)
end

function math.approach( value, target, step)
    if value==target then
        return value, true
    end

    local d = target-value
    if d>0 then
        value = value + step
        if value >= target then
            return target, true
        else
            return value, false
        end
    elseif d<0 then
        value = value - step
        if value <= target then
            return target, true
        else
            return value, false
        end
    else
        return value, true
    end
end

function math.between(v, t1, t2)
    if v >= t1 and v <= t2 then
        return true
    end
    return false
end

function math.sign(v)
    return (v >= 0 and 1) or -1
  end

  function math.round(v, bracket)
    local bracket = bracket or 1
    return math.floor(v/bracket + math.sign(v) * 0.5) * bracket
  end

  function minutes_to_milliseconds(minutes)
    local milliseconds = minutes * 60 * 1000
    return milliseconds
end

function cutAngle(X)
    -- Si X est 1, retourne un seul angle 0
    if X == 1 then
        return {0}
    end

    -- Table pour stocker les angles
    local angles = {}

    -- Calcul de l'intervalle en excluant -90 et 90
    local intervalAngle = 90 / (X - 1)

    -- Génération des angles en répartissant autour de 0
    for i = 0, X-1 do
        local angle = -((X-1)/2) * intervalAngle + i * intervalAngle
        -- Ajuster pour inclure toujours un angle à 0
        if X % 2 == 0 and i == X // 2 then
            angle = 0
        end
        table.insert(angles, angle)
    end

    return angles
end


function indexOf(array, value)
    for i, v in ipairs(array) do
        if v == value then
            return i
        end
    end
    return nil
end

function normalizeAngle(angle)
    if angle >= 270 then
        return angle - 270
    else
        return angle + 90
    end
end

function lerp(a, b, t)
    return a + (b - a) * t
end

function getMinDistanceValue(spriteSource, sprites)
    local target = nil
    local minDistance = 100000
    for key, sprite in pairs(sprites) do
        if sprite:isa(Enemy) == true and sprite ~= spriteSource then
            local dx = spriteSource.x - sprite.x
            local dy = spriteSource.y - sprite.y
            local distance = math.sqrt(dx * dx + dy * dy)
            if distance < minDistance then
                minDistance = distance
                target = sprite
            end
        end
    end
    return target
end

function atan2(dy, dx)
    dy = -dy

    if dx > 0 then
        return math.atan(dy / dx) - math.pi / 2
    elseif dx < 0 then
        return math.atan(dy / dx) + math.pi / 2
    elseif dx == 0 and dy > 0 then
        return math.pi
    elseif dx == 0 and dy < 0 then
        return 0
    else
        return 0 -- Cas où dx == 0 et dy == 0
    end
end

function GetXYCenteredFromRect(rectX, rectY, rectWidth, rectHeight, width, height)
    local imageX = rectX + (rectWidth - width) / 2
    local imageY = rectY + (rectHeight - height) / 2
    return {x=imageX, y=imageY}
end

function modulo5(n)
    local reste = n % 5
    if reste == 0 then
        return 0
    else
        return 5 - reste
    end
end

function lastLineItemCount(n)
    local remainder = n % 5
    if remainder == 0 then
        return 5  -- La dernière ligne est complète
    else
        return remainder  -- Le nombre d'items dans la dernière ligne incomplète
    end
end

function isLastItemInCategory(selectedItem, categories)
    local totalItemsBeforeCategory = 0

    for _, category in ipairs(categories) do
        local categoryCount = #category
        
        -- Si selectedItem est dans cette catégorie
        if selectedItem > totalItemsBeforeCategory and selectedItem <= totalItemsBeforeCategory + categoryCount then
            -- Vérifier si selectedItem est le dernier de la catégorie
            local lastItemInCategory = totalItemsBeforeCategory + categoryCount
            return selectedItem == lastItemInCategory
        end
        
        totalItemsBeforeCategory = totalItemsBeforeCategory + categoryCount
    end
    
    -- Si selectedItem n'est pas trouvé dans les catégories (au cas où)
    return false
end

function calculateUnlockPercentage(playerUnlocks, allUnlocks)
    local totalUnlocks = #allUnlocks
    local playerUnlockCount = #playerUnlocks
    
    if totalUnlocks == 0 then
        return 0 -- Évite une division par zéro si la liste des unlocks est vide
    end
    
    local percentageUnlocked = (playerUnlockCount / totalUnlocks) * 100
    return math.round(percentageUnlocked)
end

function calculateShopItemsLevelPercentage(purchasedShopItems, allShopItems)
    local totalLevelsBought = 0
    local totalLevelsAvailable = 0

    -- Calcul des niveaux achetés par le joueur
    for _, item in ipairs(purchasedShopItems) do
        totalLevelsBought = totalLevelsBought + item.level
    end

    -- Calcul des niveaux disponibles dans le jeu
    for _, item in ipairs(allShopItems) do
        totalLevelsAvailable = totalLevelsAvailable + item.levelMax
    end

    if totalLevelsAvailable == 0 then
        return 0 -- Pour éviter une division par zéro
    end

    -- Calcul du pourcentage
    local percentage = (totalLevelsBought / totalLevelsAvailable) * 100
    return math.round(percentage)
end

function math.minParam(tbl, param)
    if not tbl or type(tbl) ~= "table" or #tbl == 0 then
        return nil -- Retourne nil si la table est vide ou invalide
    end
    
    local minElement = tbl[1] -- Initialise avec le premier élément
    local minValue = minElement[param] -- Initialise avec la première valeur du paramètre
    if minValue == nil then return nil end -- Si le paramètre n'existe pas, retourne nil
    
    for i = 2, #tbl do
        local value = tbl[i][param]
        if value ~= nil and value < minValue then
            minValue = value
            minElement = tbl[i]
        end
    end
    
    return minElement
end