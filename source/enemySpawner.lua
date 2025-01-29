class("EnemySpawner").extends(EnemySpawnerBase)

function EnemySpawner:init(spawnTime, x, y, spawnMaxCount, enemy, enemyData, loop)
    EnemySpawner.super.init(self, spawnTime,x ,y, spawnMaxCount, loop)
    self.enemy = enemy
    self.enemyData = enemyData
end

function EnemySpawner:spawn()
    if table.count(enemies) >= enemyPoolLimit then
        return
    end
    local enemy = BulletPool:get(self.enemy)
    if enemy then
        enemy:reset(0, self.y - enemy:getSize(), self.enemyData.speed, self.enemyData.hp, self.enemyData.xp, self.enemyData.damage, self.enemyData.enemyImage, self.enemyData.core)
    -- else
    --     enemy = self.enemy(0, self.y, self.enemyData.speed, self.enemyData.hp, self.enemyData.xp, self.enemyData.damage, self.enemyData.enemyImage, self.enemyData.core)
    --     BulletPool:release(enemy) -- On l'ajoute au pool pour la prochaine fois
    end 
    EnemySpawner.super.spawn(self, enemy)
    self.enemy.spawner = self
end