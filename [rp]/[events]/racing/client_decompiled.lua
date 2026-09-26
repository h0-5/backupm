-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

addEvent("racing" .. ":init", true)
addEventHandler("racing" .. ":init", root, function(arg0, arg1)
  var0.vehicle = arg0
  var0.checkpoints = arg1
  var0.current_checkpoint_index = 0
  exports.activities:setCurrentActivityInfo("checkpoints", "0 / " .. #arg1, ":assets/icons/flag.png")
end)
addEvent("onClientActivityStart", true)
addEventHandler("onClientActivityStart", root, function(arg0, arg1)
  if arg0 ~= var0 then
    return
  end
  nextCheckpoint()
end)
function nextCheckpoint()
  var0.current_checkpoint_index = var0.current_checkpoint_index + 1
  if isElement(var0.current_checkpoint_marker) then
    destroyElement(var0.current_checkpoint_marker)
    var0.current_checkpoint_marker = nil
  end
  if var0.checkpoints and var0.checkpoints[var0.current_checkpoint_index] then
    var0.current_checkpoint_marker = createMarker(var0.checkpoints[var0.current_checkpoint_index].x, var0.checkpoints[var0.current_checkpoint_index].y, var0.checkpoints[var0.current_checkpoint_index].z, "checkpoint", var0.checkpoints[var0.current_checkpoint_index].size, 255, 0, 0, 200)
    setElementDimension(var0.current_checkpoint_marker, getElementDimension(localPlayer))
    if var0.current_checkpoint_index == #var0.checkpoints then
      setMarkerIcon(var0.current_checkpoint_marker, "finish")
    elseif var0.checkpoints[var0.current_checkpoint_index + 1] then
      setMarkerIcon(var0.current_checkpoint_marker, "arrow")
      setMarkerTarget(var0.current_checkpoint_marker, var0.checkpoints[var0.current_checkpoint_index + 1].x, var0.checkpoints[var0.current_checkpoint_index + 1].y, var0.checkpoints[var0.current_checkpoint_index + 1].z)
    end
    return true
  elseif var0.current_checkpoint_index >= #var0.checkpoints then
    return false
  end
end
function HitCheckpoint(arg0)
  if arg0 ~= localPlayer then
    return
  end
  if source == var0.current_checkpoint_marker then
    if not isPedInVehicle(arg0) then
      return
    end
    exports.activities:setCurrentActivityInfo("checkpoints", var0.current_checkpoint_index .. " / " .. #var0.checkpoints, ":assets/icons/flag.png")
    if not nextCheckpoint() then
    end
    triggerServerEvent(var1 .. ":update_player_checkpoint", localPlayer)
  end
end
addEventHandler("onClientMarkerHit", resourceRoot, HitCheckpoint)
