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
  combobox = {},
  container = {},
  image = {},
  rectangle = {},
  dialog = {}
}
function UIKitReady()
  eui = exports.UIKit
  UI.window.admin_panel = eui:uiCreateRectangle(false, false, 905, 575, tocolor(6, 9, 14, 235), true, true, true, true)
  eui:uiSetVisible(UI.window.admin_panel, false)
  eui:uiBringToFront(UI.window.admin_panel)
  UI.label.MainMenuTitle = eui:uiCreateLabel(15, 10, 200, 45, "Admin Panel", tocolor(255, 255, 255), "left", "center", UI.window.admin_panel)
  eui:uiSetFont(UI.label.MainMenuTitle, "default-large")
  UI.button.close_panel = eui:uiCreateButton(5, 575 - 45, 150, 40, {en = "Close", ar = "\216\165\216\186\217\132\216\167\217\130"}, tocolor(6, 9, 14, 255), UI.window.admin_panel)
  eui:uiSetProperty(UI.button.close_panel, "HoverTextColor", tocolor(255, 0, 0))
  for forvar9, forvar10 in ipairs(var0) do
    UI.container[forvar10.id] = eui:uiCreateContainer(0, 0, 905 - 150 - 15, 575 - 10, (eui:uiCreateRectangle(150 + 10, 5, 905 - 150 - 15, 575 - 10, tocolor(11, 14, 19, 230), true, true, true, true, UI.window.admin_panel)))
    eui:uiSetVisible(UI.container[forvar10.id], false)
    UI.label.title = eui:uiCreateLabel(15, 10, 200, 30, forvar10.title, tocolor(255, 0, 0, 255), "left", "center", UI.container[forvar10.id])
    eui:uiSetFont(UI.label.title, "default-large")
  end
  UI.gridlist.staffs = eui:uiCreateGridList(10, 60, 905 - 150 - 15 - 20, 575 - 10 - 120, tocolor(10, 10, 10, 0), UI.container.staffs)
  eui:uiGridListAddColumn(UI.gridlist.staffs, "Rank", 0.27)
  eui:uiGridListAddColumn(UI.gridlist.staffs, "Username", 0.28)
  eui:uiGridListAddColumn(UI.gridlist.staffs, "Reports #", 0.13)
  eui:uiGridListAddColumn(UI.gridlist.staffs, "Feedback Rating", 0.18)
  eui:uiGridListAddColumn(UI.gridlist.staffs, "Feedback #", 0.14)
  eui:uiSetAlign(UI.gridlist.staffs, "left", "center")
  eui:uiSetProperty(UI.gridlist.staffs, "color_coded", true)
  eui:uiSetProperty(UI.gridlist.staffs, "column_font_scale", 0.8)
  UI.button.delete_admin = eui:uiCreateButton(10, 575 - 10 - 45, 150, 35, {en = "Remove", ar = "\216\165\216\178\216\167\217\132\216\169"}, tocolor(6, 9, 14, 255), UI.container.staffs)
  eui:uiSetProperty(UI.button.delete_admin, "TextColor", tocolor(255, 0, 0))
  UI.button.add_admin = eui:uiCreateButton(170, 575 - 10 - 45, 150, 35, {en = "Add", ar = "\216\165\216\182\216\167\217\129\216\169"}, tocolor(6, 9, 14, 255), UI.container.staffs)
  UI.window.add_staff = eui:uiCreateRectangle(false, false, 400, 390, tocolor(6, 9, 14, 235), true, true, true, true)
  eui:uiSetVisible(UI.window.add_staff, false)
  UI.label.add_staff = eui:uiCreateLabel(10, 15, 232, 20, {en = "Add Staff", ar = "Add Staff"}, tocolor(255, 255, 255, 255), "left", "top", UI.window.add_staff)
  eui:uiSetFont(UI.label.add_staff, "default-large")
  UI.edit.add_staff_account = eui:uiCreateEdit(10, 50, 380, 25, "", "Username", tocolor(255, 0, 0, 255), UI.window.add_staff)
  UI.gridlist.add_staff_ranks = eui:uiCreateGridList(10, 90, 380, 250, tocolor(6, 9, 14, 255), UI.window.add_staff)
  eui:uiGridListAddColumn(UI.gridlist.add_staff_ranks, "Rank Name", 1)
  eui:uiSetAlign(UI.gridlist.add_staff_ranks, "left", "center")
  UI.button.cancel_add_staff = eui:uiCreateButton(10, 345, 185, 35, {en = "Cancel", ar = "\216\165\217\132\216\186\216\167\216\161"}, tocolor(3, 6, 11), UI.window.add_staff)
  UI.button.add_staff = eui:uiCreateButton(200, 345, 190, 35, {en = "Add", ar = "\216\165\216\182\216\167\217\129\216\169"}, tocolor(3, 6, 11), UI.window.add_staff)
  UI.dialog.delete_staff = eui:uiCreateDialog(false, false, 300, 160, "Confirm")
  eui:uiSetVisible(UI.dialog.delete_staff, false)
  UI.label.delete_staff = eui:uiCreateLabel(10, 50, 280, 30, {
    en = "Are you sure you want to delete this staff?",
    ar = "\217\135\217\132 \216\163\217\134\216\170 \217\133\216\170\216\163\217\131\216\175 \217\133\217\134 \216\173\216\176\217\129 \217\135\216\176\216\167 \216\167\217\132\216\165\216\175\216\167\216\177\217\138\216\159"
  }, tocolor(255, 255, 255, 230), "center", "center", UI.dialog.delete_staff)
  UI.label.delete_staff_username = eui:uiCreateLabel(10, 80, 280, 30, "Username", tocolor(255, 255, 255, 255), "center", "center", UI.dialog.delete_staff)
  eui:uiSetFont(UI.label.delete_staff_username, "default-large")
  eui:uiDialogSetLeftButtonText(UI.dialog.delete_staff, "Yes")
  eui:uiDialogSetRightButtonText(UI.dialog.delete_staff, "No")
  UI.gridlist.roles_members = eui:uiCreateGridList(10, 60, 905 - 150 - 15 - 20, 575 - 10 - 120, tocolor(10, 10, 10, 0), UI.container.roles_members)
  eui:uiGridListAddColumn(UI.gridlist.roles_members, "Role", 0.4)
  eui:uiGridListAddColumn(UI.gridlist.roles_members, "Username", 0.6)
  eui:uiSetAlign(UI.gridlist.roles_members, "left", "center")
  eui:uiSetProperty(UI.gridlist.roles_members, "color_coded", true)
  eui:uiSetProperty(UI.gridlist.roles_members, "column_font_scale", 0.8)
  UI.edit.changelogs_search = eui:uiCreateEdit(905 - 150 - 15 - 310, 15, 300, 25, "", {en = "Search...", ar = "\216\168\216\173\216\171..."}, tocolor(255, 0, 0, 255), UI.container.changelogs)
  UI.gridlist.changelogs = eui:uiCreateGridList(10, 60, 905 - 150 - 15 - 20, 575 - 10 - 60 - 10, tocolor(10, 10, 10, 0), UI.container.changelogs)
  eui:uiGridListAddColumn(UI.gridlist.changelogs, "Date", 0.1)
  eui:uiGridListAddColumn(UI.gridlist.changelogs, "Time", 0.1)
  eui:uiGridListAddColumn(UI.gridlist.changelogs, "Action", 0.15)
  eui:uiGridListAddColumn(UI.gridlist.changelogs, "Username", 0.2)
  eui:uiGridListAddColumn(UI.gridlist.changelogs, "From", 0.125)
  eui:uiGridListAddColumn(UI.gridlist.changelogs, "To", 0.125)
  eui:uiGridListAddColumn(UI.gridlist.changelogs, "By", 0.2)
  eui:uiSetAlign(UI.gridlist.changelogs, "left", "center")
  eui:uiSetProperty(UI.gridlist.changelogs, "color_coded", true)
  eui:uiSetProperty(UI.gridlist.changelogs, "column_font_scale", 0.8)
  UI.gridlist.ranks = eui:uiCreateGridList(10, 60, (905 - 150 - 15 - 20) * 0.3, 575 - 10 - 120, tocolor(6, 9, 14, 235), UI.container.ranks)
  eui:uiGridListAddColumn(UI.gridlist.ranks, "Ranks", 1)
  eui:uiSetAlign(UI.gridlist.ranks, "left", "center")
  eui:uiSetProperty(UI.gridlist.ranks, "color_coded", true)
  eui:uiSetProperty(UI.gridlist.ranks, "row_height", 25)
  eui:uiSetProperty(UI.gridlist.ranks, "column_height", 35)
  eui:uiSetProperty(UI.gridlist.ranks, "column_font_scale", 0.8)
  UI.gridlist.permissions = eui:uiCreateGridList(10 + (905 - 150 - 15 - 20) * 0.3 + 5, 100, (905 - 150 - 15 - 20) * 0.7 - 5, 575 - 10 - 60 - 100 - 30, tocolor(6, 9, 14, 235), UI.container.ranks)
  eui:uiGridListAddColumn(UI.gridlist.permissions, "Permissions", 1)
  eui:uiSetAlign(UI.gridlist.permissions, "left", "center")
  eui:uiSetProperty(UI.gridlist.permissions, "color_coded", true)
  eui:uiSetProperty(UI.gridlist.permissions, "column_font_scale", 0.8)
  UI.checkbox.permissions_select_all = eui:uiCreateCheckBox(10 + (905 - 150 - 15 - 20) * 0.3 + 5, 575 - 10 - 60 - 20, 150, 25, "Select All", false, tocolor(255, 0, 0), UI.container.ranks)
  eui:uiSetFontSize(UI.checkbox.permissions_select_all, 0.8)
  for forvar9, forvar10 in ipairs(AllRights) do
    eui:uiGridListSetItemText(UI.gridlist.permissions, eui:uiGridListAddRow(UI.gridlist.permissions), 1, tostring(forvar10))
  end
  UI.label.rank_id = eui:uiCreateLabel(10 + (905 - 150 - 15 - 20) * 0.3 + 10, 65, 50, 24, "#0", tocolor(255, 0, 0, 255), "left", "center", UI.container.ranks)
  eui:uiSetFont(UI.label.rank_id, "default-large")
  UI.edit.rank_name = eui:uiCreateEdit(10 + (905 - 150 - 15 - 20) * 0.3 + 5 + 55, 65, 300, 25, "", "Rank Name", tocolor(255, 0, 0, 255), UI.container.ranks)
  eui:uiSetProperty(UI.edit.rank_name, "UnderLineVisible", "False")
  eui:uiSetFont(UI.edit.rank_name, "default-large")
  UI.rectangle.rank_color = eui:uiCreateRectangle(905 - 150 - 15 - 60, 65, 50, 25, tocolor(255, 255, 255, 255), false, false, false, false, UI.container.ranks)
  UI.button.delete_rank = eui:uiCreateButton(10, 575 - 10 - 45, 150, 35, {
    en = "Delete Rank",
    ar = "\216\173\216\176\217\129 \216\167\217\132\216\177\216\170\216\168\216\169"
  }, tocolor(6, 9, 14, 255), UI.container.ranks)
  eui:uiSetProperty(UI.button.delete_rank, "TextColor", tocolor(255, 0, 0))
  UI.button.add_rank = eui:uiCreateButton(170, 575 - 10 - 45, 150, 35, {
    en = "Add Rank",
    ar = "\216\165\216\182\216\167\217\129\216\169 \216\177\216\170\216\168\216\169"
  }, tocolor(6, 9, 14, 255), UI.container.ranks)
  UI.button.save_rank_changes = eui:uiCreateButton(905 - 150 - 15 - 160, 575 - 10 - 45, 150, 35, {
    en = "Save Changes",
    ar = "\216\173\217\129\216\184 \216\167\217\132\216\170\216\186\217\138\217\138\216\177\216\167\216\170"
  }, tocolor(6, 9, 14, 255), UI.container.ranks)
  UI.dialog.delete_rank = eui:uiCreateDialog(false, false, 300, 160, "Confirm")
  eui:uiSetVisible(UI.dialog.delete_rank, false)
  UI.label.delete_rank = eui:uiCreateLabel(10, 50, 280, 30, {
    en = "Are you sure you want to delete this rank?",
    ar = "\217\135\217\132 \216\163\217\134\216\170 \217\133\216\170\216\163\217\131\216\175 \217\133\217\134 \216\173\216\176\217\129 \217\135\216\176\217\135 \216\167\217\132\216\177\216\170\216\168\216\169\216\159"
  }, tocolor(255, 255, 255, 230), "center", "center", UI.dialog.delete_rank)
  UI.label.delete_rank_name = eui:uiCreateLabel(10, 80, 280, 30, "Rank Name", tocolor(255, 255, 255, 255), "center", "center", UI.dialog.delete_rank)
  eui:uiSetFont(UI.label.delete_rank_name, "default-large")
  eui:uiDialogSetLeftButtonText(UI.dialog.delete_rank, "Yes")
  eui:uiDialogSetRightButtonText(UI.dialog.delete_rank, "No")
  UI.gridlist.daily_staff_report = eui:uiCreateGridList(10, 60, 905 - 150 - 15 - 20, 575 - 10 - 120, tocolor(10, 10, 10, 0), UI.container.daily_staff_report)
  eui:uiGridListAddColumn(UI.gridlist.daily_staff_report, "Username", 0.25)
  eui:uiGridListAddColumn(UI.gridlist.daily_staff_report, "Login", 0.15)
  eui:uiGridListAddColumn(UI.gridlist.daily_staff_report, "Logout", 0.15)
  eui:uiGridListAddColumn(UI.gridlist.daily_staff_report, "Attendance", 0.15)
  eui:uiGridListAddColumn(UI.gridlist.daily_staff_report, "Jails", 0.1)
  eui:uiGridListAddColumn(UI.gridlist.daily_staff_report, "Bans", 0.1)
  eui:uiGridListAddColumn(UI.gridlist.daily_staff_report, "Reports", 0.1)
  eui:uiSetAlign(UI.gridlist.daily_staff_report, "left", "center")
  eui:uiSetProperty(UI.gridlist.daily_staff_report, "color_coded", true)
  eui:uiSetProperty(UI.gridlist.daily_staff_report, "column_font_scale", 0.8)
  menu = eui:uiCreateMenu(5, 65, 150, 450, tocolor(19, 22, 27, 0), UI.window.admin_panel)
  eui:uiSetProperty(menu, "selection_color", tocolor(255, 0, 0))
  eui:uiSetProperty(menu, "hovered_row_color", tocolor(9, 12, 17, 100))
  eui:uiSetProperty(menu, "selected_row_color", tocolor(3, 6, 11, 255))
  eui:uiSetProperty(menu, "row_height", 35)
end
addEventHandler("onClientUIReady", resourceRoot, UIKitReady)
addEvent("onClientUIKitReady", true)
addEventHandler("onClientUIKitReady", root, UIKitReady)
function reloadAdminPanelMenu(arg0, arg1)
  eui:uiMenuClear(menu)
  for forvar5, forvar6 in ipairs(var0) do
    if not forvar6.permission or forvar6.permission == "editmembers" and arg0 or forvar6.permission == "editranks" and arg1 then
      eui:uiMenuAddRow(menu, forvar6.title, tocolor(29, 32, 37, 0), forvar6.icon, UI.container[forvar6.id])
    end
  end
  eui:uiMenuSetSelectedRow(menu, 1)
end
addEventHandler("onClientUIChanged", root, function()
  if source == UI.edit.changelogs_search and var0.changelogs then
    if eui:uiGetText(source) ~= "" then
      eui:uiGridListClear(UI.gridlist.changelogs)
      for forvar4, forvar5 in ipairs(var0.changelogs) do
        if string.find(forvar5.cType, eui:uiGetText(source), 1, true) or string.find(forvar5.Username, eui:uiGetText(source), 1, true) or string.find(forvar5.FromR, eui:uiGetText(source), 1, true) or string.find(forvar5.ToR, eui:uiGetText(source), 1, true) or string.find(forvar5.By_, eui:uiGetText(source), 1, true) or string.find(forvar5.Date, eui:uiGetText(source), 1, true) then
          insertChangelogRow(forvar5)
        end
      end
    else
      eui:uiGridListClear(UI.gridlist.changelogs)
      for forvar4, forvar5 in ipairs(var0.changelogs) do
        insertChangelogRow(forvar5)
      end
    end
  end
end)
GUIEditor = {
  tab = {},
  label = {},
  tabpanel = {},
  edit = {},
  gridlist = {},
  window = {},
  button = {},
  combobox = {},
  staticimage = {},
  checkbox = {}
}
addEventHandler("onClientResourceStart", resourceRoot, function()
  GUIEditor.window[1] = guiCreateWindow((var0 - 722) / 2, (var1 - 498) / 2, 722, 498, "Staff Manager", false)
  guiWindowSetSizable(GUIEditor.window[1], false)
  guiSetAlpha(GUIEditor.window[1], 0.9)
  guiSetVisible(GUIEditor.window[1], false)
  GUIEditor.tabpanel[1] = guiCreateTabPanel(10, 25, 702, 429, false, GUIEditor.window[1])
  GUIEditor.tab[2] = guiCreateTab("Admins", GUIEditor.tabpanel[1])
  GUIEditor.gridlist[2] = guiCreateGridList(6, 6, 690, 393, false, GUIEditor.tab[2])
  guiGridListAddColumn(GUIEditor.gridlist[2], "Rank", 0.3)
  guiGridListAddColumn(GUIEditor.gridlist[2], "Username", 0.2)
  guiGridListAddColumn(GUIEditor.gridlist[2], "Reports count", 0.125)
  guiGridListAddColumn(GUIEditor.gridlist[2], "Feedback Rating", 0.125)
  guiGridListAddColumn(GUIEditor.gridlist[2], "Feedback count", 0.2)
  GUIEditor.tab[1] = guiCreateTab("Edit Staff Members", GUIEditor.tabpanel[1])
  GUIEditor.label[1] = guiCreateLabel(19, 20, 70, 24, "Username:", false, GUIEditor.tab[1])
  guiSetFont(GUIEditor.label[1], "default-bold-small")
  guiLabelSetVerticalAlign(GUIEditor.label[1], "center")
  GUIEditor.combobox[1] = guiCreateComboBox(93, 20, 390, 172, "", false, GUIEditor.tab[1])
  GUIEditor.label[2] = guiCreateLabel(19, 68, 667, 15, "Add Admin        -----------------------------------------------------------------------------------------------------------------", false, GUIEditor.tab[1])
  guiSetFont(GUIEditor.label[2], "default-bold-small")
  GUIEditor.button[1] = guiCreateButton(493, 19, 100, 25, "Remove admin", false, GUIEditor.tab[1])
  GUIEditor.label[3] = guiCreateLabel(59, 93, 70, 24, "Username:", false, GUIEditor.tab[1])
  guiLabelSetVerticalAlign(GUIEditor.label[3], "center")
  GUIEditor.edit[1] = guiCreateEdit(139, 95, 297, 29, "", false, GUIEditor.tab[1])
  GUIEditor.button[2] = guiCreateButton(573, 128, 109, 31, "Add admin", false, GUIEditor.tab[1])
  GUIEditor.label[4] = guiCreateLabel(59, 128, 43, 24, "Rank:", false, GUIEditor.tab[1])
  guiLabelSetVerticalAlign(GUIEditor.label[4], "center")
  GUIEditor.combobox[2] = guiCreateComboBox(112, 134, 408, 152, "", false, GUIEditor.tab[1])
  GUIEditor.gridlist[1] = guiCreateGridList(10, 201, 682, 194, false, GUIEditor.tab[1])
  GUIEditor.tab[3] = guiCreateTab("Edit Ranks", GUIEditor.tabpanel[1])
  GUIEditor.label[5] = guiCreateLabel(15, 23, 74, 15, "Rank name:", false, GUIEditor.tab[3])
  GUIEditor.combobox[3] = guiCreateComboBox(95, 19, 248, 300, "", false, GUIEditor.tab[3])
  GUIEditor.staticimage[1] = guiCreateStaticImage(348, 19, 50, 20, ":interface/rectangle.png", false, GUIEditor.tab[3])
  GUIEditor.label[6] = guiCreateLabel(15, 54, 74, 15, "Rank rights:", false, GUIEditor.tab[3])
  GUIEditor.checkbox[1] = guiCreateCheckBox(89, 54, 74, 15, "Select all", false, false, GUIEditor.tab[3])
  GUIEditor.gridlist[3] = guiCreateGridList(10, 75, 682, 240, false, GUIEditor.tab[3])
  guiGridListAddColumn(GUIEditor.gridlist[3], "Right Name", 0.9)
  for forvar3, forvar4 in ipairs(AllRights) do
    guiGridListSetItemText(GUIEditor.gridlist[3], guiGridListAddRow(GUIEditor.gridlist[3]), 1, tostring(forvar4), false, false)
  end
  GUIEditor.label[7] = guiCreateLabel(15, 329, 667, 15, "Add New Rank       ----------------------------------------------------------------------------------------------------------------------------------------------------------------", false, GUIEditor.tab[3])
  guiSetFont(GUIEditor.label[7], "default-bold-small")
  GUIEditor.label[8] = guiCreateLabel(35, 361, 80, 28, "Rank Name:", false, GUIEditor.tab[3])
  guiLabelSetVerticalAlign(GUIEditor.label[8], "center")
  GUIEditor.edit[2] = guiCreateEdit(115, 361, 200, 28, "", false, GUIEditor.tab[3])
  GUIEditor.button[3] = guiCreateButton(325, 361, 87, 28, "Add", false, GUIEditor.tab[3])
  GUIEditor.button.ChangeRankName = guiCreateButton(422, 361, 150, 28, "Change Rank Name", false, GUIEditor.tab[3])
  GUIEditor.button[4] = guiCreateButton(574, 36, 108, 29, "Delete Rank", false, GUIEditor.tab[3])
  GUIEditor.button[5] = guiCreateButton(462, 36, 108, 29, "Save Changes", false, GUIEditor.tab[3])
  GUIEditor.tab[4] = guiCreateTab("Changelogs", GUIEditor.tabpanel[1])
  GUIEditor.gridlist[4] = guiCreateGridList(10, 10, 682, 385, false, GUIEditor.tab[4])
  guiGridListAddColumn(GUIEditor.gridlist[4], "Date", 0.2)
  guiGridListAddColumn(GUIEditor.gridlist[4], "Type", 0.15)
  guiGridListAddColumn(GUIEditor.gridlist[4], "Username", 0.24)
  guiGridListAddColumn(GUIEditor.gridlist[4], "From", 0.1)
  guiGridListAddColumn(GUIEditor.gridlist[4], "To", 0.1)
  guiGridListAddColumn(GUIEditor.gridlist[4], "By", 0.1)
  GUIEditor.tab[5] = guiCreateTab("Resources", GUIEditor.tabpanel[1])
  GUIEditor.gridlist[5] = guiCreateGridList(10, 10, 682, 355, false, GUIEditor.tab[5])
  guiGridListAddColumn(GUIEditor.gridlist[5], "Resource", 0.7)
  guiGridListAddColumn(GUIEditor.gridlist[5], "Status", 0.25)
  GUIEditor.button[7] = guiCreateButton(10, 370, 100, 29, "Remove", false, GUIEditor.tab[5])
  GUIEditor.edit[3] = guiCreateEdit(130, 370, 150, 25, "", false, GUIEditor.tab[5])
  GUIEditor.button[8] = guiCreateButton(285, 370, 100, 25, "Add", false, GUIEditor.tab[5])
  GUIEditor.button[6] = guiCreateButton(10, 459, 702, 29, "Close", false, GUIEditor.window[1])
end)
addEvent("rpadmin:showPanel", true)
addEventHandler("rpadmin:showPanel", root, function(arg0, arg1, arg2, arg3)
  guiSetEnabled(GUIEditor.tab[1], arg0)
  guiSetEnabled(GUIEditor.tab[3], arg1)
  guiSetEnabled(GUIEditor.tab[5], arg2)
  eui:uiSetVisible(UI.window.admin_panel, not eui:uiGetVisible(UI.window.admin_panel))
  showCursor(eui:uiGetVisible(UI.window.admin_panel))
  eui:uiSetVisible(UI.button.delete_admin, arg0)
  eui:uiSetVisible(UI.button.add_admin, arg0)
  reloadAdminPanelMenu(arg0, arg1)
  if eui:uiGetVisible(UI.window.admin_panel) then
    refreshPanel(arg3.levels, arg3.admins, arg3.changelogs, {}, arg3.role_members, arg3.staff_report)
  end
end)
addEventHandler("onClientGUIClick", resourceRoot, function()
  if source == GUIEditor.button[2] then
    if #guiGetText(GUIEditor.edit[1]) ~= 0 and guiComboBoxGetSelected(GUIEditor.combobox[2]) ~= -1 then
      triggerServerEvent("rpadmin:addNewAdmin", localPlayer, guiGetText(GUIEditor.edit[1]), split(guiComboBoxGetItemText(GUIEditor.combobox[2], (guiComboBoxGetSelected(GUIEditor.combobox[2]))), ":")[1], split(guiComboBoxGetItemText(GUIEditor.combobox[2], (guiComboBoxGetSelected(GUIEditor.combobox[2]))), ":")[2])
    end
  elseif source == GUIEditor.button[5] then
    if guiComboBoxGetSelected(GUIEditor.combobox[3]) ~= -1 then
      for forvar7 = 0, guiGridListGetRowCount(GUIEditor.gridlist[3]) - 1 do
        if guiGridListGetItemData(GUIEditor.gridlist[3], forvar7, 1) then
          ({})[guiGridListGetItemText(GUIEditor.gridlist[3], forvar7, 1)] = guiGridListGetItemData(GUIEditor.gridlist[3], forvar7, 1)
        end
      end
      triggerServerEvent("rpadmin:saveLevelRights", localPlayer, getLevelByName[guiComboBoxGetItemText(GUIEditor.combobox[3], (guiComboBoxGetSelected(GUIEditor.combobox[3])))], {}, {
        unpack(RankColor or {
          255,
          255,
          255,
          255
        })
      })
    end
  elseif source == GUIEditor.button[4] then
    if guiComboBoxGetSelected(GUIEditor.combobox[3]) ~= -1 then
      triggerServerEvent("rpadmin:removeAdminLevel", localPlayer, getLevelByName[guiComboBoxGetItemText(GUIEditor.combobox[3], (guiComboBoxGetSelected(GUIEditor.combobox[3])))])
    end
  elseif source == GUIEditor.button[3] then
    if guiGetText(GUIEditor.edit[2]) ~= "" then
      triggerServerEvent("rpadmin:addAdminLevel", localPlayer, (guiGetText(GUIEditor.edit[2])))
      guiSetText(GUIEditor.edit[2], "")
    end
  elseif source == GUIEditor.button.ChangeRankName then
    if guiGetText(GUIEditor.edit[2]) ~= "" and guiComboBoxGetSelected(GUIEditor.combobox[3]) ~= -1 then
      triggerServerEvent("rpadmin:changeAdminLevelName", localPlayer, getLevelByName[guiComboBoxGetItemText(GUIEditor.combobox[3], (guiComboBoxGetSelected(GUIEditor.combobox[3])))], (guiGetText(GUIEditor.edit[2])))
      guiSetText(GUIEditor.edit[2], "")
    end
  elseif source == GUIEditor.button[1] then
    if guiComboBoxGetSelected(GUIEditor.combobox[1]) ~= -1 then
      triggerServerEvent("rpadmin:removeAdmin", localPlayer, (guiComboBoxGetItemText(GUIEditor.combobox[1], (guiComboBoxGetSelected(GUIEditor.combobox[1])))))
    end
  elseif source == GUIEditor.button[6] then
    guiSetVisible(GUIEditor.window[1], false)
    showCursor(false)
  elseif source == GUIEditor.staticimage[1] then
    currentColorLabel = source
    colorPicker.openSelect()
  elseif source == GUIEditor.checkbox[1] then
    for forvar4 = 0, guiGridListGetRowCount(GUIEditor.gridlist[3]) do
      guiGridListSetItemData(GUIEditor.gridlist[3], forvar4, 1, not not guiCheckBoxGetSelected(source))
      if not not guiCheckBoxGetSelected(source) then
        guiGridListSetItemColor(GUIEditor.gridlist[3], forvar4, 1, 0, 255, 0)
      else
        guiGridListSetItemColor(GUIEditor.gridlist[3], forvar4, 1, 255, 0, 0)
      end
    end
  end
end)
addEventHandler("onClientGUIDoubleClick", resourceRoot, function()
  if source == GUIEditor.gridlist[3] and guiGridListGetSelectedItem(source) ~= -1 then
    guiGridListSetItemData(source, guiGridListGetSelectedItem(source), 1, not guiGridListGetItemData(source, guiGridListGetSelectedItem(source), 1))
    if not guiGridListGetItemData(source, guiGridListGetSelectedItem(source), 1) then
      guiGridListSetItemColor(source, guiGridListGetSelectedItem(source), 1, 0, 255, 0)
    else
      guiGridListSetItemColor(source, guiGridListGetSelectedItem(source), 1, 255, 0, 0)
    end
  end
end)
addEventHandler("onClientUIDialogButtonClick", root, function(arg0)
  if source == UI.dialog.delete_staff then
    if arg0 == "left" then
      triggerServerEvent("rpadmin:removeAdmin", localPlayer, (eui:uiGetText(UI.label.delete_staff_username)))
    end
  elseif source == UI.dialog.delete_rank and arg0 == "left" then
    if rank_to_delete then
      triggerServerEvent("rpadmin:removeAdminLevel", localPlayer, rank_to_delete)
    end
    rank_to_delete = nil
  end
end)
addEvent("onClientUIClick", true)
addEventHandler("onClientUIClick", root, function()
  if source == UI.gridlist.ranks then
    if eui:uiGridListGetSelectedItem(source) ~= -1 then
      eui:uiSetText(UI.edit.rank_name, (eui:uiGridListGetItemText(source, eui:uiGridListGetSelectedItem(source), 1)))
      eui:uiSetText(UI.label.rank_id, "#" .. tostring((eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1))))
      for forvar6, forvar7 in ipairs(AllRights) do
        eui:uiGridListSetItemData(UI.gridlist.permissions, forvar6 - 1, 1, LevelRights[tostring((eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1)))][tostring(forvar7)])
        if LevelRights[tostring((eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1)))][tostring(forvar7)] then
          eui:uiGridListSetItemColor(UI.gridlist.permissions, forvar6 - 1, 1, tocolor(0, 255, 0))
        else
          eui:uiGridListSetItemColor(UI.gridlist.permissions, forvar6 - 1, 1, tocolor(255, 0, 0))
        end
      end
      currentColorLabel = UI.rectangle.rank_color
      RankColor = {
        unpack(LevelColor[tostring((eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1)))] or {})
      }
      eui:uiSetColor(UI.rectangle.rank_color, unpack(LevelColor[tostring((eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1)))] or {}))
    end
  elseif source == UI.rectangle.rank_color then
    currentColorLabel = source
    colorPicker.openSelect()
  elseif source == UI.checkbox.permissions_select_all then
    for forvar5 = 0, eui:uiGridListGetRowCount(UI.gridlist.permissions) - 1 do
      eui:uiGridListSetItemData(UI.gridlist.permissions, forvar5, 1, not not eui:uiCheckBoxGetSelected(source))
      if not not eui:uiCheckBoxGetSelected(source) then
        eui:uiGridListSetItemColor(UI.gridlist.permissions, forvar5, 1, tocolor(0, 255, 0))
      else
        eui:uiGridListSetItemColor(UI.gridlist.permissions, forvar5, 1, tocolor(255, 0, 0))
      end
    end
  elseif source == UI.button.delete_rank then
    if eui:uiGridListGetSelectedItem(UI.gridlist.ranks) ~= -1 then
      eui:uiSetVisible(UI.dialog.delete_rank, true)
      eui:uiSetText(UI.label.delete_rank_name, tostring((eui:uiGridListGetItemText(UI.gridlist.ranks, eui:uiGridListGetSelectedItem(UI.gridlist.ranks), 1))))
      rank_to_delete = eui:uiGridListGetItemData(UI.gridlist.ranks, eui:uiGridListGetSelectedItem(UI.gridlist.ranks), 1)
    end
  elseif source == UI.button.add_rank then
    if eui:uiGetText(UI.edit.rank_name) ~= "" then
      triggerServerEvent("rpadmin:addAdminLevel", localPlayer, (eui:uiGetText(UI.edit.rank_name)))
      eui:uiSetText(UI.edit.rank_name, "")
    end
  elseif source == UI.button.save_rank_changes then
    if eui:uiGridListGetSelectedItem(UI.gridlist.ranks) ~= -1 then
      for forvar9 = 0, eui:uiGridListGetRowCount(UI.gridlist.permissions) - 1 do
        if eui:uiGridListGetItemData(UI.gridlist.permissions, forvar9, 1) then
          ({})[eui:uiGridListGetItemText(UI.gridlist.permissions, forvar9, 1)] = eui:uiGridListGetItemData(UI.gridlist.permissions, forvar9, 1)
        end
      end
      triggerServerEvent("rpadmin:updateRole", localPlayer, eui:uiGridListGetItemData(UI.gridlist.ranks, eui:uiGridListGetSelectedItem(UI.gridlist.ranks), 1), nil, {}, {
        unpack(RankColor or {
          255,
          255,
          255,
          255
        })
      })
    end
  elseif source == UI.button.delete_admin then
    if eui:uiGridListGetSelectedItem(UI.gridlist.staffs) ~= -1 then
      eui:uiSetVisible(UI.dialog.delete_staff, true)
      eui:uiSetText(UI.label.delete_staff_username, (eui:uiGridListGetItemText(UI.gridlist.staffs, eui:uiGridListGetSelectedItem(UI.gridlist.staffs), 2)))
    end
  elseif source == UI.button.add_admin then
    eui:uiSetVisible(UI.window.add_staff, true)
    eui:uiBringToFront(UI.window.add_staff)
  elseif source == UI.button.add_staff then
    if #eui:uiGetText(UI.edit.add_staff_account) ~= 0 and eui:uiGridListGetSelectedItem(UI.gridlist.add_staff_ranks) ~= -1 then
      triggerServerEvent("rpadmin:addNewAdmin", localPlayer, eui:uiGetText(UI.edit.add_staff_account), eui:uiGridListGetItemData(UI.gridlist.add_staff_ranks, eui:uiGridListGetSelectedItem(UI.gridlist.add_staff_ranks), 1), (eui:uiGridListGetItemText(UI.gridlist.add_staff_ranks, eui:uiGridListGetSelectedItem(UI.gridlist.add_staff_ranks), 1)))
      eui:uiSetVisible(UI.window.add_staff, false)
      eui:uiSetText(UI.edit.add_staff_account, "")
    end
  elseif source == UI.button.cancel_add_staff then
    eui:uiSetVisible(UI.window.add_staff, false)
  elseif source == UI.button.close_panel then
    eui:uiSetVisible(UI.window.admin_panel, false)
    eui:uiSetVisible(UI.window.add_staff, false)
    showCursor(false)
  end
end)
addEventHandler("onClientUIDoubleClick", root, function()
  if source == UI.gridlist.permissions and eui:uiGridListGetSelectedItem(source) ~= -1 then
    eui:uiGridListSetItemData(source, eui:uiGridListGetSelectedItem(source), 1, not eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1))
    if not eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1) then
      eui:uiGridListSetItemColor(source, eui:uiGridListGetSelectedItem(source), 1, tocolor(0, 255, 0))
    else
      eui:uiGridListSetItemColor(source, eui:uiGridListGetSelectedItem(source), 1, tocolor(255, 0, 0))
    end
  end
end)
addEventHandler("onClientGUIComboBoxAccepted", resourceRoot, function()
  if source == GUIEditor.combobox[3] then
    for forvar4, forvar5 in ipairs(AllRights) do
      if LevelRights[getLevelByName[tostring((guiComboBoxGetItemText(source, (guiComboBoxGetSelected(source)))))]] then
        state = LevelRights[getLevelByName[tostring((guiComboBoxGetItemText(source, (guiComboBoxGetSelected(source)))))]][tostring(forvar5)]
      end
      guiGridListSetItemData(GUIEditor.gridlist[3], forvar4 - 1, 1, state)
      if state then
        guiGridListSetItemColor(GUIEditor.gridlist[3], forvar4 - 1, 1, 0, 255, 0)
      else
        guiGridListSetItemColor(GUIEditor.gridlist[3], forvar4 - 1, 1, 255, 0, 0)
      end
    end
    currentColorLabel = GUIEditor.staticimage[1]
    RankColor = {
      unpack(LevelColor[getLevelByName[tostring((guiComboBoxGetItemText(source, (guiComboBoxGetSelected(source)))))]] or {})
    }
    guiSetProperty(GUIEditor.staticimage[1], "ImageColours", "tl:FF" .. colorPicker.RGBToHex(unpack(LevelColor[getLevelByName[tostring((guiComboBoxGetItemText(source, (guiComboBoxGetSelected(source)))))]] or {})):gsub("#", ""):sub(1, 6) .. " tr:FF" .. colorPicker.RGBToHex(unpack(LevelColor[getLevelByName[tostring((guiComboBoxGetItemText(source, (guiComboBoxGetSelected(source)))))]] or {})):gsub("#", ""):sub(1, 6) .. " bl:FF" .. colorPicker.RGBToHex(unpack(LevelColor[getLevelByName[tostring((guiComboBoxGetItemText(source, (guiComboBoxGetSelected(source)))))]] or {})):gsub("#", ""):sub(1, 6) .. " br:FF" .. colorPicker.RGBToHex(unpack(LevelColor[getLevelByName[tostring((guiComboBoxGetItemText(source, (guiComboBoxGetSelected(source)))))]] or {})):gsub("#", ""):sub(1, 6) .. "")
  end
end)
function msToTimeStr(arg0)
  arg0 = tonumber(arg0)
  arg0 = math.floor(arg0)
  if not arg0 then
    return ""
  end
  if arg0 < 0 then
    return "00", "00", "00"
  end
  if #tostring(math.fmod(arg0, 60)) == 1 then
  end
  if #tostring(math.fmod(math.floor(arg0 / 60), 60)) == 1 then
  end
  if #tostring(math.floor(arg0 / 3600)) == 1 then
  end
  return ("0" .. tostring(math.floor(arg0 / 3600))) .. ":" .. ("0" .. tostring(math.fmod(math.floor(arg0 / 60), 60))) .. ":" .. "0" .. tostring(math.fmod(arg0, 60))
end
function refreshPanel(arg0, arg1, arg2, arg3, arg4, arg5)
  var0.changelogs = arg2
  if arg5 then
    eui:uiGridListClear(UI.gridlist.daily_staff_report)
    for forvar9, forvar10 in ipairs(arg5) do
      eui:uiGridListSetItemText(UI.gridlist.daily_staff_report, eui:uiGridListAddRow(UI.gridlist.daily_staff_report), 1, tostring(forvar10.username))
      eui:uiGridListSetItemText(UI.gridlist.daily_staff_report, eui:uiGridListAddRow(UI.gridlist.daily_staff_report), 2, tostring(forvar10.login_time and split(forvar10.login_time, " ")[2] or "-"))
      eui:uiGridListSetItemText(UI.gridlist.daily_staff_report, eui:uiGridListAddRow(UI.gridlist.daily_staff_report), 3, tostring(forvar10.logout_time and split(forvar10.logout_time, " ")[2] or "-"))
      eui:uiGridListSetItemText(UI.gridlist.daily_staff_report, eui:uiGridListAddRow(UI.gridlist.daily_staff_report), 4, tostring(msToTimeStr(forvar10.total_attendance_time)))
      eui:uiGridListSetItemText(UI.gridlist.daily_staff_report, eui:uiGridListAddRow(UI.gridlist.daily_staff_report), 5, tostring(forvar10.jails))
      eui:uiGridListSetItemText(UI.gridlist.daily_staff_report, eui:uiGridListAddRow(UI.gridlist.daily_staff_report), 6, tostring(forvar10.bans))
      eui:uiGridListSetItemText(UI.gridlist.daily_staff_report, eui:uiGridListAddRow(UI.gridlist.daily_staff_report), 7, tostring(forvar10.reports))
      if forvar10.jails > 0 then
        eui:uiGridListSetItemColor(UI.gridlist.daily_staff_report, eui:uiGridListAddRow(UI.gridlist.daily_staff_report), 5, tocolor(0, 255, 0))
      end
      if forvar10.bans > 0 then
        eui:uiGridListSetItemColor(UI.gridlist.daily_staff_report, eui:uiGridListAddRow(UI.gridlist.daily_staff_report), 6, tocolor(0, 255, 0))
      end
      if forvar10.reports > 0 then
        eui:uiGridListSetItemColor(UI.gridlist.daily_staff_report, eui:uiGridListAddRow(UI.gridlist.daily_staff_report), 7, tocolor(0, 255, 0))
      end
    end
  end
  LevelNames = {}
  LevelRights = {}
  LevelColor = {}
  getLevelByName = {}
  guiGridListClear(GUIEditor.gridlist[1])
  guiComboBoxClear(GUIEditor.combobox[2])
  guiComboBoxClear(GUIEditor.combobox[3])
  for forvar9, forvar10 in ipairs(arg0) do
    guiComboBoxAddItem(GUIEditor.combobox[2], tostring(forvar10.ID) .. ": " .. tostring(forvar10.LevelName))
    LevelNames[tostring(forvar10.ID)] = tostring(forvar10.LevelName)
    LevelRights[tostring(forvar10.ID)] = fromJSON(forvar10.Rights)
    LevelColor[tostring(forvar10.ID)] = fromJSON(forvar10.Color)
    guiComboBoxAddItem(GUIEditor.combobox[3], tostring(forvar10.LevelName))
    getLevelByName[tostring(forvar10.LevelName)] = tostring(forvar10.ID)
  end
  guiGridListClear(GUIEditor.gridlist[2])
  guiComboBoxClear(GUIEditor.combobox[1])
  table.sort(arg1, function(arg0, arg1)
    return tonumber(arg0.AdminID) < tonumber(arg1.AdminID) and tonumber(arg0.FeedbackRating) / math.max(tonumber(arg0.FeedbackCount), 1) > tonumber(arg1.FeedbackRating) / math.max(tonumber(arg1.FeedbackCount), 1)
  end)
  table.sort(arg1, function(arg0, arg1)
    return tonumber(arg0.AdminID) < tonumber(arg1.AdminID)
  end)
  for forvar9, forvar10 in ipairs(arg1) do
    guiGridListSetItemText(GUIEditor.gridlist[2], guiGridListAddRow(GUIEditor.gridlist[2]), 1, tostring(LevelNames[tostring(forvar10.AdminID)] or "N/A"), false, false)
    guiGridListSetItemText(GUIEditor.gridlist[2], guiGridListAddRow(GUIEditor.gridlist[2]), 2, tostring(forvar10.Account), false, false)
    guiGridListSetItemText(GUIEditor.gridlist[2], guiGridListAddRow(GUIEditor.gridlist[2]), 3, tostring(forvar10.ReportsCount or 0), false, false)
    if 0 < tonumber(forvar10.FeedbackCount) then
    end
    guiGridListSetItemText(GUIEditor.gridlist[2], guiGridListAddRow(GUIEditor.gridlist[2]), 4, string.format("%0.3f", tostring(tonumber(forvar10.FeedbackRating) / tonumber(forvar10.FeedbackCount))), false, false)
    guiGridListSetItemText(GUIEditor.gridlist[2], guiGridListAddRow(GUIEditor.gridlist[2]), 5, tostring(forvar10.FeedbackCount or 0), false, false)
    guiComboBoxAddItem(GUIEditor.combobox[1], tostring(forvar10.Account))
    guiGridListSetItemColor(GUIEditor.gridlist[2], guiGridListAddRow(GUIEditor.gridlist[2]), 1, unpack(LevelColor[tostring(forvar10.AdminID)] or {
      255,
      255,
      255
    }))
    guiGridListSetItemColor(GUIEditor.gridlist[2], guiGridListAddRow(GUIEditor.gridlist[2]), 2, unpack(LevelColor[tostring(forvar10.AdminID)] or {
      255,
      255,
      255
    }))
    guiGridListSetItemColor(GUIEditor.gridlist[2], guiGridListAddRow(GUIEditor.gridlist[2]), 3, unpack(LevelColor[tostring(forvar10.AdminID)] or {
      255,
      255,
      255
    }))
    guiGridListSetItemColor(GUIEditor.gridlist[2], guiGridListAddRow(GUIEditor.gridlist[2]), 4, unpack(LevelColor[tostring(forvar10.AdminID)] or {
      255,
      255,
      255
    }))
    guiGridListSetItemColor(GUIEditor.gridlist[2], guiGridListAddRow(GUIEditor.gridlist[2]), 5, unpack(LevelColor[tostring(forvar10.AdminID)] or {
      255,
      255,
      255
    }))
  end
  guiGridListSetItemText(GUIEditor.gridlist[2], guiGridListAddRow(GUIEditor.gridlist[2]), 1, "Role Members", true, false)
  for forvar9, forvar10 in ipairs(arg4) do
    guiGridListSetItemText(GUIEditor.gridlist[2], guiGridListAddRow(GUIEditor.gridlist[2]), 1, tostring(LevelNames[tostring(forvar10.RoleID)]) .. " (#" .. tostring(forvar10.RoleID) .. ")", false, false)
    guiGridListSetItemText(GUIEditor.gridlist[2], guiGridListAddRow(GUIEditor.gridlist[2]), 2, tostring(forvar10.Account), false, false)
  end
  eui:uiGridListClear(UI.gridlist.staffs)
  for forvar9, forvar10 in ipairs(arg1) do
    eui:uiGridListSetItemText(UI.gridlist.staffs, eui:uiGridListAddRow(UI.gridlist.staffs), 1, tostring(LevelNames[tostring(forvar10.AdminID)] or "N/A"))
    eui:uiGridListSetItemText(UI.gridlist.staffs, eui:uiGridListAddRow(UI.gridlist.staffs), 2, tostring(forvar10.Account))
    eui:uiGridListSetItemText(UI.gridlist.staffs, eui:uiGridListAddRow(UI.gridlist.staffs), 3, tostring(forvar10.ReportsCount or 0))
    if 0 < tonumber(forvar10.FeedbackCount) then
    end
    eui:uiGridListSetItemText(UI.gridlist.staffs, eui:uiGridListAddRow(UI.gridlist.staffs), 4, string.format("%0.3f", tostring(tonumber(forvar10.FeedbackRating) / tonumber(forvar10.FeedbackCount))))
    eui:uiGridListSetItemText(UI.gridlist.staffs, eui:uiGridListAddRow(UI.gridlist.staffs), 5, tostring(forvar10.FeedbackCount or 0))
    guiComboBoxAddItem(GUIEditor.combobox[1], tostring(forvar10.Account))
    eui:uiGridListSetItemColor(UI.gridlist.staffs, eui:uiGridListAddRow(UI.gridlist.staffs), 1, (tocolor(unpack(LevelColor[tostring(forvar10.AdminID)] or {
      255,
      255,
      255
    }))))
    eui:uiGridListSetItemColor(UI.gridlist.staffs, eui:uiGridListAddRow(UI.gridlist.staffs), 2, (tocolor(unpack(LevelColor[tostring(forvar10.AdminID)] or {
      255,
      255,
      255
    }))))
    eui:uiGridListSetItemColor(UI.gridlist.staffs, eui:uiGridListAddRow(UI.gridlist.staffs), 3, (tocolor(unpack(LevelColor[tostring(forvar10.AdminID)] or {
      255,
      255,
      255
    }))))
    eui:uiGridListSetItemColor(UI.gridlist.staffs, eui:uiGridListAddRow(UI.gridlist.staffs), 4, (tocolor(unpack(LevelColor[tostring(forvar10.AdminID)] or {
      255,
      255,
      255
    }))))
    eui:uiGridListSetItemColor(UI.gridlist.staffs, eui:uiGridListAddRow(UI.gridlist.staffs), 5, (tocolor(unpack(LevelColor[tostring(forvar10.AdminID)] or {
      255,
      255,
      255
    }))))
  end
  eui:uiGridListClear(UI.gridlist.roles_members)
  for forvar9, forvar10 in ipairs(arg4) do
    eui:uiGridListSetItemText(UI.gridlist.roles_members, eui:uiGridListAddRow(UI.gridlist.roles_members), 1, tostring(LevelNames[tostring(forvar10.RoleID)]) .. " (#" .. tostring(forvar10.RoleID) .. ")")
    eui:uiGridListSetItemText(UI.gridlist.roles_members, eui:uiGridListAddRow(UI.gridlist.roles_members), 2, tostring(forvar10.Account))
  end
  eui:uiGridListClear(UI.gridlist.changelogs)
  for forvar9, forvar10 in ipairs(arg2) do
    insertChangelogRow(forvar10)
  end
  eui:uiGridListClear(UI.gridlist.ranks)
  eui:uiGridListClear(UI.gridlist.add_staff_ranks)
  for forvar9, forvar10 in ipairs(arg0) do
    eui:uiGridListSetItemText(UI.gridlist.ranks, eui:uiGridListAddRow(UI.gridlist.ranks), 1, tostring(forvar10.LevelName))
    eui:uiGridListSetItemData(UI.gridlist.ranks, eui:uiGridListAddRow(UI.gridlist.ranks), 1, forvar10.ID)
    eui:uiGridListSetItemColor(UI.gridlist.ranks, eui:uiGridListAddRow(UI.gridlist.ranks), 1, tocolor(fromJSON(forvar10.Color)[1], fromJSON(forvar10.Color)[2], fromJSON(forvar10.Color)[3]))
    LevelNames[tostring(forvar10.ID)] = tostring(forvar10.LevelName)
    LevelRights[tostring(forvar10.ID)] = fromJSON(forvar10.Rights)
    LevelColor[tostring(forvar10.ID)] = fromJSON(forvar10.Color)
    getLevelByName[tostring(forvar10.LevelName)] = tostring(forvar10.ID)
    eui:uiGridListSetItemText(UI.gridlist.add_staff_ranks, eui:uiGridListAddRow(UI.gridlist.add_staff_ranks), 1, tostring(forvar10.LevelName))
    eui:uiGridListSetItemData(UI.gridlist.add_staff_ranks, eui:uiGridListAddRow(UI.gridlist.add_staff_ranks), 1, forvar10.ID)
    eui:uiGridListSetItemColor(UI.gridlist.add_staff_ranks, eui:uiGridListAddRow(UI.gridlist.add_staff_ranks), 1, tocolor(fromJSON(forvar10.Color)[1], fromJSON(forvar10.Color)[2], fromJSON(forvar10.Color)[3]))
  end
  guiGridListClear(GUIEditor.gridlist[4])
  for forvar9, forvar10 in ipairs(arg2) do
    guiGridListSetItemText(GUIEditor.gridlist[4], guiGridListAddRow(GUIEditor.gridlist[4]), 1, tostring(forvar10.Date), false, false)
    guiGridListSetItemText(GUIEditor.gridlist[4], guiGridListAddRow(GUIEditor.gridlist[4]), 2, tostring(forvar10.cType), false, false)
    guiGridListSetItemText(GUIEditor.gridlist[4], guiGridListAddRow(GUIEditor.gridlist[4]), 3, tostring(forvar10.Username), false, false)
    guiGridListSetItemText(GUIEditor.gridlist[4], guiGridListAddRow(GUIEditor.gridlist[4]), 4, tostring(forvar10.FromR), false, false)
    guiGridListSetItemText(GUIEditor.gridlist[4], guiGridListAddRow(GUIEditor.gridlist[4]), 5, tostring(forvar10.ToR), false, false)
    guiGridListSetItemText(GUIEditor.gridlist[4], guiGridListAddRow(GUIEditor.gridlist[4]), 6, tostring(forvar10.By_), false, false)
    if forvar10.cType == "Promotion" then
      guiGridListSetItemColor(GUIEditor.gridlist[4], guiGridListAddRow(GUIEditor.gridlist[4]), 1, 0, 255, 0)
      guiGridListSetItemColor(GUIEditor.gridlist[4], guiGridListAddRow(GUIEditor.gridlist[4]), 2, 0, 255, 0)
      guiGridListSetItemColor(GUIEditor.gridlist[4], guiGridListAddRow(GUIEditor.gridlist[4]), 3, 0, 255, 0)
      guiGridListSetItemColor(GUIEditor.gridlist[4], guiGridListAddRow(GUIEditor.gridlist[4]), 4, 0, 255, 0)
      guiGridListSetItemColor(GUIEditor.gridlist[4], guiGridListAddRow(GUIEditor.gridlist[4]), 5, 0, 255, 0)
      guiGridListSetItemColor(GUIEditor.gridlist[4], guiGridListAddRow(GUIEditor.gridlist[4]), 6, 0, 255, 0)
    elseif forvar10.cType == "Demotion" then
      guiGridListSetItemColor(GUIEditor.gridlist[4], guiGridListAddRow(GUIEditor.gridlist[4]), 1, 255, 0, 0)
      guiGridListSetItemColor(GUIEditor.gridlist[4], guiGridListAddRow(GUIEditor.gridlist[4]), 2, 255, 0, 0)
      guiGridListSetItemColor(GUIEditor.gridlist[4], guiGridListAddRow(GUIEditor.gridlist[4]), 3, 255, 0, 0)
      guiGridListSetItemColor(GUIEditor.gridlist[4], guiGridListAddRow(GUIEditor.gridlist[4]), 4, 255, 0, 0)
      guiGridListSetItemColor(GUIEditor.gridlist[4], guiGridListAddRow(GUIEditor.gridlist[4]), 5, 255, 0, 0)
      guiGridListSetItemColor(GUIEditor.gridlist[4], guiGridListAddRow(GUIEditor.gridlist[4]), 6, 255, 0, 0)
    end
  end
  guiGridListClear(GUIEditor.gridlist[5])
  for forvar9, forvar10 in ipairs(arg3) do
    guiGridListSetItemText(GUIEditor.gridlist[5], guiGridListAddRow(GUIEditor.gridlist[5]), 1, tostring(forvar10.ResourceName), false, false)
    guiGridListSetItemText(GUIEditor.gridlist[5], guiGridListAddRow(GUIEditor.gridlist[5]), 2, tostring(forvar10.State), false, false)
  end
  guiCheckBoxSetSelected(GUIEditor.checkbox[1], false)
  eui:uiCheckBoxSetSelected(UI.checkbox.permissions_select_all, false)
end
addEvent("rpadmin:sendSQLInformations", true)
addEventHandler("rpadmin:sendSQLInformations", root, refreshPanel)
function insertChangelogRow(arg0)
  eui:uiGridListSetItemText(UI.gridlist.changelogs, eui:uiGridListAddRow(UI.gridlist.changelogs), 1, tostring(split(arg0.Date, " ")[1]))
  eui:uiGridListSetItemText(UI.gridlist.changelogs, eui:uiGridListAddRow(UI.gridlist.changelogs), 2, tostring(split(arg0.Date, " ")[2]))
  eui:uiGridListSetItemText(UI.gridlist.changelogs, eui:uiGridListAddRow(UI.gridlist.changelogs), 3, tostring(arg0.cType))
  eui:uiGridListSetItemText(UI.gridlist.changelogs, eui:uiGridListAddRow(UI.gridlist.changelogs), 4, tostring(arg0.Username))
  eui:uiGridListSetItemText(UI.gridlist.changelogs, eui:uiGridListAddRow(UI.gridlist.changelogs), 5, tostring(arg0.FromR))
  eui:uiGridListSetItemText(UI.gridlist.changelogs, eui:uiGridListAddRow(UI.gridlist.changelogs), 6, tostring(arg0.ToR))
  eui:uiGridListSetItemText(UI.gridlist.changelogs, eui:uiGridListAddRow(UI.gridlist.changelogs), 7, tostring(arg0.By_))
  if arg0.cType == "Promotion" then
    eui:uiGridListSetItemColor(UI.gridlist.changelogs, eui:uiGridListAddRow(UI.gridlist.changelogs), 1, tocolor(0, 255, 0))
    eui:uiGridListSetItemColor(UI.gridlist.changelogs, eui:uiGridListAddRow(UI.gridlist.changelogs), 2, tocolor(0, 255, 0))
    eui:uiGridListSetItemColor(UI.gridlist.changelogs, eui:uiGridListAddRow(UI.gridlist.changelogs), 3, tocolor(0, 255, 0))
    eui:uiGridListSetItemColor(UI.gridlist.changelogs, eui:uiGridListAddRow(UI.gridlist.changelogs), 4, tocolor(0, 255, 0))
    eui:uiGridListSetItemColor(UI.gridlist.changelogs, eui:uiGridListAddRow(UI.gridlist.changelogs), 5, tocolor(0, 255, 0))
    eui:uiGridListSetItemColor(UI.gridlist.changelogs, eui:uiGridListAddRow(UI.gridlist.changelogs), 6, tocolor(0, 255, 0))
    eui:uiGridListSetItemColor(UI.gridlist.changelogs, eui:uiGridListAddRow(UI.gridlist.changelogs), 7, tocolor(0, 255, 0))
  elseif arg0.cType == "Demotion" then
    eui:uiGridListSetItemColor(UI.gridlist.changelogs, eui:uiGridListAddRow(UI.gridlist.changelogs), 1, tocolor(255, 0, 0))
    eui:uiGridListSetItemColor(UI.gridlist.changelogs, eui:uiGridListAddRow(UI.gridlist.changelogs), 2, tocolor(255, 0, 0))
    eui:uiGridListSetItemColor(UI.gridlist.changelogs, eui:uiGridListAddRow(UI.gridlist.changelogs), 3, tocolor(255, 0, 0))
    eui:uiGridListSetItemColor(UI.gridlist.changelogs, eui:uiGridListAddRow(UI.gridlist.changelogs), 4, tocolor(255, 0, 0))
    eui:uiGridListSetItemColor(UI.gridlist.changelogs, eui:uiGridListAddRow(UI.gridlist.changelogs), 5, tocolor(255, 0, 0))
    eui:uiGridListSetItemColor(UI.gridlist.changelogs, eui:uiGridListAddRow(UI.gridlist.changelogs), 6, tocolor(255, 0, 0))
    eui:uiGridListSetItemColor(UI.gridlist.changelogs, eui:uiGridListAddRow(UI.gridlist.changelogs), 7, tocolor(255, 0, 0))
  end
end
PlacesList = {
  gridlist = {},
  window = {},
  button = {}
}
addEventHandler("onClientResourceStart", resourceRoot, function()
  PlacesList.window[1] = guiCreateWindow((guiGetScreenSize() - 712) / 2, (guiGetScreenSize() - 490) / 2, 712, 490, "Places", false)
  guiWindowSetSizable(PlacesList.window[1], false)
  guiSetVisible(PlacesList.window[1], false)
  PlacesList.gridlist[1] = guiCreateGridList(10, 26, 692, 415, false, PlacesList.window[1])
  guiGridListAddColumn(PlacesList.gridlist[1], "Name", 0.2)
  guiGridListAddColumn(PlacesList.gridlist[1], "Interior", 0.05)
  guiGridListAddColumn(PlacesList.gridlist[1], "Dimension", 0.15)
  guiGridListAddColumn(PlacesList.gridlist[1], "Position", 0.5)
  PlacesList.button[1] = guiCreateButton(593, 447, 109, 33, "Close", false, PlacesList.window[1])
end)
addEvent("places:showlist", true)
addEventHandler("places:showlist", root, function(arg0)
  guiSetVisible(PlacesList.window[1], true)
  showCursor(true)
  guiGridListClear(PlacesList.gridlist[1])
  for forvar4, forvar5 in ipairs(arg0) do
    guiGridListSetItemText(PlacesList.gridlist[1], guiGridListAddRow(PlacesList.gridlist[1]), 1, tostring(forvar5.PlaceName), false, false)
    guiGridListSetItemText(PlacesList.gridlist[1], guiGridListAddRow(PlacesList.gridlist[1]), 2, tostring(forvar5.interior), false, false)
    guiGridListSetItemText(PlacesList.gridlist[1], guiGridListAddRow(PlacesList.gridlist[1]), 3, tostring(forvar5.dim), false, false)
    guiGridListSetItemText(PlacesList.gridlist[1], guiGridListAddRow(PlacesList.gridlist[1]), 4, forvar5.x .. ", " .. forvar5.y .. ", " .. forvar5.z, false, false)
  end
end)
addEventHandler("onClientGUIClick", resourceRoot, function()
  if source == PlacesList.button[1] then
    guiSetVisible(PlacesList.window[1], false)
    showCursor(false)
  end
end)
aSpectator = {
  Offset = 5,
  AngleX = 0,
  AngleZ = 30,
  Spectating = nil
}
addEvent("admin:recon", true)
addEventHandler("admin:recon", localPlayer, function(arg0)
  if isElement(arg0) then
    setCameraTarget(arg0)
    aSpectator.Spectating = arg0
    var0, var1 = getElementInterior(localPlayer), getElementDimension(localPlayer)
    setCameraInterior(getElementInterior(arg0))
    setElementInterior(localPlayer, getElementInterior(arg0))
    setElementDimension(localPlayer, getElementDimension(arg0))
    setElementFrozen(localPlayer, true)
    addEventHandler("onClientPlayerInteriorChange", arg0, aSpectator.interiorChange)
  else
    setCameraTarget(localPlayer)
    setElementInterior(localPlayer, var0)
    setElementDimension(localPlayer, var1)
    setElementFrozen(localPlayer, false)
    removeEventHandler("onClientCursorMove", root, aSpectator.CursorMove)
    removeEventHandler("onClientPreRender", root, aSpectator.Render)
    removeEventHandler("onClientPlayerInteriorChange", aSpectator.Spectating, aSpectator.interiorChange)
    aSpectator.Spectating = false
  end
end)
addEvent("onClientPlayerInteriorChange", true)
function aSpectator.interiorChange(arg0, arg1)
  setCameraInterior(arg0)
  setElementInterior(localPlayer, arg0)
  setElementDimension(localPlayer, arg1)
end
function aSpectator.CursorMove(arg0, arg1, arg2, arg3)
  if not isCursorShowing() then
    aSpectator.AngleX = (aSpectator.AngleX + (arg2 - guiGetScreenSize() / 2) / 10) % 360
    aSpectator.AngleZ = (aSpectator.AngleZ + (arg3 - guiGetScreenSize() / 2) / 10) % 360
    if aSpectator.AngleZ > 180 then
      if aSpectator.AngleZ < 315 then
        aSpectator.AngleZ = 315
      end
    elseif aSpectator.AngleZ > 45 then
      aSpectator.AngleZ = 45
    end
  end
end
function aSpectator.Render()
  if not isElement(aSpectator.Spectating) then
    return
  end
  setCameraMatrix(getElementPosition(aSpectator.Spectating) - math.sin(math.rad(aSpectator.AngleX)) * aSpectator.Offset, getElementPosition(aSpectator.Spectating) - math.cos(math.rad(aSpectator.AngleX)) * aSpectator.Offset, getElementPosition(aSpectator.Spectating) + math.tan(math.rad(aSpectator.AngleZ)) * aSpectator.Offset, getElementPosition(aSpectator.Spectating))
end
function UIKitReady()
  eui = exports.UIKit
  var0.window.History = eui:uiCreateWindow(false, false, 740, 490, "Account History / \216\179\216\172\217\132 \216\167\217\132\216\173\216\179\216\167\216\168")
  eui:uiSetVisible(var0.window.History, false)
  eui:uiWindowSetMovable(var0.window.History, false)
  var0.gridlist[1] = eui:uiCreateGridList(5, 30, 730, 420, tocolor(0, 0, 0, 0), var0.window.History)
  eui:uiGridListAddColumn(var0.gridlist[1], "#", 0.07)
  eui:uiGridListAddColumn(var0.gridlist[1], "Action", 0.15)
  eui:uiGridListAddColumn(var0.gridlist[1], "Character", 0.15)
  eui:uiGridListAddColumn(var0.gridlist[1], "Reason", 0.3)
  eui:uiGridListAddColumn(var0.gridlist[1], "By", 0.15)
  eui:uiGridListAddColumn(var0.gridlist[1], "Date", 0.18)
  eui:uiSetAlign(var0.gridlist[1], "left", "center")
  var0.button.CloseHistory = eui:uiCreateButton(5, 455, 730, 30, {en = "Close", ar = "\216\165\216\186\217\132\216\167\217\130"}, _, var0.window.History)
  eui:uiSetVisible(var0.button.CloseHistory, false)
  var0.window[1] = eui:uiCreateWindow(eui:uiGetReferenceScreenSize() - 210 - 10, eui:uiGetReferenceScreenSize() - 140 - 10, 210, 110, "Admin Evaluation")
  eui:uiWindowSetMovable(var0.window[1], false)
  eui:uiSetVisible(var0.window[1], false)
  var0.label[1] = eui:uiCreateLabel(5, 5, 200, 15, "", tocolor(255, 255, 255), var0.window[1])
  eui:uiSetAlign(var0.label[1], "center", "center")
  var0.image[1] = eui:uiCreateImage(5, 25, 40, 35, "star.png", var0.window[1])
  var0.image[2] = eui:uiCreateImage(45, 25, 40, 35, "star.png", var0.window[1])
  var0.image[3] = eui:uiCreateImage(85, 25, 40, 35, "star.png", var0.window[1])
  var0.image[4] = eui:uiCreateImage(125, 25, 40, 35, "star.png", var0.window[1])
  var0.image[5] = eui:uiCreateImage(165, 25, 40, 35, "star.png", var0.window[1])
  var1[var0.image[1]] = 1
  var1[var0.image[2]] = 2
  var1[var0.image[3]] = 3
  var1[var0.image[4]] = 4
  var1[var0.image[5]] = 5
  var0.button[1] = eui:uiCreateButton(5, 75, 97.5, 30, "OK", tocolor(0, 0, 0), var0.window[1])
  var0.button[2] = eui:uiCreateButton(107.5, 75, 97.5, 30, "Cancel", tocolor(0, 0, 0), var0.window[1])
end
addEventHandler("onClientUIReady", resourceRoot, UIKitReady)
addEventHandler("onClientUIKitReady", root, UIKitReady)
addEventHandler("onClientUIClick", root, function()
  if source == var0.button[1] then
    eui:uiSetVisible(var0.window[1], false)
    showCursor(false)
    var1 = false
    triggerServerEvent("admin:sendFeedback", localPlayer, var2, var3)
  elseif var4[source] then
    var3 = var4[source]
    for forvar3 = 1, var4[source] do
      eui:uiSetColor(var0.image[forvar3], 255, 230, 0, 255)
    end
    for forvar3 = var4[source] + 1, 5 do
      eui:uiSetColor(var0.image[forvar3], 255, 255, 255, 255)
    end
    var1 = _FOR_
  elseif source == var0.button[2] then
    eui:uiSetVisible(var0.window[1], false)
    showCursor(false)
    var1 = false
  elseif source == var0.button.HideStaff then
    eui:uiSetVisible(var0.window.Staff, false)
    showCursor(false)
  end
end)
addEventHandler("onClientUIMouseEnter", root, function()
  if var0 then
    return
  end
  if var1[source] then
    var2 = var1[source]
    for forvar3 = 1, var1[source] do
      eui:uiSetColor(var3.image[forvar3], 255, 55, 95, 255)
    end
    for forvar3 = var1[source] + 1, 5 do
      eui:uiSetColor(var3.image[forvar3], 255, 255, 255, 255)
    end
  end
end)
addEvent("admin:feedback", true)
addEventHandler("admin:feedback", root, function(arg0, arg1)
  eui:uiSetVisible(var0.window[1], true)
  var1 = false
  var2 = arg1
  var3 = 0
  eui:uiSetText(var0.label[1], tostring(arg0))
end)
addEventHandler("onClientUIMouseLeave", root, function()
  if var0 then
    return
  end
  if var1[source] then
    for forvar3 = 1, 5 do
      eui:uiSetColor(var2.image[forvar3], 255, 255, 255, 255)
    end
  end
end)
addEventHandler("onClientUIClick", root, function()
  if source == var0.button.CloseHistory then
    eui:uiSetVisible(var0.window.History, false)
    showCursor(false)
  end
end)
function closeHistory()
  eui:uiSetVisible(var0.window.History, false)
end
addEvent("admin:openPlayerHistory", true)
addEventHandler("admin:openPlayerHistory", root, function(arg0)
  eui:uiSetVisible(var0.window.History, true)
  eui:uiSetVisible(var0.button.CloseHistory, true)
  showCursor(true)
  triggerEvent("admin:sendPlayerHistory", localPlayer, arg0)
end)
function openHistory(arg0)
  eui:uiSetVisible(var0.window.History, true)
  eui:uiSetVisible(var0.button.CloseHistory, false)
  triggerServerEvent("admin:getPlayerHistory", localPlayer, arg0)
end
addEvent("admin:sendPlayerHistory", true)
addEventHandler("admin:sendPlayerHistory", root, function(arg0)
  eui:uiGridListClear(var0.gridlist[1])
  for forvar4, forvar5 in ipairs(arg0) do
    eui:uiGridListSetItemText(var0.gridlist[1], eui:uiGridListAddRow(var0.gridlist[1]), 1, tostring(forvar5.ID))
    eui:uiGridListSetItemText(var0.gridlist[1], eui:uiGridListAddRow(var0.gridlist[1]), 2, tostring(forvar5.Action))
    eui:uiGridListSetItemText(var0.gridlist[1], eui:uiGridListAddRow(var0.gridlist[1]), 3, tostring(forvar5.CharacterName))
    eui:uiGridListSetItemText(var0.gridlist[1], eui:uiGridListAddRow(var0.gridlist[1]), 4, tostring(forvar5.Reason))
    eui:uiGridListSetItemText(var0.gridlist[1], eui:uiGridListAddRow(var0.gridlist[1]), 5, tostring(forvar5.By_))
    eui:uiGridListSetItemText(var0.gridlist[1], eui:uiGridListAddRow(var0.gridlist[1]), 6, tostring(forvar5.Date))
  end
end)
addEventHandler("onClientElementStreamIn", resourceRoot, function()
  if getElementData(source, "fire:marker") then
    createFire(getElementPosition(source))
  end
end)
addEventHandler("onClientElementStreamOut", resourceRoot, function()
  if getElementData(source, "fire:marker") then
    extinguishFire(getElementPosition(source))
  end
end)
addEvent("rpadmin:toggleDevMode", true)
addEventHandler("rpadmin:toggleDevMode", root, function()
  setDevelopmentMode(not getDevelopmentMode())
  outputChatBox("Development Mode: " .. tostring(not getDevelopmentMode()), 255, 55, 95)
end)
addCommandHandler("showkills", function()
  if not exports.hud:getHudSetting("admintag") then
    outputChatBox("You don't have permission to use this command.", 255, 0, 0)
    return
  end
  for forvar3, forvar4 in ipairs(var0) do
    destroyElement(forvar4)
  end
  var0 = {}
  for forvar3, forvar4 in ipairs(getElementsByType("player")) do
    if isPedDead(forvar4) then
      setElementData(createBlip(getElementPosition(forvar4)), "icon", 64)
      table.insert(var0, (createBlip(getElementPosition(forvar4))))
    end
  end
  if isTimer(var1) then
    killTimer(var1)
  end
  var1 = setTimer(function()
    for forvar3, forvar4 in ipairs(var0) do
      destroyElement(forvar4)
    end
    var0 = {}
  end, 10000, 1)
end)
addEvent("hud:onClientHudItemClick", true)
addEventHandler("hud:onClientHudItemClick", localPlayer, function(arg0, arg1)
  if arg0 == "admintag" and not arg1 then
    for forvar5, forvar6 in ipairs(var0) do
      destroyElement(forvar6)
    end
    var0 = {}
  end
end)
