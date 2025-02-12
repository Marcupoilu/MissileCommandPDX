function createCannonsData()
    cannonsData = 
    {
        -- name, weapons, cost, image, imageBase, id
        Cannon("Bolter Cannon", {table.findByParam(weaponsData, "className", "SimpleCannon")}, 0, gfx.image.new("images/player/cannons/cannon_simpleCannon"), gfx.image.new("images/player/bases/base_simpleCannon"), "blaster"),
        Cannon("Beam Cannon", {table.findByParam(weaponsData, "className", "Beam")}, 0, gfx.image.new("images/player/cannons/cannon_beam"),  gfx.image.new("images/player/bases/base_beam"), "beam"),
        Cannon("Orbital Cannon", {table.findByParam(weaponsData, "className", "Orbital")}, 0, gfx.image.new("images/player/cannons/cannon_orbital"),  gfx.image.new("images/player/bases/base_orbital"), "orbital"),
        Cannon("Rocket Cannon", {table.findByParam(weaponsData, "className", "Rocket")}, 0, gfx.image.new("images/player/cannons/cannon_rocket"),  gfx.image.new("images/player/bases/base_rocket"), "rocket"),
        Cannon("Shotgun Cannon", {table.findByParam(weaponsData, "className", "Flamethrower")},  0, gfx.image.new("images/player/cannons/cannon_shotgun"),  gfx.image.new("images/player/bases/base_shotgun"), "shotgun"),
    }
end