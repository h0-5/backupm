-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

addEvent("jail:showTimer", true)
addEventHandler("jail:showTimer", localPlayer, function(arg0)
  var0.totalTime = arg0.totalTime
  var0.count = getTickCount()
  var0.reason = arg0.reason
  var0.admin = arg0.adminAccount
  var0.remainTime = arg0.remainTime
  if var0.remainTime >= 0 then
    removeEventHandler("onClientRender", root, renderPrisonText)
    if not var0.inside then
      addEventHandler("onClientRender", root, renderPrisonText)
      addEventHandler("onClientKey", root, cancelKeys)
      var0.inside = true
    end
  end
end)
function hideJailTimer()
  removeEventHandler("onClientRender", root, renderPrisonText)
  if var0.inside then
    removeEventHandler("onClientRender", root, renderPrisonText)
    removeEventHandler("onClientKey", root, cancelKeys)
    var0.inside = false
  end
end
addEvent("jail:hideTimer", true)
addEventHandler("jail:hideTimer", localPlayer, hideJailTimer)
addEvent("onClientPlayerQuitFromCharacter", true)
addEventHandler("onClientPlayerQuitFromCharacter", localPlayer, hideJailTimer)
function renderPrisonText()
  if var0.totalTime > 0 then
  end
  dxDrawRoundedRectangle(var1, var2, var3, var4, tocolor(0, 0, 0, 180), 10)
  dxDrawText("#ff0000Admin Jail" .. [[

(( #ffffff]] .. tostring((convertTimeToString(var0.remainTime - (getTickCount() - var0.count) / 1000))) .. "#ff0000 ))" .. [[

#ff0000Reason: #ffffff]] .. tostring(var0.reason) .. "" .. [[

#ff0000Jailed by #ffffff]] .. tostring(var0.admin) .. "", var1, var2, var1 + var3, var2 + var4, tocolor(255, 255, 255, 255), 1.2, "default", "center", "center", false, false, false, true, false)
end
function dxDrawRoundedRectangle(arg0, arg1, arg2, arg3, arg4, arg5)
  arg2 = arg2 - arg5 * 2
  arg3 = arg3 - arg5 * 2
  arg0 = arg0 + arg5
  arg1 = arg1 + arg5
  if arg2 >= 0 and arg3 >= 0 then
    dxDrawRectangle(arg0, arg1, arg2, arg3, arg4)
    dxDrawRectangle(arg0, arg1 - arg5, arg2, arg5, arg4)
    dxDrawRectangle(arg0, arg1 + arg3, arg2, arg5, arg4)
    dxDrawRectangle(arg0 - arg5, arg1, arg5, arg3, arg4)
    dxDrawRectangle(arg0 + arg2, arg1, arg5, arg3, arg4)
    dxDrawCircle(arg0, arg1, arg5, 180, 270, arg4, arg4, 7)
    dxDrawCircle(arg0 + arg2, arg1, arg5, 270, 360, arg4, arg4, 7)
    dxDrawCircle(arg0 + arg2, arg1 + arg3, arg5, 0, 90, arg4, arg4, 7)
    dxDrawCircle(arg0, arg1 + arg3, arg5, 90, 180, arg4, arg4, 7)
  end
end
function convertTimeToString(arg0)
  arg0 = tonumber(arg0)
  if math.floor(arg0 / (24 * (60 * 60))) == 0 then
    if math.floor(arg0 % (24 * (60 * 60)) / (60 * 60)) == 0 then
      return math.floor(arg0 % (24 * (60 * 60)) % (60 * 60) / 60) .. " minutes " .. math.ceil(arg0 % (24 * (60 * 60)) % (60 * 60) % 60) .. " seconds"
    else
      return math.floor(arg0 % (24 * (60 * 60)) / (60 * 60)) .. " hours " .. math.floor(arg0 % (24 * (60 * 60)) % (60 * 60) / 60) .. " minutes"
    end
  else
    return math.floor(arg0 / (24 * (60 * 60))) .. " days " .. math.floor(arg0 % (24 * (60 * 60)) / (60 * 60)) .. " hours"
  end
end
function cancelKeys(arg0, arg1)
  if arg1 and var0[arg0] then
    cancelEvent()
  end
end
