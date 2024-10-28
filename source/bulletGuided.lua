class("BulletGuided").extends(Bullet)

local bulletImage = gfx.image.new("images/bullets/bullet_guided" )

function BulletGuided:init(x,y,speed, damage, offsetCrank, scale, duration)
    BulletGuided.super.init(self,x,y,speed, damage, offsetCrank, scale, duration, bulletImage)
    self.baseAngle = self.originAngle
    self.hp = 1
    self.rot = 0
    self.power = 5
    self.guidedHitBox = 80
    self.target = nil
    self:setRotation(self.originAngle + 90)
end
function BulletGuided:update()
    BulletGuided.super.update(self)
    self:animate()
    self.radius += self.speed + (((player.projectileSpeedBonus*self.speed)/100)) * deltaTime
    self:moveTo(self.radius*math.cos(math.rad(self.originAngle + self.offset)) + self.originPosition.x, self.radius*math.sin(math.rad(self.originAngle + self.offset)) + self.originPosition.y)

    if self.target ~= nil then
        local targetAngle = math.deg(math.atan(self.target.y - self.y, self.target.x - self.x))
        local distanceToTarget = math.sqrt((self.target.x - self.x)^2 + (self.target.y - self.y)^2)

        -- Calculer la différence d'angle en tenant compte de la circularité
        local angleDiff = (targetAngle - self.originAngle + 540) % 360 - 180
        
        -- Appliquer l'interpolation pour lisser le changement d'angle
        local interpolationSpeed = 0.1 -- Ajuste cette valeur selon ton besoin
        self.originAngle = self.originAngle + angleDiff * interpolationSpeed
        
        -- Mettre à jour la rotation de la balle
        self:setRotation(self.originAngle + 90)
        if self.target.dead == true then
            self.target = nil
        end
        return
    end
    if self.target == nil then
        self.originAngle = self.baseAngle
    end
    for key, value in pairs(gfx.sprite.getAllSprites()) do
        if value:isa(Enemy) then
            local distance = math.sqrt((value.x - self.x)^2 + (value.y - self.y)^2)
            if distance <= self.guidedHitBox then
                self.target = value
                return
            end
        end
    end
end