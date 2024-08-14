class("UiManager").extends()

local hpCells = {} 
local hpFillCells = {}
local levelUpCellWidth = 100
local levelUpCellHeight = 200
local levelUpDistance = 15
local levelUpCellNumber = 3
local _pick_anim_y = sequence.new():from(20):to(13, 1, "easeOutSine"):mirror():start()
local font = gfx.font.new("font/Asheville-Sans-24-Light")
local smallFont = gfx.font.new("font/font-pixieval-large-white")
local ups = {}
local levelUpIndex = 0

function UiManager:init()
    self.horizontalLayoutHPCell = HorizontalLayout(22, -4, player.hpMax, 200)
    self.horizontalLayoutHPFillCell = HorizontalLayout(16, 2, player.hp, 203)
    self.horizontalLayoutLevelUp = HorizontalLayout(levelUpCellWidth, levelUpDistance, levelUpCellNumber, 20)
    hpCells = self:createHPBar(hpCells, "images/hpbar_cell", self.horizontalLayoutHPCell.positionBaseX + 10, self.horizontalLayoutHPCell.positionBaseY, self.horizontalLayoutHPCell.cellSize, self.horizontalLayoutHPCell.distance, 0.85)
    hpFillCells = self:createHPBar(hpFillCells, "images/hpbar_cellfill", self.horizontalLayoutHPFillCell.positionBaseX + 7, self.horizontalLayoutHPFillCell.positionBaseY, self.horizontalLayoutHPFillCell.cellSize, self.horizontalLayoutHPFillCell.distance, 0.85)
end

function UiManager:generateUpgrades()
    ups = {}
    local rand =  {}
    for i = 1, levelUpCellNumber do
        repeat
            rand = table.random(upgrades)
            rand:updateDescriptionText()
        until (table.contains(ups, rand) == false)
        table.insert(ups, rand)
    end
    levelUpIndex = 0
end

function UiManager:levelUpDisplay()
    gfx.setColor(gfx.kColorWhite)
    local i = 0
    for key, value in pairs(ups) do
        gfx.setColor(gfx.kColorWhite)
        gfx.fillRoundRect(self.horizontalLayoutLevelUp.positionBaseX + (i*(levelUpCellWidth+levelUpDistance)),self.horizontalLayoutLevelUp.positionBaseY + _pick_anim_y:get() , levelUpCellWidth, levelUpCellHeight,10)
        if i == levelUpIndex then
            gfx.setColor(gfx.kColorBlack)
            gfx.setLineWidth(4)
            gfx.drawRoundRect(self.horizontalLayoutLevelUp.positionBaseX + (i*(levelUpCellWidth+levelUpDistance)) +5 ,self.horizontalLayoutLevelUp.positionBaseY + _pick_anim_y:get() +5, levelUpCellWidth -10, levelUpCellHeight-10, 10)
        end
        gfx.setImageDrawMode(gfx.kDrawModeFillBlack)
        gfx.setFont(smallFont,gfx.kVariantBold)
        gfx.drawText(value.descriptionText , self.horizontalLayoutLevelUp.positionBaseX + (i*(levelUpCellWidth+levelUpDistance)) + 10,self.horizontalLayoutLevelUp.positionBaseY + _pick_anim_y:get() + 150)
        value.image:scaledImage(0.1):draw( self.horizontalLayoutLevelUp.positionBaseX + (i*(levelUpCellWidth+levelUpDistance)) + 20,self.horizontalLayoutLevelUp.positionBaseY + _pick_anim_y:get() + 50)
        i += 1
    end
    gfx.setImageDrawMode(gfx.kDrawModeFillWhite)
    gfx.setFont(font,gfx.kVariantBold)
    gfx.drawText("Pick Upgrade", 130, 1)
    if playdate.buttonJustPressed(playdate.kButtonRight) then
        levelUpIndex = math.ring_int(levelUpIndex +1, 0, 2)
    end
    if playdate.buttonJustPressed(playdate.kButtonLeft) then
        levelUpIndex -= 1
        if levelUpIndex == -1 then
            levelUpIndex = 2
        end
    end
    if playdate.buttonJustPressed(playdate.kButtonA) then
        generate = false
        ups[levelUpIndex +1]:applyUpgrade()
        playdate.update = gameUpdate
        hpCells = self:createHPBar(hpCells, "images/hpbar_cell", self.horizontalLayoutHPCell.positionBaseX + 10, self.horizontalLayoutHPCell.positionBaseY, self.horizontalLayoutHPCell.cellSize, self.horizontalLayoutHPCell.distance, 0.85)
        hpFillCells = self:createHPBar(hpFillCells, "images/hpbar_cellfill", self.horizontalLayoutHPFillCell.positionBaseX + 7, self.horizontalLayoutHPFillCell.positionBaseY, self.horizontalLayoutHPFillCell.cellSize, self.horizontalLayoutHPFillCell.distance, 0.85)
        self:updateHPDisplay()
    end
    if playdate.buttonJustPressed(playdate.kButtonB) then
        self:generateUpgrades()
    end
end

function UiManager:updateHPDisplay()
    -- for i = 1, player.hpMax do
    --     if(i <= player.hp) then
    --         hpFillCells[i]:setVisible(true)
    --     else
    --         hpFillCells[i]:setVisible(false)
    --     end
    -- end
end

function UiManager:createHPBar(tableToClear, image, positionBaseX, positionBaseY, cellSize, marge, scale)
    -- for key, value in pairs(tableToClear) do
    --     value:remove()
    -- end
    -- tableToClear = {}
    -- local offset = 0
    -- for i = 0, player.hpMax -1 do
    --     local hpCell = UISprite(image, 2, 0.5, 0, positionBaseX + offset, positionBaseY)
    --     hpCell:setScale(scale)
    --     hpCell:moveTo(positionBaseX + (i*(cellSize+marge)), positionBaseY)
    --     table.insert(tableToClear,hpCell)
    -- end
    -- return tableToClear

end