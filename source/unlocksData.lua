unlocksData = 
{
    -- name, image, description, condition, upgrade
    UnlockPassive("Cooldown-", gfx.image.new("images/ui/icons/cooldown"), "Reach Level 5", Condition("level", 5), getUpgradePassive("attackSpeedBonus")),
    UnlockPassive("XP+", gfx.image.new("images/ui/icons/xpUp"), "Reach Level 10", Condition("level", 10), getUpgradePassive("xpBonus")),
    UnlockPassive("Regeneration", gfx.image.new("images/ui/icons/regen"), "Reach Level 10", Condition("level", 10), getUpgradePassive("regenerationRate")),
    UnlockPassive("Duration", gfx.image.new("images/ui/icons/duration"), "Reach Level 15", Condition("level", 15), getUpgradePassive("durationBonus")),
    UnlockPassive("Life Up", gfx.image.new("images/ui/icons/lifeUp"), "Reach Level 15", Condition("level", 15), getUpgradePassive("lives")),
    UnlockPassive("Shield", gfx.image.new("images/ui/icons/shield"), "Reach Level 20", Condition("level", 20), getUpgradePassive("shield")),
    UnlockPassive("Reroll", gfx.image.new("images/ui/icons/rerolls"), "Reach Level 20", Condition("level", 20), getUpgradePassive("rerolls")),
    UnlockPassive("Omni", gfx.image.new("images/ui/icons/omni"), "Reach Level 30", Condition("level", 30), getUpgradePassiveByName("omni")),
    UnlockWeapon("Aura", gfx.image.new("images/ui/icons/aura"), "Kill 30 enemies", Condition("enemiesKilled", 30), table.findByParam(weaponsData, "className", "Aura")),
    UnlockWeapon("Wiper", gfx.image.new("images/ui/icons/wiper"), "Kill 50 enemies", Condition("enemiesKilled", 50), table.findByParam(weaponsData, "className", "Wiper")),
    UnlockWeapon("BeamReflect", gfx.image.new("images/ui/icons/BeamReflect"), "Kill 50 enemies", Condition("enemiesKilled", 50), table.findByParam(weaponsData, "className", "BeamReflect")),
    UnlockWeapon("Blackhole", gfx.image.new("images/ui/icons/blackHole"), "Kill 75 enemies", Condition("enemiesKilled", 75), table.findByParam(weaponsData, "className", "Blackhole")),
    UnlockWeapon("Drone", gfx.image.new("images/ui/icons/droneLaser"), "Kill 30 enemies", Condition("enemiesKilled", 30), table.findByParam(weaponsData, "className", "Drone")),
    UnlockWeapon("Flamethrower", gfx.image.new("images/ui/icons/flamethrower"), "Kill 30 enemies", Condition("enemiesKilled", 30), table.findByParam(weaponsData, "className", "Flamethrower")),
    UnlockWeapon("Freezer", gfx.image.new("images/ui/icons/freezer"), "Kill 30 enemies", Condition("enemiesKilled", 30), table.findByParam(weaponsData, "className", "Freezer")),
    UnlockWeapon("Guided", gfx.image.new("images/ui/icons/guided"), "Kill 30 enemies", Condition("enemiesKilled", 30), table.findByParam(weaponsData, "className", "Guided")),
    UnlockWeapon("LaserDome", gfx.image.new("images/ui/icons/laserDome"), "Kill 30 enemies", Condition("enemiesKilled", 30), table.findByParam(weaponsData, "className", "LaserDome")),
    UnlockWeapon("Orbital", gfx.image.new("images/ui/icons/orbital"), "Kill 30 enemies", Condition("enemiesKilled", 30), table.findByParam(weaponsData, "className", "Orbital")),
    UnlockWeapon("Serpentine", gfx.image.new("images/ui/icons/serpentine"), "Kill 30 enemies", Condition("enemiesKilled", 30), table.findByParam(weaponsData, "className", "Serpentine")),
    UnlockWeapon("Shockwave", gfx.image.new("images/ui/icons/shockwave"), "Kill 30 enemies", Condition("enemiesKilled", 30), table.findByParam(weaponsData, "className", "Shockwave")),
    UnlockWeapon("ToxicVape", gfx.image.new("images/ui/icons/toxicVape"), "Kill 30 enemies", Condition("enemiesKilled", 30), table.findByParam(weaponsData, "className", "ToxicVape")),
    UnlockWeapon("Tracer", gfx.image.new("images/ui/icons/tracer"), "Kill 30 enemies", Condition("enemiesKilled", 30), table.findByParam(weaponsData, "className", "Tracer")),
    UnlockCannon("Laser", gfx.image.new("images/ui/icons/beam"), "Reach level 5 with beam", ConditionWeaponLevel("Beam", 5), table.findByParam(cannonsData, "id", "beam")),
    UnlockCannon("Orbiter", gfx.image.new("images/ui/icons/orbital"), "Reach level 5 with orbital", ConditionWeaponLevel("Orbital", 5), table.findByParam(cannonsData, "id", "orbital")),
    UnlockCannon("Launcher", gfx.image.new("images/ui/icons/rocket"), "Reach level 5 with rocket", ConditionWeaponLevel("Rocket", 5), table.findByParam(cannonsData, "id", "rocket")),
}