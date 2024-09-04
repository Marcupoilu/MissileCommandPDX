class("ConditionWeaponLevel").extends(Condition)

function ConditionWeaponLevel:init(statName, statValue)
    ConditionWeaponLevel.super.init(self,statName,statValue)
end

function ConditionWeaponLevel:checkCondition()
    local weapon = table.findByParam(player.weapons, "type", self.statName)
    if weapon ~= nil then
        if weapon.level >= self.statValue then
            return true
        else
            return false
        end
    end
    return false
end