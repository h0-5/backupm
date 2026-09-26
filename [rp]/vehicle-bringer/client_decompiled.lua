-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

UI = {
  window = {},
  label = {},
  button = {},
  gridlist = {}
}
function UIKitReady()
  eui = exports.UIKit
  UI.window[1] = eui:uiCreateWindow(false, false, 600, 360, {
    en = "Vehicles Bringer",
    ar = "\216\165\216\173\216\182\216\167\216\177 \216\167\217\132\217\133\216\177\217\131\216\168\216\167\216\170"
  }, _, ":assets/icons/car.png")
  eui:uiSetVisible(UI.window[1], false)
  eui:uiWindowSetMovable(UI.window[1], false)
  UI.button[1] = eui:uiCreateButton(10, 315, 200, 35, {
    en = "Request to bring the vehicle",
    ar = "\216\183\217\132\216\168 \216\165\216\173\216\182\216\167\216\177 \216\167\217\132\217\133\216\177\217\131\216\168\216\169"
  }, "primary", UI.window[1])
  UI.button[2] = eui:uiCreateButton(220, 315, 100, 35, {en = "Cancel", ar = "\216\165\217\132\216\186\216\167\216\161"}, _, UI.window[1])
  UI.gridlist[1] = eui:uiCreateGridList(10, 50, 580, 245, _, UI.window[1])
  eui:uiGridListAddColumn(UI.gridlist[1], "ID", 0.15)
  eui:uiGridListAddColumn(UI.gridlist[1], "Vehicle Name", 0.65)
  eui:uiGridListAddColumn(UI.gridlist[1], "Cost", 0.2)
  eui:uiSetAlign(UI.gridlist[1], "left", "center")
end
addEventHandler("onClientUIReady", resourceRoot, UIKitReady)
addEvent("onClientUIKitReady", true)
addEventHandler("onClientUIKitReady", root, UIKitReady)
function closeUIWindows(arg0)
  eui:uiSetVisible(UI.window[1], false)
  showCursor(false)
end
addEventHandler("onClientPlayerQuitFromCharacter", localPlayer, closeUIWindows)
addEventHandler("onClientPlayerWasted", localPlayer, closeUIWindows)
addEvent("vehbringer:show_list", true)
addEventHandler("vehbringer:show_list", localPlayer, function(arg0, arg1)
  eui:uiSetVisible(UI.window[1], true)
  showCursor(true)
  var0 = arg1
  eui:uiGridListClear(UI.gridlist[1])
  for forvar8, forvar9 in ipairs(arg0) do
    if isElement((getElementByID("Vehicle:" .. tostring(forvar9.ID)))) then
      if getElementData(getElementByID("Vehicle:" .. tostring(forvar9.ID)), "vehicle:impounded") then
      else
      end
    end
    if false then
      eui:uiGridListSetItemText(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 1, tostring(forvar9.ID))
      eui:uiGridListSetItemText(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 2, tostring(forvar9.Name))
      eui:uiGridListSetItemText(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 3, "$" .. math.abs(math.floor((getDistanceBetweenPoints3D(getElementPosition(localPlayer)))) + 1500))
      eui:uiGridListSetItemData(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 3, math.abs(math.floor((getDistanceBetweenPoints3D(getElementPosition(localPlayer)))) + 1500))
      eui:uiGridListSetItemColor(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 3, tocolor(0, 255, 0, 255))
    end
  end
end)
addEventHandler("onClientUIClick", root, function()
  if source == UI.button[1] then
    if eui:uiGridListGetSelectedItem(UI.gridlist[1]) ~= -1 then
      eui:uiSetVisible(UI.window[1], false)
      showCursor(false)
      triggerServerEvent("vehbringer:bring", localPlayer, eui:uiGridListGetItemText(UI.gridlist[1], eui:uiGridListGetSelectedItem(UI.gridlist[1]), 1), var0)
    end
  elseif source == UI.button[2] then
    eui:uiSetVisible(UI.window[1], false)
    showCursor(false)
  end
end)
addEventHandler("onClientPedDamage", resourceRoot, function()
  cancelEvent()
end)
