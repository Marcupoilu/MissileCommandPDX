class("EnemySpawnerBase").extends(Spawner)

function EnemySpawnerBase:init(spawnTime, x, y, spawnMaxCount, loop)
    EnemySpawnerBase.super.init(self, spawnTime, spawnMaxCount, loop)
    self.x = x
    self.y = y
end

function EnemySpawnerBase:spawn(enemy)
    EnemySpawnerBase.super.spawn(self)
    local positionX = 0
    local positionY = 0
    local enemy = enemy
    -- rand 0 = top bar
    -- rand 1 = side bar left
    -- rand 2 = side bar right
    local rand = math.random(0,2)
    local x1 = 0
    local x2 = 0
    local y1 = 0
    local y2 = 0
    if rand == 0 then
        x1 = 50
        x2 = playdate.display.getWidth()-50
        y1 = 0
        y2 = 0
    elseif rand == 1 then
        x1 = 0 - enemy:getSize()
        x2 = 0 - enemy:getSize()
        y1 = 0
        y2 = playdate.display.getHeight()/2 - 40
    elseif rand == 2 then
        x1 = playdate.display.getWidth() + enemy:getSize()
        x2 = playdate.display.getWidth() + enemy:getSize()
        y1 = 0
        y2 = playdate.display.getHeight()/2 - 40
    end
    repeat 
        positionX = math.random(x1,x2)
        positionY = math.random(y1, y2)
        enemy:moveTo(positionX, positionY)
        enemy.x = positionX
        enemy.y = positionY
        enemy.originPosition.x = positionX
        enemy.originPosition.y = positionY
    until(self:isThereAnEnemyAtSpawn(enemy) == 0)
end

function EnemySpawnerBase:isThereAnEnemyAtSpawn(enemy)
    local result = 0
    for key, sprite in pairs(enemy:overlappingSprites()) do
        if sprite:isa(Enemy) then
            result += 1
        end
    end
    return result
end

function EnemySpawnerBase:countTable(table)
    count = 0
    for i,a in pairs(table) do
        count += 1
    end
    return count
end