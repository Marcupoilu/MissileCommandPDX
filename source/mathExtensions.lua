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

function math.sign(v)
    return (v >= 0 and 1) or -1
  end

  function math.round(v, bracket)
    local bracket = bracket or 1
    return math.floor(v/bracket + math.sign(v) * 0.5) * bracket
  end

  