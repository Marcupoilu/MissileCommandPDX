function createCannonsData()
    cannonsData = 
    {
        -- name, weapons, cost, image, imageBase, id
        Cannon("Blaster", {table.findByParam(weaponsData, "className", "SimpleCannon")}, 0, gfx.image.new("images/player/cannons/cannon_simpleCannon"), gfx.image.new("images/player/bases/base_simpleCannon"), "blaster"),
        Cannon("Laser", {table.findByParam(weaponsData, "className", "Beam")}, 0, gfx.image.new("images/player/cannons/cannon_beam"),  gfx.image.new("images/player/bases/base_beam"), "beam"),
        Cannon("Orbital", {table.findByParam(weaponsData, "className", "Orbital")}, 0, gfx.image.new("images/player/cannons/cannon_orbital"),  gfx.image.new("images/player/bases/base_orbital"), "orbital"),
        Cannon("Rocket", {table.findByParam(weaponsData, "className", "Rocket")}, 0, gfx.image.new("images/player/cannons/cannon_rocket"),  gfx.image.new("images/player/bases/base_rocket"), "rocket"),
        Cannon("Shotgun", {table.findByParam(weaponsData, "className", "Flamethrower")},  0, gfx.image.new("images/player/cannons/cannon_shotgun"),  gfx.image.new("images/player/bases/base_shotgun"), "shotgun"),
    }
end