-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

bindKey("m", "down", function(arg0, arg1)
  if arg1 == "down" then
    if not getElementData(localPlayer, "character:id") then
      return
    end
    showCursor(not isCursorShowing())
    var0.active = not var0.active
  end
end)
addEvent("onClientElementMenuClick", false)
addEvent("onClientElementMenuShow", false)
addEventHandler("onClientGUIClick", root, function(arg0, arg1, arg2, arg3)
  var0 = getTickCount()
end)
addEventHandler("onClientGUIDoubleClick", root, function(arg0, arg1, arg2, arg3)
  var0 = getTickCount()
end)
;({
  active = false,
  status = false,
  currentElement = false,
  currentOptions = {},
  pos = {0, 0},
  hovered = 0,
  isHoveredMenu = 0,
  title = ""
}).drawSensor = function()
  if not isCursorShowing() then
    return
  end
  if getCursorAlpha() == 0 then
    if processLineOfSight(getCameraMatrix()) then
      if getElementType(processLineOfSight(getCameraMatrix())) == "player" then
      elseif getElementType(processLineOfSight(getCameraMatrix())) == "vehicle" then
      elseif getElementType(processLineOfSight(getCameraMatrix())) == "object" then
      end
    end
    if getKeyState("mouse1") then
    elseif getKeyState("mouse2") then
    end
    dxDrawCircle(getCursorPosition() * var0, getCursorPosition() * var1, 3, 0, 360, tocolor(255, 187, 41, 255), _, 32, 1, true)
  end
end
addEvent("onClientInteractionClick", false)
addEventHandler("onClientInteractionClick", localPlayer, function(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, arg15, arg16, arg17)
  if arg0 == "left" and arg1 == "down" and arg2 <= 2 and arg3 and isElement(arg3) and getElementType(arg3) == "vehicle" and var0[arg9] then
    if isPedInVehicle(localPlayer) then
      return
    end
    if getVehicleDoorOpenRatio(arg3, var0[arg9]) > 0 then
      triggerServerEvent("vehicles:doorsControl", localPlayer, arg3, var0[arg9], 0)
    elseif not isVehicleLocked(arg3) then
      triggerServerEvent("vehicles:doorsControl", localPlayer, arg3, var0[arg9], 1)
    end
  end
end)
function elementsclick(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7)
  if isPedDead(localPlayer) then
    return
  end
  triggerEvent("onClientInteractionClick", localPlayer, arg0, arg1, getDistanceBetweenPoints3D(getElementPosition(localPlayer)), arg7, arg4, arg5, arg6, processLineOfSight(getCameraMatrix()))
  if processLineOfSight(getCameraMatrix()) and not arg7 then
    arg7 = processLineOfSight(getCameraMatrix())
  end
  if arg0 == "right" then
    if arg1 == "up" then
      if isElement(arg7) and getElementType(arg7) == "object" then
        if getElementData(arg7, "custom.interior") then
        else
        end
      end
      if isElement(arg7) and false then
        showInteract(arg7, arg2, arg3)
      else
        if findElement(getCameraMatrix()) then
          showInteract(findElement(getCameraMatrix()), arg2, arg3)
          return
        end
        if findPlayer(processLineOfSight(getCameraMatrix()) or arg4, processLineOfSight(getCameraMatrix()) or arg5, processLineOfSight(getCameraMatrix()) or arg6) then
          showInteract(findPlayer(processLineOfSight(getCameraMatrix()) or arg4, processLineOfSight(getCameraMatrix()) or arg5, processLineOfSight(getCameraMatrix()) or arg6), arg2, arg3)
          return
        end
        if findObject(processLineOfSight(getCameraMatrix()) or arg4, processLineOfSight(getCameraMatrix()) or arg5, processLineOfSight(getCameraMatrix()) or arg6) then
          showInteract(findObject(processLineOfSight(getCameraMatrix()) or arg4, processLineOfSight(getCameraMatrix()) or arg5, processLineOfSight(getCameraMatrix()) or arg6), arg2, arg3)
          return
        end
        if findPickup(processLineOfSight(getCameraMatrix()) or arg4, processLineOfSight(getCameraMatrix()) or arg5, processLineOfSight(getCameraMatrix()) or arg6) then
          showInteract(findPickup(processLineOfSight(getCameraMatrix()) or arg4, processLineOfSight(getCameraMatrix()) or arg5, processLineOfSight(getCameraMatrix()) or arg6), arg2, arg3)
          return
        end
        if findMarker(processLineOfSight(getCameraMatrix()) or arg4, processLineOfSight(getCameraMatrix()) or arg5, processLineOfSight(getCameraMatrix()) or arg6) then
          showInteract(findMarker(processLineOfSight(getCameraMatrix()) or arg4, processLineOfSight(getCameraMatrix()) or arg5, processLineOfSight(getCameraMatrix()) or arg6), arg2, arg3)
          return
        end
      end
    end
  elseif arg0 == "left" and arg1 == "down" then
    if var0.isHoveredMenu then
      if var0.hovered ~= 0 and var0.currentOptions then
        if isElement(var0.currentElement) then
          triggerEvent("onClientElementMenuClick", localPlayer, var0.currentElement, var0.currentOptions[var0.hovered].Text, var0.currentOptions[var0.hovered].Data)
          if not isElementLocal(var0.currentElement) then
            triggerLatentServerEvent("onClientElementMenuClick:Server", var1, false, localPlayer, var0.currentElement, var0.currentOptions[var0.hovered].Text, var0.currentOptions[var0.hovered].Data)
          end
        end
        var0.status = false
        var0.currentElement = false
        var0.currentOptions = false
        var0.title = ""
      end
    elseif not isElement(arg7) then
      hideInteract()
    end
  end
end
addEventHandler("onClientClick", root, elementsclick)
function showInteract(arg0, arg1, arg2)
  if getTickCount() - var0 <= 300 then
    return
  end
  if var1.currentElement == arg0 then
    var1.pos = {arg1, arg2}
    return
  end
  var1.status = true
  var1.currentElement = arg0
  var1.currentOptions = getElementData(arg0, "rightclick:menu") or {}
  var1.title = getElementData(arg0, "rightclick:title") or ""
  var1.hovered = 0
  var1.isHoveredMenu = 0
  var1.pos = {arg1, arg2}
  removeEventHandler("onClientRender", root, var1.render)
  addEventHandler("onClientRender", root, var1.render)
  triggerEvent("onClientElementMenuShow", localPlayer, var1.currentElement, getDistanceBetweenPoints3D(getElementPosition(localPlayer)), getElementType(var1.currentElement))
  if not isElementLocal(var1.currentElement) then
    triggerLatentServerEvent("onClientElementMenuShow:Server", var2, false, localPlayer, var1.currentElement, (getDistanceBetweenPoints3D(getElementPosition(localPlayer))))
  end
end
function isInteractionOptionsShowing()
  return var0.currentOptions
end
function hideInteract()
  if var0.status then
    removeEventHandler("onClientRender", root, var0.render)
    var0.status = false
    var0.hovered = 0
    var0.isHoveredMenu = false
    var0.currentElement = false
    var0.currentOptions = false
    var0.title = ""
  end
end
function closeInteraction(arg0)
  hideInteract()
end
addEvent("onClientPlayerQuitFromCharacter", true)
addEventHandler("onClientPlayerQuitFromCharacter", localPlayer, closeInteraction)
addEventHandler("onClientPlayerWasted", localPlayer, closeInteraction)
function findElement(arg0, arg1, arg2, arg3, arg4, arg5)
  for forvar12 = 1, #getElementsWithinRange(arg0, arg1, arg2, 20, "player", getElementInterior(localPlayer), (getElementDimension(localPlayer))) do
    if isPedDead(getElementsWithinRange(arg0, arg1, arg2, 20, "player", getElementInterior(localPlayer), (getElementDimension(localPlayer)))[forvar12]) and processLineAgainstMesh(getElementsWithinRange(arg0, arg1, arg2, 20, "player", getElementInterior(localPlayer), (getElementDimension(localPlayer)))[forvar12], arg0, arg1, arg2, arg3, arg4, arg5) then
      return getElementsWithinRange(arg0, arg1, arg2, 20, "player", getElementInterior(localPlayer), (getElementDimension(localPlayer)))[forvar12]
    end
  end
  for forvar12 = 1, #getElementsWithinRange(arg0, arg1, arg2, 20, "object", getElementInterior(localPlayer), (getElementDimension(localPlayer))) do
    if (getElementData(getElementsWithinRange(arg0, arg1, arg2, 20, "object", getElementInterior(localPlayer), (getElementDimension(localPlayer)))[forvar12], "item:data") or getElementData(getElementsWithinRange(arg0, arg1, arg2, 20, "object", getElementInterior(localPlayer), (getElementDimension(localPlayer)))[forvar12], "rightclick:menu")) and processLineAgainstMesh(getElementsWithinRange(arg0, arg1, arg2, 20, "object", getElementInterior(localPlayer), (getElementDimension(localPlayer)))[forvar12], arg0, arg1, arg2, arg3, arg4, arg5) then
      return getElementsWithinRange(arg0, arg1, arg2, 20, "object", getElementInterior(localPlayer), (getElementDimension(localPlayer)))[forvar12]
    end
  end
  for forvar12 = 1, #getElementsWithinRange(arg0, arg1, arg2, 20, "pickup", getElementInterior(localPlayer), (getElementDimension(localPlayer))) do
    if processLineAgainstMesh(getElementsWithinRange(arg0, arg1, arg2, 20, "pickup", getElementInterior(localPlayer), (getElementDimension(localPlayer)))[forvar12], arg0, arg1, arg2, arg3, arg4, arg5) then
      return getElementsWithinRange(arg0, arg1, arg2, 20, "pickup", getElementInterior(localPlayer), (getElementDimension(localPlayer)))[forvar12]
    end
  end
  for forvar12 = 1, #getElementsWithinRange(arg0, arg1, arg2, 20, "marker", getElementInterior(localPlayer), (getElementDimension(localPlayer))) do
    if processLineAgainstMesh(getElementsWithinRange(arg0, arg1, arg2, 20, "marker", getElementInterior(localPlayer), (getElementDimension(localPlayer)))[forvar12], arg0, arg1, arg2, arg3, arg4, arg5) then
      return getElementsWithinRange(arg0, arg1, arg2, 20, "marker", getElementInterior(localPlayer), (getElementDimension(localPlayer)))[forvar12]
    end
  end
end
function findPlayer(arg0, arg1, arg2)
  if string.find(tostring(arg0) .. tostring(arg1) .. tostring(arg2), "nan", 1, true) then
    return false
  end
  for forvar9 = 1, #getElementsWithinRange(arg0, arg1, arg2, 20, "player", getElementInterior(localPlayer), (getElementDimension(localPlayer))) do
    if isPedDead(getElementsWithinRange(arg0, arg1, arg2, 20, "player", getElementInterior(localPlayer), (getElementDimension(localPlayer)))[forvar9]) and tonumber(getElementPosition(getElementsWithinRange(arg0, arg1, arg2, 20, "player", getElementInterior(localPlayer), (getElementDimension(localPlayer)))[forvar9])) and tonumber(getElementPosition(getElementsWithinRange(arg0, arg1, arg2, 20, "player", getElementInterior(localPlayer), (getElementDimension(localPlayer)))[forvar9])) and tonumber(getElementPosition(getElementsWithinRange(arg0, arg1, arg2, 20, "player", getElementInterior(localPlayer), (getElementDimension(localPlayer)))[forvar9])) and tonumber(arg0) and tonumber(arg1) and tonumber(arg2) then
      if (getDistanceBetweenPoints3D(tonumber(getElementPosition(getElementsWithinRange(arg0, arg1, arg2, 20, "player", getElementInterior(localPlayer), (getElementDimension(localPlayer)))[forvar9])) or 0, tonumber(getElementPosition(getElementsWithinRange(arg0, arg1, arg2, 20, "player", getElementInterior(localPlayer), (getElementDimension(localPlayer)))[forvar9])) or 0, tonumber(getElementPosition(getElementsWithinRange(arg0, arg1, arg2, 20, "player", getElementInterior(localPlayer), (getElementDimension(localPlayer)))[forvar9])) or 0, tonumber(arg0), tonumber(arg1), tonumber(arg2)) or 0) <= 1.5 then
        return getElementsWithinRange(arg0, arg1, arg2, 20, "player", getElementInterior(localPlayer), (getElementDimension(localPlayer)))[forvar9]
      end
    end
  end
  return _FOR_
end
function findObject(arg0, arg1, arg2)
  if string.find(tostring(arg0) .. tostring(arg1) .. tostring(arg2), "nan", 1, true) then
    return false
  end
  for forvar9 = 1, #getElementsWithinRange(arg0, arg1, arg2, 20, "object", getElementInterior(localPlayer), (getElementDimension(localPlayer))) do
    if tonumber(getElementPosition(getElementsWithinRange(arg0, arg1, arg2, 20, "object", getElementInterior(localPlayer), (getElementDimension(localPlayer)))[forvar9])) and tonumber(getElementPosition(getElementsWithinRange(arg0, arg1, arg2, 20, "object", getElementInterior(localPlayer), (getElementDimension(localPlayer)))[forvar9])) and tonumber(getElementPosition(getElementsWithinRange(arg0, arg1, arg2, 20, "object", getElementInterior(localPlayer), (getElementDimension(localPlayer)))[forvar9])) and tonumber(arg0) and tonumber(arg1) and tonumber(arg2) then
      if (getElementData(getElementsWithinRange(arg0, arg1, arg2, 20, "object", getElementInterior(localPlayer), (getElementDimension(localPlayer)))[forvar9], "item:data") or getElementData(getElementsWithinRange(arg0, arg1, arg2, 20, "object", getElementInterior(localPlayer), (getElementDimension(localPlayer)))[forvar9], "rightclick:menu")) and (getDistanceBetweenPoints3D(tonumber(getElementPosition(getElementsWithinRange(arg0, arg1, arg2, 20, "object", getElementInterior(localPlayer), (getElementDimension(localPlayer)))[forvar9])) or 0, tonumber(getElementPosition(getElementsWithinRange(arg0, arg1, arg2, 20, "object", getElementInterior(localPlayer), (getElementDimension(localPlayer)))[forvar9])) or 0, tonumber(getElementPosition(getElementsWithinRange(arg0, arg1, arg2, 20, "object", getElementInterior(localPlayer), (getElementDimension(localPlayer)))[forvar9])) or 0, tonumber(arg0), tonumber(arg1), tonumber(arg2)) or 0) <= getElementRadius(getElementsWithinRange(arg0, arg1, arg2, 20, "object", getElementInterior(localPlayer), (getElementDimension(localPlayer)))[forvar9]) + 0.05 then
        return getElementsWithinRange(arg0, arg1, arg2, 20, "object", getElementInterior(localPlayer), (getElementDimension(localPlayer)))[forvar9]
      end
    end
  end
  return _FOR_
end
function findPickup(arg0, arg1, arg2)
  if string.find(tostring(arg0) .. tostring(arg1) .. tostring(arg2), "nan", 1, true) then
    return false
  end
  for forvar9 = 1, #getElementsWithinRange(arg0, arg1, arg2, 20, "pickup", getElementInterior(localPlayer), (getElementDimension(localPlayer))) do
    if tonumber(getElementPosition(getElementsWithinRange(arg0, arg1, arg2, 20, "pickup", getElementInterior(localPlayer), (getElementDimension(localPlayer)))[forvar9])) and tonumber(getElementPosition(getElementsWithinRange(arg0, arg1, arg2, 20, "pickup", getElementInterior(localPlayer), (getElementDimension(localPlayer)))[forvar9])) and tonumber(getElementPosition(getElementsWithinRange(arg0, arg1, arg2, 20, "pickup", getElementInterior(localPlayer), (getElementDimension(localPlayer)))[forvar9])) and tonumber(arg0) and tonumber(arg1) and tonumber(arg2) then
      if (getDistanceBetweenPoints3D(tonumber(getElementPosition(getElementsWithinRange(arg0, arg1, arg2, 20, "pickup", getElementInterior(localPlayer), (getElementDimension(localPlayer)))[forvar9])) or 0, tonumber(getElementPosition(getElementsWithinRange(arg0, arg1, arg2, 20, "pickup", getElementInterior(localPlayer), (getElementDimension(localPlayer)))[forvar9])) or 0, tonumber(getElementPosition(getElementsWithinRange(arg0, arg1, arg2, 20, "pickup", getElementInterior(localPlayer), (getElementDimension(localPlayer)))[forvar9])) or 0, tonumber(arg0), tonumber(arg1), tonumber(arg2)) or 0) <= 1.2 then
        return getElementsWithinRange(arg0, arg1, arg2, 20, "pickup", getElementInterior(localPlayer), (getElementDimension(localPlayer)))[forvar9]
      end
    end
  end
  return _FOR_
end
function findMarker(arg0, arg1, arg2)
  if string.find(tostring(arg0) .. tostring(arg1) .. tostring(arg2), "nan", 1, true) then
    return false
  end
  for forvar9 = 1, #getElementsWithinRange(arg0, arg1, arg2, 20, "marker", getElementInterior(localPlayer), (getElementDimension(localPlayer))) do
    if tonumber(getElementPosition(getElementsWithinRange(arg0, arg1, arg2, 20, "marker", getElementInterior(localPlayer), (getElementDimension(localPlayer)))[forvar9])) and tonumber(getElementPosition(getElementsWithinRange(arg0, arg1, arg2, 20, "marker", getElementInterior(localPlayer), (getElementDimension(localPlayer)))[forvar9])) and tonumber(getElementPosition(getElementsWithinRange(arg0, arg1, arg2, 20, "marker", getElementInterior(localPlayer), (getElementDimension(localPlayer)))[forvar9])) and tonumber(arg0) and tonumber(arg1) and tonumber(arg2) then
      if (getDistanceBetweenPoints3D(tonumber(getElementPosition(getElementsWithinRange(arg0, arg1, arg2, 20, "marker", getElementInterior(localPlayer), (getElementDimension(localPlayer)))[forvar9])) or 0, tonumber(getElementPosition(getElementsWithinRange(arg0, arg1, arg2, 20, "marker", getElementInterior(localPlayer), (getElementDimension(localPlayer)))[forvar9])) or 0, tonumber(getElementPosition(getElementsWithinRange(arg0, arg1, arg2, 20, "marker", getElementInterior(localPlayer), (getElementDimension(localPlayer)))[forvar9])) or 0, tonumber(arg0), tonumber(arg1), tonumber(arg2)) or 0) <= getMarkerSize(getElementsWithinRange(arg0, arg1, arg2, 20, "marker", getElementInterior(localPlayer), (getElementDimension(localPlayer)))[forvar9]) + 0.2 then
        return getElementsWithinRange(arg0, arg1, arg2, 20, "marker", getElementInterior(localPlayer), (getElementDimension(localPlayer)))[forvar9]
      end
    end
  end
  return _FOR_
end
addEventHandler("onClientElementMenuClick", localPlayer, function(arg0, arg1, arg2)
end)
function addInteractOption(arg0, arg1)
  if var0.currentElement ~= arg0 then
    return false
  end
  if string.find(arg1.text, "Admin", 1, true) and not exports.hud:getHudSetting("admintag") then
    return false
  end
  for forvar7, forvar8 in ipairs(var0.currentOptions or {}) do
    if forvar8.Text == arg1.text then
      return false
    end
  end
  if var0.currentOptions then
    table.insert(var0.currentOptions, {
      Text = arg1.text,
      Data = arg1.data
    })
  end
end
function executeInteractOption(arg0, arg1)
  triggerEvent("onClientElementMenuClick", localPlayer, arg0, arg1.text, arg1.data)
  if not isElementLocal(arg0) then
    triggerLatentServerEvent("onClientElementMenuClick:Server", var0, false, localPlayer, arg0, arg1.text, arg1.data)
  end
end
addEvent("interaction:addInteractOption", true)
addEventHandler("interaction:addInteractOption", root, function(arg0, arg1)
  addInteractOption(arg0, arg1)
end)
addEvent("interaction:addInteractOptions", true)
addEventHandler("interaction:addInteractOptions", root, function(arg0, arg1)
  for forvar5 = 1, #arg1 do
    addInteractOption(arg0, arg1[forvar5])
  end
end)
function UIKitReady()
  eui = exports.UIKit
  menu_bg = eui:getUIImage("gradient_x")
end
addEventHandler("onClientUIReady", resourceRoot, UIKitReady)
addEvent("onClientUIKitReady", true)
addEventHandler("onClientUIKitReady", root, UIKitReady)
;({
  active = false,
  status = false,
  currentElement = false,
  currentOptions = {},
  pos = {0, 0},
  hovered = 0,
  isHoveredMenu = 0,
  title = ""
}).render = function()
  if isCursorShowing() then
    if isElement(var0.currentElement) then
      dxDrawText(var0.title, unpack(var0.pos))
      if isMouseInPosition(unpack(var0.pos)) then
        var0.isHoveredMenu = true
      else
        var0.isHoveredMenu = false
      end
      var0.hovered = 0
      for forvar14 = 1, #var0.currentOptions do
        if isMouseInPosition(unpack(var0.pos)) then
          var0.hovered = forvar14
          dxDrawRoundedRectangle(unpack(var0.pos))
          dxDrawCircle(unpack(var0.pos) + 10, unpack(var0.pos) + 25 + 28 / 2, 3, 0, 360, tocolor(255, 255, 255), tocolor(255, 255, 255), 32, 1, true)
          dxDrawText(tostring(var0.currentOptions[forvar14].Data and var0.currentOptions[forvar14].Data.label or var0.currentOptions[forvar14].Text), unpack(var0.pos) + 25, unpack(var0.pos) + 25, unpack(var0.pos) + 180, unpack(var0.pos) + 25 + 28, string.find(tostring(var0.currentOptions[forvar14].Text), "Admin", 1, true) and tocolor(255, 0, 0, 255) or tocolor(255, 255, 255, 255), 1, "default-bold", "left", "center", true, false, true, true, false)
        else
          dxDrawRoundedRectangle(unpack(var0.pos))
          dxDrawText(tostring(var0.currentOptions[forvar14].Data and var0.currentOptions[forvar14].Data.label or var0.currentOptions[forvar14].Text), unpack(var0.pos) + 10, unpack(var0.pos) + 25, unpack(var0.pos) + 180, unpack(var0.pos) + 25 + 28, string.find(tostring(var0.currentOptions[forvar14].Text), "Admin", 1, true) and tocolor(255, 0, 0, 150) or tocolor(255, 255, 255, 150), 1, "default-bold", "left", "center", true, false, true, true, false)
        end
      end
    else
      hideInteract()
    end
  else
    hideInteract()
  end
end
function dxDrawEmptyLine(arg0, arg1, arg2, arg3, arg4, arg5)
  dxDrawLine(arg0, arg1, arg0 + arg2, arg1, arg4, arg5, true)
  dxDrawLine(arg0, arg1, arg0, arg1 + arg3, arg4, arg5, true)
  dxDrawLine(arg0, arg1 + arg3, arg0 + arg2, arg1 + arg3, arg4, arg5, true)
  dxDrawLine(arg0 + arg2, arg1, arg0 + arg2, arg1 + arg3, arg4, arg5, true)
end
function dxDrawRoundedRectangle(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7)
-- fail 16
null
8
  arg2, arg3, arg0, arg1 = arg2 - arg5 * 2, arg3 - arg5 * 2, math.floor(arg0 + arg5), math.floor(arg1 + arg5)
  dxDrawRectangle(arg0 - arg5, arg1, arg2 + arg5 * 2, arg3, arg4, arg6)
  dxDrawRectangle(arg0, arg1 - arg5, arg2, arg5, arg4, arg6)
  dxDrawRectangle(arg0, arg1 + arg3, arg2, arg5, arg4, arg6)
  if ({
    up = {right = true, left = true},
    down = {right = true, left = true}
  }).up.left then
    dxDrawCircle(arg0, arg1, arg5, 180, 270, arg4, arg4, 7, _, arg6)
  else
    dxDrawRectangle(arg0 - arg5, arg1 - arg5, arg5, arg5, arg4, arg6)
  end
  if ({
    up = {right = true, left = true},
    down = {right = true, left = true}
  }).up.right then
    dxDrawCircle(arg0 + arg2, arg1, arg5, 270, 360, arg4, arg4, 7, _, arg6)
  else
    dxDrawRectangle(arg0 + arg2, arg1 - arg5, arg5, arg5, arg4, arg6)
  end
  if ({
    up = {right = true, left = true},
    down = {right = true, left = true}
  }).down.left then
    dxDrawCircle(arg0, arg1 + arg3, arg5, 90, 180, arg4, arg4, 7, _, arg6)
  else
    dxDrawRectangle(arg0 - arg5, arg1 + arg3, arg5, arg5, arg4, arg6)
  end
  if ({
    up = {right = true, left = true},
    down = {right = true, left = true}
  }).down.right then
    dxDrawCircle(arg0 + arg2, arg1 + arg3, arg5, 0, 90, arg4, arg4, 7, _, arg6)
  else
    dxDrawRectangle(arg0 + arg2, arg1 + arg3, arg5, arg5, arg4, arg6)
  end
end
function isMouseInPosition(arg0, arg1, arg2, arg3)
  if isCursorShowing() and arg0 <= getCursorPosition() * var0 and arg1 <= getCursorPosition() * var1 and getCursorPosition() * var0 <= arg0 + arg2 and getCursorPosition() * var1 <= arg1 + arg3 then
    return true
  end
  return false
end
addEventHandler("onClientRender", root, function()
  if not var0.currentOptions and isCursorShowing() and processLineOfSight(getCameraMatrix()) and isElement(processLineOfSight(getCameraMatrix())) and getElementType(processLineOfSight(getCameraMatrix())) == "object" and getElementData(processLineOfSight(getCameraMatrix())) and getElementData(processLineOfSight(getCameraMatrix())).Name then
    title = tostring(getElementData(processLineOfSight(getCameraMatrix())).Name)
    if title ~= "" and getScreenFromWorldPosition(processLineOfSight(getCameraMatrix())) and getScreenFromWorldPosition(processLineOfSight(getCameraMatrix())) and getScreenFromWorldPosition(processLineOfSight(getCameraMatrix())) <= 10 then
      dxDrawRectangle(getScreenFromWorldPosition(processLineOfSight(getCameraMatrix())) - (dxGetTextWidth(title, 1, "default") + 20) / 2, getScreenFromWorldPosition(processLineOfSight(getCameraMatrix())) - (dxGetFontHeight(1, "default") * #split(title, "\n") + 10) - 3, dxGetTextWidth(title, 1, "default") + 20, dxGetFontHeight(1, "default") * #split(title, "\n") + 10, tocolor(0, 0, 0, 150), true)
      dxDrawText(title, getScreenFromWorldPosition(processLineOfSight(getCameraMatrix())) - (dxGetTextWidth(title, 1, "default") + 20) / 2, getScreenFromWorldPosition(processLineOfSight(getCameraMatrix())) - (dxGetFontHeight(1, "default") * #split(title, "\n") + 10) - 3, getScreenFromWorldPosition(processLineOfSight(getCameraMatrix())) - (dxGetTextWidth(title, 1, "default") + 20) / 2 + (dxGetTextWidth(title, 1, "default") + 20), getScreenFromWorldPosition(processLineOfSight(getCameraMatrix())) - (dxGetFontHeight(1, "default") * #split(title, "\n") + 10) - 3 + (dxGetFontHeight(1, "default") * #split(title, "\n") + 10), tocolor(255, 255, 255, 210), 1, "default", "center", "center", false, false, true, false, false)
    end
  end
end)
addCommandHandler("nearbyitems", function()
  if not getElementData(localPlayer, "character:id") then
    return
  end
  for forvar11, forvar12 in ipairs((getElementsWithinRange(getElementPosition(localPlayer)))) do
    if not getElementData(forvar12, "custom.interior") and not isElementLocal(forvar12) and tonumber(getElementPosition(forvar12)) and tonumber(getElementPosition(forvar12)) and tonumber(getElementPosition(forvar12)) then
      if (getDistanceBetweenPoints3D(tonumber(getElementPosition(forvar12)) or 0, tonumber(getElementPosition(forvar12)) or 0, tonumber(getElementPosition(forvar12)) or 0, getElementPosition(localPlayer)) or 0) <= 5 then
        table.insert({}, {
          forvar12,
          getElementData(forvar12, "item:data") or {}
        })
      end
    end
  end
  outputChatBox("Nearby Items:", 255, 55, 95)
  for forvar11 = 1, #{} do
    if getElementID(({})[forvar11][1]) and string.find(getElementID(({})[forvar11][1]), "M.E.O:", 1, true) then
      outputChatBox("  Item ID: " .. tostring((getElementID(({})[forvar11][1]))) .. " | Item name: " .. tostring(({})[forvar11][2].Name or "N/A"), 255, 55, 95)
    end
  end
end, false, false)
