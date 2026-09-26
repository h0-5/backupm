-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

Duty = {
  checkbox = {},
  scrollpane = {},
  edit = {},
  button = {},
  window = {},
  label = {},
  gridlist = {}
}
ALocations = {
  button = {},
  window = {},
  edit = {},
  label = {}
}
AVLocations = {
  button = {},
  window = {},
  edit = {},
  label = {}
}
addEventHandler("onClientResourceStart", resourceRoot, function()
  Duty.window[1] = guiCreateWindow((var0 - 256) / 2, (var1 - 360) / 2, 256, 360, "Faction Perks", false)
  guiWindowSetSizable(Duty.window[1], false)
  guiSetVisible(Duty.window[1], false)
  Duty.scrollpane[1] = guiCreateScrollPane(10, 30, 236, 285, false, Duty.window[1])
  Duty.button[1] = guiCreateButton(10, 320, 114, 31, "Save", false, Duty.window[1])
  Duty.button[2] = guiCreateButton(130, 320, 116, 31, "Close", false, Duty.window[1])
  Duty.window[2] = guiCreateWindow((var0 - 739) / 2, (var1 - 507) / 2, 739, 507, "Duty Editing Window - Main", false)
  guiWindowSetSizable(Duty.window[2], false)
  guiSetVisible(Duty.window[2], false)
  Duty.label[1] = guiCreateLabel(10, 32, 233, 15, "Available Weapons", false, Duty.window[2])
  Duty.gridlist[1] = guiCreateGridList(9, 54, 329, 126, false, Duty.window[2])
  guiGridListAddColumn(Duty.gridlist[1], "Weapon Name", 0.5)
  guiGridListAddColumn(Duty.gridlist[1], "Max amount of ammo", 0.45)
  Duty.label[2] = guiCreateLabel(10, 190, 233, 15, "Available Items", false, Duty.window[2])
  Duty.gridlist[2] = guiCreateGridList(9, 215, 329, 178, false, Duty.window[2])
  guiGridListAddColumn(Duty.gridlist[2], "Item Name", 0.9)
  Duty.label[3] = guiCreateLabel(10, 403, 233, 15, "Duty Name:", false, Duty.window[2])
  Duty.edit[1] = guiCreateEdit(10, 423, 328, 30, "", false, Duty.window[2])
  Duty.button[3] = guiCreateButton(348, 57, 103, 32, ">>", false, Duty.window[2])
  Duty.edit[2] = guiCreateEdit(348, 104, 103, 30, "", false, Duty.window[2])
  Duty.label[4] = guiCreateLabel(348, 89, 103, 15, "Amount of ammo", false, Duty.window[2])
  guiLabelSetHorizontalAlign(Duty.label[4], "center", false)
  Duty.gridlist[3] = guiCreateGridList(461, 54, 268, 126, false, Duty.window[2])
  guiGridListAddColumn(Duty.gridlist[3], "Weapon Name", 0.5)
  guiGridListAddColumn(Duty.gridlist[3], "ammo", 0.4)
  Duty.label[5] = guiCreateLabel(461, 32, 233, 15, "Duty Weapons", false, Duty.window[2])
  Duty.label[6] = guiCreateLabel(461, 190, 233, 15, "Duty Items", false, Duty.window[2])
  Duty.button[4] = guiCreateButton(348, 148, 103, 32, "<<", false, Duty.window[2])
  Duty.button[5] = guiCreateButton(348, 215, 103, 32, ">>", false, Duty.window[2])
  Duty.button[6] = guiCreateButton(348, 361, 103, 32, "<<", false, Duty.window[2])
  Duty.gridlist[4] = guiCreateGridList(461, 215, 269, 178, false, Duty.window[2])
  guiGridListAddColumn(Duty.gridlist[4], "Item Name", 0.9)
  Duty.button[7] = guiCreateButton(462, 407, 268, 36, "Save", false, Duty.window[2])
  Duty.button[8] = guiCreateButton(462, 463, 268, 34, "Cancel", false, Duty.window[2])
  Duty.button[9] = guiCreateButton(10, 463, 112, 34, "Skins", false, Duty.window[2])
  Duty.window[3] = guiCreateWindow((var0 - 369) / 2, (var1 - 293) / 2, 369, 293, "Duty Skins", false)
  guiWindowSetSizable(Duty.window[3], false)
  guiSetVisible(Duty.window[3], false)
  Duty.label[7] = guiCreateLabel(10, 28, 153, 15, "Skin ID:", false, Duty.window[3])
  Duty.button.AddCustomSkin = guiCreateButton(10, 49, 153, 22, "Add Custom Skin", false, Duty.window[3])
  Duty.gridlist[5] = guiCreateGridList(9, 78, 154, 167, false, Duty.window[3])
  guiGridListAddColumn(Duty.gridlist[5], "Custom Skins", 0.9)
  Duty.gridlist[6] = guiCreateGridList(173, 28, 186, 217, false, Duty.window[3])
  guiGridListAddColumn(Duty.gridlist[6], "Added", 0.9)
  Duty.button[11] = guiCreateButton(9, 252, 154, 31, "Cancel", false, Duty.window[3])
  Duty.button[12] = guiCreateButton(173, 252, 186, 31, "Save", false, Duty.window[3])
  ALocations.window[1] = guiCreateWindow((var0 - 268) / 2, (var1 - 322) / 2, 268, 322, "Add Duty Location", false)
  guiWindowSetSizable(ALocations.window[1], false)
  guiSetVisible(ALocations.window[1], false)
  ALocations.label[1] = guiCreateLabel(10, 29, 248, 15, "Name", false, ALocations.window[1])
  ALocations.label[2] = guiCreateLabel(10, 88, 72, 15, "Radius", false, ALocations.window[1])
  guiLabelSetHorizontalAlign(ALocations.label[2], "center", false)
  ALocations.label[3] = guiCreateLabel(92, 88, 73, 15, "Interior", false, ALocations.window[1])
  guiLabelSetHorizontalAlign(ALocations.label[3], "center", false)
  ALocations.label[4] = guiCreateLabel(175, 88, 83, 15, "Dimension", false, ALocations.window[1])
  guiLabelSetHorizontalAlign(ALocations.label[4], "center", false)
  ALocations.edit[1] = guiCreateEdit(9, 49, 249, 29, "", false, ALocations.window[1])
  ALocations.edit[2] = guiCreateEdit(9, 108, 73, 29, "", false, ALocations.window[1])
  ALocations.edit[3] = guiCreateEdit(92, 108, 73, 29, "", false, ALocations.window[1])
  ALocations.edit[4] = guiCreateEdit(175, 108, 83, 29, "", false, ALocations.window[1])
  ALocations.label[5] = guiCreateLabel(10, 152, 22, 25, "X", false, ALocations.window[1])
  guiLabelSetHorizontalAlign(ALocations.label[5], "center", false)
  guiLabelSetVerticalAlign(ALocations.label[5], "center")
  ALocations.label[6] = guiCreateLabel(10, 177, 22, 25, "Y", false, ALocations.window[1])
  guiLabelSetHorizontalAlign(ALocations.label[6], "center", false)
  guiLabelSetVerticalAlign(ALocations.label[6], "center")
  ALocations.label[7] = guiCreateLabel(10, 202, 22, 25, "Z", false, ALocations.window[1])
  guiLabelSetHorizontalAlign(ALocations.label[7], "center", false)
  guiLabelSetVerticalAlign(ALocations.label[7], "center")
  ALocations.edit[5] = guiCreateEdit(36, 152, 222, 25, "", false, ALocations.window[1])
  ALocations.edit[6] = guiCreateEdit(36, 177, 222, 25, "", false, ALocations.window[1])
  ALocations.edit[7] = guiCreateEdit(36, 202, 222, 25, "", false, ALocations.window[1])
  ALocations.button[1] = guiCreateButton(10, 246, 248, 31, "Add Location", false, ALocations.window[1])
  ALocations.button[2] = guiCreateButton(10, 281, 248, 31, "Cancel", false, ALocations.window[1])
  AVLocations.window[1] = guiCreateWindow((var0 - 296) / 2, (var1 - 150) / 2, 296, 150, "", false)
  guiWindowSetSizable(AVLocations.window[1], false)
  guiSetVisible(AVLocations.window[1], false)
  AVLocations.label[1] = guiCreateLabel(10, 34, 276, 15, "Vehicle ID", false, AVLocations.window[1])
  guiLabelSetHorizontalAlign(AVLocations.label[1], "center", false)
  AVLocations.edit[1] = guiCreateEdit(10, 56, 276, 30, "", false, AVLocations.window[1])
  AVLocations.button[1] = guiCreateButton(10, 107, 162, 33, "Add Vehicle Location", false, AVLocations.window[1])
  AVLocations.button[2] = guiCreateButton(178, 107, 108, 33, "Cancel", false, AVLocations.window[1])
end)
FactionPerksForDuty = {}
addEventHandler("onClientGUIClick", resourceRoot, function()
  if source == Duty.button[2] then
    guiSetVisible(Duty.window[1], false)
  elseif source == Duty.button[1] then
    guiSetVisible(Duty.window[1], false)
    for forvar4, forvar5 in ipairs(PerksGUI) do
      if guiCheckBoxGetSelected(forvar5) then
        ({})[guiGetText(forvar5)] = true
      end
    end
    triggerServerEvent("duty:saveFactionPerksForMember", localPlayer, FactionPerksForDuty.currentMemberID, FactionPerksForDuty.currentFactionID, {})
  elseif source == Duty.button[8] then
    guiSetVisible(Duty.window[2], false)
    triggerEvent("factions:returnBackToMainWindow", localPlayer)
  elseif source == Duty.button[9] then
    guiSetVisible(Duty.window[3], true)
    guiBringToFront(Duty.window[3])
    guiSetEnabled(Duty.window[2], false)
  elseif source == Duty.button[11] then
    guiSetVisible(Duty.window[3], false)
    guiSetEnabled(Duty.window[2], true)
    guiGridListClear(Duty.gridlist[6])
    for forvar3, forvar4 in ipairs(perkSkinsBeforeSave[2]) do
      if type(forvar4) ~= "table" or not tostring(forvar4[3]) then
      end
      guiGridListSetItemText(Duty.gridlist[6], guiGridListAddRow(Duty.gridlist[6]), 1, tostring(forvar4), false, false)
    end
    guiGridListClear(Duty.gridlist[5])
    for forvar3, forvar4 in ipairs(perkSkinsBeforeSave[1]) do
      if type(forvar4) ~= "table" or not tostring(forvar4[3]) then
      end
      guiGridListSetItemText(Duty.gridlist[5], guiGridListAddRow(Duty.gridlist[5]), 1, tostring(forvar4), false, false)
    end
  elseif source == Duty.button[12] then
    guiSetVisible(Duty.window[3], false)
    guiSetEnabled(Duty.window[2], true)
    perkSkinsBeforeSave = {
      {},
      {}
    }
    for forvar3 = 0, guiGridListGetRowCount(Duty.gridlist[6]) - 1 do
      table.insert(perkSkinsBeforeSave[2], tonumber((guiGridListGetItemText(Duty.gridlist[6], forvar3, 1))))
    end
    for forvar3 = 0, guiGridListGetRowCount(Duty.gridlist[5]) - 1 do
      table.insert(perkSkinsBeforeSave[1], tonumber((guiGridListGetItemText(Duty.gridlist[5], forvar3, 1))))
    end
  elseif source == Duty.button[7] then
    for forvar6 = 0, guiGridListGetRowCount(Duty.gridlist[3]) - 1 do
      table.insert({}, {
        guiGridListGetItemText(Duty.gridlist[3], forvar6, 1),
        tonumber((guiGridListGetItemText(Duty.gridlist[3], forvar6, 2))),
        (guiGridListGetItemData(Duty.gridlist[3], forvar6, 1))
      })
    end
    for forvar6 = 0, guiGridListGetRowCount(Duty.gridlist[4]) - 1 do
      table.insert({}, {
        (guiGridListGetItemText(Duty.gridlist[4], forvar6, 1))
      })
    end
    for forvar6 = 0, guiGridListGetRowCount(Duty.gridlist[6]) - 1 do
      table.insert({}, tonumber((guiGridListGetItemText(Duty.gridlist[6], forvar6, 1))) and tonumber((guiGridListGetItemText(Duty.gridlist[6], forvar6, 1))) or guiGridListGetItemData(Duty.gridlist[6], forvar6, 1))
    end
    if #guiGetText(Duty.edit[1]) ~= 0 then
      guiSetVisible(Duty.window[2], false)
      triggerEvent("factions:returnBackToMainWindow", localPlayer)
      if guiGetText(source) == "Add Duty" then
        triggerServerEvent("duty:addDuty", localPlayer, currentDutyFactionID, guiGetText(Duty.edit[1]), {}, {}, {}, {})
      elseif guiGetText(source) == "Save" then
        triggerServerEvent("duty:editDuty", localPlayer, currentDutyFactionID, string.gsub(guiGetText(Duty.window[2]), "Edit Duty #", ""), guiGetText(Duty.edit[1]), {}, {}, {}, {})
      end
    end
  elseif source == Duty.button[3] then
    if guiGridListGetSelectedItem(Duty.gridlist[1]) ~= -1 and tonumber((guiGetText(Duty.edit[2]))) and tonumber((guiGetText(Duty.edit[2]))) <= tonumber((guiGridListGetItemText(Duty.gridlist[1], guiGridListGetSelectedItem(Duty.gridlist[1]), 2))) then
      guiGridListSetItemText(Duty.gridlist[3], guiGridListAddRow(Duty.gridlist[3]), 1, tostring((guiGridListGetItemText(Duty.gridlist[1], guiGridListGetSelectedItem(Duty.gridlist[1]), 1))), false, false)
      guiGridListSetItemData(Duty.gridlist[3], guiGridListAddRow(Duty.gridlist[3]), 1, tostring((guiGridListGetItemText(Duty.gridlist[1], guiGridListGetSelectedItem(Duty.gridlist[1]), 2))))
      guiGridListSetItemText(Duty.gridlist[3], guiGridListAddRow(Duty.gridlist[3]), 2, tostring((guiGetText(Duty.edit[2]))), false, false)
      guiGridListSetItemData(Duty.gridlist[3], guiGridListAddRow(Duty.gridlist[3]), 2, (guiGridListGetItemData(Duty.gridlist[1], guiGridListGetSelectedItem(Duty.gridlist[1]), 2)))
      guiGridListRemoveRow(Duty.gridlist[1], (guiGridListGetSelectedItem(Duty.gridlist[1])))
      guiSetText(Duty.edit[2], "")
    end
  elseif source == Duty.button[4] then
    if guiGridListGetSelectedItem(Duty.gridlist[3]) ~= -1 then
      guiGridListSetItemText(Duty.gridlist[1], guiGridListAddRow(Duty.gridlist[1]), 1, tostring((guiGridListGetItemText(Duty.gridlist[3], guiGridListGetSelectedItem(Duty.gridlist[3]), 1))), false, false)
      guiGridListSetItemText(Duty.gridlist[1], guiGridListAddRow(Duty.gridlist[1]), 2, tostring(getAvailableWeaponFromName((guiGridListGetItemText(Duty.gridlist[3], guiGridListGetSelectedItem(Duty.gridlist[3]), 1)))), false, false)
      guiGridListSetItemData(Duty.gridlist[1], guiGridListAddRow(Duty.gridlist[1]), 1, getAvailableWeaponFromName((guiGridListGetItemText(Duty.gridlist[3], guiGridListGetSelectedItem(Duty.gridlist[3]), 1))))
      guiGridListRemoveRow(Duty.gridlist[3], (guiGridListGetSelectedItem(Duty.gridlist[3])))
    end
  elseif source == Duty.button[5] then
    if guiGridListGetSelectedItem(Duty.gridlist[2]) ~= -1 then
      guiGridListSetItemText(Duty.gridlist[4], guiGridListAddRow(Duty.gridlist[4]), 1, tostring((guiGridListGetItemText(Duty.gridlist[2], guiGridListGetSelectedItem(Duty.gridlist[2]), 1))), false, false)
      guiGridListRemoveRow(Duty.gridlist[2], (guiGridListGetSelectedItem(Duty.gridlist[2])))
    end
  elseif source == Duty.button[6] then
    if guiGridListGetSelectedItem(Duty.gridlist[4]) ~= -1 then
      guiGridListSetItemText(Duty.gridlist[2], guiGridListAddRow(Duty.gridlist[2]), 1, tostring((guiGridListGetItemText(Duty.gridlist[4], guiGridListGetSelectedItem(Duty.gridlist[4]), 1))), false, false)
      guiGridListRemoveRow(Duty.gridlist[4], (guiGridListGetSelectedItem(Duty.gridlist[4])))
    end
  elseif source == ALocations.button[2] then
    guiSetVisible(ALocations.window[1], false)
    triggerEvent("factions:returnBackToMainWindow", localPlayer)
  elseif source == ALocations.button[1] then
    if 0 < #guiGetText(ALocations.edit[1]) and tonumber((guiGetText(ALocations.edit[2]))) and tonumber((guiGetText(ALocations.edit[3]))) and tonumber((guiGetText(ALocations.edit[4]))) and tonumber((guiGetText(ALocations.edit[5]))) and tonumber((guiGetText(ALocations.edit[6]))) and tonumber((guiGetText(ALocations.edit[7]))) then
      guiSetVisible(ALocations.window[1], false)
      if guiGetText(source) == "Add Location" then
        triggerServerEvent("duty:addDutyLocation", localPlayer, currentDutyFactionID, guiGetText(ALocations.edit[1]), guiGetText(ALocations.edit[2]), guiGetText(ALocations.edit[3]), guiGetText(ALocations.edit[4]), guiGetText(ALocations.edit[5]), guiGetText(ALocations.edit[6]), (guiGetText(ALocations.edit[7])))
      elseif guiGetText(source) == "Save" then
        triggerServerEvent("duty:editDutyLocation", localPlayer, currentDutyFactionID, string.gsub(guiGetText(ALocations.window[1]), "Edit Duty Location #", ""), guiGetText(ALocations.edit[1]), guiGetText(ALocations.edit[2]), guiGetText(ALocations.edit[3]), guiGetText(ALocations.edit[4]), guiGetText(ALocations.edit[5]), guiGetText(ALocations.edit[6]), (guiGetText(ALocations.edit[7])))
      end
    end
  elseif source == AVLocations.button[2] then
    guiSetVisible(AVLocations.window[1], false)
    triggerEvent("factions:returnBackToMainWindow", localPlayer)
  elseif source == AVLocations.button[1] then
    if tonumber((guiGetText(AVLocations.edit[1]))) then
      guiSetVisible(AVLocations.window[1], false)
      triggerEvent("factions:returnBackToMainWindow", localPlayer)
      triggerServerEvent("duty:addDutyVehicleLocation", localPlayer, currentDutyFactionID, (guiGetText(AVLocations.edit[1])))
    end
  elseif source == Duty.button.AddCustomSkin then
    triggerEvent("skins:showAddSkinWindow", localPlayer, "duty:onAddCustomSkin")
  end
end)
addEvent("duty:onAddCustomSkin", true)
addEventHandler("duty:onAddCustomSkin", localPlayer, function(arg0, arg1, arg2, arg3)
  guiGridListSetItemText(Duty.gridlist[6], guiGridListAddRow(Duty.gridlist[6]), 1, tostring(arg2), false, false)
  guiGridListSetItemData(Duty.gridlist[6], guiGridListAddRow(Duty.gridlist[6]), 1, {
    arg0,
    arg1,
    arg2,
    arg3
  })
end)
addEventHandler("onClientGUIDoubleClick", resourceRoot, function()
  if source == Duty.gridlist[5] then
    if guiGridListGetSelectedItem(Duty.gridlist[5]) ~= -1 then
      guiGridListSetItemText(Duty.gridlist[6], guiGridListAddRow(Duty.gridlist[6]), 1, tostring((guiGridListGetItemText(Duty.gridlist[5], guiGridListGetSelectedItem(Duty.gridlist[5]), 1))), false, false)
      guiGridListSetItemData(Duty.gridlist[6], guiGridListAddRow(Duty.gridlist[6]), 1, guiGridListGetItemData(Duty.gridlist[5], guiGridListGetSelectedItem(Duty.gridlist[5]), 1))
      guiGridListRemoveRow(Duty.gridlist[5], (guiGridListGetSelectedItem(Duty.gridlist[5])))
    end
  elseif source == Duty.gridlist[6] and guiGridListGetSelectedItem(Duty.gridlist[6]) ~= -1 then
    guiGridListSetItemText(Duty.gridlist[5], guiGridListAddRow(Duty.gridlist[5]), 1, tostring((guiGridListGetItemText(Duty.gridlist[6], guiGridListGetSelectedItem(Duty.gridlist[6]), 1))), false, false)
    guiGridListSetItemData(Duty.gridlist[5], guiGridListAddRow(Duty.gridlist[5]), 1, guiGridListGetItemData(Duty.gridlist[6], guiGridListGetSelectedItem(Duty.gridlist[6]), 1))
    guiGridListRemoveRow(Duty.gridlist[6], (guiGridListGetSelectedItem(Duty.gridlist[6])))
  end
end)
addEvent("duty:showFactionPerksForPlayer", true)
addEventHandler("duty:showFactionPerksForPlayer", root, function(arg0, arg1, arg2)
  FactionPerksForDuty.currentMemberID = arg0
  FactionPerksForDuty.currentFactionID = arg2
  guiSetVisible(Duty.window[1], true)
  guiBringToFront(Duty.window[1])
  guiSetText(Duty.window[1], "Faction Perks For " .. tostring(arg1))
  triggerServerEvent("duty:requestPerksForMember", localPlayer, arg0, arg2)
end)
AvailableWeapons = {}
function getAvailableWeaponFromName(arg0)
  for forvar4, forvar5 in ipairs(AvailableWeapons) do
    if forvar5[1] == arg0 then
      return forvar5[1], forvar5[2], forvar5[3]
    end
  end
end
AvailableItems = {}
AvailableSkins = getValidPedModels()
addEvent("duty:sendAvailableItemsForFaction", true)
addEventHandler("duty:sendAvailableItemsForFaction", root, function(arg0, arg1, arg2)
  AvailableItems = arg0
  AvailableWeapons = arg1
end)
addEvent("duty:req.AddDuty", true)
addEventHandler("duty:req.AddDuty", root, function(arg0)
  currentDutyFactionID = arg0
  guiSetVisible(Duty.window[2], true)
  guiBringToFront(Duty.window[2])
  guiSetText(Duty.edit[1], "")
  guiSetText(Duty.edit[2], "")
  guiGridListClear(Duty.gridlist[1])
  guiGridListClear(Duty.gridlist[2])
  guiGridListClear(Duty.gridlist[3])
  guiGridListClear(Duty.gridlist[4])
  guiGridListClear(Duty.gridlist[5])
  guiGridListClear(Duty.gridlist[6])
  for forvar4, forvar5 in ipairs(AvailableWeapons) do
    guiGridListSetItemText(Duty.gridlist[1], guiGridListAddRow(Duty.gridlist[1]), 1, tostring(forvar5[1]), false, false)
    guiGridListSetItemText(Duty.gridlist[1], guiGridListAddRow(Duty.gridlist[1]), 2, tostring(forvar5[2]), false, false)
  end
  for forvar4, forvar5 in ipairs(AvailableItems) do
    guiGridListSetItemText(Duty.gridlist[2], guiGridListAddRow(Duty.gridlist[2]), 1, tostring(forvar5[1]), false, false)
  end
  for forvar4, forvar5 in ipairs(AvailableSkins) do
    guiGridListSetItemText(Duty.gridlist[5], guiGridListAddRow(Duty.gridlist[5]), 1, tostring(forvar5), false, false)
  end
  guiSetText(Duty.button[7], "Add Duty")
  guiSetText(Duty.window[2], "Duty Editing Window - Main")
end)
addEvent("duty:req.EditDuty", true)
addEventHandler("duty:req.EditDuty", root, function(arg0, arg1, arg2, arg3, arg4, arg5, arg6)
  currentDutyFactionID = arg0
  guiSetVisible(Duty.window[2], true)
  guiBringToFront(Duty.window[2])
  guiSetText(Duty.edit[1], tostring(arg2))
  guiSetText(Duty.edit[2], "")
  guiGridListClear(Duty.gridlist[1])
  guiGridListClear(Duty.gridlist[2])
  guiGridListClear(Duty.gridlist[3])
  guiGridListClear(Duty.gridlist[4])
  guiGridListClear(Duty.gridlist[5])
  guiGridListClear(Duty.gridlist[6])
  for forvar13, forvar14 in ipairs(arg4) do
    guiGridListSetItemText(Duty.gridlist[3], guiGridListAddRow(Duty.gridlist[3]), 1, tostring(forvar14[1]), false, false)
    guiGridListSetItemText(Duty.gridlist[3], guiGridListAddRow(Duty.gridlist[3]), 2, tostring(forvar14[2]), false, false)
    ;({})[tostring(forvar14[1])] = true
  end
  for forvar13, forvar14 in ipairs(arg3) do
    guiGridListSetItemText(Duty.gridlist[4], guiGridListAddRow(Duty.gridlist[4]), 1, tostring(forvar14[1]), false, false)
    guiGridListSetItemText(Duty.gridlist[4], guiGridListAddRow(Duty.gridlist[4]), 2, tostring(forvar14[2]), false, false)
    ;({})[tostring(forvar14[1])] = true
  end
  for forvar13, forvar14 in ipairs(arg5) do
    if type(forvar14) ~= "table" or not forvar14[3] then
    end
    guiGridListSetItemText(Duty.gridlist[6], guiGridListAddRow(Duty.gridlist[6]), 1, tostring(forvar14), false, false)
    guiGridListSetItemData(Duty.gridlist[6], guiGridListAddRow(Duty.gridlist[6]), 1, forvar14)
    ;({})[tostring(forvar14)] = true
  end
  for forvar13, forvar14 in ipairs(AvailableWeapons) do
    if not ({})[tostring(forvar14[1])] then
      guiGridListSetItemText(Duty.gridlist[1], guiGridListAddRow(Duty.gridlist[1]), 1, tostring(forvar14[1]), false, false)
      guiGridListSetItemText(Duty.gridlist[1], guiGridListAddRow(Duty.gridlist[1]), 2, tostring(forvar14[2]), false, false)
    end
  end
  for forvar13, forvar14 in ipairs(AvailableItems) do
    if not ({})[tostring(forvar14[1])] then
      guiGridListSetItemText(Duty.gridlist[2], guiGridListAddRow(Duty.gridlist[2]), 1, tostring(forvar14[1]), false, false)
    end
  end
  for forvar14, forvar15 in ipairs(AvailableSkins) do
    if not ({})[tostring(forvar15)] then
      guiGridListSetItemText(Duty.gridlist[5], guiGridListAddRow(Duty.gridlist[5]), 1, tostring(forvar15), false, false)
      table.insert({}, forvar15)
    end
  end
  perkSkinsBeforeSave = {
    {},
    arg5
  }
  guiSetText(Duty.button[7], "Save")
  guiSetText(Duty.window[2], "Edit Duty #" .. tostring(arg1))
end)
addEvent("duty:req.AddDutyLocation", true)
addEventHandler("duty:req.AddDutyLocation", root, function(arg0)
  guiSetVisible(ALocations.window[1], true)
  guiBringToFront(ALocations.window[1])
  guiSetText(ALocations.edit[1], "")
  guiSetText(ALocations.edit[2], "")
  guiSetText(ALocations.edit[3], "")
  guiSetText(ALocations.edit[4], "")
  guiSetText(ALocations.edit[5], "")
  guiSetText(ALocations.edit[6], "")
  guiSetText(ALocations.edit[7], "")
  guiSetText(ALocations.button[1], "Add Location")
  guiSetText(ALocations.window[1], "Add Duty Location")
  currentDutyFactionID = arg0
end)
addEvent("duty:req.EditDutyLocation", true)
addEventHandler("duty:req.EditDutyLocation", root, function(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8)
  guiSetVisible(ALocations.window[1], true)
  guiBringToFront(ALocations.window[1])
  guiSetText(ALocations.edit[1], tostring(arg2))
  guiSetText(ALocations.edit[2], tostring(arg3))
  guiSetText(ALocations.edit[3], tostring(arg4))
  guiSetText(ALocations.edit[4], tostring(arg5))
  guiSetText(ALocations.edit[5], tostring(arg6))
  guiSetText(ALocations.edit[6], tostring(arg7))
  guiSetText(ALocations.edit[7], tostring(arg8))
  guiSetText(ALocations.button[1], "Save")
  guiSetText(ALocations.window[1], "Edit Duty Location #" .. tostring(arg1))
  currentDutyFactionID = arg0
end)
addEvent("duty:req.AddDutyVehicleLocation", true)
addEventHandler("duty:req.AddDutyVehicleLocation", root, function(arg0)
  guiSetVisible(AVLocations.window[1], true)
  guiBringToFront(AVLocations.window[1])
  guiSetText(AVLocations.edit[1], "")
  currentDutyFactionID = arg0
end)
UI = {
  window = {},
  label = {},
  button = {},
  gridlist = {},
  image = {},
  checklist = {},
  rect = {}
}
function UIKitReady()
  eui = exports.UIKit
  UI.window.SelectPerk = eui:uiCreateRectangle(false, false, 400, 330, tocolor(15, 15, 15, 240), true, true, true, true)
  eui:uiSetVisible(UI.window.SelectPerk, false)
  UI.label.SelectPerk = eui:uiCreateLabel(10, 10, 232, 20, "Duty", tocolor(255, 255, 255, 255), "left", "top", UI.window.SelectPerk)
  eui:uiSetFont(UI.label.SelectPerk, "default-large")
  UI.button.CancelSelectPerk = eui:uiCreateButton(0, 300, 400, 30, "Cancel / \216\165\217\132\216\186\216\167\216\161", tocolor(10, 10, 10, 240), UI.window.SelectPerk)
  UI.gridlist.SelectPerk = eui:uiCreateGridList(0, 50, 400, 245, tocolor(10, 10, 10), UI.window.SelectPerk)
  eui:uiGridListAddColumn(UI.gridlist.SelectPerk, "Select Duty Perk", 1)
  eui:uiSetAlign(UI.gridlist.SelectPerk, "center", "center")
  UI.window.duty = eui:uiCreateRectangle((eui:uiGetReferenceScreenSize() - 800) / 2, false, 580, 420, tocolor(20, 20, 20, 240), true, true, true, true)
  eui:uiSetVisible(UI.window.duty, false)
  UI.label.duty = eui:uiCreateLabel(15, 10, 232, 20, "Duty / Fation Name", tocolor(255, 255, 255, 255), "left", "top", UI.window.duty)
  eui:uiSetFont(UI.label.duty, "default-large")
  UI.gridlist.dutyskins = eui:uiCreateGridList(10, 50, 250, 310, tocolor(10, 10, 10), UI.window.duty)
  eui:uiGridListAddColumn(UI.gridlist.dutyskins, "Skins", 1)
  eui:uiSetAlign(UI.gridlist.dutyskins, "left", "center")
  eui:uiSetProperty(UI.gridlist.dutyskins, "column_height", 35)
  eui:uiSetProperty(UI.gridlist.dutyskins, "row_height", 30)
  UI.checklist.dutyitems = eui:uiCreateCheckList(280, 60, 290, 300, tocolor(10, 10, 10, 0), UI.window.duty)
  eui:uiSetProperty(UI.checklist.dutyitems, "row_height", 20)
  UI.button["return"] = eui:uiCreateButton(10, 370, 150, 40, "\194\171 Return", tocolor(0, 0, 0), UI.window.duty)
  UI.button.cancel = eui:uiCreateButton(170, 370, 150, 40, "Cancel", tocolor(0, 0, 0), UI.window.duty)
  UI.button.spawnDuty = eui:uiCreateButton(420, 370, 150, 40, "Spawn Duty", tocolor(0, 0, 0), UI.window.duty)
end
addEventHandler("onClientUIReady", resourceRoot, UIKitReady)
addEventHandler("onClientUIKitReady", root, UIKitReady)
function closeUIWindows(arg0)
  eui:uiSetVisible(UI.window.SelectPerk, false)
  eui:uiSetVisible(UI.window.duty, false)
  destroyPreview()
end
addEvent("onClientPlayerQuitFromCharacter", true)
addEventHandler("onClientPlayerQuitFromCharacter", localPlayer, closeUIWindows)
addEventHandler("onClientPlayerWasted", localPlayer, closeUIWindows)
addEvent("duty:showDutySelection", true)
addEventHandler("duty:showDutySelection", root, function(arg0, arg1, arg2)
  var0.FactionID = arg0
  var0.Perk = false
  eui:uiSetVisible(UI.window.duty, false)
  destroyPreview()
  eui:uiSetVisible(UI.window.SelectPerk, true)
  eui:uiSetText(UI.label.SelectPerk, "#c9c9c9Duty / #ffffff" .. tostring(arg1))
  showCursor(true)
  eui:uiGridListClear(UI.gridlist.SelectPerk)
  for forvar6, forvar7 in pairs(arg2) do
    eui:uiGridListSetItemText(UI.gridlist.SelectPerk, eui:uiGridListAddRow(UI.gridlist.SelectPerk), 1, tostring(forvar6))
  end
  eui:uiSetText(UI.label.duty, "#c9c9c9Duty  /  #ffffff" .. tostring(arg1))
end)
function destroyPreview()
  if isElement(var0) then
    exports.object_preview:destroyObjectPreview(var0)
  end
  if isElement(var1) then
    destroyElement(var1)
  end
end
addEventHandler("onClientResourceStop", resourceRoot, function()
  if isElement(var0) then
    exports.object_preview:destroyObjectPreview(var0)
  end
end)
addEventHandler("onClientUIDoubleClick", root, function()
  if source == UI.gridlist.SelectPerk then
    if eui:uiGridListGetSelectedItem(UI.gridlist.SelectPerk) ~= -1 then
      var0.Perk = eui:uiGridListGetItemText(UI.gridlist.SelectPerk, eui:uiGridListGetSelectedItem(UI.gridlist.SelectPerk), 1)
      eui:uiSetVisible(UI.window.SelectPerk, false)
      triggerServerEvent("duty:getPerkInformation", localPlayer, var0.FactionID, (eui:uiGridListGetItemText(UI.gridlist.SelectPerk, eui:uiGridListGetSelectedItem(UI.gridlist.SelectPerk), 1)))
    else
      var0.Perk = false
    end
  end
end)
addEventHandler("onClientUIClick", root, function()
  if source == UI.button.CancelSelectPerk then
    eui:uiSetVisible(UI.window.SelectPerk, false)
    showCursor(false)
  elseif source == UI.button.cancel then
    eui:uiSetVisible(UI.window.duty, false)
    showCursor(false)
    destroyPreview()
  elseif source == UI.button["return"] then
    eui:uiSetVisible(UI.window.duty, false)
    eui:uiSetVisible(UI.window.SelectPerk, true)
    destroyPreview()
  elseif source == UI.gridlist.dutyskins then
    if eui:uiGridListGetSelectedItem(UI.gridlist.dutyskins) ~= -1 then
      if type((eui:uiGridListGetItemData(UI.gridlist.dutyskins, eui:uiGridListGetSelectedItem(UI.gridlist.dutyskins), 1))) ~= "table" or not tonumber(eui:uiGridListGetItemData(UI.gridlist.dutyskins, eui:uiGridListGetSelectedItem(UI.gridlist.dutyskins), 1)[1]) then
      end
      if isElement(var0) then
        setElementModel(var0, (tonumber((eui:uiGridListGetItemData(UI.gridlist.dutyskins, eui:uiGridListGetSelectedItem(UI.gridlist.dutyskins), 1)))))
        if type((eui:uiGridListGetItemData(UI.gridlist.dutyskins, eui:uiGridListGetSelectedItem(UI.gridlist.dutyskins), 1))) == "table" then
          exports["skin-system"]:applySkinToPlayer(var0, {
            false,
            eui:uiGridListGetItemData(UI.gridlist.dutyskins, eui:uiGridListGetSelectedItem(UI.gridlist.dutyskins), 1)[4]
          }, var1)
        end
      end
    elseif isElement(var0) then
      setElementModel(var0, getElementModel(localPlayer))
      exports["skin-system"]:removeSkinFromPlayer(var0, var1)
    end
  elseif source == UI.button.spawnDuty and var2.Perk then
    if eui:uiGridListGetSelectedItem(UI.gridlist.dutyskins) ~= -1 then
    end
    for forvar8, forvar9 in ipairs(eui:uiCheckListGetSelectedItems(UI.checklist.dutyitems) or {}) do
      table.insert({}, {
        eui:uiCheckListGetItemText(UI.checklist.dutyitems, forvar9),
        var3[forvar9].type,
        var3[forvar9].ammo or 0
      })
    end
    triggerServerEvent("duty:spawnDuty", localPlayer, var2.FactionID, var2.Perk, type((eui:uiGridListGetItemData(UI.gridlist.dutyskins, eui:uiGridListGetSelectedItem(UI.gridlist.dutyskins), 1))) == "table" and tonumber(eui:uiGridListGetItemData(UI.gridlist.dutyskins, eui:uiGridListGetSelectedItem(UI.gridlist.dutyskins), 1)[1]) or tonumber((eui:uiGridListGetItemData(UI.gridlist.dutyskins, eui:uiGridListGetSelectedItem(UI.gridlist.dutyskins), 1))), {}, type((eui:uiGridListGetItemData(UI.gridlist.dutyskins, eui:uiGridListGetSelectedItem(UI.gridlist.dutyskins), 1))) == "table" and eui:uiGridListGetItemData(UI.gridlist.dutyskins, eui:uiGridListGetSelectedItem(UI.gridlist.dutyskins), 1) or false)
    eui:uiSetVisible(UI.window.duty, false)
    showCursor(false)
    destroyPreview()
  end
end)
addEvent("duty:sendPerkInformation", true)
addEventHandler("duty:sendPerkInformation", root, function(arg0)
  eui:uiSetVisible(UI.window.duty, true)
  showCursor(true)
  destroyPreview()
  var0 = createPed(getElementModel(localPlayer), getCameraMatrix())
  setElementInterior(var0, getElementInterior(localPlayer))
  setElementDimension(var0, getElementDimension(localPlayer))
  var1 = exports.object_preview:createObjectPreview(var0, 0, 0, 180, (var2 - 800) / 2 + 480, (var3 - 400) / 2, 400, 400, false, true, false)
  eui:uiGridListClear(UI.gridlist.dutyskins)
  for forvar7, forvar8 in pairs(fromJSON(arg0.Skins)) do
    if type(forvar8) ~= "table" or not tonumber(forvar8[1]) then
    end
    eui:uiGridListSetItemText(UI.gridlist.dutyskins, eui:uiGridListAddRow(UI.gridlist.dutyskins), 1, tostring((tonumber(forvar8))))
    eui:uiGridListSetItemData(UI.gridlist.dutyskins, eui:uiGridListAddRow(UI.gridlist.dutyskins), 1, forvar8)
  end
  var4 = {}
  eui:uiCheckListClear(UI.checklist.dutyitems)
  for forvar8, forvar9 in ipairs(fromJSON(arg0.Weapons)) do
    eui:uiCheckListAddRow(UI.checklist.dutyitems, tostring(forvar9[1]), tocolor(255, 55, 95, 255), false)
    var4[forvar8] = {
      type = "weapon",
      ammo = forvar9[2]
    }
  end
  for forvar8, forvar9 in ipairs(fromJSON(arg0.Items)) do
    eui:uiCheckListAddRow(UI.checklist.dutyitems, tostring(forvar9[1]), tocolor(255, 55, 95, 255), false)
    var4[forvar8 + forvar8] = {type = "item"}
  end
end)
AdminDuty = {
  label = {},
  edit = {},
  button = {},
  window = {},
  gridlist = {},
  combobox = {}
}
addEventHandler("onClientResourceStart", resourceRoot, function()
  AdminDuty.window[1] = guiCreateWindow((var0 - 445) / 2, (var1 - 337) / 2, 445, 337, "Duty Admin Settings", false)
  guiWindowSetSizable(AdminDuty.window[1], false)
  guiSetVisible(AdminDuty.window[1], false)
  AdminDuty.combobox[1] = guiCreateComboBox(10, 28, 287, 138, "", false, AdminDuty.window[1])
  AdminDuty.combobox[2] = guiCreateComboBox(301, 28, 134, 138, "", false, AdminDuty.window[1])
  guiComboBoxAddItem(AdminDuty.combobox[2], "Items")
  guiComboBoxAddItem(AdminDuty.combobox[2], "Weapons")
  AdminDuty.label[1] = guiCreateLabel(10, 119, 425, 15, " Allowed Items", false, AdminDuty.window[1])
  guiLabelSetHorizontalAlign(AdminDuty.label[1], "center", false)
  AdminDuty.gridlist[1] = guiCreateGridList(10, 137, 425, 190, false, AdminDuty.window[1])
  guiGridListAddColumn(AdminDuty.gridlist[1], "Item ID", 0.15)
  guiGridListAddColumn(AdminDuty.gridlist[1], "Item name", 0.8)
  AdminDuty.combobox[3] = guiCreateComboBox(10, 58, 425, 269, "", false, AdminDuty.window[1])
  AdminDuty.button[1] = guiCreateButton(173, 86, 85, 25, "Allow", false, AdminDuty.window[1])
  AdminDuty.button[2] = guiCreateButton(262, 86, 85, 25, "Remove", false, AdminDuty.window[1])
  AdminDuty.button[3] = guiCreateButton(351, 86, 84, 25, "Done", false, AdminDuty.window[1])
  AdminDuty.label[2] = guiCreateLabel(10, 86, 62, 25, "Item Value:", false, AdminDuty.window[1])
  guiLabelSetVerticalAlign(AdminDuty.label[2], "center")
  AdminDuty.edit[1] = guiCreateEdit(77, 86, 81, 25, "", false, AdminDuty.window[1])
end)
addEvent("duty:showAdminDutySettings", true)
addEventHandler("duty:showAdminDutySettings", root, function(arg0)
  var0 = arg0
  guiSetVisible(AdminDuty.window[1], true)
  showCursor(true)
  selectSection("Items")
  guiComboBoxClear(AdminDuty.combobox[1])
  for forvar4, forvar5 in ipairs(getElementsByType("faction")) do
    guiComboBoxAddItem(AdminDuty.combobox[1], tostring(getElementData(forvar5, "faction:name")))
  end
  guiSetEnabled(AdminDuty.button[1], false)
  guiSetEnabled(AdminDuty.button[2], false)
end)
function selectSection(arg0)
  var0 = arg0
  guiSetText(AdminDuty.label[1], "Allowed " .. arg0)
  guiComboBoxClear(AdminDuty.combobox[3])
  guiGridListClear(AdminDuty.gridlist[1])
  if arg0 == "Items" then
    guiComboBoxSetSelected(AdminDuty.combobox[2], 0)
    for forvar4, forvar5 in pairs(var1) do
      if forvar5[2] ~= "Weapon" and not var2[var0][tostring(forvar4)] then
        guiComboBoxAddItem(AdminDuty.combobox[3], "#" .. tostring(forvar4) .. " | " .. tostring(forvar5[1]))
      end
    end
    for forvar4, forvar5 in ipairs(var3) do
      guiGridListSetItemText(AdminDuty.gridlist[1], guiGridListAddRow(AdminDuty.gridlist[1]), 1, tostring(forvar5[2]), false, false)
      guiGridListSetItemText(AdminDuty.gridlist[1], guiGridListAddRow(AdminDuty.gridlist[1]), 2, tostring(forvar5[1]), false, false)
    end
  elseif arg0 == "Weapons" then
    guiComboBoxSetSelected(AdminDuty.combobox[2], 1)
    for forvar4, forvar5 in pairs(var1) do
      if forvar5[2] == "Weapon" and not var2[var0][tostring(forvar4)] then
        guiComboBoxAddItem(AdminDuty.combobox[3], "#" .. tostring(forvar4) .. " | " .. tostring(forvar5[1]))
      end
    end
    for forvar4, forvar5 in ipairs(var4) do
      guiGridListSetItemText(AdminDuty.gridlist[1], guiGridListAddRow(AdminDuty.gridlist[1]), 1, tostring(forvar5[4]), false, false)
      guiGridListSetItemText(AdminDuty.gridlist[1], guiGridListAddRow(AdminDuty.gridlist[1]), 2, tostring(forvar5[1]), false, false)
    end
  end
end
addEventHandler("onClientGUIComboBoxAccepted", resourceRoot, function()
  if source == AdminDuty.combobox[2] then
    selectSection(guiComboBoxGetItemText(source, guiComboBoxGetSelected(source)))
  elseif source == AdminDuty.combobox[1] then
    triggerServerEvent("duty:getAllowedItemsForFaction", localPlayer, getElementData(getElementsByType("faction")[guiComboBoxGetSelected(source) + 1], "faction:id"))
  end
end)
addEventHandler("onClientGUIClick", resourceRoot, function()
  if source == AdminDuty.button[3] then
    guiSetVisible(AdminDuty.window[1], false)
    showCursor(false)
  elseif source == AdminDuty.button[1] then
    if guiComboBoxGetSelected(AdminDuty.combobox[3]) ~= -1 then
      split(guiComboBoxGetItemText(AdminDuty.combobox[3], (guiComboBoxGetSelected(AdminDuty.combobox[3]))):gsub("#", ""), " | ")[2] = guiComboBoxGetItemText(AdminDuty.combobox[3], (guiComboBoxGetSelected(AdminDuty.combobox[3]))):gsub("#", ""):gsub("" .. tostring(split(guiComboBoxGetItemText(AdminDuty.combobox[3], (guiComboBoxGetSelected(AdminDuty.combobox[3]))):gsub("#", ""), " | ")[1]) .. " | ", "")
      guiGridListSetItemText(AdminDuty.gridlist[1], guiGridListAddRow(AdminDuty.gridlist[1]), 1, tostring(split(guiComboBoxGetItemText(AdminDuty.combobox[3], (guiComboBoxGetSelected(AdminDuty.combobox[3]))):gsub("#", ""), " | ")[1]), false, false)
      guiGridListSetItemText(AdminDuty.gridlist[1], guiGridListAddRow(AdminDuty.gridlist[1]), 2, tostring(split(guiComboBoxGetItemText(AdminDuty.combobox[3], (guiComboBoxGetSelected(AdminDuty.combobox[3]))):gsub("#", ""), " | ")[2]), false, false)
      if var0 == "Items" then
        table.insert(var1, {
          tostring(split(guiComboBoxGetItemText(AdminDuty.combobox[3], (guiComboBoxGetSelected(AdminDuty.combobox[3]))):gsub("#", ""), " | ")[2]),
          tonumber(split(guiComboBoxGetItemText(AdminDuty.combobox[3], (guiComboBoxGetSelected(AdminDuty.combobox[3]))):gsub("#", ""), " | ")[1])
        })
        if getElementsByType("faction")[guiComboBoxGetSelected(AdminDuty.combobox[1]) + 1] then
          triggerServerEvent("duty:updatedAllowedItemsForFaction", localPlayer, getElementData(getElementsByType("faction")[guiComboBoxGetSelected(AdminDuty.combobox[1]) + 1], "faction:id"), var1)
          var2[var0][tostring(split(guiComboBoxGetItemText(AdminDuty.combobox[3], (guiComboBoxGetSelected(AdminDuty.combobox[3]))):gsub("#", ""), " | ")[1])] = true
          guiComboBoxRemoveItem(AdminDuty.combobox[3], (guiComboBoxGetSelected(AdminDuty.combobox[3])))
        end
      elseif var0 == "Weapons" and guiGetText(AdminDuty.edit[1]) ~= "" and tonumber((guiGetText(AdminDuty.edit[1]))) then
        table.insert(var3, {
          tostring(split(guiComboBoxGetItemText(AdminDuty.combobox[3], (guiComboBoxGetSelected(AdminDuty.combobox[3]))):gsub("#", ""), " | ")[2]),
          tonumber((guiGetText(AdminDuty.edit[1]))),
          0,
          tonumber(split(guiComboBoxGetItemText(AdminDuty.combobox[3], (guiComboBoxGetSelected(AdminDuty.combobox[3]))):gsub("#", ""), " | ")[1])
        })
        triggerServerEvent("duty:updatedAllowedWeaponsForFaction", localPlayer, getElementData(getElementsByType("faction")[guiComboBoxGetSelected(AdminDuty.combobox[1]) + 1], "faction:id"), var3)
        var2[var0][tostring(split(guiComboBoxGetItemText(AdminDuty.combobox[3], (guiComboBoxGetSelected(AdminDuty.combobox[3]))):gsub("#", ""), " | ")[1])] = true
        guiComboBoxRemoveItem(AdminDuty.combobox[3], (guiComboBoxGetSelected(AdminDuty.combobox[3])))
      end
    end
  elseif source == AdminDuty.button[2] and guiGridListGetSelectedItem(AdminDuty.gridlist[1]) ~= -1 then
    var2[var0][tostring((guiGridListGetItemText(AdminDuty.gridlist[1], guiGridListGetSelectedItem(AdminDuty.gridlist[1]), 1)))] = nil
    guiComboBoxAddItem(AdminDuty.combobox[3], "#" .. tostring((guiGridListGetItemText(AdminDuty.gridlist[1], guiGridListGetSelectedItem(AdminDuty.gridlist[1]), 1))) .. " | " .. tostring((guiGridListGetItemText(AdminDuty.gridlist[1], guiGridListGetSelectedItem(AdminDuty.gridlist[1]), 2))))
    if var0 == "Items" then
      for forvar6, forvar7 in ipairs(var1) do
        if forvar7[1] == guiGridListGetItemText(AdminDuty.gridlist[1], guiGridListGetSelectedItem(AdminDuty.gridlist[1]), 2) and tonumber((guiGridListGetItemText(AdminDuty.gridlist[1], guiGridListGetSelectedItem(AdminDuty.gridlist[1]), 1))) == forvar7[2] then
          table.remove(var1, forvar6)
          break
        end
      end
      triggerServerEvent("duty:updatedAllowedItemsForFaction", localPlayer, getElementData(getElementsByType("faction")[guiComboBoxGetSelected(AdminDuty.combobox[1]) + 1], "faction:id"), var1)
    elseif var0 == "Weapons" then
      for forvar6, forvar7 in ipairs(var3) do
        if forvar7[1] == guiGridListGetItemText(AdminDuty.gridlist[1], guiGridListGetSelectedItem(AdminDuty.gridlist[1]), 2) and tonumber((guiGridListGetItemText(AdminDuty.gridlist[1], guiGridListGetSelectedItem(AdminDuty.gridlist[1]), 1))) == forvar7[4] then
          table.remove(var3, forvar6)
          break
        end
      end
      triggerServerEvent("duty:updatedAllowedWeaponsForFaction", localPlayer, getElementData(getElementsByType("faction")[guiComboBoxGetSelected(AdminDuty.combobox[1]) + 1], "faction:id"), var3)
    end
    guiGridListRemoveRow(AdminDuty.gridlist[1], (guiGridListGetSelectedItem(AdminDuty.gridlist[1])))
  end
end)
addEvent("duty:sendAllowedItemsForFaction", true)
addEventHandler("duty:sendAllowedItemsForFaction", root, function(arg0, arg1)
  guiSetEnabled(AdminDuty.button[1], true)
  guiSetEnabled(AdminDuty.button[2], true)
  var0 = arg0
  var1 = arg1
  var2 = {
    Items = {},
    Weapons = {}
  }
  for forvar5, forvar6 in ipairs(var0) do
    var2.Items[tostring(forvar6[2])] = true
  end
  for forvar5, forvar6 in ipairs(var1) do
    var2.Weapons[tostring(forvar6[4])] = true
  end
  selectSection("Items")
end)
