-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

Sections = {
  "Chat",
  "Factions",
  "Vehicles",
  "Properties",
  "Items",
  "Jobs",
  "Misc"
}
UI = {
  window = {},
  label = {},
  button = {},
  gridlist = {},
  lgridlist = {},
  staticimage = {},
  image = {},
  memo = {},
  tabpanel = {},
  tab = {},
  edit = {},
  combobox = {}
}
isCommandsList = {}
function UIKitReady()
  eui = exports.UIKit
  UI.window.AddCommand = eui:uiCreateWindow(false, false, 330, 355, "Add Command")
  eui:uiSetVisible(UI.window.AddCommand, false)
  eui:uiWindowSetMovable(UI.window.AddCommand, false)
  eui:uiCreateLabel(15, 50, 232, 20, "\194\187 Command:", "primary", "left", "top", UI.window.AddCommand)
  UI.edit.Command = eui:uiCreateEdit(10, 75, 310, 20, "", "Command", _, UI.window.AddCommand)
  eui:uiCreateLabel(15, 105, 232, 20, "\194\187 Hotkey:", "primary", "left", "top", UI.window.AddCommand)
  UI.edit.Hotkey = eui:uiCreateEdit(10, 130, 310, 20, "", "Hotkey", _, UI.window.AddCommand)
  eui:uiCreateLabel(15, 160, 232, 20, "\194\187 Explanation:", "primary", "left", "top", UI.window.AddCommand)
  UI.edit.Explanation = eui:uiCreateEdit(10, 185, 310, 20, "", "Explanation", _, UI.window.AddCommand)
  eui:uiCreateLabel(15, 215, 232, 20, "\194\187 Permission:", "primary", "left", "top", UI.window.AddCommand)
  UI.edit.Permission = eui:uiCreateEdit(10, 240, 310, 20, "", "Permission", _, UI.window.AddCommand)
  UI.combobox.Sections = eui:uiCreateComboBox(10, 270, 310, 20, "Sections", tocolor(255, 255, 255), UI.window.AddCommand)
  UI.button.AddCommand = eui:uiCreateButton(10, 315, 100, 30, "Add", _, UI.window.AddCommand)
  UI.button.Close = eui:uiCreateButton(120, 315, 100, 30, "Close", _, UI.window.AddCommand)
  UI.window.LatestNews = eui:uiCreateWindow(false, false, 660, 440, {
    en = "LATEST NEWS",
    ar = "\216\162\216\174\216\177 \216\167\217\132\216\163\216\174\216\168\216\167\216\177"
  })
  eui:uiSetVisible(UI.window.LatestNews, false)
  UI.lgridlist[1] = eui:uiCreateGridList(5, 60, 650, 375, tocolor(10, 10, 10, 0), UI.window.LatestNews)
  eui:uiGridListAddColumn(UI.lgridlist[1], "NEWS", 0.8)
  eui:uiGridListAddColumn(UI.lgridlist[1], "Date", 0.2)
  eui:uiSetAlign(UI.lgridlist[1], "left", "center")
  UI.button.CloseLatestNews = eui:uiCreateButton(5, 435, 650, 30, {en = "CLOSE", ar = "\216\165\216\186\217\132\216\167\217\130"}, _, UI.window.LatestNews)
  eui:uiSetVisible(UI.button.CloseLatestNews, false)
  UI.window.LatestNewsDetails = eui:uiCreateRectangle(false, false, 660, 440, tocolor(5, 5, 5, 240), false, false, false, false)
  eui:uiSetVisible(UI.window.LatestNewsDetails, false)
  eui:uiCreateRectangle(0, 0, 660, 2, "primary", false, false, false, false, UI.window.LatestNewsDetails)
  UI.label.Title2 = eui:uiCreateLabel(15, 10, 232, 20, "SHOW DETAILS", tocolor(255, 255, 255, 255), "left", "top", UI.window.LatestNewsDetails)
  eui:uiSetFont(UI.label.Title2, "default-large")
  UI.memo.LatestNewsDetails = eui:uiCreateMemo(5, 60, 650, 340, "", tocolor(5, 5, 5, 240), UI.window.LatestNewsDetails)
  eui:uiSetProperty(UI.memo.LatestNewsDetails, "TextColor", tocolor(255, 255, 255, 255))
  eui:uiMemoSetReadOnly(UI.memo.LatestNewsDetails, true)
  UI.button.CloseLatestNewsDetails = eui:uiCreateButton(5, 405, 650, 30, "CLOSE", tocolor(0, 0, 0), UI.window.LatestNewsDetails)
end
addEventHandler("onClientUIReady", resourceRoot, UIKitReady)
addEventHandler("onClientUIKitReady", root, UIKitReady)
addEventHandler("onClientUIMenuSelectChange", root, function(arg0, arg1)
  if arg1 and getElementID(source) == "main-menu" and (eui:uiMenuGetItemID(source, arg0) == "rules" or eui:uiMenuGetItemID(source, arg0) == "commands") then
    if eui:uiMenuGetItemID(source, arg0) == "rules" then
      if not isElement(UI.memo.Info) then
        UI.memo.Info = eui:uiCreateMemo(5, 50, eui:uiGetSize(arg1) - 10, eui:uiGetSize(arg1) - 60, "", tocolor(5, 5, 5, 0), arg1)
        eui:uiSetProperty(UI.memo.Info, "TextColor", tocolor(255, 255, 255, 255))
        eui:uiMemoSetReadOnly(UI.memo.Info, true)
      end
      if cachedInfo then
        eui:uiSetText(UI.memo.Info, tostring(cachedInfo))
      end
    elseif eui:uiMenuGetItemID(source, arg0) == "commands" and not isElement(UI.tabpanel.Commands) then
      UI.tabpanel.Commands = eui:uiCreateTabPanel(5, 90, eui:uiGetSize(arg1) - 10, 360, "", tocolor(30, 30, 30, 0), arg1)
      eui:uiSetProperty(UI.tabpanel.Commands, "title_shown", false)
      eui:uiSetProperty(UI.tabpanel.Commands, "tab_height", 40)
      for forvar9, forvar10 in ipairs(Sections) do
        UI.tab[forvar10] = eui:uiCreateTab(forvar10, forvar10, UI.tabpanel.Commands)
        UI.gridlist[forvar10] = eui:uiCreateGridList(0, 5, eui:uiGetSize(arg1) - 10, 350, tocolor(20, 20, 20, 0), UI.tab[forvar10])
        eui:uiGridListAddColumn(UI.gridlist[forvar10], "Command", 0.2)
        eui:uiGridListAddColumn(UI.gridlist[forvar10], "Hotkey", 0.15)
        eui:uiGridListAddColumn(UI.gridlist[forvar10], "Explanation", 0.5)
        eui:uiGridListAddColumn(UI.gridlist[forvar10], "Permission", 0.15)
        eui:uiSetAlign(UI.gridlist[forvar10], "left", "center")
        isCommandsList[UI.gridlist[forvar10]] = true
        eui:uiComboBoxAddItem(UI.combobox.Sections, forvar10)
      end
      UI.label.AddCommandForAdmin = eui:uiCreateLabel(0, eui:uiGetSize(arg1) - 30, eui:uiGetSize(arg1))
      eui:uiSetVisible(UI.label.AddCommandForAdmin, var0 or false)
      if cachedCommands then
        updateCommandsLists(cachedCommands)
      end
    end
    triggerServerEvent("help:getCommands", localPlayer)
  end
end)
function closeLatestNews()
  eui:uiSetVisible(UI.window.LatestNews, false)
  eui:uiSetVisible(UI.window.LatestNewsDetails, false)
end
function openLatestNews(arg0)
  eui:uiSetVisible(UI.window.LatestNewsDetails, false)
  eui:uiSetVisible(UI.window.LatestNews, true)
  triggerServerEvent("help:getLatestNews", localPlayer, arg0)
end
addEventHandler("onClientUIDoubleClick", root, function()
  if source == UI.lgridlist[1] and eui:uiGridListGetSelectedItem(source) ~= -1 then
    eui:uiSetText(UI.memo.LatestNewsDetails, eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1).Details)
    eui:uiSetVisible(UI.window.LatestNews, false)
    eui:uiSetVisible(UI.window.LatestNewsDetails, true)
  end
end)
addEventHandler("onClientUIClick", root, function()
  if source == UI.button.CloseLatestNewsDetails then
    eui:uiSetVisible(UI.window.LatestNewsDetails, false)
    eui:uiSetVisible(UI.window.LatestNews, true)
  end
end)
addEvent("help:getLatestNews:response", true)
addEventHandler("help:getLatestNews:response", localPlayer, function(arg0)
  eui:uiGridListClear(UI.lgridlist[1])
  for forvar4, forvar5 in ipairs(arg0) do
    eui:uiGridListSetItemText(UI.lgridlist[1], eui:uiGridListAddRow(UI.lgridlist[1]), 1, tostring(forvar5.Title))
    eui:uiGridListSetItemText(UI.lgridlist[1], eui:uiGridListAddRow(UI.lgridlist[1]), 2, tostring(forvar5.Date))
    eui:uiGridListSetItemData(UI.lgridlist[1], eui:uiGridListAddRow(UI.lgridlist[1]), 1, forvar5)
  end
end)
function changeAlpha()
  if source == UI.label["Next-Prev"] or source == UI.label.AddCommandForAdmin or source == UI.label.CloseHelpCenter then
    eui:uiSetAlpha(source, eventName == "onClientUIMouseEnter" and 130 or 240)
  end
end
addEventHandler("onClientUIMouseEnter", root, changeAlpha)
addEventHandler("onClientUIMouseLeave", root, changeAlpha)
function closeUIWindows(arg0)
  eui:uiSetVisible(UI.window.AddCommand, false)
  showCursor(false)
end
addEvent("onClientPlayerQuitFromCharacter", true)
addEventHandler("onClientPlayerQuitFromCharacter", localPlayer, closeUIWindows)
addEventHandler("onClientPlayerWasted", localPlayer, closeUIWindows)
addEventHandler("onClientUIClick", root, function()
  if source == UI.label.AddCommandForAdmin then
    eui:uiSetVisible(UI.window.AddCommand, true)
    eui:uiSetText(UI.window.AddCommand, "Add Command")
    eui:uiSetText(UI.button.AddCommand, "Add")
    eui:uiSetText(UI.button.Close, "Close")
    eui:uiBringToFront(UI.window.AddCommand)
    eui:uiSetText(UI.edit.Command, "")
    eui:uiSetText(UI.edit.Hotkey, "")
    eui:uiSetText(UI.edit.Explanation, "")
    eui:uiSetText(UI.edit.Permission, "")
  elseif source == UI.button.Close then
    if eui:uiGetText(source) == "Remove" then
      triggerServerEvent("help:removeCommand", localPlayer, tonumber(currentEditID))
      currentEditID = false
    end
    eui:uiSetVisible(UI.window.AddCommand, false)
  elseif source == UI.button.AddCommand and eui:uiComboBoxGetSelected(UI.combobox.Sections) ~= -1 then
    if eui:uiGetText(source) == "Add" then
      triggerServerEvent("help:addCommand", localPlayer, eui:uiComboBoxGetItemText(UI.combobox.Sections, (eui:uiComboBoxGetSelected(UI.combobox.Sections))), eui:uiGetText(UI.edit.Command), eui:uiGetText(UI.edit.Hotkey), eui:uiGetText(UI.edit.Explanation), (eui:uiGetText(UI.edit.Permission)))
    else
      triggerServerEvent("help:editCommand", localPlayer, currentEditID, eui:uiComboBoxGetItemText(UI.combobox.Sections, (eui:uiComboBoxGetSelected(UI.combobox.Sections))), eui:uiGetText(UI.edit.Command), eui:uiGetText(UI.edit.Hotkey), eui:uiGetText(UI.edit.Explanation), (eui:uiGetText(UI.edit.Permission)))
    end
    eui:uiSetVisible(UI.window.AddCommand, false)
  end
end)
addEventHandler("onClientUIDoubleClick", root, function()
  if not var0 then
    return
  end
  if isCommandsList[source] and eui:uiGridListGetSelectedItem(source) ~= -1 then
    currentEditID = eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 2)
    eui:uiSetVisible(UI.window.AddCommand, true)
    eui:uiSetText(UI.window.AddCommand, "Edit Command")
    eui:uiSetText(UI.button.AddCommand, "Save")
    eui:uiSetText(UI.button.Close, "Remove")
    eui:uiBringToFront(UI.window.AddCommand)
    eui:uiSetText(UI.edit.Command, eui:uiGridListGetItemText(source, eui:uiGridListGetSelectedItem(source), 1))
    eui:uiSetText(UI.edit.Hotkey, eui:uiGridListGetItemText(source, eui:uiGridListGetSelectedItem(source), 2))
    eui:uiSetText(UI.edit.Explanation, eui:uiGridListGetItemText(source, eui:uiGridListGetSelectedItem(source), 3))
    eui:uiSetText(UI.edit.Permission, eui:uiGridListGetItemText(source, eui:uiGridListGetSelectedItem(source), 4))
    for forvar6, forvar7 in ipairs(Sections) do
      if forvar7 == eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1) then
        eui:uiComboBoxSetSelected(UI.combobox.Sections, forvar6 - 1)
        break
      end
    end
  end
end)
GUIEditor = {
  button = {},
  window = {},
  memo = {}
}
addEventHandler("onClientResourceStart", resourceRoot, function()
  GUIEditor.window[2] = guiCreateWindow((guiGetScreenSize() - 675) / 2, (guiGetScreenSize() - 509) / 2, 675, 509, "Edit Help", false)
  guiWindowSetMovable(GUIEditor.window[2], false)
  guiWindowSetSizable(GUIEditor.window[2], false)
  guiSetVisible(GUIEditor.window[2], false)
  GUIEditor.memo[1] = guiCreateMemo(10, 25, 655, 446, "", false, GUIEditor.window[2])
  GUIEditor.button[1] = guiCreateButton(527, 476, 138, 23, "Save Changes", false, GUIEditor.window[2])
end)
addEventHandler("onClientGUIClick", resourceRoot, function()
  if source == GUIEditor.button[1] then
    triggerServerEvent("help:updateHelp", localPlayer, (guiGetText(GUIEditor.memo[1])))
    guiSetVisible(GUIEditor.window[2], false)
    showCursor(false)
  end
end)
addEvent("help:editHelp", true)
addEventHandler("help:editHelp", root, function(arg0)
  guiSetVisible(GUIEditor.window[2], not guiGetVisible(GUIEditor.window[2]))
  showCursor(guiGetVisible(GUIEditor.window[2]))
  guiSetText(GUIEditor.memo[1], tostring(arg0))
end)
addEvent("help:sendCommandsToClient", true)
addEventHandler("help:sendCommandsToClient", root, function(arg0, arg1, arg2)
  var0 = arg2
  if arg0 then
    cachedInfo = arg0
    if isElement(UI.memo.Info) then
      eui:uiSetText(UI.memo.Info, tostring(arg0))
    end
    guiSetText(GUIEditor.memo[1], tostring(arg0))
  end
  if arg1 then
    cachedCommands = arg1
    if isElement(UI.tabpanel.Commands) then
      eui:uiSetVisible(UI.label.AddCommandForAdmin, arg2)
      updateCommandsLists(arg1)
    end
  end
end)
function updateCommandsLists(arg0)
  for forvar4, forvar5 in ipairs(Sections) do
    eui:uiGridListClear(UI.gridlist[forvar5])
  end
  for forvar4, forvar5 in ipairs(arg0) do
    eui:uiGridListSetItemData(UI.gridlist[forvar5.Section], eui:uiGridListAddRow(UI.gridlist[forvar5.Section]), 1, tostring(forvar5.Section))
    eui:uiGridListSetItemData(UI.gridlist[forvar5.Section], eui:uiGridListAddRow(UI.gridlist[forvar5.Section]), 2, tostring(forvar5.ID))
    eui:uiGridListSetItemText(UI.gridlist[forvar5.Section], eui:uiGridListAddRow(UI.gridlist[forvar5.Section]), 1, tostring(forvar5.Command))
    eui:uiGridListSetItemText(UI.gridlist[forvar5.Section], eui:uiGridListAddRow(UI.gridlist[forvar5.Section]), 2, tostring(forvar5.Hotkey))
    eui:uiGridListSetItemText(UI.gridlist[forvar5.Section], eui:uiGridListAddRow(UI.gridlist[forvar5.Section]), 3, tostring(forvar5.Explanation))
    eui:uiGridListSetItemText(UI.gridlist[forvar5.Section], eui:uiGridListAddRow(UI.gridlist[forvar5.Section]), 4, tostring(forvar5.Permission))
  end
end
