-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

addEventHandler("onClientResourceStart", resourceRoot, function()
end)
function replacePedAnimations(arg0)
  for forvar4, forvar5 in ipairs(var0.anims) do
    engineReplaceAnimation(arg0, "ped", forvar5, var0.ifp.block, forvar5)
  end
end
addEventHandler("onClientResourceStart", resourceRoot, function()
  var0.ifp.block = "ped"
  var0.ifp.ifp = engineLoadIFP("ped.ifp", var0.ifp.block)
  engineLoadIFP("sword.ifp", "swordBIOS")
  engineLoadIFP("salute.ifp", "salute")
  engineLoadIFP("ghands.ifp", "salute2")
  for forvar4, forvar5 in ipairs(getElementsByType("player")) do
    engineReplaceAnimation(forvar5, "PYTHON", "python_reload", "PYTHON2", "python_reload")
    replacePedAnimations(forvar5)
  end
end)
addEventHandler("onClientPlayerJoin", root, function()
  replacePedAnimations(source)
end)
addEvent("anims:setPedCustomAnimation", true)
addEventHandler("anims:setPedCustomAnimation", root, function(arg0, arg1, arg2, arg3, arg4, arg5, arg6)
  setPedAnimation(source, arg0, arg1, arg2, arg3, arg4, arg5, arg6)
end)
addEventHandler("onClientResourceStart", resourceRoot, function()
  if xmlLoadFile("animations.xml") then
    for forvar4, forvar5 in ipairs(xmlNodeGetChildren((xmlLoadFile("animations.xml"))) or {}) do
      table.insert(var0.groups, (xmlNodeGetAttribute(forvar5, "name")))
      var0.anims[xmlNodeGetAttribute(forvar5, "name")] = {}
      for forvar10, forvar11 in ipairs(xmlNodeGetChildren(forvar5) or {}) do
        table.insert(var0.anims[xmlNodeGetAttribute(forvar5, "name")], (xmlNodeGetAttribute(forvar11, "name")))
      end
    end
    xmlUnloadFile((xmlLoadFile("animations.xml")))
  end
  saved_anims_file = xmlLoadFile("saved_animations.xml")
  if not saved_anims_file then
    saved_anims_file = xmlCreateFile("saved_animations.xml", "anims")
  else
    saved_anims_file = xmlLoadFile("saved_animations.xml")
  end
  refreshAnimBinds()
end)
function getAllAnimations()
  return var0
end
function refreshAnimBinds()
  var0 = {}
  for forvar3, forvar4 in ipairs(xmlNodeGetChildren(saved_anims_file) or {}) do
    var0[xmlNodeGetAttribute(forvar4, "key")] = {
      xmlNodeGetAttribute(forvar4, "group"),
      (xmlNodeGetAttribute(forvar4, "name"))
    }
  end
end
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
  tab = {},
  radiobutton = {},
  gridlist = {},
  memo = {},
  scrollbar = {},
  combobox = {}
}
function UIKitReady()
  eui = exports.UIKit
  var0 = eui:getUIFont("ui-default")
  var1 = eui:uiGetThemeColor("primary")
  var2 = eui:uiGetThemeColor("secondary")
  UI.window[1] = eui:uiCreateWindow(50, false, 250, 460, "Animations")
  eui:uiSetVisible(UI.window[1], false)
  UI.tabpanel[1] = eui:uiCreateTabPanel(5, 70, 240, 380, "", tocolor(30, 30, 30, 0), UI.window[1])
  eui:uiSetProperty(UI.tabpanel[1], "title_shown", false)
  UI.tab[1] = eui:uiCreateTab("All", "", UI.tabpanel[1])
  eui:uiSetSelectedTab(UI.tabpanel[1], UI.tab[1])
  UI.tab[2] = eui:uiCreateTab("Saved", "", UI.tabpanel[1])
  UI.gridlist[1] = eui:uiCreateGridList(0, 10, 240, 275, tocolor(10, 10, 10, 0), UI.tab[1])
  eui:uiGridListAddColumn(UI.gridlist[1], "MENU", 0.9)
  eui:uiSetAlign(UI.gridlist[1], "center", "center")
  UI.checkbox[1] = eui:uiCreateCheckBox(8, 290, 240, 30, "Repeat animation", false, _, UI.tab[1])
  UI.button[1] = eui:uiCreateButton(5, 315, 230, 30, "Save", tocolor(0, 0, 0), UI.tab[1])
  UI.button[2] = eui:uiCreateButton(10, 420, 230, 30, "Close", tocolor(0, 0, 0), UI.window[1])
  UI.gridlist[2] = eui:uiCreateGridList(0, 10, 240, 265, tocolor(10, 10, 10, 0), UI.tab[2])
  eui:uiGridListAddColumn(UI.gridlist[2], "Anim", 0.65)
  eui:uiGridListAddColumn(UI.gridlist[2], "Key", 0.3)
  UI.button[3] = eui:uiCreateButton(5, 280, 230, 30, "Save Changes", tocolor(0, 0, 0), UI.tab[2])
  UI.button[4] = eui:uiCreateButton(5, 315, 230, 30, "Remove", tocolor(0, 0, 0), UI.tab[2])
end
addEventHandler("onClientUIReady", resourceRoot, UIKitReady)
addEventHandler("onClientUIKitReady", root, UIKitReady)
addCommandHandler("animselect", function()
  if not getElementData(localPlayer, "character:id") then
    return
  end
  if eui:uiGetVisible(UI.window[1]) then
    eui:uiSetVisible(UI.window[1], false)
    showCursor(false)
    return
  end
  eui:uiSetVisible(UI.window[1], true)
  showCursor(true)
  if not var0 then
    var0 = true
    var1 = ""
    eui:uiGridListClear(UI.gridlist[1])
    for forvar3, forvar4 in ipairs(var2.groups) do
      eui:uiGridListSetItemText(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 1, tostring(forvar4))
    end
  end
  eui:uiGridListClear(UI.gridlist[2])
  for forvar3, forvar4 in ipairs(xmlNodeGetChildren(saved_anims_file) or {}) do
    eui:uiGridListSetItemText(UI.gridlist[2], eui:uiGridListAddRow(UI.gridlist[2]), 1, tostring((xmlNodeGetAttribute(forvar4, "name"))) .. " - " .. tostring((xmlNodeGetAttribute(forvar4, "group"))))
    eui:uiGridListSetItemData(UI.gridlist[2], eui:uiGridListAddRow(UI.gridlist[2]), 1, {
      xmlNodeGetAttribute(forvar4, "group"),
      (xmlNodeGetAttribute(forvar4, "name"))
    })
    eui:uiGridListSetItemText(UI.gridlist[2], eui:uiGridListAddRow(UI.gridlist[2]), 2, tostring((xmlNodeGetAttribute(forvar4, "key"))))
  end
end)
function playerPressedKey(arg0, arg1)
  if arg1 then
    if var0[arg0] then
      return
    end
    if eui:uiGetVisible(UI.window[1]) then
      if eui:uiGridListGetSelectedItem(UI.gridlist[2]) ~= -1 then
        eui:uiGridListSetItemText(UI.gridlist[2], eui:uiGridListGetSelectedItem(UI.gridlist[2]), 2, arg0)
      end
    elseif var1[arg0] then
      if isPedInVehicle(localPlayer) then
        outputChatBox("(( You cannot play animation inside a vehicle ))", 255, 0, 0)
        return
      end
      if getPedMoveState(localPlayer) == "walk" or getPedMoveState(localPlayer) == "powerwalk" or getPedMoveState(localPlayer) == "jog" or getPedMoveState(localPlayer) == "sprint" or getPedMoveState(localPlayer) == "jump" or getPedMoveState(localPlayer) == "fall" then
        return
      end
      if var2 and getTickCount() - var2 < 1000 then
        return
      end
      var2 = getTickCount()
      triggerServerEvent("anims:applyAnimation", localPlayer, unpack(var1[arg0]))
    end
  end
end
addEventHandler("onClientKey", root, playerPressedKey)
addEventHandler("onClientUIDoubleClick", root, function()
  if source == UI.gridlist[1] then
    if eui:uiGridListGetSelectedItem(UI.gridlist[1]) ~= -1 then
      if var0 == "" then
        var0 = eui:uiGridListGetItemText(UI.gridlist[1], eui:uiGridListGetSelectedItem(UI.gridlist[1]), 1)
        eui:uiGridListClear(UI.gridlist[1])
        eui:uiGridListSetItemText(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 1, "...")
        for forvar5, forvar6 in ipairs(var1.anims[eui:uiGridListGetItemText(UI.gridlist[1], eui:uiGridListGetSelectedItem(UI.gridlist[1]), 1)]) do
          eui:uiGridListSetItemText(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 1, tostring(forvar6))
        end
      elseif eui:uiGridListGetItemText(UI.gridlist[1], eui:uiGridListGetSelectedItem(UI.gridlist[1]), 1) == "..." then
        var0 = ""
        eui:uiGridListClear(UI.gridlist[1])
        for forvar5, forvar6 in ipairs(var1.groups) do
          eui:uiGridListSetItemText(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 1, tostring(forvar6))
        end
      else
        if isPedInVehicle(localPlayer) then
          outputChatBox("(( You cannot play animation inside a vehicle ))", 255, 0, 0)
          return
        end
        triggerServerEvent("anims:applyAnimation", localPlayer, var0, eui:uiGridListGetItemText(UI.gridlist[1], eui:uiGridListGetSelectedItem(UI.gridlist[1]), 1), (eui:uiCheckBoxGetSelected(UI.checkbox[1])))
      end
    end
  elseif source == UI.gridlist[2] and eui:uiGridListGetSelectedItem(UI.gridlist[2]) ~= -1 then
    if isPedInVehicle(localPlayer) then
      outputChatBox("(( You cannot play animation inside a vehicle ))", 255, 0, 0)
      return
    end
    triggerServerEvent("anims:applyAnimation", localPlayer, unpack(eui:uiGridListGetItemData(UI.gridlist[2], eui:uiGridListGetSelectedItem(UI.gridlist[2]), 1)))
  end
end)
addEventHandler("onClientUIClick", root, function()
  if source == UI.button[1] then
    if eui:uiGridListGetSelectedItem(UI.gridlist[1]) ~= -1 and var0 ~= "" then
      xmlNodeSetAttribute(xmlCreateChild(saved_anims_file, "anim"), "group", var0)
      xmlNodeSetAttribute(xmlCreateChild(saved_anims_file, "anim"), "name", (eui:uiGridListGetItemText(UI.gridlist[1], eui:uiGridListGetSelectedItem(UI.gridlist[1]), 1)))
      xmlNodeSetAttribute(xmlCreateChild(saved_anims_file, "anim"), "key", "")
      xmlSaveFile(saved_anims_file)
      exports.notifications:output({
        en = "Animation saved successfully",
        ar = "\216\170\217\133 \216\173\217\129\216\184 \216\167\217\132\216\173\216\177\217\131\216\169 \216\168\217\134\216\172\216\167\216\173"
      }, 4000, "success")
      eui:uiGridListClear(UI.gridlist[2])
      for forvar6, forvar7 in ipairs(xmlNodeGetChildren(saved_anims_file) or {}) do
        eui:uiGridListSetItemText(UI.gridlist[2], eui:uiGridListAddRow(UI.gridlist[2]), 1, tostring((xmlNodeGetAttribute(forvar7, "name"))) .. " - " .. tostring((xmlNodeGetAttribute(forvar7, "group"))))
        eui:uiGridListSetItemData(UI.gridlist[2], eui:uiGridListAddRow(UI.gridlist[2]), 1, {
          xmlNodeGetAttribute(forvar7, "group"),
          (xmlNodeGetAttribute(forvar7, "name"))
        })
        eui:uiGridListSetItemText(UI.gridlist[2], eui:uiGridListAddRow(UI.gridlist[2]), 2, tostring((xmlNodeGetAttribute(forvar7, "key"))))
      end
    end
  elseif source == UI.button[3] then
    for forvar3 = 1, eui:uiGridListGetRowCount(UI.gridlist[2]) do
      if xmlFindChild(saved_anims_file, "anim", forvar3 - 1) then
        xmlNodeSetAttribute(xmlFindChild(saved_anims_file, "anim", forvar3 - 1), "key", (eui:uiGridListGetItemText(UI.gridlist[2], forvar3 - 1, 2)))
      end
    end
    xmlSaveFile(saved_anims_file)
    exports.notifications:output({
      en = "Changes saved successfully",
      ar = "\216\170\217\133 \216\173\217\129\216\184 \216\167\217\132\216\170\216\186\217\138\217\138\216\177\216\167\216\170 \216\168\217\134\216\172\216\167\216\173"
    }, 4000, "success")
    refreshAnimBinds()
  elseif source == UI.button[4] then
    if eui:uiGridListGetSelectedItem(UI.gridlist[2]) ~= -1 and xmlFindChild(saved_anims_file, "anim", (eui:uiGridListGetSelectedItem(UI.gridlist[2]))) then
      eui:uiGridListRemoveRow(UI.gridlist[2], (eui:uiGridListGetSelectedItem(UI.gridlist[2])))
      xmlDestroyNode((xmlFindChild(saved_anims_file, "anim", (eui:uiGridListGetSelectedItem(UI.gridlist[2])))))
      xmlSaveFile(saved_anims_file)
    end
  elseif source == UI.button[2] then
    eui:uiSetVisible(UI.window[1], false)
    showCursor(false)
  end
end)
;({
  x = (guiGetScreenSize() - 300 * (guiGetScreenSize() / 1080)) / 2,
  y = guiGetScreenSize()
}).h = 5 * (guiGetScreenSize() / 1080) + (({
  x = (guiGetScreenSize() - 300 * (guiGetScreenSize() / 1080)) / 2,
  y = guiGetScreenSize()
}).row_h + 5 * (guiGetScreenSize() / 1080)) * #({
  x = (guiGetScreenSize() - 300 * (guiGetScreenSize() / 1080)) / 2,
  y = guiGetScreenSize()
}).list
;({
  x = (guiGetScreenSize() - 300 * (guiGetScreenSize() / 1080)) / 2,
  y = guiGetScreenSize()
}).render = function()
  var0.y = animation(var0.tick, 200, var0.yi, 0, 0, var0.yf, 0, 0, "Linear")
  dxDrawRoundedRectangle(var0.x, var0.y, var0.w, var0.h, tocolor(19, 22, 27, 240), 8, true)
  for forvar4 = 1, #var0.list do
    if isMouseInPosition(var0.x + 5 * var1, var0.y + 5 * var1 + (var0.row_h + 5 * var1) * (forvar4 - 1), var0.w - 10 * var1, var0.row_h) then
    end
    if not isMouseInPosition(var0.x + 5 * var1, var0.y + 5 * var1 + (var0.row_h + 5 * var1) * (forvar4 - 1), var0.w - 10 * var1, var0.row_h) or not var2 then
    end
    dxDrawRoundedRectangle(var0.x + 5 * var1, var0.y + 5 * var1 + (var0.row_h + 5 * var1) * (forvar4 - 1), var0.w - 10 * var1, var0.row_h, tocolor(9, 12, 17, 220), 8, true)
    dxDrawText(var0.list[forvar4].text, var0.x + 5 * var1, var0.y + 5 * var1 + (var0.row_h + 5 * var1) * (forvar4 - 1), var0.x + 5 * var1 + (var0.w - 10 * var1), var0.y + 5 * var1 + (var0.row_h + 5 * var1) * (forvar4 - 1) + var0.row_h, isMouseInPosition(var0.x + 5 * var1, var0.y + 5 * var1 + (var0.row_h + 5 * var1) * (forvar4 - 1), var0.w - 10 * var1, var0.row_h) and var3 or _, 1, var4, "center", "center", _, _, true)
  end
  _FOR_.hovered = var0.list[forvar4].command
end
function toggleAnimMenu(arg0)
  if arg0 then
    if not getElementData(localPlayer, "character:id") then
      return
    end
    if isPedInVehicle(localPlayer) or isPedDead(localPlayer) then
      return
    end
    var0.hovered = false
    showCursor(true)
    var0.yi = var0.y
    var0.yf = var1 - var0.h - 10
    var0.tick = getTickCount()
    if isTimer(var0.hideTimer) then
      killTimer(var0.hideTimer)
    else
      addEventHandler("onClientRender", root, var0.render, false)
    end
    addEventHandler("onClientClick", root, var0.click)
  else
    showCursor(false)
    var0.yi = var0.y
    var0.yf = var1 + 5
    var0.tick = getTickCount()
    if isTimer(var0.hideTimer) then
      killTimer(var0.hideTimer)
    end
    var0.hideTimer = setTimer(function()
      removeEventHandler("onClientRender", root, var0.render)
    end, 200, 1)
    removeEventHandler("onClientClick", root, var0.click)
  end
end
bindKey("N", "both", function(arg0, arg1)
  toggleAnimMenu(arg1 == "down")
end)
;({
  x = (guiGetScreenSize() - 300 * (guiGetScreenSize() / 1080)) / 2,
  y = guiGetScreenSize()
}).click = function(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7)
  if arg0 == "left" and arg1 == "up" and var0.hovered and getTickCount() - var1 > 1000 then
    var1 = getTickCount()
    executeCommandHandler(var0.hovered)
    toggleAnimMenu(false)
  end
end
function isMouseInPosition(arg0, arg1, arg2, arg3)
  if isCursorShowing() and arg0 <= getCursorPosition() * var0 and arg1 <= getCursorPosition() * var1 and getCursorPosition() * var0 <= arg0 + arg2 and getCursorPosition() * var1 <= arg1 + arg3 then
    return true
  end
  return false
end
function animation(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8)
  return interpolateBetween(arg2, arg3, arg4, arg5, arg6, arg7, (getTickCount() - arg0) / (arg0 + arg1 - arg0), arg8)
end
function dxDrawRoundedRectangle(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7)
  arg2, arg3, arg0, arg1 = arg2 - arg5 * 2, arg3 - arg5 * 2, math.floor(arg0 + arg5), math.floor(arg1 + arg5)
  dxDrawRectangle(arg0 - arg5, arg1, arg2 + arg5 * 2, arg3, arg4, arg6)
  dxDrawRectangle(arg0, arg1 - arg5, arg2, arg5, arg4, arg6)
  dxDrawRectangle(arg0, arg1 + arg3, arg2, arg5, arg4, arg6)
  dxDrawCircle(arg0, arg1, arg5, 180, 270, arg4, arg4, 7, _, arg6)
  dxDrawCircle(arg0 + arg2, arg1, arg5, 270, 360, arg4, arg4, 7, _, arg6)
  dxDrawCircle(arg0, arg1 + arg3, arg5, 90, 180, arg4, arg4, 7, _, arg6)
  dxDrawCircle(arg0 + arg2, arg1 + arg3, arg5, 0, 90, arg4, arg4, 7, _, arg6)
end
function applyAnimation(arg0)
  if isPedInVehicle(localPlayer) then
    return
  end
  if isPedDead(localPlayer) then
    return
  end
  if getPedMoveState(localPlayer) == "walk" or getPedMoveState(localPlayer) == "powerwalk" or getPedMoveState(localPlayer) == "jog" or getPedMoveState(localPlayer) == "sprint" or getPedMoveState(localPlayer) == "jump" or getPedMoveState(localPlayer) == "fall" then
    return
  end
  if isAnimBlocked(localPlayer) then
    return
  end
  if var0 and getTickCount() - var0 < 1000 then
    return
  end
  var0 = getTickCount()
  triggerLatentServerEvent("anims:command", 50000, localPlayer, arg0)
end
for forvar20, forvar21 in ipairs({
  "fucku",
  "fu",
  "sit",
  "getup",
  "cover",
  "wait",
  "think",
  "shake",
  "lean",
  "handsup",
  "heiltaxi",
  "hailtaxi",
  "heil",
  "smoke",
  "lightup",
  "lay",
  "cry",
  "rap1",
  "rap2",
  "rap3",
  "salute",
  "wave",
  "never",
  "fall",
  "fallfront",
  "backhands",
  "kiss",
  "crack",
  "bye",
  "cpr",
  "laugh",
  "tired",
  "shove",
  "what",
  "win",
  "strip",
  "scratch",
  "idle",
  "copcome",
  "copleft",
  "copstop"
}) do
  addCommandHandler(forvar21, applyAnimation, false)
end
function isAnimBlocked(arg0)
  if type((getElementData(arg0, "temp:block.anims"))) == "table" then
    return getTickCount() - getElementData(arg0, "temp:block.anims")[1] <= getElementData(arg0, "temp:block.anims")[2]
  else
    return (getElementData(arg0, "temp:block.anims"))
  end
end
