class("UiManager").extends()
local inventoryWeaponTexts = {}
local inventoryPassiveTexts = {}
local levelUpCellWidth = 100
local levelUpCellHeight = 200
local levelUpDistance = 15
local levelUpCellNumber = 3
local _pick_anim_y = sequence.new():from(20):to(13, 1, "easeOutSine"):mirror():start()
endScreenTweet = sequence.new():from(-240):to(0, 1, "outSine")

local font = gfx.font.new("font/Asheville-Sans-24-Light")
local smallFont = gfx.font.new("font/font-pixieval-large-white")
smallFont:setTracking(1)
local verySmallFont = gfx.font.new("font/Pico8")
local smallFontVariant = gfx.font.new("font/dpaint_8")
smallFontVariant:setTracking(0)
local smallFontAmmolite = gfx.font.new("font/onyx_9")
smallFontAmmolite:setTracking(1)
smallFontAmmolite:setLeading(5)
local diamond_20 = gfx.font.new("font/diamond_20")
local ups = {}
local levelUpIndex = 0
local mainMenuIndex = 0
local core = gfx.image.new("images/player/planet-core")
local enemy = gfx.image.new("images/enemies/large/enemy_large_01")
local mainMenu = gfx.image.new("images/ui/menus/main_menu")
local mainMenuPositions = {{x=264,y=95.5},{x=264,y=139.5},{x=264,y=183.5}}
function UiManager:init()
    self.inventoryWeapons = {}
    self.inventoryPassives = {}
    self.horizontalLayoutLevelUp = HorizontalLayout(levelUpCellWidth, levelUpDistance, levelUpCellNumber, 20)
end

function UiManager:generateUpgrades()
    ups = {}
    local discardedUps = {}
    local rand =  {}
    local rarity = math.random(5,10)
    local passiveCheck = false
    local weaponCheck = false
    local pass = false
    for i = 1, levelUpCellNumber do
        repeat
            if table.count(discardedUps) >= table.count(upgradesData) then
                pass = true
                break
            end
            passiveCheck = false
            weaponCheck = false
            rand = table.random(upgrades)
            if table.contains(discardedUps, rand) == false then
                table.insert(discardedUps, rand)
            end
            rand:updateDescriptionText()
            -- si c'est une new passive on check si on a de la place dans l'inventaire
            if rand.className == "UpgradeStat" then
                if table.contains(player.passives, rand) == false and rand.inventory == nil then
                    if player.passiveNumber >= player.passiveNumberMax then
                        passiveCheck = true
                    end
                end
            end
            -- si c'est une new weapon on check si on a de la place dans l'inventaire
            if rand.className == "UpgradeWeapon" then
                if rand.weapon == nil then
                    if player.weaponNumber >= player.weaponNumberMax then
                        weaponCheck = true
                    end
                end
            end
        until (table.contains(ups, rand) == false and rand.count > 0 and rand.rarity <= rarity and passiveCheck == false and weaponCheck == false)
        passiveCheck = false
        weaponCheck = false
        if pass == false then 
            table.remove(discardedUps, indexOf(discardedUps,rand))
            table.insert(ups, rand)
        end
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
        gfx.setFont(smallFontAmmolite,gfx.kVariantBold)
        gfx.drawTextAligned(string.upper(value.descriptionText) , 75 + (i*(levelUpCellWidth+levelUpDistance)) + 10,self.horizontalLayoutLevelUp.positionBaseY + _pick_anim_y:get() + 150, kTextAlignment.center)
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
    end
    if playdate.buttonJustPressed(playdate.kButtonB) and player.rerolls > 0 then
        player.rerolls -= 1
        self:generateUpgrades()
    end
    
end

function UiManager:update()
    -- texts layout
    local offset = 0
    table.each(inventoryWeaponTexts, function (iw)
        local level = tostring(table.findByParam(player.weapons, "className", iw.type).level)
        gfx.setImageDrawMode(gfx.kDrawModeFillWhite)
        gfx.setFont(verySmallFont,gfx.kVariantBold)
        gfx.drawTextAligned("Lv."..level,10 + offset,235, kTextAlignment.center)
        offset += 21
    end)
    offset = 0
    table.each(inventoryPassiveTexts, function (ip)
        local level = tostring(ip.countMax - ip.count)
        gfx.setImageDrawMode(gfx.kDrawModeFillWhite)
        gfx.setFont(verySmallFont,gfx.kVariantBold)
        gfx.drawTextAligned("Lv."..level,295 + offset,235, kTextAlignment.center)
        offset += 21
    end)
    gfx.setImageDrawMode(gfx.kDrawModeFillWhite)
    gfx.setFont(smallFont,gfx.kVariantBold)
    gfx.drawTextAligned(player.level,100,225, kTextAlignment.center)
    gfx.setFont(smallFontVariant)
    gfx.drawTextAligned(timeLeft(time),387,227, kTextAlignment.center)
    self:createBar(121,220,player.hpMax, player.hp, 5)
    self:createBar(121,235,player.xpMax, player.xp,1)
end

function UiManager:winScreenUpdate()
    gfx.setColor(gfx.kColorWhite)
    local screenWidth = playdate.display.getWidth()
    local screenHeight = playdate.display.getHeight()
    
    local rectWidth = 200
    local rectHeight = 150
    
    local rectX = (screenWidth - rectWidth) / 2
    local rectY = (screenHeight - rectHeight) / 2
    -- rect part
    gfx.fillRect(0, 0, 400, 210 + endScreenTweet:get())
    gfx.setFont(diamond_20,gfx.kVariantItalic)
    gfx.setImageDrawMode(gfx.kDrawModeFillBlack)
    gfx.drawTextAligned("DEFENSE "..player.runLevel.." SUCCESS", rectWidth, 20+ endScreenTweet:get(), kTextAlignment.center)
    -- middle part
    core:scaledImage(0.07):draw( 50,70 + endScreenTweet:get())
    gfx.setFont(smallFontAmmolite,gfx.kVariantItalic)
    gfx.drawTextAligned("X"..player.core, 90, 90 + endScreenTweet:get(), kTextAlignment.center)
    local screenWidth = playdate.display.getWidth()
    local screenHeight = playdate.display.getHeight()
    local enemyImage = enemy:scaledImage(1)
    local imageWidth, imageHeight = enemyImage:getSize()
    local imageX = (screenWidth - imageWidth) / 2
    local imageY = (screenHeight - imageHeight) / 2
    gfx.setImageDrawMode(gfx.kDrawModeInverted)
    enemyImage:draw(imageX, imageY - 32 + endScreenTweet:get())
    gfx.setImageDrawMode(gfx.kDrawModeFillBlack)
    gfx.drawTextAligned("X"..player.enemiesKilled, imageX + 40, 90 + endScreenTweet:get(), kTextAlignment.center)
    gfx.setImageDrawMode(gfx.kDrawModeFillBlack)
    gfx.setFont(diamond_20,gfx.kVariantItalic)
    gfx.drawTextAligned("LV", 310, 85 + endScreenTweet:get(), kTextAlignment.center)
    gfx.setFont(smallFontAmmolite,gfx.kVariantItalic)
    gfx.drawTextAligned("X"..player.level, 330, 91 + endScreenTweet:get(), kTextAlignment.center)
    -- unlock part
    gfx.setColor(gfx.kColorBlack)
    local width = rectWidth + 50 
    local height = rectHeight - 80
    local offset = 35
    gfx.setLineWidth(2)
    gfx.drawRect(rectX + rectWidth/2 - width/2, rectY +  rectHeight/2 - height/2 + offset + endScreenTweet:get(), width, height)
    gfx.setFont(smallFontAmmolite,gfx.kVariantItalic)
    gfx.setImageDrawMode(gfx.kDrawModeFillBlack)
    gfx.drawTextAligned("UNLOCKS", rectWidth, 125 + endScreenTweet:get(), kTextAlignment.center)
    gfx.setFont(verySmallFont,gfx.kVariantItalic)
    gfx.drawTextAligned("PRESS BUTTON TO CONTINUE", rectWidth, 200 + endScreenTweet:get(), kTextAlignment.center)
    local current, pressed, released = playdate.getButtonState()
    if current ~= 0 then
        tween = false
        mainMenuIndex = 0
        playdate.update = mainMenuUpdate
        return
    end
end

function UiManager:mainMenuUpdate()
    gfx.setImageDrawMode(gfx.kDrawModeCopy)
    mainMenu:draw(0,0)
    gfx.setFont(diamond_20,gfx.kVariantBold)
    gfx.drawTextAligned("DEFENSE", 335, 88, kTextAlignment.center)
    gfx.drawTextAligned("MACHINA", 335, 132, kTextAlignment.center)
    gfx.drawTextAligned("STORAGE", 335, 176, kTextAlignment.center)
    
    if playdate.buttonJustPressed(playdate.kButtonDown) then
        mainMenuIndex = math.ring_int(mainMenuIndex +1, 0, 2)
    end
    if playdate.buttonJustPressed(playdate.kButtonUp) then
        mainMenuIndex -= 1
        if mainMenuIndex == -1 then
            mainMenuIndex = 2
        end
    end
    print(mainMenuIndex)
    gfx.setColor(gfx.kColorWhite)
    gfx.fillCircleAtPoint(mainMenuPositions[mainMenuIndex+1].x, mainMenuPositions[mainMenuIndex+1].y, 8.5)
    if playdate.buttonJustPressed(playdate.kButtonA) then
        if mainMenuIndex == 0 then
            playdate.update = gameUpdate
            -- chooseCanon()
        end
        if mainMenuIndex == 1 then
            
        end
        if mainMenuIndex == 2 then
            
        end
    end
end

function UiManager:chooseCanon()
end

function UiManager:createBar(x,y,max, current, height)
    local maxHP = max 
    local maxWidth = 158

    local currentWidth = (current * maxWidth) / maxHP
    currentWidth = math.max(0, math.min(currentWidth, maxWidth))
    gfx.setColor(gfx.kColorWhite)
    gfx.fillRoundRect(x, y, currentWidth, height, 10)
end

function UiManager:createInventory(x,y, offset, inventoryTable)
    local offs = 0
    local type = ""
    for key, value in pairs(inventoryTable) do
        local item = gfx.sprite.new(value.image)
        item:moveTo(x + offs, y)
        item:setCenter(0.5,0.5)
        item:setScale(0.03)
        item:setZIndex(1000)
        item:setImageDrawMode(gfx.kDrawModeFillWhite)
        item:add()
        offs += offset
        if value.className == "UpgradeWeapon" then
            type = "weapon"
        else
            type = "passive"
        end
    end
    if type == "weapon" then
        inventoryWeaponTexts = inventoryTable
    else
        inventoryPassiveTexts = inventoryTable
    end
end