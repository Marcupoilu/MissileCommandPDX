cannonsData = 
{
    -- name, weapons, passives, cost, image, imageBase, id
    Cannon("Blaster", {table.findByParam(weaponsData, "className", "Beam")}, {getUpgradePassive("attackSpeedBonus")}, 0, gfx.image.new("images/player/cannons/cannon_simpleCannon"), gfx.image.new("images/player/bases/base_simpleCannon"), "blaster"),
    Cannon("Laser", {table.findByParam(weaponsData, "className", "Beam")}, {getUpgradePassive("durationBonus")}, 0, gfx.image.new("images/player/cannons/cannon_beam"),  gfx.image.new("images/player/bases/base_beam"), "beam"),
    Cannon("Orbital", {table.findByParam(weaponsData, "className", "Orbital")}, {getUpgradePassive("durationBonus")}, 0, gfx.image.new("images/player/cannons/cannon_orbital"),  gfx.image.new("images/player/bases/base_orbital"), "orbital"),
    Cannon("Rocket", {table.findByParam(weaponsData, "className", "Rocket")}, {getUpgradePassive("durationBonus")}, 0, gfx.image.new("images/player/cannons/cannon_rocket"),  gfx.image.new("images/player/bases/base_rocket"), "rocket")
}