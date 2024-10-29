class("BulletBeam").extends(Projectile)

-- Pré-calculer les constantes si elles ne changent pas
local math_rad = math.rad
local math_cos = math.cos
local math_sin = math.sin

function BulletBeam:init(x, y, speed, damage, offsetCrank, scale, duration)
    BulletBeam.super.init(self, x, y, speed, damage, offsetCrank, scale, duration)
    self.maxLength = 240
    -- self.hp = 10000
    self.currentLength = 0
    self.startPos = {x = player.x, y = player.y}
    self.endPos = {x = 0, y = 0}
    self.angle = crankPosition
    self.radius = self.speed + ((player.projectileSpeedBonus * self.speed) / 100) * deltaTime
    self.offset = offsetCrank
    self.scale = scale
    -- self.duration = duration
    self.lineS = playdate.geometry.lineSegment.new(self.startPos.x, self.startPos.y, self.endPos.x, self.endPos.y)
    self.lasers = {}
    self.tick = 100
    table.insert(beams, self)
end

function BulletBeam:endBeam()
    local beamIndex = indexOf(beams, self)
    if beamIndex then
        table.remove(beams, beamIndex)
    end
end

function BulletBeam:update()
    BulletBeam.super.update(self)
    -- Cache des variables pour réduire les appels de méthode
    local playerSprite = player.cannonGunSprite
    local playerX, playerY = playerSprite.x, playerSprite.y
    local rotation = playerSprite:getRotation()
    local angleRad = math_rad(rotation - 90)

    -- Calcul de la position de départ, une seule fois
    self.startPos.x = playerX + (self.height + 50) * math_cos(angleRad)
    self.startPos.y = playerY + (self.height + 50) * math_sin(angleRad)

    -- Calcul du rayon et direction
    self.radius = self.radius + (self.speed + ((player.projectileSpeedBonus * self.speed) / 100)) * deltaTime
    local directionX = self.radius * math_cos(angleRad + math_rad(self.offset)) * deltaTime
    local directionY = self.radius * math_sin(angleRad + math_rad(self.offset)) * deltaTime

    -- Limitation de la longueur actuelle
    self.currentLength = self.currentLength + (self.speed + ((player.projectileSpeedBonus * self.speed) / 100)) * deltaTime
    if self.currentLength > self.maxLength then
        self.currentLength = self.maxLength
    end

    -- Calcul de la position de fin
    self.endPos.x = self.startPos.x + directionX * self.currentLength
    self.endPos.y = self.startPos.y + directionY * self.currentLength

    -- Collision avec les sprites sur la ligne
    local collisions = gfx.sprite.querySpriteInfoAlongLine(self.startPos.x, self.startPos.y, self.endPos.x, self.endPos.y)
    for _, collision in ipairs(collisions) do
        if collision.sprite:isa(Enemy) then
            self.endPos.x = collision.entryPoint.x
            self.endPos.y = collision.entryPoint.y
            enemyManager:touchEnemy(self, collision.sprite, true)
            -- break -- Stopper dès qu'une collision est trouvée
        end
    end

    -- Dessin de la ligne
    gfx.setLineCapStyle(gfx.kLineCapStyleRound)
    gfx.setColor(gfx.kColorWhite)
    gfx.setLineWidth(self.scale)
    self.lineS.x1 = self.startPos.x
    self.lineS.y1 = self.startPos.y
    self.lineS.x2 = self.endPos.x
    self.lineS.y2 = self.endPos.y
    gfx.drawLine(self.lineS)
end
