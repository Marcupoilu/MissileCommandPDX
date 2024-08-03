class("Spawner").extends()


function Spawner:init(spawnTime)
    self.spawnTime = spawnTime
    -- self:startSpawn()
end

function Spawner:startSpawn()
    playdate.timer.performAfterDelay(self.spawnTime, function()
        self:spawn()
        self:startSpawn()
    end)
end

function Spawner:spawn()
end