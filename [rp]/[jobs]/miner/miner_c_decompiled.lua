-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

function UIKitReady()
  eui = exports.UIKit
  var0.progressbar[1] = eui:uiCreateProgressBar((eui:uiGetReferenceScreenSize() - 200) / 2, eui:uiGetReferenceScreenSize() - 100, 200, 10, tocolor(153, 73, 0, 255))
  eui:uiSetVisible(var0.progressbar[1], false)
  eui:uiSetProperty(var0.progressbar[1], "background_color", tocolor(0, 0, 0, 240))
  eui:uiSetProperty(var0.progressbar[1], "progress_animation", true)
  eui:uiSetProperty(var0.progressbar[1], "show_progress", false)
  var0.window[1] = eui:uiCreateWindow(false, false, 420, 220, {
    en = "Sell Your Materials",
    ar = "\216\168\217\138\216\185 \216\167\217\132\217\133\216\185\216\167\216\175\217\134"
  })
  eui:uiSetVisible(var0.window[1], false)
  var0.label.Info = eui:uiCreateLabel(20, 60, 222, 20, "", tocolor(255, 255, 255, 255), "left", "top", var0.window[1])
  var0.button.sell = eui:uiCreateButton(5, 180, 150, 35, {en = "Sell", ar = "\216\168\217\138\216\185"}, "primary", var0.window[1])
  var0.button.cancel = eui:uiCreateButton(160, 180, 150, 35, {en = "Cancel", ar = "\216\165\217\132\216\186\216\167\216\161"}, _, var0.window[1])
end
addEventHandler("onClientUIReady", resourceRoot, UIKitReady)
addEventHandler("onClientUIKitReady", root, UIKitReady)
function closeUIWindows(arg0)
  eui:uiSetVisible(var0.progressbar[1], false)
  eui:uiSetVisible(var0.window[1], false)
  showCursor(false)
end
addEvent("onClientPlayerQuitFromCharacter", true)
addEventHandler("onClientPlayerQuitFromCharacter", localPlayer, closeUIWindows)
addEventHandler("onClientPlayerWasted", localPlayer, closeUIWindows)
addEvent("Miner:ProgressState", true)
addEventHandler("Miner:ProgressState", root, function(arg0, arg1)
  if isTimer(ProgressTimer) then
    killTimer(ProgressTimer)
  end
  if arg0 == "Show" then
    eui:uiSetVisible(var0.progressbar[1], true)
    eui:uiProgressBarSetProgress(var0.progressbar[1], getElementData(arg1, "Miner:Progress") or 0)
    ProgressTimer = setTimer(function(arg0)
      eui:uiProgressBarSetProgress(var0.progressbar[1], getElementData(arg0, "Miner:Progress") or 0)
    end, 2000, 0, arg1)
  elseif arg0 == "Hide" then
    eui:uiSetVisible(var0.progressbar[1], false)
  end
end)
addEvent("onClientElementMenuClick", true)
addEventHandler("onClientElementMenuClick", root, function(arg0, arg1, arg2)
  if not isElement(arg0) then
    return
  end
  if getElementType(arg0) == "ped" and getElementData(arg0, "ped:interact") == "sell.materials" and arg1 == "Talk" then
    if not getElementData(localPlayer, "character:id") then
      return
    end
    var0 = {}
    for forvar11, forvar12 in ipairs((exports["inventory-system"]:getInventoryItems("character:" .. tostring((getElementData(localPlayer, "character:id")))))) do
      if forvar12.Type == "Material" and forvar12.Properties.org_price and type(forvar12.Properties.org_price) == "number" and 0 < forvar12.Properties.org_price then
        table.insert(var0, forvar12)
      end
    end
    eui:uiSetText(var1.label.Info, {
      en = "You have: " .. tostring(0 + 1) .. [[
 materials
Total price: #00FF00$]] .. tostring(0 + forvar12.Properties.org_price) .. [[


#FFFFFFPress 'Sell' button if you want to sell all your materials.]],
      ar = "\216\163\217\134\216\170 \217\132\216\175\217\138\217\131: " .. tostring(0 + 1) .. " \217\133\216\185\216\175\217\134\n\216\167\217\132\216\179\216\185\216\177 \216\167\217\132\216\165\216\172\217\133\216\167\217\132\217\138: #00FF00$" .. tostring(0 + forvar12.Properties.org_price) .. "\n\n#FFFFFF\216\167\216\182\216\186\216\183 '\216\168\217\138\216\185' \216\167\216\176\216\167 \217\131\217\134\216\170 \216\170\216\177\217\138\216\175 \216\168\217\138\216\185 \216\172\217\133\217\138\216\185 \216\167\217\132\217\133\216\185\216\167\216\175\217\134 \217\132\216\175\217\138\217\131."
    })
    eui:uiSetVisible(var1.window[1], true)
    showCursor(true)
  end
end)
addEventHandler("onClientUIClick", root, function()
  if source == var0.button.sell then
    if var1 then
      exports.notifications:output({
        en = "Wait please",
        ar = "\216\167\217\134\216\170\216\184\216\177 \217\133\217\134 \217\129\216\182\217\132\217\131"
      }, 3000, "warning")
      return
    end
    if #var2 > 0 then
      if not getElementData(localPlayer, "character:id") then
        return
      end
      var1 = true
      triggerServerEvent("miner:sell", localPlayer)
      eui:uiSetVisible(var0.window[1], false)
      showCursor(false)
      var2 = {}
    else
      exports.notifications:output({
        en = "You don't have any materials to sell",
        ar = "\217\132\217\138\216\179 \217\132\216\175\217\138\217\131 \216\163\217\138 \217\133\217\136\216\167\216\175 \217\132\216\168\217\138\216\185\217\135\216\167"
      }, 3500, "error")
    end
  elseif source == var0.button.cancel then
    eui:uiSetVisible(var0.window[1], false)
    showCursor(false)
  end
end)
addEvent("miner:sell:callback", true)
addEventHandler("miner:sell:callback", localPlayer, function()
  var0 = false
end)
