-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

function getPlayerID(arg0)
  if not var0(arg0) then
    return 10000000
  end
  return var2(arg0, "temp:fake_id") or tonumber((var1(var0(arg0), "player:", "")))
end
guiSetAlpha(guiCreateLabel(guiGetScreenSize() - 85 - 140, guiGetScreenSize() - 15, 150, 15, "RP 2.1.0", false), 0.4)
guiLabelSetHorizontalAlign(guiCreateLabel(guiGetScreenSize() - 85 - 140, guiGetScreenSize() - 15, 150, 15, "RP 2.1.0", false), "right")
addEventHandler("onClientMouseEnter", guiCreateLabel(guiGetScreenSize() - 85 - 140, guiGetScreenSize() - 15, 150, 15, "RP 2.1.0", false), function()
  guiSetAlpha(var0, 0.8)
end)
addEventHandler("onClientMouseLeave", guiCreateLabel(guiGetScreenSize() - 85 - 140, guiGetScreenSize() - 15, 150, 15, "RP 2.1.0", false), function()
  guiSetAlpha(var0, 0.5)
end)
function UIKitReady()
  eui = exports.UIKit
  uiFontSmall = eui:getUIFont("ui-default")
  uiFontLarge = eui:getUIFont("default-large")
  var0.window[1] = eui:uiCreateWindow(false, false, 320, 130, "ROLEPLAY 2.1.0")
  eui:uiWindowSetMovable(var0.window[1], false)
  eui:uiSetVisible(var0.window[1], false)
  var0.label[1] = eui:uiCreateLabel(5, 30, 310, 50, [[
Developed by ${color.primary}H25
#ffffff(Discord: @_h25)]], tocolor(255, 255, 255, 255), "left", "top", var0.window[1])
  eui:uiSetAlign(var0.label[1], "center", "center")
  var0.button[1] = eui:uiCreateButton(5, 95, 310, 30, {en = "Hide", ar = "\216\165\216\174\217\129\216\167\216\161"}, tocolor(0, 0, 0), var0.window[1])
end
addEventHandler("onClientUIReady", resourceRoot, UIKitReady)
addEventHandler("onClientUIKitReady", root, UIKitReady)
addEventHandler("onClientGUIClick", guiCreateLabel(guiGetScreenSize() - 85 - 140, guiGetScreenSize() - 15, 150, 15, "RP 2.1.0", false), function()
  if var0(localPlayer, "character:id") then
    if eui:uiGetVisible(var1.window[1]) then
      eui:uiSetVisible(var1.window[1], false)
    else
      eui:uiSetVisible(var1.window[1], true)
    end
  end
end)
addEventHandler("onClientUIClick", root, function()
  if source == var0.button[1] then
    eui:uiSetVisible(var0.window[1], false)
  end
end)
addEventHandler("onClientPlayerWasted", localPlayer, function(arg0, arg1, arg2, arg3)
  setFreecamEnabled(getElementPosition(localPlayer))
end)
function disable_freecam()
  setFreecamDisabled()
end
addEventHandler("onClientPlayerSpawn", localPlayer, disable_freecam)
addEventHandler("onClientPlayerQuitFromCharacter", root, disable_freecam)
