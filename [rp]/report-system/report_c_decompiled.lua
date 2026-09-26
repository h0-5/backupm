-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

UI = {
  tab = {},
  progressbar = {},
  edit = {},
  window = {},
  label = {},
  checkbox = {},
  switch = {},
  button = {},
  tabpanel = {},
  radiobutton = {},
  gridlist = {},
  memo = {},
  scrollbar = {},
  combobox = {}
}
function UIKitReady()
  eui = exports.UIKit
  UI.window[1] = eui:uiCreateRectangle(false, false, 400, 330, tocolor(15, 15, 15, 240), true, true, true, true)
  eui:uiSetVisible(UI.window[1], false)
  UI.label.Title = eui:uiCreateLabel(10, 10, 232, 20, "Report Center", tocolor(255, 255, 255, 255), "left", "top", UI.window[1])
  eui:uiSetFont(UI.label.Title, "default-large")
  UI.button[2] = eui:uiCreateButton(0, 300, 400, 30, {en = "Cancel", ar = "\216\165\217\132\216\186\216\167\216\161"}, tocolor(10, 10, 10, 240), UI.window[1])
  eui:uiSetProperty(UI.button[2], "HoverTextColor", tocolor(255, 48, 48))
  UI.window[2] = eui:uiCreateWindow(false, false, 550, 325, "Report Center")
  eui:uiWindowSetMovable(UI.window[2], false)
  eui:uiSetVisible(UI.window[2], false)
  eui:uiCreateLabel(15, 40, 200, 20, {
    en = "Write your problem:",
    ar = "\216\167\217\131\216\170\216\168 \217\133\216\180\217\131\217\132\216\170\217\131:"
  }, tocolor(255, 255, 255, 255), "left", "center", UI.window[2])
  UI.memo[1] = eui:uiCreateMemo(10, 65, 530, 200, "", tocolor(0, 0, 0), UI.window[2])
  eui:uiSetProperty(UI.memo[1], "TextColor", tocolor(255, 255, 255, 255))
  UI.button[4] = eui:uiCreateButton(10, 285, 100, 30, {en = "Cancel", ar = "\216\165\217\132\216\186\216\167\216\161"}, tocolor(0, 0, 0), UI.window[2])
  UI.button[5] = eui:uiCreateButton(390, 285, 150, 30, {
    en = "Submit Report",
    ar = "\216\165\216\177\216\179\216\167\217\132 \216\167\217\132\216\170\217\130\216\177\217\138\216\177"
  }, tocolor(0, 0, 0), UI.window[2])
  UI.label.cooldown = eui:uiCreateLabel(235, 285, 300, 30, {
    en = "You can send another report after ",
    ar = " \216\170\216\179\216\170\216\183\217\138\216\185 \216\167\216\177\216\179\216\167\217\132 \216\170\217\130\216\177\217\138\216\177 \216\162\216\174\216\177 \216\168\216\185\216\175"
  }, tocolor(255, 255, 255, 255), "right", "center", UI.window[2])
  eui:uiSetVisible(UI.label.cooldown, false)
end
addEventHandler("onClientUIReady", resourceRoot, UIKitReady)
addEvent("onClientUIKitReady", true)
addEventHandler("onClientUIKitReady", root, UIKitReady)
addEventHandler("onClientUIMenuSelectChange", root, function(arg0, arg1)
  if arg1 and getElementID(source) == "main-menu" and eui:uiMenuGetItemID(source, arg0) == "report" and not isElement(UI.gridlist[1]) then
    eui:uiCreateLabel(10, 70, eui:uiGetSize(arg1) - 20, 80, {
      en = [[
					If you encounter a problem, you can ask for help from the support staff
					By selecting the type of the report and typing in the details

					Please explain the reason for requesting assistance so that the support team can assist you as required and as quickly as possible

					You can also communicate with the administration by opening a ticket in the server's official discord
					]],
      ar = "\t\t\t\t\t\217\129\217\138 \216\173\216\167\217\132 \217\136\216\167\216\172\217\135\216\170\217\131 \217\133\216\180\217\131\217\132\216\169\216\140 \217\138\217\133\217\131\217\134\217\131 \216\183\217\132\216\168 \216\167\217\132\217\133\216\179\216\167\216\185\216\175\216\169 \217\133\217\134 \216\183\216\167\217\130\217\133 \216\167\217\132\216\175\216\185\217\133 \216\167\217\132\217\129\217\134\217\138\n\t\t\t\t\t\216\185\217\134 \216\183\216\177\217\138\217\130 \216\167\216\174\216\170\217\138\216\167\216\177 \217\134\217\136\216\185 \216\167\217\132\217\133\216\179\216\167\216\185\216\175\216\169 \217\136\217\131\216\170\216\167\216\168\216\169 \216\167\217\132\216\170\217\129\216\167\216\181\217\138\217\132\n\t\t\t\t\t\n\t\t\t\t\t\217\138\216\177\216\172\217\137 \216\170\217\136\216\182\217\138\216\173 \216\179\216\168\216\168 \216\183\217\132\216\168 \216\167\217\132\217\133\216\179\216\167\216\185\216\175\216\169 \216\173\216\170\217\137 \217\138\216\179\216\170\216\183\217\138\216\185 \217\129\216\177\217\138\217\130 \216\167\217\132\216\175\216\185\217\133 \217\133\216\179\216\167\216\185\216\175\216\170\217\131 \216\168\216\167\217\132\216\180\217\131\217\132 \216\167\217\132\217\133\216\183\217\132\217\136\216\168 \217\136\216\168\216\163\216\179\216\177\216\185 \217\136\217\130\216\170\n\n\t\t\t\t\t\217\131\217\133\216\167 \217\138\217\133\217\131\217\134\217\131 \216\167\217\132\216\170\217\136\216\167\216\181\217\132 \217\133\216\185 \216\167\217\132\216\165\216\175\216\167\216\177\216\169 \216\185\217\134 \216\183\216\177\217\138\217\130 \217\129\216\170\216\173 \216\170\216\176\217\131\216\177\216\169 \217\129\217\138 \216\167\217\132\216\175\216\179\217\131\217\136\216\177\216\175 \216\167\217\132\216\177\216\179\217\133\217\138 \217\132\217\132\216\179\217\138\216\177\217\129\216\177\n\t\t\t\t\t"
    }, "primary", "center", "top", arg1)
    UI.gridlist[1] = eui:uiCreateGridList(10, 230, eui:uiGetSize(arg1) - 20, eui:uiGetSize(arg1) - 150 - 100, tocolor(10, 10, 10, 0), arg1)
    eui:uiGridListAddColumn(UI.gridlist[1], "Select Report Type", 1)
    eui:uiSetAlign(UI.gridlist[1], "center", "center")
    eui:uiSetProperty(UI.gridlist[1], "row_height", 35)
    for forvar9, forvar10 in ipairs(var0) do
      eui:uiGridListSetItemText(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 1, tostring(forvar10))
      eui:uiGridListSetItemColor(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 1, tocolor(240, 255, 232, 255))
    end
  end
end)
addEventHandler("onClientUIClick", root, function()
  if source == UI.button[1] then
    if eui:uiGridListGetSelectedItem(UI.gridlist[1]) ~= -1 then
      eui:uiSetVisible(UI.window[1], false)
      eui:uiSetVisible(UI.window[2], true)
      eui:uiSetText(UI.window[2], "Report Center | " .. tostring((eui:uiGridListGetItemText(UI.gridlist[1], eui:uiGridListGetSelectedItem(UI.gridlist[1]), 1))))
    end
  elseif source == UI.button[2] then
    eui:uiSetVisible(UI.window[1], false)
    showCursor(false)
  elseif source == UI.button[3] then
    eui:uiSetVisible(UI.window[2], false)
    eui:uiSetVisible(UI.window[1], true)
  elseif source == UI.button[4] then
    eui:uiSetVisible(UI.window[2], false)
    showCursor(false)
  elseif source == UI.button[5] and eui:uiGetText(UI.memo[1]) ~= "" then
    if utf8.len((eui:uiGetText(UI.memo[1]))) >= 10 then
      if utf8.len((eui:uiGetText(UI.memo[1]))) <= 250 then
        triggerServerEvent("reports:submitReport", localPlayer, eui:uiGridListGetItemText(UI.gridlist[1], eui:uiGridListGetSelectedItem(UI.gridlist[1]), 1), eui:uiGetText(UI.memo[1]), "")
        eui:uiSetVisible(UI.window[2], false)
        showCursor(false)
        eui:uiSetText(UI.memo[1], "")
      else
        exports.notifications:output({
          en = "The description of the problem is too long, please shorten it",
          ar = "\217\136\216\181\217\129 \216\167\217\132\217\133\216\180\217\131\217\132\216\169 \216\183\217\136\217\138\217\132 \216\172\216\175\216\167\217\139\216\140 \217\138\216\177\216\172\217\137 \216\167\217\132\216\167\216\174\216\170\216\181\216\167\216\177"
        }, 4000, "error")
      end
    else
      exports.notifications:output({
        en = "Write more details",
        ar = "\216\167\217\131\216\170\216\168 \216\167\217\132\217\133\216\178\217\138\216\175 \217\133\217\134 \216\167\217\132\216\170\217\129\216\167\216\181\217\138\217\132"
      }, 3500, "error")
    end
  end
end)
addEventHandler("onClientUIDoubleClick", root, function()
  if source == UI.gridlist[1] and eui:uiGridListGetSelectedItem(UI.gridlist[1]) ~= -1 then
    eui:uiSetVisible(UI.window[1], false)
    eui:uiSetVisible(UI.window[2], true)
    eui:uiBringToFront(UI.window[2])
    eui:uiSetText(UI.window[2], "Report Center | " .. tostring((eui:uiGridListGetItemText(UI.gridlist[1], eui:uiGridListGetSelectedItem(UI.gridlist[1]), 1))))
  end
end)
function setCooldown(arg0)
  if isTimer(cooldownTimer) then
    killTimer(cooldownTimer)
  end
  eui:uiSetVisible(UI.button[5], false)
  eui:uiSetVisible(UI.label.cooldown, true)
  cooldownTimer = setTimer(function()
    if isTimer(updateCooldownLabelTimer) then
      killTimer(updateCooldownLabelTimer)
    end
    eui:uiSetVisible(UI.label.cooldown, false)
    eui:uiSetVisible(UI.button[5], true)
  end, arg0 * 1000, 1)
end
addEvent("reports:syncCooldown", true)
addEventHandler("reports:syncCooldown", root, function(arg0)
  setCooldown(arg0)
end)
addEventHandler("onClientUIVisibilityChange", root, function()
  if source == UI.window[2] then
    if eui:uiGetVisible(source) then
      if isTimer(updateCooldownLabelTimer) then
        return
      end
      resetCooldownCountLabel()
      updateCooldownLabelTimer = setTimer(resetCooldownCountLabel, 1000, 0)
    elseif isTimer(updateCooldownLabelTimer) then
      killTimer(updateCooldownLabelTimer)
    end
  end
end)
function resetCooldownCountLabel()
  if isTimer(cooldownTimer) then
    eui:uiSetText(UI.label.cooldown, {
      en = "You can send another report after " .. convertTimeToString(getTimerDetails(cooldownTimer) / 1000),
      ar = convertTimeToString(getTimerDetails(cooldownTimer) / 1000) .. " \216\170\216\179\216\170\216\183\217\138\216\185 \216\167\216\177\216\179\216\167\217\132 \216\170\217\130\216\177\217\138\216\177 \216\162\216\174\216\177 \216\168\216\185\216\175"
    })
  end
end
function convertTimeToString(arg0)
  arg0 = tonumber(arg0)
  if math.floor(arg0 / (24 * (60 * 60))) == 0 then
    if math.floor(arg0 % (24 * (60 * 60)) / (60 * 60)) == 0 then
      return math.floor(arg0 % (24 * (60 * 60)) % (60 * 60) / 60) .. "m " .. math.ceil(arg0 % (24 * (60 * 60)) % (60 * 60) % 60) .. "s"
    else
      return math.floor(arg0 % (24 * (60 * 60)) / (60 * 60)) .. "h " .. math.floor(arg0 % (24 * (60 * 60)) % (60 * 60) / 60) .. "m"
    end
  else
    return math.floor(arg0 / (24 * (60 * 60))) .. "d " .. math.floor(arg0 % (24 * (60 * 60)) / (60 * 60)) .. "h"
  end
end
addEvent("hud:onClientHudItemClick", true)
addEventHandler("hud:onClientHudItemClick", root, function(arg0, arg1)
  if arg0 == "reportpanel" then
    if arg1 then
      triggerServerEvent("reports:showUnansweredReportsPanel", localPlayer)
      removeEventHandler("onClientRender", root, drawReports)
      addEventHandler("onClientRender", root, drawReports)
    else
      triggerServerEvent("reports:onHideUnansweredReportsPanel", localPlayer)
      removeEventHandler("onClientRender", root, drawReports)
    end
  elseif arg0 == "admintag" and not arg1 then
    triggerServerEvent("reports:onHideUnansweredReportsPanel", localPlayer)
    removeEventHandler("onClientRender", root, drawReports)
  end
end)
addEvent("reports:playAcceptSound", true)
addEventHandler("reports:playAcceptSound", root, function()
  if playSound("accept_sound.mp3") then
    setSoundVolume(playSound("accept_sound.mp3"), 1)
  end
end)
addEvent("reports:sync", true)
addEventHandler("reports:sync", root, function(arg0)
  var0 = ""
  for forvar4, forvar5 in ipairs(arg0) do
    if forvar4 == 1 then
      var0 = "#ffffff[#00ff3c " .. tostring(forvar5[1]) .. " #ffffff]  From '" .. tostring(isElement(forvar5[2]) and getElementData(forvar5[2], "character:name") or "None") .. "' at " .. tostring(forvar5[8]) .. " Handler: " .. tostring(isElement(forvar5[7]) and getElementData(forvar5[7], "character:name") or "None") .. "."
    else
      var0 = var0 .. "\n" .. "#ffffff[#00ff3c " .. tostring(forvar5[1]) .. " #ffffff]  From '" .. tostring(isElement(forvar5[2]) and getElementData(forvar5[2], "character:name") or "None") .. "' at " .. tostring(forvar5[8]) .. " Handler: " .. tostring(isElement(forvar5[7]) and getElementData(forvar5[7], "character:name") or "None") .. "."
    end
  end
  if #arg0 == 0 then
    var1 = 50
  else
    var1 = var2 * #arg0 + 40
  end
  if var0 == "" then
    var0 = "#a9a9a9No Reports"
  end
  var0 = "Reports\n" .. var0
end)
function drawReports()
  dxDrawRoundedRectangle(var0, var1, var2, var3, tocolor(0, 0, 0, 200), 8, false)
  dxDrawText(var4, var0 + 10, var1 + 10, var0 + var2 - 10, var1 + var3 - 10, tocolor(0, 255, 60), 1, "default-bold", "left", "top", false, false, false, true)
end
function dxDrawRoundedRectangle(arg0, arg1, arg2, arg3, arg4, arg5, arg6)
  arg2, arg3, arg0, arg1 = arg2 - arg5 * 2, arg3 - arg5 * 2, math.floor(arg0 + arg5), math.floor(arg1 + arg5)
  dxDrawRectangle(arg0 - arg5, arg1, arg2 + arg5 * 2, arg3, arg4, arg6)
  dxDrawRectangle(arg0, arg1 - arg5, arg2, arg5, arg4, arg6)
  dxDrawRectangle(arg0, arg1 + arg3, arg2, arg5, arg4, arg6)
  dxDrawCircle(arg0, arg1, arg5, 180, 270, arg4, arg4, 7, _, arg6)
  dxDrawCircle(arg0 + arg2, arg1, arg5, 270, 360, arg4, arg4, 7, _, arg6)
  dxDrawCircle(arg0, arg1 + arg3, arg5, 90, 180, arg4, arg4, 7, _, arg6)
  dxDrawCircle(arg0 + arg2, arg1 + arg3, arg5, 0, 90, arg4, arg4, 7, _, arg6)
end
