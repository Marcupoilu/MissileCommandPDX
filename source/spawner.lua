class("Spawner").extends()


function Spawner:init(spawnTime)
    self.spawnTime = spawnTime
    -- self:startSpawn()
end

function Spawner:startSpawn()
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
end