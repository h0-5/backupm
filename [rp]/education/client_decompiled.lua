-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

UI = {
  window = {},
  label = {},
  button = {},
  gridlist = {},
  image = {}
}
function UIKitReady()
  eui = exports.UIKit
  UI.window[1] = eui:uiCreateRectangle(false, false, 800, 559, tocolor(15, 15, 15, 240), false, false, false, false)
  eui:uiSetVisible(UI.window[1], false)
  UI.image[1] = eui:uiCreateImage(0, 0, 800, 559, "cert.png", UI.window[1])
  UI.label.cname = eui:uiCreateLabel(15, 220, 460, 30, "Character Name", tocolor(0, 0, 0, 255), "right", "center", UI.image[1])
  eui:uiSetFont(UI.label.cname, "default-large")
  UI.label.cid = eui:uiCreateLabel(15, 279, 630, 30, "#", tocolor(0, 0, 0, 255), "right", "center", UI.image[1])
  eui:uiSetFont(UI.label.cid, "default-large")
  UI.label.issuedAt = eui:uiCreateLabel(15, 427, 660, 30, "dd-mm-yyyy", tocolor(0, 0, 0, 255), "right", "center", UI.image[1])
  eui:uiSetFont(UI.label.issuedAt, "default-large")
  UI.label.expireAt = eui:uiCreateLabel(0, 529, 800, 30, "", tocolor(0, 0, 0, 255), "center", "center", UI.image[1])
end
addEventHandler("onClientUIReady", resourceRoot, UIKitReady)
addEvent("onClientUIKitReady", true)
addEventHandler("onClientUIKitReady", root, UIKitReady)
function closeUIWindows(arg0)
  eui:uiSetVisible(UI.window[1], false)
end
addEventHandler("onClientPlayerQuitFromCharacter", localPlayer, closeUIWindows)
addEventHandler("onClientPlayerWasted", localPlayer, closeUIWindows)
addEvent("onClientUseItem", true)
addEventHandler("onClientUseItem", root, function(arg0, arg1, arg2)
  if arg2.Type == "cert" then
    if eui:uiGetVisible(UI.window[1]) then
      eui:uiSetVisible(UI.window[1], false)
    else
      eui:uiSetVisible(UI.window[1], true)
      eui:uiSetText(UI.label.cname, arg2.SpecialProperties.cname)
      eui:uiSetText(UI.label.cid, arg2.SpecialProperties.cid)
      eui:uiSetText(UI.label.issuedAt, getRealTime(arg2.SpecialProperties.issuedAt).monthday .. "/" .. getRealTime(arg2.SpecialProperties.issuedAt).month + 1 .. "/" .. getRealTime(arg2.SpecialProperties.issuedAt).year + 1900 .. " " .. getRealTime(arg2.SpecialProperties.issuedAt).hour .. ":" .. getRealTime(arg2.SpecialProperties.issuedAt).minute .. ":" .. getRealTime(arg2.SpecialProperties.issuedAt).second)
      eui:uiSetText(UI.label.expireAt, getRealTime(arg2.SpecialProperties.expireAt).monthday .. "/" .. getRealTime(arg2.SpecialProperties.expireAt).month + 1 .. "/" .. getRealTime(arg2.SpecialProperties.expireAt).year + 1900 .. " \216\170\217\134\216\170\217\135\217\138 \216\181\217\132\216\167\216\173\217\138\216\169 \217\135\216\176\217\135 \216\167\217\132\216\180\217\135\216\167\216\175\216\169 \217\129\217\138")
    end
  end
end)
