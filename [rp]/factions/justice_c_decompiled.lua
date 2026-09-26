-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

function UIKitReady()
  eui = exports.UIKit
  uiFontSmall = eui:getUIFont("ui-default")
  var0.window[1] = eui:uiCreateWindow(false, eui:uiGetReferenceScreenSize() - 150, 350, 105, {
    en = "Marriage Request",
    ar = "\216\183\217\132\216\168 \216\178\217\136\216\167\216\172"
  })
  eui:uiWindowSetMovable(var0.window[1], false)
  eui:uiSetVisible(var0.window[1], false)
  var0.label[1] = eui:uiCreateLabel(10, 20, 290, 40, "", tocolor(255, 255, 255, 255), "center", "top", var0.window[1])
  var0.button[1] = eui:uiCreateButton(72.5, 70, 100, 30, {en = "Accept", ar = "\217\130\216\168\217\136\217\132"}, _, var0.window[1])
  var0.button[2] = eui:uiCreateButton(177.5, 70, 100, 30, {en = "Reject", ar = "\216\177\217\129\216\182"}, _, var0.window[1])
end
addEventHandler("onClientUIReady", resourceRoot, UIKitReady)
addEventHandler("onClientUIKitReady", root, UIKitReady)
addEvent("justice:marry_request", true)
addEventHandler("justice:marry_request", root, function(arg0)
  if not getElementData(arg0, "character:name") then
    return
  end
  eui:uiSetText(var0.window[1], {
    en = "Marriage Request",
    ar = "\216\183\217\132\216\168 \216\178\217\136\216\167\216\172"
  })
  eui:uiSetVisible(var0.window[1], true)
  eui:uiSetText(var0.label[1], {
    en = "Do you accept marriage from ${color.primary}" .. getElementData(arg0, "character:name"),
    ar = "\217\135\217\132 \216\170\217\130\216\168\217\132 \216\167\217\132\216\178\217\136\216\167\216\172 \217\133\217\134 ${color.primary}" .. getElementData(arg0, "character:name")
  })
  var1 = "marry"
  var2 = source
end)
addEvent("justice:divorce_request", true)
addEventHandler("justice:divorce_request", root, function()
  eui:uiSetText(var0.window[1], {en = "Divorce", ar = "\216\183\217\132\216\167\217\130"})
  eui:uiSetVisible(var0.window[1], true)
  eui:uiSetText(var0.label[1], {
    en = "Do you really want a divorce?",
    ar = "\217\135\217\132 \216\170\216\177\217\138\216\175 \216\167\217\132\216\183\217\132\216\167\217\130 \217\129\216\185\217\132\216\167\217\139\216\159"
  })
  var1 = "divorce"
  var2 = source
end)
addEventHandler("onClientUIClick", root, function()
  if source == var0.button[1] then
    eui:uiSetVisible(var0.window[1], false)
    triggerServerEvent("justice:" .. var1 .. "_request:reply", localPlayer, true, var2)
    var2 = nil
  elseif source == var0.button[2] then
    eui:uiSetVisible(var0.window[1], false)
    triggerServerEvent("justice:" .. var1 .. "_request:reply", localPlayer, false, var2)
    var2 = nil
  end
end)
