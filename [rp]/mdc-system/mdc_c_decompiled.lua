-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

MDCLOGIN = {
  button = {},
  window = {},
  edit = {},
  label = {}
}
MDCGUI = {
  tab = {},
  edit = {},
  window = {},
  label = {},
  tabpanel = {},
  checkbox = {},
  button = {},
  combobox = {},
  gridlist = {},
  memo = {}
}
GUIEditor = {
  label = {},
  edit = {},
  button = {},
  window = {},
  gridlist = {},
  combobox = {}
}
addEventHandler("onClientResourceStart", resourceRoot, function()
  MDCLOGIN.window[1] = guiCreateWindow((var0 - 330) / 2, (var1 - 193) / 2, 330, 193, "", false)
  guiWindowSetSizable(MDCLOGIN.window[1], false)
  guiSetAlpha(MDCLOGIN.window[1], 1)
  guiSetProperty(MDCLOGIN.window[1], "CloseButtonEnabled", "False")
  guiSetProperty(MDCLOGIN.window[1], "TitlebarEnabled", "False")
  guiSetVisible(MDCLOGIN.window[1], false)
  MDCLOGIN.label[1] = guiCreateLabel(14, 35, 310, 15, "Username:", false, MDCLOGIN.window[1])
  MDCLOGIN.label[2] = guiCreateLabel(14, 95, 310, 15, "Password:", false, MDCLOGIN.window[1])
  MDCLOGIN.edit[1] = guiCreateEdit(9, 54, 311, 31, "", false, MDCLOGIN.window[1])
  MDCLOGIN.edit[2] = guiCreateEdit(9, 111, 311, 31, "", false, MDCLOGIN.window[1])
  guiEditSetMasked(MDCLOGIN.edit[2], true)
  MDCLOGIN.label[3] = guiCreateLabel(10, 6, 309, 15, "MDC - Login", false, MDCLOGIN.window[1])
  guiSetFont(MDCLOGIN.label[3], "default-bold-small")
  guiLabelSetHorizontalAlign(MDCLOGIN.label[3], "center", false)
  MDCLOGIN.button[1] = guiCreateButton(106, 157, 105, 28, "Login", false, MDCLOGIN.window[1])
  MDCLOGIN.button[2] = guiCreateButton(215, 157, 105, 28, "Close", false, MDCLOGIN.window[1])
  MDCGUI.window[1] = guiCreateWindow(143, 725, 774, 477, "MDC - Main", false)
  guiWindowSetSizable(MDCGUI.window[1], false)
  MDCGUI.tabpanel[1] = guiCreateTabPanel(9, 24, 755, 406, false, MDCGUI.window[1])
  MDCGUI.tab[1] = guiCreateTab("APB", MDCGUI.tabpanel[1])
  MDCGUI.gridlist[1] = guiCreateGridList(4, 6, 747, 371, false, MDCGUI.tab[1])
  guiGridListAddColumn(MDCGUI.gridlist[1], "Person", 0.3)
  guiGridListAddColumn(MDCGUI.gridlist[1], "APB", 0.3)
  guiGridListAddColumn(MDCGUI.gridlist[1], "Issued By", 0.3)
  MDCGUI.tab[3] = guiCreateTab("Impounds", MDCGUI.tabpanel[1])
  MDCGUI.gridlist[3] = guiCreateGridList(4, 6, 747, 371, false, MDCGUI.tab[3])
  guiGridListAddColumn(MDCGUI.gridlist[3], "Department", 0.2)
  guiGridListAddColumn(MDCGUI.gridlist[3], "Lane", 0.15)
  guiGridListAddColumn(MDCGUI.gridlist[3], "Release date", 0.2)
  guiGridListAddColumn(MDCGUI.gridlist[3], "Fine $", 0.1)
  guiGridListAddColumn(MDCGUI.gridlist[3], "Model", 0.15)
  guiGridListAddColumn(MDCGUI.gridlist[3], "Plate", 0.15)
  MDCGUI.tab[4] = guiCreateTab("911 Calls", MDCGUI.tabpanel[1])
  MDCGUI.gridlist[4] = guiCreateGridList(4, 6, 747, 371, false, MDCGUI.tab[4])
  guiGridListAddColumn(MDCGUI.gridlist[4], "Caller", 0.2)
  guiGridListAddColumn(MDCGUI.gridlist[4], "Phone number", 0.15)
  guiGridListAddColumn(MDCGUI.gridlist[4], "Description", 0.4)
  guiGridListAddColumn(MDCGUI.gridlist[4], "Date", 0.2)
  MDCGUI.button[1] = guiCreateButton(9, 435, 155, 33, "Search Database", false, MDCGUI.window[1])
  var2[MDCGUI.button[1]] = MDCGUI.window[2]
  MDCGUI.button[2] = guiCreateButton(174, 435, 155, 33, "Add APB", false, MDCGUI.window[1])
  var2[MDCGUI.button[2]] = MDCGUI.window[3]
  MDCGUI.button[3] = guiCreateButton(339, 435, 155, 33, "Account Settings", false, MDCGUI.window[1])
  var2[MDCGUI.button[3]] = GUIEditor.window[1]
  MDCGUI.button[4] = guiCreateButton(641, 435, 123, 33, "Close", false, MDCGUI.window[1])
  var3[MDCGUI.button[4]] = MDCGUI.window[1]
  MDCGUI.window[2] = guiCreateWindow(0, 616, 325, 152, "MDC - Search", false)
  guiWindowSetSizable(MDCGUI.window[2], false)
  MDCGUI.edit[1] = guiCreateEdit(10, 61, 305, 32, "", false, MDCGUI.window[2])
  MDCGUI.combobox[1] = guiCreateComboBox(10, 30, 305, 96, "", false, MDCGUI.window[2])
  guiComboBoxAddItem(MDCGUI.combobox[1], "Person")
  guiComboBoxAddItem(MDCGUI.combobox[1], "Vehicle By Plate")
  guiComboBoxAddItem(MDCGUI.combobox[1], "Property by ID")
  guiComboBoxAddItem(MDCGUI.combobox[1], "Vehicle by ID")
  MDCGUI.button[5] = guiCreateButton(56, 113, 101, 29, "Search", false, MDCGUI.window[2])
  MDCGUI.button[6] = guiCreateButton(163, 113, 101, 29, "Close", false, MDCGUI.window[2])
  var3[MDCGUI.button[6]] = MDCGUI.window[2]
  MDCGUI.window[3] = guiCreateWindow(797, 715, 354, 256, "MDC - Add APB", false)
  guiWindowSetSizable(MDCGUI.window[3], false)
  MDCGUI.label[1] = guiCreateLabel(10, 34, 88, 15, "Date", false, MDCGUI.window[3])
  MDCGUI.label[2] = guiCreateLabel(10, 72, 88, 15, "Description:", false, MDCGUI.window[3])
  MDCGUI.label[3] = guiCreateLabel(10, 138, 94, 15, "Person Involved:", false, MDCGUI.window[3])
  MDCGUI.memo[1] = guiCreateMemo(97, 62, 248, 63, "", false, MDCGUI.window[3])
  MDCGUI.button[7] = guiCreateButton(10, 177, 335, 32, "Add APB", false, MDCGUI.window[3])
  MDCGUI.button[8] = guiCreateButton(10, 213, 335, 32, "Close", false, MDCGUI.window[3])
  MDCGUI.edit[2] = guiCreateEdit(112, 128, 233, 28, "", false, MDCGUI.window[3])
  MDCGUI.label[4] = guiCreateLabel(97, 34, 248, 15, "", false, MDCGUI.window[3])
  var3[MDCGUI.button[8]] = MDCGUI.window[3]
  MDCGUI.window[4] = guiCreateWindow(-49, 668, 762, 501, "MDC - Search for Person", false)
  guiWindowSetSizable(MDCGUI.window[4], false)
  MDCGUI.label[5] = guiCreateLabel(15, 30, 243, 73, [[
Name:
Age:
Gender:
Incarcerated:
Date of Birth:]], false, MDCGUI.window[4])
  MDCGUI.label[6] = guiCreateLabel(258, 30, 243, 73, [[
Ethnicity:
Phone:
Occupation:
Address:
Weight:
Height:]], false, MDCGUI.window[4])
  MDCGUI.tabpanel[2] = guiCreateTabPanel(10, 113, 742, 347, false, MDCGUI.window[4])
  MDCGUI.tab[5] = guiCreateTab("Vehicles", MDCGUI.tabpanel[2])
  MDCGUI.gridlist[5] = guiCreateGridList(10, 10, 722, 303, false, MDCGUI.tab[5])
  guiGridListAddColumn(MDCGUI.gridlist[5], "ID", 0.15)
  guiGridListAddColumn(MDCGUI.gridlist[5], "Name", 0.4)
  MDCGUI.tab[6] = guiCreateTab("Properties", MDCGUI.tabpanel[2])
  MDCGUI.gridlist[6] = guiCreateGridList(10, 10, 722, 303, false, MDCGUI.tab[6])
  guiGridListAddColumn(MDCGUI.gridlist[6], "Type", 0.2)
  guiGridListAddColumn(MDCGUI.gridlist[6], "ID", 0.15)
  guiGridListAddColumn(MDCGUI.gridlist[6], "Name", 0.6)
  MDCGUI.tab[7] = guiCreateTab("Crimes", MDCGUI.tabpanel[2])
  MDCGUI.gridlist[7] = guiCreateGridList(10, 10, 722, 303, false, MDCGUI.tab[7])
  guiGridListAddColumn(MDCGUI.gridlist[7], "Date", 0.3)
  guiGridListAddColumn(MDCGUI.gridlist[7], "Crime", 0.35)
  guiGridListAddColumn(MDCGUI.gridlist[7], "Punishment", 0.3)
  MDCGUI.tab[8] = guiCreateTab("Details", MDCGUI.tabpanel[2])
  MDCGUI.memo[2] = guiCreateMemo(10, 10, 722, 303, "", false, MDCGUI.tab[8])
  MDCGUI.tab[9] = guiCreateTab("Licenses", MDCGUI.tabpanel[2])
  MDCGUI.gridlist[8] = guiCreateGridList(10, 10, 722, 303, false, MDCGUI.tab[9])
  guiGridListAddColumn(MDCGUI.gridlist[8], "License Type", 0.9)
  MDCGUI.tab[10] = guiCreateTab("Pilot Events", MDCGUI.tabpanel[2])
  MDCGUI.gridlist[9] = guiCreateGridList(10, 10, 722, 303, false, MDCGUI.tab[10])
  MDCGUI.tab[11] = guiCreateTab("Pilot Notes", MDCGUI.tabpanel[2])
  MDCGUI.memo[3] = guiCreateMemo(10, 10, 722, 273, "", false, MDCGUI.tab[11])
  MDCGUI.button.SavePilotNotes = guiCreateButton(10, 288, 130, 28, "Save Notes", false, MDCGUI.tab[11])
  MDCGUI.tab[12] = guiCreateTab("Pilot Licenses", MDCGUI.tabpanel[2])
  MDCGUI.gridlist[10] = guiCreateGridList(10, 10, 722, 273, false, MDCGUI.tab[12])
  guiGridListAddColumn(MDCGUI.gridlist[10], "License", 0.3)
  guiGridListAddColumn(MDCGUI.gridlist[10], "Issued", 0.35)
  guiGridListAddColumn(MDCGUI.gridlist[10], "Issued by", 0.3)
  MDCGUI.button.ShowIssueLicense = guiCreateButton(10, 288, 130, 28, "Issue License", false, MDCGUI.tab[12])
  MDCGUI.button.RemovePilotLicense = guiCreateButton(145, 288, 130, 28, "Remove License", false, MDCGUI.tab[12])
  MDCGUI.tab[13] = guiCreateTab("Warrants", MDCGUI.tabpanel[2])
  MDCGUI.gridlist[12] = guiCreateGridList(10, 10, 722, 273, false, MDCGUI.tab[13])
  guiGridListAddColumn(MDCGUI.gridlist[12], "Suspect", 0.3)
  guiGridListAddColumn(MDCGUI.gridlist[12], "Warrant", 0.3)
  guiGridListAddColumn(MDCGUI.gridlist[12], "Issued By", 0.3)
  MDCGUI.button.RemoveWarrant = guiCreateButton(10, 288, 130, 28, "Remove", false, MDCGUI.tab[13])
  MDCGUI.window[10] = guiCreateWindow(0, 449, 190, 140, "MDC - Issue License", false)
  guiWindowSetSizable(MDCGUI.window[10], false)
  MDCGUI.label[14] = guiCreateLabel(10, 30, 60, 15, "License", false, MDCGUI.window[10])
  MDCGUI.combobox.PilotLicense = guiCreateComboBox(70, 30, 150, 100, "", false, MDCGUI.window[10])
  guiComboBoxAddItem(MDCGUI.combobox.PilotLicense, "CPL")
  guiComboBoxAddItem(MDCGUI.combobox.PilotLicense, "ROT")
  guiComboBoxAddItem(MDCGUI.combobox.PilotLicense, "ARC")
  guiComboBoxAddItem(MDCGUI.combobox.PilotLicense, "MER")
  guiComboBoxAddItem(MDCGUI.combobox.PilotLicense, "SER")
  guiComboBoxAddItem(MDCGUI.combobox.PilotLicense, "TER")
  guiComboBoxAddItem(MDCGUI.combobox.PilotLicense, "CFI")
  MDCGUI.button.IssueLicense = guiCreateButton(10, 70, 170, 30, "Issue License", false, MDCGUI.window[10])
  MDCGUI.button.CancelIssueLicense = guiCreateButton(10, 105, 170, 30, "Cancel", false, MDCGUI.window[10])
  var3[MDCGUI.button.CancelIssueLicense] = MDCGUI.window[10]
  MDCGUI.button[9] = guiCreateButton(630, 34, 122, 29, "Post Warrant", false, MDCGUI.window[4])
  MDCGUI.button[10] = guiCreateButton(501, 34, 122, 29, "Update Details", false, MDCGUI.window[4])
  MDCGUI.button[11] = guiCreateButton(630, 69, 122, 29, "Remove Crime", false, MDCGUI.window[4])
  MDCGUI.button[12] = guiCreateButton(501, 69, 122, 29, "Add Crime", false, MDCGUI.window[4])
  MDCGUI.button[13] = guiCreateButton(630, 464, 122, 29, "Close", false, MDCGUI.window[4])
  var3[MDCGUI.button[13]] = MDCGUI.window[4]
  MDCGUI.window[5] = guiCreateWindow(-343, 259, 354, 347, "MDC - Update Details", false)
  guiWindowSetSizable(MDCGUI.window[5], false)
  MDCGUI.label[7] = guiCreateLabel(10, 34, 332, 28, "Birthdate:", false, MDCGUI.window[5])
  guiLabelSetVerticalAlign(MDCGUI.label[7], "center")
  MDCGUI.edit[3] = guiCreateEdit(82, 0, 250, 29, "", false, MDCGUI.label[7])
  MDCGUI.label[8] = guiCreateLabel(10, 72, 332, 28, "Ethnicity:", false, MDCGUI.window[5])
  guiLabelSetVerticalAlign(MDCGUI.label[8], "center")
  MDCGUI.edit[4] = guiCreateEdit(82, 0, 250, 29, "", false, MDCGUI.label[8])
  MDCGUI.label[9] = guiCreateLabel(10, 110, 332, 28, "Phone:", false, MDCGUI.window[5])
  guiLabelSetVerticalAlign(MDCGUI.label[9], "center")
  MDCGUI.edit[5] = guiCreateEdit(82, 0, 250, 29, "", false, MDCGUI.label[9])
  MDCGUI.label[10] = guiCreateLabel(10, 148, 332, 28, "Occupation:", false, MDCGUI.window[5])
  guiLabelSetVerticalAlign(MDCGUI.label[10], "center")
  MDCGUI.edit[6] = guiCreateEdit(82, 0, 250, 29, "", false, MDCGUI.label[10])
  MDCGUI.label[11] = guiCreateLabel(10, 186, 332, 28, "Address:", false, MDCGUI.window[5])
  guiLabelSetVerticalAlign(MDCGUI.label[11], "center")
  MDCGUI.edit[7] = guiCreateEdit(82, 0, 250, 29, "", false, MDCGUI.label[11])
  MDCGUI.label[12] = guiCreateLabel(10, 224, 332, 28, "Photo:", false, MDCGUI.window[5])
  guiLabelSetVerticalAlign(MDCGUI.label[12], "center")
  MDCGUI.checkbox[1] = guiCreateCheckBox(84, 0, 248, 28, "Update Photo ?", true, false, MDCGUI.label[12])
  MDCGUI.button[14] = guiCreateButton(9, 262, 333, 34, "Update", false, MDCGUI.window[5])
  MDCGUI.button[15] = guiCreateButton(9, 301, 333, 34, "Close", false, MDCGUI.window[5])
  var3[MDCGUI.button[15]] = MDCGUI.window[5]
  MDCGUI.window[6] = guiCreateWindow(-371, -5, 383, 202, "MDC - Pos Warrant", false)
  guiWindowSetSizable(MDCGUI.window[6], false)
  MDCGUI.label[13] = guiCreateLabel(10, 53, 98, 14, "Warrant Details:", false, MDCGUI.window[6])
  MDCGUI.checkbox[2] = guiCreateCheckBox(10, 33, 224, 15, "Warrant Active", true, false, MDCGUI.window[6])
  MDCGUI.memo[4] = guiCreateMemo(10, 72, 363, 89, "", false, MDCGUI.window[6])
  MDCGUI.button[16] = guiCreateButton(243, 166, 130, 27, "Close", false, MDCGUI.window[6])
  MDCGUI.button[17] = guiCreateButton(108, 166, 130, 27, "Update Wanted", false, MDCGUI.window[6])
  var3[MDCGUI.button[16]] = MDCGUI.window[6]
  MDCGUI.window[7] = guiCreateWindow(-332, 449, 354, 256, "MDC - Add Crime", false)
  guiWindowSetSizable(MDCGUI.window[7], false)
  MDCGUI.label[14] = guiCreateLabel(10, 34, 88, 15, "Date", false, MDCGUI.window[7])
  MDCGUI.label[15] = guiCreateLabel(10, 59, 88, 15, "Crime:", false, MDCGUI.window[7])
  MDCGUI.label[16] = guiCreateLabel(10, 116, 76, 15, "Punishment:", false, MDCGUI.window[7])
  MDCGUI.memo[5] = guiCreateMemo(96, 59, 248, 54, "", false, MDCGUI.window[7])
  MDCGUI.button[18] = guiCreateButton(10, 177, 335, 32, "Add Crime", false, MDCGUI.window[7])
  MDCGUI.button[19] = guiCreateButton(10, 213, 335, 32, "Close", false, MDCGUI.window[7])
  MDCGUI.label[17] = guiCreateLabel(97, 34, 248, 15, "", false, MDCGUI.window[7])
  MDCGUI.memo[6] = guiCreateMemo(96, 116, 248, 54, "", false, MDCGUI.window[7])
  var3[MDCGUI.button[19]] = MDCGUI.window[7]
  MDCGUI.window[8] = guiCreateWindow(234, 82, 597, 400, "", false)
  guiWindowSetSizable(MDCGUI.window[8], false)
  MDCGUI.label[18] = guiCreateLabel(11, 29, 576, 119, [[
Vehicle:
Plate:
Primary Color:
Secondary Color:
ID Number:
Owner:
Impounded:
Stolen:]], false, MDCGUI.window[8])
  MDCGUI.button[20] = guiCreateButton(73, 88, 46, 15, "No", false, MDCGUI.label[18])
  MDCGUI.button[21] = guiCreateButton(73, 103, 46, 15, "No", false, MDCGUI.label[18])
  MDCGUI.label[19] = guiCreateLabel(11, 158, 193, 15, "Speeding Violations", false, MDCGUI.window[8])
  MDCGUI.gridlist[11] = guiCreateGridList(10, 178, 577, 181, false, MDCGUI.window[8])
  guiGridListAddColumn(MDCGUI.gridlist[11], "Date", 0.2)
  guiGridListAddColumn(MDCGUI.gridlist[11], "Speed", 0.2)
  guiGridListAddColumn(MDCGUI.gridlist[11], "Location", 0.2)
  guiGridListAddColumn(MDCGUI.gridlist[11], "Person", 0.2)
  MDCGUI.button[22] = guiCreateButton(451, 362, 136, 30, "Close", false, MDCGUI.window[8])
  var3[MDCGUI.button[22]] = MDCGUI.window[8]
  MDCGUI.window[9] = guiCreateWindow(0, 0, 399, 186, "MDC - Property", false)
  guiWindowSetSizable(MDCGUI.window[9], false)
  MDCGUI.label[20] = guiCreateLabel(20, 31, 73, 88, [[
ZIP Code:
Type:
Owner:
Cost:
Name:
District:]], false, MDCGUI.window[9])
  MDCGUI.label[21] = guiCreateLabel(93, 31, 286, 88, [[
N/A
N/A
N/A
N/A
N/A
N/A]], false, MDCGUI.window[9])
  MDCGUI.button[23] = guiCreateButton(10, 140, 379, 36, "Close", false, MDCGUI.window[9])
  var3[MDCGUI.button[23]] = MDCGUI.window[9]
  GUIEditor.window[1] = guiCreateWindow(10, 15, 466, 343, "MDC - Account Settings", false)
  guiWindowSetSizable(GUIEditor.window[1], false)
  guiSetAlpha(GUIEditor.window[1], 0.9)
  GUIEditor.gridlist[1] = guiCreateGridList(10, 28, 446, 267, false, GUIEditor.window[1])
  guiGridListAddColumn(GUIEditor.gridlist[1], "User", 0.5)
  guiGridListAddColumn(GUIEditor.gridlist[1], "Role", 0.45)
  GUIEditor.button[1] = guiCreateButton(10, 300, 106, 33, "Create", false, GUIEditor.window[1])
  GUIEditor.button[2] = guiCreateButton(121, 300, 106, 33, "Edit", false, GUIEditor.window[1])
  GUIEditor.button[3] = guiCreateButton(232, 300, 106, 33, "Delete", false, GUIEditor.window[1])
  GUIEditor.button[4] = guiCreateButton(350, 300, 106, 33, "Close", false, GUIEditor.window[1])
  GUIEditor.window[2] = guiCreateWindow(169, 374, 424, 187, "MDC - Create Account", false)
  guiWindowSetSizable(GUIEditor.window[2], false)
  guiSetAlpha(GUIEditor.window[2], 0.9)
  GUIEditor.label[1] = guiCreateLabel(14, 36, 77, 15, "Username:", false, GUIEditor.window[2])
  GUIEditor.label[2] = guiCreateLabel(14, 68, 77, 15, "Password:", false, GUIEditor.window[2])
  GUIEditor.label[3] = guiCreateLabel(14, 105, 57, 15, "Role:", false, GUIEditor.window[2])
  GUIEditor.edit[1] = guiCreateEdit(87, 31, 322, 30, "", false, GUIEditor.window[2])
  GUIEditor.edit[2] = guiCreateEdit(87, 61, 322, 30, "", false, GUIEditor.window[2])
  GUIEditor.combobox[1] = guiCreateComboBox(87, 101, 322, 76, "", false, GUIEditor.window[2])
  guiComboBoxAddItem(GUIEditor.combobox[1], "regular")
  guiComboBoxAddItem(GUIEditor.combobox[1], "admin")
  GUIEditor.button[5] = guiCreateButton(10, 146, 156, 31, "Create Account", false, GUIEditor.window[2])
  GUIEditor.button[6] = guiCreateButton(172, 146, 108, 31, "Close", false, GUIEditor.window[2])
  for forvar3, forvar4 in ipairs(MDCGUI.window) do
    guiSetVisible(forvar4, false)
    guiSetPosition(forvar4, (var0 - guiGetSize(forvar4, false)) / 2, (var1 - guiGetSize(forvar4, false)) / 2, false)
  end
  for forvar3, forvar4 in ipairs(GUIEditor.window) do
    guiSetVisible(forvar4, false)
    guiSetPosition(forvar4, (var0 - guiGetSize(forvar4, false)) / 2, (var1 - guiGetSize(forvar4, false)) / 2, false)
  end
end)
addEvent("MDC:open", true)
addEventHandler("MDC:open", root, function()
  var0.open()
end)
addEvent("MDC:onLogin", true)
addEventHandler("MDC:onLogin", root, function(arg0, arg1, arg2, arg3)
  if arg0 then
    guiSetVisible(MDCGUI.window[1], true)
    guiSetVisible(MDCLOGIN.window[1], false)
    showCursor(true)
    var0 = arg2
    var1 = arg3
    if arg1:lower() == "admin" then
      guiSetEnabled(MDCGUI.button[3], true)
    else
      guiSetEnabled(MDCGUI.button[3], false)
    end
    triggerServerEvent("MDC:getMDCData", localPlayer)
  else
    outputChatBox("[MDC] ERROR: Wrong username and/or password.", 255, 0, 0)
    guiSetEnabled(MDCLOGIN.button[1], true)
    guiSetEnabled(MDCLOGIN.button[2], true)
  end
end)
addEventHandler("onClientGUIClick", resourceRoot, function()
  if var0[source] then
    guiSetVisible(var0[source], false)
    guiSetEnabled(MDCGUI.window[1], true)
  elseif var1[source] then
    guiSetVisible(var1[source], true)
    guiBringToFront(var1[source])
    guiSetEnabled(MDCGUI.window[1], false)
  end
  if source == MDCLOGIN.button[1] then
    if guiGetText(MDCLOGIN.edit[1]) ~= "" and guiGetText(MDCLOGIN.edit[2]) ~= "" then
      guiSetEnabled(MDCLOGIN.button[1], false)
      guiSetEnabled(MDCLOGIN.button[2], false)
      triggerServerEvent("MDC:login", localPlayer, guiGetText(MDCLOGIN.edit[1]), (guiGetText(MDCLOGIN.edit[2])))
    end
  elseif source == MDCLOGIN.button[2] then
    guiSetVisible(MDCLOGIN.window[1], false)
    showCursor(false)
  elseif source == MDCGUI.button[4] then
    var2.close()
  elseif source == MDCGUI.button[6] then
    guiSetVisible(MDCGUI.window[2], false)
    guiSetEnabled(MDCGUI.window[1], true)
  elseif source == MDCGUI.button[1] then
    guiSetVisible(MDCGUI.window[2], true)
    guiBringToFront(MDCGUI.window[2])
    guiSetEnabled(MDCGUI.window[1], false)
  elseif source == MDCGUI.button[3] then
    guiSetVisible(GUIEditor.window[1], true)
    guiBringToFront(GUIEditor.window[1])
    guiSetEnabled(MDCGUI.window[1], false)
  elseif source == GUIEditor.button[1] then
    guiSetVisible(GUIEditor.window[2], true)
    guiBringToFront(GUIEditor.window[2])
    guiSetVisible(GUIEditor.window[1], false)
    guiSetText(GUIEditor.window[2], "MDC - Create Account")
    guiSetEnabled(GUIEditor.edit[1], true)
    guiSetText(GUIEditor.edit[1], "")
    guiSetText(GUIEditor.edit[2], "")
    guiComboBoxSetSelected(GUIEditor.combobox[1], -1)
    guiSetText(GUIEditor.button[5], "Create Account")
  elseif source == GUIEditor.button[6] then
    guiSetVisible(GUIEditor.window[1], true)
    guiBringToFront(GUIEditor.window[1])
    guiSetVisible(GUIEditor.window[2], false)
  elseif source == GUIEditor.button[2] then
    if guiGridListGetSelectedItem(GUIEditor.gridlist[1]) ~= -1 and (var3 == "admin" or guiGridListGetItemText(GUIEditor.gridlist[1], guiGridListGetSelectedItem(GUIEditor.gridlist[1]), 1) ~= "admin") then
      guiSetVisible(GUIEditor.window[2], true)
      guiBringToFront(GUIEditor.window[2])
      guiSetVisible(GUIEditor.window[1], false)
      guiSetText(GUIEditor.window[2], "MDC - Edit Account")
      guiSetEnabled(GUIEditor.edit[1], false)
      guiSetText(GUIEditor.edit[1], (guiGridListGetItemText(GUIEditor.gridlist[1], guiGridListGetSelectedItem(GUIEditor.gridlist[1]), 1)))
      guiSetText(GUIEditor.edit[2], (guiGridListGetItemData(GUIEditor.gridlist[1], guiGridListGetSelectedItem(GUIEditor.gridlist[1]), 1)))
      guiComboBoxSetSelected(GUIEditor.combobox[1], guiGridListGetItemText(GUIEditor.gridlist[1], guiGridListGetSelectedItem(GUIEditor.gridlist[1]), 2) == "admin" and 1 or 0)
      guiSetText(GUIEditor.button[5], "Save Changes")
    end
  elseif source == GUIEditor.button[3] then
    if guiGridListGetSelectedItem(GUIEditor.gridlist[1]) ~= -1 then
      if guiGridListGetItemText(GUIEditor.gridlist[1], guiGridListGetSelectedItem(GUIEditor.gridlist[1]), 1) ~= "admin" then
        triggerServerEvent("MDC:deleteAccount", localPlayer, var4, (guiGridListGetItemText(GUIEditor.gridlist[1], guiGridListGetSelectedItem(GUIEditor.gridlist[1]), 1)))
      else
        outputChatBox("[MDC] ERROR: You can not delete this user.", 255, 0, 0)
      end
    end
  elseif source == GUIEditor.button[5] then
    if guiComboBoxGetSelected(GUIEditor.combobox[1]) ~= -1 then
      guiSetVisible(GUIEditor.window[2], false)
      guiSetVisible(GUIEditor.window[1], true)
      guiBringToFront(GUIEditor.window[1])
      if guiGetText(source) == "Create Account" then
        triggerServerEvent("MDC:createAccount", localPlayer, var4, guiGetText(GUIEditor.edit[1]), guiGetText(GUIEditor.edit[2]), (guiComboBoxGetItemText(GUIEditor.combobox[1], (guiComboBoxGetSelected(GUIEditor.combobox[1])))))
      else
        triggerServerEvent("MDC:editAccount", localPlayer, var4, guiGetText(GUIEditor.edit[1]), guiGetText(GUIEditor.edit[2]), (guiComboBoxGetItemText(GUIEditor.combobox[1], (guiComboBoxGetSelected(GUIEditor.combobox[1])))))
      end
    end
  elseif source == GUIEditor.button[4] then
    guiSetVisible(GUIEditor.window[1], false)
    guiSetEnabled(MDCGUI.window[1], true)
  elseif source == MDCGUI.button[5] then
    if guiComboBoxGetSelected(MDCGUI.combobox[1]) == 0 then
      if guiGetText(MDCGUI.edit[1]) ~= "" then
        triggerServerEvent("MDC:getPersonInformations", localPlayer, guiGetText(MDCGUI.edit[1]), true)
        guiSetVisible(MDCGUI.window[2], false)
      end
    elseif guiComboBoxGetSelected(MDCGUI.combobox[1]) == 1 then
      if searchForVehicleByPlate((guiGetText(MDCGUI.edit[1]))) then
        triggerServerEvent("MDC:getVehicleInformations", localPlayer, (searchForVehicleByPlate((guiGetText(MDCGUI.edit[1])))))
        guiSetVisible(MDCGUI.window[2], false)
      end
    elseif guiComboBoxGetSelected(MDCGUI.combobox[1]) == 2 then
      if searchForProperty((guiGetText(MDCGUI.edit[1]))) then
        triggerServerEvent("MDC:getPropertyInformations", localPlayer, tonumber((guiGetText(MDCGUI.edit[1]))))
        guiSetVisible(MDCGUI.window[2], false)
      end
    elseif guiComboBoxGetSelected(MDCGUI.combobox[1]) == 3 and searchForVehicleByID((guiGetText(MDCGUI.edit[1]))) then
      triggerServerEvent("MDC:getVehicleInformations", localPlayer, (guiGetText(MDCGUI.edit[1])))
      guiSetVisible(MDCGUI.window[2], false)
    end
  elseif source == MDCGUI.button[10] then
    guiSetVisible(MDCGUI.window[5], true)
    guiBringToFront(MDCGUI.window[5])
    guiSetEnabled(MDCGUI.window[4], false)
  elseif source == MDCGUI.button[9] then
    guiSetVisible(MDCGUI.window[6], true)
    guiBringToFront(MDCGUI.window[6])
    guiSetEnabled(MDCGUI.window[4], false)
  elseif source == MDCGUI.button[12] then
    guiSetVisible(MDCGUI.window[7], true)
    guiBringToFront(MDCGUI.window[7])
    guiSetText(MDCGUI.label[17], getDate())
    guiSetText(MDCGUI.memo[5], "")
    guiSetText(MDCGUI.memo[6], "")
    guiSetEnabled(MDCGUI.window[4], false)
  elseif source == MDCGUI.button[11] then
    if guiGridListGetSelectedItem(MDCGUI.gridlist[7]) ~= -1 then
      guiSetVisible(MDCGUI.window[7], false)
      triggerServerEvent("MDC:removeCrime", localPlayer, var4, currentPersonName, (guiGridListGetItemData(MDCGUI.gridlist[7], guiGridListGetSelectedItem(MDCGUI.gridlist[7]), 1)))
    end
  elseif source == MDCGUI.button[15] or source == MDCGUI.button[16] or source == MDCGUI.button[19] or source == MDCGUI.button.CancelIssueLicense then
    guiSetEnabled(MDCGUI.window[4], true)
  elseif source == MDCGUI.button[2] then
    guiSetVisible(MDCGUI.window[3], true)
    guiBringToFront(MDCGUI.window[3])
    guiSetEnabled(MDCGUI.window[1], false)
    guiSetText(MDCGUI.label[4], getDate())
    guiSetText(MDCGUI.memo[1], "")
    guiSetText(MDCGUI.edit[2], "")
    guiSetText(MDCGUI.window[3], "MDC - Add APB")
    guiSetText(MDCGUI.button[7], "Add APB")
  elseif source == MDCGUI.button[7] then
    if guiGetText(source) == "Add APB" then
      if guiGetText(MDCGUI.memo[1]) ~= "" and guiGetText(MDCGUI.edit[2]) ~= "" then
        guiSetVisible(MDCGUI.window[3], false)
        guiSetEnabled(MDCGUI.window[1], true)
        triggerServerEvent("MDC:addAPB", localPlayer, var4, guiGetText(MDCGUI.memo[1]), (guiGetText(MDCGUI.edit[2])))
      end
    else
      guiSetVisible(MDCGUI.window[3], false)
      guiSetEnabled(MDCGUI.window[1], true)
      triggerServerEvent("MDC:removeAPB", localPlayer, var4, currentAPBID)
    end
  elseif source == MDCGUI.button[17] then
    if 1 < #guiGetText(MDCGUI.memo[4]) then
      guiSetVisible(MDCGUI.window[6], false)
      guiSetEnabled(MDCGUI.window[4], true)
      triggerServerEvent("MDC:addWarrant", localPlayer, var4, currentPersonName, guiGetText(MDCGUI.memo[4]), (guiCheckBoxGetSelected(MDCGUI.checkbox[2])))
    end
  elseif source == MDCGUI.button[18] then
    if 1 < #guiGetText(MDCGUI.memo[5]) and 1 < #guiGetText(MDCGUI.memo[6]) then
      guiSetVisible(MDCGUI.window[7], false)
      guiSetEnabled(MDCGUI.window[4], true)
      triggerServerEvent("MDC:addCrime", localPlayer, var4, currentPersonName, guiGetText(MDCGUI.memo[5]), (guiGetText(MDCGUI.memo[6])))
    end
  elseif source == MDCGUI.button[14] then
    guiSetVisible(MDCGUI.window[5], false)
    guiSetEnabled(MDCGUI.window[4], true)
    triggerServerEvent("MDC:updatePersonDetails", localPlayer, var4, currentPersonName, guiGetText(MDCGUI.edit[3]), guiGetText(MDCGUI.edit[4]), guiGetText(MDCGUI.edit[5]), guiGetText(MDCGUI.edit[6]), (guiGetText(MDCGUI.edit[7])))
  elseif source == MDCGUI.button.ShowIssueLicense then
    guiSetVisible(MDCGUI.window[10], true)
    guiBringToFront(MDCGUI.window[10])
    guiSetEnabled(MDCGUI.window[4], false)
  elseif source == MDCGUI.button.IssueLicense then
    guiSetVisible(MDCGUI.window[10], false)
    guiSetEnabled(MDCGUI.window[4], true)
    if guiComboBoxGetSelected(MDCGUI.combobox.PilotLicense) ~= -1 then
      triggerServerEvent("MDC:issueLicense", localPlayer, var4, currentPersonName, (guiComboBoxGetItemText(MDCGUI.combobox.PilotLicense, (guiComboBoxGetSelected(MDCGUI.combobox.PilotLicense)))))
    end
  elseif source == MDCGUI.button.RemovePilotLicense then
    if guiGridListGetSelectedItem(MDCGUI.gridlist[10]) ~= -1 then
      triggerServerEvent("MDC:removePilotLicense", localPlayer, var4, currentPersonName, (guiGridListGetItemData(MDCGUI.gridlist[10], guiGridListGetSelectedItem(MDCGUI.gridlist[10]), 1)))
    end
  elseif source == MDCGUI.button.SavePilotNotes then
    triggerServerEvent("MDC:savePilotNotes", localPlayer, var4, currentPersonName, (guiGetText(MDCGUI.memo[3])))
  elseif source == MDCGUI.button.RemoveWarrant and guiGridListGetSelectedItem(MDCGUI.gridlist[12]) ~= -1 then
    triggerServerEvent("MDC:removeWarrant", localPlayer, var4, (guiGridListGetItemData(MDCGUI.gridlist[12], guiGridListGetSelectedItem(MDCGUI.gridlist[12]), 1)))
  end
end)
addEventHandler("onClientGUIDoubleClick", resourceRoot, function()
  if source == MDCGUI.gridlist[1] and guiGridListGetSelectedItem(source) ~= -1 then
    currentAPBID = guiGridListGetItemData(source, guiGridListGetSelectedItem(source), 1)
    guiSetVisible(MDCGUI.window[3], true)
    guiBringToFront(MDCGUI.window[3])
    guiSetEnabled(MDCGUI.window[1], false)
    guiSetText(MDCGUI.window[3], "MDC - Preview APB")
    guiSetText(MDCGUI.button[7], "Remove APB")
    guiSetText(MDCGUI.label[4], guiGridListGetItemData(source, guiGridListGetSelectedItem(source), 2))
    guiSetText(MDCGUI.memo[1], guiGridListGetItemText(source, guiGridListGetSelectedItem(source), 2))
    guiSetText(MDCGUI.edit[2], guiGridListGetItemText(source, guiGridListGetSelectedItem(source), 1))
  end
end)
function getDate()
  return ({
    [0] = "Sunday",
    [1] = "Monday",
    [2] = "Tuesday",
    [3] = "Wednesday",
    [4] = "Thursday",
    [5] = "Friday",
    [6] = "Saturday"
  })[getRealTime().weekday] .. ", " .. ({
    monthName = {
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December"
    }
  }).monthName[getRealTime().month + 1] .. " " .. getRealTime().monthday .. " " .. getRealTime().year + 1900 .. ", " .. getRealTime().hour .. ":" .. getRealTime().minute .. ":" .. getRealTime().second
end
addEvent("MDC:onSearchFailed", true)
addEventHandler("MDC:onSearchFailed", root, function()
  guiSetEnabled(MDCGUI.window[1], true)
end)
addEvent("MDC:sendPersonInformationsToClient", true)
addEventHandler("MDC:sendPersonInformationsToClient", root, function(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11)
  currentPersonName = arg1.Name
  guiSetVisible(MDCGUI.window[4], true)
  guiBringToFront(MDCGUI.window[4])
  guiSetText(MDCGUI.label[5], "Name: " .. tostring(arg1.Name) .. [[

Age: ]] .. tostring(fromJSON(arg1.Info).Age) .. [[

Gender: ]] .. tostring(fromJSON(arg1.Info).Gender) .. [[

Incarcerated: ]] .. tostring(fromJSON(arg1.Info).Incarcerated) .. [[

Date of Birth: ]] .. tostring(fromJSON(arg1.Info).BirthDate[1] .. "/" .. fromJSON(arg1.Info).BirthDate[2] .. "/" .. fromJSON(arg1.Info).BirthDate[3]) .. "")
  guiSetText(MDCGUI.label[6], "Ethnicity: " .. tostring(fromJSON(arg1.Info).Ethnicity) .. [[

Phone: ]] .. tostring(fromJSON(arg1.Info).Phone) .. [[

Occupation: ]] .. tostring(fromJSON(arg1.Info).Occupation) .. [[

Address: ]] .. tostring(fromJSON(arg1.Info).Address) .. [[

Weight: ]] .. tostring(fromJSON(arg1.Info).Weight) .. [[
kg
Height: ]] .. tostring(fromJSON(arg1.Info).Height) .. "cm")
  guiSetText(MDCGUI.edit[3], tostring(fromJSON(arg1.Info).BirthDate[1] .. "/" .. fromJSON(arg1.Info).BirthDate[2] .. "/" .. fromJSON(arg1.Info).BirthDate[3]))
  guiSetText(MDCGUI.edit[4], fromJSON(arg1.Info).Ethnicity or "")
  guiSetText(MDCGUI.edit[5], fromJSON(arg1.Info).Phone or "")
  guiSetText(MDCGUI.edit[6], fromJSON(arg1.Info).Occupation or "")
  guiSetText(MDCGUI.edit[7], fromJSON(arg1.Info).Address or "")
  guiGridListClear(MDCGUI.gridlist[5])
  for forvar17, forvar18 in ipairs(arg2) do
    if isElement((getElementByID("Vehicle:" .. tostring(forvar18.ID)))) then
      guiGridListSetItemText(MDCGUI.gridlist[5], guiGridListAddRow(MDCGUI.gridlist[5]), 1, tostring(forvar18.ID), false, false)
      guiGridListSetItemText(MDCGUI.gridlist[5], guiGridListAddRow(MDCGUI.gridlist[5]), 2, tostring(getElementData(getElementByID("Vehicle:" .. tostring(forvar18.ID)), "vehicle:name")), false, false)
    end
  end
  guiGridListClear(MDCGUI.gridlist[7])
  for forvar17, forvar18 in ipairs(arg3) do
    guiGridListSetItemText(MDCGUI.gridlist[7], guiGridListAddRow(MDCGUI.gridlist[7]), 1, tostring(forvar18.cDate), false, false)
    guiGridListSetItemText(MDCGUI.gridlist[7], guiGridListAddRow(MDCGUI.gridlist[7]), 2, tostring(forvar18.Crime), false, false)
    guiGridListSetItemText(MDCGUI.gridlist[7], guiGridListAddRow(MDCGUI.gridlist[7]), 3, tostring(forvar18.Punishment), false, false)
    guiGridListSetItemData(MDCGUI.gridlist[7], guiGridListAddRow(MDCGUI.gridlist[7]), 1, forvar18.ID)
  end
  guiGridListClear(MDCGUI.gridlist[6])
  for forvar17, forvar18 in ipairs(arg4) do
    guiGridListSetItemText(MDCGUI.gridlist[6], guiGridListAddRow(MDCGUI.gridlist[6]), 1, "Interior", false, false)
    guiGridListSetItemText(MDCGUI.gridlist[6], guiGridListAddRow(MDCGUI.gridlist[6]), 2, tostring(forvar18.id), false, false)
    guiGridListSetItemText(MDCGUI.gridlist[6], guiGridListAddRow(MDCGUI.gridlist[6]), 3, tostring(forvar18.name), false, false)
  end
  for forvar17, forvar18 in ipairs(arg5) do
    guiGridListSetItemText(MDCGUI.gridlist[6], guiGridListAddRow(MDCGUI.gridlist[6]), 1, tostring(forvar18.PropertyType), false, false)
    guiGridListSetItemText(MDCGUI.gridlist[6], guiGridListAddRow(MDCGUI.gridlist[6]), 2, tostring(forvar18.ID), false, false)
    guiGridListSetItemText(MDCGUI.gridlist[6], guiGridListAddRow(MDCGUI.gridlist[6]), 3, tostring(forvar18.Name), false, false)
  end
  guiGridListClear(MDCGUI.gridlist[10])
  for forvar17, forvar18 in ipairs(arg6) do
    guiGridListSetItemText(MDCGUI.gridlist[10], guiGridListAddRow(MDCGUI.gridlist[10]), 1, tostring(forvar18.License), false, false)
    guiGridListSetItemData(MDCGUI.gridlist[10], guiGridListAddRow(MDCGUI.gridlist[10]), 1, forvar18.ID)
    guiGridListSetItemText(MDCGUI.gridlist[10], guiGridListAddRow(MDCGUI.gridlist[10]), 2, tostring(forvar18.Issued), false, false)
    guiGridListSetItemText(MDCGUI.gridlist[10], guiGridListAddRow(MDCGUI.gridlist[10]), 3, tostring(forvar18.IssuedBy), false, false)
  end
  guiGridListClear(MDCGUI.gridlist[8])
  if arg9 then
    guiGridListSetItemText(MDCGUI.gridlist[8], guiGridListAddRow(MDCGUI.gridlist[8]), 1, "Vehicles License", false, false)
  end
  for forvar17, forvar18 in ipairs(arg10) do
    guiGridListSetItemText(MDCGUI.gridlist[8], guiGridListAddRow(MDCGUI.gridlist[8]), 1, tostring(forvar18.license) .. " " .. tostring(forvar18.type) .. " License (ID: " .. tostring(forvar18.id) .. ") - issued by " .. tostring(forvar18.issued_by) .. " (" .. tostring(forvar18.issued_at) .. ")", false, false)
  end
  guiGridListClear(MDCGUI.gridlist[12])
  for forvar17, forvar18 in ipairs(arg11) do
    guiGridListSetItemText(MDCGUI.gridlist[12], guiGridListAddRow(MDCGUI.gridlist[12]), 1, tostring(forvar18.Suspect), false, false)
    guiGridListSetItemData(MDCGUI.gridlist[12], guiGridListAddRow(MDCGUI.gridlist[12]), 1, forvar18.ID)
    guiGridListSetItemText(MDCGUI.gridlist[12], guiGridListAddRow(MDCGUI.gridlist[12]), 2, tostring(forvar18.Warrant), false, false)
    guiGridListSetItemText(MDCGUI.gridlist[12], guiGridListAddRow(MDCGUI.gridlist[12]), 3, tostring(forvar18.IssuedBy), false, false)
  end
  guiSetVisible(MDCGUI.button.ShowIssueLicense, arg7)
  guiSetVisible(MDCGUI.button.RemovePilotLicense, arg7)
  guiSetVisible(MDCGUI.button.SavePilotNotes, arg7)
  guiSetText(MDCGUI.memo[3], tostring(arg8))
  guiMemoSetReadOnly(MDCGUI.memo[3], not arg7)
end)
addEvent("MDC:onUpdateWarrants", true)
addEventHandler("MDC:onUpdateWarrants", root, function(arg0)
  guiGridListClear(MDCGUI.gridlist[12])
  for forvar4, forvar5 in ipairs(arg0) do
    guiGridListSetItemText(MDCGUI.gridlist[12], guiGridListAddRow(MDCGUI.gridlist[12]), 1, tostring(forvar5.Suspect), false, false)
    guiGridListSetItemData(MDCGUI.gridlist[12], guiGridListAddRow(MDCGUI.gridlist[12]), 1, forvar5.ID)
    guiGridListSetItemText(MDCGUI.gridlist[12], guiGridListAddRow(MDCGUI.gridlist[12]), 2, tostring(forvar5.Warrant), false, false)
    guiGridListSetItemText(MDCGUI.gridlist[12], guiGridListAddRow(MDCGUI.gridlist[12]), 3, tostring(forvar5.IssuedBy), false, false)
  end
end)
addEvent("MDC:sendVehicleInformationsToClient", true)
addEventHandler("MDC:sendVehicleInformationsToClient", root, function(arg0, arg1)
  guiSetVisible(MDCGUI.window[8], true)
  guiBringToFront(MDCGUI.window[8])
  guiSetText(MDCGUI.label[18], "Vehicle: " .. tostring(getElementData(getElementByID("Vehicle:" .. tostring(arg0)), "vehicle:name")) .. [[

Plate: ]] .. tostring(getVehiclePlateText((getElementByID("Vehicle:" .. tostring(arg0))))) .. [[

Primary Color: ]] .. tostring(color1) .. [[

Secondary Color: ]] .. tostring(color2) .. [[

ID Number: ]] .. tostring(arg0) .. [[

Owner: ]] .. tostring(getElementData(getElementByID("Vehicle:" .. tostring(arg0)), "vehicle:owner.name")) .. [[

Impounded:
Stolen:]])
end)
addEvent("MDC:sendPropertyInformationsToClient", true)
addEventHandler("MDC:sendPropertyInformationsToClient", root, function(arg0, arg1)
  guiSetVisible(MDCGUI.window[9], true)
  guiBringToFront(MDCGUI.window[9])
  guiSetText(MDCGUI.label[21], tostring(arg0) .. "\n" .. tostring(({
    "House",
    "Business",
    "Government",
    "Rentable"
  })[getElementData(getElementByID("sys:int:" .. tostring(arg0)), "interior:type") + 1]) .. "\n" .. tostring(getElementData(getElementByID("sys:int:" .. tostring(arg0)), "interior:owner.name")) .. [[

$]] .. tostring(getElementData(getElementByID("sys:int:" .. tostring(arg0)), "interior:price")) .. "\n" .. tostring(getElementData(getElementByID("sys:int:" .. tostring(arg0)), "interior:name")) .. "\n" .. tostring(getZoneName(getElementPosition((getElementChild(getElementByID("sys:int:" .. tostring(arg0)), 0))))) .. ", " .. tostring(getZoneName(getElementPosition((getElementChild(getElementByID("sys:int:" .. tostring(arg0)), 0))))))
end)
function searchForVehicleByID(arg0)
  if isElement((getElementByID("Vehicle:" .. tostring(arg0)))) then
    return true
  end
  return false
end
function searchForVehicleByPlate(arg0)
  for forvar4, forvar5 in ipairs(getElementsByType("vehicle")) do
    if getVehiclePlateText(forvar5) == arg0 and getElementID(forvar5) then
      return string.gsub(getElementID(forvar5), "Vehicle:", "") or false
    end
  end
  return false
end
function searchForProperty(arg0)
  if isElement((getElementByID("sys:int:" .. tostring(arg0)))) then
    return true
  end
  return false
end
addEvent("MDC:sendMDCDataToClient", true)
addEventHandler("MDC:sendMDCDataToClient", root, function(arg0, arg1, arg2, arg3)
  guiGridListClear(MDCGUI.gridlist[1])
  for forvar7, forvar8 in ipairs(arg0) do
    guiGridListSetItemText(MDCGUI.gridlist[1], guiGridListAddRow(MDCGUI.gridlist[1]), 1, tostring(forvar8.PersonInvolved), false, false)
    guiGridListSetItemText(MDCGUI.gridlist[1], guiGridListAddRow(MDCGUI.gridlist[1]), 2, tostring(forvar8.Description), false, false)
    guiGridListSetItemText(MDCGUI.gridlist[1], guiGridListAddRow(MDCGUI.gridlist[1]), 3, tostring(forvar8.IssuedBy), false, false)
    guiGridListSetItemData(MDCGUI.gridlist[1], guiGridListAddRow(MDCGUI.gridlist[1]), 1, forvar8.ID)
    guiGridListSetItemData(MDCGUI.gridlist[1], guiGridListAddRow(MDCGUI.gridlist[1]), 2, forvar8.apbDate)
  end
  guiGridListClear(MDCGUI.gridlist[4])
  for forvar7, forvar8 in ipairs(arg3) do
    guiGridListSetItemText(MDCGUI.gridlist[4], guiGridListAddRow(MDCGUI.gridlist[4]), 1, tostring(forvar8.Caller), false, false)
    guiGridListSetItemText(MDCGUI.gridlist[4], guiGridListAddRow(MDCGUI.gridlist[4]), 2, tostring(forvar8.PhoneNumber), false, false)
    guiGridListSetItemText(MDCGUI.gridlist[4], guiGridListAddRow(MDCGUI.gridlist[4]), 3, tostring(forvar8.Description), false, false)
    guiGridListSetItemText(MDCGUI.gridlist[4], guiGridListAddRow(MDCGUI.gridlist[4]), 4, tostring(forvar8.Time), false, false)
  end
  guiGridListClear(GUIEditor.gridlist[1])
  for forvar7, forvar8 in ipairs(arg2) do
    guiGridListSetItemText(GUIEditor.gridlist[1], guiGridListAddRow(GUIEditor.gridlist[1]), 1, tostring(forvar8.Username), false, false)
    guiGridListSetItemData(GUIEditor.gridlist[1], guiGridListAddRow(GUIEditor.gridlist[1]), 1, tostring(forvar8.Password))
    guiGridListSetItemText(GUIEditor.gridlist[1], guiGridListAddRow(GUIEditor.gridlist[1]), 2, tostring(forvar8.Role), false, false)
  end
end)
;({state = false, list = false}).draw = function()
  if isPlayerMapVisible() then
    return
  end
  for forvar7, forvar8 in ipairs(var2.list) do
    dxDrawRectangle((var0 - var0 / 2) / 2, var1 - 60, var0 / 2, 20, tocolor(0, 0, 0, 200), false)
    dxDrawText(string.gsub(forvar8.Description, "\n", "") .. " | " .. forvar8.PersonInvolved, (var0 - var0 / 2) / 2, var1 - 60, (var0 - var0 / 2) / 2 + var0 / 2, var1 - 60 + 20, tocolor(255, 255, 255, 240), 1, "default-bold", "center", "center")
  end
end
addEvent("MDC:showAPBInVehicle", true)
addEventHandler("MDC:showAPBInVehicle", root, function(arg0, arg1)
  if arg0 then
    if not var0.state then
      addEventHandler("onClientRender", root, var0.draw)
      var0.state = arg0
    end
    var0.list = arg1
  elseif var0.state then
    removeEventHandler("onClientRender", root, var0.draw)
    var0.state = false
    var0.list = false
  end
end)
;({state = false, list = false}).hide = function(arg0)
  if var0.state then
    removeEventHandler("onClientRender", root, var0.draw)
    var0.state = false
    var0.list = false
  end
end
addEvent("onClientPlayerQuitFromCharacter", true)
addEventHandler("onClientPlayerQuitFromCharacter", localPlayer, ({state = false, list = false}).hide)
addEventHandler("onClientPlayerWasted", localPlayer, ({state = false, list = false}).hide)
addEvent("onClientUseItem", true)
addEventHandler("onClientUseItem", root, function(arg0, arg1, arg2)
  if arg2.Type == "License Card" then
    exports.notifications:sendNotification("#ff375fLicense Card", "#FFFFFF- License ID: " .. tostring(arg2.Properties.ID) .. [[

- Name: ]] .. tostring(arg2.SpecialProperties.Name), 5000)
  end
end)
