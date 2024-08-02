class("Wave").extends()


function Wave:init(spawners)
    table.deepcopy(spawners)
    self.spawners = spawners
end

function Wave:startWave()
    spawners = {}
    table.each(self.spawners, function(x) 
        printTable(x)
        x:startSpawn()
        table.insert(spawners, x)
    end)
end