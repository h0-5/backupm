-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

addEvent("pilot" .. ":start_flight", true)
addEventHandler("pilot" .. ":start_flight", localPlayer, function(arg0)
  exports.public:showTimer(var0 .. ":flight", true, arg0, true)
end)
addEvent("pilot" .. ":end_flight", true)
addEventHandler("pilot" .. ":end_flight", localPlayer, function()
  exports.public:showTimer(var0 .. ":flight", false)
end)
