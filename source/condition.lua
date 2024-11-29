class("Condition").extends()

function Condition:init(statName, statValue, persistant)
    self.statName = statName
    self.statValue = statValue
    self.persistant = persistant
end

function Condition:checkCondition()
    local stat = player[self.statName]
    if self.persistant ~= nil then
        stat = playerBonus.gameData[self.statName]
    end
    if stat >= self.statValue then
        return true
    else
        return false
    end
end