shopItemsData = 
{
    -- unlock, cost, level, levelMax, multiplyer
    ShopItem("Damage Up",UnlockPassive("Damage Up", gfx.image.new("images/ui/icons/damageUp"), "", nil, getUpgradePassive("damageBonus"), "+10% Damage Bonus"),800, 0, 5, 2.5),
    ShopItem("Scale Up",UnlockPassive("Scale Up", gfx.image.new("images/ui/icons/projectileScale"), "", nil, getUpgradePassive("scaleBonus"), "+10% Projectile Scale"),400, 0, 5, 1.5),
    ShopItem("Speed Up",UnlockPassive("Speed Up", gfx.image.new("images/ui/icons/projectileSpeed"), "", nil, getUpgradePassive("projectileSpeedBonus"), "+20% Projectile Speed"),300, 0, 5, 1.5),
    ShopItem("HP+",table.findByParam(unlocksData, "name","HP+"),600, 0, 5, 2),
    -- ShopItem("Cooldown-",table.findByParam(unlocksData, "name","Cooldown-"),800, 0, 5, 1.5),
    ShopItem("XP+",table.findByParam(unlocksData, "name","XP+"),600, 0, 5, 2),
    ShopItem("Regeneration",table.findByParam(unlocksData, "name","Regeneration"),1000, 0, 5, 1.5),
    ShopItem("Bullet Piercing",table.findByParam(unlocksData, "name","Bullet Piercing"),1000, 0, 5, 1.5),
    ShopItem("Duration",table.findByParam(unlocksData, "name","Duration"),800, 0, 5, 2),
    ShopItem("Life+",table.findByParam(unlocksData, "name","Life+"),2000, 0, 5, 2.5),
    ShopItem("Armor",table.findByParam(unlocksData, "name","Armor"),800, 0, 5, 1.5),
    ShopItem("Reroll",table.findByParam(unlocksData, "name","Reroll"),1000, 0, 5, 2),
    ShopItem("Omni",table.findByParam(unlocksData, "name","Omni"),1500, 0, 1, 2.5),
    ShopItem("Bolter Cannon", UnlockCannon("Bolter Cannon", gfx.image.new("images/player/cannons/cannon_simpleCannon"), "", nil, table.findByParam(cannonsData, "id", "blaster"),"Starter Weapon : Bolter",100, 0, 4, 1.5),2000, 0, 4, 2),
    ShopItem("Beam Cannon",table.findByParam(unlocksData, "name","Beam Cannon"),2000, 0, 5, 2),
    ShopItem("Shotgun Cannon",table.findByParam(unlocksData, "name","Shotgun Cannon"),2000, 0, 5, 2),
    ShopItem("Orbital Cannon",table.findByParam(unlocksData, "name","Orbital Cannon"),3000, 0, 5, 2),
    ShopItem("Rocket Cannon",table.findByParam(unlocksData, "name","Rocket Cannon"),4000, 0, 5, 2),
    ShopItem("Plasma Cannon",table.findByParam(unlocksData, "name","Plasma Cannon"),5000, 0, 5, 2),
}