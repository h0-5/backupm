-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

addEvent("onClientPlayerCompleteHourOfContinousPlay", true)
addEventHandler("onClientPlayerCompleteHourOfContinousPlay", localPlayer, function()
end)
addEvent("onClientPlayerCompleteHourOfPlay", true)
addEventHandler("onClientPlayerCompleteHourOfPlay", localPlayer, function(arg0, arg1)
end)
addEvent("playtime:syncall", true)
addEventHandler("playtime:syncall", localPlayer, function(arg0)
  var0 = arg0
end)
addEvent("playtime:sync", true)
addEventHandler("playtime:sync", root, function(arg0)
  var0[source] = arg0
end)
addEvent("onClientPlayerQuit", false)
addEventHandler("onClientPlayerQuit", root, function()
  var0[source] = nil
end)
function getCurrentPlayTime()
  if not getElementData(localPlayer, "character:id") then
    return 0
  end
  return var0[localPlayer] or 0
end
function getCharacterPlayTime(arg0)
  if not getElementData(arg0, "character:id") then
    return
  end
  seconds = tonumber(getElementData(arg0, "playtime") or 0)
  return math.floor(seconds / (24 * (60 * 60))), math.floor(seconds % (24 * (60 * 60)) / (60 * 60)), math.floor(seconds % (24 * (60 * 60)) % (60 * 60) / 60), (math.ceil(seconds % (24 * (60 * 60)) % (60 * 60) % 60))
end
function getPlayerPlayTime(arg0)
  return var0[arg0] or 0
end
