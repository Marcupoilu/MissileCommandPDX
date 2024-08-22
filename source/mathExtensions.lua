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