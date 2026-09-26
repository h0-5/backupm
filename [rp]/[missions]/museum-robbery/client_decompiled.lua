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
addEvent("museum-robbery" .. ":robbingProcess:show", true)
addEventHandler("museum-robbery" .. ":robbingProcess:show", localPlayer, function(arg0)
  if not isEventHandlerAdded("onClientRender", root, var0.draw) then
    addEventHandler("onClientRender", root, var0.draw)
  end
  var0.total_time = arg0 * 1000
  var0.count = getTickCount()
end)
addEvent("museum-robbery" .. ":robbingProcess:hide", true)
addEventHandler("museum-robbery" .. ":robbingProcess:hide", localPlayer, function(arg0)
  removeEventHandler("onClientRender", root, var0.draw)
end)
addEventHandler("onClientObjectDamage", resourceRoot, function(arg0, arg1)
  if arg1 ~= localPlayer then
    return
  end
  if not getElementID(source) then
    return
  end
  if string.find(getElementID(source), var0 .. ":sec_cam", 1, true) then
    triggerServerEvent(var0 .. ":damageSecurityCam", localPlayer, source)
  end
end)
;({
  x = (guiGetScreenSize() - 400) / 2,
  y = guiGetScreenSize() - 200,
  w = 450,
  h = 50,
  progress = 0
}).draw = function()
  if isPlayerMapVisible() then
    return
  end
  dxDrawRectangle(var0.x, var0.y, var0.w, var0.h, tocolor(0, 0, 0, 200), true)
  dxDrawRectangle(var0.x + 5, var0.y + 5, interpolateBetween(0, 0, 0, var0.w - 10, 0, 0, var0.progress / 100, "Linear"), var0.h - 10, tocolor(interpolateBetween(255, 0, 0, 0, 255, 0, var0.progress / 100, "Linear")), true)
  if var0.progress / 100 > 1 then
    removeEventHandler("onClientRender", root, var0.draw)
  end
end
addEvent("museum-robbery" .. ":show_hostage_progress", true)
addEventHandler("museum-robbery" .. ":show_hostage_progress", localPlayer, function(arg0, arg1)
  if arg0 then
    exports.public:progress(var0 .. ":hostage_progress", true, arg1, "Hostages", tocolor(255, 0, 0))
    var1.progress = arg1
  else
    exports.public:progress(var0 .. ":hostage_progress", false)
  end
end)
addEvent("museum-robbery" .. ":update_hostage_progress", true)
addEventHandler("museum-robbery" .. ":update_hostage_progress", localPlayer, function(arg0)
  var0.progress = arg0
  exports.public:progress(var1 .. ":hostage_progress", true, arg0, "Hostages", tocolor(255, 0, 0))
end)
addEvent("museum-robbery" .. ":gate:minigame", true)
addEventHandler("museum-robbery" .. ":gate:minigame", localPlayer, function(arg0, arg1)
  exports.minigames:startMinigame(arg1, {}, "yacht_robbery_gate")
  current_minigame_object = arg0
end)
addEvent("minigame:onEnd", true)
addEventHandler("minigame:onEnd", localPlayer, function(arg0, arg1, arg2)
  if arg0 == "lockpick" then
    if arg1 == "yacht_robbery_gate" and arg2 then
      if isElement(current_minigame_object) then
        triggerServerEvent(var0 .. ":gate:minigame:callback", localPlayer, current_minigame_object)
      end
      current_minigame_object = nil
    end
  elseif arg0 == "hack" and arg1 == var0 .. ":hack" and arg2 then
    triggerServerEvent(var0 .. ":hack:callback", localPlayer, current_store_id, arg2)
    current_store_id = nil
  end
end)
addEvent("museum-robbery" .. ":hack", true)
addEventHandler("museum-robbery" .. ":hack", localPlayer, function(arg0)
  current_store_id = arg0
  exports.minigames:startMinigame("hack", {}, var0 .. ":hack")
end)
