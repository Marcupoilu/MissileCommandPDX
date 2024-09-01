upgradesData = 
{
    -- stat / amount / description / icon / count max / rarity
    -- type / name / description / icon / count max / rarity
    UpgradeStat({{name="attackSpeedBonus",value=10}}, "-10% Cooldown", "images/cooldown",5, 5),
    UpgradeStat({{name="damageBonus",value=10}}, "+10% Damage", "images/damageUp",5,7),
    UpgradeStat({{name="scaleBonus",value=10}}, "+10% bullet \nscale", "images/projectileScale",5,5),
    UpgradeStat({{name="xpBonus",value=10}}, "+10% XP", "images/xpUp",5,4),
    UpgradeStat({{name="regenerationRate",value=10}}, "+10% hp regen \nspeed", "images/regen",5,6),
    UpgradeStat({{name="projectileSpeedBonus",value=10}}, "+10% bullet \nspeed", "images/projectileSpeed",5,4),
    UpgradeStat({{name="hpMax",value=10}}, "+1 HP MAX", "images/hpMax",5,3),
    UpgradeStat({{name="durationBonus",value=10}}, "+10% duration", "images/ui/icons/duration",5,4),
    UpgradeStat({{name="lives",value=1}}, "+1 Life", "images/ui/icons/lifeUp",5,9, true),
    UpgradeStat({{name="shield",value=1}}, "+1 Shield", "images/ui/icons/shield",5,4),
    UpgradeStat({{name="rerolls",value=1}}, "+1 Reroll", "images/ui/icons/rerolls",5,2, true),
    UpgradeStat({{name="damageBonus",value=4},{name="scaleBonus",value=4}, {name="projectileSpeedBonus",value=4}, {name="attackSpeedBonus",value=4}}, "+4% Omni", "images/ui/icons/omni",5, 10),
    UpgradeWeapon("SimpleCannon", "Cannon", "", "images/ui/icons/simpleCannon",10, 2 ),
    UpgradeWeapon("Beam", "Laser Beam", "", "images/ui/icons/beam",10, 3 ),
    UpgradeWeapon("Aura", "Aura", "", "images/ui/icons/aura" ,10, 3),
    UpgradeWeapon("Wiper", "Wiper", "", "images/ui/icons/wiper" ,10, 3),
    UpgradeWeapon("BeamReflect", "Reflect Beam", "", "images/ui/icons/BeamReflect",10 ,5),
    UpgradeWeapon("Blackhole", "Blackhole", "", "images/ui/icons/BlackHole",10 ,7),
    UpgradeWeapon("Drone", "Laser Drone", "", "images/ui/icons/droneLaser",10 , 7),
    UpgradeWeapon("Flamethrower", "Flamethrower", "", "images/ui/icons/flamethrower",10 ,4 ),
    UpgradeWeapon("Freezer", "Freezer", "", "images/ui/icons/freezer",10 ,2),
    UpgradeWeapon("Guided", "Guided", "", "images/ui/icons/guided",10 ,4),
    UpgradeWeapon("LaserDome", "Laser Dome", "", "images/ui/icons/laserDome",10 ,1),
    UpgradeWeapon("Orbital", "Orbital", "", "images/ui/icons/orbital",10, 3 ),
    UpgradeWeapon("Plasma", "Plasma", "", "images/ui/icons/plasma",10, 2 ),
    UpgradeWeapon("Rocket", "Explosive", "", "images/ui/icons/rocket",10, 4 ),
    UpgradeWeapon("Serpentine", "Sine Bullet", "", "images/ui/icons/serpentine",10 , 2 ),
    UpgradeWeapon("Shockwave", "Shockwave", "", "images/ui/icons/shockwave",10, 2 ),
    UpgradeWeapon("ToxicVape", "Toxic Vape", "", "images/ui/icons/toxicVape",10, 8 ),
    UpgradeWeapon("Tracer", "Tracer", "", "images/ui/icons/tracer",10, 9 )


}

function getUpgradePassive(passiveName)
    for key, upgrade in pairs(upgradesData) do
        for key, stat in pairs(upgrade.stats) do            
            if stat.name == passiveName then
                return upgrade
            end
        end
    end
end