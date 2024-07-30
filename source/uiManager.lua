class("UiManager").extends()

local hpCells = {} 
local hpFillCells = {}
local levelUpCellWidth = 100
local levelUpCellHeight = 200
local levelUpDistance = 15
local levelUpCellNumber = 3
local _pick_anim_y = sequence.new():from(20):to(13, 1, "easeOutSine"):mirror():start()
local font = gfx.font.new("font/Asheville-Sans-24-Light")
local upgrades =  {}

function UiManager:init()
    self.horizontalLayoutHPCell = HorizontalLayout(22, -4, player.hpMax, 200)
    self.horizontalLayoutHPFillCell = HorizontalLayout(16, 2, player.hp, 203)
    self.horizontalLayoutLevelUp = HorizontalLayout(levelUpCellWidth, levelUpDistance, levelUpCellNumber, 20)
    self:createHPBar(hpCells, "images/hpbar_cell", self.horizontalLayoutHPCell.positionBaseX + 10, self.horizontalLayoutHPCell.positionBaseY, self.horizontalLayoutHPCell.cellSize, self.horizontalLayoutHPCell.distance, 0.85)
    self:createHPBar(hpFillCells, "images/hpbar_cellfill", self.horizontalLayoutHPFillCell.positionBaseX + 7, self.horizontalLayoutHPFillCell.positionBaseY, self.horizontalLayoutHPFillCell.cellSize, self.horizontalLayoutHPFillCell.distance, 0.85)
end

function UiManager:generateUpgrades()
    for i = 1, levelUpCellNumber do
        printTable(table.random(Upgrade.types))
    end
end

function UiManager:levelUpDisplay()
    gfx.setColor(gfx.kColorWhite)
    for i = 0, 3 -1 do
        gfx.setColor(gfx.kColorWhite)
        gfx.fillRoundRect(self.horizontalLayoutLevelUp.positionBaseX + (i*(levelUpCellWidth+levelUpDistance)),self.horizontalLayoutLevelUp.positionBaseY + _pick_anim_y:get() , levelUpCellWidth, levelUpCellHeight,10)
    end
    gfx.setImageDrawMode(gfx.kDrawModeFillWhite)
    gfx.setFont(font,gfx.kVariantBold)
    gfx.drawText("Pick Upgrade", 130, 1)
end

function UiManager:updateHPDisplay()
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