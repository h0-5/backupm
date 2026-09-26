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
  UI.window[1] = eui:uiCreateRectangle(false, false, 600, 310, tocolor(15, 15, 15, 240), true, true, true, true)
  eui:uiSetVisible(UI.window[1], false)
  UI.label.Title = eui:uiCreateLabel(15, 15, 232, 20, {
    en = "Your Impounded Vehicles",
    ar = "\217\133\216\177\217\131\216\168\216\167\216\170\217\131 \216\167\217\132\217\133\216\173\216\172\217\136\216\178\216\169"
  }, tocolor(255, 255, 255, 255), "left", "top", UI.window[1])
  eui:uiSetFont(UI.label.Title, "default-large")
  UI.gridlist.vehicles = eui:uiCreateGridList(10, 60, 580, 200, tocolor(10, 10, 10), UI.window[1])
  eui:uiGridListAddColumn(UI.gridlist.vehicles, "Vehicle ID", 0.15)
  eui:uiGridListAddColumn(UI.gridlist.vehicles, "Amount", 0.15)
  eui:uiGridListAddColumn(UI.gridlist.vehicles, "Time", 0.25)
  eui:uiGridListAddColumn(UI.gridlist.vehicles, "By", 0.15)
  eui:uiGridListAddColumn(UI.gridlist.vehicles, "Reason", 0.25)
  UI.button[1] = eui:uiCreateButton(10, 270, 150, 30, {
    en = "Pay Selected Ticket",
    ar = "\216\175\217\129\216\185 \216\167\217\132\216\170\216\176\217\131\216\177\216\169 \216\167\217\132\217\133\216\173\216\175\216\175\216\169"
  }, tocolor(0, 0, 0, 255), UI.window[1])
  UI.button[2] = eui:uiCreateButton(170, 270, 100, 30, {en = "Cancel", ar = "\216\165\217\132\216\186\216\167\216\161"}, tocolor(0, 0, 0, 255), UI.window[1])
end
addEventHandler("onClientUIReady", resourceRoot, UIKitReady)
addEventHandler("onClientUIKitReady", root, UIKitReady)
function closeUIWindows(arg0)
  eui:uiSetVisible(UI.window[1], false)
  showCursor(false)
end
addEvent("onClientPlayerQuitFromCharacter", true)
addEventHandler("onClientPlayerQuitFromCharacter", localPlayer, closeUIWindows)
addEventHandler("onClientPlayerWasted", localPlayer, closeUIWindows)
addEvent("impound:sendImpoundedVehiclesToPlayer", true)
addEventHandler("impound:sendImpoundedVehiclesToPlayer", root, function(arg0)
  eui:uiGridListClear(UI.gridlist.vehicles)
  for forvar4, forvar5 in ipairs(arg0) do
    eui:uiGridListSetItemData(UI.gridlist.vehicles, eui:uiGridListAddRow(UI.gridlist.vehicles), 1, tostring(forvar5.id))
    eui:uiGridListSetItemText(UI.gridlist.vehicles, eui:uiGridListAddRow(UI.gridlist.vehicles), 1, tostring(forvar5.vehicleID))
    eui:uiGridListSetItemText(UI.gridlist.vehicles, eui:uiGridListAddRow(UI.gridlist.vehicles), 2, "$" .. tostring(forvar5.amount))
    eui:uiGridListSetItemText(UI.gridlist.vehicles, eui:uiGridListAddRow(UI.gridlist.vehicles), 3, tostring(forvar5.impoundedAt))
    eui:uiGridListSetItemText(UI.gridlist.vehicles, eui:uiGridListAddRow(UI.gridlist.vehicles), 4, tostring(forvar5.by))
    eui:uiGridListSetItemText(UI.gridlist.vehicles, eui:uiGridListAddRow(UI.gridlist.vehicles), 5, tostring(forvar5.reason))
    eui:uiGridListSetItemColor(UI.gridlist.vehicles, eui:uiGridListAddRow(UI.gridlist.vehicles), 1, tocolor(255, 0, 0))
    eui:uiGridListSetItemColor(UI.gridlist.vehicles, eui:uiGridListAddRow(UI.gridlist.vehicles), 2, tocolor(255, 0, 0))
    eui:uiGridListSetItemColor(UI.gridlist.vehicles, eui:uiGridListAddRow(UI.gridlist.vehicles), 3, tocolor(255, 0, 0))
    eui:uiGridListSetItemColor(UI.gridlist.vehicles, eui:uiGridListAddRow(UI.gridlist.vehicles), 4, tocolor(255, 0, 0))
    eui:uiGridListSetItemColor(UI.gridlist.vehicles, eui:uiGridListAddRow(UI.gridlist.vehicles), 5, tocolor(255, 0, 0))
  end
end)
addEventHandler("onClientUIClick", root, function()
  if source == UI.button[1] then
    if eui:uiGridListGetSelectedItem(UI.gridlist.vehicles) ~= -1 then
      triggerServerEvent("impound:payToUnimpounded", localPlayer, (eui:uiGridListGetItemData(UI.gridlist.vehicles, eui:uiGridListGetSelectedItem(UI.gridlist.vehicles), 1)))
    end
  elseif source == UI.button[2] then
    eui:uiSetVisible(UI.window[1], false)
    showCursor(false)
  end
end)
addEvent("onClientElementMenuClick", true)
addEventHandler("onClientElementMenuClick", root, function(arg0, arg1, arg2)
  if not isElement(arg0) then
    return
  end
  if getElementType(arg0) == "ped" and getElementData(arg0, "ped:interact") == "traffic.impound" and arg1 == "Talk" then
    eui:uiSetVisible(UI.window[1], true)
    showCursor(true)
    triggerServerEvent("impound:getImpoundedVehiclesForPlayer", localPlayer)
  end
end)
addEventHandler("onClientVehicleStartEnter", root, function(arg0)
  if arg0 ~= localPlayer then
    return
  end
  if getElementData(source, "vehicle:impounded") then
    cancelEvent()
  end
end)
