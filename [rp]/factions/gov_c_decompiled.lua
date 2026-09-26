-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

function UIKitReady()
  eui = exports.UIKit
  var0 = eui:getUIFont("default-large")
  var1.window[1] = eui:uiCreateWindow(false, false, 450, 250, "GOV")
  eui:uiSetVisible(var1.window[1], false)
  var1.memo[1] = eui:uiCreateMemo(10, 35, 430, 160, "", tocolor(0, 0, 0), var1.window[1])
  eui:uiSetProperty(var1.memo[1], "TextColor", tocolor(255, 255, 255, 255))
  var1.button[1] = eui:uiCreateButton(10, 205, 150, 35, {en = "Send", ar = "\216\165\216\177\216\179\216\167\217\132"}, tocolor(0, 0, 0, 255), var1.window[1])
  var1.button[2] = eui:uiCreateButton(165, 205, 100, 35, {en = "Cancel", ar = "\216\165\217\132\216\186\216\167\216\161"}, tocolor(0, 0, 0, 255), var1.window[1])
end
addEventHandler("onClientUIReady", resourceRoot, UIKitReady)
addEventHandler("onClientUIKitReady", root, UIKitReady)
function closeUIWindows(arg0)
  eui:uiSetVisible(var0.window[1], false)
  showCursor(false)
end
addEvent("onClientPlayerQuitFromCharacter", true)
addEventHandler("onClientPlayerQuitFromCharacter", localPlayer, closeUIWindows)
addEventHandler("onClientPlayerWasted", localPlayer, closeUIWindows)
addEventHandler("onClientUIClick", root, function()
  if source == var0.button[1] then
    if eui:uiGetText(var0.memo[1]) ~= "" then
      if #split(eui:uiGetText(var0.memo[1]), "\n") > 4 then
        exports.notifications:output({
          en = "The number of lines is large",
          ar = "\216\185\216\175\216\175 \216\167\217\132\216\179\216\183\217\136\216\177 \217\131\216\168\217\138\216\177"
        }, 3500, "error")
        return
      end
      if var1.status then
        exports.notifications:output({
          en = "Please wait until the current gov end",
          ar = "\216\167\217\132\216\177\216\172\216\167\216\161 \216\167\217\132\216\167\217\134\216\170\216\184\216\167\216\177 \216\173\216\170\217\137 \217\138\217\134\216\170\217\135\217\138 \216\167\217\132\216\165\216\185\217\132\216\167\217\134 \216\167\217\132\216\173\216\167\217\132\217\138"
        }, 4000, "error")
        return
      end
      triggerServerEvent("gov:send", localPlayer, currentGovFactionID, (eui:uiGetText(var0.memo[1])))
      eui:uiSetText(var0.memo[1], "")
    end
  elseif source == var0.button[2] then
    eui:uiSetVisible(var0.window[1], false)
    showCursor(false)
  end
end)
addEvent("gov:showInput", true)
addEventHandler("gov:showInput", localPlayer, function(arg0)
  currentGovFactionID = arg0
  eui:uiSetText(var0.window[1], "GOV (Faction ID: " .. tostring(arg0) .. ")")
  eui:uiSetVisible(var0.window[1], true)
  showCursor(true)
end)
function ads_draw()
  if var0.status then
    dxDrawImage(interpolateBetween(var1, var2, 0, var1, var3, 0, (getTickCount() - var0.tick) / 500, "OutBack"))
    dxDrawText(var0.content, interpolateBetween(var1, var2, 0, var1, var3, 0, (getTickCount() - var0.tick) / 500, "OutBack") + 40 * var6, interpolateBetween(var1, var2, 0, var1, var3, 0, (getTickCount() - var0.tick) / 500, "OutBack") + 15 * var6, interpolateBetween(var1, var2, 0, var1, var3, 0, (getTickCount() - var0.tick) / 500, "OutBack") + var4 - 40 * var6, interpolateBetween(var1, var2, 0, var1, var3, 0, (getTickCount() - var0.tick) / 500, "OutBack") + var5 - 30 * var6, tocolor(255, 255, 255, 255), 0.8, var7, "center", "center", false, true, true, false)
    dxDrawText(tostring(var0.duration - math.floor((getTickCount() - var0.tick) / 1000)) .. "s", interpolateBetween(var1, var2, 0, var1, var3, 0, (getTickCount() - var0.tick) / 500, "OutBack") + 10 * var6 + 25 * var6 + 15 * var6, interpolateBetween(var1, var2, 0, var1, var3, 0, (getTickCount() - var0.tick) / 500, "OutBack") + 10 * var6, interpolateBetween(var1, var2, 0, var1, var3, 0, (getTickCount() - var0.tick) / 500, "OutBack") + 10 * var6 + 200 * var6, interpolateBetween(var1, var2, 0, var1, var3, 0, (getTickCount() - var0.tick) / 500, "OutBack") + 10 * var6 + 25 * var6, tocolor(255, 255, 255, 255), 0.8, var7, "left", "center", false, true, true, false)
    if not isMouseInPosition(interpolateBetween(var1, var2, 0, var1, var3, 0, (getTickCount() - var0.tick) / 500, "OutBack") + 10 * var6, interpolateBetween(var1, var2, 0, var1, var3, 0, (getTickCount() - var0.tick) / 500, "OutBack") + 10 * var6, 25 * var6, 25 * var6) or not tocolor(255, 0, 0) then
    end
    dxDrawImage(interpolateBetween(var1, var2, 0, var1, var3, 0, (getTickCount() - var0.tick) / 500, "OutBack") + 10 * var6, interpolateBetween(var1, var2, 0, var1, var3, 0, (getTickCount() - var0.tick) / 500, "OutBack") + 10 * var6, 25 * var6, 25 * var6, "images/hide.png", 0, 0, 0, tocolor(255, 255, 255), true)
    if isMouseInPosition(interpolateBetween(var1, var2, 0, var1, var3, 0, (getTickCount() - var0.tick) / 500, "OutBack") + 10 * var6, interpolateBetween(var1, var2, 0, var1, var3, 0, (getTickCount() - var0.tick) / 500, "OutBack") + 10 * var6, 25 * var6, 25 * var6) and getKeyState("mouse1") then
      var0.status = false
      removeEventHandler("onClientRender", root, ads_draw)
    end
  end
end
function isMouseInPosition(arg0, arg1, arg2, arg3)
  if isCursorShowing() then
    return arg0 <= getCursorPosition() * var0 and arg1 <= getCursorPosition() * var1 and getCursorPosition() * var0 <= arg0 + arg2 and getCursorPosition() * var1 <= arg1 + arg3
  end
end
addEvent("gov:show_announcement", true)
addEventHandler("gov:show_announcement", localPlayer, function(arg0, arg1, arg2, arg3, arg4)
  if not fileExists(":gov_images/images/" .. tostring(arg3) .. ".png") then
    return
  end
  setSoundVolume(playSound("sounds/gov.mp3"), 0.05)
  if not getElementData(localPlayer, "character:id") then
    return
  end
  if not var0.status then
    addEventHandler("onClientRender", root, ads_draw)
  end
  var0.image = tostring(arg3)
  var0.tick = getTickCount()
  var0.status = true
  var0.owner = arg0
  var0.title = arg1
  var0.content = arg2
  var0.duration = arg4
  if isTimer(var0.timer) then
    killTimer(var0.timer)
  end
  var0.timer = setTimer(function()
    var0.status = false
    removeEventHandler("onClientRender", root, ads_draw)
  end, arg4 * 1000, 1)
end)
addEvent("gov:hide_announcement", true)
addEventHandler("gov:hide_announcement", root, function()
  if var0.status then
    removeEventHandler("onClientRender", root, ads_draw)
    var0.status = false
  end
  if isTimer(var0.timer) then
    killTimer(var0.timer)
  end
end)
