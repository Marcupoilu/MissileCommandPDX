class("UiManager").extends()

-- ground = UISprite("images/ground", 1, 0.5, 1, 200, 240, true)

-- local hpBody = UISprite("images/hp_body", 2, 0.5, 0, 200, 197)
local hpCells = {} 
local hpCellSize = 22
local hpFillCells = {}
local hpFillSize = 16
local margeHpCells = -4
local margeHpFillCells = 2
-- local xpBody = UISprite("images/xp_body", 2, 0.5, 0, 200, 217)

-- local hpFill = UISprite("images/hp_fill", 2, 0.5, 0, 200, 201)

function UiManager:init()
    self.totalHpCellsWidth = (player.hpMax * hpCellSize) + ((player.hpMax - 1) * margeHpCells)
    self.hpPositionBaseX = ((playdate.display.getWidth() - self.totalHpCellsWidth) / 2)
    self.hpPositionBaseY = 200
    self.totalHpFillCellsWidth = (player.hp * hpFillSize) + ((player.hp - 1) * margeHpFillCells)
    self.hpFillPositionBaseX = ((playdate.display.getWidth() - self.totalHpFillCellsWidth) / 2) - 2
    self.hpFillPositionBaseY = 203
    self:createHPBar(hpCells, "images/hpbar_cell", self.hpPositionBaseX + 10, self.hpPositionBaseY, hpCellSize, margeHpCells, 0.85)
    self:createHPBar(hpFillCells, "images/hpbar_cellfill", self.hpFillPositionBaseX + 10, self.hpFillPositionBaseY, hpFillSize, margeHpFillCells, 0.85)
end

function UiManager:update()
end

function UiManager:updateHPDisplay()
    print(player.hp)
    for i = 1, player.hpMax do
        if(i <= player.hp) then
            hpFillCells[i]:setVisible(true)
        else
            hpFillCells[i]:setVisible(false)
        end
    end
end

function UiManager:createHPBar(tableToClear, image, positionBaseX, positionBaseY, cellSize, marge, scale)
    for key, value in pairs(tableToClear) do
        value:remove()
    end
    local offset = 0
    for i = 0, player.hpMax -1 do
        local hpCell = UISprite(image, 2, 0.5, 0, positionBaseX + offset, positionBaseY)
        hpCell:setScale(scale)
        hpCell:moveTo(positionBaseX + (i*(cellSize+marge)), positionBaseY)
        table.insert(tableToClear,hpCell)
    end
end