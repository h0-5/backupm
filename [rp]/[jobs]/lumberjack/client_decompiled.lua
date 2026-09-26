-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

function UIKitReady()
  eui = exports.UIKit
  var0.progressbar[1] = eui:uiCreateProgressBar((eui:uiGetReferenceScreenSize() - 280) / 2, eui:uiGetReferenceScreenSize() - 100, 280, 20, tocolor(100, 20, 0, 240))
  eui:uiSetVisible(var0.progressbar[1], false)
  eui:uiSetProperty(var0.progressbar[1], "background_color", tocolor(20, 20, 20, 240))
  eui:uiSetProperty(var0.progressbar[1], "progress_animation", true)
end
addEventHandler("onClientUIReady", resourceRoot, UIKitReady)
addEventHandler("onClientUIKitReady", root, UIKitReady)
function closeUIWindows(arg0)
  eui:uiSetVisible(var0.progressbar[1], false)
end
addEvent("onClientPlayerQuitFromCharacter", true)
addEventHandler("onClientPlayerQuitFromCharacter", localPlayer, closeUIWindows)
addEventHandler("onClientPlayerWasted", localPlayer, closeUIWindows)
addEvent("Lumberjack:ProgressState", true)
addEventHandler("Lumberjack:ProgressState", root, function(arg0, arg1)
  if isTimer(ProgressTimer) then
    killTimer(ProgressTimer)
  end
  if arg0 == "Show" then
    eui:uiSetVisible(var0.progressbar[1], true)
    eui:uiProgressBarSetProgress(var0.progressbar[1], getElementData(arg1, "WM:CutProgress") or 0)
    ProgressTimer = setTimer(function(arg0)
      eui:uiProgressBarSetProgress(var0.progressbar[1], getElementData(arg0, "WM:CutProgress") or 0)
    end, 2000, 0, arg1)
  elseif arg0 == "Hide" then
    eui:uiSetVisible(var0.progressbar[1], false)
  end
end)
