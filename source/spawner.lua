class("Spawner").extends()


function Spawner:init(spawnTime, maxSpawn, loop)
    self.spawnTime = spawnTime
    self.maxSpawn = maxSpawn
    self.spawnCount = 0
    self.loop = loop
end

function Spawner:startSpawn()
    if self.maxSpawn ~= nil then
        if self.spawnCount >= self.maxSpawn then
            return
        end
    end
    self.timer = playdate.timer.performAfterDelay(self.spawnTime, function()
        self:spawn()
        self:startSpawn()
    end)
end

function Spawner:stopSpawn()
    self.timer:remove()
    self = nil
end

function Spawner:spawn()
    self.spawnCount += 1
end