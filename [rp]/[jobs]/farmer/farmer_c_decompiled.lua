-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

addEvent("onClientPlayerQuitFromCharacter", true)
addEventHandler("onClientPlayerQuitFromCharacter", localPlayer, function()
  for forvar3, forvar4 in pairs(var0) do
    destroyElement(forvar3)
  end
  var0 = {}
end)
addEvent("farmer:startFarming", true)
addEventHandler("farmer:startFarming", root, function(arg0)
  if not getElementData(localPlayer, "character:id") then
    return
  end
  if isPedDead(localPlayer) then
    return
  end
  if isPedInVehicle(localPlayer) then
    return
  end
  if isPedOnGround(localPlayer) then
    if getElementData(localPlayer, "job") == "Farmer" then
      if var0 and isElement(var0) and isElementWithinMarker(localPlayer, var0) then
        outputChatBox("You cannot plant over another plant.", 255, 60, 0)
        return
      end
      for forvar10, forvar11 in ipairs(getElementsByType("object", resourceRoot)) do
        if getElementInterior(forvar11) == getElementInterior(localPlayer) and getElementDimension(forvar11) == getElementDimension(localPlayer) and getDistanceBetweenPoints2D(getElementPosition(localPlayer)) <= 1 and getElementID(forvar11) and string.find(getElementID(forvar11), "plant:", 1, true) then
          outputChatBox("You cannot plant over another plant.", 255, 60, 0)
          return
        end
      end
      triggerServerEvent("farmer:plant", localPlayer, plant_types[arg0].name, plant_types[arg0].model, getElementPosition(localPlayer))
      destroyElement((createObject(plant_types[arg0].model, getElementPosition(localPlayer))))
    else
      outputChatBox("You must be a farmer to be able to plant this seeds.", 255, 68, 0)
    end
  end
end)
addEvent("farmer:createPlantMarker", true)
addEventHandler("farmer:createPlantMarker", root, function(arg0, arg1, arg2, arg3)
  if isElementWithinMarker(localPlayer, (createMarker(arg0, arg1, arg2 - 0.7, "cylinder", 1, 255, 221, 0, 100))) then
    var0 = createMarker(arg0, arg1, arg2 - 0.7, "cylinder", 1, 255, 221, 0, 100)
  end
  var1[createMarker(arg0, arg1, arg2 - 0.7, "cylinder", 1, 255, 221, 0, 100)] = arg3
end)
addEventHandler("onClientMarkerHit", resourceRoot, function(arg0, arg1)
  if not arg1 then
    return
  end
  if arg0 ~= localPlayer then
    return
  end
  if var0[source] and isElement(var0[source]) then
    var1 = source
    if not isPedOnGround(localPlayer) or isObjectMoving(var0[source]) then
    else
      if isPedInVehicle(localPlayer) then
        return
      end
      bindKey("H", "down", harvestKey, source)
      exports.notifications:showKeyDescription("farmer:harvest", "H", "Harvest")
    end
  end
end)
addEventHandler("onClientMarkerLeave", resourceRoot, function(arg0, arg1)
  if arg0 ~= localPlayer then
    return
  end
  if var0[source] then
    var1 = false
    if isElement(var0[source]) and isObjectMoving(var0[source]) then
    else
      unbindKey("H", "down", harvestKey, source)
      exports.notifications:hideKeyDescription("farmer:harvest")
    end
  end
end)
function harvestKey(arg0, arg1, arg2)
  if isElement(arg2) then
    if var0 then
      return
    end
    if isPedDead(localPlayer) then
      return
    end
    if isPedInVehicle(localPlayer) then
      return
    end
    if not isPedOnGround(localPlayer) then
      return
    end
    if var1[arg2] and getElementID(var1[arg2]) then
      var0 = true
      var2 = arg2
      triggerServerEvent("farmer:harvest", localPlayer, split(getElementID(var1[arg2]), ":")[2])
      unbindKey("H", "down", harvestKey, source)
      exports.notifications:hideKeyDescription("farmer:harvest")
    end
  end
end
addEvent("farmer:harvest:callback", true)
addEventHandler("farmer:harvest:callback", localPlayer, function(arg0)
  if arg0 and isElement(var0) then
    destroyElement(var0)
    var1[var0] = nil
  end
  var0 = false
  var2 = false
end)
function drawPlantsLabels()
  if isPlayerMapVisible() then
    return
  end
  for forvar9, forvar10 in ipairs((getElementsWithinRange(getCameraMatrix()))) do
    if getElementID(forvar10) and string.find(getElementID(forvar10), "plant:", 1, true) and isLineOfSightClear(getCameraMatrix()) and getScreenFromWorldPosition(getElementPosition(forvar10)) and getScreenFromWorldPosition(getElementPosition(forvar10)) then
      table.sort(split((tostring(split(getElementID(forvar10), ":")[3]) .. " Plant") .. [[

** Ready to Harvest **]], 10), function(arg0, arg1)
        return #arg0 > #arg1
      end)
      dxDrawRectangle(getScreenFromWorldPosition(getElementPosition(forvar10)) - math.max(dxGetTextWidth(split((tostring(split(getElementID(forvar10), ":")[3]) .. " Plant") .. [[

** Ready to Harvest **]], 10)[1], 1, var0) + 15, 100) / 2, getScreenFromWorldPosition(getElementPosition(forvar10)) - (15 * #split((tostring(split(getElementID(forvar10), ":")[3]) .. " Plant") .. [[

** Ready to Harvest **]], 10) + 9) / 2, math.max(dxGetTextWidth(split((tostring(split(getElementID(forvar10), ":")[3]) .. " Plant") .. [[

** Ready to Harvest **]], 10)[1], 1, var0) + 15, 100), 15 * #split((tostring(split(getElementID(forvar10), ":")[3]) .. " Plant") .. [[

** Ready to Harvest **]], 10) + 9, tocolor(0, 0, 0, 120))
      dxDrawText((tostring(split(getElementID(forvar10), ":")[3]) .. " Plant") .. [[

** Ready to Harvest **]], getScreenFromWorldPosition(getElementPosition(forvar10)) + 2, getScreenFromWorldPosition(getElementPosition(forvar10)) + 2, getScreenFromWorldPosition(getElementPosition(forvar10)))
      dxDrawText((tostring(split(getElementID(forvar10), ":")[3]) .. " Plant") .. [[

** Ready to Harvest **]], getScreenFromWorldPosition(getElementPosition(forvar10)))
    end
  end
end
addEventHandler("onClientResourceStart", resourceRoot, function()
  if getElementData(localPlayer, "describtion:show") then
    addEventHandler("onClientRender", root, drawPlantsLabels)
  end
end)
addEventHandler("onClientElementDataChange", localPlayer, function(arg0, arg1)
  if arg0 == "describtion:show" then
    if getElementData(localPlayer, "describtion:show") then
      removeEventHandler("onClientRender", root, drawPlantsLabels)
      addEventHandler("onClientRender", root, drawPlantsLabels)
    else
      removeEventHandler("onClientRender", root, drawPlantsLabels)
    end
  end
end)
function UIKitReady()
  eui = exports.UIKit
  var0.window[1] = eui:uiCreateWindow(false, false, 420, 220, {
    en = "Selling Agricultural Crops",
    ar = "\216\168\217\138\216\185 \216\167\217\132\217\133\216\173\216\167\216\181\217\138\217\132 \216\167\217\132\216\178\216\177\216\167\216\185\217\138\216\169"
  })
  eui:uiSetVisible(var0.window[1], false)
  var0.label.Info = eui:uiCreateLabel(20, 60, 222, 20, "", tocolor(255, 255, 255, 255), "left", "top", var0.window[1])
  var0.button.sell = eui:uiCreateButton(5, 180, 150, 35, {en = "Sell", ar = "\216\168\217\138\216\185"}, "primary", var0.window[1])
  var0.button.cancel = eui:uiCreateButton(160, 180, 150, 35, {en = "Cancel", ar = "\216\165\217\132\216\186\216\167\216\161"}, _, var0.window[1])
end
addEventHandler("onClientUIReady", resourceRoot, UIKitReady)
addEventHandler("onClientUIKitReady", root, UIKitReady)
function closeUIWindows(arg0)
  eui:uiSetVisible(var0.window[1], false)
  showCursor(false)
end
addEvent("onClientPlayerQuitFromCharacter", true)
addEventHandler("onClientPlayerQuitFromCharacter", localPlayer, closeUIWindows)
addEventHandler("onClientPlayerWasted", localPlayer, closeUIWindows)
addEvent("onClientElementMenuClick", true)
addEventHandler("onClientElementMenuClick", root, function(arg0, arg1, arg2)
  if not isElement(arg0) then
    return
  end
  if getElementType(arg0) == "ped" and getElementData(arg0, "ped:interact") == "sell.crops" and arg1 == "Talk" then
    if not getElementData(localPlayer, "character:id") then
      return
    end
    var0 = {}
    for forvar11, forvar12 in ipairs((exports["inventory-system"]:getInventoryItems("character:" .. tostring((getElementData(localPlayer, "character:id")))))) do
      if forvar12.Properties.Crop and plant_info[forvar12.Name] then
        table.insert(var0, forvar12)
      end
    end
    eui:uiSetText(var1.label.Info, {
      en = "You have: " .. tostring(0 + 1) .. [[
 fish
Total price: #00FF00$]] .. tostring(0 + plant_info[forvar12.Name].sell_price) .. [[


#FFFFFFPress 'Sell' button if you want to sell all your crops.]],
      ar = "\216\163\217\134\216\170 \217\132\216\175\217\138\217\131: " .. tostring(0 + 1) .. " \217\133\216\173\216\181\217\136\217\132\n\216\167\217\132\216\179\216\185\216\177 \216\167\217\132\216\165\216\172\217\133\216\167\217\132\217\138: #00FF00$" .. tostring(0 + plant_info[forvar12.Name].sell_price) .. "\n\n#FFFFFF\216\167\216\182\216\186\216\183 '\216\168\217\138\216\185' \216\167\216\176\216\167 \217\131\217\134\216\170 \216\170\216\177\217\138\216\175 \216\168\217\138\216\185 \216\172\217\133\217\138\216\185 \216\167\217\132\217\133\216\173\216\167\216\181\217\138\217\132 \217\132\216\175\217\138\217\131."
    })
    eui:uiSetVisible(var1.window[1], true)
    showCursor(true)
  end
end)
addEventHandler("onClientUIClick", root, function()
  if source == var0.button.sell then
    if var1 then
      exports.notifications:output({
        en = "Wait please",
        ar = "\216\167\217\134\216\170\216\184\216\177 \217\133\217\134 \217\129\216\182\217\132\217\131"
      }, 3000, "warning")
      return
    end
    if #var2 > 0 then
      if not getElementData(localPlayer, "character:id") then
        return
      end
      var1 = true
      triggerServerEvent("farmer:sell", localPlayer)
      eui:uiSetVisible(var0.window[1], false)
      showCursor(false)
      var2 = {}
    else
      outputChatBox("You don't have any crops to sell.", 255, 0, 0)
    end
  elseif source == var0.button.cancel then
    eui:uiSetVisible(var0.window[1], false)
    showCursor(false)
  end
end)
addEvent("farmer:sell:callback", true)
addEventHandler("farmer:sell:callback", localPlayer, function()
  var0 = false
end)
addEvent("onClientPlayerTakeJob", true)
addEventHandler("onClientPlayerTakeJob", localPlayer, function(arg0)
  if arg0 ~= "Farmer" then
    return
  end
  outputChatBox("\216\167\216\170\216\168\216\185 \216\167\217\132\216\174\216\183\217\136\216\167\216\170 \216\167\217\132\216\170\216\167\217\132\217\138\216\169:", 255, 200, 0)
  outputChatBox("   1- \216\167\216\176\217\135\216\168 \216\165\217\132\217\137 \216\167\217\132\217\133\216\178\216\177\216\185\216\169\216\140 \216\167\217\132\217\133\217\134\216\183\217\130\216\169 \216\167\217\132\216\181\217\129\216\177\216\167\216\161 \216\185\217\132\217\137 \216\167\217\132\216\174\216\177\217\138\216\183\216\169.", 255, 200, 0)
  outputChatBox("   2- \217\130\217\133 \216\168\216\180\216\177\216\167\216\161 \216\167\217\132\216\168\216\176\217\136\216\177 \217\133\217\134 \216\167\217\132\216\168\216\167\216\166\216\185 \216\167\217\132\217\133\217\136\216\172\217\136\216\175 \217\129\217\138 \216\167\217\132\217\133\216\178\216\177\216\185\216\169.", 255, 200, 0)
  outputChatBox("   3- \216\167\216\176\217\135\216\168 \216\165\217\132\217\137 \217\133\217\134\216\183\217\130\216\169 \216\167\217\132\216\178\216\177\216\167\216\185\216\169 \217\136\216\167\216\179\216\170\216\174\216\175\217\133 \216\167\217\132\216\168\216\176\217\136\216\177 \217\133\217\134 \216\167\217\132\216\173\217\130\217\138\216\168\216\169 \217\132\216\168\216\175\216\163 \216\167\217\132\216\178\216\177\216\167\216\185\216\169.", 255, 200, 0)
  outputChatBox("   4- \216\167\217\134\216\170\216\184\216\177 \216\173\216\170\217\137 \217\134\217\133\217\136 \216\167\217\132\216\178\216\177\216\185 \216\168\216\180\217\131\217\132 \217\131\216\167\217\133\217\132.", 255, 200, 0)
  outputChatBox("   5- \216\167\216\173\216\181\216\175 \216\167\217\132\217\133\216\178\216\177\217\136\216\185 \216\185\217\134 \216\183\216\177\217\138\217\130 \216\167\217\132\217\136\217\130\217\136\217\129 \216\168\216\172\216\167\217\134\216\168 \216\167\217\132\216\178\216\177\216\185\216\169 \217\136\216\167\217\132\216\182\216\186\216\183 \216\185\217\132\217\137 \216\178\216\177 H.", 255, 200, 0)
  outputChatBox("   6- \216\170\216\179\216\170\216\183\217\138\216\185 \216\168\217\138\216\185 \216\167\217\132\217\133\216\173\216\181\217\136\217\132 \217\133\216\168\216\167\216\180\216\177\216\169 \216\163\217\136 \216\185\216\177\216\182\217\135 \217\129\217\138 \216\167\217\132\217\133\216\173\217\132\216\167\216\170 \216\163\217\136 \216\167\217\131\217\132\217\135 \217\136\216\167\217\132\216\167\216\179\216\170\217\129\216\167\216\175\216\169 \217\133\217\134\217\135.", 255, 200, 0)
end)
addEvent("onClientShowJobHelp", true)
addEventHandler("onClientShowJobHelp", localPlayer, function(arg0)
  if arg0 ~= "Farmer" then
    return
  end
  outputChatBox("\216\167\216\170\216\168\216\185 \216\167\217\132\216\174\216\183\217\136\216\167\216\170 \216\167\217\132\216\170\216\167\217\132\217\138\216\169:", 255, 200, 0)
  outputChatBox("   1- \216\167\216\176\217\135\216\168 \216\165\217\132\217\137 \216\167\217\132\217\133\216\178\216\177\216\185\216\169\216\140 \216\167\217\132\217\133\217\134\216\183\217\130\216\169 \216\167\217\132\216\181\217\129\216\177\216\167\216\161 \216\185\217\132\217\137 \216\167\217\132\216\174\216\177\217\138\216\183\216\169.", 255, 200, 0)
  outputChatBox("   2- \217\130\217\133 \216\168\216\180\216\177\216\167\216\161 \216\167\217\132\216\168\216\176\217\136\216\177 \217\133\217\134 \216\167\217\132\216\168\216\167\216\166\216\185 \216\167\217\132\217\133\217\136\216\172\217\136\216\175 \217\129\217\138 \216\167\217\132\217\133\216\178\216\177\216\185\216\169.", 255, 200, 0)
  outputChatBox("   3- \216\167\216\176\217\135\216\168 \216\165\217\132\217\137 \217\133\217\134\216\183\217\130\216\169 \216\167\217\132\216\178\216\177\216\167\216\185\216\169 \217\136\216\167\216\179\216\170\216\174\216\175\217\133 \216\167\217\132\216\168\216\176\217\136\216\177 \217\133\217\134 \216\167\217\132\216\173\217\130\217\138\216\168\216\169 \217\132\216\168\216\175\216\163 \216\167\217\132\216\178\216\177\216\167\216\185\216\169.", 255, 200, 0)
  outputChatBox("   4- \216\167\217\134\216\170\216\184\216\177 \216\173\216\170\217\137 \217\134\217\133\217\136 \216\167\217\132\216\178\216\177\216\185 \216\168\216\180\217\131\217\132 \217\131\216\167\217\133\217\132.", 255, 200, 0)
  outputChatBox("   5- \216\167\216\173\216\181\216\175 \216\167\217\132\217\133\216\178\216\177\217\136\216\185 \216\185\217\134 \216\183\216\177\217\138\217\130 \216\167\217\132\217\136\217\130\217\136\217\129 \216\168\216\172\216\167\217\134\216\168 \216\167\217\132\216\178\216\177\216\185\216\169 \217\136\216\167\217\132\216\182\216\186\216\183 \216\185\217\132\217\137 \216\178\216\177 H.", 255, 200, 0)
  outputChatBox("   6- \216\170\216\179\216\170\216\183\217\138\216\185 \216\168\217\138\216\185 \216\167\217\132\217\133\216\173\216\181\217\136\217\132 \217\133\216\168\216\167\216\180\216\177\216\169 \216\163\217\136 \216\185\216\177\216\182\217\135 \217\129\217\138 \216\167\217\132\217\133\216\173\217\132\216\167\216\170 \216\163\217\136 \216\167\217\131\217\132\217\135 \217\136\216\167\217\132\216\167\216\179\216\170\217\129\216\167\216\175\216\169 \217\133\217\134\217\135.", 255, 200, 0)
end)
