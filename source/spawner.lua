class("Spawner").extends()


function Spawner:init(spawnTime, maxSpawn, loop)
    self.spawnTime = spawnTime
    self.maxSpawn = maxSpawn
    self.spawnCount = 0
    self.loop = loop
    self.enabled = true
end

function Spawner:startSpawn()
    self.timer = playdate.timer.performAfterDelay(self.spawnTime, function()
        if self.enabled == false then
            return
        end
        if self.maxSpawn ~= nil then
            if self.spawnCount >= self.maxSpawn then
                if self.loop ~= nil then
                    self.enabled = false
                end
                return
            end
        end
        -- if self.spawnCount < self.maxSpawn then
            self:spawn()
            -- self:startSpawn()
        -- end
    end)
    self.timer.repeats = true
end

function Spawner:stop()
    self.timer:pause()
end

function Spawner:resume()
    self.timer:start()
end

function Spawner:stopSpawn()
    if self.timer ~= nil then
        self.timer:remove()
        self.timer = nil
    end
    self = nil
end

function Spawner:spawn()
    self.spawnCount += 1
end