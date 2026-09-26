-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

function UIKitReady()
  eui = exports.UIKit
  var0.window[1] = eui:uiCreateRectangle(false, false, 635, 465, "bg_default", true, true, true, true)
  var0.label.title = eui:uiCreateLabel(0, 15, 640, 20, {
    en = "Crafting",
    ar = "\216\167\217\132\216\181\217\134\216\167\216\185\216\169"
  }, tocolor(255, 255, 255, 255), "center", "top", var0.window[1])
  eui:uiSetFont(var0.label.title, "default-large")
  eui:uiSetVisible(var0.window[1], false)
  eui:uiCreateRectangle(0, 45, 635, 1, tocolor(255, 255, 255, 20), false, false, false, false, var0.window[1])
  eui:uiCreateRectangle(0, 410, 635, 1, tocolor(255, 255, 255, 10), false, false, false, false, var0.window[1])
  var0.box.from = eui:uiCreateRectangle(177.5, 60, 90, 90, tocolor(0, 0, 0), true, true, true, true, var0.window[1])
  var0.box.to = eui:uiCreateRectangle(367.5, 60, 90, 90, tocolor(0, 0, 0), true, true, true, true, var0.window[1])
  var0.image.craft_item = eui:uiCreateImage(0, 0, 90, 90, ":items/images/item.png", var0.box.to)
  eui:uiCreateImage(292.5, 80, 50, 50, ":inventory-system/right-arrow.png", var0.window[1])
  eui:uiCreateLabel(0, 170, 635, 20, {
    en = "Crafting Requirements",
    ar = "\217\133\216\170\216\183\217\132\216\168\216\167\216\170 \216\167\217\132\216\181\217\134\216\167\216\185\216\169"
  }, tocolor(255, 255, 255, 255), "center", "top", var0.window[1])
  for forvar5 = 1, 16 do
    if 1 > 8 then
    end
    var0.box[forvar5] = eui:uiCreateRectangle(20 + 75 * (1 - 1), 200 + 85 * (1 + 1 - 1), 70, 80, tocolor(0, 0, 0), true, true, true, true, var0.window[1])
    var0.image[forvar5] = eui:uiCreateImage(5, 5, 60, 60, ":items/images/item.png", var0.box[forvar5])
    var0.label[forvar5] = eui:uiCreateLabel(0, 60, 70, 20, "x1", tocolor(255, 255, 255, 255), "center", "center", var0.box[forvar5])
  end
  _FOR_.label.cost = eui:uiCreateLabel(0, 375, 635, 20, "$50,000", tocolor(0, 255, 0, 255), "center", "top", var0.window[1])
  eui:uiSetFont(var0.label.cost, "default-large")
  var0.button[1] = eui:uiCreateButton(360, 420, 160, 35, {en = "Craft", ar = "\216\181\217\134\216\167\216\185\216\169"}, _, var0.window[1])
  var0.button[2] = eui:uiCreateButton(525, 420, 100, 35, {en = "Close", ar = "\216\165\216\186\217\132\216\167\217\130"}, _, var0.window[1])
  eui:uiSetProperty(var0.button[1], "HoverTextColor", eui:uiGetThemeColor("primary"))
  eui:uiSetProperty(var0.button[2], "HoverTextColor", tocolor(255, 48, 48))
  var0.progressbar[1] = eui:uiCreateProgressBar(20, 435, 200, 10, tocolor(252, 73, 3, 255), var0.window[1])
  eui:uiSetProperty(var0.progressbar[1], "background_color", tocolor(10, 10, 10))
  eui:uiSetProperty(var0.progressbar[1], "progress_animation", true)
  eui:uiSetProperty(var0.progressbar[1], "show_progress", false)
  eui:uiSetVisible(var0.progressbar[1], false)
end
addEventHandler("onClientUIReady", resourceRoot, UIKitReady)
addEvent("onClientUIKitReady", true)
addEventHandler("onClientUIKitReady", root, UIKitReady)
function showCrafting(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7)
-- fail 39
null
11
  if not isTimer(var0.timer) then
    arg3 = arg3 or 0
    var0.craft_item = arg1
    var0.requirements = arg2
    var0.cost = arg3
    var0.duration = arg4
    var0.trigger = arg5
    var0.triggerData = arg6
    var0.required_level = tonumber(arg7) or 0
    eui:uiSetText(var1.label.title, {
      en = "Crafting",
      ar = "\216\167\217\132\216\181\217\134\216\167\216\185\216\169"
    })
    eui:uiSetText(var1.label.cost, "$" .. formatNumber(arg3))
    eui:uiStaticImageLoadImage(var1.image.craft_item, (exports["inventory-system"]:getItemImageName(arg1)))
    for forvar12 = 1, 16 do
      if arg2[forvar12] then
        eui:uiSetColor(var1.box[forvar12], 0, 0, 0, 255)
        eui:uiSetVisible(var1.image[forvar12], true)
        eui:uiSetVisible(var1.label[forvar12], true)
        eui:uiStaticImageLoadImage(var1.image[forvar12], (exports["inventory-system"]:getItemImageName(arg2[forvar12])))
        eui:uiSetText(var1.label[forvar12], "x" .. arg2[forvar12].Quantity)
      else
        eui:uiSetColor(var1.box[forvar12], 0, 0, 0, 150)
        eui:uiSetVisible(var1.image[forvar12], false)
        eui:uiSetVisible(var1.label[forvar12], false)
      end
    end
  end
  eui:uiSetVisible(var1.window[1], true)
  showCursor(true)
end
function hideCrafting()
  eui:uiSetVisible(var0.window[1], false)
  showCursor(false)
end
addEvent("crafting:show", true)
addEventHandler("crafting:show", localPlayer, function(arg0)
  showCrafting(arg0.title, arg0.craft_item, arg0.requirements, arg0.cost, arg0.duration, arg0.trigger, arg0.triggerData, arg0.required_level)
end)
addEventHandler("onClientUIClick", root, function()
  if source == var0.button[1] then
    if var1 then
      return
    end
    if exports["level-system"]:getPlayerLevel() < var2.required_level then
      outputChatBox("(( Your level must be " .. tostring(var2.required_level) .. " or above. Type /level to find out your level. ))", 255, 46, 46)
      return
    end
    if getPlayerMoney() >= var2.cost and var2.cost >= 0 then
      for forvar7, forvar8 in ipairs((exports["inventory-system"]:getInventoryItems("character:" .. tostring((getElementData(localPlayer, "character:id")))))) do
        for forvar12, forvar13 in ipairs((fromJSON(toJSON(var2.requirements)))) do
          if forvar13.Type and forvar13.Name == forvar8.Name and forvar13.Type == forvar8.Type or forvar13.Name == forvar8.Name then
            fromJSON(toJSON(var2.requirements))[forvar12].Quantity = fromJSON(toJSON(var2.requirements))[forvar12].Quantity - forvar8.Quantity
          end
        end
      end
      for forvar7, forvar8 in ipairs((fromJSON(toJSON(var2.requirements)))) do
        if 0 < forvar8.Quantity then
          exports.notifications:output({
            en = "You don't have all requirements for crafting",
            ar = "\217\132\217\138\216\179 \217\132\216\175\217\138\217\131 \217\131\217\132 \217\133\216\170\216\183\217\132\216\168\216\167\216\170 \216\167\217\132\216\181\217\134\216\167\216\185\216\169"
          }, 4000, "error")
          return
        end
      end
      eui:uiSetVisible(var0.button[1], false)
      eui:uiSetVisible(var0.progressbar[1], true)
      if isTimer(var2.timer) then
        killTimer(var2.timer)
      end
      var2.timer = setTimer(function()
        eui:uiProgressBarSetProgress(var1.progressbar[1], (var0.duration - getTimerDetails(var0.timer) + 1) / var0.duration * 100)
        if (var0.duration - getTimerDetails(var0.timer) + 1) / var0.duration * 100 == 100 then
          var2 = true
          triggerServerEvent("crafting:craft_item", localPlayer, var0)
          eui:uiSetVisible(var1.progressbar[1], false)
        end
      end, 1000, var2.duration)
    else
      exports.notifications:output({
        en = "#ffffffYou don't have the crafting cost (#00ff00$" .. tostring(var2.cost) .. "#ffffff)",
        ar = "#ffffff(#00ff00$" .. tostring(var2.cost) .. "#ffffff) \217\132\217\138\216\179 \217\132\216\175\217\138\217\131 \216\170\217\131\217\132\217\129\216\169 \216\167\217\132\216\170\216\181\217\134\217\138\216\185"
      }, 5000, "error")
    end
  elseif source == var0.button[2] then
    hideCrafting()
  end
end)
addEvent("crafting:craft_item:callback", true)
addEventHandler("crafting:craft_item:callback", root, function(arg0)
  var0 = false
  if arg0 then
    hideCrafting()
  end
  eui:uiSetVisible(var1.button[1], true)
  eui:uiSetVisible(var1.progressbar[1], false)
end)
function formatNumber(arg0)
  while true do
    k = string.gsub(arg0, "^(-?%d+)(%d%d%d)", "%1,%2")
    if k == 0 then
      break
    end
  end
  return string.gsub(arg0, "^(-?%d+)(%d%d%d)", "%1,%2")
end
