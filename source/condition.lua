class("Condition").extends()

function Condition:init(statName, statValue)
    self.statName = statName
    self.statValue = statValue
end

function Condition:checkCondition()
    if player[self.statName] >= self.statValue then
        return true
    else
        return false
    end
end