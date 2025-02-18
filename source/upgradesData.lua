function createUpgradesData()
    
    upgradesData = 
    {
        -- stat / amount / description / icon / count max / rarity
        -- type / name / description / icon / count max / rarity
        -- UpgradeStat({{name="attackSpeedBonus",value=10}}, "-10% Cooldown", "images/ui/icons/cooldown",5, 5,nil, "cooldown"),
        UpgradeStat({{name="damageBonus",value=10}}, "+10% Damage", "images/ui/icons/damageUp",5,7,nil, "damage"),
        UpgradeStat({{name="scaleBonus",value=10}}, "+10% bullet \nscale", "images/ui/icons/projectileScale",5,5, nil, "scale"),
        UpgradeStat({{name="xpBonus",value=20}}, "+20% XP", "images/ui/icons/xpUp",5,4, nil, "xp"),
        UpgradeStat({{name="regenerationRate",value=20}}, "+20% hp regen \nspeed", "images/ui/icons/regen",5,6, nil, "regen"),
        UpgradeStat({{name="projectileSpeedBonus",value=20}}, "+20% bullet \nspeed", "images/ui/icons/projectileSpeed",5,4, nil, "speed"),
        UpgradeStat({{name="hpMax",value=5}, {name="hp", value=5}}, "+5 HP MAX", "images/ui/icons/hpMax",5,3, nil, "hp"),
        UpgradeStat({{name="durationBonus",value=10}}, "+10% duration", "images/ui/icons/duration",5,4, nil, "duration"),
        UpgradeStat({{name="lives",value=1}}, "+1 Life", "images/ui/icons/lifeUp",5,9, true, "lifeUp"),
        UpgradeStat({{name="shield",value=1}}, "+1 Armor", "images/ui/icons/shield",5,4, nil, "shield"),
        UpgradeStat({{name="rerolls",value=2}}, "+2 Reroll", "images/ui/icons/rerolls",5,2, true, "rerolls"),
        UpgradeStat({{name="core",value=100}}, "+100 Core", "images/ui/core",10000,1, true, "core"),
        UpgradeStat({{name="hp",value=5}}, "+5 HP", "images/ui/icons/hpMax",10000,1, true, "hpRegen"),
        UpgradeStat({{name="bulletHpBonus",value=1}}, "+1 Bullet Piercing", "images/ui/icons/piercing",10000,1, nil, "bulletHpBonus"),
        UpgradeStat({{name="damageBonus",value=5},{name="scaleBonus",value=5}, {name="projectileSpeedBonus",value=5}, {name="bulletHpBonus",value=1}}, "+5% Omni", "images/ui/icons/omni",5, 10, nil, "omni"),
        UpgradeWeapon("SimpleCannon", "Cannon", "", "images/ui/icons/simpleCannon",5, 2 ),
        UpgradeWeapon("Beam", "Laser Beam", "", "images/ui/icons/beam",5, 3 ),
        UpgradeWeapon("Aura", "Aura", "", "images/ui/icons/aura" ,5, 3),
        UpgradeWeapon("Wiper", "Wiper", "", "images/ui/icons/wiper" ,5, 3),
        UpgradeWeapon("BeamReflect", "Reflect Beam", "", "images/ui/icons/BeamReflect",5 ,5),
        UpgradeWeapon("Blackhole", "Blackhole", "", "images/ui/icons/BlackHole",5 ,7),
        UpgradeWeapon("Drone", "Laser Drone", "", "images/ui/icons/droneLaser",5 , 7),
        UpgradeWeapon("Flamethrower", "Shotgun", "", "images/ui/icons/shotgun",5 ,4 ),
        UpgradeWeapon("Freezer", "Freezer", "", "images/ui/icons/freezer",5 ,2),
        UpgradeWeapon("Guided", "Guided", "", "images/ui/icons/guided",5 ,4),
        UpgradeWeapon("LaserDome", "Laser Dome", "", "images/ui/icons/laserDome",5 ,1),
        UpgradeWeapon("Orbital", "Orbital", "", "images/ui/icons/orbital",5, 3 ),
        UpgradeWeapon("Plasma", "Plasma", "", "images/ui/icons/plasma",5, 2 ),
        UpgradeWeapon("Rocket", "Explosive", "", "images/ui/icons/rocket",5, 4 ),
        UpgradeWeapon("Serpentine", "Serpentine", "", "images/ui/icons/serpentine",5 , 2 ),
        UpgradeWeapon("Shockwave", "Shockwave", "", "images/ui/icons/shockwave",5, 2 ),
        UpgradeWeapon("ToxicVape", "Toxic Vape", "", "images/ui/icons/toxicVape",5, 8 ),
        UpgradeWeapon("Tracer", "Tracer", "", "images/ui/icons/tracer",5, 9 )
    }
end

function getUpgradePassive(passiveName)
    for key, upgrade in pairs(upgradesData) do
        for key, stat in pairs(upgrade.stats) do        
            if stat.name == passiveName then
                return upgrade
            end
        end
    end
end

function getPassiveName(passive, passiveName)
    for key, stat in pairs(passive.stats) do        
        if stat.name == passiveName then
            return true
        else
            return false
        end
    end
end

function getUpgradePassiveByName(passiveName)
    for key, upgrade in pairs(upgradesData) do
        if upgrade.name == passiveName then
            return upgrade
        end
    end
end