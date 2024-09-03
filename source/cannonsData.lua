cannonsData = 
{
    -- name, weapons, passives, cost, image
    Cannon("Defender", {table.findByParam(weaponsData, "className", "SimpleCannon")}, {getUpgradePassive("attackSpeedBonus")}, 0, gfx.image.new("images/player/guns/gun_cannon")),
    Cannon("Blaster", {table.findByParam(weaponsData, "className", "Beam")}, {getUpgradePassive("durationBonus")}, 0, gfx.image.new("images/player/guns/gun_default"))
}