class("Wave").extends()


function Wave:init(spawners)
    self.spawners = spawners
end

function Wave:startWave()
    table.each(spawners, function(x) 
        x:stopSpawn()
    end)
    spawners = {}
    table.each(self.spawners, function(x) 
        -- x:startSpawn()
        table.insert(spawners, x)
    end)
end