class("BulletPool").extends()

BulletPool.pools = {} 

function BulletPool:get(bulletClass)
    local pool = self.pools[bulletClass]
    if pool and #pool > 0 then
        return table.remove(pool)
    end
    return nil 
end

function BulletPool:release(bullet)
    local bulletClass = bullet.__index 
    if not self.pools[bulletClass] then
        self.pools[bulletClass] = {} 
    end
    bullet.active = false 
    bullet:remove() 
    table.insert(self.pools[bulletClass], bullet) 
end

function BulletPool:preload(bulletClass, count, ...)
    if not self.pools[bulletClass] then
        self.pools[bulletClass] = {}
    end
    for i = 1, count do
        local bullet = bulletClass(...)
        bullet.active = false
        bullet:remove()
        table.insert(self.pools[bulletClass], bullet)
    end
end
