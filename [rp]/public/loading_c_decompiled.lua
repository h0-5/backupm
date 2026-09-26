-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

function UIKitReady()
  eui = exports.UIKit
  var0.UI.loading = eui:uiCreateLoading(false, false, 64, 64, var0.color)
  eui:uiSetVisible(var0.UI.loading, false)
  var1.UI.container = eui:uiCreateRectangle(false, eui:uiGetReferenceScreenSize() - 80, 300, 60, "bg_default", true, true, true, true)
  eui:uiSetVisible(var1.UI.container, false)
  var1.UI.text = eui:uiCreateLabel(20, 10, 260, 20, "test", tocolor(255, 255, 255), "center", "center", var1.UI.container)
  var1.UI.progress = eui:uiCreateProgressBar(20, 40, 260, 5, _, var1.UI.container)
  eui:uiSetProperty(var1.UI.progress, "background_color", tocolor(0, 0, 0, 255))
  eui:uiSetProperty(var1.UI.progress, "progress_animation", true)
  eui:uiSetProperty(var1.UI.progress, "show_progress", false)
  var2.UI.container = eui:uiCreateRectangle(20, eui:uiGetReferenceScreenSize() - 400, 90, 30, "bg_default", true, true, true, true)
  eui:uiSetVisible(var2.UI.container, false)
  eui:uiCreateImage(5, 5, 20, 20, ":assets/icons/timer.png", var2.UI.container)
  var2.UI.text = eui:uiCreateLabel(45, 1, 45, 30, "00:00", tocolor(255, 255, 255), "left", "center", var2.UI.container)
end
addEventHandler("onClientUIReady", resourceRoot, UIKitReady)
addEvent("onClientUIKitReady", true)
addEventHandler("onClientUIKitReady", root, UIKitReady)
function loading(arg0, arg1, arg2)
  if arg1 then
  else
  end
  var0.queue[arg0] = {status = arg1, resource = sourceResource} or nil
  if arg2 then
    var0.color = arg2
  end
  if arg1 then
    eui:uiSetVisible(var0.UI.loading, true)
    eui:uiBringToFront(var0.UI.loading)
  else
    for forvar6, forvar7 in pairs(var0.queue) do
      return
    end
    eui:uiSetVisible(var0.UI.loading, false)
  end
end
function progress(arg0, arg1, arg2, arg3, arg4)
  if arg1 then
    eui:uiProgressBarSetProgress(var0.UI.progress, arg2)
    eui:uiSetText(var0.UI.text, arg3)
    eui:uiSetVisible(var0.UI.container, true)
    var0.current_id = arg0
  else
    eui:uiSetVisible(var0.UI.container, false)
    if var0.current_id == arg0 then
      var0.current_id = false
    end
  end
end
addEventHandler("onClientResourceStop", root, function(arg0)
  for forvar4, forvar5 in pairs(var0.queue) do
    if forvar5 and forvar5.resource == arg0 then
      var0.queue[forvar4] = nil
      break
    end
  end
end)
function showTimer(arg0, arg1, arg2, arg3, arg4)
  if isTimer(var0.timer) then
    killTimer(var0.timer)
  end
  if var0.sound then
    stopSound(var0.sound)
    var0.sound = nil
  end
  if arg1 then
    var0.seconds = arg2
    eui:uiSetVisible(var0.UI.container, true)
    eui:uiSetText(var0.UI.text, msToTimeStr(var0.seconds))
    var0.timer = setTimer(function(arg0, arg1)
      var0.seconds = var0.seconds - 1
      eui:uiSetText(var0.UI.text, msToTimeStr(var0.seconds))
      if var0.seconds == 10 then
        if var1 then
          var0.sound = playSound(":assets/sounds/countdown_10.mp3")
        end
      elseif var0.seconds < 10 then
        eui:uiLabelApplyShakeAnimation(var0.UI.text)
      end
      if arg1 and var0.seconds < 0 then
        showTimer(arg0, false)
      end
    end, 1000, arg2 + 1, arg0, arg3)
  else
    eui:uiSetVisible(var0.UI.container, false)
  end
end
function msToTimeStr(arg0)
  arg0 = tonumber(arg0)
  arg0 = math.floor(arg0)
  if not arg0 then
    return ""
  end
  if arg0 < 0 then
    return "00", "00", "00"
  end
  if #tostring(math.fmod(arg0, 60)) == 1 then
  end
  if #tostring(math.fmod(math.floor(arg0 / 60), 60)) == 1 then
  end
  if #tostring(math.floor(arg0 / 3600)) == 1 then
  end
  return ("0" .. tostring(math.fmod(math.floor(arg0 / 60), 60))) .. ":" .. "0" .. tostring(math.fmod(arg0, 60))
end
