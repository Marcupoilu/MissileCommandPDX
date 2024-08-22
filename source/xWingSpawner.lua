class("xWingSpawner").extends(EnemySpawner)

function xWingSpawner:init(spawnTime, x, y)
    xWingSpawner.super.init(self, spawnTime,x ,y)

end

function xWingSpawner:spawn()
    if table.getsize(enemies) >= enemyPoolLimit then
        return
    end
    xWingSpawner.super.spawn(self, Xwing(0, self.y, enemiesData.Xwing.speed, enemiesData.Xwing.hp, enemiesData.Xwing.xp, enemiesData.Xwing.damage))
end