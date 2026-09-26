-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

for forvar5, forvar6 in ipairs(config.rent_locations) do
  setVehicleColor(createVehicle(481, forvar6.position[1], forvar6.position[2], forvar6.position[3], 0, 0, forvar6.position[4] or 0), 255, 55, 95)
  setElementAlpha(createVehicle(481, forvar6.position[1], forvar6.position[2], forvar6.position[3], 0, 0, forvar6.position[4] or 0), 200)
  setElementFrozen(createVehicle(481, forvar6.position[1], forvar6.position[2], forvar6.position[3], 0, 0, forvar6.position[4] or 0), true)
  setElementCollisionsEnabled(createVehicle(481, forvar6.position[1], forvar6.position[2], forvar6.position[3], 0, 0, forvar6.position[4] or 0), false)
  ;({})[createMarker(forvar6.position[1], forvar6.position[2], forvar6.position[3] - 0.5 - 0.9, "cylinder", 1.8, 255, 55, 95, 200)] = forvar5
end
addEventHandler("onClientMarkerHit", resourceRoot, function(arg0, arg1)
  if arg0 ~= localPlayer then
    return
  end
  if not arg1 then
    return
  end
  if isPedInVehicle(localPlayer) then
    if var0 and var0.vehicle == getPedOccupiedVehicle(localPlayer) then
      setPedControlState(localPlayer, "handbrake", true)
      eui:uiSetVisible(UI.window[2], true)
      showCursor(true)
      var1 = source
    end
  else
    if not isPedOnGround(localPlayer) then
      return
    end
    if math.abs(getElementPosition(arg0) - getElementPosition(source)) > getMarkerSize(source) * 2 then
      return
    end
    eui:uiSetVisible(UI.window[1], true)
    showCursor(true)
    var1 = source
    refreshList()
  end
end)
UI = {
  window = {},
  label = {},
  button = {},
  gridlist = {}
}
function UIKitReady()
  eui = exports.UIKit
  var0 = eui:getUIFont("ui-default")
  UI.window[1] = eui:uiCreateWindow(false, false, 500, 420, {
    en = "Vehicle Rental",
    ar = "\216\167\216\179\216\170\216\166\216\172\216\167\216\177 \216\167\217\132\217\133\216\177\217\131\216\168\216\167\216\170"
  }, _, ":assets/icons/bycicle.png")
  eui:uiSetVisible(UI.window[1], false)
  eui:uiWindowSetMovable(UI.window[1], false)
  eui:uiSetProperty(eui:uiCreateLabel(0, 40, 490, 50, {
    en = [[
		You can rent a vehicle to start your movement around the city faster
		You will be deducted from a bicycle deposit
		Please return the vehicle to the rental locations before the expiry of the period to recover the deposit amount
		If the vehicle is not returned, no refund will be given
	]],
    ar = "\t\t\216\168\216\167\217\133\217\131\216\167\217\134\217\131 \216\167\216\179\216\170\216\166\216\172\216\167\216\177 \217\133\216\177\217\131\216\168\216\169 \217\132\216\168\216\175\216\161 \216\170\216\173\216\177\217\131\216\167\216\170\217\131 \216\168\216\167\217\132\217\133\216\175\217\138\217\134\216\169 \216\168\216\180\217\131\217\132 \216\163\216\179\216\177\216\185 \n\t\t\216\179\217\138\216\170\217\133 \216\174\216\181\217\133 \217\133\217\134\217\131 \217\133\216\168\217\132\216\186 \216\170\216\163\217\133\217\138\217\134 \217\132\217\132\217\133\216\177\217\131\216\168\216\169 \n\t\t\216\167\217\132\216\177\216\172\216\167\216\161 \216\165\216\185\216\167\216\175\216\169 \216\167\217\132\217\133\216\177\217\131\216\168\216\169 \216\165\217\132\217\137 \217\133\217\136\216\167\217\130\216\185 \216\167\217\132\216\167\216\179\216\170\216\166\216\172\216\167\216\177 \217\130\216\168\217\132 \216\167\217\134\216\170\217\135\216\167\216\161 \216\167\217\132\217\133\216\175\216\169 \217\132\216\167\216\179\216\170\216\185\216\167\216\175\216\169 \217\133\216\168\217\132\216\186 \216\167\217\132\216\170\216\167\217\133\217\138\217\134\n\t\t\217\129\217\138 \216\173\216\167\217\132\216\169 \216\185\216\175\217\133 \216\165\216\185\216\167\216\175\216\169 \216\167\217\132\217\133\216\177\217\131\216\168\216\169 \217\132\217\134 \217\138\216\170\217\133 \216\165\216\185\216\167\216\175\216\169 \216\163\217\138 \217\133\216\168\217\132\216\186 \217\133\216\175\217\129\217\136\216\185\n\t"
  }, tocolor(255, 255, 255, 230), "center", "top", UI.window[1]), "color_coded", false)
  eui:uiSetProperty(eui:uiCreateLabel(0, 40, 490, 50, {
    en = [[
		You can rent a vehicle to start your movement around the city faster
		You will be deducted from a bicycle deposit
		Please return the vehicle to the rental locations before the expiry of the period to recover the deposit amount
		If the vehicle is not returned, no refund will be given
	]],
    ar = "\t\t\216\168\216\167\217\133\217\131\216\167\217\134\217\131 \216\167\216\179\216\170\216\166\216\172\216\167\216\177 \217\133\216\177\217\131\216\168\216\169 \217\132\216\168\216\175\216\161 \216\170\216\173\216\177\217\131\216\167\216\170\217\131 \216\168\216\167\217\132\217\133\216\175\217\138\217\134\216\169 \216\168\216\180\217\131\217\132 \216\163\216\179\216\177\216\185 \n\t\t\216\179\217\138\216\170\217\133 \216\174\216\181\217\133 \217\133\217\134\217\131 \217\133\216\168\217\132\216\186 \216\170\216\163\217\133\217\138\217\134 \217\132\217\132\217\133\216\177\217\131\216\168\216\169 \n\t\t\216\167\217\132\216\177\216\172\216\167\216\161 \216\165\216\185\216\167\216\175\216\169 \216\167\217\132\217\133\216\177\217\131\216\168\216\169 \216\165\217\132\217\137 \217\133\217\136\216\167\217\130\216\185 \216\167\217\132\216\167\216\179\216\170\216\166\216\172\216\167\216\177 \217\130\216\168\217\132 \216\167\217\134\216\170\217\135\216\167\216\161 \216\167\217\132\217\133\216\175\216\169 \217\132\216\167\216\179\216\170\216\185\216\167\216\175\216\169 \217\133\216\168\217\132\216\186 \216\167\217\132\216\170\216\167\217\133\217\138\217\134\n\t\t\217\129\217\138 \216\173\216\167\217\132\216\169 \216\185\216\175\217\133 \216\165\216\185\216\167\216\175\216\169 \216\167\217\132\217\133\216\177\217\131\216\168\216\169 \217\132\217\134 \217\138\216\170\217\133 \216\165\216\185\216\167\216\175\216\169 \216\163\217\138 \217\133\216\168\217\132\216\186 \217\133\216\175\217\129\217\136\216\185\n\t"
  }, tocolor(255, 255, 255, 230), "center", "top", UI.window[1]), "word_break", true)
  UI.gridlist[1] = eui:uiCreateGridList(5, 150, 490, 170, tocolor(0, 0, 0, 0), UI.window[1])
  eui:uiGridListAddColumn(UI.gridlist[1], "Vehicle Name", 0.3)
  eui:uiGridListAddColumn(UI.gridlist[1], "Duration", 0.2)
  eui:uiGridListAddColumn(UI.gridlist[1], "Insurance Amount", 0.25)
  eui:uiGridListAddColumn(UI.gridlist[1], "Rent Amount", 0.25)
  eui:uiSetAlign(UI.gridlist[1], "left", "center")
  eui:uiSetProperty(UI.gridlist[1], "row_height", 30)
  UI.button[1] = eui:uiCreateButton(5, 340, 490, 35, {
    en = "Rent now",
    ar = "\216\167\216\179\216\170\216\166\216\172\216\167\216\177 \216\167\217\132\216\162\217\134"
  }, "primary", UI.window[1])
  UI.button[2] = eui:uiCreateButton(5, 380, 490, 35, {
    en = "I don't want to rent",
    ar = "\217\132\216\167 \216\163\216\177\217\138\216\175 \216\167\217\132\216\167\216\179\216\170\216\166\216\172\216\167\216\177"
  }, _, UI.window[1])
  UI.window[2] = eui:uiCreateRectangle(false, false, 300, 150, "bg_default", true, true, true, true)
  eui:uiSetVisible(UI.window[2], false)
  eui:uiSetProperty(eui:uiCreateLabel(0, 10, 300, 60, {
    en = [[
		Do you want to return the bike and get the insurance amount back ?
	]],
    ar = "\t\t\217\135\217\132 \216\170\216\177\216\186\216\168 \216\168\216\165\216\185\216\167\216\175\216\169 \216\167\217\132\217\133\216\177\217\131\216\168\216\169 \217\136\216\167\216\179\216\170\216\185\216\167\216\175\216\169 \217\133\216\168\217\132\216\186 \216\167\217\132\216\170\216\163\217\133\217\138\217\134 \216\159\n\t"
  }, tocolor(255, 255, 255, 230), "center", "center", UI.window[2]), "color_coded", false)
  eui:uiSetProperty(eui:uiCreateLabel(0, 10, 300, 60, {
    en = [[
		Do you want to return the bike and get the insurance amount back ?
	]],
    ar = "\t\t\217\135\217\132 \216\170\216\177\216\186\216\168 \216\168\216\165\216\185\216\167\216\175\216\169 \216\167\217\132\217\133\216\177\217\131\216\168\216\169 \217\136\216\167\216\179\216\170\216\185\216\167\216\175\216\169 \217\133\216\168\217\132\216\186 \216\167\217\132\216\170\216\163\217\133\217\138\217\134 \216\159\n\t"
  }, tocolor(255, 255, 255, 230), "center", "center", UI.window[2]), "word_break", true)
  UI.button[3] = eui:uiCreateButton(5, 70, 290, 35, {
    en = "Yes, I want to return it",
    ar = "\217\134\216\185\217\133\216\140 \216\163\216\177\217\138\216\175 \216\165\216\185\216\167\216\175\216\170\217\135\216\167"
  }, "primary", UI.window[2])
  UI.button[4] = eui:uiCreateButton(5, 110, 290, 35, {en = "No", ar = "\217\132\216\167"}, _, UI.window[2])
  UI.window[3] = eui:uiCreateWindow(false, false, 650, 520, {
    en = "Vehicle Rental",
    ar = "\216\167\216\179\216\170\216\166\216\172\216\167\216\177 \216\167\217\132\217\133\216\177\217\131\216\168\216\167\216\170"
  }, _, ":assets/icons/car.png")
  eui:uiSetVisible(UI.window[3], false)
  eui:uiWindowSetMovable(UI.window[3], false)
  UI.gridlist[2] = eui:uiCreateGridList(10, 150, 630, 300, tocolor(0, 0, 0, 0), UI.window[3])
  eui:uiGridListAddColumn(UI.gridlist[2], "Vehicle Name", 0.5)
  eui:uiGridListAddColumn(UI.gridlist[2], "Insurance Amount", 0.25)
  eui:uiGridListAddColumn(UI.gridlist[2], "Rent Amount per Hour", 0.25)
  eui:uiSetAlign(UI.gridlist[2], "left", "center")
  eui:uiSetProperty(UI.gridlist[2], "row_height", 25)
end
addEventHandler("onClientUIReady", resourceRoot, UIKitReady)
addEvent("onClientUIKitReady", true)
addEventHandler("onClientUIKitReady", root, UIKitReady)
function closeUIWindows(arg0)
  eui:uiSetVisible(UI.window[1], false)
  eui:uiSetVisible(UI.window[2], false)
  eui:uiSetVisible(UI.window[3], false)
  showCursor(false)
end
addEventHandler("onClientPlayerQuitFromCharacter", localPlayer, closeUIWindows)
addEventHandler("onClientPlayerWasted", localPlayer, closeUIWindows)
function refreshList()
  eui:uiGridListClear(UI.gridlist[1])
  if var0 and config.rent_locations[var1[var0]] then
    for forvar3, forvar4 in ipairs(config.vehicles_list[config.rent_locations[var1[var0]].vlist] or {}) do
      eui:uiGridListSetItemData(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 1, forvar3)
      eui:uiGridListSetItemText(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 1, forvar4.name)
      eui:uiGridListSetItemText(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 2, forvar4.duration .. " min")
      eui:uiGridListSetItemText(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 3, "$" .. forvar4.insurance)
      eui:uiGridListSetItemText(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 4, "$" .. forvar4.price)
      eui:uiGridListSetItemColor(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 3, tocolor(0, 255, 0))
      eui:uiGridListSetItemColor(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 4, tocolor(0, 255, 0))
    end
  end
end
addEventHandler("onClientUIClick", root, function()
  if source == UI.button[1] then
    if eui:uiGridListGetSelectedItem(UI.gridlist[1]) ~= -1 then
      eui:uiSetVisible(UI.window[1], false)
      showCursor(false)
      triggerServerEvent("vehrent:rent", localPlayer, eui:uiGridListGetItemData(UI.gridlist[1], eui:uiGridListGetSelectedItem(UI.gridlist[1]), 1), {
        getElementPosition(localPlayer) + 50,
        getElementPosition(localPlayer) - 20,
        getElementPosition(localPlayer) + 5
      }, var0[var1])
    end
  elseif source == UI.button[2] then
    eui:uiSetVisible(UI.window[1], false)
    showCursor(false)
  elseif source == UI.button[3] then
    eui:uiSetVisible(UI.window[2], false)
    showCursor(false)
    triggerServerEvent("vehrent:return", localPlayer)
  elseif source == UI.button[4] then
    eui:uiSetVisible(UI.window[2], false)
    showCursor(false)
  end
end)
addEvent("vehrent:rentedVehicle:sync", true)
addEventHandler("vehrent:rentedVehicle:sync", localPlayer, function(arg0, arg1)
  var0 = {
    vehicle = arg0,
    remainTime = arg1,
    tick = getTickCount()
  }
  addEventHandler("onClientRender", root, drawTimeLeft)
end)
function drawTimeLeft()
  if var0 then
    dxDrawText(convertTimeToString((var1(var0.remainTime - (getTickCount() - var0.tick) / 1000))) .. " :\216\167\217\132\217\136\217\130\216\170 \216\167\217\132\217\133\216\170\216\168\217\130\217\138 \217\132\216\167\217\134\216\170\217\135\216\167\216\161 \217\133\216\175\216\169 \216\167\217\132\216\167\216\179\216\170\216\166\216\172\216\167\216\177", var2 - 200, 500, var2 - 10, 520, _, 1, var3, "right", "top")
  end
end
addEventHandler("onClientVehicleStartEnter", resourceRoot, function(arg0, arg1, arg2)
  if arg0 == localPlayer and arg1 == 0 and (not var0 or source ~= var0.vehicle) then
    if wasEventCancelled() then
      return
    end
    exports.notifications:output({
      en = "This bike is not for you",
      ar = "\217\135\216\176\217\135 \216\167\217\132\216\175\216\177\216\167\216\172\216\169 \217\132\217\138\216\179\216\170 \217\132\217\131"
    }, 3000, "error")
    cancelEvent()
  end
end, _, "low-5")
addEventHandler("onClientElementDestroy", resourceRoot, function()
  if var0 and source == var0.vehicle then
    var0 = false
    removeEventHandler("onClientRender", root, drawTimeLeft)
  end
end)
addEventHandler("onClientPlayerQuitFromCharacter", localPlayer, function()
  if var0 then
    var0 = false
    removeEventHandler("onClientRender", root, drawTimeLeft)
  end
end)
addEvent("vehrent:show_rent_panel", true)
addEventHandler("vehrent:show_rent_panel", root, function(arg0)
  eui:uiSetVisible(UI.window[3], true)
  showCursor(true)
  eui:uiGridListClear(UI.gridlist[2])
  for forvar4, forvar5 in ipairs(arg0) do
    eui:uiGridListSetItemText(UI.gridlist[2], eui:uiGridListAddRow(UI.gridlist[2]), 1, tostring(forvar5.Name))
  end
end)
function convertTimeToString(arg0)
  arg0 = tonumber(arg0)
  if var0(arg0 % (24 * (60 * 60)) / (60 * 60)) == 0 then
    if var0(arg0 % (24 * (60 * 60)) % (60 * 60) / 60) == 0 then
      return var1(arg0 % (24 * (60 * 60)) % (60 * 60) % 60) .. "s"
    else
      return var0(arg0 % (24 * (60 * 60)) % (60 * 60) / 60) .. "m " .. var1(arg0 % (24 * (60 * 60)) % (60 * 60) % 60) .. "s"
    end
  else
    return var0(arg0 % (24 * (60 * 60)) / (60 * 60)) .. "h " .. var0(arg0 % (24 * (60 * 60)) % (60 * 60) / 60) .. "m"
  end
end
