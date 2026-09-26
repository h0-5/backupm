-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

addEvent("weather:change", true)
addEventHandler("weather:change", localPlayer, function(arg0, arg1)
  setWeather(arg0)
  if arg1 then
    setRainLevel(arg1)
  else
    resetRainLevel(arg1)
  end
end)
