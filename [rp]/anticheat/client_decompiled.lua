-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

function checkPosition()
  var0, var1, var2 = getElementPosition(localPlayer)
  if getDistanceBetweenPoints3D(getElementPosition(localPlayer)) >= 15 and getDistanceBetweenPoints2D(getElementPosition(localPlayer)) > 5 and getElementDimension(localPlayer) == 0 and getElementInterior(localPlayer) == 0 then
    if isPedInVehicle(localPlayer) then
      if getVehicleType((getPedOccupiedVehicle(localPlayer))) ~= "Plane" and getVehicleType((getPedOccupiedVehicle(localPlayer))) ~= "Helicopter" and getVehicleType((getPedOccupiedVehicle(localPlayer))) ~= "Boat" and getVehicleType((getPedOccupiedVehicle(localPlayer))) ~= "Train" and not isVehicleOnGround((getPedOccupiedVehicle(localPlayer))) and getVehicleController((getPedOccupiedVehicle(localPlayer))) == localPlayer then
        if getTickCount() - var3 > 10000 then
          var4 = 0
        end
        var3, var4 = getTickCount(), var4 + 1
        if var4 >= 10 and getTickCount() - var5 >= 10000 then
          triggerLatentServerEvent("ac:notify", localPlayer)
          var5 = getTickCount()
        end
        return
      end
    elseif not isElementInWater(localPlayer) and not isElementAttached(localPlayer) and not isPedDead(localPlayer) and not getElementData(localPlayer, "temp:superman:flying") and not getElementData(localPlayer, "temp:superman:takingOff") then
      var4 = var4 + 1
      if var4 >= 10 and getTickCount() - var5 >= 10000 then
        triggerLatentServerEvent("ac:notify", localPlayer)
        var5 = getTickCount()
      end
      return
    end
  end
  var4 = math.max(0, var4 - 1)
end
addEventHandler("onClientResourceStart", resourceRoot, function()
  if getElementData(localPlayer, "character:id") then
    if isTimer(check_position_timer) then
      return
    end
    check_position_timer = setTimer(checkPosition, 1500, 0)
  end
  setTimer(hsync, 15000, 0)
end)
addEvent("onClientCharacterSpawn", true)
addEventHandler("onClientCharacterSpawn", localPlayer, function()
  if isTimer(check_position_timer) then
    return
  end
  check_position_timer = setTimer(checkPosition, 1500, 0)
end)
function quitCharacterEvent(arg0)
  if isTimer(check_position_timer) then
    killTimer(check_position_timer)
    check_position_timer = nil
  end
end
addEvent("onClientPlayerQuitFromCharacter", true)
addEventHandler("onClientPlayerQuitFromCharacter", localPlayer, quitCharacterEvent)
function checkTasks()
  if getPedSimplestTask(localPlayer) == "TASK_SIMPLE_IN_AIR" and getPedTask(localPlayer, "primary", 1) == "TASK_COMPLEX_IN_AIR_AND_LAND" then
    if isElementFrozen(localPlayer) then
      if getElementDimension(localPlayer) == 0 and getElementInterior(localPlayer) == 0 and not isPedDead(localPlayer) and not isElementInWater(localPlayer) then
        var0, var1, var2 = getElementPosition(localPlayer)
        if math.abs(getElementPosition(localPlayer) - var2) <= 2 and getDistanceBetweenPoints2D(getElementPosition(localPlayer)) >= 5 and getTickCount() - var3 >= 10000 then
          var3 = getTickCount()
        end
      end
    elseif getElementDimension(localPlayer) == 0 and getElementInterior(localPlayer) == 0 and not isPedDead(localPlayer) and not isElementInWater(localPlayer) then
      var0, var1, var2 = getElementPosition(localPlayer)
      if math.abs(getElementPosition(localPlayer) - var2) <= 2 and getDistanceBetweenPoints2D(getElementPosition(localPlayer)) >= 5 then
        if getTickCount() - var4 > 10000 then
          var5 = 1
        else
          var5 = var5 + 1
        end
        var4 = getTickCount()
        if var5 > 500 and getTickCount() - var3 >= 15000 then
          var3 = getTickCount()
        end
      end
    end
  end
end
addEventHandler("onClientRender", root, checkTasks)
setTimer(function()
  for forvar3, forvar4 in ipairs(getElementsByType("gui-window")) do
    if forvar4 then
      if string.find(string.upper(guiGetText(forvar4)), "SHINE MENU", 1, true) or string.find(string.upper(guiGetText(forvar4)), "MEEV", 1, true) then
        triggerLatentServerEvent("ac:notify_3", localPlayer)
        return
      end
      if not getElementParent(forvar4) then
        triggerLatentServerEvent("ac:notify_3", localPlayer)
        return
      end
      if not getElementParent((getElementParent(forvar4))) or getElementType((getElementParent((getElementParent(forvar4))))) ~= "resource" then
        triggerLatentServerEvent("ac:notify_3", localPlayer)
        return
      end
    end
  end
end, 15000, 0)
setTimer(function()
  for forvar3, forvar4 in ipairs(getElementsByType("gui-button")) do
    if forvar4 and string.find(guiGetText(forvar4), "Explode", 1, true) then
      triggerLatentServerEvent("ac:notify_3", localPlayer)
      return
    end
  end
end, 20000, 0)
setTimer(function()
  if getGravity() < 0.008 and not getElementData(localPlayer, "temp:superman:flying") and not getElementData(localPlayer, "temp:superman:takingOff") then
    triggerLatentServerEvent("ac:notify_4", localPlayer)
    return
  end
  if getGameSpeed() ~= 1 then
    triggerLatentServerEvent("ac:notify_5", localPlayer)
    return
  end
  if getCameraTarget() and getCameraTarget() ~= localPlayer and getElementType((getCameraTarget())) == "player" then
    triggerServerEvent("ac:notify_6", localPlayer, (getCameraTarget()))
  end
end, 5000, 0)
addEventHandler("onClientPlayerWeaponFire", localPlayer, function(arg0)
  if arg0 ~= 0 and (getPedWeaponSlot(localPlayer) == 2 or getPedWeaponSlot(localPlayer) == 3 or getPedWeaponSlot(localPlayer) == 4 or getPedWeaponSlot(localPlayer) == 5 or getPedWeaponSlot(localPlayer) == 6 or getPedWeaponSlot(localPlayer) == 7 or getPedWeaponSlot(localPlayer) == 8) then
    if not exports["weapon-system"]:getCurrentWeapon() then
      triggerServerEvent("ac:notify_7", localPlayer, {
        1,
        arg0,
        (getPedWeaponSlot(localPlayer))
      })
    elseif tonumber(exports["weapon-system"]:getCurrentWeapon().Properties.WeapModel) ~= arg0 then
      triggerServerEvent("ac:notify_7", localPlayer, {
        2,
        arg0,
        (getPedWeaponSlot(localPlayer))
      })
    end
  end
end)
function onPreFunction(arg0, arg1, arg2, arg3, arg4, ...)
  if arg1 == "addDebugHook" then
    if arg0 ~= getThisResource() then
      return "skip"
    end
  elseif arg1 == "cancelEvent" then
    if getResourceName(arg0) == "files-protection" then
      return "skip"
    end
  else
    return "skip"
  end
end
addDebugHook("preFunction", onPreFunction, {
  "addDebugHook",
  "cancelEvent",
  "setPedOnFire"
})
addCommandHandler("vehc", function()
  setElementPosition(getPedOccupiedVehicle(localPlayer), getElementPosition(localPlayer) + 12, getElementPosition(localPlayer))
end, false, false)
addDebugHook("preFunction", function(arg0, arg1, arg2, arg3, arg4, ...)
  if var0[arg1] and not var0[arg1][tostring(getResourceName(arg0))] then
    if arg1 == "setElementPosition" then
      if getElementType(({
        ...
      })[1]) ~= "player" then
        if getElementType(({
          ...
        })[1]) == "vehicle" and not isElementLocal(({
          ...
        })[1]) then
          if not isPedInVehicle(localPlayer) or getPedOccupiedVehicle(localPlayer) ~= ({
            ...
          })[1] then
            triggerLatentServerEvent("ac:n", localPlayer, 14, toJSON({
              "vehicle",
              x,
              y,
              z
            }))
            return "skip"
          elseif getDistanceBetweenPoints3D(getElementPosition(localPlayer)) > 10 then
            triggerLatentServerEvent("ac:n", localPlayer, 14, toJSON({
              "vehicle",
              ({
                ...
              })[2],
              ({
                ...
              })[3],
              ({
                ...
              })[4]
            }))
            return "skip"
          end
        end
        return
      else
        table.insert({
          (tostring(getResourceName(arg0)))
        }, ({
          ...
        })[1] == localPlayer)
      end
    elseif arg1 == "setElementVelocity" then
      if ({
        ...
      })[1] ~= localPlayer then
        return
      end
    elseif arg1 == "attachElements" and ({
      ...
    })[1] ~= localPlayer then
      return
    end
    if var1[arg1] and getTickCount() - var1[arg1] <= 5000 then
      return
    end
    var1[arg1] = getTickCount()
    triggerLatentServerEvent("ac:n", localPlayer, var2[arg1], toJSON({
      (tostring(getResourceName(arg0)))
    }))
    return "skip"
  end
end, {
  "createFire",
  "setPedArmor",
  "setElementVelocity",
  "getPedArmor",
  "setVehicleLocked",
  "setVehicleEngineState",
  "setElementPosition",
  "loadstring",
  "attachElements",
  "blowVehicle",
  "fixVehicle",
  "getPlayerFromName",
  "setVehicleHandling"
})
function hsync()
  triggerLatentServerEvent("hsync", localPlayer)
end
