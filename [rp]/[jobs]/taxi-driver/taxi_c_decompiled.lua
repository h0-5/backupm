-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

function dxDrawEmptyLine(arg0, arg1, arg2, arg3, arg4, arg5, arg6)
  dxDrawLine(arg0, arg1, arg0 + arg2, arg1, arg4, arg5, arg6)
  dxDrawLine(arg0, arg1, arg0, arg1 + arg3, arg4, arg5, arg6)
  dxDrawLine(arg0, arg1 + arg3, arg0 + arg2, arg1 + arg3, arg4, arg5, arg6)
  dxDrawLine(arg0 + arg2, arg1, arg0 + arg2, arg1 + arg3, arg4, arg5, arg6)
end
function isMouseInPosition(arg0, arg1, arg2, arg3)
  if isCursorShowing() and arg0 <= getCursorPosition() * var0 and arg1 <= getCursorPosition() * var1 and getCursorPosition() * var0 <= arg0 + arg2 and getCursorPosition() * var1 <= arg1 + arg3 then
    return true
  end
end
function dxDrawInfo(arg0, arg1, arg2, arg3, arg4)
  if isMouseInPosition(arg1, arg2, arg3, arg4) then
    dxDrawRectangle(math.min(getCursorPosition() * var0, var0 - (dxGetTextWidth(arg0, 1, "default") + 10)), getCursorPosition() * var1 - (dxGetFontHeight(1, "default") * #split(arg0, "\n") + 10), dxGetTextWidth(arg0, 1, "default") + 10, dxGetFontHeight(1, "default") * #split(arg0, "\n") + 10, tocolor(0, 0, 0, 255), true)
    dxDrawLine(math.min(getCursorPosition() * var0, var0 - (dxGetTextWidth(arg0, 1, "default") + 10)), getCursorPosition() * var1, math.min(getCursorPosition() * var0, var0 - (dxGetTextWidth(arg0, 1, "default") + 10)) + (dxGetTextWidth(arg0, 1, "default") + 10), getCursorPosition() * var1, tocolor(255, 55, 95, 255), 2, true)
    dxDrawText(arg0, math.min(getCursorPosition() * var0, var0 - (dxGetTextWidth(arg0, 1, "default") + 10)), getCursorPosition() * var1 - (dxGetFontHeight(1, "default") * #split(arg0, "\n") + 10), math.min(getCursorPosition() * var0, var0 - (dxGetTextWidth(arg0, 1, "default") + 10)) + (dxGetTextWidth(arg0, 1, "default") + 10), getCursorPosition() * var1, tocolor(255, 255, 255, 255), 1, "default", "center", "center", false, false, true, false, false)
  end
end
function drawTaxiMeter()
  if not isPedInVehicle(localPlayer) then
    removeEventHandler("onClientPreRender", root, drawTaxiMeter)
    removeEventHandler("onClientClick", root, clickMeterBtn)
    return
  end
  dxDrawRectangle(unpack({
    (var0 - 300) / 2,
    var1 - 130 - 10,
    300,
    130
  }))
  dxDrawEmptyLine(unpack({
    (var0 - 300) / 2,
    var1 - 130 - 10,
    300,
    130
  }))
  dxDrawEmptyLine(unpack({
    (var0 - 300) / 2,
    var1 - 130 - 10,
    300,
    130
  }) + 5, unpack({
    (var0 - 300) / 2,
    var1 - 130 - 10,
    300,
    130
  }) + 5, unpack({
    (var0 - 300) / 2,
    var1 - 130 - 10,
    300,
    130
  }) - 10, unpack({
    (var0 - 300) / 2,
    var1 - 130 - 10,
    300,
    130
  }) - 45, tocolor(255, 255, 255, 180), 2, false)
  dxDrawText("$" .. tostring((math.floor(0 * tonumber(unpack(getElementData(getPedOccupiedVehicle(localPlayer), "taxi.meter") or {
    0,
    getTickCount(),
    "stopped",
    10
  }))))), unpack({
    (var0 - 300) / 2,
    var1 - 130 - 10,
    300,
    130
  }) + 5, unpack({
    (var0 - 300) / 2,
    var1 - 130 - 10,
    300,
    130
  }) + 5, unpack({
    (var0 - 300) / 2,
    var1 - 130 - 10,
    300,
    130
  }) + 5 + unpack({
    (var0 - 300) / 2,
    var1 - 130 - 10,
    300,
    130
  }) - 10, unpack({
    (var0 - 300) / 2,
    var1 - 130 - 10,
    300,
    130
  }) + 5 + unpack({
    (var0 - 300) / 2,
    var1 - 130 - 10,
    300,
    130
  }) - 45 - 10, tocolor(255, 255, 255, 180), 3, "default", "center", "center", false, false, false, false, false)
  dxDrawText(tostring(unpack(getElementData(getPedOccupiedVehicle(localPlayer), "taxi.meter") or {
    0,
    getTickCount(),
    "stopped",
    10
  })) .. "$/km", unpack({
    (var0 - 300) / 2,
    var1 - 130 - 10,
    300,
    130
  }) + 5, unpack({
    (var0 - 300) / 2,
    var1 - 130 - 10,
    300,
    130
  }) + 5 + unpack({
    (var0 - 300) / 2,
    var1 - 130 - 10,
    300,
    130
  }) - 45 - 20, unpack({
    (var0 - 300) / 2,
    var1 - 130 - 10,
    300,
    130
  }) + 5 + unpack({
    (var0 - 300) / 2,
    var1 - 130 - 10,
    300,
    130
  }) - 10, unpack({
    (var0 - 300) / 2,
    var1 - 130 - 10,
    300,
    130
  }) + 5 + unpack({
    (var0 - 300) / 2,
    var1 - 130 - 10,
    300,
    130
  }) - 45, tocolor(255, 255, 255, 230), 1, "default-bold", "center", "center", false, false, false, false, false)
  var2 = 0
  for forvar15 = 1, 4 do
    if not isMouseInPosition(unpack({
      (var0 - 300) / 2,
      var1 - 130 - 10,
      300,
      130
    }) + unpack({
      (var0 - 300) / 2,
      var1 - 130 - 10,
      300,
      130
    }) - 30 * forvar15, unpack({
      (var0 - 300) / 2,
      var1 - 130 - 10,
      300,
      130
    }) + unpack({
      (var0 - 300) / 2,
      var1 - 130 - 10,
      300,
      130
    }) - 30, 25, 25) or not var3[forvar15][2] then
    end
    dxDrawRectangle(unpack({
      (var0 - 300) / 2,
      var1 - 130 - 10,
      300,
      130
    }) + unpack({
      (var0 - 300) / 2,
      var1 - 130 - 10,
      300,
      130
    }) - 30 * forvar15, unpack({
      (var0 - 300) / 2,
      var1 - 130 - 10,
      300,
      130
    }) + unpack({
      (var0 - 300) / 2,
      var1 - 130 - 10,
      300,
      130
    }) - 30, 25, 25, tocolor(150, 150, 150, 240), false)
    dxDrawEmptyLine(unpack({
      (var0 - 300) / 2,
      var1 - 130 - 10,
      300,
      130
    }) + unpack({
      (var0 - 300) / 2,
      var1 - 130 - 10,
      300,
      130
    }) - 30 * forvar15, unpack({
      (var0 - 300) / 2,
      var1 - 130 - 10,
      300,
      130
    }) + unpack({
      (var0 - 300) / 2,
      var1 - 130 - 10,
      300,
      130
    }) - 30, 25, 25, tocolor(150, 150, 150, 240), 2, false)
    dxDrawInfo(var3[forvar15][1], unpack({
      (var0 - 300) / 2,
      var1 - 130 - 10,
      300,
      130
    }) + unpack({
      (var0 - 300) / 2,
      var1 - 130 - 10,
      300,
      130
    }) - 30 * forvar15, unpack({
      (var0 - 300) / 2,
      var1 - 130 - 10,
      300,
      130
    }) + unpack({
      (var0 - 300) / 2,
      var1 - 130 - 10,
      300,
      130
    }) - 30, 25, 25)
    if isMouseInPosition(unpack({
      (var0 - 300) / 2,
      var1 - 130 - 10,
      300,
      130
    }) + unpack({
      (var0 - 300) / 2,
      var1 - 130 - 10,
      300,
      130
    }) - 30 * forvar15, unpack({
      (var0 - 300) / 2,
      var1 - 130 - 10,
      300,
      130
    }) + unpack({
      (var0 - 300) / 2,
      var1 - 130 - 10,
      300,
      130
    }) - 30, 25, 25) then
      var2 = forvar15
    end
  end
  if unpack(getElementData(getPedOccupiedVehicle(localPlayer), "taxi.meter") or {
    0,
    getTickCount(),
    "stopped",
    10
  }) == "started" then
  end
  dxDrawText("Distance (km/h)\n" .. tostring(tostring(0):sub(1, 9) or "000000"), unpack({
    (var0 - 300) / 2,
    var1 - 130 - 10,
    300,
    130
  }))
  dxDrawText("Time\n" .. msToTimeStr((getTickCount() - unpack(getElementData(getPedOccupiedVehicle(localPlayer), "taxi.meter") or {
    0,
    getTickCount(),
    "stopped",
    10
  })) / 1000), unpack({
    (var0 - 300) / 2,
    var1 - 130 - 10,
    300,
    130
  }) + 105, unpack({
    (var0 - 300) / 2,
    var1 - 130 - 10,
    300,
    130
  }) + unpack({
    (var0 - 300) / 2,
    var1 - 130 - 10,
    300,
    130
  }) - 30 - 2, unpack({
    (var0 - 300) / 2,
    var1 - 130 - 10,
    300,
    130
  }) + unpack({
    (var0 - 300) / 2,
    var1 - 130 - 10,
    300,
    130
  }) - 60 - 60 - 4, unpack({
    (var0 - 300) / 2,
    var1 - 130 - 10,
    300,
    130
  }) + unpack({
    (var0 - 300) / 2,
    var1 - 130 - 10,
    300,
    130
  }) - 30 + 25 + 2, tocolor(255, 255, 255, 230), 1, "default-bold", "center", "center", false, false, false, false, false)
end
function msToTimeStr(arg0)
  arg0 = tonumber(arg0)
  arg0 = math.floor(arg0)
  if not arg0 then
    return ""
  end
  if arg0 < 0 then
    return "00", "00", "00"
  end
  if #tostring(math.fmod(arg0, 60)) == 1 then
  end
  if #tostring(math.fmod(math.floor(arg0 / 60), 60)) == 1 then
  end
  if #tostring(math.floor(arg0 / 3600)) == 1 then
  end
  return ("0" .. tostring(math.fmod(math.floor(arg0 / 60), 60))) .. ":" .. "0" .. tostring(math.fmod(arg0, 60))
end
addEventHandler("onClientVehicleStartEnter", root, function(arg0, arg1)
  if arg0 ~= localPlayer then
    return
  end
  if getElementModel(source) == 420 and arg1 == 0 and getElementData(localPlayer, "job") ~= "Taxi Driver" then
    cancelEvent()
  end
end)
addEventHandler("onClientVehicleEnter", root, function(arg0, arg1)
  if arg0 == localPlayer and getElementModel(source) == 420 then
    if not getElementData(source, "taxi.meter") then
      setElementData(source, "taxi.meter", {
        getElementData(source, "vehicle:total.distance") or 0,
        getTickCount(),
        "stopped",
        10
      })
    end
    removeEventHandler("onClientPreRender", root, drawTaxiMeter)
    addEventHandler("onClientPreRender", root, drawTaxiMeter)
    addEventHandler("onClientClick", root, clickMeterBtn)
  end
end)
addEventHandler("onClientVehicleStartExit", root, function(arg0, arg1)
  if arg0 == localPlayer and getElementModel(source) == 420 then
    removeEventHandler("onClientPreRender", root, drawTaxiMeter)
    removeEventHandler("onClientClick", root, clickMeterBtn)
  end
end)
function clickMeterBtn(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7)
  if arg0 == "left" and arg1 == "up" and var0 ~= 0 then
    if getPedOccupiedVehicleSeat(localPlayer) ~= 0 then
      return
    end
    if getElementData(localPlayer, "job") ~= "Taxi Driver" then
      return
    end
    if var1[var0][1] == "Reset" then
      setElementData(getPedOccupiedVehicle(localPlayer), "taxi.meter", {
        getElementData(getPedOccupiedVehicle(localPlayer), "vehicle:total.distance") or 0,
        getTickCount(),
        "stopped",
        unpack(getElementData(getPedOccupiedVehicle(localPlayer), "taxi.meter"))
      })
    elseif var1[var0][1] == "Start/Pause" then
      setElementData(getPedOccupiedVehicle(localPlayer), "taxi.meter", {
        getElementData(getPedOccupiedVehicle(localPlayer), "vehicle:total.distance") or 0,
        getTickCount(),
        "started",
        unpack(getElementData(getPedOccupiedVehicle(localPlayer), "taxi.meter"))
      })
    elseif var1[var0][1] == "Light" then
      triggerServerEvent("taxi:setLight", localPlayer, (getPedOccupiedVehicle(localPlayer)))
    elseif var1[var0][1] == "Set Fare" then
      guiSetVisible(GUIEditor.window[1], true)
      currentVehicle = getPedOccupiedVehicle(localPlayer)
    end
  end
end
GUIEditor = {
  button = {},
  window = {},
  radiobutton = {}
}
addEventHandler("onClientResourceStart", resourceRoot, function()
  GUIEditor.window[1] = guiCreateWindow((var0 - 219) / 2, (var1 - 167) / 2, 219, 167, "Set fare", false)
  guiWindowSetSizable(GUIEditor.window[1], false)
  guiSetVisible(GUIEditor.window[1], false)
  GUIEditor.radiobutton[1] = guiCreateRadioButton(10, 30, 117, 15, "10$ /km", false, GUIEditor.window[1])
  GUIEditor.radiobutton[2] = guiCreateRadioButton(10, 50, 117, 15, "15$ /km", false, GUIEditor.window[1])
  GUIEditor.radiobutton[3] = guiCreateRadioButton(10, 70, 117, 15, "30$ /km", false, GUIEditor.window[1])
  GUIEditor.radiobutton[4] = guiCreateRadioButton(10, 90, 117, 15, "35$ /km", false, GUIEditor.window[1])
  GUIEditor.button[1] = guiCreateButton(62, 127, 95, 30, "Save", false, GUIEditor.window[1])
end)
addEventHandler("onClientGUIClick", resourceRoot, function()
  if source == GUIEditor.button[1] then
    for forvar3, forvar4 in ipairs(GUIEditor.radiobutton) do
      if guiRadioButtonGetSelected(forvar4) then
        setElementData(currentVehicle, "taxi.meter", {
          unpack(getElementData(currentVehicle, "taxi.meter"))
        })
        break
      end
    end
    guiSetVisible(GUIEditor.window[1], false)
  end
end)
addEvent("phone:app:request", true)
addEventHandler("phone:app:request", localPlayer, function(arg0, arg1, arg2, arg3, arg4, arg5)
  if arg0 == "taxi" then
    if not isElement(var0.screen["taxi:main"]) then
      eui = exports.UIKit
      var0.screen["taxi:main"] = eui:uiCreateContainer(arg2, arg3, arg4, arg5, arg1)
      var0.label.Title = eui:uiCreateLabel(15, 40, 200, 20, {en = "TAXI", ar = "TAXI"}, tocolor(255, 220, 0, 255), "left", "top", var0.screen["taxi:main"])
      eui:uiSetFont(var0.label.Title, "default-large")
      eui:uiCreateRectangle(0, 80, arg4, 1, tocolor(255, 255, 255, 25), false, false, false, false, var0.screen["taxi:main"])
      eui:uiCreateImage((arg4 - arg4 / 2) / 2, 120, arg4 / 2, arg4 / 2, "images/pin.png", var0.screen["taxi:main"])
      var0.label["taxi:note"] = eui:uiCreateLabel(15, 300, arg4 - 30, 100, "", tocolor(255, 220, 0, 255), "center", "top", var0.screen["taxi:main"])
      var0.button["taxi:request"] = eui:uiCreateButton(10, arg5 - 70, arg4 - 20, 35, {
        en = "Request Taxi",
        ar = "\216\183\217\132\216\168 \216\170\216\167\217\131\216\179\217\138"
      }, tocolor(255, 220, 0, 255), var0.screen["taxi:main"])
      eui:uiSetProperty(var0.button["taxi:request"], "TextColor", tocolor(0, 0, 0))
      var0.screen["taxi:driver"] = eui:uiCreateContainer(arg2, arg3, arg4, arg5, arg1)
      eui:uiSetVisible(var0.screen["taxi:driver"], false)
      var0.label.Title = eui:uiCreateLabel(30, 40, 200, 20, {
        en = "TAXI | Driver",
        ar = "TAXI | \216\167\217\132\216\179\216\167\216\166\217\130"
      }, tocolor(255, 220, 0, 255), "left", "top", var0.screen["taxi:driver"])
      eui:uiSetFont(var0.label.Title, "default-large")
      eui:uiCreateRectangle(0, 80, arg4, 1, tocolor(255, 255, 255, 25), false, false, false, false, var0.screen["taxi:driver"])
      var0.gridlist.taxi_requests = eui:uiCreateGridList(15, 130, arg4 - 30, arg5 - 250, tocolor(0, 0, 0, 0), var0.screen["taxi:driver"])
      eui:uiGridListAddColumn(var0.gridlist.taxi_requests, "", 1)
      eui:uiSetAlign(var0.gridlist.taxi_requests, "left", "center")
      eui:uiSetProperty(var0.gridlist.taxi_requests, "row_height", 30)
      eui:uiSetProperty(var0.gridlist.taxi_requests, "columns_names_visible", "False")
      eui:uiSetProperty(var0.gridlist.taxi_requests, "column_height", 0)
      var0.button["taxi:accept_request"] = eui:uiCreateButton(10, arg5 - 70, arg4 - 20, 35, {
        en = "Accept Request",
        ar = "\217\130\216\168\217\136\217\132 \216\167\217\132\216\183\217\132\216\168"
      }, tocolor(255, 220, 0, 255), var0.screen["taxi:driver"])
      eui:uiSetProperty(var0.button["taxi:accept_request"], "TextColor", tocolor(0, 0, 0))
    end
    if getElementData(localPlayer, "job") == "Taxi Driver" then
      eui:uiSetVisible(var0.screen["taxi:main"], false)
      eui:uiSetVisible(var0.screen["taxi:driver"], true)
      triggerServerEvent("taxi:request_sync", localPlayer)
    else
      eui:uiSetVisible(var0.screen["taxi:driver"], false)
      eui:uiSetVisible(var0.screen["taxi:main"], true)
    end
  end
end)
addEventHandler("onClientUIClick", root, function()
  if source == var0.button["taxi:request"] then
    triggerServerEvent("taxi:send_request", localPlayer)
  elseif source == var0.button["taxi:accept_request"] and eui:uiGridListGetSelectedItem(var0.gridlist.taxi_requests) ~= -1 then
    triggerServerEvent("taxi:accept_request", localPlayer, (eui:uiGridListGetItemData(var0.gridlist.taxi_requests, eui:uiGridListGetSelectedItem(var0.gridlist.taxi_requests), 1)))
  end
end)
addEvent("taxi:requests:sync", true)
addEventHandler("taxi:requests:sync", root, function(arg0)
  eui:uiGridListClear(var0.gridlist.taxi_requests)
  for forvar7, forvar8 in pairs(arg0) do
    if forvar8.status ~= "accepted" then
      eui:uiGridListSetItemText(var0.gridlist.taxi_requests, eui:uiGridListAddRow(var0.gridlist.taxi_requests), 1, tostring((getElementData(forvar7, "character:name"))) .. "   (" .. tostring((math.floor((getDistanceBetweenPoints3D(getElementPosition(localPlayer)))))) .. " m away)")
      eui:uiGridListSetItemData(var0.gridlist.taxi_requests, eui:uiGridListAddRow(var0.gridlist.taxi_requests), 1, forvar7)
    end
  end
end)
addEvent("taxi:on_accept_request", true)
addEventHandler("taxi:on_accept_request", localPlayer, function(arg0)
  eui:uiSetVisible(var0.button["taxi:request"], false)
  eui:uiSetText(var0.label["taxi:note"], {
    en = "",
    ar = "\216\170\217\133 \217\130\216\168\217\136\217\132 \216\167\217\132\216\183\217\132\216\168 \217\133\217\134 \217\130\216\168\217\132 \216\167\217\132\216\179\216\167\216\166\217\130" .. "\n" .. getElementData(arg0, "character:name") .. "\n\n\216\167\217\132\216\177\216\172\216\167\216\161 \217\132\216\167\216\170\217\130\217\133 \216\168\216\170\216\186\217\138\217\138\216\177 \217\133\217\136\217\130\216\185\217\131" .. "\n\216\173\216\170\217\137 \217\138\216\179\216\170\216\183\217\138\216\185 \216\167\217\132\216\179\216\167\216\166\217\130 \216\167\217\132\217\136\216\181\217\136\217\132 \217\132\217\131"
  })
  if reset_timer and isTimer(reset_timer) then
    killTimer(reset_timer)
  end
  reset_timer = setTimer(function()
    eui:uiSetVisible(var0.button["taxi:request"], true)
    eui:uiSetText(var0.label["taxi:note"], "")
  end, 300000, 1)
end)
