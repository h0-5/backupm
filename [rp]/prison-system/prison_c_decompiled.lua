-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

GUIEditor = {
  label = {},
  combobox = {},
  edit = {},
  button = {},
  window = {},
  gridlist = {},
  memo = {}
}
addEventHandler("onClientResourceStart", resourceRoot, function()
  GUIEditor.window[1] = guiCreateWindow((guiGetScreenSize() - 733) / 2, (guiGetScreenSize() - 445) / 2, 733, 445, "Prison System", false)
  guiWindowSetSizable(GUIEditor.window[1], false)
  guiSetVisible(GUIEditor.window[1], false)
  GUIEditor.gridlist[1] = guiCreateGridList(9, 27, 714, 339, false, GUIEditor.window[1])
  guiGridListAddColumn(GUIEditor.gridlist[1], "ID", 0.05)
  guiGridListAddColumn(GUIEditor.gridlist[1], "Cell", 0.1)
  guiGridListAddColumn(GUIEditor.gridlist[1], "Name", 0.2)
  guiGridListAddColumn(GUIEditor.gridlist[1], "Conviction date", 0.2)
  guiGridListAddColumn(GUIEditor.gridlist[1], "Released in hours", 0.15)
  guiGridListAddColumn(GUIEditor.gridlist[1], "Released in minutes", 0.15)
  guiGridListAddColumn(GUIEditor.gridlist[1], "Fine", 0.1)
  guiGridListAddColumn(GUIEditor.gridlist[1], "Last Updated by", 0.2)
  guiGridListAddColumn(GUIEditor.gridlist[1], "Charges", 0.3)
  GUIEditor.button[1] = guiCreateButton(10, 372, 145, 29, "Release prisoner", false, GUIEditor.window[1])
  GUIEditor.button[2] = guiCreateButton(160, 372, 145, 29, "Update prisoner", false, GUIEditor.window[1])
  GUIEditor.button[3] = guiCreateButton(310, 372, 145, 29, "Add new prisoner", false, GUIEditor.window[1])
  GUIEditor.button[4] = guiCreateButton(629, 372, 94, 29, "Close", false, GUIEditor.window[1])
  GUIEditor.button[5] = guiCreateButton(10, 406, 145, 29, "Toggle gate number", false, GUIEditor.window[1])
  GUIEditor.button[6] = guiCreateButton(160, 406, 145, 29, "Toggle all gates", false, GUIEditor.window[1])
  GUIEditor.label[1] = guiCreateLabel(315, 406, 408, 29, [[
0 Gates Closed
0 Gates Open]], false, GUIEditor.window[1])
  GUIEditor.window[2] = guiCreateWindow((guiGetScreenSize() - 280) / 2, (guiGetScreenSize() - 330) / 2, 280, 330, "", false)
  guiWindowSetSizable(GUIEditor.window[2], false)
  guiSetVisible(GUIEditor.window[2], false)
  GUIEditor.label[2] = guiCreateLabel(10, 36, 52, 15, "Name:", false, GUIEditor.window[2])
  guiSetFont(GUIEditor.label[2], "default-bold-small")
  GUIEditor.edit[1] = guiCreateEdit(62, 31, 208, 26, "", false, GUIEditor.window[2])
  GUIEditor.label[3] = guiCreateLabel(10, 98, 33, 15, "Cell:", false, GUIEditor.window[2])
  guiSetFont(GUIEditor.label[3], "default-bold-small")
  GUIEditor.combobox[1] = guiCreateComboBox(43, 94, 82, 191, "", false, GUIEditor.window[2])
  for forvar5, forvar6 in ipairs(var0) do
    guiComboBoxAddItem(GUIEditor.combobox[1], forvar6[1])
  end
  GUIEditor.label[4] = guiCreateLabel(140, 98, 34, 15, "Fine:", false, GUIEditor.window[2])
  guiSetFont(GUIEditor.label[4], "default-bold-small")
  GUIEditor.edit[2] = guiCreateEdit(178, 92, 92, 26, "", false, GUIEditor.window[2])
  GUIEditor.label[5] = guiCreateLabel(62, 61, 208, 15, "", false, GUIEditor.window[2])
  GUIEditor.label[6] = guiCreateLabel(10, 135, 260, 15, "Conviction Time", false, GUIEditor.window[2])
  guiSetFont(GUIEditor.label[6], "default-bold-small")
  GUIEditor.label[7] = guiCreateLabel(10, 161, 33, 15, "Hours:", false, GUIEditor.window[2])
  GUIEditor.label[8] = guiCreateLabel(147, 161, 38, 15, "Minutes:", false, GUIEditor.window[2])
  GUIEditor.edit[3] = guiCreateEdit(45, 156, 82, 26, "", false, GUIEditor.window[2])
  GUIEditor.edit[4] = guiCreateEdit(188, 156, 82, 26, "", false, GUIEditor.window[2])
  GUIEditor.label[9] = guiCreateLabel(10, 192, 260, 15, "Charges", false, GUIEditor.window[2])
  guiSetFont(GUIEditor.label[9], "default-bold-small")
  GUIEditor.memo[1] = guiCreateMemo(10, 209, 260, 72, "", false, GUIEditor.window[2])
  GUIEditor.button[7] = guiCreateButton(10, 291, 144, 29, "Add prisoner", false, GUIEditor.window[2])
  GUIEditor.button[8] = guiCreateButton(158, 291, 112, 29, "Close", false, GUIEditor.window[2])
end)
addEvent("prison:showPrisonPanel", true)
addEventHandler("prison:showPrisonPanel", root, function()
  guiSetVisible(GUIEditor.window[1], true)
  triggerServerEvent("prison:getPrisoners", localPlayer)
end)
addEvent("prison:sendPrisonersToClient", true)
addEventHandler("prison:sendPrisonersToClient", root, function(arg0)
  guiGridListClear(GUIEditor.gridlist[1])
  for forvar4, forvar5 in ipairs(arg0) do
    guiGridListSetItemText(GUIEditor.gridlist[1], guiGridListAddRow(GUIEditor.gridlist[1]), 1, tostring(forvar4), false, false)
    guiGridListSetItemData(GUIEditor.gridlist[1], guiGridListAddRow(GUIEditor.gridlist[1]), 1, tostring(forvar5.ID))
    guiGridListSetItemText(GUIEditor.gridlist[1], guiGridListAddRow(GUIEditor.gridlist[1]), 2, tostring(forvar5.Cell), false, false)
    guiGridListSetItemText(GUIEditor.gridlist[1], guiGridListAddRow(GUIEditor.gridlist[1]), 3, tostring(forvar5.Name), false, false)
    guiGridListSetItemText(GUIEditor.gridlist[1], guiGridListAddRow(GUIEditor.gridlist[1]), 4, tostring(tostring((forvar5.ConvictionDate and fromJSON(forvar5.ConvictionDate) or {}).monthday) .. "-" .. tostring((forvar5.ConvictionDate and fromJSON(forvar5.ConvictionDate) or {}).month) .. "-" .. tostring((forvar5.ConvictionDate and fromJSON(forvar5.ConvictionDate) or {}).year) .. " " .. tostring((forvar5.ConvictionDate and fromJSON(forvar5.ConvictionDate) or {}).hour) .. ":" .. tostring((forvar5.ConvictionDate and fromJSON(forvar5.ConvictionDate) or {}).minute) .. ":" .. tostring((forvar5.ConvictionDate and fromJSON(forvar5.ConvictionDate) or {}).second)), false, false)
    guiGridListSetItemText(GUIEditor.gridlist[1], guiGridListAddRow(GUIEditor.gridlist[1]), 5, tostring(secondsToHM(forvar5.duration)), false, false)
    guiGridListSetItemText(GUIEditor.gridlist[1], guiGridListAddRow(GUIEditor.gridlist[1]), 6, tostring(secondsToHM(forvar5.duration)), false, false)
    guiGridListSetItemText(GUIEditor.gridlist[1], guiGridListAddRow(GUIEditor.gridlist[1]), 7, tostring(forvar5.Fine), false, false)
    guiGridListSetItemText(GUIEditor.gridlist[1], guiGridListAddRow(GUIEditor.gridlist[1]), 8, tostring(forvar5.LastUpdated), false, false)
    guiGridListSetItemText(GUIEditor.gridlist[1], guiGridListAddRow(GUIEditor.gridlist[1]), 9, tostring(forvar5.Charges), false, false)
  end
  for forvar6, forvar7 in ipairs(getElementsByType("object", resourceRoot)) do
    if getElementModel(forvar7) == 1507 then
      if getElementData(forvar7, "prison:gate.state") then
      else
      end
    end
  end
  guiSetText(GUIEditor.label[1], tostring(0 + 1) .. " Gates Closed\n" .. tostring(0 + 1) .. " Gates Open")
end)
addEventHandler("onClientGUIClick", resourceRoot, function()
  if source == GUIEditor.button[4] then
    guiSetVisible(GUIEditor.window[1], false)
  elseif source == GUIEditor.button[3] then
    guiSetEnabled(GUIEditor.window[1], false)
    guiSetVisible(GUIEditor.window[2], true)
    guiBringToFront(GUIEditor.window[2])
    guiSetText(GUIEditor.window[2], "Add New Prisoner")
    guiSetText(GUIEditor.button[7], "Add prisoner")
  elseif source == GUIEditor.button[2] then
    if guiGridListGetSelectedItem(GUIEditor.gridlist[1]) ~= -1 then
      guiSetText(GUIEditor.edit[1], guiGridListGetItemText(GUIEditor.gridlist[1], guiGridListGetSelectedItem(GUIEditor.gridlist[1]), 3))
      guiSetText(GUIEditor.edit[2], guiGridListGetItemText(GUIEditor.gridlist[1], guiGridListGetSelectedItem(GUIEditor.gridlist[1]), 7))
      guiSetText(GUIEditor.edit[3], guiGridListGetItemText(GUIEditor.gridlist[1], guiGridListGetSelectedItem(GUIEditor.gridlist[1]), 5))
      guiSetText(GUIEditor.edit[4], guiGridListGetItemText(GUIEditor.gridlist[1], guiGridListGetSelectedItem(GUIEditor.gridlist[1]), 6))
      guiSetText(GUIEditor.memo[1], guiGridListGetItemText(GUIEditor.gridlist[1], guiGridListGetSelectedItem(GUIEditor.gridlist[1]), 9))
      guiSetEnabled(GUIEditor.window[1], false)
      guiSetVisible(GUIEditor.window[2], true)
      guiBringToFront(GUIEditor.window[2])
      guiSetText(GUIEditor.window[2], "Update Prisoner")
      guiSetText(GUIEditor.button[7], "Update prisoner")
      var0 = guiGridListGetItemData(GUIEditor.gridlist[1], guiGridListGetSelectedItem(GUIEditor.gridlist[1]), 1)
    end
  elseif source == GUIEditor.button[8] then
    guiSetEnabled(GUIEditor.window[1], true)
    guiSetVisible(GUIEditor.window[2], false)
  elseif source == GUIEditor.button[7] then
    if guiComboBoxGetSelected(GUIEditor.combobox[1]) == -1 then
      return
    end
    if tonumber(tonumber((guiGetText(GUIEditor.edit[3]))) or 0) > 10 then
      outputChatBox("Error: Maximum 10 hours.", 255, 0, 0)
      return
    end
    if tonumber(tonumber((guiGetText(GUIEditor.edit[4]))) or 0) > 60 then
      outputChatBox("Error: Maximum 60 minutes.", 255, 0, 0)
      return
    end
    if tonumber((guiGetText(GUIEditor.edit[2]))) > 10000000 then
      return
    end
    if guiGetText(source) == "Add prisoner" then
      triggerServerEvent("prison:addPrisoner", localPlayer, guiGetText(GUIEditor.edit[1]), guiComboBoxGetItemText(GUIEditor.combobox[1], (guiComboBoxGetSelected(GUIEditor.combobox[1]))), guiGetText(GUIEditor.edit[2]), tonumber(tonumber((guiGetText(GUIEditor.edit[3]))) or 0) or 0, tonumber(tonumber((guiGetText(GUIEditor.edit[4]))) or 0) or 0, (guiGetText(GUIEditor.memo[1])))
    else
      triggerServerEvent("prison:updatePrisoner", localPlayer, var0, guiGetText(GUIEditor.edit[1]), guiComboBoxGetItemText(GUIEditor.combobox[1], (guiComboBoxGetSelected(GUIEditor.combobox[1]))), guiGetText(GUIEditor.edit[2]), tonumber(tonumber((guiGetText(GUIEditor.edit[3]))) or 0) or 0, tonumber(tonumber((guiGetText(GUIEditor.edit[4]))) or 0) or 0, (guiGetText(GUIEditor.memo[1])))
    end
    guiSetEnabled(GUIEditor.window[1], true)
    guiSetVisible(GUIEditor.window[2], false)
  elseif source == GUIEditor.button[1] then
    if guiGridListGetSelectedItem(GUIEditor.gridlist[1]) ~= -1 then
      triggerServerEvent("prison:releasePrisoner", localPlayer, (guiGridListGetItemData(GUIEditor.gridlist[1], guiGridListGetSelectedItem(GUIEditor.gridlist[1]), 1)))
    end
  elseif source == GUIEditor.button[6] then
    triggerServerEvent("prison:toggleGates", localPlayer, not togGates)
    togGates = not togGates
  end
end)
function secondsToHM(arg0)
  arg0 = tonumber(arg0)
  return math.floor(arg0 % (24 * (60 * 60)) / (60 * 60)) + math.floor(arg0 / (24 * (60 * 60))) * 24, (math.floor(arg0 % (24 * (60 * 60)) % (60 * 60) / 60))
end
function convertTimeToString(arg0)
  arg0 = tonumber(arg0)
  return math.floor(arg0 / (24 * (60 * 60))) .. " days " .. math.floor(arg0 % (24 * (60 * 60)) / (60 * 60)) .. " hours" .. " " .. math.floor(arg0 % (24 * (60 * 60)) % (60 * 60) / 60) .. " minutes " .. math.ceil(arg0 % (24 * (60 * 60)) % (60 * 60) % 60) .. " seconds"
end
addEvent("prison:startPrisonTimer", true)
addEventHandler("prison:startPrisonTimer", localPlayer, function(arg0)
  if var0 then
    var1 = arg0
    return
  end
  var1 = arg0
  if isTimer(var2) then
    killTimer(var2)
  end
  var2 = setTimer(function()
    if var0 > 0 then
      var0 = var0 - 1
    else
      killTimer(var1)
    end
  end, 1000, 0)
  addEventHandler("onClientRender", root, renderPrisonText)
  addEventHandler("onClientKey", root, cancelBindsInPrison)
  var0 = true
end)
function renderPrisonText()
  dxDrawText(convertTimeToString(var0), 0, var1 - 150, var2, var1 - 100, tocolor(254, 0, 0, 255), 1.2, "default", "center", "center", false, false, false, true, false)
end
addEventHandler("onClientElementDataChange", localPlayer, function(arg0, arg1, arg2)
  if arg0 == "prisoner" and not arg2 then
    if isTimer(var0) then
      killTimer(var0)
    end
    removeEventHandler("onClientRender", root, renderPrisonText)
    var1 = false
    removeEventHandler("onClientKey", root, cancelBindsInPrison)
  end
end)
function cancelBindsInPrison(arg0, arg1)
  if arg1 and var0[string.lower(arg0)] then
    cancelEvent()
  end
end
