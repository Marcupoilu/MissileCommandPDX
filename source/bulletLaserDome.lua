class("BulletLaserDome").extends(Projectile)

function BulletLaserDome:init(x, y, speed, damage, offsetCrank, scale, angle)
    BulletLaserDome.super.init(self, x, y, speed, damage, offsetCrank, scale)
    self.maxLength = playdate.display.getWidth() -- Laser couvre toute la largeur de l'écran
    self.startPos = {x = 0, y = player.y - 7}
    self.endPos = {x = self.maxLength, y = self.startPos.y}
    self.speed = speed
    table.insert(beams, self)
end

function BulletLaserDome:endBeam()
    table.remove(beams, indexOf(beams, self))
end

function BulletLaserDome:update()
    BulletLaserDome.super.update(self)

    -- Déplacer le laser vers le haut
    self.startPos.y = self.startPos.y - self.speed * deltaTime
    self.endPos.y = self.startPos.y

    -- Vérifier les collisions sur toute la largeur
    table.each(gfx.sprite.querySpriteInfoAlongLine(self.startPos.x, self.startPos.y, self.endPos.x, self.endPos.y), 
    function(collision)
        if collision.sprite:isa(Enemy) then
            enemyManager:touchEnemy(self, collision.sprite, true)
        end
    end)

    -- Dessiner le laser horizontal
    gfx.setLineCapStyle(gfx.kLineCapStyleRound)
    gfx.setColor(gfx.kColorWhite)
    gfx.setLineWidth(math.random(math.floor(self.scale / 3), math.floor(self.scale)))
    gfx.drawLine(self.startPos.x, self.startPos.y, self.endPos.x, self.endPos.y)
end
