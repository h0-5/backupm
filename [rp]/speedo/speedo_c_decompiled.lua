-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

speedo = {}
Scnare = {
  right = {
    count = getTickCount(),
    color = false
  },
  left = {
    count = getTickCount(),
    color = false
  }
}
addEventHandler("onClientResourceStart", resourceRoot, function()
  fileClose((fileCreate("tempfile.png")))
  for forvar5, forvar6 in ipairs(var0) do
    if fileExists("" .. tostring(forvar6)) then
      fileWrite(fileOpen("tempfile.png"), (exports["files-protection"]:FileUnProtection(":speedo/" .. tostring(forvar6))))
      fileClose((fileOpen("tempfile.png")))
      var1["" .. tostring(forvar6)] = dxCreateTexture("tempfile.png", "dxt5", true, "clamp")
    end
  end
  fileDelete("tempfile.png")
end)
addEvent("speedo:response.imagesFiles", true)
addEventHandler("speedo:response.imagesFiles", root, function(arg0, arg1)
  if var0 then
    return
  end
  for forvar5, forvar6 in ipairs(arg0) do
    var1["" .. tostring(forvar6)] = dxCreateTexture(arg1["" .. tostring(forvar6)])
    if fileExists("" .. tostring(forvar6)) then
      fileDelete("" .. tostring(forvar6))
    end
  end
  var0 = true
end)
function UIKitReady()
  eui = exports.UIKit
  var0 = eui:getUIFont("hud-large")
  var1 = 1
  var2 = eui:uiGetThemeColor("primary")
end
addEventHandler("onClientUIReady", resourceRoot, UIKitReady)
addEventHandler("onClientUIKitReady", root, UIKitReady)
function updateSVG(arg0)
  xmlNodeSetAttribute(var0, "stroke-dashoffset", (1 - arg0) * 350)
  svgSetDocumentXML(var1, var2)
end
function updateSVG2(arg0)
  xmlNodeSetAttribute(var0, "stroke-dashoffset", 350 - math.min(100, arg0))
  svgSetDocumentXML(var1, var2)
end
addEvent("onClientHudVisibilityChange", false)
addEventHandler("onClientHudVisibilityChange", localPlayer, function(arg0)
  var0 = arg0
end)
function speedo.drawUpdate()
  var2 = var3(var3(var0(var1, "vehicle:total.distance") or 0):sub(1, 6) or "000000")
  var4 = exports["fuel-system"]:getVehiclePercentageFuel(var1) or 0
  var5 = var6(var1)
  updateSVG2(var4)
end
function speedo.draw()
  if not var0 then
    return
  end
  var1 = var2(localPlayer)
  if var1 then
    var3 = getVehicleRPM(var1, var4)
    if var5(var1, "temp:indicator") == 3 and getTickCount() - Scnare.right.count >= 500 then
      Scnare.right.color = not Scnare.right.color
      Scnare.right.count = getTickCount()
    end
    if var5(var1, "temp:indicator") == 2 and 500 <= getTickCount() - Scnare.left.count then
      Scnare.left.color = not Scnare.left.color
      Scnare.left.count = getTickCount()
    end
    var6(var7, var8, var9, var10, var11["arrow.png"], 0, 0, 0, Scnare.right.color and tocolor(0, 255, 0, 220) or tocolor(255, 255, 255, 220), false)
    var6(var12, var8, var9, var10, var11["arrow.png"], 180, 0, 0, Scnare.left.color and tocolor(0, 255, 0, 220) or tocolor(255, 255, 255, 220), false)
    if math.abs(var3 - var13) > 1000 then
      updateSVG(var3 / 10000)
      var13 = var3 / 10000
    end
    var6(var14 - 25 * var15, var16 - 25 * var15, var17 + 50 * var15, var17 + 50 * var15, var18, 10, 0, 0)
    var6(var14, var16, var17, var17, var19)
    var20(var21, var14, var16, var22, var23 - 130 * var15, tocolor(255, 255, 255, 150), var24 * 0.3, var25, "center", "center")
    var20(var26("%03d", (getVehicleSpeed(var1))), var14, var16, var22, var23, tocolor(255, 255, 255, 255), var24, var25, "center", "center")
    var20("KM/H", var14, var16 + 80 * var15, var22, var23, tocolor(255, 255, 255, 100), var24 * 0.6, var25, "center", "center")
    var20("GEAR " .. var27(var4), var14, var16, var22, var23 - 60 * var15, tocolor(255, 255, 255, 150), var24 * 0.4, var25, "center", "bottom")
    var6(var28, var29, var30, var30, var31, 0, 0, 0, tocolor(255, 255, 255, 220))
  else
    removeEventHandler("onClientRender", root, speedo.draw)
    if isTimer(speedo.drawUpdateTimer) then
      killTimer(speedo.drawUpdateTimer)
    end
  end
end
function getVehicleRPM(arg0, arg1)
  if arg0 then
    if getVehicleEngineState(arg0) then
      if arg1 > 0 then
      else
      end
      if var0(getElementSpeed(arg0, "km/h") * 160 + 0.5) < 650 then
      elseif var1(650, 750) >= 9000 then
      end
    else
    end
    return tonumber(0)
  else
    return 0
  end
end
function getElementSpeed(arg0, arg1)
  assert(isElement(arg0), "Bad argument 1 @ getElementSpeed (element expected, got " .. type(arg0) .. ")")
  assert(getElementType(arg0) == "player" or getElementType(arg0) == "ped" or getElementType(arg0) == "object" or getElementType(arg0) == "vehicle" or getElementType(arg0) == "projectile", "Invalid element type @ getElementSpeed (player/ped/object/vehicle/projectile expected, got " .. getElementType(arg0) .. ")")
  assert((arg1 == nil or type(arg1) == "string" or type(arg1) == "number") and (arg1 == nil or tonumber(arg1) and (tonumber(arg1) == 0 or tonumber(arg1) == 1 or tonumber(arg1) == 2) or arg1 == "m/s" or arg1 == "km/h" or arg1 == "mph"), "Bad argument 2 @ getElementSpeed (invalid speed unit)")
  arg1 = arg1 == nil and 0 or tonumber(arg1)
  return (Vector3(getElementVelocity(arg0)) * ((arg1 == 0 or arg1 == "m/s") and 50 or (arg1 == 1 or arg1 == "km/h") and 180 or 111.84681456)).length
end
addEventHandler("onClientResourceStart", resourceRoot, function()
  if isPedInVehicle(localPlayer) and (getVehicleType((var0(localPlayer))) == "Automobile" or getVehicleType((var0(localPlayer))) == "Boat" or getVehicleType((var0(localPlayer))) == "Monster Truck" or getVehicleType((var0(localPlayer))) == "Quad" or getVehicleType((var0(localPlayer))) == "Bike") then
    var1 = exports.hud:isHudShowing()
    addEventHandler("onClientRender", root, speedo.draw, false, "high-2")
    if not isTimer(speedo.drawUpdateTimer) then
      speedo.drawUpdateTimer = setTimer(speedo.drawUpdate, 1000, 0)
    end
  end
end)
addEventHandler("onClientVehicleEnter", root, function(arg0, arg1)
  if arg0 == localPlayer and (getVehicleType(source) == "Automobile" or getVehicleType(source) == "Boat" or getVehicleType(source) == "Monster Truck" or getVehicleType(source) == "Quad" or getVehicleType(source) == "Bike") then
    removeEventHandler("onClientRender", root, speedo.draw)
    var0 = exports.hud:isHudShowing()
    addEventHandler("onClientRender", root, speedo.draw, false, "high-2")
    if not isTimer(speedo.drawUpdateTimer) then
      speedo.drawUpdateTimer = setTimer(speedo.drawUpdate, 1000, 0)
    end
  end
end)
addEventHandler("onClientVehicleStartExit", root, function(arg0, arg1)
  if arg0 == localPlayer and (getVehicleType(source) == "Automobile" or getVehicleType(source) == "Boat" or getVehicleType(source) == "Monster Truck" or getVehicleType(source) == "Quad" or getVehicleType(source) == "Bike") then
    removeEventHandler("onClientRender", root, speedo.draw)
    if isTimer(speedo.drawUpdateTimer) then
      killTimer(speedo.drawUpdateTimer)
    end
  end
end)
function getVehicleSpeed(arg0)
  return math.sqrt((getElementVelocity(arg0) or 0) ^ 2 + (getElementVelocity(arg0) or 0) ^ 2 + (getElementVelocity(arg0) or 0) ^ 2) * 161
end
function ScnareRight()
  if isPedInVehicle(localPlayer) then
    if getVehicleController((var0(localPlayer))) ~= localPlayer then
      return
    end
    Scnare.left.color = false
    Scnare.right.color = false
    if var1(var0(localPlayer), "temp:indicator") ~= 3 then
      setElementData(var0(localPlayer), "temp:indicator", 3)
      triggerServerEvent("speedo:addVehicleSirens", localPlayer, var0(localPlayer), {
        getVehicleDummyPosition(var0(localPlayer), "light_rear_main")
      }, 1)
    else
      setElementData(var0(localPlayer), "temp:indicator", nil)
      triggerServerEvent("speedo:removeVehicleSirens", localPlayer, (var0(localPlayer)))
    end
  end
end
bindKey(".", "down", ScnareRight)
function ScnareLeft()
  if isPedInVehicle(localPlayer) then
    if getVehicleController((var0(localPlayer))) ~= localPlayer then
      return
    end
    Scnare.right.color = false
    Scnare.left.color = false
    if var1(var0(localPlayer), "temp:indicator") ~= 2 then
      setElementData(var0(localPlayer), "temp:indicator", 2)
      triggerServerEvent("speedo:addVehicleSirens", localPlayer, var0(localPlayer), {
        -getVehicleDummyPosition(var0(localPlayer), "light_rear_main"),
        getVehicleDummyPosition(var0(localPlayer), "light_rear_main")
      }, 2)
    else
      setElementData(var0(localPlayer), "temp:indicator", nil)
      triggerServerEvent("speedo:removeVehicleSirens", localPlayer, (var0(localPlayer)))
    end
  end
end
bindKey(",", "down", ScnareLeft)
function toggleCruiseSpeed()
  if not isElement((var0(localPlayer))) then
    return
  end
  if getVehicleType((var0(localPlayer))) == "Automobile" or getVehicleType((var0(localPlayer))) == "Boat" or getVehicleType((var0(localPlayer))) == "Monster Truck" or getVehicleType((var0(localPlayer))) == "Quad" or getVehicleType((var0(localPlayer))) == "Bike" then
    if not var1 then
      if not isElement((var0(localPlayer))) then
        return
      end
      if not getVehicleEngineState((var0(localPlayer))) then
        return
      end
      var2 = math.sqrt(getElementVelocity((var0(localPlayer))) ^ 2 + getElementVelocity((var0(localPlayer))) ^ 2 + getElementVelocity((var0(localPlayer))) ^ 2)
      if var2 < 0.05555555555555555 then
        return
      end
      triggerServerEvent("speedo:enableVehicleCruiseSpeed", var0(localPlayer), true)
      addEventHandler("onClientPreRender", root, cruiseSpeedChecker)
      addEventHandler("onClientVehicleCollision", var0(localPlayer), cruiseSpeedCollisionChecker)
      bindKey("accelerate", "down", toggleCruiseSpeed)
      bindKey("brake_reverse", "down", toggleCruiseSpeed)
    else
      triggerServerEvent("speedo:enableVehicleCruiseSpeed", var0(localPlayer), false)
      removeEventHandler("onClientPreRender", root, cruiseSpeedChecker)
      removeEventHandler("onClientVehicleCollision", var0(localPlayer), cruiseSpeedCollisionChecker)
      unbindKey("accelerate", "down", toggleCruiseSpeed)
      unbindKey("brake_reverse", "down", toggleCruiseSpeed)
    end
    var1 = not var1
  end
end
function cruiseSpeedChecker()
  if not isElement((var0(localPlayer))) or not getVehicleEngineState((var0(localPlayer))) or not not isElementInWater((var0(localPlayer))) then
    if var1 then
      toggleCruiseSpeed()
    end
    return
  end
  if getElementPosition((var0(localPlayer))) - getGroundPosition(getElementPosition((var0(localPlayer)))) >= 5 then
    if var1 then
      toggleCruiseSpeed()
    end
    return
  end
  setElementVelocity(var0(localPlayer), getElementVelocity((var0(localPlayer))) * (1 / math.sqrt(getElementVelocity((var0(localPlayer))) ^ 2 + getElementVelocity((var0(localPlayer))) ^ 2 + getElementVelocity((var0(localPlayer))) ^ 2)) * var2, getElementVelocity((var0(localPlayer))) * (1 / math.sqrt(getElementVelocity((var0(localPlayer))) ^ 2 + getElementVelocity((var0(localPlayer))) ^ 2 + getElementVelocity((var0(localPlayer))) ^ 2)) * var2, getElementVelocity((var0(localPlayer))) * (1 / math.sqrt(getElementVelocity((var0(localPlayer))) ^ 2 + getElementVelocity((var0(localPlayer))) ^ 2 + getElementVelocity((var0(localPlayer))) ^ 2)) * var2)
end
__cruiseSpeedCollisionChecker = {}
function cruiseSpeedCollisionChecker(arg0, arg1)
  if arg1 >= 60 then
    __cruiseSpeedCollisionChecker()
  end
end
setmetatable(__cruiseSpeedCollisionChecker, {
  __call = function()
    toggleCruiseSpeed()
  end
})
function enterVeh()
  bindKey(var0, "down", toggleCruiseSpeed)
  var1 = false
end
addEventHandler("onClientVehicleEnter", root, function(arg0, arg1)
  if arg0 == localPlayer and arg1 == 0 then
    enterVeh()
  end
end)
addEventHandler("onClientResourceStart", resourceRoot, function()
  if isPedInVehicle(localPlayer) and getVehicleController((var0(localPlayer))) == localPlayer then
    enterVeh()
  end
end)
addEventHandler("onClientVehicleExit", root, function(arg0, arg1)
  if arg0 == localPlayer and arg1 == 0 then
    unbindKey(var0, "down", toggleCruiseSpeed)
  end
end)
