class("EnemySpawner").extends(Spawner)

function EnemySpawner:init(spawnTime, x, y)
    EnemySpawner.super.init(self, spawnTime)
    self.x = x
    self.y = y
end

function EnemySpawner:spawn(enemy)
    EnemySpawner.super.spawn()
    local position = 0
    local enemy = enemy
    repeat 
        position = math.random(32,playdate.display.getWidth()-32)
        enemy:moveTo(position, 0)
    until(self:countTable(enemy:overlappingSprites()) == 0)
end

function EnemySpawner:countTable(table)
    count = 0
    for i,a in pairs(table) do
        count += 1
    end
    return count
end