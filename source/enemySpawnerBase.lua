class("EnemySpawnerBase").extends(Spawner)

function EnemySpawnerBase:init(spawnTime, x, y, spawnMaxCount, loop)
    EnemySpawnerBase.super.init(self, spawnTime, spawnMaxCount, loop)
    self.x = x
    self.y = y
end

function EnemySpawnerBase:spawn(enemy)
    EnemySpawnerBase.super.spawn(self)
    local position = 0
    local enemy = enemy
    repeat 
        position = math.random(50,playdate.display.getWidth()-50)
        enemy:moveTo(position, self.y)
        enemy.x = position
        enemy.y = self.y
        enemy.originPosition.x = position
        enemy.originPosition.y = self.y
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