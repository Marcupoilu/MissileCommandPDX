class("SaucerSpawner").extends(EnemySpawner)

function SaucerSpawner:init(spawnTime, x, y)
    SaucerSpawner.super.init(self, spawnTime,x ,y)

end

function SaucerSpawner:spawn()
    SaucerSpawner.super.spawn(self, Saucer(self.x, self.y, enemiesData.Saucer.speed, enemiesData.Saucer.hp, enemiesData.Saucer.xp, enemiesData.Saucer.damage))
end