-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

addEventHandler("onClientResourceStart", resourceRoot, function()
  downloadFile("rank.png")
end)
addEventHandler("onClientFileDownloadComplete", resourceRoot, function(arg0, arg1)
  if arg0 == "rank.png" then
    var0.image = dxCreateTexture(arg0)
    fileDelete(arg0)
  end
end)
;({
  count = getTickCount(),
  x = (guiGetScreenSize() - 400 * (guiGetScreenSize() / 1080)) / 2,
  y = 100,
  w = 400 * (guiGetScreenSize() / 1080),
  h = 10 * (guiGetScreenSize() / 1080),
  rec_w = 400 * (guiGetScreenSize() / 1080) / 10,
  level = 0,
  last_exp = 0,
  exp = 0,
  max_exp = 0,
  color = tocolor(255, 55, 95, 255),
  img_color = tocolor(255, 55, 95, 200),
  postGUI = true,
  image = false,
  awards = {}
}).render = function()
  for forvar7 = 1, 10 do
    if not (var0.x + anim(var0.count, 1500, var0.last_exp, 0, 0, var0.exp, 0, 0, "Linear") * (var0.w / var0.max_exp) > var0.x + var0.rec_w * (forvar7 - 1) + var0.rec_w) or not var0.color then
    end
    dxDrawRectangle(var0.x + var0.rec_w * (forvar7 - 1), var0.y, var0.rec_w - 4, var0.h, tocolor(20, 20, 30, 250), var0.postGUI)
    if not (var0.x + anim(var0.count, 1500, var0.last_exp, 0, 0, var0.exp, 0, 0, "Linear") * (var0.w / var0.max_exp) > var0.x + var0.rec_w * (forvar7 - 1) + var0.rec_w) and 0 < var0.x + anim(var0.count, 1500, var0.last_exp, 0, 0, var0.exp, 0, 0, "Linear") * (var0.w / var0.max_exp) - (var0.x + var0.rec_w * (forvar7 - 1)) then
      dxDrawRectangle(var0.x + var0.rec_w * (forvar7 - 1), var0.y, var0.x + anim(var0.count, 1500, var0.last_exp, 0, 0, var0.exp, 0, 0, "Linear") * (var0.w / var0.max_exp) - (var0.x + var0.rec_w * (forvar7 - 1)) - 3, var0.h, var0.color, var0.postGUI)
    end
  end
  if 0 < var0.exp - var0.last_exp and var0.boost and 0 < var0.boost then
  end
  dxDrawText(((tostring(math.floor((anim(var0.count, 1500, var0.last_exp, 0, 0, var0.exp, 0, 0, "Linear")))) .. " / " .. tostring(var0.max_exp)) .. [[

+]] .. var0.exp - var0.last_exp .. "") .. "   (+" .. math.ceil(var0.boost * 100) .. "%)", var0.x - 2, var0.y + var0.h + 10, var0.x + var0.w, var0.y + var0.h + 60, tocolor(0, 0, 0, 255), 1.25, "default-bold", "center", "top", true, false, var0.postGUI)
  dxDrawText(((tostring(math.floor((anim(var0.count, 1500, var0.last_exp, 0, 0, var0.exp, 0, 0, "Linear")))) .. " / " .. tostring(var0.max_exp)) .. [[

+]] .. var0.exp - var0.last_exp .. "") .. "   (+" .. math.ceil(var0.boost * 100) .. "%)", var0.x, var0.y + var0.h + 10 - 2, var0.x + var0.w, var0.y + var0.h + 60, tocolor(0, 0, 0, 255), 1.25, "default-bold", "center", "top", true, false, var0.postGUI)
  dxDrawText(((tostring(math.floor((anim(var0.count, 1500, var0.last_exp, 0, 0, var0.exp, 0, 0, "Linear")))) .. " / " .. tostring(var0.max_exp)) .. [[

+]] .. var0.exp - var0.last_exp .. "") .. "   (+" .. math.ceil(var0.boost * 100) .. "%)", var0.x + 2, var0.y + var0.h + 10, var0.x + var0.w, var0.y + var0.h + 60, tocolor(0, 0, 0, 255), 1.25, "default-bold", "center", "top", true, false, var0.postGUI)
  dxDrawText(((tostring(math.floor((anim(var0.count, 1500, var0.last_exp, 0, 0, var0.exp, 0, 0, "Linear")))) .. " / " .. tostring(var0.max_exp)) .. [[

+]] .. var0.exp - var0.last_exp .. "") .. "   (+" .. math.ceil(var0.boost * 100) .. "%)", var0.x, var0.y + var0.h + 10 + 2, var0.x + var0.w, var0.y + var0.h + 60, tocolor(0, 0, 0, 255), 1.25, "default-bold", "center", "top", true, false, var0.postGUI)
  dxDrawText(((tostring(math.floor((anim(var0.count, 1500, var0.last_exp, 0, 0, var0.exp, 0, 0, "Linear")))) .. " / " .. tostring(var0.max_exp)) .. [[

+]] .. var0.exp - var0.last_exp .. "") .. "   (+" .. math.ceil(var0.boost * 100) .. "%)", var0.x, var0.y + var0.h + 10, var0.x + var0.w, var0.y + var0.h + 60, tocolor(255, 255, 255, 255), 1.25, "default-bold", "center", "top", true, false, var0.postGUI)
  if var0.image then
    dxDrawImage(var0.x - 70 * var1, var0.y - 25 * var1, 60 * var1, 60 * var1, var0.image, 0, 0, 0, var0.img_color, var0.postGUI)
    dxDrawImage(var0.x + var0.w + 10 * var1, var0.y - 25 * var1, 60 * var1, 60 * var1, var0.image, 0, 0, 0, var0.img_color, var0.postGUI)
  end
  dxDrawText(tostring(var0.level), var0.x - 80 * var1, var0.y - 10 * var1, var0.x, var0.y + 20 * var1, tocolor(255, 255, 255, 255), 3 * var1, "default-bold", "center", "center", false, false, var0.postGUI)
  dxDrawText(tostring(var0.level + 1), var0.x + var0.w, var0.y - 10 * var1, var0.x + var0.w + 80 * var1, var0.y + 20 * var1, tocolor(255, 255, 255, 255), 3 * var1, "default-bold", "center", "center", false, false, var0.postGUI)
end
function anim(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8)
  if arg1 < getTickCount() - arg0 then
    return arg5, arg6, arg7, t4
  end
  return interpolateBetween(arg2, arg3, arg4, arg5, arg6, arg7, (getTickCount() - arg0) / arg1, arg8)
end
;({
  count = getTickCount(),
  x = (guiGetScreenSize() - 400 * (guiGetScreenSize() / 1080)) / 2,
  y = 100,
  w = 400 * (guiGetScreenSize() / 1080),
  h = 10 * (guiGetScreenSize() / 1080),
  rec_w = 400 * (guiGetScreenSize() / 1080) / 10,
  level = 0,
  last_exp = 0,
  exp = 0,
  max_exp = 0,
  color = tocolor(255, 55, 95, 255),
  img_color = tocolor(255, 55, 95, 200),
  postGUI = true,
  image = false,
  awards = {}
}).show = function(arg0)
  if isTimer(var0.timer) then
    killTimer(var0.timer)
  else
    addEventHandler("onClientRender", root, var0.render)
  end
  var0.timer = setTimer(function()
    removeEventHandler("onClientRender", root, var0.render)
  end, arg0 or 8000, 1)
end
addEvent("level:show", true)
addEventHandler("level:show", localPlayer, function(arg0, arg1)
  var0.level = arg0
  var0.exp = arg1
  var0.last_exp = arg1
  var0.max_exp = getRequiredExp(arg0)
  var0.show(5000)
end)
addEvent("level:onLevelUp", true)
addEventHandler("level:onLevelUp", localPlayer, function(arg0, arg1, arg2)
  var0.show()
  var0.last_exp = arg1
  var0.exp = arg2
  var0.level = arg0
  var0.max_exp = getRequiredExp(arg0)
  var0.count = getTickCount()
end)
addEvent("level:onExpUp", true)
addEventHandler("level:onExpUp", localPlayer, function(arg0, arg1, arg2, arg3)
  if isTimer(var0.timer) then
    killTimer(var0.timer)
  else
    addEventHandler("onClientRender", root, var0.render)
  end
  var0.timer = setTimer(function()
    removeEventHandler("onClientRender", root, var0.render)
  end, 8000, 1)
  var0.last_exp = arg1
  var0.exp = arg2
  var0.level = arg0
  var0.max_exp = getRequiredExp(arg0)
  var0.count = getTickCount()
  var0.boost = arg3
end)
addEvent("level:syncLocalLevel", true)
addEventHandler("level:syncLocalLevel", localPlayer, function(arg0, arg1, arg2)
  var0.exp = arg1
  var0.level = arg0
  var0.awards = arg2
end)
addEvent("level:syncLocalAwards", true)
addEventHandler("level:syncLocalAwards", localPlayer, function(arg0)
  var0.awards = arg0
end)
function getPlayerLevel()
  return var0.level, var0.exp, getRequiredExp(var0.level)
end
function getPlayerLevelAwards()
  return var0.awards, var1
end
function getRequiredExp(arg0)
  return arg0 ^ 2 * 50
end
addCommandHandler("level", function()
  if not getElementData(localPlayer, "character:id") then
    return
  end
  if getPlayerLevel() then
    triggerEvent("level:show", localPlayer, getPlayerLevel())
  end
end, false, false)
UI = {
  progressbar = {},
  edit = {},
  label = {},
  button = {},
  gridlist = {},
  container = {},
  image = {}
}
addEventHandler("onClientUIMenuSelectChange", root, function(arg0, arg1)
  if arg1 and getElementID(source) == "main-menu" then
    eui = exports.UIKit
    if eui:uiMenuGetItemID(source, arg0) == "awards" then
      if not isElement(UI.label.current_level) then
        eui:uiSetColor(eui:uiCreateImage(25, 60, 50, 50, var0.image, arg1), 255, 255, 255, 20)
        eui:uiSetColor(eui:uiCreateImage(eui:uiGetSize(arg1) - 75, 60, 50, 50, var0.image, arg1), 255, 255, 255, 20)
        UI.label.current_level = eui:uiCreateLabel(25, 60, 50, 50, "1", "primary", "center", "center", arg1)
        UI.label.next_level = eui:uiCreateLabel(eui:uiGetSize(arg1) - 75, 60, 50, 50, "2", "primary", "center", "center", arg1)
        eui:uiSetFont(UI.label.current_level, "default-large")
        eui:uiSetFont(UI.label.next_level, "default-large")
        UI.label.exp = eui:uiCreateLabel(0, 95, eui:uiGetSize(arg1))
        UI.progressbar.exp = eui:uiCreateProgressBar(100, 80, eui:uiGetSize(arg1) - 200, 10, _, arg1)
        eui:uiSetProperty(UI.progressbar.exp, "background_color", tocolor(20, 20, 20, 240))
        eui:uiSetProperty(UI.progressbar.exp, "show_progress", false)
        eui:uiSetProperty(UI.progressbar.exp, "progress_animation", true)
        eui:uiCreateLabel(15, 150, eui:uiGetSize(arg1) - 30, 80, "\216\179\216\170\216\173\216\181\217\132 \216\185\217\132\217\137 \216\172\217\136\216\167\216\166\216\178 \217\133\216\174\216\170\217\132\217\129\216\169 \216\185\217\134\216\175 \217\136\216\181\217\136\217\132\217\131 \216\165\217\132\217\137 \217\133\216\179\216\170\217\136\217\138\216\167\216\170 \217\133\216\185\217\138\217\134\216\169 \216\163\217\136 \216\185\217\134\216\175 \216\167\217\132\216\170\217\136\216\167\216\172\216\175 \216\168\216\180\217\131\217\132 \217\133\216\179\216\170\217\133\216\177\n\217\138\217\133\217\131\217\134\217\131 \216\178\217\138\216\167\216\175\216\169 \217\133\216\179\216\170\217\136\216\167\217\131 \216\185\217\134 \216\183\216\177\217\138\217\130 \216\167\217\132\217\136\216\184\216\167\216\166\217\129 \217\136\216\167\217\132\217\133\217\135\217\133\216\167\216\170 \217\136\216\167\217\132\216\170\217\136\216\167\216\172\216\175 \216\175\216\167\216\174\217\132 \216\167\217\132\216\179\217\138\216\177\217\129\216\177\n\n\216\167\217\132\217\130\216\167\216\166\217\133\216\169 \216\167\217\132\216\170\216\167\217\132\217\138\216\169 \216\170\217\136\216\182\216\173 \216\172\217\136\216\167\216\166\216\178\217\131 \216\167\217\132\216\173\216\167\217\132\217\138\216\169 \216\167\217\132\216\170\217\138 \217\132\217\133 \217\138\216\170\217\133 \216\167\216\179\216\170\217\132\216\167\217\133\217\135\216\167 \216\168\216\185\216\175\n                    ", tocolor(255, 255, 255, 255), "center", "top", arg1)
        UI.gridlist.awards = eui:uiCreateGridList(15, 250, eui:uiGetSize(arg1) - 30, 250, tocolor(10, 10, 10, 0), arg1)
        eui:uiGridListAddColumn(UI.gridlist.awards, "Award", 0.4)
        eui:uiGridListAddColumn(UI.gridlist.awards, "Reason", 0.25)
        eui:uiGridListAddColumn(UI.gridlist.awards, "Received Date", 0.2)
        eui:uiGridListAddColumn(UI.gridlist.awards, "Expiry", 0.15)
        eui:uiSetAlign(UI.gridlist.awards, "left", "center")
        eui:uiSetProperty(UI.gridlist.awards, "color_coded", true)
        eui:uiSetProperty(UI.gridlist.awards, "row_height", 30)
        UI.button.take_award = eui:uiCreateButton((eui:uiGetSize(arg1) - 250) / 2, eui:uiGetSize(arg1) - 45, 250, 35, {
          en = "Take Award",
          ar = "\216\167\216\179\216\170\217\132\216\167\217\133 \216\167\217\132\216\172\216\167\216\166\216\178\216\169"
        }, "primary", arg1)
      end
      eui:uiSetText(UI.label.current_level, tostring(getPlayerLevel()))
      eui:uiSetText(UI.label.next_level, tostring(getPlayerLevel() + 1))
      eui:uiSetText(UI.label.exp, "" .. tostring(getPlayerLevel()) .. " / " .. tostring(getPlayerLevel()) .. "")
      eui:uiProgressBarSetProgress(UI.progressbar.exp, getPlayerLevel() / getPlayerLevel() * 100)
      if getPlayerLevelAwards() then
        eui:uiGridListClear(UI.gridlist.awards)
        for forvar12, forvar13 in ipairs(getPlayerLevelAwards()) do
          eui:uiGridListSetItemData(UI.gridlist.awards, eui:uiGridListAddRow(UI.gridlist.awards), 1, forvar13.id)
          eui:uiGridListSetItemText(UI.gridlist.awards, eui:uiGridListAddRow(UI.gridlist.awards), 1, forvar13.description or tostring(getPlayerLevelAwards()[forvar13.award]))
          eui:uiGridListSetItemText(UI.gridlist.awards, eui:uiGridListAddRow(UI.gridlist.awards), 2, forvar13.reason or "Reached Level " .. tostring(forvar13.level))
          eui:uiGridListSetItemText(UI.gridlist.awards, eui:uiGridListAddRow(UI.gridlist.awards), 3, tostring(forvar13.createdAt))
          eui:uiGridListSetItemText(UI.gridlist.awards, eui:uiGridListAddRow(UI.gridlist.awards), 4, forvar13.expiry_date or "-")
          eui:uiGridListSetItemColor(UI.gridlist.awards, eui:uiGridListAddRow(UI.gridlist.awards), 1, tocolor(0, 255, 0, 255))
          eui:uiGridListSetItemColor(UI.gridlist.awards, eui:uiGridListAddRow(UI.gridlist.awards), 2, tocolor(0, 255, 0, 255))
          eui:uiGridListSetItemColor(UI.gridlist.awards, eui:uiGridListAddRow(UI.gridlist.awards), 3, tocolor(0, 255, 0, 255))
        end
      end
    end
  end
end)
addEventHandler("onClientUIClick", root, function()
  if source == UI.button.take_award and eui:uiGridListGetSelectedItem(UI.gridlist.awards) ~= -1 then
    eui:uiGridListSetSelectedItem(UI.gridlist.awards, -1)
    triggerServerEvent("level:takeAward", localPlayer, (eui:uiGridListGetItemData(UI.gridlist.awards, eui:uiGridListGetSelectedItem(UI.gridlist.awards), 1)))
  end
end)
