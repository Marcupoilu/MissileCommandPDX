function CreateWeaponsData()
    weaponsData = 
    {
        -- intervalTime, x, y, speed, damage, projectile amount, scale , duration
        SimpleCannon(toMilliseconds(1), 200, 175, 4, 1, 1, 1), -- balanced starter
        Beam(toMilliseconds(4), 200, 175, 4, 0.5, 1, 4, 2), -- balanced starter
        Wiper(minutes_to_milliseconds(0.5), 200, 175, 1, 3, 1, 1), -- a revoir apres ennemies HP setup
        Plasma(toMilliseconds(8), 200, 175, 4, 1, 1, 1, 6),  -- balanced starter
        Serpentine(toMilliseconds(0.5), 200, 175, 4, 0.3, 1, 1, 3), -- balanced starter
        Shockwave(toMilliseconds(1.5), 200, 175, 4, 0.2, 1, 1, 3), -- balanced starter
        Rocket(toMilliseconds(3), 200, 175, 3, 0, 1, 1,5), -- balanced starter
        Guided(toMilliseconds(0.3), 200, 175, 4,0.4, 1, 1,3), -- balanced starter (rework direction bug)
        Flamethrower(toMilliseconds(3), 200, 175, 1,0.3, 1, 1,1.5), -- to rework integrally
        Freezer(toMilliseconds(1.5), 200, 175, 100, 0, 1, 4, 0.5), -- balanced starter
        LaserDome(toMilliseconds(3), 200, 175, 100, 1, 1, 2, 3), -- balanced starter
        ToxicVape(toMilliseconds(3), 200, 175, 3, 1, 1, 1, 10), -- to rework integrally
        Aura(toMilliseconds(3), 200, 175, 1, 0.2, 1, 1, 3), -- to rework collision detection
        Blackhole(toMilliseconds(5), 200, 175, 1, 1, 1, 1, 2), -- balanced starter / rework direction after blackhole for ennemies
        Drone(toMilliseconds(5), 200, 175, 4, 0.5, 1, 1, 3), -- balanced starter
        Orbital(toMilliseconds(2), 200, 175, 2.5, 1, 1, 1), -- balanced starter / rework orbit fonction speed
        BeamReflect(toMilliseconds(5), 200, 175, 10, 2, 1, 3, 3), -- balanced starter
        Tracer(toMilliseconds(6), 200, 175, 4, 0.5, 1, 4, 4)  -- balanced starter
    }
end