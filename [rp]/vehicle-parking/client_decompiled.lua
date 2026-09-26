-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

UI = {
  window = {},
  label = {},
  button = {},
  gridlist = {},
  image = {}
}
function UIKitReady()
  eui = exports.UIKit
  UI.window[1] = eui:uiCreateRectangle(false, false, 400, 500, tocolor(15, 15, 15, 240), true, true, true, true)
  eui:uiSetVisible(UI.window[1], false)
  eui:uiCreateImage(10, 10, 64, 64, "parking-area.png", UI.window[1])
  UI.label.Title = eui:uiCreateLabel(90, 10, 100, 20, {
    en = "Parking Area",
    ar = "\217\133\217\136\217\130\217\129 \216\179\217\138\216\167\216\177\216\167\216\170"
  }, tocolor(255, 255, 255, 255), "left", "top", UI.window[1])
  eui:uiSetFont(UI.label.Title, "default-large")
  eui:uiSetProperty(eui:uiCreateLabel(90, 35, 300, 20, {
    en = "Park your car in the parking lot to be safe from theft and damage",
    ar = "\216\163\217\136\217\130\217\129 \216\179\217\138\216\167\216\177\216\170\217\131 \217\129\217\138 \216\167\217\132\217\133\217\136\216\167\217\130\217\129 \217\132\216\170\217\131\217\136\217\134 \217\129\217\138 \216\163\217\133\216\167\217\134 \217\133\217\134 \216\167\217\132\216\179\216\177\217\130\216\169 \217\136\216\167\217\132\216\182\216\177\216\177"
  }, tocolor(255, 255, 255, 150), "left", "top", UI.window[1]), "color_coded", false)
  eui:uiSetProperty(eui:uiCreateLabel(90, 35, 300, 20, {
    en = "Park your car in the parking lot to be safe from theft and damage",
    ar = "\216\163\217\136\217\130\217\129 \216\179\217\138\216\167\216\177\216\170\217\131 \217\129\217\138 \216\167\217\132\217\133\217\136\216\167\217\130\217\129 \217\132\216\170\217\131\217\136\217\134 \217\129\217\138 \216\163\217\133\216\167\217\134 \217\133\217\134 \216\167\217\132\216\179\216\177\217\130\216\169 \217\136\216\167\217\132\216\182\216\177\216\177"
  }, tocolor(255, 255, 255, 150), "left", "top", UI.window[1]), "word_break", true)
  eui:uiCreateRectangle(1, 85, 396, 10, tocolor(41, 71, 204, 240), false, false, false, false, UI.window[1])
  eui:uiCreateRectangle(1, 475, 396, 10, tocolor(41, 71, 204, 240), false, false, false, false, UI.window[1])
  UI.gridlist[1] = eui:uiCreateGridList(10, 105, 380, 280, tocolor(10, 10, 10, 0), UI.window[1])
  eui:uiGridListAddColumn(UI.gridlist[1], "ID", 0.15)
  eui:uiGridListAddColumn(UI.gridlist[1], "Vehicle Name", 0.65)
  eui:uiSetAlign(UI.gridlist[1], "left", "center")
  eui:uiSetProperty(UI.gridlist[1], "row_height", 25)
  UI.button[1] = eui:uiCreateButton(10, 390, 380, 35, {
    en = "Get the car out of the parking lot",
    ar = "\216\165\216\174\216\177\216\167\216\172 \216\167\217\132\216\179\217\138\216\167\216\177\216\169 \217\133\217\134 \216\167\217\132\217\133\217\136\217\130\217\129"
  }, tocolor(24, 47, 150, 255), UI.window[1])
  UI.button[2] = eui:uiCreateButton(10, 430, 380, 35, {en = "Cancel", ar = "\216\165\217\132\216\186\216\167\216\161"}, tocolor(10, 10, 10, 255), UI.window[1])
  UI.window[2] = eui:uiCreateRectangle(false, false, 400, 185, tocolor(15, 15, 15, 240), true, true, true, true)
  eui:uiSetVisible(UI.window[2], false)
  eui:uiCreateImage(10, 10, 64, 64, "parking-area.png", UI.window[2])
  UI.label.Title = eui:uiCreateLabel(90, 10, 100, 20, {
    en = "Parking Area",
    ar = "\217\133\217\136\217\130\217\129 \216\179\217\138\216\167\216\177\216\167\216\170"
  }, tocolor(255, 255, 255, 255), "left", "top", UI.window[2])
  eui:uiSetFont(UI.label.Title, "default-large")
  eui:uiSetProperty(eui:uiCreateLabel(90, 35, 300, 20, {
    en = "Park your car in the parking lot to be safe from theft and damage",
    ar = "\216\163\217\136\217\130\217\129 \216\179\217\138\216\167\216\177\216\170\217\131 \217\129\217\138 \216\167\217\132\217\133\217\136\216\167\217\130\217\129 \217\132\216\170\217\131\217\136\217\134 \217\129\217\138 \216\163\217\133\216\167\217\134 \217\133\217\134 \216\167\217\132\216\179\216\177\217\130\216\169 \217\136\216\167\217\132\216\182\216\177\216\177"
  }, tocolor(255, 255, 255, 150), "left", "top", UI.window[2]), "color_coded", false)
  eui:uiSetProperty(eui:uiCreateLabel(90, 35, 300, 20, {
    en = "Park your car in the parking lot to be safe from theft and damage",
    ar = "\216\163\217\136\217\130\217\129 \216\179\217\138\216\167\216\177\216\170\217\131 \217\129\217\138 \216\167\217\132\217\133\217\136\216\167\217\130\217\129 \217\132\216\170\217\131\217\136\217\134 \217\129\217\138 \216\163\217\133\216\167\217\134 \217\133\217\134 \216\167\217\132\216\179\216\177\217\130\216\169 \217\136\216\167\217\132\216\182\216\177\216\177"
  }, tocolor(255, 255, 255, 150), "left", "top", UI.window[2]), "word_break", true)
  UI.button[3] = eui:uiCreateButton(10, 100, 380, 35, {
    en = "Park the car in this parking",
    ar = "\216\165\217\138\217\130\216\167\217\129 \216\167\217\132\216\179\217\138\216\167\216\177\216\169 \217\129\217\138 \217\135\216\176\216\167 \216\167\217\132\217\133\217\136\217\130\217\129"
  }, tocolor(24, 47, 150, 255), UI.window[2])
  UI.button[4] = eui:uiCreateButton(10, 140, 380, 35, {en = "Cancel", ar = "\216\165\217\132\216\186\216\167\216\161"}, tocolor(10, 10, 10, 255), UI.window[2])
end
addEventHandler("onClientUIReady", resourceRoot, UIKitReady)
addEvent("onClientUIKitReady", true)
addEventHandler("onClientUIKitReady", root, UIKitReady)
function closeUIWindows(arg0)
  eui:uiSetVisible(UI.window[1], false)
  eui:uiSetVisible(UI.window[2], false)
  showCursor(false)
end
addEventHandler("onClientPlayerQuitFromCharacter", localPlayer, closeUIWindows)
addEventHandler("onClientPlayerWasted", localPlayer, closeUIWindows)
addEventHandler("onClientUIClick", root, function()
  if source == UI.button[1] then
    if eui:uiGridListGetSelectedItem(UI.gridlist[1]) ~= -1 then
      eui:uiSetVisible(UI.window[1], false)
      showCursor(false)
      triggerServerEvent("vehparking:getOut", localPlayer, eui:uiGridListGetItemText(UI.gridlist[1], eui:uiGridListGetSelectedItem(UI.gridlist[1]), 1), var0)
    end
  elseif source == UI.button[2] then
    eui:uiSetVisible(UI.window[1], false)
    showCursor(false)
  elseif source == UI.button[3] then
    eui:uiSetVisible(UI.window[2], false)
    showCursor(false)
    if var0 then
      triggerServerEvent("vehparking:park", localPlayer, var0)
    end
  elseif source == UI.button[4] then
    eui:uiSetVisible(UI.window[2], false)
    showCursor(false)
  end
end)
addEvent("vehparking:showParking", true)
addEventHandler("vehparking:showParking", localPlayer, function(arg0)
  var0 = arg0
  eui:uiSetVisible(UI.window[2], true)
  showCursor(true)
end)
addEvent("vehparking:showList", true)
addEventHandler("vehparking:showList", localPlayer, function(arg0, arg1)
  var0 = arg1
  eui:uiSetVisible(UI.window[1], true)
  showCursor(true)
  eui:uiGridListClear(UI.gridlist[1])
  for forvar5, forvar6 in ipairs(arg0) do
    eui:uiGridListSetItemText(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 1, tostring(forvar6.ID))
    eui:uiGridListSetItemText(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 2, tostring(forvar6.Name))
    eui:uiGridListSetItemColor(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 1, tocolor(255, 234, 176, 255))
    eui:uiGridListSetItemColor(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 2, tocolor(255, 234, 176, 255))
  end
end)
addEventHandler("onClientRender", root, function()
  for forvar6, forvar7 in pairs(getElementsByType("marker", resourceRoot, true)) do
    if getDistanceBetweenPoints3D(getElementPosition(forvar7)) <= 50 then
      dxDrawMaterialLine3D(getElementPosition(forvar7) + var0, getElementPosition(forvar7) + var0, getElementPosition(forvar7) + 2, getElementPosition(forvar7) - var0, getElementPosition(forvar7) - var0, getElementPosition(forvar7) + 1.2, var1, 0.85, tocolor(255, 255, 255, 255))
    end
  end
end)
