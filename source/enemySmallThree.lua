class("EnemySmallThree").extends(Enemy)

local enemyImage = gfx.image.new("images/enemies/small/enemy_small_03")

function EnemySmallThree:init(x,y,speed,hp,xp,damage,enemyImage, core)
    EnemySmallThree.super.init(self,x,y,speed,hp,xp, damage, enemyImage, core)
    self.originPosition.x = self.x
    self.originPosition.y = self.y
    self.playerX = player.cannonBaseSprite.x
    self.playerY = player.cannonBaseSprite.y + 20
    self.overrideDirection = false
    self.amp = 2
    self.freq = 150
    self.time = 0
    self.randomPoint = {x=math.random(self:getSize(), 400 - self:getSize()),y=self.playerY}
end

function EnemySmallThree:update()
    if self.overrideDirection == false then
        -- Calculer l'angle vers le point cible
        -- self.angle = math.deg(math.atan(self.randomPoint.y - self.y, self.randomPoint.x - self.x))
        self.angle = math.deg(math.atan(self.playerY - self.y, self.playerX - self.x) )

    end
    -- EnemySmallThree.super.update(self)

    -- Mettre à jour la position d'origine
    self.originPosition.x = self.x
    self.originPosition.y = self.y
    
    -- Calculer le rayon (distance parcourue par l'ennemi)
    self.radius = self.speed * deltaTime
    
    -- Incrémenter le temps pour animer le mouvement circulaire
    self.time += deltaTime
    -- Calculer l'offset du mouvement circulaire
    local angleRad = math.rad(self.time * self.freq)  -- Utiliser `self.time` pour un mouvement circulaire constant
    
    -- Position de base (ligne droite vers la cible)
    local baseX = self.radius * math.cos(math.rad(self.angle)) + self.originPosition.x
    local baseY = self.radius * math.sin(math.rad(self.angle)) + self.originPosition.y
    -- Ajouter le mouvement circulaire autour de la position de base
    local waveX = self.amp * math.cos(angleRad)
    local waveY = self.amp * math.sin(angleRad)
    
    -- Déplacer l'ennemi à la nouvelle position
    self:moveTo(baseX + waveX, baseY + waveY)
end