-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

GUIEditor = {
  checkbox = {},
  label = {},
  combobox = {},
  edit = {},
  button = {},
  window = {},
  gridlist = {},
  memo = {}
}
addEventHandler("onClientResourceStart", resourceRoot, function()
  GUIEditor.window[1] = guiCreateWindow((guiGetScreenSize() - 776) / 2, (guiGetScreenSize() - 515) / 2, 776, 515, "Custom Vehicles System", false)
  guiWindowSetSizable(GUIEditor.window[1], false)
  guiSetVisible(GUIEditor.window[1], false)
  GUIEditor.edit[13] = guiCreateEdit(10, 25, 756, 30, "", false, GUIEditor.window[1])
  addEventHandler("onClientGUIChanged", GUIEditor.edit[13], searchEvent)
  GUIEditor.gridlist[1] = guiCreateGridList(10, 60, 756, 412, false, GUIEditor.window[1])
  guiGridListSetSortingEnabled(GUIEditor.gridlist[1], false)
  guiGridListAddColumn(GUIEditor.gridlist[1], "ID", 0.05)
  guiGridListAddColumn(GUIEditor.gridlist[1], "Enabled", 0.1)
  guiGridListAddColumn(GUIEditor.gridlist[1], "MTA Model", 0.1)
  guiGridListAddColumn(GUIEditor.gridlist[1], "Brand", 0.1)
  guiGridListAddColumn(GUIEditor.gridlist[1], "Model", 0.1)
  guiGridListAddColumn(GUIEditor.gridlist[1], "Year", 0.1)
  guiGridListAddColumn(GUIEditor.gridlist[1], "Price", 0.1)
  guiGridListAddColumn(GUIEditor.gridlist[1], "Tax", 0.1)
  guiGridListAddColumn(GUIEditor.gridlist[1], "Updated By", 0.15)
  guiGridListAddColumn(GUIEditor.gridlist[1], "Update Date", 0.2)
  guiGridListAddColumn(GUIEditor.gridlist[1], "Created By", 0.15)
  guiGridListAddColumn(GUIEditor.gridlist[1], "Create Date", 0.2)
  guiGridListAddColumn(GUIEditor.gridlist[1], "Notes", 0.5)
  guiGridListAddColumn(GUIEditor.gridlist[1], "Shop", 0.1)
  guiGridListAddColumn(GUIEditor.gridlist[1], "Rent Price", 0.1)
  guiGridListAddColumn(GUIEditor.gridlist[1], "Rentable", 0.1)
  GUIEditor.button[1] = guiCreateButton(10, 478, 86, 27, "Create", false, GUIEditor.window[1])
  GUIEditor.button[2] = guiCreateButton(101, 478, 93, 27, "View/Modify", false, GUIEditor.window[1])
  GUIEditor.button[3] = guiCreateButton(200, 478, 93, 27, "Handling", false, GUIEditor.window[1])
  GUIEditor.button[4] = guiCreateButton(299, 478, 93, 27, "Delete", false, GUIEditor.window[1])
  GUIEditor.button[5] = guiCreateButton(398, 478, 107, 27, "Restart Shops", false, GUIEditor.window[1])
  GUIEditor.button[6] = guiCreateButton(679, 478, 87, 27, "Close", false, GUIEditor.window[1])
  GUIEditor.window[2] = guiCreateWindow((guiGetScreenSize() - 438) / 2, (guiGetScreenSize() - 434) / 2, 438, 434, "Add new vehicle", false)
  guiWindowSetSizable(GUIEditor.window[2], false)
  guiSetVisible(GUIEditor.window[2], false)
  GUIEditor.label[1] = guiCreateLabel(10, 34, 191, 15, "MTA Model / Custom Model:", false, GUIEditor.window[2])
  GUIEditor.edit[1] = guiCreateEdit(9, 53, 96, 31, "", false, GUIEditor.window[2])
  GUIEditor.edit["add:custom_model"] = guiCreateEdit(110, 53, 91, 31, "", false, GUIEditor.window[2])
  GUIEditor.label[2] = guiCreateLabel(10, 94, 191, 15, "Brand:", false, GUIEditor.window[2])
  GUIEditor.label[3] = guiCreateLabel(10, 156, 191, 15, "Model:", false, GUIEditor.window[2])
  GUIEditor.edit[2] = guiCreateEdit(9, 115, 192, 31, "", false, GUIEditor.window[2])
  GUIEditor.edit[3] = guiCreateEdit(9, 177, 192, 31, "", false, GUIEditor.window[2])
  GUIEditor.label[4] = guiCreateLabel(228, 34, 191, 15, "Year:", false, GUIEditor.window[2])
  GUIEditor.edit[4] = guiCreateEdit(227, 53, 192, 31, "", false, GUIEditor.window[2])
  GUIEditor.label[5] = guiCreateLabel(228, 94, 191, 15, "Price:", false, GUIEditor.window[2])
  GUIEditor.label[6] = guiCreateLabel(228, 156, 191, 15, "Tax:", false, GUIEditor.window[2])
  GUIEditor.edit[5] = guiCreateEdit(227, 115, 192, 31, "", false, GUIEditor.window[2])
  GUIEditor.edit[6] = guiCreateEdit(227, 177, 192, 31, "", false, GUIEditor.window[2])
  GUIEditor.label[7] = guiCreateLabel(10, 218, 191, 15, "Spawn to carshop:", false, GUIEditor.window[2])
  GUIEditor.combobox[1] = guiCreateComboBox(9, 237, 192, 118, "", false, GUIEditor.window[2])
  GUIEditor.label[8] = guiCreateLabel(228, 218, 191, 15, "Doors:", false, GUIEditor.window[2])
  GUIEditor.combobox[2] = guiCreateComboBox(228, 237, 95, 118, "", false, GUIEditor.window[2])
  GUIEditor.label[9] = guiCreateLabel(10, 278, 191, 15, "Note(s):", false, GUIEditor.window[2])
  GUIEditor.memo[1] = guiCreateMemo(9, 297, 420, 84, "", false, GUIEditor.window[2])
  GUIEditor.button[7] = guiCreateButton(211, 391, 105, 33, "Validate", false, GUIEditor.window[2])
  GUIEditor.button[8] = guiCreateButton(323, 391, 105, 33, "Cancel", false, GUIEditor.window[2])
  GUIEditor.checkbox[1] = guiCreateCheckBox(334, 237, 85, 21, "Enabled", false, false, GUIEditor.window[2])
  GUIEditor.window[3] = guiCreateWindow((guiGetScreenSize() - 438) / 2, (guiGetScreenSize() - (434 + 50)) / 2, 438, 434 + 50, "Modify vehicle #", false)
  guiWindowSetSizable(GUIEditor.window[3], false)
  guiSetVisible(GUIEditor.window[3], false)
  GUIEditor.label[10] = guiCreateLabel(10, 34, 191, 15, "MTA Model / Org. Model:", false, GUIEditor.window[3])
  GUIEditor.edit[7] = guiCreateEdit(9, 53, 96, 31, "", false, GUIEditor.window[3])
  GUIEditor.edit["edit:custom_model"] = guiCreateEdit(110, 53, 91, 31, "", false, GUIEditor.window[3])
  GUIEditor.label[11] = guiCreateLabel(10, 94, 191, 15, "Brand:", false, GUIEditor.window[3])
  GUIEditor.label[12] = guiCreateLabel(10, 156, 191, 15, "Model:", false, GUIEditor.window[3])
  GUIEditor.edit[8] = guiCreateEdit(9, 115, 192, 31, "", false, GUIEditor.window[3])
  GUIEditor.edit[9] = guiCreateEdit(9, 177, 192, 31, "", false, GUIEditor.window[3])
  GUIEditor.label[13] = guiCreateLabel(228, 34, 191, 15, "Year:", false, GUIEditor.window[3])
  GUIEditor.edit[10] = guiCreateEdit(227, 53, 192, 31, "", false, GUIEditor.window[3])
  GUIEditor.label[14] = guiCreateLabel(228, 94, 191, 15, "Price:", false, GUIEditor.window[3])
  GUIEditor.label[15] = guiCreateLabel(228, 156, 191, 15, "Tax:", false, GUIEditor.window[3])
  GUIEditor.edit[11] = guiCreateEdit(227, 115, 192, 31, "", false, GUIEditor.window[3])
  GUIEditor.edit[12] = guiCreateEdit(227, 177, 192, 31, "", false, GUIEditor.window[3])
  GUIEditor.label[16] = guiCreateLabel(10, 218, 191, 15, "Spawn to carshop:", false, GUIEditor.window[3])
  GUIEditor.combobox[3] = guiCreateComboBox(9, 237, 192, 118, "", false, GUIEditor.window[3])
  GUIEditor.label[17] = guiCreateLabel(228, 218, 191, 15, "Doors:", false, GUIEditor.window[3])
  GUIEditor.combobox[4] = guiCreateComboBox(228, 237, 95, 118, "", false, GUIEditor.window[3])
  GUIEditor.label[18] = guiCreateLabel(10, 278 + 50, 191, 15, "Note(s):", false, GUIEditor.window[3])
  GUIEditor.memo[2] = guiCreateMemo(9, 297 + 50, 420, 84, "", false, GUIEditor.window[3])
  GUIEditor.button[9] = guiCreateButton(211, 391 + 50, 105, 33, "Save", false, GUIEditor.window[3])
  GUIEditor.button[10] = guiCreateButton(323, 391 + 50, 105, 33, "Cancel", false, GUIEditor.window[3])
  GUIEditor.checkbox[2] = guiCreateCheckBox(334, 237, 85, 21, "Enabled", false, false, GUIEditor.window[3])
  GUIEditor.checkbox[3] = guiCreateCheckBox(334, 236 + 50, 85, 21, "Rentable", false, false, GUIEditor.window[3])
  GUIEditor.label[19] = guiCreateLabel(10, 218 + 50, 191, 15, "Rent Price / Hour:", false, GUIEditor.window[3])
  GUIEditor.edit[13] = guiCreateEdit(10, 236 + 50, 191, 31, "", false, GUIEditor.window[3])
end)
EditVehGUI = {
  edit = {},
  button = {},
  window = {},
  label = {},
  combobox = {}
}
addEventHandler("onClientResourceStart", resourceRoot, function()
  EditVehGUI.window[1] = guiCreateWindow((guiGetScreenSize() - 290) / 2, (guiGetScreenSize() - 308) / 2, 290, 308, "Edit Vehicle", false)
  guiWindowSetSizable(EditVehGUI.window[1], false)
  guiSetVisible(EditVehGUI.window[1], false)
  EditVehGUI.label[1] = guiCreateLabel(10, 29, 270, 15, "Brand:", false, EditVehGUI.window[1])
  EditVehGUI.edit[1] = guiCreateEdit(9, 48, 271, 29, "", false, EditVehGUI.window[1])
  EditVehGUI.label[2] = guiCreateLabel(10, 87, 270, 15, "Model:", false, EditVehGUI.window[1])
  EditVehGUI.edit[2] = guiCreateEdit(9, 106, 271, 29, "", false, EditVehGUI.window[1])
  EditVehGUI.label[3] = guiCreateLabel(10, 145, 270, 15, "Year:", false, EditVehGUI.window[1])
  EditVehGUI.edit[3] = guiCreateEdit(9, 164, 271, 29, "", false, EditVehGUI.window[1])
  EditVehGUI.label[4] = guiCreateLabel(10, 207, 61, 15, "Doors:", false, EditVehGUI.window[1])
  EditVehGUI.combobox[1] = guiCreateComboBox(81, 203, 199, 98, "", false, EditVehGUI.window[1])
  EditVehGUI.button[1] = guiCreateButton(9, 265, 82, 33, "Handling", false, EditVehGUI.window[1])
  EditVehGUI.button[2] = guiCreateButton(94, 265, 105, 33, "Save Changes", false, EditVehGUI.window[1])
  EditVehGUI.button[3] = guiCreateButton(202, 265, 79, 33, "Cancel", false, EditVehGUI.window[1])
end)
handlings = {
  {
    "Max Speed (KM/H)",
    "maxVelocity"
  },
  {
    "Acceleration",
    "engineAcceleration"
  },
  {
    "Engine Intertia",
    "engineIntertia"
  },
  {
    "Supension Height",
    "suspensionLowerLimit"
  },
  {
    "Suspension Bias",
    "suspensionFrontRearBias"
  },
  {
    "Suspension Force",
    "suspensionForceLevel"
  },
  {
    "Suspension Damping",
    "suspensionDamping"
  },
  {
    "Steering Lock",
    "steeringLock"
  },
  {
    "Mas Weight (KG)",
    "mass"
  },
  {
    "Center of Mass X",
    "centerOfMassX"
  },
  {
    "Center of Mass Y",
    "centerOfMassY"
  },
  {
    "Center of Mass Z",
    "centerOfMassZ"
  },
  {
    "Drag Coefficiency",
    "dragCoeff"
  },
  {
    "Braking Power",
    "brakeDeceleration"
  },
  {
    "Braking Bias",
    "brakeBias"
  },
  {
    "Traction Multiplier",
    "tractionMultiplier"
  },
  {
    "Traction Bias",
    "tractionBias"
  },
  {"Drive Type", "driveType"},
  {
    "Engine Type (petrol, diesel, electric)",
    "engineType"
  }
}
addEvent("vehlib:showLibrary", true)
addEventHandler("vehlib:showLibrary", root, function(arg0, arg1)
  guiSetText(GUIEditor.edit[13], "")
  var0 = arg0
  guiSetVisible(GUIEditor.window[1], true)
  showCursor(true)
  guiGridListClear(GUIEditor.gridlist[1])
  for forvar5, forvar6 in ipairs(arg0) do
    addRow(forvar6)
  end
  guiComboBoxClear(GUIEditor.combobox[1])
  guiComboBoxClear(GUIEditor.combobox[3])
  for forvar5, forvar6 in ipairs(arg1) do
    guiComboBoxAddItem(GUIEditor.combobox[1], tostring(forvar6[1]))
    guiComboBoxAddItem(GUIEditor.combobox[3], tostring(forvar6[1]))
  end
end)
function addRow(arg0)
  guiGridListSetItemText(GUIEditor.gridlist[1], guiGridListAddRow(GUIEditor.gridlist[1]), 1, tostring(arg0.ID), false, false)
  guiGridListSetItemText(GUIEditor.gridlist[1], guiGridListAddRow(GUIEditor.gridlist[1]), 2, tostring(arg0.Enabled), false, false)
  guiGridListSetItemText(GUIEditor.gridlist[1], guiGridListAddRow(GUIEditor.gridlist[1]), 3, tostring(arg0.MTAModel), false, false)
  guiGridListSetItemData(GUIEditor.gridlist[1], guiGridListAddRow(GUIEditor.gridlist[1]), 3, tostring(arg0.MTACustomModel))
  guiGridListSetItemText(GUIEditor.gridlist[1], guiGridListAddRow(GUIEditor.gridlist[1]), 4, tostring(arg0.Brand), false, false)
  guiGridListSetItemText(GUIEditor.gridlist[1], guiGridListAddRow(GUIEditor.gridlist[1]), 5, tostring(arg0.Model), false, false)
  guiGridListSetItemText(GUIEditor.gridlist[1], guiGridListAddRow(GUIEditor.gridlist[1]), 6, tostring(arg0.Year), false, false)
  guiGridListSetItemText(GUIEditor.gridlist[1], guiGridListAddRow(GUIEditor.gridlist[1]), 7, tostring(arg0.Price), false, false)
  guiGridListSetItemText(GUIEditor.gridlist[1], guiGridListAddRow(GUIEditor.gridlist[1]), 8, tostring(arg0.Tax), false, false)
  guiGridListSetItemText(GUIEditor.gridlist[1], guiGridListAddRow(GUIEditor.gridlist[1]), 9, tostring(arg0.UpdatedBy), false, false)
  guiGridListSetItemText(GUIEditor.gridlist[1], guiGridListAddRow(GUIEditor.gridlist[1]), 10, tostring(arg0.UpdateDate), false, false)
  guiGridListSetItemText(GUIEditor.gridlist[1], guiGridListAddRow(GUIEditor.gridlist[1]), 11, tostring(arg0.CreatedBy), false, false)
  guiGridListSetItemText(GUIEditor.gridlist[1], guiGridListAddRow(GUIEditor.gridlist[1]), 12, tostring(arg0.CreateDate), false, false)
  guiGridListSetItemText(GUIEditor.gridlist[1], guiGridListAddRow(GUIEditor.gridlist[1]), 13, tostring(arg0.Notes), false, false)
  guiGridListSetItemText(GUIEditor.gridlist[1], guiGridListAddRow(GUIEditor.gridlist[1]), 14, tostring(arg0.Shop), false, false)
  guiGridListSetItemText(GUIEditor.gridlist[1], guiGridListAddRow(GUIEditor.gridlist[1]), 15, arg0.RentPrice or "", false, false)
  guiGridListSetItemText(GUIEditor.gridlist[1], guiGridListAddRow(GUIEditor.gridlist[1]), 16, arg0.Rentable == 1 and "Yes" or "No", false, false)
  if arg0.Enabled == "No" then
    for forvar5 = 1, 16 do
      guiGridListSetItemColor(GUIEditor.gridlist[1], guiGridListAddRow(GUIEditor.gridlist[1]), forvar5, 255, 0, 0)
    end
  end
end
function searchEvent(arg0)
  guiGridListClear(GUIEditor.gridlist[1])
  if guiGetText(arg0) == "" then
    for forvar5, forvar6 in ipairs(var0) do
      addRow(forvar6)
    end
  else
    for forvar5, forvar6 in ipairs(var0) do
      if forvar6.ID == guiGetText(arg0) or forvar6.MTAModel == guiGetText(arg0) or string.find(forvar6.Brand, guiGetText(arg0), 1, true) or string.find(forvar6.Model, guiGetText(arg0), 1, true) or string.find(forvar6.Year, guiGetText(arg0), 1, true) or string.find(forvar6.UpdatedBy, guiGetText(arg0), 1, true) or string.find(forvar6.CreatedBy, guiGetText(arg0), 1, true) or string.find(forvar6.UpdateDate, guiGetText(arg0), 1, true) or string.find(forvar6.CreateDate, guiGetText(arg0), 1, true) or string.find(forvar6.Notes, guiGetText(arg0), 1, true) then
        addRow(forvar6)
      end
    end
  end
end
addEventHandler("onClientGUIClick", resourceRoot, function()
  if source == GUIEditor.button[6] then
    guiSetVisible(GUIEditor.window[1], false)
    showCursor(false)
  elseif source == GUIEditor.button[1] then
    guiSetEnabled(GUIEditor.window[1], false)
    guiSetVisible(GUIEditor.window[2], true)
    guiBringToFront(GUIEditor.window[2])
  elseif source == GUIEditor.button[8] then
    guiSetVisible(GUIEditor.window[2], false)
    guiSetEnabled(GUIEditor.window[1], true)
  elseif source == GUIEditor.button[7] then
    if #guiGetText(GUIEditor.edit[2]) ~= 0 and #guiGetText(GUIEditor.edit[4]) ~= 0 and #guiGetText(GUIEditor.edit[3]) ~= 0 and #guiGetText(GUIEditor.edit[1]) ~= 0 and tonumber((guiGetText(GUIEditor.edit[1]))) and #guiGetText(GUIEditor.edit[5]) ~= 0 and #guiGetText(GUIEditor.edit[6]) ~= 0 and guiComboBoxGetSelected(GUIEditor.combobox[1]) ~= -1 then
      guiSetVisible(GUIEditor.window[2], false)
      guiSetEnabled(GUIEditor.window[1], true)
      triggerServerEvent("vehlib:addVehicleToLibrary", localPlayer, guiCheckBoxGetSelected(GUIEditor.checkbox[1]) and "Yes" or "No", guiGetText(GUIEditor.edit[1]), guiGetText(GUIEditor.edit["add:custom_model"]), guiGetText(GUIEditor.edit[2]), guiGetText(GUIEditor.edit[3]), guiGetText(GUIEditor.edit[4]), guiGetText(GUIEditor.edit[5]), guiGetText(GUIEditor.edit[6]), guiGetText(GUIEditor.memo[1]), (guiComboBoxGetSelected(GUIEditor.combobox[1])))
    end
  elseif source == GUIEditor.button[2] then
    if guiGridListGetSelectedItem(GUIEditor.gridlist[1]) ~= -1 then
      guiSetText(GUIEditor.edit[7], tostring((guiGridListGetItemText(GUIEditor.gridlist[1], guiGridListGetSelectedItem(GUIEditor.gridlist[1]), 3))))
      guiSetText(GUIEditor.edit["edit:custom_model"], tostring((guiGridListGetItemData(GUIEditor.gridlist[1], guiGridListGetSelectedItem(GUIEditor.gridlist[1]), 3))))
      guiSetText(GUIEditor.edit[8], tostring((guiGridListGetItemText(GUIEditor.gridlist[1], guiGridListGetSelectedItem(GUIEditor.gridlist[1]), 4))))
      guiSetText(GUIEditor.edit[9], tostring((guiGridListGetItemText(GUIEditor.gridlist[1], guiGridListGetSelectedItem(GUIEditor.gridlist[1]), 5))))
      guiSetText(GUIEditor.edit[10], tostring((guiGridListGetItemText(GUIEditor.gridlist[1], guiGridListGetSelectedItem(GUIEditor.gridlist[1]), 6))))
      guiSetText(GUIEditor.edit[11], tostring((guiGridListGetItemText(GUIEditor.gridlist[1], guiGridListGetSelectedItem(GUIEditor.gridlist[1]), 7))))
      guiSetText(GUIEditor.edit[12], tostring((guiGridListGetItemText(GUIEditor.gridlist[1], guiGridListGetSelectedItem(GUIEditor.gridlist[1]), 8))))
      guiSetText(GUIEditor.memo[2], tostring((guiGridListGetItemText(GUIEditor.gridlist[1], guiGridListGetSelectedItem(GUIEditor.gridlist[1]), 13))))
      guiSetText(GUIEditor.edit[13], tostring((guiGridListGetItemText(GUIEditor.gridlist[1], guiGridListGetSelectedItem(GUIEditor.gridlist[1]), 15))))
      guiSetEnabled(GUIEditor.window[1], false)
      guiSetVisible(GUIEditor.window[3], true)
      guiBringToFront(GUIEditor.window[3])
      guiComboBoxSetSelected(GUIEditor.combobox[3], tonumber((guiGridListGetItemText(GUIEditor.gridlist[1], guiGridListGetSelectedItem(GUIEditor.gridlist[1]), 14))))
      guiCheckBoxSetSelected(GUIEditor.checkbox[2], guiGridListGetItemText(GUIEditor.gridlist[1], guiGridListGetSelectedItem(GUIEditor.gridlist[1]), 2) == "Yes" and true or false)
      guiCheckBoxSetSelected(GUIEditor.checkbox[3], guiGridListGetItemText(GUIEditor.gridlist[1], guiGridListGetSelectedItem(GUIEditor.gridlist[1]), 16) == "Yes" and true or false)
      currentModifyID = guiGridListGetItemText(GUIEditor.gridlist[1], guiGridListGetSelectedItem(GUIEditor.gridlist[1]), 1)
      guiSetText(GUIEditor.window[3], "Modify vehicle #" .. currentModifyID)
    end
  elseif source == GUIEditor.button[10] then
    guiSetVisible(GUIEditor.window[3], false)
    guiSetEnabled(GUIEditor.window[1], true)
  elseif source == GUIEditor.button[9] then
    if #guiGetText(GUIEditor.edit[8]) ~= 0 and #guiGetText(GUIEditor.edit[10]) ~= 0 and #guiGetText(GUIEditor.edit[9]) ~= 0 and #guiGetText(GUIEditor.edit[7]) ~= 0 and #guiGetText(GUIEditor.edit[11]) ~= 0 and #guiGetText(GUIEditor.edit[12]) ~= 0 and guiComboBoxGetSelected(GUIEditor.combobox[3]) ~= -1 then
      guiSetVisible(GUIEditor.window[3], false)
      guiSetEnabled(GUIEditor.window[1], true)
      triggerServerEvent("vehlib:updateVehicleInLibrary", localPlayer, currentModifyID, guiCheckBoxGetSelected(GUIEditor.checkbox[2]) and "Yes" or "No", guiGetText(GUIEditor.edit[7]), guiGetText(GUIEditor.edit["edit:custom_model"]), guiGetText(GUIEditor.edit[8]), guiGetText(GUIEditor.edit[9]), guiGetText(GUIEditor.edit[10]), guiGetText(GUIEditor.edit[11]), guiGetText(GUIEditor.edit[12]), guiGetText(GUIEditor.memo[2]), guiComboBoxGetSelected(GUIEditor.combobox[3]), guiGetText(GUIEditor.edit[13]), (guiCheckBoxGetSelected(GUIEditor.checkbox[3])))
    end
  elseif source == EditVehGUI.button[3] then
    guiSetVisible(EditVehGUI.window[1], false)
  elseif source == EditVehGUI.button[2] then
    if #guiGetText(EditVehGUI.edit[1]) ~= 0 and #guiGetText(EditVehGUI.edit[3]) ~= 0 and #guiGetText(EditVehGUI.edit[2]) ~= 0 then
      guiSetVisible(EditVehGUI.window[1], false)
      triggerServerEvent("vehlib:updateVehicleInfo", localPlayer, current_editveh, guiGetText(EditVehGUI.edit[1]), guiGetText(EditVehGUI.edit[2]), guiGetText(EditVehGUI.edit[3]), true)
    end
  elseif source == EditVehGUI.button[1] then
    guiSetVisible(EditVehGUI.window[1], false)
    guiSetVisible(GUIHandling.window[1], true)
    guiSetText(GUIHandling.window[1], "Handling")
    currentHandlingVehicle = current_editveh
    currentHandlingMTAModel = getElementModel(currentHandlingVehicle)
    refreshHandlingList((getVehicleHandling(currentHandlingVehicle)))
  elseif source == GUIEditor.button[4] then
    if guiGridListGetSelectedItem(GUIEditor.gridlist[1]) ~= -1 then
      triggerServerEvent("vehlib:deleteVehicleFromLibrary", localPlayer, (guiGridListGetItemText(GUIEditor.gridlist[1], guiGridListGetSelectedItem(GUIEditor.gridlist[1]), 1)))
    end
  elseif source == GUIEditor.button[3] then
    if guiGridListGetSelectedItem(GUIEditor.gridlist[1]) ~= -1 then
      currentHandlingMTAModel = guiGridListGetItemText(GUIEditor.gridlist[1], guiGridListGetSelectedItem(GUIEditor.gridlist[1]), 3)
      guiGridListClear(GUIHandling.gridlist[1])
      triggerServerEvent("vehlib:getVehicleHandling", localPlayer, (guiGridListGetItemText(GUIEditor.gridlist[1], guiGridListGetSelectedItem(GUIEditor.gridlist[1]), 1)))
      guiSetVisible(GUIEditor.window[1], false)
      guiSetVisible(GUIHandling.window[1], true)
      guiSetText(GUIHandling.window[1], "Custom Vehicles System - Handling #" .. tostring((guiGridListGetItemText(GUIEditor.gridlist[1], guiGridListGetSelectedItem(GUIEditor.gridlist[1]), 1))))
      currentHandlingID = guiGridListGetItemText(GUIEditor.gridlist[1], guiGridListGetSelectedItem(GUIEditor.gridlist[1]), 1)
      showCursor(false)
    end
  elseif source == GUIEditor.button[5] then
    triggerServerEvent("vehlib:restartShops", localPlayer)
  end
end)
addEvent("vehlib:getVehicleHandling:response", true)
addEventHandler("vehlib:getVehicleHandling:response", root, function(arg0)
  refreshHandlingList(arg0)
end)
GUIHandling = {
  gridlist = {},
  window = {},
  button = {},
  edit = {},
  label = {}
}
addEventHandler("onClientResourceStart", resourceRoot, function()
  GUIHandling.window[1] = guiCreateWindow(10, 323, 315, 435, "Handling", false)
  guiWindowSetSizable(GUIHandling.window[1], false)
  guiSetVisible(GUIHandling.window[1], false)
  GUIHandling.gridlist[1] = guiCreateGridList(9, 26, 296, 363, false, GUIHandling.window[1])
  guiGridListSetSortingEnabled(GUIHandling.gridlist[1], false)
  guiGridListAddColumn(GUIHandling.gridlist[1], "Handling", 0.6)
  guiGridListAddColumn(GUIHandling.gridlist[1], "Value", 0.35)
  GUIHandling.button[1] = guiCreateButton(10, 394, 96, 32, "Save", false, GUIHandling.window[1])
  GUIHandling.button[2] = guiCreateButton(111, 394, 102, 32, "Cancel", false, GUIHandling.window[1])
  GUIHandling.button[5] = guiCreateButton(218, 394, 90, 32, "Reset", false, GUIHandling.window[1])
  GUIHandling.window[2] = guiCreateWindow((guiGetScreenSize() - 351) / 2, (guiGetScreenSize() - 162) / 2, 351, 162, "Change Property Value", false)
  guiWindowSetSizable(GUIHandling.window[2], false)
  guiSetVisible(GUIHandling.window[2], false)
  GUIHandling.label[1] = guiCreateLabel(12, 30, 329, 15, "Property: ", false, GUIHandling.window[2])
  GUIHandling.label[2] = guiCreateLabel(12, 55, 329, 15, "Current Value: ", false, GUIHandling.window[2])
  GUIHandling.label[3] = guiCreateLabel(12, 85, 65, 15, "New Value: ", false, GUIHandling.window[2])
  GUIHandling.edit[1] = guiCreateEdit(83, 80, 258, 30, "", false, GUIHandling.window[2])
  GUIHandling.button[3] = guiCreateButton(247, 122, 94, 30, "Cancel", false, GUIHandling.window[2])
  GUIHandling.button[4] = guiCreateButton(149, 122, 94, 30, "SET", false, GUIHandling.window[2])
end)
ChangeValue = {}
addEventHandler("onClientGUIClick", resourceRoot, function()
  if source == GUIHandling.button[2] then
    guiSetVisible(GUIHandling.window[1], false)
    showCursor(false)
    if string.find(guiGetText(GUIHandling.window[1]), "Custom Vehicles System", 1, true) then
      triggerServerEvent("vehlib:testHandling", localPlayer, guiGetText(GUIHandling.window[1]):gsub("Custom Vehicles System - Handling #", ""), false)
    end
  elseif source == GUIHandling.button[3] then
    guiSetVisible(GUIHandling.window[2], false)
    guiSetEnabled(GUIHandling.window[1], true)
  elseif source == GUIHandling.button[1] then
    for forvar5 = 0, guiGridListGetRowCount(GUIHandling.gridlist[1]) - 1 do
      ({})[guiGridListGetItemData(GUIHandling.gridlist[1], forvar5, 1)] = guiGridListGetItemText(GUIHandling.gridlist[1], forvar5, 2)
    end
    if _FOR_.find(guiGetText(GUIHandling.window[1]), "Custom Vehicles System", 1, true) then
      triggerServerEvent("vehlib:updateVehicleHandlingInLibrary", localPlayer, currentHandlingID, {})
      triggerServerEvent("vehlib:testHandling", localPlayer, currentHandlingID, false)
    else
      triggerServerEvent("vehlib:saveVehicleHandling", localPlayer, currentHandlingVehicle, {})
    end
    guiSetVisible(GUIHandling.window[1], false)
    showCursor(false)
  elseif source == GUIHandling.button[4] then
    guiSetVisible(GUIHandling.window[2], false)
    guiSetEnabled(GUIHandling.window[1], true)
    guiGridListSetItemText(GUIHandling.gridlist[1], ChangeValue.CurrentRow, 2, tostring((guiGetText(GUIHandling.edit[1]))), false, false)
    triggerServerEvent("vehlib:testHandling.apply", localPlayer, guiGridListGetItemData(GUIHandling.gridlist[1], ChangeValue.CurrentRow, 1), (guiGetText(GUIHandling.edit[1])))
  elseif source == GUIHandling.button[5] then
    if getOriginalHandling(tonumber((exports.mods:getMappedModel(currentHandlingMTAModel)))) then
      if getOriginalHandling(tonumber((exports.mods:getMappedModel(currentHandlingMTAModel)))).maxVelocity == 0 then
        getOriginalHandling(tonumber((exports.mods:getMappedModel(currentHandlingMTAModel)))).maxVelocity = 150
      end
      refreshHandlingList((getOriginalHandling(tonumber((exports.mods:getMappedModel(currentHandlingMTAModel))))))
      for forvar5, forvar6 in pairs((getOriginalHandling(tonumber((exports.mods:getMappedModel(currentHandlingMTAModel)))))) do
        triggerServerEvent("vehlib:testHandling.apply", localPlayer, forvar5, forvar6)
      end
    else
      outputChatBox("The handling of this vehicle cannot be reset.", 255, 0, 0)
    end
  end
end)
addEventHandler("onClientGUIDoubleClick", resourceRoot, function()
  if source == GUIHandling.gridlist[1] and guiGridListGetSelectedItem(source) ~= -1 then
    guiSetVisible(GUIHandling.window[2], true)
    guiSetEnabled(GUIHandling.window[1], false)
    ChangeValue.Property = guiGridListGetItemText(source, guiGridListGetSelectedItem(source), 1)
    ChangeValue.Value = guiGridListGetItemText(source, guiGridListGetSelectedItem(source), 2)
    ChangeValue.ValueType = guiGridListGetItemData(source, guiGridListGetSelectedItem(source), 2)
    ChangeValue.CurrentRow = guiGridListGetSelectedItem(source)
    guiSetText(GUIHandling.label[1], "Property: " .. tostring(ChangeValue.Property))
    guiSetText(GUIHandling.label[2], "Current Value: " .. tostring(ChangeValue.Value))
  end
end)
function refreshHandlingList(arg0)
  guiGridListClear(GUIHandling.gridlist[1])
  for forvar4, forvar5 in ipairs(handlings) do
    guiGridListSetItemText(GUIHandling.gridlist[1], guiGridListAddRow(GUIHandling.gridlist[1]), 1, tostring(forvar5[1]), false, false)
    guiGridListSetItemData(GUIHandling.gridlist[1], guiGridListAddRow(GUIHandling.gridlist[1]), 1, forvar5[2])
    guiGridListSetItemText(GUIHandling.gridlist[1], guiGridListAddRow(GUIHandling.gridlist[1]), 2, tostring(arg0[forvar5[2]]), false, false)
    guiGridListSetItemData(GUIHandling.gridlist[1], guiGridListAddRow(GUIHandling.gridlist[1]), 2, type(arg0[forvar5[2]]))
  end
end
addEvent("vehlib:editveh", true)
addEventHandler("vehlib:editveh", root, function(arg0, arg1)
  guiSetVisible(EditVehGUI.window[1], true)
  current_editveh = arg0
  guiSetText(EditVehGUI.edit[1], tostring(arg1[2]))
  guiSetText(EditVehGUI.edit[2], tostring(arg1[3]))
  guiSetText(EditVehGUI.edit[3], tostring(arg1[4]))
end)
UI = {
  edit = {},
  window = {},
  label = {},
  checkbox = {},
  switch = {},
  button = {},
  radiobutton = {},
  image = {},
  gridlist = {},
  rect = {},
  labelValue = {},
  progressbar = {},
  combobox = {}
}
function UIKitReady()
  eui = exports.UIKit
  UI.window[1] = eui:uiCreateWindow(false, false, 439, 237, {
    en = "Buy Vehicle",
    ar = "\216\180\216\177\216\167\216\161 \217\133\216\177\217\131\216\168\216\169"
  }, _, ":assets/icons/car.png")
  eui:uiWindowSetMovable(UI.window[1], false)
  eui:uiSetVisible(UI.window[1], false)
  eui:uiCreateLabel(10, 40, 420, 15, "Please confirm the following information about this vehicle.", tocolor(255, 255, 255, 240), UI.window[1])
  UI.label[1] = eui:uiCreateLabel(10, 70, 420, 15, "Vehicle Name: ", "primary", UI.window[1])
  UI.label[2] = eui:uiCreateLabel(10, 90, 420, 15, "Brand: ", "primary", UI.window[1])
  UI.label[3] = eui:uiCreateLabel(10, 125, 420, 15, "Pricing: ", tocolor(255, 255, 255, 230), UI.window[1])
  eui:uiSetAlign(UI.label[3], "center", "center")
  for forvar8, forvar9 in ipairs(var0) do
    UI.image[forvar8] = eui:uiCreateImage((439 - (35 * #var0 - 5)) / 2 + 35 * (forvar8 - 1), 237 - 80, 30, 30, ":vehicle-library/circle.png", UI.window[1])
    eui:uiSetColor(UI.image[forvar8], forvar9[1], forvar9[2], forvar9[3], 50)
    var1[UI.image[forvar8]] = forvar9
  end
  UI.button[1] = eui:uiCreateButton(5, 237 - 35, 120, 30, {en = "Buy", ar = "\216\180\216\177\216\167\216\161"}, _, UI.window[1])
  UI.button[2] = eui:uiCreateButton(130, 237 - 35, 120, 30, {en = "Cancel", ar = "\216\165\217\132\216\186\216\167\216\161"}, _, UI.window[1])
end
addEventHandler("onClientUIReady", resourceRoot, UIKitReady)
addEventHandler("onClientUIKitReady", root, UIKitReady)
function changeAlpha()
  if var0[source] and var1 ~= source then
    eui:uiSetAlpha(source, eventName == "onClientUIMouseEnter" and 240 or 50)
  end
end
addEventHandler("onClientUIMouseEnter", root, changeAlpha)
addEventHandler("onClientUIMouseLeave", root, changeAlpha)
addEvent("vehlib:showBuyWindow", true)
addEventHandler("vehlib:showBuyWindow", root, function(arg0, arg1)
  if exports.hud:isHudItemExists("special_membership:Premium") then
  elseif exports.hud:isHudItemExists("special_membership:Plus") then
  elseif exports.hud:isHudItemExists("special_membership:Classic") then
  end
  if var0 then
    eui:uiSetAlpha(var0, 50)
  end
  var0 = UI.image[1]
  eui:uiSetAlpha(var0, 255)
  arg0.Price = math.floor(tonumber(arg0.Price) - tonumber(arg0.Price) * (5 / 100))
  currentInfoToBuyVehicle = arg0
  currentVehicleToBuy = arg1
  eui:uiSetVisible(UI.window[1], true)
  showCursor(true)
  eui:uiSetText(UI.label[1], "\226\128\162 Vehicle Name  \194\187  #FFFFFF" .. tostring(arg0.Model) .. " " .. tostring(arg0.Year))
  eui:uiSetText(UI.label[2], "\226\128\162 Brand  \194\187  #FFFFFF" .. tostring(arg0.Brand))
  if 5 == 0 then
    eui:uiSetText(UI.label[3], "Pricing: #00FF00$" .. tostring(convertNumber(arg0.Price)) .. "  #FFFFFFwith tax ($" .. tostring(convertNumber(arg0.Tax)) .. ")")
  else
    eui:uiSetText(UI.label[3], "Pricing: #00FF00$" .. tostring(convertNumber(arg0.Price)) .. " #FFFF00(-" .. tostring(5) .. "%)  #FFFFFFwith tax ($" .. tostring(convertNumber(arg0.Tax)) .. ")")
  end
end)
function convertNumber(arg0)
  while true do
    k = string.gsub(arg0, "^(-?%d+)(%d%d%d)", "%1,%2")
    if k == 0 then
      break
    end
  end
  return string.gsub(arg0, "^(-?%d+)(%d%d%d)", "%1,%2")
end
addEventHandler("onClientUIClick", root, function()
  if source == UI.button[1] then
    triggerServerEvent("vehlib:buyVehicle", localPlayer, currentInfoToBuyVehicle, unpack(var1[var0]))
    eui:uiSetVisible(UI.window[1], false)
    showCursor(false)
  elseif source == UI.button[2] then
    eui:uiSetVisible(UI.window[1], false)
    showCursor(false)
  elseif var1[source] then
    if var0 then
      eui:uiSetAlpha(var0, 50)
    end
    var0 = source
    eui:uiSetAlpha(source, 255)
    setVehicleColor(currentVehicleToBuy, unpack(var1[source]))
  end
end)
