cannonsData = 
{
    -- name, weapons, passives, cost
    Cannon("Defender", {table.findByParam(weaponsData, "className", "SimpleCannon")}, {getUpgradePassive("attackSpeedBonus")}, 0),
    Cannon("Blaster", {table.findByParam(weaponsData, "className", "Beam")}, {getUpgradePassive("durationBonus")}, 0)
}