-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

addEventHandler("onClientResourceStart", resourceRoot, function()
end)
function init_markers()
  for forvar3, forvar4 in ipairs(var0) do
    setObjectScale(createObject(2912, forvar4.down[1], forvar4.down[2], forvar4.down[3] - 2), 0)
    setElementAlpha(createObject(2912, forvar4.down[1], forvar4.down[2], forvar4.down[3] - 2), 0)
    setElementInterior(createObject(2912, forvar4.down[1], forvar4.down[2], forvar4.down[3] - 2), 1)
    setElementDimension(createObject(2912, forvar4.down[1], forvar4.down[2], forvar4.down[3] - 2), 1)
    setElementCollisionsEnabled(createObject(2912, forvar4.down[1], forvar4.down[2], forvar4.down[3] - 2), false)
    var1[createMarker(forvar4.down[1], forvar4.down[2], forvar4.down[3], "corona", 0.5, 0, 255, 0, 0)] = {
      "down",
      forvar3,
      (createObject(2912, forvar4.down[1], forvar4.down[2], forvar4.down[3] - 2))
    }
    var1[createMarker(forvar4.up[1], forvar4.up[2], forvar4.up[3], "corona", 0.5, 0, 255, 0, 0)] = {
      "up",
      forvar3,
      (createObject(2912, forvar4.down[1], forvar4.down[2], forvar4.down[3] - 2))
    }
  end
end
init_markers()
function useLadderBind(arg0, arg1, arg2)
  if unpack(var0[arg2]) == "down" then
    setElementPosition(unpack(var0[arg2]))
    setElementDimension(unpack(var0[arg2]))
    setElementInterior(unpack(var0[arg2]))
    attachElements(localPlayer, unpack(var0[arg2]))
    setElementPosition(localPlayer, var1[unpack(var0[arg2])][unpack(var0[arg2])][1], var1[unpack(var0[arg2])][unpack(var0[arg2])][2], getElementPosition(localPlayer))
    setElementRotation(localPlayer, 0, 0, var1[unpack(var0[arg2])].rotation)
    triggerServerEvent("ladder:use", localPlayer, {
      var3,
      "IDLE_ladders",
      math.abs(var1[unpack(var0[arg2])].down[3] - var1[unpack(var0[arg2])].up[3]) / 13 * var2,
      true,
      true,
      false,
      false,
      250
    })
    moveObject(unpack(var0[arg2]))
    setTimer(function()
      setElementPosition(localPlayer, var0.up[1], var0.up[2], var0.up[3])
      setElementDimension(var1, var2 + 1)
      setElementInterior(var1, var3 + 1)
      detachElements(localPlayer)
    end, math.abs(var1[unpack(var0[arg2])].down[3] - var1[unpack(var0[arg2])].up[3]) / 13 * var2, 1)
  elseif unpack(var0[arg2]) == "up" then
    setElementPosition(unpack(var0[arg2]))
    setElementDimension(unpack(var0[arg2]))
    setElementInterior(unpack(var0[arg2]))
    attachElements(localPlayer, unpack(var0[arg2]))
    setElementPosition(localPlayer, var1[unpack(var0[arg2])].down[1], var1[unpack(var0[arg2])].down[2], getElementPosition(localPlayer) - 1)
    setElementRotation(localPlayer, 0, 0, var1[unpack(var0[arg2])].rotation)
    triggerServerEvent("ladder:use", localPlayer, {
      var3,
      "IDLE_laddersReverse",
      math.abs(var1[unpack(var0[arg2])].down[3] - var1[unpack(var0[arg2])].up[3]) / 13 * var2,
      true,
      true,
      false,
      false,
      250
    })
    moveObject(unpack(var0[arg2]))
    setTimer(function()
      setElementPosition(localPlayer, var0.down[1], var0.down[2], var0.down[3])
      setElementDimension(var1, var2 + 1)
      setElementInterior(var1, var3 + 1)
      detachElements(localPlayer)
    end, math.abs(var1[unpack(var0[arg2])].down[3] - var1[unpack(var0[arg2])].up[3]) / 13 * var2, 1)
  end
  unbindKey("E", "down", useLadderBind, source)
  exports.notifications:hideKeyDescription("ladder")
end
addEventHandler("onClientMarkerHit", resourceRoot, function(arg0)
  if arg0 ~= localPlayer then
    return
  end
  if not var0[source] then
    return
  end
  exports.notifications:showKeyDescription("ladder", "E", "Use Ladder / \216\167\216\179\216\170\216\174\216\175\216\167\217\133 \216\167\217\132\216\179\217\132\217\133")
  bindKey("E", "down", useLadderBind, source)
end)
addEventHandler("onClientMarkerLeave", resourceRoot, function(arg0)
  if arg0 ~= localPlayer then
    return
  end
  if not var0[source] then
    return
  end
  unbindKey("E", "down", useLadderBind, source)
  exports.notifications:hideKeyDescription("ladder")
end)
