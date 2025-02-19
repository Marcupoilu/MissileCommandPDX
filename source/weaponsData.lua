function CreateWeaponsData()
    weaponsData = 
    {
        -- intervalTime, x, y, speed, damage, projectile amount, scale , duration
        SimpleCannon(toMilliseconds(0.4), 200, 175, 10, 0.7, 1, 1), -- balanced starter
        Beam(toMilliseconds(6), 200, 175, 200, 0.5, 1, 4, toMilliseconds(2.5)), -- balanced starter
        Wiper(toMilliseconds(15), 200, 175, 1, 3, 1, 1), -- a revoir apres ennemies HP setup
        Plasma(toMilliseconds(9), 200, 175, 6, 1, 1, 1, toMilliseconds(3)),  -- balanced starter
        Serpentine(toMilliseconds(0.6), 200, 175, 6, 0.3, 1, 1, toMilliseconds(3)), -- balanced starter
        Shockwave(toMilliseconds(3), 200, 175, 4, 0.25, 1, 1, toMilliseconds(3)), -- balanced starter
        Rocket(toMilliseconds(5), 200, 175, 3, 0, 1, 1,toMilliseconds(5)), -- balanced starter
        -- Guided(toMilliseconds(0.5), 200, 175, 5, 0.5, 1, 1,toMilliseconds(3)), -- balanced starter (rework direction bug)
        Flamethrower(toMilliseconds(2), 200, 175, 1, 2, 1, 1,toMilliseconds(1)), -- to rework integrally
        Freezer(toMilliseconds(4), 200, 175, 100, 0, 1, 4, toMilliseconds(1)), -- balanced starter
        LaserDome(toMilliseconds(5), 200, 175, 100, 1, 1, 2, toMilliseconds(5)), -- balanced starter
        ToxicVape(toMilliseconds(4), 200, 175, 2, 0.5, 1, 1, toMilliseconds(10)), -- to rework integrally
        Aura(toMilliseconds(3), 200, 175, 1, 0.25, 1, 1, toMilliseconds(3)), -- to rework collision detection
        Blackhole(toMilliseconds(7), 200, 175, 1, 1, 1, 1, toMilliseconds(2)), -- balanced starter / rework direction after blackhole for ennemies
        Drone(toMilliseconds(5), 200, 175, 70, 0.5, 1, 1, toMilliseconds(3)), -- balanced starter
        Orbital(toMilliseconds(3), 200, 175, 50, 1, 1, 1, toMilliseconds(3)), -- balanced starter / rework orbit fonction speed
        BeamReflect(toMilliseconds(5), 200, 175, 10, 2, 1, 3, toMilliseconds(3)), -- balanced starter
        Tracer(toMilliseconds(6), 200, 175, 5, 0.5, 1, 4, toMilliseconds(4))  -- balanced starter
    }
end