-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

addEvent("onClientCharacterSpawn", true)
addEventHandler("onClientCharacterSpawn", localPlayer, function(arg0)
  for forvar4, forvar5 in ipairs(var0) do
    outputChatBox(forvar5, 255, 0, 0, true)
  end
end)
