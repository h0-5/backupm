-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

function isEventHandlerAdded(arg0, arg1, arg2)
  if type(arg0) == "string" and isElement(arg1) and type(arg2) == "function" and type((getEventHandlers(arg0, arg1))) == "table" and #getEventHandlers(arg0, arg1) > 0 then
    for forvar7, forvar8 in ipairs((getEventHandlers(arg0, arg1))) do
      if forvar8 == arg2 then
        return true
      end
    end
  end
  return false
end
;({
  x = (guiGetScreenSize() - 400) / 2,
  y = guiGetScreenSize() - 150,
  w = 400,
  h = 25,
  total_time = 100,
  count = 0
}).draw = function()
  if isPlayerMapVisible() then
    return
  end
  dxDrawRectangle(var0.x, var0.y, var0.w, var0.h, tocolor(0, 0, 0, 200), true)
  dxDrawRectangle(var0.x + 5, var0.y + 5, interpolateBetween(0, 0, 0, var0.w - 10, 0, 0, (getTickCount() - var0.count) / var0.total_time, "Linear"), var0.h - 10, tocolor(interpolateBetween(255, 0, 0, 0, 255, 0, (getTickCount() - var0.count) / var0.total_time, "Linear")), true)
  dxDrawText("Robbing ... " .. tostring(math.min(100, math.floor((getTickCount() - var0.count) / var0.total_time * 100))) .. "%", var0.x, var0.y, var0.x + var0.w, var0.y + var0.h, tocolor(255, 255, 255, 255), 1, "default-bold", "center", "center", false, false, true, false, false)
  if (getTickCount() - var0.count) / var0.total_time > 1 then
    removeEventHandler("onClientRender", root, var0.draw)
  end
end
addEvent("store-robbery:robbingProcess:show", true)
addEventHandler("store-robbery:robbingProcess:show", localPlayer, function(arg0)
  if not isEventHandlerAdded("onClientRender", root, var0.draw) then
    addEventHandler("onClientRender", root, var0.draw)
  end
  var0.total_time = arg0 * 1000
  var0.count = getTickCount()
end)
addEvent("store-robbery:robbingProcess:hide", true)
addEventHandler("store-robbery:robbingProcess:hide", localPlayer, function(arg0)
  removeEventHandler("onClientRender", root, var0.draw)
end)
