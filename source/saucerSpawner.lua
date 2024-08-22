class("SaucerSpawner").extends(EnemySpawner)

function SaucerSpawner:init(spawnTime, x, y)
    SaucerSpawner.super.init(self, spawnTime,x ,y)

end

function SaucerSpawner:spawn()
    if table.getsize(enemies) >= enemyPoolLimit then
        return
    end
    SaucerSpawner.super.spawn(self, Saucer(self.x, self.y, enemiesData.Saucer.speed, enemiesData.Saucer.hp, enemiesData.Saucer.xp, enemiesData.Saucer.damage))
end