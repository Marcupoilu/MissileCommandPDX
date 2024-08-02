class("Wave").extends()


function Wave:init(spawners)
    self.spawners = spawners
end

function Wave:startWave()
    spawners = {}
    table.each(self.spawners, function(x) 
        x:startSpawn()
        table.insert(spawners, x)
    end)
end