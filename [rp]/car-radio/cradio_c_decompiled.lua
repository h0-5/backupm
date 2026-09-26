-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

UI = {
  edit = {},
  window = {},
  label = {},
  button = {},
  gridlist = {},
  rectangle = {}
}
function UIKitReady()
  eui = exports.UIKit
  var0 = eui:getUIFont("ui-default")
  var1 = 1
  UI.window[2] = eui:uiCreateWindow(false, false, 442, 134, "Create Station")
  eui:uiWindowSetMovable(UI.window[2], false)
  eui:uiSetVisible(UI.window[2], false)
  UI.label[1] = eui:uiCreateLabel(10, 37, 87, 15, "Station name:", tocolor(255, 255, 255), UI.window[2])
  UI.label[2] = eui:uiCreateLabel(10, 66, 87, 15, "Station IP:", tocolor(255, 255, 255), UI.window[2])
  UI.edit[1] = eui:uiCreateEdit(102, 33, 330, 27, "", "", _, UI.window[2])
  UI.edit[2] = eui:uiCreateEdit(102, 60, 330, 27, "", "", _, UI.window[2])
  UI.button[4] = eui:uiCreateButton(10, 97, 82, 31, {en = "Create", ar = "\216\165\217\134\216\180\216\167\216\161"}, tocolor(0, 0, 0), UI.window[2])
  UI.button[5] = eui:uiCreateButton(96, 97, 82, 31, {en = "Remove", ar = "\216\173\216\176\217\129"}, tocolor(0, 0, 0), UI.window[2])
  UI.button[6] = eui:uiCreateButton(182, 97, 82, 31, {
    en = "Move up",
    ar = "\216\170\216\173\216\177\217\138\217\131 \217\132\216\163\216\185\217\132\217\137"
  }, tocolor(0, 0, 0), UI.window[2])
  UI.button[7] = eui:uiCreateButton(268, 97, 82, 31, {
    en = "Move down",
    ar = "\216\170\216\173\216\177\217\138\217\131 \217\132\216\163\216\179\217\129\217\132"
  }, tocolor(0, 0, 0), UI.window[2])
  eui:uiSetProperty(UI.button[6], "Disabled", "True")
  eui:uiSetProperty(UI.button[7], "Disabled", "True")
  UI.button[8] = eui:uiCreateButton(354, 97, 77, 31, {en = "Cancel", ar = "\216\165\217\132\216\186\216\167\216\161"}, tocolor(0, 0, 0), UI.window[2])
  eui:uiSetProperty(UI.button[4], "HoverTextColor", tocolor(255, 55, 95))
  eui:uiSetProperty(UI.button[5], "HoverTextColor", tocolor(255, 48, 48))
  eui:uiSetProperty(UI.button[8], "HoverTextColor", tocolor(255, 48, 48))
end
addEventHandler("onClientUIReady", resourceRoot, UIKitReady)
addEvent("onClientUIKitReady", true)
addEventHandler("onClientUIKitReady", root, UIKitReady)
addEventHandler("onClientUIMenuSelectChange", root, function(arg0, arg1)
  if arg1 and getElementID(source) == "main-menu" and eui:uiMenuGetItemID(source, arg0) == "radio" then
    if not isElement(UI.gridlist[1]) then
      UI.gridlist[1] = eui:uiCreateGridList(10, 60, eui:uiGetSize(arg1) - 20, eui:uiGetSize(arg1) - 120, tocolor(0, 0, 0, 0), arg1)
      eui:uiGridListAddColumn(UI.gridlist[1], "ID", 0.05)
      eui:uiGridListAddColumn(UI.gridlist[1], "Name", 0.3)
      eui:uiGridListAddColumn(UI.gridlist[1], "IP", 0.65)
      eui:uiSetAlign(UI.gridlist[1], "left", "center")
      UI.button[1] = eui:uiCreateButton(5, eui:uiGetSize(arg1) - 40, eui:uiGetSize(arg1) - 10, 35, {
        en = "Create new station (25 coins)",
        ar = "(25 coins) \216\165\216\182\216\167\217\129\216\169 \217\133\216\173\216\183\216\169 \216\172\216\175\217\138\216\175\216\169"
      }, tocolor(0, 0, 0), arg1)
      eui:uiSetProperty(UI.button[1], "HoverTextColor", tocolor(255, 55, 95))
    end
    refreshStationsList(carradio.channels)
    triggerServerEvent("radiostations:onCallRadioStationsDataBase", localPlayer)
  end
end)
addEventHandler("onClientUIClick", root, function()
  if source == UI.button[1] then
    eui:uiSetVisible(UI.window[2], true)
    eui:uiBringToFront(UI.window[2])
    eui:uiSetText(UI.window[2], "Create New Radio Station")
    eui:uiSetText(UI.edit[1], "")
    eui:uiSetText(UI.edit[2], "")
    eui:uiSetVisible(UI.button[4], true)
    eui:uiSetVisible(UI.button[5], false)
    eui:uiSetVisible(UI.button[6], false)
    eui:uiSetVisible(UI.button[7], false)
  elseif source == UI.button[8] then
    eui:uiSetVisible(UI.window[2], false)
  elseif source == UI.button[4] then
    if utfLen((eui:uiGetText(UI.edit[1]))) == 0 then
      exports.notifications:output("Enter the station name", 3000, "error")
      return
    end
    if 1 > utfLen((eui:uiGetText(UI.edit[1]))) then
      exports.notifications:output("The station name is too short", 3000, "error")
      return
    end
    if utfLen((eui:uiGetText(UI.edit[1]))) > 100 then
      exports.notifications:output("The station name is too long", 3000, "error")
      return
    end
    if utfLen((eui:uiGetText(UI.edit[2]))) == 0 then
      exports.notifications:output("Enter the IP of the station", 3000, "error")
      return
    end
    if 5 > utfLen((eui:uiGetText(UI.edit[2]))) then
      exports.notifications:output("The station IP is too short", 3000, "error")
      return
    end
    if utfLen((eui:uiGetText(UI.edit[2]))) > 255 then
      exports.notifications:output("The station IP is too long", 3000, "error")
      return
    end
    triggerServerEvent("radiostations:addRadioStation", localPlayer, eui:uiGetText(UI.edit[1]), (eui:uiGetText(UI.edit[2])))
    eui:uiSetVisible(UI.window[2], false)
  elseif source == UI.button[5] then
    triggerServerEvent("radiostations:removeRadioStation", localPlayer, tonumber((eui:uiGetText(UI.window[2]):gsub("Radio Station #", ""))))
    eui:uiSetVisible(UI.window[2], false)
  end
end)
addEventHandler("onClientUIDoubleClick", root, function()
  if source == UI.gridlist[1] and eui:uiGridListGetSelectedItem(UI.gridlist[1]) ~= -1 and (var0 or eui:uiGridListGetItemData(UI.gridlist[1], eui:uiGridListGetSelectedItem(UI.gridlist[1]), 1) == getElementData(localPlayer, "character:account")) then
    eui:uiSetVisible(UI.window[2], true)
    eui:uiBringToFront(UI.window[2])
    eui:uiSetText(UI.edit[1], (eui:uiGridListGetItemText(UI.gridlist[1], eui:uiGridListGetSelectedItem(UI.gridlist[1]), 2)))
    eui:uiSetText(UI.edit[2], (eui:uiGridListGetItemText(UI.gridlist[1], eui:uiGridListGetSelectedItem(UI.gridlist[1]), 3)))
    eui:uiSetVisible(UI.button[4], false)
    eui:uiSetVisible(UI.button[5], true)
    eui:uiSetVisible(UI.button[6], true)
    eui:uiSetVisible(UI.button[7], true)
    eui:uiSetText(UI.window[2], "Radio Station #" .. tostring((eui:uiGridListGetItemText(UI.gridlist[1], eui:uiGridListGetSelectedItem(UI.gridlist[1]), 1))))
  end
end)
addEvent("radiostations:onSendRadioStationsDataBase", true)
addEventHandler("radiostations:onSendRadioStationsDataBase", root, function(arg0, arg1)
  var0 = arg1
  refreshStationsList(carradio.channels)
end)
function refreshStationsList(arg0)
  eui:uiGridListClear(UI.gridlist[1])
  for forvar5, forvar6 in ipairs(arg0) do
    eui:uiGridListSetItemText(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 1, tostring(forvar6[3]))
    eui:uiGridListSetItemData(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 1, tostring(forvar6[4]))
    eui:uiGridListSetItemText(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 2, tostring(forvar6[1]))
    eui:uiGridListSetItemText(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 3, tostring(forvar6[2]))
    if forvar6[4] == getElementData(localPlayer, "character:account") then
      eui:uiGridListSetItemColor(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 1, tocolor(255, 234, 176, 255))
      eui:uiGridListSetItemColor(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 2, tocolor(255, 234, 176, 255))
      eui:uiGridListSetItemColor(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 3, tocolor(255, 234, 176, 255))
    end
  end
end
setRadioChannel(0)
carradio = {
  channel = 0,
  channels = {
    [0] = {"Radio Off", ""}
  },
  sound = false,
  x = 25 * (guiGetScreenSize() / 1080),
  y = guiGetScreenSize() - 330 * (guiGetScreenSize() / 1080),
  width = 260 * (guiGetScreenSize() / 1080),
  height = 50 * (guiGetScreenSize() / 1080)
}
addEvent("radiostations:sync", true)
addEventHandler("radiostations:sync", localPlayer, function(arg0, arg1)
  if arg1 == 0 then
    for forvar5, forvar6 in ipairs(carradio.channels) do
      if forvar6[3] == arg0.id then
        table.remove(carradio.channels, forvar5)
        break
      end
    end
  elseif arg1 == 1 then
    table.insert(carradio.channels, arg0)
  else
    carradio.channels = arg0
  end
end)
function carradio.render()
  if isPedInVehicle(localPlayer) then
    if not isElement((getPedOccupiedVehicle(localPlayer))) then
      return
    end
    dxDrawImage(carradio.x, carradio.y, carradio.width, carradio.height, var0, 180, 0, 0, tocolor(0, 8, 20, 180))
    dxDrawRectangle(carradio.x - 7 * var1, carradio.y, 1, carradio.height, tocolor(255, 255, 255))
    dxDrawText("#" .. tostring(getElementData(getPedOccupiedVehicle(localPlayer), "vehicle:radio.channel") or 0) .. " - " .. tostring(carradio.channels[getElementData(getPedOccupiedVehicle(localPlayer), "vehicle:radio.channel") or 0] and carradio.channels[getElementData(getPedOccupiedVehicle(localPlayer), "vehicle:radio.channel") or 0][1] or "Radio Off") .. "\n" .. (isElement(carradio.sound) and getSoundMetaTags(carradio.sound).stream_title or ""), carradio.x + 15, carradio.y + 5, carradio.x + carradio.width - 5 - 10, carradio.y + carradio.height - 5, tocolor(255, 255, 255, 255), var2, var3, "left", "top", true, true, false, false, false)
  end
end
addEventHandler("onClientResourceStart", resourceRoot, function()
  if isPedInVehicle(localPlayer) then
    var0 = exports.hud:getBGTexture()
    addEventHandler("onClientRender", root, carradio.render)
    if getVehicleController(getPedOccupiedVehicle(localPlayer)) == localPlayer then
      bindKey("mouse_wheel_up", "down", carradio.togchannel)
      bindKey("mouse_wheel_down", "down", carradio.togchannel)
    end
  end
end)
addEventHandler("onClientVehicleEnter", root, function(arg0, arg1)
  if arg0 == localPlayer and (getVehicleType(source) == "Automobile" or getVehicleType(source) == "Boat" or getVehicleType(source) == "Monster Truck" or getVehicleType(source) == "Quad") then
    if arg1 == 0 or arg1 == 1 then
      bindKey("mouse_wheel_up", "down", carradio.togchannel)
      bindKey("mouse_wheel_down", "down", carradio.togchannel)
    end
    var0 = exports.hud:getBGTexture()
    removeEventHandler("onClientRender", root, carradio.render)
    addEventHandler("onClientRender", root, carradio.render)
    carradio.channel = getElementData(source, "vehicle:radio.channel") or 0
    setChannel(source, carradio.channel)
  end
end)
addEventHandler("onClientVehicleStartExit", root, function(arg0, arg1)
  if arg0 == localPlayer and (getVehicleType(source) == "Automobile" or getVehicleType(source) == "Boat" or getVehicleType(source) == "Monster Truck" or getVehicleType(source) == "Quad") then
    if arg1 == 0 or arg1 == 1 then
      unbindKey("mouse_wheel_up", "down", carradio.togchannel)
      unbindKey("mouse_wheel_down", "down", carradio.togchannel)
    end
    removeEventHandler("onClientRender", root, carradio.render)
    if carradio.sound and isElement(carradio.sound) then
      stopSound(carradio.sound)
    end
  end
end)
addCommandHandler("setvol", function(arg0, arg1)
  if isPedInVehicle(localPlayer) and getVehicleController((getPedOccupiedVehicle(localPlayer))) == localPlayer then
    if not tonumber(arg1) or not (tonumber(arg1) >= 0) or not (tonumber(arg1) <= 1) then
      outputChatBox("SYNTAX: /" .. arg0 .. " [Volume 0-1]", 255, 55, 95)
      return
    end
    if carradio.sound then
      setSoundVolume(carradio.sound, tonumber(arg1))
    end
  end
end, false, false)
function carradio.togchannel(arg0)
  if isPedInVehicle(localPlayer) and not isCursorShowing() then
    if getVehicleEngineState((getPedOccupiedVehicle(localPlayer))) then
      if arg0 == "mouse_wheel_up" then
      else
      end
      if math.min(math.max((getElementData(getPedOccupiedVehicle(localPlayer), "vehicle:radio.channel") or 0) - 1, 0) + 1, #carradio.channels) == (getElementData(getPedOccupiedVehicle(localPlayer), "vehicle:radio.channel") or 0) then
        return
      end
      var0[getPedOccupiedVehicle(localPlayer)] = true
      setChannel(getPedOccupiedVehicle(localPlayer), (math.min(math.max((getElementData(getPedOccupiedVehicle(localPlayer), "vehicle:radio.channel") or 0) - 1, 0) + 1, #carradio.channels)))
    else
      setChannel(getPedOccupiedVehicle(localPlayer), 0)
    end
  end
end
addCommandHandler("offradio", function(arg0)
  if isPedInVehicle(localPlayer) and getVehicleController((getPedOccupiedVehicle(localPlayer))) == localPlayer then
    setChannel(getPedOccupiedVehicle(localPlayer), 0)
  end
end, false, false)
function setChannel(arg0, arg1)
  if carradio.sound and isElement(carradio.sound) then
    stopSound(carradio.sound)
  end
  setElementData(arg0, "vehicle:radio.channel", arg1)
  if tonumber(arg1) and arg1 ~= 0 and carradio.channels[arg1] then
    carradio.sound = playSound(carradio.channels[arg1][2])
  end
end
addEventHandler("onClientElementDataChange", root, function(arg0, arg1)
  if arg0 ~= "vehicle:radio.channel" then
    return
  end
  if getElementType(source) == "vehicle" and isPedInVehicle(localPlayer) and getPedOccupiedVehicle(localPlayer) == source then
    if not var0[source] then
      setChannel(source, getElementData(source, "vehicle:radio.channel") or 0)
    else
      var0[source] = nil
    end
  else
  end
end)
addEventHandler("onClientElementDestroy", root, function()
  if getElementType(source) == "vehicle" then
    if isPedInVehicle(localPlayer) and getPedOccupiedVehicle(localPlayer) == source and carradio.sound and isElement(carradio.sound) then
      stopSound(carradio.sound)
    end
    if var0[source] and isElement(var0[source]) then
      stopSound(var0[source])
      var0[source] = nil
    end
  end
end)
addEventHandler("onClientPlayerRadioSwitch", localPlayer, function()
  cancelEvent()
end)
