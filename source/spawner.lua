class("Spawner").extends()


function Spawner:init(spawnTime)
    self.spawnTime = spawnTime
    self:startSpawn()
end

function Spawner:startSpawn()
    playdate.timer.performAfterDelay(math.random(300,800), function()
        self:spawn()
        self:startSpawn()
    end)
end

function Spawner:spawn()
end