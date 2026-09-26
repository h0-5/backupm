-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

addEvent("onClientElementMenuShow", true)
addEventHandler("onClientElementMenuShow", localPlayer, function(arg0, arg1, arg2)
  if arg2 == "vehicle" and arg1 <= 5 then
    if not isElement(arg0) then
      return
    end
    if getVehicleType(arg0) == "Automobile" or getVehicleType(arg0) == "Plane" or getVehicleType(arg0) == "Helicopter" or getVehicleType(arg0) == "Trailer" or getVehicleType(arg0) == "Monster Truck" then
      if isVehicleLocked(arg0) then
      else
      end
      exports.interaction:addInteractOption(arg0, {
        text = "Lock/Unlock",
        data = {
          label = "#13f04eUnlock Vehicle"
        } or {
          label = "#f02d13Lock Vehicle"
        }
      })
      if not isVehicleLocked(arg0) then
        exports.interaction:addInteractOption(arg0, {
          text = "Doors control"
        })
      end
    end
    if getVehicleType(arg0) == "Automobile" or getVehicleType(arg0) == "Plane" or getVehicleType(arg0) == "Helicopter" or getVehicleType(arg0) == "Trailer" or getVehicleType(arg0) == "Monster Truck" then
      if isPedInVehicle(localPlayer) and getPedOccupiedVehicle(localPlayer) == arg0 then
        exports.interaction:addInteractOption(arg0, {text = "Inventory"})
      elseif not isVehicleLocked(arg0) then
        exports.interaction:addInteractOption(arg0, {text = "Inventory"})
      end
    elseif getVehicleType(arg0) == "Bike" and isPedInVehicle(localPlayer) and getPedOccupiedVehicle(localPlayer) == arg0 and getVehicleEngineState(arg0) then
      exports.interaction:addInteractOption(arg0, {text = "Inventory"})
    end
  end
end)
addEvent("onClientElementMenuClick", true)
addEventHandler("onClientElementMenuClick", root, function(arg0, arg1, arg2)
  if getElementType(arg0) == "vehicle" and arg1 == "Doors control" then
    if isVehicleLocked(arg0) then
      outputChatBox("The vehicle is locked.", 230, 230, 230)
    else
      guiScrollBarSetScrollPosition(VD.scrollbar[1], getVehicleDoorOpenRatio(arg0, 0) * 100)
      guiScrollBarSetScrollPosition(VD.scrollbar[2], getVehicleDoorOpenRatio(arg0, 1) * 100)
      guiScrollBarSetScrollPosition(VD.scrollbar[3], getVehicleDoorOpenRatio(arg0, 2) * 100)
      guiScrollBarSetScrollPosition(VD.scrollbar[4], getVehicleDoorOpenRatio(arg0, 3) * 100)
      guiScrollBarSetScrollPosition(VD.scrollbar[5], getVehicleDoorOpenRatio(arg0, 4) * 100)
      guiScrollBarSetScrollPosition(VD.scrollbar[6], getVehicleDoorOpenRatio(arg0, 5) * 100)
      guiSetVisible(VD.window[1], true)
      showCursor(true)
      currentVehicleControl = arg0
    end
  end
end)
addEventHandler("onClientVehicleDamage", root, function(arg0, arg1, arg2, arg3, arg4, arg5, arg6)
  if arg6 then
    return
  end
  if arg1 ~= 19 and arg1 ~= 51 and arg1 ~= 63 and getElementHealth(source) <= 285 then
    cancelEvent()
  end
end)
VD = {
  window = {},
  scrollbar = {},
  label = {},
  button = {}
}
addEventHandler("onClientResourceStart", resourceRoot, function()
  VD.window[1] = guiCreateWindow(20, (var0 - 314 + 25) / 2, 258, 339, "Vehicle doors", false)
  guiWindowSetSizable(VD.window[1], false)
  guiSetAlpha(VD.window[1], 1)
  guiSetVisible(VD.window[1], false)
  VD.label[1] = guiCreateLabel(10, 32, 238, 15, "Hood", false, VD.window[1])
  guiLabelSetHorizontalAlign(VD.label[1], "center", false)
  VD.scrollbar[1] = guiCreateScrollBar(10, 52, 238, 15, true, false, VD.window[1])
  VD.label[2] = guiCreateLabel(10, 77, 238, 15, "Trunk", false, VD.window[1])
  guiLabelSetHorizontalAlign(VD.label[2], "center", false)
  VD.scrollbar[2] = guiCreateScrollBar(10, 97, 238, 15, true, false, VD.window[1])
  VD.label[3] = guiCreateLabel(10, 122, 238, 15, "Front left", false, VD.window[1])
  guiLabelSetHorizontalAlign(VD.label[3], "center", false)
  VD.scrollbar[3] = guiCreateScrollBar(10, 142, 238, 15, true, false, VD.window[1])
  VD.label[4] = guiCreateLabel(10, 167, 238, 15, "Front right", false, VD.window[1])
  guiLabelSetHorizontalAlign(VD.label[4], "center", false)
  VD.scrollbar[4] = guiCreateScrollBar(10, 187, 238, 15, true, false, VD.window[1])
  VD.label[5] = guiCreateLabel(10, 212, 238, 15, "Rear left", false, VD.window[1])
  guiLabelSetHorizontalAlign(VD.label[5], "center", false)
  VD.scrollbar[5] = guiCreateScrollBar(10, 232, 238, 15, true, false, VD.window[1])
  VD.label[6] = guiCreateLabel(10, 257, 238, 15, "Rear right", false, VD.window[1])
  guiLabelSetHorizontalAlign(VD.label[6], "center", false)
  VD.scrollbar[6] = guiCreateScrollBar(10, 278, 238, 15, true, false, VD.window[1])
  VD.button[5] = guiCreateButton(79, 303, 100, 25, "CLOSE", false, VD.window[1])
end)
addEventHandler("onClientGUIClick", resourceRoot, function()
  if source == VD.button[5] then
    guiSetVisible(VD.window[1], false)
    showCursor(false)
  end
end)
addEventHandler("onClientGUIScroll", resourceRoot, function()
  if not guiGetVisible(VD.window[1]) then
    return
  end
  if source == VD.scrollbar[1] then
    if isVehicleLocked(currentVehicleControl) then
      return
    end
    triggerServerEvent("vehicles:doorsControl", localPlayer, currentVehicleControl, 0, guiScrollBarGetScrollPosition(source) / 100)
  elseif source == VD.scrollbar[2] then
    if isVehicleLocked(currentVehicleControl) then
      return
    end
    triggerServerEvent("vehicles:doorsControl", localPlayer, currentVehicleControl, 1, guiScrollBarGetScrollPosition(source) / 100)
  elseif source == VD.scrollbar[3] then
    if isVehicleLocked(currentVehicleControl) then
      return
    end
    triggerServerEvent("vehicles:doorsControl", localPlayer, currentVehicleControl, 2, guiScrollBarGetScrollPosition(source) / 100)
  elseif source == VD.scrollbar[4] then
    if isVehicleLocked(currentVehicleControl) then
      return
    end
    triggerServerEvent("vehicles:doorsControl", localPlayer, currentVehicleControl, 3, guiScrollBarGetScrollPosition(source) / 100)
  elseif source == VD.scrollbar[5] then
    if isVehicleLocked(currentVehicleControl) then
      return
    end
    triggerServerEvent("vehicles:doorsControl", localPlayer, currentVehicleControl, 4, guiScrollBarGetScrollPosition(source) / 100)
  elseif source == VD.scrollbar[6] then
    if isVehicleLocked(currentVehicleControl) then
      return
    end
    triggerServerEvent("vehicles:doorsControl", localPlayer, currentVehicleControl, 5, guiScrollBarGetScrollPosition(source) / 100)
  end
end)
function checkHelicopter()
  if not getElementData(localPlayer, "character:id") then
    return
  end
  for forvar9 = 1, #getElementsWithinRange(getElementPosition(localPlayer)) do
    if getVehicleType(getElementsWithinRange(getElementPosition(localPlayer))[forvar9]) == "Helicopter" and not getVehicleEngineState(getElementsWithinRange(getElementPosition(localPlayer))[forvar9]) then
      setHelicopterRotorSpeed(getElementsWithinRange(getElementPosition(localPlayer))[forvar9], 0)
    end
  end
end
addEventHandler("onClientRender", root, checkHelicopter)
function drawVehicleInfo()
  isRender = true
  if not getElementData(localPlayer, "character:id") then
    return
  end
  if isPlayerMapVisible() then
    return
  end
  for forvar9 = 1, #getElementsWithinRange(getCameraMatrix()) do
    if getElementData(getElementsWithinRange(getCameraMatrix())[forvar9], "vehicle:show.describtion") and isElement(getElementsWithinRange(getCameraMatrix())[forvar9]) and isLineOfSightClear(getCameraMatrix()) and getScreenFromWorldPosition(getElementPosition(getElementsWithinRange(getCameraMatrix())[forvar9])) and getScreenFromWorldPosition(getElementPosition(getElementsWithinRange(getCameraMatrix())[forvar9])) then
      if 1 < #(getElementData(getElementsWithinRange(getCameraMatrix())[forvar9], "vehicle:describtion") or "") then
      end
      if getElementData(getElementsWithinRange(getCameraMatrix())[forvar9], "vehicle:impounded") then
      end
      table.sort(split(tostring(((tostring(getElementData(getElementsWithinRange(getCameraMatrix())[forvar9], "vehicle:describtion.info")) .. [[

Owner: ]] .. tostring(getElementData(getElementsWithinRange(getCameraMatrix())[forvar9], "vehicle:owner.name")):gsub("faction:", ""):gsub("job:", "")) .. "\n" .. (getElementData(getElementsWithinRange(getCameraMatrix())[forvar9], "vehicle:describtion") or "")) .. [[

#FF0000[Impounded]
]] .. tostring((getElementData(getElementsWithinRange(getCameraMatrix())[forvar9], "vehicle:impounded")))), 10), function(arg0, arg1)
        return #arg0 > #arg1
      end)
      dxDrawRectangle(var0(getScreenFromWorldPosition(getElementPosition(getElementsWithinRange(getCameraMatrix())[forvar9])) - math.max(dxGetTextWidth(tostring(split(tostring(((tostring(getElementData(getElementsWithinRange(getCameraMatrix())[forvar9], "vehicle:describtion.info")) .. [[

Owner: ]] .. tostring(getElementData(getElementsWithinRange(getCameraMatrix())[forvar9], "vehicle:owner.name")):gsub("faction:", ""):gsub("job:", "")) .. "\n" .. (getElementData(getElementsWithinRange(getCameraMatrix())[forvar9], "vehicle:describtion") or "")) .. [[

#FF0000[Impounded]
]] .. tostring((getElementData(getElementsWithinRange(getCameraMatrix())[forvar9], "vehicle:impounded")))), 10)[1]), 1, "default") + 20, 150) / 2), var0(getScreenFromWorldPosition(getElementPosition(getElementsWithinRange(getCameraMatrix())[forvar9])) - (15 * #split(tostring(((tostring(getElementData(getElementsWithinRange(getCameraMatrix())[forvar9], "vehicle:describtion.info")) .. [[

Owner: ]] .. tostring(getElementData(getElementsWithinRange(getCameraMatrix())[forvar9], "vehicle:owner.name")):gsub("faction:", ""):gsub("job:", "")) .. "\n" .. (getElementData(getElementsWithinRange(getCameraMatrix())[forvar9], "vehicle:describtion") or "")) .. [[

#FF0000[Impounded]
]] .. tostring((getElementData(getElementsWithinRange(getCameraMatrix())[forvar9], "vehicle:impounded")))), 10) + 9) / 2), var0((math.max(dxGetTextWidth(tostring(split(tostring(((tostring(getElementData(getElementsWithinRange(getCameraMatrix())[forvar9], "vehicle:describtion.info")) .. [[

Owner: ]] .. tostring(getElementData(getElementsWithinRange(getCameraMatrix())[forvar9], "vehicle:owner.name")):gsub("faction:", ""):gsub("job:", "")) .. "\n" .. (getElementData(getElementsWithinRange(getCameraMatrix())[forvar9], "vehicle:describtion") or "")) .. [[

#FF0000[Impounded]
]] .. tostring((getElementData(getElementsWithinRange(getCameraMatrix())[forvar9], "vehicle:impounded")))), 10)[1]), 1, "default") + 20, 150))), var0(15 * #split(tostring(((tostring(getElementData(getElementsWithinRange(getCameraMatrix())[forvar9], "vehicle:describtion.info")) .. [[

Owner: ]] .. tostring(getElementData(getElementsWithinRange(getCameraMatrix())[forvar9], "vehicle:owner.name")):gsub("faction:", ""):gsub("job:", "")) .. "\n" .. (getElementData(getElementsWithinRange(getCameraMatrix())[forvar9], "vehicle:describtion") or "")) .. [[

#FF0000[Impounded]
]] .. tostring((getElementData(getElementsWithinRange(getCameraMatrix())[forvar9], "vehicle:impounded")))), 10) + 9), tocolor(0, 0, 0, 120))
      dxDrawText(tostring(((tostring(getElementData(getElementsWithinRange(getCameraMatrix())[forvar9], "vehicle:describtion.info")) .. [[

Owner: ]] .. tostring(getElementData(getElementsWithinRange(getCameraMatrix())[forvar9], "vehicle:owner.name")):gsub("faction:", ""):gsub("job:", "")) .. "\n" .. (getElementData(getElementsWithinRange(getCameraMatrix())[forvar9], "vehicle:describtion") or "")) .. [[

#FF0000[Impounded]
]] .. tostring((getElementData(getElementsWithinRange(getCameraMatrix())[forvar9], "vehicle:impounded")))), var0(getScreenFromWorldPosition(getElementPosition(getElementsWithinRange(getCameraMatrix())[forvar9]))), var0(getScreenFromWorldPosition(getElementPosition(getElementsWithinRange(getCameraMatrix())[forvar9])) - (15 * #split(tostring(((tostring(getElementData(getElementsWithinRange(getCameraMatrix())[forvar9], "vehicle:describtion.info")) .. [[

Owner: ]] .. tostring(getElementData(getElementsWithinRange(getCameraMatrix())[forvar9], "vehicle:owner.name")):gsub("faction:", ""):gsub("job:", "")) .. "\n" .. (getElementData(getElementsWithinRange(getCameraMatrix())[forvar9], "vehicle:describtion") or "")) .. [[

#FF0000[Impounded]
]] .. tostring((getElementData(getElementsWithinRange(getCameraMatrix())[forvar9], "vehicle:impounded")))), 10) + 9) / 2) + 15, var0(getScreenFromWorldPosition(getElementPosition(getElementsWithinRange(getCameraMatrix())[forvar9]))), var0(getScreenFromWorldPosition(getElementPosition(getElementsWithinRange(getCameraMatrix())[forvar9])) + (15 * #split(tostring(((tostring(getElementData(getElementsWithinRange(getCameraMatrix())[forvar9], "vehicle:describtion.info")) .. [[

Owner: ]] .. tostring(getElementData(getElementsWithinRange(getCameraMatrix())[forvar9], "vehicle:owner.name")):gsub("faction:", ""):gsub("job:", "")) .. "\n" .. (getElementData(getElementsWithinRange(getCameraMatrix())[forvar9], "vehicle:describtion") or "")) .. [[

#FF0000[Impounded]
]] .. tostring((getElementData(getElementsWithinRange(getCameraMatrix())[forvar9], "vehicle:impounded")))), 10) + 9) / 2), tocolor(255, 255, 255, 255), 1, "default", "center", "center", false, false, false, true, false)
      dxDrawLine(var0(getScreenFromWorldPosition(getElementPosition(getElementsWithinRange(getCameraMatrix())[forvar9])) - math.max(dxGetTextWidth(tostring(split(tostring(((tostring(getElementData(getElementsWithinRange(getCameraMatrix())[forvar9], "vehicle:describtion.info")) .. [[

Owner: ]] .. tostring(getElementData(getElementsWithinRange(getCameraMatrix())[forvar9], "vehicle:owner.name")):gsub("faction:", ""):gsub("job:", "")) .. "\n" .. (getElementData(getElementsWithinRange(getCameraMatrix())[forvar9], "vehicle:describtion") or "")) .. [[

#FF0000[Impounded]
]] .. tostring((getElementData(getElementsWithinRange(getCameraMatrix())[forvar9], "vehicle:impounded")))), 10)[1]), 1, "default") + 20, 150) / 2), var0(getScreenFromWorldPosition(getElementPosition(getElementsWithinRange(getCameraMatrix())[forvar9])) + (15 * #split(tostring(((tostring(getElementData(getElementsWithinRange(getCameraMatrix())[forvar9], "vehicle:describtion.info")) .. [[

Owner: ]] .. tostring(getElementData(getElementsWithinRange(getCameraMatrix())[forvar9], "vehicle:owner.name")):gsub("faction:", ""):gsub("job:", "")) .. "\n" .. (getElementData(getElementsWithinRange(getCameraMatrix())[forvar9], "vehicle:describtion") or "")) .. [[

#FF0000[Impounded]
]] .. tostring((getElementData(getElementsWithinRange(getCameraMatrix())[forvar9], "vehicle:impounded")))), 10) + 9) / 2), var0(getScreenFromWorldPosition(getElementPosition(getElementsWithinRange(getCameraMatrix())[forvar9])) - math.max(dxGetTextWidth(tostring(split(tostring(((tostring(getElementData(getElementsWithinRange(getCameraMatrix())[forvar9], "vehicle:describtion.info")) .. [[

Owner: ]] .. tostring(getElementData(getElementsWithinRange(getCameraMatrix())[forvar9], "vehicle:owner.name")):gsub("faction:", ""):gsub("job:", "")) .. "\n" .. (getElementData(getElementsWithinRange(getCameraMatrix())[forvar9], "vehicle:describtion") or "")) .. [[

#FF0000[Impounded]
]] .. tostring((getElementData(getElementsWithinRange(getCameraMatrix())[forvar9], "vehicle:impounded")))), 10)[1]), 1, "default") + 20, 150) / 2 + math.max(dxGetTextWidth(tostring(split(tostring(((tostring(getElementData(getElementsWithinRange(getCameraMatrix())[forvar9], "vehicle:describtion.info")) .. [[

Owner: ]] .. tostring(getElementData(getElementsWithinRange(getCameraMatrix())[forvar9], "vehicle:owner.name")):gsub("faction:", ""):gsub("job:", "")) .. "\n" .. (getElementData(getElementsWithinRange(getCameraMatrix())[forvar9], "vehicle:describtion") or "")) .. [[

#FF0000[Impounded]
]] .. tostring((getElementData(getElementsWithinRange(getCameraMatrix())[forvar9], "vehicle:impounded")))), 10)[1]), 1, "default") + 20, 150)), var0(getScreenFromWorldPosition(getElementPosition(getElementsWithinRange(getCameraMatrix())[forvar9])) + (15 * #split(tostring(((tostring(getElementData(getElementsWithinRange(getCameraMatrix())[forvar9], "vehicle:describtion.info")) .. [[

Owner: ]] .. tostring(getElementData(getElementsWithinRange(getCameraMatrix())[forvar9], "vehicle:owner.name")):gsub("faction:", ""):gsub("job:", "")) .. "\n" .. (getElementData(getElementsWithinRange(getCameraMatrix())[forvar9], "vehicle:describtion") or "")) .. [[

#FF0000[Impounded]
]] .. tostring((getElementData(getElementsWithinRange(getCameraMatrix())[forvar9], "vehicle:impounded")))), 10) + 9) / 2), tocolor(255, 55, 95, 255), 2)
    end
  end
end
addEventHandler("onClientResourceStart", resourceRoot, function()
  if getElementData(localPlayer, "describtion:show") then
    addEventHandler("onClientRender", root, drawVehicleInfo)
  end
end)
addEventHandler("onClientElementDataChange", localPlayer, function(arg0, arg1)
  if arg0 == "describtion:show" then
    if getElementData(localPlayer, "describtion:show") then
      removeEventHandler("onClientRender", root, drawVehicleInfo)
      addEventHandler("onClientRender", root, drawVehicleInfo)
    else
      removeEventHandler("onClientRender", root, drawVehicleInfo)
    end
  end
end)
addEventHandler("onClientElementDataChange", root, function(arg0, arg1)
  if arg0 == "vehicle:windows" and getElementType(source) == "vehicle" then
    for forvar7, forvar8 in ipairs(getElementData(source, "vehicle:windows") or {
      false,
      false,
      false,
      false
    }) do
      if ({
        [0] = 4,
        [1] = 2,
        [2] = 5,
        [3] = 3
      })[forvar7 - 1] then
        setVehicleWindowOpen(source, ({
          [0] = 4,
          [1] = 2,
          [2] = 5,
          [3] = 3
        })[forvar7 - 1], forvar8)
      end
    end
  end
end)
VehDesc = {
  checkbox = {},
  label = {},
  button = {},
  window = {},
  memo = {}
}
VehDesc.window[1] = guiCreateWindow((guiGetScreenSize() - 365) / 2, (guiGetScreenSize() - 257) / 2, 365, 257, "Vehicle Description", false)
guiWindowSetSizable(VehDesc.window[1], false)
guiSetVisible(VehDesc.window[1], false)
VehDesc.memo[1] = guiCreateMemo(10, 28, 345, 181, "", false, VehDesc.window[1])
VehDesc.button[1] = guiCreateButton(265, 219, 85, 28, "Save", false, VehDesc.window[1])
VehDesc.checkbox[1] = guiCreateCheckBox(15, 231, 201, 16, "Show description", false, false, VehDesc.window[1])
VehDesc.label[1] = guiCreateLabel(15, 213, 234, 16, "0/100", false, VehDesc.window[1])
guiSetFont(VehDesc.label[1], "default-small")
addEventHandler("onClientGUIChanged", resourceRoot, function()
  if source == VehDesc.memo[1] then
    if #guiGetText(source) > 100 then
      guiSetText(source, string.sub(guiGetText(source), 0, 99))
    end
    guiSetText(VehDesc.label[1], tostring(#guiGetText(source) - 1) .. "/100")
  end
end)
addEventHandler("onClientGUIClick", resourceRoot, function()
  if source == VehDesc.button[1] then
    guiSetVisible(VehDesc.window[1], false)
    if #(table.concat(split(guiGetText(VehDesc.memo[1]):gsub("#%x%x%x%x%x%x", ""), "[\n\r]"), "\n") .. "\n") <= 100 and #split(guiGetText(VehDesc.memo[1]):gsub("#%x%x%x%x%x%x", ""), "[\n\r]") <= 3 then
      triggerServerEvent("vehicle:saveDescribtion", localPlayer, var0, table.concat(split(guiGetText(VehDesc.memo[1]):gsub("#%x%x%x%x%x%x", ""), "[\n\r]"), "\n") .. "\n", (guiCheckBoxGetSelected(VehDesc.checkbox[1])))
    else
      outputChatBox("Error: the description must be 100 words or less and maximum 3 lines.", 255, 0, 0)
    end
  end
end)
addEvent("onClientElementMenuClick", true)
addEventHandler("onClientElementMenuClick", root, function(arg0, arg1, arg2)
  if getElementType(arg0) == "vehicle" and arg1 == "Edit Description" then
    var0 = arg0
    guiSetText(VehDesc.memo[1], getElementData(arg0, "vehicle:describtion") or "")
    guiCheckBoxSetSelected(VehDesc.checkbox[1], getElementData(arg0, "vehicle:show.describtion") or false)
    guiSetText(VehDesc.label[1], tostring(#guiGetText(VehDesc.memo[1]) - 1) .. "/100")
    guiSetVisible(VehDesc.window[1], true)
  end
end)
addEvent("vehicles:openEditDescribtion", true)
addEventHandler("vehicles:openEditDescribtion", root, function(arg0)
  var0 = arg0
  guiSetText(VehDesc.memo[1], getElementData(arg0, "vehicle:describtion") or "")
  guiCheckBoxSetSelected(VehDesc.checkbox[1], getElementData(arg0, "vehicle:show.describtion") or false)
  guiSetText(VehDesc.label[1], tostring(#guiGetText(VehDesc.memo[1]) - 1) .. "/100")
  guiSetVisible(VehDesc.window[1], true)
end)
addEvent("vehicles:setVehicleWindowOpen", true)
addEventHandler("vehicles:setVehicleWindowOpen", root, function(arg0, arg1, arg2)
  if not isElement(arg0) then
    return
  end
  setVehicleWindowOpen(arg0, arg1, not isVehicleWindowOpen(arg0, arg1))
  if arg2 == localPlayer then
    if isVehicleWindowOpen(arg0, arg1) then
      exports["chat-system"]:outputMe(localPlayer, "@charactername rolls their windows down", true, true)
    else
      exports["chat-system"]:outputMe(localPlayer, "@charactername rolls their windows up", true, true)
    end
  end
end)
addEventHandler("onClientVehicleEnter", root, function(arg0, arg1)
  if arg0 ~= localPlayer then
    return
  end
  if not var0[getVehicleType(source)] then
    return
  end
  if not exports.hud:isHudItemExists("seatbelt") then
    if var1 and isElement(var1) then
      stopSound(var1)
    end
    if arg1 == 0 then
      var1 = playSound("sounds/seatbelt.mp4", true)
      setSoundVolume(var1, 0.4)
    end
  end
end)
addEvent("hud:onClientPlayerHudItemRemove", true)
addEventHandler("hud:onClientPlayerHudItemRemove", localPlayer, function(arg0)
  if arg0 == "seatbelt" and var0 and isElement(var0) then
    stopSound(var0)
  end
end)
addEventHandler("onClientVehicleStartExit", root, function(arg0)
  if arg0 ~= localPlayer then
    return
  end
  if var0 and isElement(var0) then
    stopSound(var0)
  end
end)
addEventHandler("onClientVehicleExit", root, function(arg0)
  if arg0 ~= localPlayer then
    return
  end
  if var0 and isElement(var0) then
    stopSound(var0)
  end
end)
addEvent("vehicles:seatbelt", true)
addEventHandler("vehicles:seatbelt", root, function(arg0)
  if arg0 then
    if var0 and isElement(var0) then
      stopSound(var0)
    end
  else
    if var0 and isElement(var0) then
      stopSound(var0)
    end
    if getPedOccupiedVehicleSeat(localPlayer) == 0 then
      var0 = playSound("sounds/seatbelt.mp4", true)
      setSoundVolume(var0, 0.4)
    end
  end
end)
addEvent("vehicles:onClientVehicleLocked", true)
addEventHandler("vehicles:onClientVehicleLocked", root, function(arg0)
  if isVehicleLocked(arg0) then
    if isPedInVehicle(localPlayer) then
      playSoundLock(true)
    end
  elseif isPedInVehicle(localPlayer) then
    playSoundLock(false)
  end
end)
addEvent("vehicles:playSound", true)
addEventHandler("vehicles:playSound", localPlayer, function(arg0)
  if playSound("sounds/" .. arg0) then
    setSoundVolume(playSound("sounds/" .. arg0), 1)
  end
end)
addEvent("vehicles:onClientVehicleLockedOutside", true)
addEventHandler("vehicles:onClientVehicleLockedOutside", localPlayer, function(arg0)
  playSound3D("sounds/car_lock_outside.wav", getElementPosition(arg0))
end)
function playSoundHandbrake(arg0)
  if not arg0 then
    if playSound("sounds/hb_off.mp3") then
      setSoundVolume(playSound("sounds/hb_off.mp3"), 1)
    end
  elseif playSound("sounds/hb_on.mp3") then
    setSoundVolume(playSound("sounds/hb_on.mp3"), 0.4)
  end
end
addEvent("vehicles:playSoundHandbrake", true)
addEventHandler("vehicles:playSoundHandbrake", root, playSoundHandbrake)
function playSoundWindow(arg0)
  if arg0 then
    setSoundVolume(playSound("sounds/window_open.mp3"), 0.4)
  else
    setSoundVolume(playSound("sounds/window_close.mp3"), 0.4)
  end
end
addEvent("vehicles:playSoundWindow", true)
addEventHandler("vehicles:playSoundWindow", root, playSoundWindow)
addEvent("vehicles:playSoundRepair", true)
addEventHandler("vehicles:playSoundRepair", root, function(arg0)
  setSoundMaxDistance(playSound3D("http://soundbible.com/grab.php?id=2168&type=mp3", getElementPosition(arg0)), 5)
end)
function playSoundLock(arg0)
  if isElement(var0) then
    destroyElement(var0)
  end
  var0 = playSound(arg0 and "sounds/car_lock_inside.mp3" or "sounds/car_unlock_inside.mp3")
  if var0 then
    setSoundVolume(var0, 1)
  end
end
addEvent("vehicles:playSoundLock", true)
addEventHandler("vehicles:playSoundLock", root, playSoundLock)
function lockVeh(arg0, arg1)
  if not getElementData(localPlayer, "character:id") then
    return
  end
  if isPedInVehicle(localPlayer) then
    return
  end
  for forvar12, forvar13 in ipairs((getElementsWithinRange(getElementPosition(localPlayer)))) do
    if getVehicleType(forvar13) ~= "BMX" and getVehicleType(forvar13) ~= "Bike" then
      table.insert({}, {
        forvar13,
        getDistanceBetweenPoints3D(getElementPosition(localPlayer))
      })
    end
  end
  table.sort({}, function(arg0, arg1)
    return tonumber(arg0[2]) < tonumber(arg1[2])
  end)
  triggerServerEvent("vehicles:VehicelLock", localPlayer, {})
end
bindKey("k", "down", lockVeh)
UI = {
  window = {},
  label = {},
  button = {}
}
function UIKitReady()
  eui = exports.UIKit
  UI.window.Checkveh = eui:uiCreateRectangle(false, false, 400, 500, tocolor(15, 15, 15, 240), true, true, true, true)
  eui:uiSetVisible(UI.window.Checkveh, false)
  UI.label.Checkveh_Title = eui:uiCreateLabel(10, 15, 232, 20, "Check Vehicle", tocolor(255, 255, 255, 255), "left", "top", UI.window.Checkveh)
  eui:uiSetFont(UI.label.Checkveh_Title, "default-large")
  UI.label.Details = eui:uiCreateLabel(10, 50, 380, 150, "", tocolor(255, 255, 255, 255), "left", "top", UI.window.Checkveh)
  UI.button.Close = eui:uiCreateButton(0, 470, 400, 30, "Close", tocolor(10, 10, 10, 240), UI.window.Checkveh)
end
addEventHandler("onClientUIReady", resourceRoot, UIKitReady)
addEventHandler("onClientUIKitReady", root, UIKitReady)
addEvent("vehicles:checkveh", true)
addEventHandler("vehicles:checkveh", localPlayer, function(arg0, arg1)
  eui:uiSetVisible(UI.window.Checkveh, true)
  showCursor(true)
  for forvar6, forvar7 in ipairs(arg1) do
    if forvar7.value then
    else
    end
  end
  eui:uiSetText(UI.label.Details, ("" .. "${color.primary}\226\128\162 " .. tostring(forvar7.name) .. "  \194\187\n    #FFFFFF" .. tostring(forvar7.value.value) .. "  (" .. tostring(forvar7.value.time) .. ")\n") .. "${color.primary}\226\128\162 " .. tostring(forvar7.name) .. "  \194\187\n    #FFFFFF-\n")
  eui:uiSetText(UI.label.Checkveh_Title, "Check Vehicle ID #" .. tostring(arg0))
end)
addEventHandler("onClientUIClick", root, function(arg0)
  if source == UI.button.Close then
    eui:uiSetVisible(UI.window.Checkveh, false)
    showCursor(false)
  end
end)
function closeUIWindows(arg0)
  eui:uiSetVisible(UI.window.Checkveh, false)
  showCursor(false)
end
addEvent("onClientPlayerQuitFromCharacter", true)
addEventHandler("onClientPlayerQuitFromCharacter", localPlayer, closeUIWindows)
addEventHandler("onClientPlayerWasted", localPlayer, closeUIWindows)
setTimer(function()
  for forvar3, forvar4 in ipairs(getElementsByType("vehicle", root, true)) do
    if getElementHealth(forvar4) < 300 then
      if not isVehicleDamageProof(forvar4) then
        setVehicleDamageProof(forvar4, true)
        setElementHealth(forvar4, 285)
      end
    elseif not getElementData(forvar4, "armored") then
      setVehicleDamageProof(forvar4, false)
    end
  end
end, 1500, 0)
