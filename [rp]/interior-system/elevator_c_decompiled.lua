-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

addEvent("elevator:onClientMarkerHit", true)
addEventHandler("elevator:onClientMarkerHit", localPlayer, function(arg0, arg1)
  var0 = {id = arg0, name = arg1}
  removeEventHandler("onClientRender", root, drawElevatorName)
  addEventHandler("onClientRender", root, drawElevatorName)
  exports.notifications:showDirective("ID#" .. tostring(arg0) .. [[

Press #ff375f'F'#FFFFFF to enter]], tocolor(255, 255, 255, 255))
  if isTimer(var1) then
    killTimer(var1)
    var1 = false
  end
  setPedCanBeKnockedOffBike(localPlayer, false)
end)
addEvent("elevator:onClientMarkerLeave", true)
addEventHandler("elevator:onClientMarkerLeave", localPlayer, function()
  if not var0 then
    return
  end
  removeEventHandler("onClientRender", root, drawElevatorName)
  var0 = false
  exports.notifications:hideDirective()
  if isTimer(var1) then
    killTimer(var1)
  end
  var1 = setTimer(setPedCanBeKnockedOffBike, 1000, 1, localPlayer, true)
end)
function drawElevatorName()
  if not var0 then
    removeEventHandler("onClientRender", root, drawElevatorName)
    return
  end
  dxDrawText(tostring(var0.name), 0, var1 - 60, var2, var1, tocolor(0, 0, 0, 220), 2, "arial", "center", "center", false, false, false, false, false)
  dxDrawText(tostring(var0.name), 0, var1 - 60, var2, var1, tocolor(255, 255, 255, 220), 2, "arial", "center", "center", false, false, false, false, false)
end
