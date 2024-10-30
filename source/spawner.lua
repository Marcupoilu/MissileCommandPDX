class("Spawner").extends()


function Spawner:init(spawnTime, maxSpawn, loop)
    self.spawnTime = spawnTime
    self.currentTime = spawnTime
    self.maxSpawn = maxSpawn
    self.spawnCount = 0
    self.loop = loop
    self.enabled = true
end

function Spawner:update()
    self.currentTime -= refreshRate
    if self.currentTime <= 0 then
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
        self:spawn()
        self.currentTime = self.spawnTime
    end
end

function Spawner:stop()
    self.enabled = false
end

function Spawner:resume()
    self.enabled = true
end

function Spawner:stopSpawn()
    self.enabled = false
    self = nil
end

function Spawner:spawn()
    self.spawnCount += 1
end