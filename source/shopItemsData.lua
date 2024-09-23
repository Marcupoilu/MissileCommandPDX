shopItemsData = 
{
    -- unlock, cost, level, levelMax, multiplyer
    ShopItem("Speed Up",UnlockPassive("Speed Up", gfx.image.new("images/ui/icons/projectileSpeed"), "", nil, getUpgradePassive("projectileSpeedBonus"), "+10% Projectile Speed"),1000, 0, 5, 1.5),
    ShopItem("Scale Up",UnlockPassive("Scale Up", gfx.image.new("images/ui/icons/projectileScale"), "", nil, getUpgradePassive("scaleBonus"), "+10% Projectile Scale"),100, 0, 5, 1.5),
    ShopItem("HP Up",UnlockPassive("HP Up", gfx.image.new("images/ui/icons/hpMax"), "", nil, getUpgradePassive("hpMax"), "+10 HP"),100, 0, 5, 1.5),
    ShopItem("Damage Up",UnlockPassive("Damage Up", gfx.image.new("images/ui/icons/damageUp"), "", nil, getUpgradePassive("damageBonus"), "+10% Damage Bonus"),100, 0, 5, 1.5),
    ShopItem("Cooldown-",table.findByParam(unlocksData, "name","Cooldown-"),100, 0, 5, 1.5),
    ShopItem("XP+",table.findByParam(unlocksData, "name","XP+"),100, 0, 5, 1.5),
    ShopItem("Regeneration",table.findByParam(unlocksData, "name","Regeneration"),100, 0, 5, 1.5),
    ShopItem("Duration",table.findByParam(unlocksData, "name","Duration"),100, 0, 5, 1.5),
    ShopItem("Life Up",table.findByParam(unlocksData, "name","Life Up"),100, 0, 5, 1.5),
    ShopItem("Shield",table.findByParam(unlocksData, "name","Shield"),100, 0, 5, 1.5),
    ShopItem("Reroll",table.findByParam(unlocksData, "name","Reroll"),100, 0, 5, 1.5),
    ShopItem("Omni",table.findByParam(unlocksData, "name","Omni"),100, 0, 1, 1.5),
    ShopItem("Laser",table.findByParam(unlocksData, "name","Laser"),100, 0, 1, 1.5),
    ShopItem("Orbiter",table.findByParam(unlocksData, "name","Orbiter"),100, 0, 1, 1.5),
    ShopItem("Launcher",table.findByParam(unlocksData, "name","Launcher"),100, 0, 1, 1.5),
}