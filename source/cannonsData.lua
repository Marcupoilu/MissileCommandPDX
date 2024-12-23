function createCannonsData()
    cannonsData = 
    {
        -- name, weapons, passives, cost, image, imageBase, id
        Cannon("Blaster", {table.findByParam(weaponsData, "className", "SimpleCannon")}, {getUpgradePassive("attackSpeedBonus")}, 0, gfx.image.new("images/player/cannons/cannon_simpleCannon"), gfx.image.new("images/player/bases/base_simpleCannon"), "blaster"),
        Cannon("Laser", {table.findByParam(weaponsData, "className", "Beam")}, {getUpgradePassive("durationBonus")}, 0, gfx.image.new("images/player/cannons/cannon_beam"),  gfx.image.new("images/player/bases/base_beam"), "beam"),
        Cannon("Orbital", {table.findByParam(weaponsData, "className", "Orbital")}, {getUpgradePassive("durationBonus")}, 0, gfx.image.new("images/player/cannons/cannon_orbital"),  gfx.image.new("images/player/bases/base_orbital"), "orbital"),
        Cannon("Rocket", {table.findByParam(weaponsData, "className", "Rocket")}, {getUpgradePassive("durationBonus")}, 0, gfx.image.new("images/player/cannons/cannon_rocket"),  gfx.image.new("images/player/bases/base_rocket"), "rocket"),
        Cannon("Artillery", {table.findByParam(weaponsData, "className", "Rocket"),table.findByParam(weaponsData, "className", "Guided")}, {getUpgradePassive("durationBonus")}, 0, gfx.image.new("images/player/cannons/cannon_artillery"),  gfx.image.new("images/player/bases/base_artillery"), "artillery"),
        Cannon("Cosmic", {table.findByParam(weaponsData, "className", "Orbital"),table.findByParam(weaponsData, "className", "Blackhole")}, {getUpgradePassive("durationBonus")}, 0, gfx.image.new("images/player/cannons/cannon_cosmic"),  gfx.image.new("images/player/bases/base_cosmic"), "cosmic"),
        Cannon("Defender", {table.findByParam(weaponsData, "className", "Drone"),table.findByParam(weaponsData, "className", "Aura")}, {getUpgradePassive("durationBonus")}, 0, gfx.image.new("images/player/cannons/cannon_defender"),  gfx.image.new("images/player/bases/base_defender"), "defender"),
        Cannon("Plasma", {table.findByParam(weaponsData, "className", "Plasma")}, {getUpgradePassive("durationBonus")}, 0, gfx.image.new("images/player/cannons/cannon_plasma"),  gfx.image.new("images/player/bases/base_plasma"), "plasma"),
        Cannon("Reflecting", {table.findByParam(weaponsData, "className", "Plasma"),table.findByParam(weaponsData, "className", "BeamReflect")}, {getUpgradePassive("durationBonus")}, 0, gfx.image.new("images/player/cannons/cannon_reflecting"),  gfx.image.new("images/player/bases/base_reflecting"), "reflecting"),
        Cannon("Shotgun", {table.findByParam(weaponsData, "className", "Flamethrower")}, {getUpgradePassive("durationBonus")}, 0, gfx.image.new("images/player/cannons/cannon_shotgun"),  gfx.image.new("images/player/bases/base_shotgun"), "shotgun"),
        Cannon("Tactical", {table.findByParam(weaponsData, "className", "Flamethrower"),table.findByParam(weaponsData, "className", "Freezer")}, {getUpgradePassive("durationBonus")}, 0, gfx.image.new("images/player/cannons/cannon_thermal"),  gfx.image.new("images/player/bases/base_thermal"), "tactical"),
        Cannon("Wide", {table.findByParam(weaponsData, "className", "Shockwave"),table.findByParam(weaponsData, "className", "ToxicVape")}, {getUpgradePassive("durationBonus")}, 0, gfx.image.new("images/player/cannons/cannon_wide"),  gfx.image.new("images/player/bases/base_wide"), "wide"),
    }
end