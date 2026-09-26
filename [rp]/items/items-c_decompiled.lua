-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

function getItemImageName(arg0)
  if var0[arg0.Name] then
    return ":items/images/" .. var0[arg0.Name] .. ".png"
  elseif var0[arg0.Type] then
    return ":items/images/" .. var0[arg0.Type] .. ".png"
  else
    return ":items/images/item.png"
  end
end
GUIEditor = {
  tab = {},
  tabpanel = {},
  edit = {},
  button = {},
  window = {},
  label = {},
  gridlist = {}
}
addEventHandler("onClientResourceStart", resourceRoot, function()
  GUIEditor.window[1] = guiCreateWindow((guiGetScreenSize() - 648) / 2, (guiGetScreenSize() - 436) / 2, 648, 436, "Items Manager", false)
  guiWindowSetSizable(GUIEditor.window[1], false)
  guiSetAlpha(GUIEditor.window[1], 0.9)
  guiSetVisible(GUIEditor.window[1], false)
  GUIEditor.tabpanel[1] = guiCreateTabPanel(9, 24, 629, 402, false, GUIEditor.window[1])
  GUIEditor.tab[1] = guiCreateTab("Items List", GUIEditor.tabpanel[1])
  GUIEditor.edit[10] = guiCreateEdit(10, 10, 609, 25, "", false, GUIEditor.tab[1])
  addEventHandler("onClientGUIChanged", GUIEditor.edit[10], searchEvent)
  GUIEditor.gridlist[1] = guiCreateGridList(10, 40, 609, 295, false, GUIEditor.tab[1])
  guiGridListSetSortingEnabled(GUIEditor.gridlist[1], false)
  guiGridListAddColumn(GUIEditor.gridlist[1], "ID", 0.1)
  guiGridListAddColumn(GUIEditor.gridlist[1], "Name", 0.4)
  guiGridListAddColumn(GUIEditor.gridlist[1], "Type", 0.3)
  guiGridListAddColumn(GUIEditor.gridlist[1], "Capacity", 0.1)
  GUIEditor.button[1] = guiCreateButton(10, 340, 110, 28, "Remove Item", false, GUIEditor.tab[1])
  GUIEditor.button[2] = guiCreateButton(125, 340, 110, 28, "Edit Item", false, GUIEditor.tab[1])
  GUIEditor.button[3] = guiCreateButton(509, 340, 110, 28, "Close", false, GUIEditor.tab[1])
  GUIEditor.button[4] = guiCreateButton(241, 340, 110, 28, "Take Item", false, GUIEditor.tab[1])
  guiSetEnabled(GUIEditor.button[4], false)
  GUIEditor.tab[2] = guiCreateTab("Add Item", GUIEditor.tabpanel[1])
  GUIEditor.label[1] = guiCreateLabel(17, 15, 232, 15, "Item Name:", false, GUIEditor.tab[2])
  GUIEditor.edit[1] = guiCreateEdit(17, 35, 234, 26, "", false, GUIEditor.tab[2])
  GUIEditor.label[2] = guiCreateLabel(17, 71, 232, 15, "Type:", false, GUIEditor.tab[2])
  GUIEditor.edit[2] = guiCreateEdit(17, 91, 234, 26, "", false, GUIEditor.tab[2])
  GUIEditor.label[3] = guiCreateLabel(16, 127, 232, 15, "Price:", false, GUIEditor.tab[2])
  GUIEditor.edit[3] = guiCreateEdit(15, 148, 234, 26, "", false, GUIEditor.tab[2])
  GUIEditor.label[4] = guiCreateLabel(16, 184, 232, 15, "Size:", false, GUIEditor.tab[2])
  GUIEditor.edit[4] = guiCreateEdit(28, 205, 45, 30, "", false, GUIEditor.tab[2])
  GUIEditor.edit[5] = guiCreateEdit(106, 205, 45, 30, "", false, GUIEditor.tab[2])
  GUIEditor.label[5] = guiCreateLabel(73, 205, 33, 30, "X", false, GUIEditor.tab[2])
  guiLabelSetHorizontalAlign(GUIEditor.label[5], "center", false)
  guiLabelSetVerticalAlign(GUIEditor.label[5], "center")
  GUIEditor.label[6] = guiCreateLabel(288, 15, 232, 15, "Properties:", false, GUIEditor.tab[2])
  GUIEditor.gridlist[2] = guiCreateGridList(288, 35, 323, 109, false, GUIEditor.tab[2])
  guiGridListAddColumn(GUIEditor.gridlist[2], "Name", 0.5)
  guiGridListAddColumn(GUIEditor.gridlist[2], "Value", 0.5)
  GUIEditor.edit[6] = guiCreateEdit(289, 151, 157, 29, "", false, GUIEditor.tab[2])
  GUIEditor.edit[7] = guiCreateEdit(450, 151, 127, 29, "", false, GUIEditor.tab[2])
  GUIEditor.button[5] = guiCreateButton(583, 152, 28, 28, "+", false, GUIEditor.tab[2])
  GUIEditor.label[7] = guiCreateLabel(288, 199, 232, 15, "Special Properties:", false, GUIEditor.tab[2])
  GUIEditor.gridlist[3] = guiCreateGridList(288, 220, 323, 109, false, GUIEditor.tab[2])
  guiGridListAddColumn(GUIEditor.gridlist[3], "Name", 0.5)
  guiGridListAddColumn(GUIEditor.gridlist[3], "Value", 0.5)
  GUIEditor.edit[8] = guiCreateEdit(289, 334, 157, 29, "", false, GUIEditor.tab[2])
  GUIEditor.edit[9] = guiCreateEdit(450, 334, 127, 29, "", false, GUIEditor.tab[2])
  GUIEditor.button[6] = guiCreateButton(583, 335, 28, 28, "+", false, GUIEditor.tab[2])
  GUIEditor.button[7] = guiCreateButton(10, 306, 240, 28, "Add Item", false, GUIEditor.tab[2])
  GUIEditor.button[8] = guiCreateButton(10, 340, 240, 28, "Cancel", false, GUIEditor.tab[2])
end)
addEvent("items:showlist", true)
addEventHandler("items:showlist", root, function(arg0)
  var0 = {}
  for forvar4 in pairs(arg0) do
    table.insert(var0, tonumber(forvar4))
  end
  table.sort(var0)
  var1 = arg0
  guiSetVisible(GUIEditor.window[1], true)
  showCursor(true)
  guiSetSelectedTab(GUIEditor.tabpanel[1], GUIEditor.tab[1])
  guiGridListClear(GUIEditor.gridlist[1])
  for forvar4, forvar5 in ipairs(var0) do
    addRow(var1[tostring(forvar5)])
  end
end)
function addRow(arg0)
  guiGridListSetItemText(GUIEditor.gridlist[1], guiGridListAddRow(GUIEditor.gridlist[1]), 1, tostring(arg0[8]), false, false)
  guiGridListSetItemData(GUIEditor.gridlist[1], guiGridListAddRow(GUIEditor.gridlist[1]), 1, arg0)
  guiGridListSetItemText(GUIEditor.gridlist[1], guiGridListAddRow(GUIEditor.gridlist[1]), 2, tostring(arg0[1]), false, false)
  guiGridListSetItemText(GUIEditor.gridlist[1], guiGridListAddRow(GUIEditor.gridlist[1]), 3, tostring(arg0[2]), false, false)
  if type(arg0[5]) ~= "table" or not arg0[5] then
  end
  guiGridListSetItemText(GUIEditor.gridlist[1], guiGridListAddRow(GUIEditor.gridlist[1]), 4, tostring(({1, 1})[1]) .. "x" .. tostring(({1, 1})[2]), false, false)
end
function searchEvent(arg0)
  guiGridListClear(GUIEditor.gridlist[1])
  if string.lower((guiGetText(arg0))) == "" then
    for forvar5, forvar6 in ipairs(var0) do
      addRow(var1[tostring(forvar6)])
    end
  else
    for forvar5, forvar6 in ipairs(var0) do
      if string.find(string.lower(var1[tostring(forvar6)][1]), string.lower((guiGetText(arg0))), 1, true) or string.find(string.lower(var1[tostring(forvar6)][2]), string.lower((guiGetText(arg0))), 1, true) then
        addRow(var1[tostring(forvar6)])
      end
    end
  end
end
addEventHandler("onClientGUITabSwitched", resourceRoot, function(arg0)
  if arg0 == GUIEditor.tab[1] then
    guiSetText(GUIEditor.tab[2], "Add Item")
    guiSetText(GUIEditor.button[7], "Add Item")
  end
end)
addEventHandler("onClientGUIClick", resourceRoot, function()
  if source == GUIEditor.button[3] then
    guiSetVisible(GUIEditor.window[1], false)
    showCursor(false)
  elseif source == GUIEditor.button[1] then
    if guiGridListGetSelectedItem(GUIEditor.gridlist[1]) ~= -1 then
      triggerServerEvent("inventory:removeItemFromList", localPlayer, guiGridListGetItemData(GUIEditor.gridlist[1], guiGridListGetSelectedItem(GUIEditor.gridlist[1]), 1)[8])
    end
  elseif source == GUIEditor.button[2] then
    if guiGridListGetSelectedItem(GUIEditor.gridlist[1]) ~= -1 then
      guiSetText(GUIEditor.edit[1], guiGridListGetItemData(GUIEditor.gridlist[1], guiGridListGetSelectedItem(GUIEditor.gridlist[1]), 1)[1])
      guiSetText(GUIEditor.edit[2], guiGridListGetItemData(GUIEditor.gridlist[1], guiGridListGetSelectedItem(GUIEditor.gridlist[1]), 1)[2])
      guiSetText(GUIEditor.edit[3], guiGridListGetItemData(GUIEditor.gridlist[1], guiGridListGetSelectedItem(GUIEditor.gridlist[1]), 1)[4])
      guiSetText(GUIEditor.edit[4], guiGridListGetItemData(GUIEditor.gridlist[1], guiGridListGetSelectedItem(GUIEditor.gridlist[1]), 1)[5][1])
      guiSetText(GUIEditor.edit[5], guiGridListGetItemData(GUIEditor.gridlist[1], guiGridListGetSelectedItem(GUIEditor.gridlist[1]), 1)[5][2])
      guiGridListClear(GUIEditor.gridlist[2])
      guiGridListClear(GUIEditor.gridlist[3])
      for forvar5, forvar6 in pairs(guiGridListGetItemData(GUIEditor.gridlist[1], guiGridListGetSelectedItem(GUIEditor.gridlist[1]), 1)[6]) do
        guiGridListSetItemText(GUIEditor.gridlist[2], guiGridListAddRow(GUIEditor.gridlist[2]), 1, tostring(forvar5), false, false)
        if type(forvar6) ~= "table" or not toJSON(forvar6) then
        end
        guiGridListSetItemText(GUIEditor.gridlist[2], guiGridListAddRow(GUIEditor.gridlist[2]), 2, tostring(forvar6), false, false)
        guiGridListSetItemData(GUIEditor.gridlist[2], guiGridListAddRow(GUIEditor.gridlist[2]), 2, forvar6)
      end
      for forvar5, forvar6 in pairs(guiGridListGetItemData(GUIEditor.gridlist[1], guiGridListGetSelectedItem(GUIEditor.gridlist[1]), 1)[7]) do
        guiGridListSetItemText(GUIEditor.gridlist[3], guiGridListAddRow(GUIEditor.gridlist[3]), 1, tostring(forvar5), false, false)
        if type(forvar6) ~= "table" or not toJSON(forvar6) then
        end
        guiGridListSetItemText(GUIEditor.gridlist[3], guiGridListAddRow(GUIEditor.gridlist[3]), 2, tostring(forvar6), false, false)
        guiGridListSetItemData(GUIEditor.gridlist[2], guiGridListAddRow(GUIEditor.gridlist[3]), 2, forvar6)
      end
      guiSetText(GUIEditor.tab[2], "Edit Item")
      guiSetText(GUIEditor.button[7], "Save Changes")
      guiSetSelectedTab(GUIEditor.tabpanel[1], GUIEditor.tab[2])
      currentEditItemID = guiGridListGetItemData(GUIEditor.gridlist[1], guiGridListGetSelectedItem(GUIEditor.gridlist[1]), 1)[8]
    end
  elseif source == GUIEditor.button[8] then
    guiSetText(GUIEditor.edit[1], "")
    guiSetText(GUIEditor.edit[2], "")
    guiSetText(GUIEditor.edit[3], "")
    guiSetText(GUIEditor.edit[4], "")
    guiSetText(GUIEditor.edit[5], "")
    guiGridListClear(GUIEditor.gridlist[2])
    guiGridListClear(GUIEditor.gridlist[3])
    guiSetSelectedTab(GUIEditor.tabpanel[1], GUIEditor.tab[1])
  elseif source == GUIEditor.button[5] then
    if guiGetText(GUIEditor.edit[6]) ~= "" then
      guiGridListSetItemText(GUIEditor.gridlist[2], guiGridListAddRow(GUIEditor.gridlist[2]), 1, guiGetText(GUIEditor.edit[6]), false, false)
      guiGridListSetItemText(GUIEditor.gridlist[2], guiGridListAddRow(GUIEditor.gridlist[2]), 2, guiGetText(GUIEditor.edit[7]), false, false)
      guiGridListSetItemData(GUIEditor.gridlist[2], guiGridListAddRow(GUIEditor.gridlist[2]), 2, (guiGetText(GUIEditor.edit[7])))
      guiSetText(GUIEditor.edit[6], "")
      guiSetText(GUIEditor.edit[7], "")
    end
  elseif source == GUIEditor.button[6] then
    if guiGetText(GUIEditor.edit[8]) ~= "" then
      guiGridListSetItemText(GUIEditor.gridlist[3], guiGridListAddRow(GUIEditor.gridlist[3]), 1, guiGetText(GUIEditor.edit[8]), false, false)
      guiGridListSetItemText(GUIEditor.gridlist[3], guiGridListAddRow(GUIEditor.gridlist[3]), 2, guiGetText(GUIEditor.edit[9]), false, false)
      guiGridListSetItemData(GUIEditor.gridlist[3], guiGridListAddRow(GUIEditor.gridlist[3]), 2, (guiGetText(GUIEditor.edit[9])))
      guiSetText(GUIEditor.edit[8], "")
      guiSetText(GUIEditor.edit[9], "")
    end
  elseif source == GUIEditor.button[7] and guiGetText(GUIEditor.edit[1]) ~= "" and tonumber((guiGetText(GUIEditor.edit[3]))) and tonumber((guiGetText(GUIEditor.edit[4]))) and tonumber((guiGetText(GUIEditor.edit[5]))) then
    for forvar10 = 0, guiGridListGetRowCount(GUIEditor.gridlist[2]) - 1 do
      if guiGridListGetItemData(GUIEditor.gridlist[2], forvar10, 2) == "@false" then
        ({})[guiGridListGetItemText(GUIEditor.gridlist[2], forvar10, 1)] = false
      elseif guiGridListGetItemData(GUIEditor.gridlist[2], forvar10, 2) == "@true" then
        ({})[guiGridListGetItemText(GUIEditor.gridlist[2], forvar10, 1)] = true
      else
        ({})[guiGridListGetItemText(GUIEditor.gridlist[2], forvar10, 1)] = tonumber((guiGridListGetItemData(GUIEditor.gridlist[2], forvar10, 2))) or guiGridListGetItemData(GUIEditor.gridlist[2], forvar10, 2)
      end
    end
    for forvar10 = 0, guiGridListGetRowCount(GUIEditor.gridlist[3]) - 1 do
      if guiGridListGetItemData(GUIEditor.gridlist[3], forvar10, 2) == "@false" then
        ({})[guiGridListGetItemText(GUIEditor.gridlist[3], forvar10, 1)] = false
      elseif guiGridListGetItemData(GUIEditor.gridlist[3], forvar10, 2) == "@true" then
        ({})[guiGridListGetItemText(GUIEditor.gridlist[3], forvar10, 1)] = true
      else
        ({})[guiGridListGetItemText(GUIEditor.gridlist[3], forvar10, 1)] = tonumber((guiGridListGetItemData(GUIEditor.gridlist[3], forvar10, 2))) or guiGridListGetItemData(GUIEditor.gridlist[3], forvar10, 2)
      end
    end
    if guiGetText(GUIEditor.button[7]) == "Add Item" then
      triggerServerEvent("inventory:addToItemsList", localPlayer, guiGetText(GUIEditor.edit[1]), guiGetText(GUIEditor.edit[2]), guiGetText(GUIEditor.edit[3]), {
        guiGetText(GUIEditor.edit[4]),
        (guiGetText(GUIEditor.edit[5]))
      }, {}, {})
    else
      triggerServerEvent("inventory:editItemInList", localPlayer, currentEditItemID, guiGetText(GUIEditor.edit[1]), guiGetText(GUIEditor.edit[2]), guiGetText(GUIEditor.edit[3]), {
        guiGetText(GUIEditor.edit[4]),
        (guiGetText(GUIEditor.edit[5]))
      }, {}, {})
    end
  end
end)
addEventHandler("onClientGUIDoubleClick", resourceRoot, function()
  if source == GUIEditor.gridlist[1] then
    if guiGridListGetSelectedItem(source) ~= -1 then
      triggerServerEvent("items:giveItem", localPlayer, (guiGridListGetItemText(source, guiGridListGetSelectedItem(source), 2)))
    end
  elseif (source == GUIEditor.gridlist[2] or source == GUIEditor.gridlist[3]) and guiGridListGetSelectedItem(source) ~= -1 then
    guiGridListRemoveRow(source, (guiGridListGetSelectedItem(source)))
  end
end)
