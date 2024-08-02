class("SaucerSpawner").extends(EnemySpawner)

function SaucerSpawner:init(spawnTime, x, y)
    SaucerSpawner.super.init(self, spawnTime,x ,y)

end

function SaucerSpawner:spawn()
    SaucerSpawner.super.spawn(self, Saucer(0, self.y, 1, 3, 2, 2))
end