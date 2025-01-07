class("UiManager").extends()
local inventoryWeaponTexts = {}
local inventoryPassiveTexts = {}
local levelUpCellWidth = 115
local levelUpCellHeight = 200
local levelUpDistance = 15
local levelUpCellNumber = 3
local _pick_anim_y = sequence.new():from(20):to(13, 1, "easeOutSine"):mirror():start()
endScreenTweet = sequence.new():from(-240):to(0, 1, "outSine")
local selectionScreenOpenEnd = false
local font = gfx.font.new("font/VHS")
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
local cannonIndex = 0
local titleTop = gfx.image.new("images/ui/ui_titleScreen_top")
local titleBot = gfx.image.new("images/ui/ui_titleScreen_bot")
local titleBotY = playdate.display.getHeight() / 2 - 13
local menuMoving = false
local titleTopOpen = sequence.new():from(0):to(-135, 1, "easeOutSine")
local titleBotOpen = sequence.new():from(0):to(135, 1, "easeOutSine")
local titleTopClose = sequence.new():from(0):to(135, 1, "easeOutSine")
local titleBotClose = sequence.new():from(0):to(-135, 1, "easeOutSine"):callback(function ()
    titleTopOpen:set(0)
    titleBotOpen:set(0)
    menuMoving = false
    print("closed")
end)
titleBotOpen:callback(function ()
    titleTopOpen:set(-135)
    titleBotOpen:set(135)
    menuMoving = false
    print("open")
end)
local selectionScreenOpen = sequence.new():from(-192):to(0, 1, "easeOutSine"):callback(function ()
    
end)
local core = gfx.image.new("images/ui/core")
local coreShop = gfx.image.new("images/ui/core_small")
local enemy = gfx.image.new("images/enemies/large/enemy_large_01")
local mainMenu = gfx.animation.loop.new(animationsData.MainMenu.Delay, animationsData.MainMenu.Source, true)
local unlockMenu = gfx.animation.loop.new(animationsData.AchievementPanel.Delay, animationsData.AchievementPanel.Source, true)
local shopMenu = gfx.animation.loop.new(animationsData.ShopBackground.Delay, animationsData.ShopBackground.Source, true)
local selectionScreen = gfx.animation.loop.new(animationsData.SelectionScreen.Delay, animationsData.SelectionScreen.Source, true)
local shopItem = gfx.image.new("images/ui/menus/shop_item")
local endScreenContour = gfx.animation.loop.new(animationsData.EndScreen.Delay, animationsData.EndScreen.Source, true)
local upgradeContour = gfx.image.new("images/ui/menus/upgrade_panel")
local chooseCannonArrowLeft = gfx.image.new("images/ui/arrow_left")
local chooseCannonArrowRight = gfx.image.new("images/ui/arrow_right")
local levelUpIndexMax = 2

local closedMenu = true
local mainMenuPositions = {{x=24,y=55},{x=24,y=120},{x=24,y=185}}
function UiManager:init()
    self.inventoryWeapons = {}
    self.inventoryPassives = {}
    self.horizontalLayoutLevelUp = HorizontalLayout(levelUpCellWidth, levelUpDistance, levelUpCellNumber, 20)
end


function UiManager:displayTitle()
    local x,y = gfx.getDrawOffset()
    gfx.setImageDrawMode(gfx.kDrawModeCopy)

    titleTop:draw(0, titleTopOpen:get() + titleTopClose:get() - y)
    titleBot:draw(0,titleBotY + titleBotOpen:get() + titleBotClose:get() - y)
end

function UiManager:OpenMenu()
    titleTopClose:set(0)
    titleBotClose:set(0)
    titleTopOpen:restart()
    titleBotOpen:restart()
    closedMenu = false
    menuMoving = true
    soundSamplerOpenCloseMenu:play()
    playdate.timer.new(1000, function ()
        soundSamplerOpenCloseMenu:stop()
    end)
end

function UiManager:CloseMenu()
    closedMenu = true
    titleTopClose:restart()
    titleBotClose:restart()
    menuMoving = true
    soundSamplerOpenCloseMenu:play()
    playdate.timer.new(1000, function ()
        soundSamplerOpenCloseMenu:stop()
        soundSamplerMenuClose:play()
    end)
end

function UiManager:OpenAndCloseMenu()

    self:OpenMenu()
    playdate.timer.new(titleBotOpen.duration + 300, function ()
        self:CloseMenu()
    end)
end

function UiManager:CloseAndOpenMenu()
    self:CloseMenu()
    playdate.timer.new(titleBotClose.duration + 300, function ()
        self:OpenMenu()
    end)
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
            if table.count(discardedUps) >= table.count(player.shopUnlocks) then
                pass = true
                break
            end
            passiveCheck = false
            weaponCheck = false
            rand = table.random(player.shopUnlocks)
            if table.contains(discardedUps, rand) == false then
                table.insert(discardedUps, rand)
            end
            if rand ~= nil then
                rand:updateDescriptionText()
                -- si c'est une new passive on check si on a de la place dans l'inventaire
                if rand.className == "UpgradeStat" then
                    if rand.name == "rerolls" or rand.name == "core" or rand.name =="hpRegen" then
                        passiveCheck = true
                    end
                    if table.contains(player.passives, rand) == false and rand.inventory == nil  then
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
            end
        until (table.contains(ups, rand) == false and rand.count > 0  and rand.rarity <= rarity and passiveCheck == false and weaponCheck == false)
        passiveCheck = false
        weaponCheck = false
        if pass == false then 
            table.remove(discardedUps, indexOf(discardedUps,rand))
            table.insert(ups, rand)
        end
    end
    if table.count(ups) <= 0 then
        table.insert(ups, getUpgradePassiveByName("core"))
        table.insert(ups, getUpgradePassiveByName("hpRegen"))
        levelUpIndexMax = 1
    end
    levelUpIndex = 0
end
local rerollDisplay = gfx.image.new("images/ui/icons/rerolls_small")
local rerollPanel = gfx.image.new("images/ui/menus/reroll_panel")
local bButton = gfx.image.new("images/ui/icons/B_Button")

function UiManager:levelUpDisplay()
    gfx.setColor(gfx.kColorWhite)
    gfx.setImageDrawMode(gfx.kDrawModeCopy)
    rerollPanel:draw(0,0)
    rerollDisplay:draw(3,3)
    bButton:draw(35,14)
    gfx.setFont(verySmallFont,gfx.kVariantBold)
    gfx.setImageDrawMode(gfx.kDrawModeFillWhite)
    gfx.drawTextAligned(tostring(player.rerolls),27,9, kTextAlignment.center)
    local i = 0
    for key, value in pairs(ups) do
        gfx.setColor(gfx.kColorBlack)
        gfx.fillRoundRect(self.horizontalLayoutLevelUp.positionBaseX + (i*(levelUpCellWidth+levelUpDistance)),self.horizontalLayoutLevelUp.positionBaseY + _pick_anim_y:get() , levelUpCellWidth, levelUpCellHeight,10)
        if i == levelUpIndex then
            gfx.setColor(gfx.kColorWhite)
            gfx.setLineWidth(4)
            gfx.drawRect(self.horizontalLayoutLevelUp.positionBaseX + (i*(levelUpCellWidth+levelUpDistance)) +10 ,self.horizontalLayoutLevelUp.positionBaseY + _pick_anim_y:get() +10, levelUpCellWidth -20, levelUpCellHeight-20)
        end
        gfx.setImageDrawMode(gfx.kDrawModeFillWhite)
        gfx.setFont(smallFontAmmolite,gfx.kVariantBold)
        gfx.drawTextAligned(string.upper(value.descriptionText) , self.horizontalLayoutLevelUp.positionBaseX + 50 + (i*(levelUpCellWidth+levelUpDistance)) + 6,self.horizontalLayoutLevelUp.positionBaseY + _pick_anim_y:get() + 150, kTextAlignment.center)
        value.image:scaledImage(1):draw( self.horizontalLayoutLevelUp.positionBaseX + 21 + (i*(levelUpCellWidth+levelUpDistance)) + 20,self.horizontalLayoutLevelUp.positionBaseY + _pick_anim_y:get() + 50)
        gfx.setImageDrawMode(gfx.kDrawModeCopy)
        upgradeContour:draw(self.horizontalLayoutLevelUp.positionBaseX + (i*(levelUpCellWidth+levelUpDistance)),self.horizontalLayoutLevelUp.positionBaseY + _pick_anim_y:get())
        i += 1
    end
    gfx.setImageDrawMode(gfx.kDrawModeFillWhite)
    gfx.setFont(font,gfx.kVariantBold)
    gfx.drawTextAligned("LEVEL UP", 200, 1, kTextAlignment.center)
    if playdate.buttonJustPressed(playdate.kButtonRight) then
        levelUpIndex = math.ring_int(levelUpIndex +1, 0, levelUpIndexMax)
    end
    if playdate.buttonJustPressed(playdate.kButtonLeft) then
        levelUpIndex -= 1
        if levelUpIndex == -1 then
            levelUpIndex = levelUpIndexMax
        end
    end
    if playdate.buttonJustPressed(playdate.kButtonA) then
        soundSamplerUpgradeSelected:play()
        generate = false
        ups[levelUpIndex +1]:applyUpgrade()
        -- game.timer:start()
        -- table.each(player.weapons, function (w)
        --     w.timer:start()
        -- end)
        table.each(spawners, function (s)
            s:resume()
        end)
        playdate.update = gameUpdate
        player:checkLevel()
    end
    if playdate.buttonJustPressed(playdate.kButtonB) and player.rerolls > 0 then
        player.rerolls -= 1
        self:generateUpgrades()
    end
    
end

function UiManager:updateLayout()
    -- Paramétrer le mode et police au début
    gfx.setImageDrawMode(gfx.kDrawModeFillWhite)
    gfx.setFont(verySmallFont, gfx.kVariantBold)

    -- Affichage des niveaux d'armes
    local offset = 0
    for _, iw in ipairs(inventoryWeaponTexts) do
        local weapon = table.findByParam(player.weapons, "className", iw.type)
        if weapon then
            local level = tostring(weapon.level)
            gfx.drawText("Lv."..level, 6 + offset, 235)
        end
        offset = offset + 31
    end

    -- Affichage des niveaux passifs
    offset = 0
    for _, ip in ipairs(inventoryPassiveTexts) do
        local level = tostring(ip.countMax - ip.count)
        gfx.drawText("Lv."..level, 292 + offset, 235)
        offset = offset + 29
    end
    gfx.setFont(smallFont, gfx.kVariantBold)
    -- Afficher les niveaux du joueur et le temps restant
    gfx.drawText(player.level, 98, 225)
    
    gfx.setFont(smallFontVariant)
    gfx.drawText(timeLeft(time), 373.5, 227)

    -- Affichage des barres de HP et XP
    self:createBar(121, 219, player.hpMax, player.hp, 5)
    self:createBar(121, 235, player.xpMax, player.xp, 1)
end


function UiManager:winScreenUpdate()
    gfx.setColor(gfx.kColorBlack)
    local screenWidth = playdate.display.getWidth()
    local screenHeight = playdate.display.getHeight()
    
    local rectWidth = 200
    local rectHeight = 150
    
    local rectX = (screenWidth - rectWidth) / 2
    local rectY = (screenHeight - rectHeight) / 2
    -- rect part
    gfx.fillRect(0, 0, 400, 210 + endScreenTweet:get())
    gfx.setFont(diamond_20,gfx.kVariantItalic)
    gfx.setImageDrawMode(gfx.kDrawModeFillWhite)
    if player.success == true then
        gfx.drawTextAligned("DEFENSE "..playerBonus.gameData.mapCount.." SUCCESS", rectWidth, 20+ endScreenTweet:get(), kTextAlignment.center)
    else
        gfx.drawTextAligned("DEFENSE "..playerBonus.gameData.mapCount.." FAILED", rectWidth, 20+ endScreenTweet:get(), kTextAlignment.center)
    end
    -- middle part
    core:draw( 50,70 + endScreenTweet:get())
    gfx.setFont(smallFontAmmolite,gfx.kVariantItalic)
    gfx.drawTextAligned("X"..player.core, 90, 90 + endScreenTweet:get(), kTextAlignment.center)
    local screenWidth = playdate.display.getWidth()
    local screenHeight = playdate.display.getHeight()
    local enemyImage = enemy:scaledImage(1)
    local imageWidth, imageHeight = enemyImage:getSize()
    local imageX = (screenWidth - imageWidth) / 2
    local imageY = (screenHeight - imageHeight) / 2
    gfx.setImageDrawMode(gfx.kDrawModeCopy)
    enemyImage:draw(imageX, imageY - 32 + endScreenTweet:get())
    gfx.setImageDrawMode(gfx.kDrawModeFillWhite)
    gfx.drawTextAligned("X"..player.enemiesKilled, imageX + 40, 90 + endScreenTweet:get(), kTextAlignment.center)
    gfx.setImageDrawMode(gfx.kDrawModeFillWhite)
    gfx.setFont(diamond_20,gfx.kVariantItalic)
    gfx.drawTextAligned("LV", 310, 85 + endScreenTweet:get(), kTextAlignment.center)
    gfx.setFont(smallFontAmmolite,gfx.kVariantItalic)
    gfx.drawTextAligned("X"..player.level, 330, 91 + endScreenTweet:get(), kTextAlignment.center)
    -- unlock part
    gfx.setColor(gfx.kColorWhite)
    local width = rectWidth + 150 
    local height = rectHeight - 80
    local offset = 35
    gfx.setLineWidth(2)
    gfx.drawRect(rectX + rectWidth/2 - width/2, rectY +  rectHeight/2 - height/2 + offset + endScreenTweet:get(), width, height)
    gfx.setFont(smallFontAmmolite,gfx.kVariantItalic)
    gfx.setImageDrawMode(gfx.kDrawModeFillWhite)
    gfx.drawTextAligned("UNLOCKS", rectWidth, 125 + endScreenTweet:get(), kTextAlignment.center)
    local offset = 0
    local offsetAdd = 10
    local totalWidth = 0
    local scaledImageWidth = 0
    local imageWidth = 30
    local imageHeight = 30
    
    local rectCenterX = rectX + rectWidth / 2
    local rectCenterY = rectY + rectHeight / 2 + offset + endScreenTweet:get()
    
    table.each(player.currentUnlocks, function (w)
        scaledImageWidth = w.image:scaledImage(1):getSize()
        totalWidth = totalWidth + scaledImageWidth + offsetAdd
    end)
    totalWidth = totalWidth - offsetAdd 
    
    local startX = rectCenterX - totalWidth / 2
    
    table.each(player.currentUnlocks, function (w)
        gfx.setImageDrawMode(gfx.kDrawModeCopy)
        imageWidth, imageHeight = w.image:getSize()
        w.image:scaledImage(1):draw(startX + offset, rectCenterY - imageHeight / 2 + 40)
        offset = offset + scaledImageWidth + offsetAdd
    end)
    gfx.setFont(verySmallFont,gfx.kVariantItalic)
    gfx.setImageDrawMode(gfx.kDrawModeFillWhite)
    gfx.drawTextAligned("PRESS BUTTON TO CONTINUE", rectWidth, 200 + endScreenTweet:get(), kTextAlignment.center)
    gfx.setImageDrawMode(gfx.kDrawModeCopy)
    endScreenContour:draw(0,0 + endScreenTweet:get())
    local current, pressed, released = playdate.getButtonState()
    if current ~= 0 and not lockInput then
        lockInput = true
        self:CloseAndOpenMenu()
        playdate.timer.new(1000, function ()
            tween = false
            mainMenuIndex = 0
            musicPlayer:stop()
            musicPlayer:load("audio/5")
            musicPlayer:play(0)
            playdate.update = mainMenuUpdate
        end)
        playdate.timer.new(2000, function ()
            lockInput = false
        end)
        return
    end
end

local chooseCannonBool = false
local chooseMap = false
local A = false

function UiManager:mainMenuUpdate()

    gfx.clear(gfx.kColorBlack)
    gfx.setImageDrawMode(gfx.kDrawModeCopy)
    gfx.setDrawOffset(0,0)
    mainMenu:draw(0,0)
    gfx.setFont(font,gfx.kVariantBold)
    gfx.drawTextAligned("DEFEND", 200, 41, kTextAlignment.center)
    gfx.drawTextAligned("UPGRADE", 200, 106, kTextAlignment.center)
    gfx.drawTextAligned("COLLECTION", 200, 171, kTextAlignment.center)
    if lockInput then return end
    if menuMoving == true and chooseCannonBool == false then
        return
    end

    if closedMenu == true and chooseCannonBool == false and chooseMap == false then
        if playdate.buttonJustPressed(playdate.kButtonA) then
            self:OpenMenu()
        end
        return
    end

    if chooseCannonBool == false and chooseMap == false then
        if playdate.buttonJustPressed(playdate.kButtonDown) then
            mainMenuIndex = math.ring_int(mainMenuIndex +1, 0, 2)
        end
        if playdate.buttonJustPressed(playdate.kButtonUp) then
            mainMenuIndex -= 1
            if mainMenuIndex == -1 then
                mainMenuIndex = 2
            end
        end
    end
    gfx.setColor(gfx.kColorWhite)
    gfx.fillCircleAtPoint(mainMenuPositions[mainMenuIndex+1].x, mainMenuPositions[mainMenuIndex+1].y, 14)

    if playdate.buttonJustPressed(playdate.kButtonA) and chooseCannonBool == false and chooseMap == false then
        A = true
        if mainMenuIndex == 0 then
            selectionScreenOpen:from(-192):to(0, 1, "easeOutSine")
            selectionScreenOpen:restart()
            chooseMap = true
        end
        if mainMenuIndex == 1 then
            self:CloseAndOpenMenu()
            lockInput = true
            playdate.timer.new(2000, function ()
                lockInput = false
            end)
            playdate.timer.new(1000, function ()
                playdate.update = shopUpdate
            end)
        end
        if mainMenuIndex == 2 then
            self:CloseAndOpenMenu()
            lockInput = true
            playdate.timer.new(2000, function ()
                lockInput = false
            end)
            playdate.timer.new(1000, function ()
                playdate.update = unlockScreenUpdate
            end)
        end
    end
    if playdate.buttonJustReleased(playdate.kButtonA) then
        A = false
    end
    if closedMenu == false and chooseCannonBool == false and chooseMap == false then
        if playdate.buttonJustPressed(playdate.kButtonB) then
            self:CloseMenu()
        end
        return
    end
    if chooseMap == true then
        selectionScreen:draw(playdate.display.getWidth() /2 - 234/2, selectionScreenOpen:get())
        self:chooseMap()
        if playdate.buttonJustPressed(playdate.kButtonB) and selectionScreenOpen:isDone() then
            selectionScreenOpen:from(0):to(-192, 1, "easeOutSine")
            selectionScreenOpen:restart()
            playdate.timer.new(1000, function ()
                chooseMap = false
            end)
        end
    end
    if chooseCannonBool == true and chooseMap == false then
        selectionScreen:draw(playdate.display.getWidth() /2 - 234/2, selectionScreenOpen:get())
        self:chooseCannon()
        if playdate.buttonJustPressed(playdate.kButtonB) and selectionScreenOpen:isDone() then
            chooseMap = true
            chooseCannonBool = false
        end
    end
end

local mapIndex = 1

function UiManager:chooseMap()
    if playdate.buttonJustPressed(playdate.kButtonRight) then
        mapIndex += 1
        if mapIndex > playerBonus.gameData.mapCount then
            mapIndex -= 1
        end
    end
    if playdate.buttonJustPressed(playdate.kButtonLeft) then
        mapIndex -= 1
        if mapIndex < 1 then
            mapIndex = 1
        end
    end

    local map = table.findByParam(wavesData, "Level", mapIndex)
    local width, height = map.Background:getSize()
    local x = GetXYCenteredFromRect(130,76,140,132, width, height).x
    local y = GetXYCenteredFromRect(130,76,140,132, width, height).y
    gfx.setImageDrawMode(gfx.kDrawModeCopy)
    map.Background:scaledImage(0.55):draw(90,60 + selectionScreenOpen:get())
    gfx.setFont(smallFontAmmolite,gfx.kVariantBold)
    gfx.setImageDrawMode(gfx.kDrawModeFillWhite)
    gfx.drawTextAligned("CHOOSE MAP", x + 195, 65 + selectionScreenOpen:get(), kTextAlignment.center)
    gfx.drawTextAligned(map.Name, x + 195, 65 + 15 + selectionScreenOpen:get(), kTextAlignment.center)
    chooseCannonArrowLeft:draw(100,y + selectionScreenOpen:get() + 100)
    chooseCannonArrowRight:draw(280,y + selectionScreenOpen:get() + 100)

    if selectionScreenOpen:isDone() == false then
        return
    end
    if playdate.buttonJustPressed(playdate.kButtonA) and A == false then
        A = true
        chooseCannonBool = true
        chooseMap = false
    end
end


function UiManager:chooseCannon()
    if playdate.buttonJustPressed(playdate.kButtonRight) then
        cannonIndex = math.ring_int(cannonIndex +1, 0, table.count(playerBonus.gameData.cannons)-1)
    end
    if playdate.buttonJustPressed(playdate.kButtonLeft) then
        cannonIndex -= 1
        if cannonIndex == -1 then
            cannonIndex = table.count(playerBonus.gameData.cannons)-1
        end
    end
    local cannon = playerBonus.gameData.cannons[cannonIndex+1]
    local width, height = cannon.image:getSize()
    local x = GetXYCenteredFromRect(130,76,140,132, width, height).x
    local y = GetXYCenteredFromRect(130,76,140,132, width, height).y
    gfx.setImageDrawMode(gfx.kDrawModeCopy)
    cannon.image:draw(x,y - 20 + selectionScreenOpen:get())
    gfx.setFont(smallFontAmmolite,gfx.kVariantBold)
    gfx.setImageDrawMode(gfx.kDrawModeFillWhite)
    gfx.drawTextAligned("CHOOSE CANNON", x + 11, 65 + selectionScreenOpen:get(), kTextAlignment.center)
    gfx.drawTextAligned(cannon.name, x + 11, 65 + 15 + selectionScreenOpen:get(), kTextAlignment.center)
    chooseCannonArrowLeft:draw(140,y + selectionScreenOpen:get())
    chooseCannonArrowRight:draw(240,y + selectionScreenOpen:get())
    local offset = 0
    local offsetAdd = 10
    local totalWidth = 0
    local scaledImageWidth = 0

    table.each(cannon.weapons, function (w)
        local wpUpgrade = table.findByParam(upgradesData, "type", w.className)
        scaledImageWidth = wpUpgrade.image:scaledImage(1):getSize()
        totalWidth = totalWidth + scaledImageWidth + offsetAdd
    end)
    totalWidth = totalWidth - offsetAdd
    local startX = x + (width - totalWidth) / 2

    table.each(cannon.weapons, function (w)
        local wpUpgrade = table.findByParam(upgradesData, "type", w.className)
        gfx.setImageDrawMode(gfx.kDrawModeCopy)
        wpUpgrade.image:scaledImage(1):draw(startX + offset, 150 + selectionScreenOpen:get())
        offset = offset + scaledImageWidth + offsetAdd
    end)
    if selectionScreenOpen:isDone() == false then
        return
    end
    if playdate.buttonJustPressed(playdate.kButtonA) and A == false then
        player.chosenCanon = cannon
        player:start()
        game = Game(30,mapIndex)
        lockInput = true
        self:CloseAndOpenMenu()
        playdate.timer.new(1000, function ()
            chooseCannonBool = false
            playdate.update = gameUpdate
        end)
    end
end


local unlockHeader = gfx.image.new("images/ui/menus/achievement_header")
local unlockItem = gfx.image.new("images/ui/menus/achievement_item")
local questionMark = gfx.image.new("images/ui/question_mark")

local selectedItem = 1

function UiManager:unlockScreenUpdate()
    gfx.clear(gfx.kColorBlack)
    local x, y = gfx.getDrawOffset()

    -- Configuration des offsets
    local offsetBetweenHeaderAndItems = 35
    local offsetBetweenItems = 5
    local offsetBetweenCategories = 20
    local itemNumber = 5
    local marginX = 5

    -- Variables de navigation
    local currentX, currentY = 0, 0
    local rowItemCount = 0
    local headers = {}
    local items = {}
    local unlockType = nil
    local currentHeaderY = 0

    -- Dessiner les headers et items
    -- Dessiner les headers et items
for _, unlock in ipairs(unlocksData) do
    -- Changement de catégorie (header)
    if unlock.className ~= unlockType then
        -- Ajuster currentY en fonction des items précédents
        if rowItemCount > 0 then
            currentY = currentY + unlockItem.height + offsetBetweenItems
        end

        unlockType = unlock.className
        currentX, rowItemCount = 0, 0
        currentY = currentY + offsetBetweenHeaderAndItems + offsetBetweenCategories
        currentHeaderY = currentY - offsetBetweenHeaderAndItems

        -- Dessiner le header de catégorie
        table.insert(headers, {name = unlock.className, y = currentHeaderY})
        gfx.setFont(diamond_20)
        gfx.setImageDrawMode(gfx.kDrawModeFillWhite)
        unlockHeader:draw( marginX, currentHeaderY - 15)
        gfx.drawTextAligned(string.upper(self:formatCategoryName(unlock.className)), 63 + marginX, currentHeaderY -12, kTextAlignment.center)
        gfx.setImageDrawMode(gfx.kDrawModeCopy)
    end

    -- Dessin des items
    local itemPosX = currentX + marginX
    local itemPosY = currentY
    table.insert(items, {x = itemPosX, y = itemPosY, unlock = unlock})

    -- Dessiner le fond et les icônes
    unlockItem:draw(itemPosX, itemPosY)
    if not table.contains(playerBonus.gameData.unlocks, unlock) then
        questionMark:draw(itemPosX + 4, itemPosY + 5)
    else
        unlock.image:draw(itemPosX + 13, itemPosY + 13)
    end

    -- Dessiner le carré de sélection
    if selectedItem == #items then
        gfx.setColor(gfx.kColorWhite)
        gfx.setLineWidth(3)
        gfx.drawRect(itemPosX + 5, itemPosY + 5, unlockItem:getSize() - 10, unlockItem:getSize() - 10)
    end

    -- Mise à jour des positions pour l'item suivant
    currentX = currentX + unlockItem.width + offsetBetweenItems
    rowItemCount = rowItemCount + 1
    if rowItemCount >= itemNumber then
        currentX = 0
        currentY = currentY + unlockItem.height + offsetBetweenItems
        rowItemCount = 0
    end
end

    if menuMoving then
        return
    end
    -- Navigation
    if playdate.buttonJustPressed(playdate.kButtonDown) then
        self:moveSelection(items, "down", itemNumber)
    elseif playdate.buttonJustPressed(playdate.kButtonUp) then
        self:moveSelection(items, "up", itemNumber)
    elseif playdate.buttonJustPressed(playdate.kButtonLeft) then
        selectedItem = math.max(1, selectedItem - 1)
    elseif playdate.buttonJustPressed(playdate.kButtonRight) then
        selectedItem = math.min(#items, selectedItem + 1)
    elseif playdate.buttonJustPressed(playdate.kButtonB) then
        y = 0
        selectedItem = 1
        self:CloseAndOpenMenu()
        playdate.timer.new(1000, function ()
            mainMenuIndex = 2
            playdate.update = mainMenuUpdate
        end)
        return
    end

    -- Scrolling dynamique
    local selectedItemY = items[selectedItem].y
    if selectedItemY + y > 150 then
        gfx.setDrawOffset(0, y - 120)
    elseif selectedItemY + y < 0 then
        gfx.setDrawOffset(0, y + 120)
    end
    if y > 0 then
        gfx.setDrawOffset(0, 0)
    end

    -- Affichage du unlockMenu
    unlockMenu:draw(0 + x, 0 - y)

    -- Afficher le texte de l'élément sélectionné
    local selectedUnlock = items[selectedItem].unlock
    gfx.setFont(smallFont, gfx.kVariantBold)
    if not table.contains(playerBonus.gameData.unlocks, selectedUnlock) then
        gfx.drawTextAligned(selectedUnlock.description, playdate.display.getWidth() / 2, 205 - y, kTextAlignment.center)
    else
        gfx.drawTextAligned(selectedUnlock.name, playdate.display.getWidth() / 2, 195 - y, kTextAlignment.center)
        gfx.setFont(smallFontAmmolite, gfx.kVariantBold)
        gfx.setImageDrawMode(gfx.kDrawModeFillWhite)
        gfx.drawTextAligned(selectedUnlock.descriptionUnlocked, playdate.display.getWidth() / 2, 215 - y, kTextAlignment.center)
    end
end

-- Nouvelle méthode pour formater les noms des catégories
function UiManager:formatCategoryName(name)
    if name == "UnlockPassive" then return "Passives"
    elseif name == "UnlockWeapon" then return "Weapons"
    elseif name == "UnlockCannon" then return "Cannons"
    else return name end
end

-- Méthode pour déplacer la sélection
function UiManager:moveSelection(items, direction, itemsPerRow)
    local newIndex = selectedItem
    if direction == "down" then
        newIndex = selectedItem + itemsPerRow
    elseif direction == "up" then
        newIndex = selectedItem - itemsPerRow
    end
    if items[newIndex] then
        selectedItem = newIndex
    end
end



-- function UiManager:unlockScreenUpdate()
--     gfx.clear(gfx.kColorBlack)
--     local x,y = gfx.getDrawOffset()

--     local unlockType = nil
--     local offsetBetweenHeaderAndItems = 35
--     local offsetBetweenItems = 5
--     local offsetBetweenCategories = 20
--     local itemNumber = 5
--     local offsetBetweenHeaders = 0  -- Ajouté pour l'offset entre les headers
--     local marginX = 5

--     local currentX = 0
--     local currentY = 0
--     local currentHeaderY = 0
--     local rowItemCount = 0
--     local rows = {}
--     local headers = {}
--     local itemCount = 0
--     local items = {}
--     local categories = {}
--     local currentCategoryNumber = {}
--     local currentCategoryName = ""
--     table.each(unlocksData, function(unlock)
--         if unlock.className ~= unlockType then
--             currentX = 0
--             local header = {name = unlock.className, completion = 0}
--             table.insert(headers, header)
--             currentCategoryName = unlock.className
--             table.insert(rows, {})
--             -- nouvelle catégorie ici
--             if unlockType ~= nil then
--                 table.insert(categories, table.shallowcopy(currentCategoryNumber))
--                 currentCategoryNumber = {}
--                 offsetBetweenHeaders = unlockItem:getSize() + offsetBetweenCategories
--                 currentY = currentY + unlockHeader.height + offsetBetweenHeaders
--                 currentHeaderY = currentY
--             end
--             currentX = 0  
--             rowItemCount = 0
--             unlockType = unlock.className
--         end
--         itemCount += 1
--         table.insert(currentCategoryNumber, itemCount)
--         table.each(headers, function (header)
--             unlockHeader:draw(0 + marginX, currentHeaderY + 5)
--             gfx.setImageDrawMode(gfx.kDrawModeFillWhite)
--             if currentCategoryName == "UnlockPassive" then
--                 currentCategoryName = "Passives"
--             end
--             if currentCategoryName == "UnlockWeapon" then
--                 currentCategoryName = "Weapons"
--             end
--             if currentCategoryName == "UnlockCannon" then
--                 currentCategoryName = "Cannons"
--             end
--             -- DRAW HEADER TITLE
--             gfx.setFont(diamond_20)
--             gfx.drawTextAligned(string.upper(currentCategoryName), 70 + marginX, currentHeaderY + 9, kTextAlignment.center)
--         end)
--         gfx.setImageDrawMode(gfx.kDrawModeCopy)
--         unlockItem:draw(currentX + marginX, currentY + offsetBetweenHeaderAndItems)
--         if table.contains(playerBonus.gameData.unlocks, unlock) == false then
--             questionMark:draw(currentX + marginX + 4, currentY + offsetBetweenHeaderAndItems + 5)
--         else
--             unlock.image:draw(currentX + marginX + 13, currentY + offsetBetweenHeaderAndItems + 13)
--         end
--         table.insert(items, {x=currentX + marginX, y=currentY + offsetBetweenHeaderAndItems})
--         gfx.setColor(gfx.kColorWhite)
--         gfx.setLineWidth(3)
--         if itemCount == selectedItem then
--             gfx.drawRect(currentX + marginX + 5, currentY + offsetBetweenHeaderAndItems + 5,unlockItem:getSize()-10, unlockItem:getSize()-10)
--         end
        
--         currentX = currentX + unlockItem.width + offsetBetweenItems
--         rowItemCount = rowItemCount + 1
        
--         if rowItemCount >= itemNumber then
--             currentX = 0 
--             currentY = currentY + unlockItem.height + offsetBetweenItems 
--             rowItemCount = 0 
--         end
--     end)
--     table.insert(categories, table.shallowcopy(currentCategoryNumber))
--     unlockMenu:draw(0 + x,0 - y)
--     if menuMoving == true then
--         return
--     end
--     if playdate.buttonJustPressed(playdate.kButtonB) then
--         y = 0
--         selectedItem = 1
--         self:CloseAndOpenMenu()
--         playdate.timer.new(1000, function ()
--             mainMenuIndex = 2
--             playdate.update = mainMenuUpdate
--         end)
--         return
--     end
--     if playdate.buttonJustPressed(playdate.kButtonLeft) then
--         selectedItem -= 1
--         if selectedItem <= 0 then
--             selectedItem = 1
--         end
--     end
--     if playdate.buttonJustPressed(playdate.kButtonRight) then
--         selectedItem += 1
--         if selectedItem >= table.count(unlocksData) then
--             selectedItem = table.count(unlocksData)
--             return
--         end

--     end
--     if playdate.buttonJustPressed(playdate.kButtonDown) then
--         local lastItemCount = lastLineItemCount(table.count(categories[table.count(categories)]))
--         local rangeOfItem = itemCount - lastItemCount
--         for i = rangeOfItem , itemCount do
--             if selectedItem == i then
--                 return
--             end
--         end
--         local positionTest = {x=items[selectedItem].x,y=items[selectedItem].y+63}
--         local contains = false
--         for key, item in pairs(items) do
--             if positionTest.x == item.x and positionTest.y == item.y then
--                 contains = true
--                 selectedItem = indexOf(items, item) or 0
--                 break
--             else
--                 contains = false
--             end
--         end

--         if contains == false then
--             local newY = positionTest.y + offsetBetweenHeaders + offsetBetweenCategories - 55
--             for key, item in pairs(items) do                  
--                 if positionTest.x == item.x and newY == item.y then
--                     contains = true
--                     selectedItem = indexOf(items, item) or 0
--                     break
--                 else
--                     contains = false
--                 end
--             end
--         end
        
--         if contains == false then
--             local xOffset = 63
--             local found = false
--             while(found == false) do
--                 for key, item in pairs(items) do
--                     if positionTest.x - xOffset == item.x and positionTest.y == item.y then
--                         selectedItem = indexOf(items, item) or 0
--                         found = true
--                     end
--                 end
--                 xOffset += 63
--             end
--         end
--     end

--     if playdate.buttonJustPressed(playdate.kButtonUp) then
--         if selectedItem - 5 <= 0 then
--             return
--         end
    
--         local positionTest = {x=items[selectedItem].x,y=items[selectedItem].y-63}
--         local contains = false
--         for key, item in pairs(items) do
--             if positionTest.x == item.x and positionTest.y == item.y then
--                 contains = true
--                 selectedItem = indexOf(items, item) or 0
--                 break
--             else
--                 contains = false
--             end
--         end

--         if contains == false then
--             local newY = positionTest.y - (offsetBetweenHeaders + offsetBetweenCategories) + 55
--             for key, item in pairs(items) do                  
--                 if positionTest.x == item.x and newY == item.y then
--                     contains = true
--                     selectedItem = indexOf(items, item) or 0
--                     break
--                 else
--                     contains = false
--                 end
--             end
--         end
        
--         if contains == false then
--             local xOffset = 63
--             local found = false

--             while(found == false) do
--                 for key, item in pairs(items) do
--                     if positionTest.x - xOffset == item.x and positionTest.y - 43 == item.y then
--                         selectedItem = indexOf(items, item) or 0
--                         found = true
--                     end
--                 end
--                 xOffset += 63
--             end
--         end
--     end
--     local unl = unlocksData[selectedItem]
--     gfx.setImageDrawMode(gfx.kDrawModeFillWhite)
--     gfx.setFont(smallFont,gfx.kVariantBold)
--     if table.contains(playerBonus.gameData.unlocks, unl) == false then
--         gfx.drawTextAligned(unl.description, playdate.display.getWidth()/2, 205 - y, kTextAlignment.center)
--     else
--         gfx.drawTextAligned(unl.name, playdate.display.getWidth()/2, 195- y, kTextAlignment.center)
--         gfx.setFont(smallFontAmmolite,gfx.kVariantBold)
--         gfx.drawTextAligned(unl.descriptionUnlocked, playdate.display.getWidth()/2, 215- y, kTextAlignment.center)
--     end
--     gfx.setFont(smallFontAmmolite,gfx.kVariantBold)
--     gfx.drawTextAligned(calculateUnlockPercentage(playerBonus.gameData.unlocks, unlocksData).."%", 370, 16 - y, kTextAlignment.center)
--     gfx.setImageDrawMode(gfx.kDrawModeCopy)

--     if items[selectedItem].y +y> 150 then
--         gfx.setDrawOffset(0, y - 80)
--     end
--     if items[selectedItem].y +y < 0 then
--         gfx.setDrawOffset(0, y + 80)
--     end
--     if y > 0 then
--         gfx.setDrawOffset(0,0)
--     end
-- end

local selectedShopItem = 1
local shopItems = {}

local shopTween = sequence.new():from(0):to(-135, 1, "easeOutSine")
lockInput = false
lockDpad = false

function UiManager:shopUpdate()
    gfx.clear(gfx.kColorBlack)
    local xOffset,yOffset = gfx.getDrawOffset()
    local width, height = shopItem:getSize()
    local x = playdate.display.getWidth() / 2 - width /2
    local y = playdate.display.getHeight()/2 - height/2
    local yAdd = 0
    shopItems = {}
    table.each(playerBonus.gameData.shopItems, function(shopItemData)
        gfx.setImageDrawMode(gfx.kDrawModeCopy)
        shopItem:draw(x,y+yAdd)
        local width, height = shopItemData.unlock.image:getSize()
        shopItemData.unlock.image:draw(x+37 - width/2,y+yAdd+33)
        
        gfx.setFont(smallFontAmmolite,gfx.kVariantBold)
        gfx.setImageDrawMode(gfx.kDrawModeFillWhite)
        gfx.drawTextAligned(shopItemData.name, x + 115, y+yAdd + 15, kTextAlignment.center)
        if shopItemData.level >= shopItemData.levelMax then
            gfx.drawTextAligned("MAX", x + 265, y+yAdd + 15, kTextAlignment.center)
            shopItemData.cost = 0
        else
            gfx.drawTextAligned(shopItemData.level.."/"..shopItemData.levelMax, x + 265, y+yAdd + 15, kTextAlignment.center)
        end
        gfx.drawTextAligned(shopItemData.cost, x + 272, y+yAdd + 65, kTextAlignment.center)
        gfx.drawTextAligned(calculateShopItemsLevelPercentage(playerBonus.gameData.shopItems, shopItemsData).."%", 370, 16 - yOffset, kTextAlignment.center)
        gfx.setFont(smallFont,gfx.kVariantBold)
        gfx.drawTextAligned(shopItemData.unlock.descriptionUnlocked, x + 140, y+yAdd + 50, kTextAlignment.center)
        coreShop:draw(x + 240, y+yAdd + 60)

        table.insert(shopItems, {x=x,y=y+yAdd})
        yAdd += 130
    end)
    gfx.setFont(smallFontAmmolite,gfx.kVariantBold)
    gfx.setImageDrawMode(gfx.kDrawModeCopy)
    shopMenu:draw(0 + xOffset,0 - yOffset)
    coreShop:draw(15,8 - yOffset)
    gfx.setImageDrawMode(gfx.kDrawModeFillWhite)
    gfx.drawTextAligned(playerBonus.gameData.core, 45, 11-yOffset, kTextAlignment.center)
    gfx.setDrawOffset(0,shopTween:get() )
    if menuMoving == true then
        return
    end
    if playdate.buttonJustPressed(playdate.kButtonB) and not lockInput then
        lockInput = true
        self:CloseAndOpenMenu()
        gfx.setDrawOffset(0,0)
        playdate.timer.new(2000, function ()
            lockInput = false
        end)
        playdate.timer.new(1000, function ()
            mainMenuIndex = 1
            playdate.update = mainMenuUpdate
        end)
        return
    end
    if playdate.buttonJustPressed(playdate.kButtonA) then
        local boughtItem = playerBonus.gameData.shopItems[selectedShopItem]
        if boughtItem.level < boughtItem.levelMax then
            if playerBonus.gameData.core >= boughtItem.cost then
                soundSamplerItemShopSound:play()
                playerBonus.gameData.core -= boughtItem.cost
                boughtItem.level += 1
                boughtItem.cost *= boughtItem.multiplyer
                boughtItem.cost = math.round(boughtItem.cost)
                if boughtItem.unlock.className == "UnlockPassive" then
                    playerBonus:addPassive(boughtItem.unlock.upgrade)
                end
                if boughtItem.unlock.className == "UnlockCannon" then
                    table.insert(playerBonus.gameData.cannons,boughtItem.unlock.upgrade)
                end
            end
        end
    end
    if playdate.buttonJustPressed(playdate.kButtonDown) and lockDpad == false then
        if selectedShopItem >= table.count(playerBonus.gameData.shopItems) then return end
        selectedShopItem += 1
        lockDpad = true
        local x,y = gfx.getDrawOffset()
        shopTween:from(y):to(y-130,0.25,"outExpo"):start():callback(function ()
            lockDpad = false
        end)
    end

    if playdate.buttonJustPressed(playdate.kButtonUp) and lockDpad == false then
        if selectedShopItem <= 1 then return end
        selectedShopItem -= 1
        lockDpad = true
        local x,y = gfx.getDrawOffset()
        shopTween:from(y):to(y+130,0.25,"outExpo"):start():callback(function ()
            lockDpad = false
        end)
    end
end


function UiManager:createBar(x, y, max, current, height)
    local maxWidth = 158
    local currentWidth = math.max(0, math.min((current / max) * maxWidth, maxWidth))

    if currentWidth > 0 then
        gfx.setColor(gfx.kColorWhite)
        gfx.fillRoundRect(x, y, currentWidth, height, 10)
    end
end


inventorySpritesWeapons = {}
inventorySpritesPassives = {}

function UiManager:createInventory(x,y, offset, inventoryTable)
    local offs = 0
    local type = ""

    for key, value in pairs(inventoryTable) do
        local item = gfx.sprite.new(gfx.image.new(value.path.."_small"))
        item:moveTo(x + offs - 1, y - 2)
        item:setCenter(0.5,0.5)
        item:setZIndex(1000)
        item:setImageDrawMode(gfx.kDrawModeCopy)
        item:add()
        offs += offset
        if value.className == "UpgradeWeapon" then
            table.insert(inventorySpritesWeapons, item)
            type = "weapon"
        else
            table.insert(inventorySpritesPassives, item)
            type = "passive"
        end
    end
    if type == "weapon" then
        inventoryWeaponTexts = inventoryTable
    else
        inventoryPassiveTexts = inventoryTable
    end
end