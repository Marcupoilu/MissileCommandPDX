class("BulletBeam").extends(Projectile)

-- Pré-calcul des constantes mathématiques
local math_rad = math.rad
local math_cos = math.cos
local math_sin = math.sin
local gfx_setLineCapStyle = gfx.setLineCapStyle
local gfx_setColor = gfx.setColor
local gfx_setLineWidth = gfx.setLineWidth
local gfx_drawLine = gfx.drawLine
local gfx_querySpriteAlongLine = gfx.sprite.querySpritesAlongLine

function BulletBeam:init(x, y, speed, damage, offsetCrank, scale, duration)
    BulletBeam.super.init(self, x, y, speed, damage, offsetCrank, scale, duration)
    self.maxLength = 240
    self.currentLength = 0
    self.startPos = {x = player.x, y = player.y}
    self.endPos = {x = 0, y = 0}
    self.angle = crankPosition
    self.radius = speed * (1 + player.projectileSpeedBonus / 100) * deltaTime
    self.offset = math_rad(offsetCrank)
    -- self.scale = scale
    self.lineS = playdate.geometry.lineSegment.new(self.startPos.x, self.startPos.y, self.endPos.x, self.endPos.y)
    self.tick = 100
    gfx_setLineCapStyle(gfx.kLineCapStyleRound)
    gfx_setColor(gfx.kColorWhite)
    gfx_setLineWidth(self.scale)
end

function BulletBeam:reset(x, y, speed, damage, angle, scale, duration)
    self:init(x, y, speed, damage, angle, scale, duration)
    -- self:moveTo(x, y)
    -- self.speed = speed
    -- self.damage = damage
    -- self.offsetCrank = angle
    -- self.scale = scale + ((player.scaleBonus*scale)/100)
    -- if duration ~= nil then
    --     self.duration = duration + ((player.durationBonus*duration)/100)
    -- end
    -- self.hp = 1
    -- self.radius = 0
    self.resetTick = true
    self.active = true
    table.insert(beams, self)
end

function BulletBeam:endBeam()
    local beamIndex = indexOf(beams, self)
    if beamIndex then
        table.remove(beams, beamIndex)
    end
end

function BulletBeam:update()
    if not self.active then return end

    BulletBeam.super.update(self)
    
    local playerSprite = player.cannonGunSprite
    local playerX, playerY = playerSprite.x, playerSprite.y
    local rotation = playerSprite:getRotation()
    local angleRad = math_rad(rotation - 90)

    -- Position de départ
    local offsetX = (self.height + 40 ) * math_cos(angleRad)
    local offsetY = (self.height + 40) * math_sin(angleRad)
    self.startPos.x, self.startPos.y = playerX + offsetX, playerY + offsetY

    -- Calcul du rayon et direction avec mise à jour
    self.radius = self.radius + self.speed * (1 + player.projectileSpeedBonus / 100) * deltaTime
    local directionX = self.radius * math_cos(angleRad + self.offset) * deltaTime
    local directionY = self.radius * math_sin(angleRad + self.offset) * deltaTime

    -- Limite de longueur
    self.currentLength = math.min(self.currentLength + self.radius, self.maxLength)

    -- Position de fin
    self.endPos.x = self.startPos.x + directionX * self.currentLength
    self.endPos.y = self.startPos.y + directionY * self.currentLength

    -- Collision avec les sprites
    local collisions = gfx_querySpriteAlongLine(self.startPos.x, self.startPos.y, self.endPos.x, self.endPos.y)
    for _, collision in ipairs(collisions) do
        if collision:isa(Enemy) then
            self.endPos.x, self.endPos.y = collision.x, collision.y
            enemyManager:touchEnemy(self, collision, true)
            break
        end
    end

    -- Dessin de la ligne

    self.lineS.x1, self.lineS.y1 = self.startPos.x, self.startPos.y
    self.lineS.x2, self.lineS.y2 = self.endPos.x, self.endPos.y
    gfx_setLineWidth(math.random(math.floor(self.scale/3), math.floor(self.scale)))
    gfx_drawLine(self.lineS)
end
