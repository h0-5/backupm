-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

bindKey("y", "down", "chatbox", "radio")
addEvent("onClientUseItem", true)
addEventHandler("onClientUseItem", root, function(arg0, arg1, arg2)
  if arg2.Name == "Radio" then
    exports.notifications:sendNotification("#00FF00Radio", "#FFFFFF- Radio Channel: " .. tostring(arg2.SpecialProperties.channel), 3000)
  end
end)
addEvent("radio:playRadioSound", true)
addEventHandler("radio:playRadioSound", localPlayer, function()
  playSound("radiomsg.mp3")
end)
