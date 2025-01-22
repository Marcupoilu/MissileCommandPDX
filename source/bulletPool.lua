class("BulletPool").extends()

BulletPool.pools = {} -- Stocke les pools de chaque type de bullet

-- 📌 Récupérer une bullet depuis le pool
function BulletPool:get(bulletClass)
    local pool = self.pools[bulletClass]
    if pool and #pool > 0 then
        return table.remove(pool) -- 🔹 Récupère une bullet existante
    end
    return nil -- 🔹 Aucun objet dispo dans le pool
end

-- 📌 Ajouter une bullet au pool (quand elle est désactivée)
function BulletPool:release(bullet)
    local bulletClass = bullet.__index -- 🔹 Identifie la classe de la bullet
    if not self.pools[bulletClass] then
        self.pools[bulletClass] = {} -- 🔹 Créer un pool s'il n'existe pas encore
    end
    bullet.active = false -- 🔹 Désactive la bullet
    bullet:remove() -- 🔹 La retire du moteur de rendu
    table.insert(self.pools[bulletClass], bullet) -- 🔹 Remet la bullet dans le pool
end

-- 📌 Initialiser un pool avec des bullets préchargées
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
