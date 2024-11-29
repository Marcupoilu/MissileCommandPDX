class("conditionMapCleared").extends(Condition)

function conditionMapCleared:init(statName)
    conditionMapCleared.super.init(self,statName)
end

function conditionMapCleared:checkCondition()
    local mapCount = self.statName
    if playerBonus.gameData.mapCount > mapCount then
        return true
    else
        return false
    end
end