-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

addEvent("sounds:3D:play", true)
addEventHandler("sounds:3D:play", root, function(arg0, arg1, arg2)
  setSoundMaxDistance(playSound3D(arg1.path, arg1.x, arg1.y, arg1.z, arg1.looped), arg1.maxDistance)
  setSoundPosition(playSound3D(arg1.path, arg1.x, arg1.y, arg1.z, arg1.looped), arg2)
  var0[arg0] = playSound3D(arg1.path, arg1.x, arg1.y, arg1.z, arg1.looped)
end)
addEvent("sounds:3D:stop", true)
addEventHandler("sounds:3D:stop", root, function(arg0)
  if var0[arg0] then
    stopSound(var0[arg0])
  end
  var0[arg0] = nil
end)
addEvent("sounds:play", true)
addEventHandler("sounds:play", root, function(arg0, arg1, arg2)
  playSound(arg0, arg1, arg2)
end)
