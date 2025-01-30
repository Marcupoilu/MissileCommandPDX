class("EnemySpawnerBase").extends(Spawner)

function EnemySpawnerBase:init(spawnTime, x, y, spawnMaxCount, loop)
    EnemySpawnerBase.super.init(self, spawnTime, spawnMaxCount, loop)
    self.x, self.y = x, y
end

function EnemySpawnerBase:spawn(enemy)
    EnemySpawnerBase.super.spawn(self)

    local width, height = playdate.display.getWidth(), playdate.display.getHeight()
    local enemySize = enemy:getSize()
    local positionX, positionY

    if enemy.boss then
        -- Les boss spawnent toujours en haut de l'écran
        positionX = math.random(50, width - 50)
        positionY = 0
    else
        -- Détermine la zone de spawn pour les ennemis normaux
        local spawnZones = {
            {50, width - 50, 0, 0},                       -- Haut
            {-enemySize, -enemySize, 0, height / 2 - 40}, -- Gauche
            {width + enemySize, width + enemySize, 0, height / 2 - 40} -- Droite
        }
        local x1, x2, y1, y2 = table.unpack(spawnZones[math.random(1, 3)])
        positionX, positionY = math.random(x1, x2), math.random(y1, y2)
    end

    -- Vérifie si la position est valide avant de valider le spawn
    repeat
        enemy:moveTo(positionX, positionY)
        enemy.x, enemy.y = positionX, positionY
        enemy.originPosition.x, enemy.originPosition.y = positionX, positionY
    until self:isThereAnEnemyAtSpawn(enemy) == 0
end

function EnemySpawnerBase:isThereAnEnemyAtSpawn(enemy)
    local count = 0
    for _, sprite in pairs(enemy:overlappingSprites()) do
        if sprite:isa(Enemy) then
            count += 1
        end
    end
    return count
end
