class("EnemySpawner").extends(EnemySpawnerBase)

function EnemySpawner:init(spawnTime, x, y, spawnMaxCount, enemy, enemyData, loop)
    EnemySpawner.super.init(self, spawnTime,x ,y, spawnMaxCount, loop)
    self.enemy = enemy
    self.enemyData = enemyData
end

function EnemySpawner:spawn()
    if table.getsize(enemies) >= enemyPoolLimit then
        return
    end
    EnemySpawner.super.spawn(self, self.enemy(0, self.y, self.enemyData.speed, self.enemyData.hp, self.enemyData.xp, self.enemyData.damage, self.enemyData.enemyImage, self.enemyData.core))
    self.enemy.spawner = self
end