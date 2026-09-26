-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

addEvent("minigame:onEnd", false)
function startMinigame(arg0, arg1, arg2)
  var0.id = arg0
  var0.data = arg1
  var0.callback_id = arg2
  if arg0 == "key_press" then
    startKeyPressGame(arg1)
  elseif arg0 == "lockpick" then
    startLockpick(arg1)
  elseif arg0 == "hack" then
    startHack(arg1)
  end
end
function stopMinigame()
  if var0.id == "key_press" then
    stopKeyPressGame()
  elseif var0.id == "lockpick" then
    stopLockpick()
  elseif var0.id == "hack" then
    stoptHack()
  end
  var0 = {}
end
function stop_minigames(arg0)
  stopMinigame()
end
addEvent("onClientPlayerQuitFromCharacter", true)
addEventHandler("onClientPlayerQuitFromCharacter", localPlayer, stop_minigames)
addEventHandler("onClientPlayerWasted", localPlayer, stop_minigames)
function onMinigameEnd(arg0)
  triggerEvent("minigame:onEnd", localPlayer, var0.id, var0.callback_id, arg0)
end
function animation(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8)
  if arg1 < getTickCount() - arg0 then
    return arg5, arg6, arg7
  end
  return interpolateBetween(arg2, arg3, arg4, arg5, arg6, arg7, (getTickCount() - arg0) / arg1, arg8)
end
