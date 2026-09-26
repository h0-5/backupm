-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

addEvent("factions:loadFromURL", true)
addEventHandler("factions:loadFromURL", root, function(arg0, arg1)
  fileWrite(fileCreate(arg0), arg1)
  fileClose((fileCreate(arg0)))
end)
UI = {
  window = {},
  label = {},
  button = {},
  gridlist = {},
  staticimage = {},
  image = {},
  memo = {},
  tabpanel = {},
  tab = {},
  checklist = {},
  edit = {},
  rect = {},
  container = {},
  menu = {},
  checkbox = {},
  progress = {}
}
isLabelButton = {}
function reloadMenu(arg0, arg1, arg2)
  eui:uiMenuClear(UI.menu.main)
  for forvar8, forvar9 in ipairs(var0) do
    if forvar9.level == "Member" or forvar9.level == arg1 then
      eui:uiMenuAddRow(UI.menu.main, forvar9.title, arg0 or tocolor(29, 32, 37, 0), forvar9.icon, UI.container[forvar9.id], forvar9.id)
    end
  end
  eui:uiMenuSetSelectedRow(UI.menu.main, 1)
end
function UIKitReady()
  eui = exports.UIKit
  UI.window[1] = eui:uiCreateWindow(false, false, 485, 385, "Factions List")
  eui:uiWindowSetMovable(UI.window[1], false)
  eui:uiSetVisible(UI.window[1], false)
  UI.gridlist[1] = eui:uiCreateGridList(5, 35, 475, 310, tocolor(10, 10, 10), UI.window[1])
  eui:uiGridListAddColumn(UI.gridlist[1], "ID", 0.1)
  eui:uiGridListAddColumn(UI.gridlist[1], "Name", 0.6)
  eui:uiGridListAddColumn(UI.gridlist[1], "Type", 0.3)
  eui:uiSetAlign(UI.gridlist[1], "left", "center")
  UI.button[1] = eui:uiCreateButton(5, 350, 475, 30, "Hide", tocolor(0, 0, 0), UI.window[1])
  UI.window.SelectFaction = eui:uiCreateWindow(false, false, 400, 250, "Select Faction")
  eui:uiSetVisible(UI.window.SelectFaction, false)
  eui:uiWindowSetMovable(UI.window.SelectFaction, false)
  eui:uiSetProperty(UI.window.SelectFaction, "close_button", true)
  UI.gridlist.SelectFaction = eui:uiCreateGridList(0, 40, 400, 210, tocolor(0, 0, 0, 0), UI.window.SelectFaction)
  eui:uiGridListAddColumn(UI.gridlist.SelectFaction, "Faction name", 1)
  eui:uiSetAlign(UI.gridlist.SelectFaction, "left", "center")
  eui:uiSetProperty(UI.gridlist.SelectFaction, "row_height", 28)
  UI.window.FactionWindow = eui:uiCreateRectangle(false, false, 955, 625, tocolor(6, 9, 14, 235), true, true, true, true)
  eui:uiSetVisible(UI.window.FactionWindow, false)
  UI.menu.main = eui:uiCreateMenu(5, 150, 150, 400, tocolor(19, 22, 27, 0), UI.window.FactionWindow)
  eui:uiSetProperty(UI.menu.main, "selection_color", tocolor(255, 0, 0))
  eui:uiSetProperty(UI.menu.main, "hovered_row_color", tocolor(9, 12, 17, 200))
  eui:uiSetProperty(UI.menu.main, "selected_row_color", tocolor(3, 6, 11, 255))
  eui:uiSetProperty(UI.menu.main, "row_height", 30)
  for forvar10, forvar11 in ipairs(var0) do
    UI.container[forvar11.id] = eui:uiCreateContainer(0, 0, 955 - 150 - 15, 625 - 130 - 5, (eui:uiCreateRectangle(150 + 10, 130, 955 - 150 - 15, 625 - 130 - 5, tocolor(11, 14, 19, 230), true, true, true, true, UI.window.FactionWindow)))
    eui:uiSetVisible(UI.container[forvar11.id], false)
  end
  UI.window.FactionMain = eui:uiCreateRectangle(5, 5, 700, 125, tocolor(20, 20, 20, 0), true, true, true, true, UI.window.FactionWindow)
  UI.image.FactionLogo = eui:uiCreateImage((150 - 100) / 2, 15, 100, 100, ":factions-logos/logos/default.png", UI.window.FactionMain)
  UI.label.FactionTitle = eui:uiCreateLabel(150 + 10, 10, 232, 30, "#ID Faction Name", tocolor(255, 255, 255, 255), "left", "top", UI.window.FactionMain)
  eui:uiSetFont(UI.label.FactionTitle, "default-large")
  UI.label.FactionInfo = eui:uiCreateLabel(150 + 10, 50, 250, 70, "...", tocolor(255, 255, 255, 255), "left", "top", UI.window.FactionMain)
  UI.label.FactionInfo2 = eui:uiCreateLabel(150 + 10 + 260, 50, 250, 70, "", tocolor(255, 255, 255, 255), "left", "top", UI.window.FactionMain)
  UI.container.level = eui:uiCreateRectangle(955 - 155, 50, 140, 60, tocolor(20, 20, 20, 240), true, true, true, true, UI.window.FactionWindow)
  UI.label.level = eui:uiCreateLabel(10, 5, 140, 20, "Level 1", tocolor(255, 255, 255, 255), "left", "top", UI.container.level)
  eui:uiSetFont(UI.label.level, "default-large")
  UI.label.level_points = eui:uiCreateLabel(10, 32, 140, 20, "0 / 0", tocolor(255, 255, 255, 220), "left", "top", UI.container.level)
  eui:uiSetFontSize(UI.label.level_points, 0.9)
  UI.progress.level = eui:uiCreateProgressBar(110, 30, 15, 15, _, UI.container.level)
  eui:uiSetProperty(UI.progress.level, "progress_type", "circular")
  eui:uiSetProperty(UI.progress.level, "show_progress", false)
  eui:uiSetProperty(UI.progress.level, "background_color", tocolor(30, 30, 30))
  UI.label.ChangeFaction = eui:uiCreateImage(955 - 60, 10, 40, 40, ":assets/icons/more.png", UI.window.FactionWindow)
  eui:uiSetProperty(UI.label.ChangeFaction, "HoverOpacityEffect", true)
  isLabelButton[UI.label.ChangeFaction] = "ChangeFaction"
  UI.label["FactionSection:Overview"] = UI.container.members
  UI.gridlist.Members = eui:uiCreateGridList(0, 0, 955 - 150 - 15, 625 - 130 - 5 - 45, tocolor(20, 20, 20, 0), UI.label["FactionSection:Overview"])
  eui:uiGridListAddColumn(UI.gridlist.Members, "Name", 0.3)
  eui:uiGridListAddColumn(UI.gridlist.Members, "Rank", 0.25)
  eui:uiGridListAddColumn(UI.gridlist.Members, "LastLogin", 0.15)
  eui:uiGridListAddColumn(UI.gridlist.Members, "Level", 0.1)
  eui:uiGridListAddColumn(UI.gridlist.Members, "Wage", 0.1)
  eui:uiGridListAddColumn(UI.gridlist.Members, "Duty", 0.1)
  eui:uiSetAlign(UI.gridlist.Members, "left", "center")
  UI.button["Member.Dismissal"] = eui:uiCreateButton(5, 625 - 130 - 5 - 35, 100, 30, {en = "Dismissal", ar = "\216\183\216\177\216\175"}, var1, UI.label["FactionSection:Overview"])
  UI.button["Member.Promote/Demote"] = eui:uiCreateButton(110, 625 - 130 - 5 - 35, 120, 30, {
    en = "Promote/Demote",
    ar = "\216\170\216\177\217\130\217\138\216\169/\216\174\217\129\216\182"
  }, var1, UI.label["FactionSection:Overview"])
  UI.button["Member.DutyPerks"] = eui:uiCreateButton(235, 625 - 130 - 5 - 35, 120, 30, {
    en = "Duty Perks",
    ar = "\216\167\217\133\216\170\217\138\216\167\216\178\216\167\216\170 \216\167\217\132\216\175\217\138\217\136\216\170\217\138"
  }, var1, UI.label["FactionSection:Overview"])
  UI.button["Member.SetLevel"] = eui:uiCreateButton(360, 625 - 130 - 5 - 35, 100, 30, {
    en = "Set Leader",
    ar = "\216\170\216\185\217\138\217\138\217\134 \217\130\216\167\216\166\216\175"
  }, var1, UI.label["FactionSection:Overview"])
  UI.button["Member.AddMember"] = eui:uiCreateButton(465, 625 - 130 - 5 - 35, 30, 30, "+", var1, UI.label["FactionSection:Overview"])
  eui:uiSetProperty(UI.button["Member.Dismissal"], "HoverTextColor", tocolor(255, 48, 48))
  eui:uiSetProperty(UI.button["Member.Promote/Demote"], "HoverTextColor", (eui:uiGetThemeColor("primary")))
  eui:uiSetProperty(UI.button["Member.DutyPerks"], "HoverTextColor", (eui:uiGetThemeColor("primary")))
  eui:uiSetProperty(UI.button["Member.SetLevel"], "HoverTextColor", (eui:uiGetThemeColor("primary")))
  eui:uiSetProperty(UI.button["Member.AddMember"], "HoverTextColor", (eui:uiGetThemeColor("primary")))
  eui:uiCreateLabel(955 - 150 - 15 - 210, 625 - 130 - 5 - 35, 180, 30, "#00FF00 \226\128\162 #FFFFFFonline   #FF0000 \226\128\162 #FFFFFFoffline a long time ago", tocolor(255, 255, 255, 255), "left", "center", UI.label["FactionSection:Overview"])
  UI.gridlist.TopMembers = eui:uiCreateGridList(0, 0, 955 - 150 - 15, 625 - 130 - 5 - 45, tocolor(20, 20, 20, 0), UI.container.top_members)
  eui:uiGridListAddColumn(UI.gridlist.TopMembers, "#", 0.1)
  eui:uiGridListAddColumn(UI.gridlist.TopMembers, "Name", 0.4)
  eui:uiGridListAddColumn(UI.gridlist.TopMembers, "Points", 0.3)
  eui:uiGridListAddColumn(UI.gridlist.TopMembers, "Last Point At", 0.2)
  eui:uiSetAlign(UI.gridlist.TopMembers, "left", "center")
  eui:uiSetProperty(UI.gridlist.TopMembers, "row_height", 25)
  UI.label["FactionSection:Notes"] = UI.container.notes
  eui:uiSetVisible(UI.label["FactionSection:Notes"], false)
  UI.memo.Notes = eui:uiCreateMemo(5, 5, 955 - 150 - 15 - 10, 625 - 130 - 5 - 50, "", var1, UI.label["FactionSection:Notes"])
  eui:uiSetProperty(UI.memo.Notes, "TextColor", tocolor(255, 255, 255, 255))
  UI.button["Notes.Save"] = eui:uiCreateButton(5, 625 - 130 - 5 - 40, 120, 35, {
    en = "Save Changes",
    ar = "\216\173\217\129\216\184 \216\167\217\132\216\170\216\186\217\138\217\138\216\177\216\167\216\170"
  }, var1, UI.label["FactionSection:Notes"])
  UI.label["FactionSection:Ranks"] = UI.container.ranks
  eui:uiSetVisible(UI.label["FactionSection:Ranks"], false)
  UI.gridlist.FactionRanks = eui:uiCreateGridList(5, 5, (955 - 150 - 15) / 2 - 10, 625 - 130 - 5 - 10, tocolor(6, 9, 14, 235), UI.label["FactionSection:Ranks"])
  eui:uiGridListAddColumn(UI.gridlist.FactionRanks, "Ranks", 0.8)
  eui:uiGridListAddColumn(UI.gridlist.FactionRanks, "", 0.2)
  UI.edit.RankName = eui:uiCreateEdit((955 - 150 - 15) / 2 + 5, 10, (955 - 150 - 15) / 2 - 10, 25, "", "Rank Name", _, UI.label["FactionSection:Ranks"])
  UI.edit.RankWage = eui:uiCreateEdit((955 - 150 - 15) / 2 + 5, 40, (955 - 150 - 15) / 2 - 10, 25, "", "Rank Wage", _, UI.label["FactionSection:Ranks"])
  UI.gridlist.FactionRankPermissions = eui:uiCreateGridList((955 - 150 - 15) / 2 + 5, 80, (955 - 150 - 15) / 2 - 10, 625 - 130 - 5 - 130, tocolor(6, 9, 14, 235), UI.label["FactionSection:Ranks"])
  eui:uiGridListAddColumn(UI.gridlist.FactionRankPermissions, "Permissions", 1)
  UI.button["Ranks.Save"] = eui:uiCreateButton(955 - 150 - 15 - 145, 625 - 130 - 5 - 35, 140, 30, {
    en = "Save Changes",
    ar = "\216\173\217\129\216\184 \216\167\217\132\216\170\216\186\217\138\217\138\216\177\216\167\216\170"
  }, var1, UI.label["FactionSection:Ranks"])
  UI.label["FactionSection:Management"] = UI.container.management
  eui:uiSetVisible(UI.label["FactionSection:Management"], false)
  UI.label.FactionBank = eui:uiCreateLabel(10, 15, 232, 60, "", tocolor(255, 255, 255, 255), "left", "top", UI.label["FactionSection:Management"])
  eui:uiSetFont(UI.label.FactionBank, "default-large")
  eui:uiCreateLabel(10, 90, 232, 20, "Faction Logo:", tocolor(255, 255, 255, 255), "left", "top", UI.label["FactionSection:Management"])
  UI.edit.LogoURL = eui:uiCreateEdit(10, 115, 360, 20, "", "URL (.png)", _, UI.label["FactionSection:Management"])
  UI.button["Logo.Load"] = eui:uiCreateButton(10, 140, 360, 30, "Load Logo", var1, UI.label["FactionSection:Management"])
  UI.container.faction_gov = eui:uiCreateContainer(10, 200, 400, 220, UI.label["FactionSection:Management"])
  eui:uiCreateLabel(0, 0, 232, 20, "Faction GOV:", tocolor(255, 255, 255, 255), "left", "top", UI.container.faction_gov)
  UI.edit.GovURL = eui:uiCreateEdit(0, 25, 400, 25, "", "URL (.png)", _, UI.container.faction_gov)
  UI.button["GOV.Load"] = eui:uiCreateButton(0, 60, 400, 30, "Load Gov", var1, UI.container.faction_gov)
  UI.image.FactionGov = eui:uiCreateImage(0, 100, 400, 120, ":factions-logos/logos/default.png", UI.container.faction_gov)
  eui:uiSetVisible(UI.image.FactionGov, false)
  UI.tabpanel.properties = eui:uiCreateTabPanel(5, 40, 955 - 150 - 15 - 10, 625 - 130 - 5 - 40, "", tocolor(30, 30, 30, 0), UI.container.properties)
  eui:uiSetProperty(UI.tabpanel.properties, "title_shown", false)
  eui:uiSetProperty(UI.tabpanel.properties, "title_height", 0)
  eui:uiSetProperty(UI.tabpanel.properties, "tabs_bar_color", tocolor(29, 32, 37, 0))
  eui:uiSetProperty(UI.tabpanel.properties, "tab_selected_color", var1)
  eui:uiSetProperty(UI.tabpanel.properties, "tab_hovered_color", var1)
  UI.tab["properties:vehicles"] = eui:uiCreateTab({
    en = "Vehicles",
    ar = "\216\167\217\132\217\133\216\177\217\131\216\168\216\167\216\170"
  }, "Vehicles", UI.tabpanel.properties)
  UI.gridlist.Vehicles = eui:uiCreateGridList(0, 10, 955 - 150 - 15 - 10, 625 - 130 - 5 - 40 - 35 - 20, tocolor(20, 20, 20, 0), UI.tab["properties:vehicles"])
  eui:uiGridListAddColumn(UI.gridlist.Vehicles, "ID", 0.1)
  eui:uiGridListAddColumn(UI.gridlist.Vehicles, "Name", 0.45)
  eui:uiGridListAddColumn(UI.gridlist.Vehicles, "Plate", 0.15)
  eui:uiGridListAddColumn(UI.gridlist.Vehicles, "Location", 0.3)
  eui:uiSetAlign(UI.gridlist.Vehicles, "left", "center")
  UI.button["Vehicles.RespawnAll"] = eui:uiCreateButton(955 - 150 - 15 - 160, 625 - 130 - 5 - 40 - 35, 150, 30, {
    en = "Respawn All Vehicles",
    ar = "\216\177\217\138\216\179\216\168\216\167\217\136\217\134 \216\172\217\133\217\138\216\185 \216\167\217\132\217\133\216\177\217\131\216\168\216\167\216\170"
  }, var1, UI.tab["properties:vehicles"])
  eui:uiCreateLabel(955 - 150 - 15 - 160 - 200, 625 - 130 - 5 - 40 - 35, 180, 30, {
    en = "Respawn can be done every 30 minutes",
    ar = "\217\138\217\133\217\131\217\134 \216\185\217\133\217\132 \216\177\217\138\216\179\216\168\216\167\217\136\217\134 \217\131\217\132 30 \216\175\217\130\217\138\217\130\216\169"
  }, tocolor(255, 255, 255, 150), "right", "center", UI.tab["properties:vehicles"])
  UI.label["Vehicles.Limit"] = eui:uiCreateLabel(0, 625 - 130 - 5 - 40 - 35, 500, 30, "", tocolor(255, 255, 255, 150), "left", "center", UI.tab["properties:vehicles"])
  eui:uiSetFont(UI.label["Vehicles.Limit"], "default-large")
  UI.tab["properties:interiors"] = eui:uiCreateTab({
    en = "Interiors",
    ar = "\216\167\217\132\216\168\217\138\217\136\216\170 \217\136\216\167\217\132\217\133\216\173\217\132\216\167\216\170"
  }, "Interiors", UI.tabpanel.properties)
  UI.gridlist["properties:interiors"] = eui:uiCreateGridList(0, 10, 955 - 150 - 15 - 10, 625 - 130 - 5 - 40 - 35 - 20, tocolor(20, 20, 20, 0), UI.tab["properties:interiors"])
  eui:uiGridListAddColumn(UI.gridlist["properties:interiors"], "ID", 0.15)
  eui:uiGridListAddColumn(UI.gridlist["properties:interiors"], "Name", 0.5)
  eui:uiSetAlign(UI.gridlist["properties:interiors"], "left", "center")
  UI.label["FactionSection:Duty"] = UI.container.duty
  eui:uiSetVisible(UI.label["FactionSection:Duty"], false)
  UI.tabpanel.Duty = eui:uiCreateTabPanel(5, 40, 955 - 150 - 15 - 10, 625 - 130 - 5 - 40, "", tocolor(30, 30, 30, 0), UI.label["FactionSection:Duty"])
  eui:uiSetProperty(UI.tabpanel.Duty, "title_shown", false)
  eui:uiSetProperty(UI.tabpanel.Duty, "title_height", 0)
  eui:uiSetProperty(UI.tabpanel.Duty, "tabs_bar_color", tocolor(29, 32, 37, 0))
  eui:uiSetProperty(UI.tabpanel.Duty, "tab_selected_color", var1)
  eui:uiSetProperty(UI.tabpanel.Duty, "tab_hovered_color", var1)
  UI.tab.DutyLocations = eui:uiCreateTab("Duty Locations", "Duty Locations", UI.tabpanel.Duty)
  UI.gridlist.DutyLocations = eui:uiCreateGridList(0, 10, 955 - 150 - 15 - 10, 625 - 130 - 5 - 40 - 35 - 20, tocolor(20, 20, 20, 0), UI.tab.DutyLocations)
  eui:uiGridListAddColumn(UI.gridlist.DutyLocations, "ID", 0.1)
  eui:uiGridListAddColumn(UI.gridlist.DutyLocations, "Name", 0.2)
  eui:uiGridListAddColumn(UI.gridlist.DutyLocations, "Radius", 0.1)
  eui:uiGridListAddColumn(UI.gridlist.DutyLocations, "Interior", 0.1)
  eui:uiGridListAddColumn(UI.gridlist.DutyLocations, "Dimension", 0.15)
  eui:uiGridListAddColumn(UI.gridlist.DutyLocations, "X, Y, Z", 0.35)
  eui:uiSetAlign(UI.gridlist.DutyLocations, "left", "center")
  UI.button["DL:Add"] = eui:uiCreateButton(0, 625 - 130 - 5 - 40 - 35, 150, 30, {
    en = "Add Location",
    ar = "\216\165\216\182\216\167\217\129\216\169 \217\133\217\131\216\167\217\134"
  }, var1, UI.tab.DutyLocations)
  UI.button["DL:Remove"] = eui:uiCreateButton(155, 625 - 130 - 5 - 40 - 35, 150, 30, {
    en = "Remove Location",
    ar = "\216\173\216\176\217\129 \216\167\217\132\217\133\217\131\216\167\217\134"
  }, var1, UI.tab.DutyLocations)
  UI.button["DL:Edit"] = eui:uiCreateButton(310, 625 - 130 - 5 - 40 - 35, 150, 30, {
    en = "Edit Duty Location",
    ar = "\216\170\216\185\216\175\217\138\217\132 \216\167\217\132\217\133\217\131\216\167\217\134"
  }, var1, UI.tab.DutyLocations)
  UI.tab.DutyVehicleLocations = eui:uiCreateTab("Duty Vehicle Locations", "Duty Vehicle Locations", UI.tabpanel.Duty)
  UI.gridlist.DutyVehicleLocations = eui:uiCreateGridList(0, 10, 955 - 150 - 15 - 10, 625 - 130 - 5 - 40 - 35 - 20, tocolor(20, 20, 20, 0), UI.tab.DutyVehicleLocations)
  eui:uiGridListAddColumn(UI.gridlist.DutyVehicleLocations, "ID", 0.2)
  eui:uiGridListAddColumn(UI.gridlist.DutyVehicleLocations, "Vehicle ID", 0.4)
  eui:uiGridListAddColumn(UI.gridlist.DutyVehicleLocations, "Vehicle Name", 0.4)
  eui:uiSetAlign(UI.gridlist.DutyVehicleLocations, "left", "center")
  UI.button["DVL:Add"] = eui:uiCreateButton(0, 625 - 130 - 5 - 40 - 35, 150, 30, "Add Vehicle Location", var1, UI.tab.DutyVehicleLocations)
  UI.button["DVL:Remove"] = eui:uiCreateButton(155, 625 - 130 - 5 - 40 - 35, 170, 30, "Remove Vehicle Location", var1, UI.tab.DutyVehicleLocations)
  UI.tab.DutyPerks = eui:uiCreateTab("Duty Perks", "Duty Perks", UI.tabpanel.Duty)
  UI.gridlist.DutyPerks = eui:uiCreateGridList(0, 10, 955 - 150 - 15 - 10, 625 - 130 - 5 - 40 - 35 - 20, tocolor(20, 20, 20, 0), UI.tab.DutyPerks)
  eui:uiGridListAddColumn(UI.gridlist.DutyPerks, "ID", 0.2)
  eui:uiGridListAddColumn(UI.gridlist.DutyPerks, "Name", 0.8)
  eui:uiSetAlign(UI.gridlist.DutyPerks, "left", "center")
  UI.button["DP:Add"] = eui:uiCreateButton(0, 625 - 130 - 5 - 40 - 35, 150, 30, "Add New Duty", var1, UI.tab.DutyPerks)
  UI.button["DP:Remove"] = eui:uiCreateButton(155, 625 - 130 - 5 - 40 - 35, 150, 30, "Remove Duty", var1, UI.tab.DutyPerks)
  UI.button["DP:Edit"] = eui:uiCreateButton(310, 625 - 130 - 5 - 40 - 35, 150, 30, "Edit Duty Perks", var1, UI.tab.DutyPerks)
  UI.label["FactionSection:Logs"] = UI.container.logs
  eui:uiSetVisible(UI.label["FactionSection:Logs"], false)
  UI.gridlist.Logs = eui:uiCreateGridList(5, 5, 955 - 150 - 15 - 10, 625 - 130 - 5 - 10, tocolor(20, 20, 20, 0), UI.label["FactionSection:Logs"])
  eui:uiGridListAddColumn(UI.gridlist.Logs, "Log", 0.82)
  eui:uiGridListAddColumn(UI.gridlist.Logs, "Date", 0.18)
  eui:uiSetAlign(UI.gridlist.Logs, "left", "center")
  UI.tabpanel.recruitment = eui:uiCreateTabPanel(5, 40, 955 - 150 - 15 - 10, 625 - 130 - 5 - 40, "", tocolor(30, 30, 30, 0), UI.container.recruitment)
  eui:uiSetProperty(UI.tabpanel.recruitment, "title_shown", false)
  eui:uiSetProperty(UI.tabpanel.recruitment, "title_height", 0)
  eui:uiSetProperty(UI.tabpanel.recruitment, "tabs_bar_color", tocolor(29, 32, 37, 0))
  eui:uiSetProperty(UI.tabpanel.recruitment, "tab_selected_color", var1)
  eui:uiSetProperty(UI.tabpanel.recruitment, "tab_hovered_color", var1)
  UI.tab.recruitment_form = eui:uiCreateTab("Recruitment Form", "Recruitment Form", UI.tabpanel.recruitment)
  UI.gridlist.recruitment_form = eui:uiCreateGridList(0, 10, 955 - 150 - 15 - 10, 625 - 130 - 5 - 40 - 35 - 20, tocolor(20, 20, 20, 0), UI.tab.recruitment_form)
  eui:uiGridListAddColumn(UI.gridlist.recruitment_form, "#", 0.1)
  eui:uiGridListAddColumn(UI.gridlist.recruitment_form, "Question", 0.5)
  eui:uiGridListAddColumn(UI.gridlist.recruitment_form, "Type", 0.2)
  eui:uiGridListAddColumn(UI.gridlist.recruitment_form, "Required", 0.2)
  eui:uiSetAlign(UI.gridlist.recruitment_form, "left", "center")
  UI.button.recruitment_save_changes = eui:uiCreateButton(955 - 150 - 15 - 160, 625 - 130 - 5 - 40 - 35, 150, 30, {
    en = "Save Changes",
    ar = "\216\173\217\129\216\184 \216\167\217\132\216\170\216\186\217\138\217\138\216\177\216\167\216\170"
  }, var1, UI.tab.recruitment_form)
  UI.checkbox.open_recruitment = eui:uiCreateSwitch(10, 625 - 130 - 5 - 40 - 25, 150, 20, {
    en = "Open Recruitment",
    ar = "\217\129\216\170\216\173 \216\167\217\132\216\170\217\136\216\184\217\138\217\129"
  }, false, _, UI.tab.recruitment_form)
  UI.tab.recruitment_applications = eui:uiCreateTab("Applications", "Applications", UI.tabpanel.recruitment)
  UI.gridlist.recruitment_applications = eui:uiCreateGridList(0, 10, 955 - 150 - 15 - 10, 625 - 130 - 5 - 40 - 35 - 20, tocolor(20, 20, 20, 0), UI.tab.recruitment_applications)
  eui:uiGridListAddColumn(UI.gridlist.recruitment_applications, "#", 0.1)
  eui:uiGridListAddColumn(UI.gridlist.recruitment_applications, "Applicant", 0.5)
  eui:uiGridListAddColumn(UI.gridlist.recruitment_applications, "Status", 0.2)
  eui:uiGridListAddColumn(UI.gridlist.recruitment_applications, "Data", 0.2)
  eui:uiSetAlign(UI.gridlist.recruitment_applications, "left", "center")
  UI.gridlist.tasks = eui:uiCreateGridList(0, 0, 955 - 150 - 15, 625 - 130 - 5 - 45, tocolor(20, 20, 20, 0), UI.container.tasks)
  eui:uiGridListAddColumn(UI.gridlist.tasks, "", 0.1)
  eui:uiGridListAddColumn(UI.gridlist.tasks, "Description", 0.5)
  eui:uiGridListAddColumn(UI.gridlist.tasks, "Completion", 0.2)
  eui:uiGridListAddColumn(UI.gridlist.tasks, "Points", 0.1)
  eui:uiSetAlign(UI.gridlist.tasks, "left", "center")
  eui:uiSetProperty(UI.gridlist.tasks, "row_height", 30)
  UI.window["Promote/Demote"] = eui:uiCreateWindow(false, false, 400, 380, {
    en = "Promote/Demote Member",
    ar = "\216\170\216\177\217\130\217\138\216\169/\216\174\217\129\216\182 \216\167\217\132\216\185\216\182\217\136"
  })
  eui:uiWindowSetMovable(UI.window["Promote/Demote"], false)
  eui:uiSetVisible(UI.window["Promote/Demote"], false)
  UI.gridlist["Promote/Demote"] = eui:uiCreateGridList(0, 50, 400, 300, tocolor(10, 10, 10, 0), UI.window["Promote/Demote"])
  eui:uiGridListAddColumn(UI.gridlist["Promote/Demote"], "Double Click To Select", 0.7)
  eui:uiGridListAddColumn(UI.gridlist["Promote/Demote"], "", 0.3)
  eui:uiSetAlign(UI.gridlist["Promote/Demote"], "left", "center")
  UI.button["CancelPromote/Demote"] = eui:uiCreateButton(5, 355, 390, 25, {en = "Cancel", ar = "\216\165\217\132\216\186\216\167\216\161"}, _, UI.window["Promote/Demote"])
  UI.window.DutyPerks = eui:uiCreateWindow(false, false, 400, 350, {
    en = "Duty Perks For Member",
    ar = "\216\167\217\133\216\170\217\138\216\167\216\178\216\167\216\170 \216\167\217\132\216\175\217\138\217\136\216\170\217\138 \217\132\217\132\216\185\216\182\217\136"
  })
  eui:uiWindowSetMovable(UI.window.DutyPerks, false)
  eui:uiSetVisible(UI.window.DutyPerks, false)
  UI.checklist.DutyPerks = eui:uiCreateCheckList(0, 50, 400, 265, tocolor(10, 10, 10, 0), UI.window.DutyPerks)
  UI.button["Member.DutyPerks.Save"] = eui:uiCreateButton(5, 320, 390, 30, {
    en = "Save Changes",
    ar = "\216\173\217\129\216\184 \216\167\217\132\216\170\216\186\217\138\217\138\216\177\216\167\216\170"
  }, _, UI.window.DutyPerks)
  UI.window.AddMember = eui:uiCreateWindow(false, false, 250, 150, {
    en = "Add Member",
    ar = "\216\165\216\182\216\167\217\129\216\169 \216\185\216\182\217\136"
  })
  eui:uiWindowSetMovable(UI.window.AddMember, false)
  eui:uiSetVisible(UI.window.AddMember, false)
  UI.edit.AddMember = eui:uiCreateEdit(10, 50, 230, 30, "", {
    en = "Character Name",
    ar = "\216\167\216\179\217\133 \216\167\217\132\216\180\216\174\216\181\217\138\216\169"
  }, _, UI.window.AddMember)
  UI.label.SearchPlayer = eui:uiCreateLabel(5, 85, 240, 15, "...", tocolor(255, 255, 255, 240), "left", "top", UI.window.AddMember)
  eui:uiSetAlign(UI.label.SearchPlayer, "center", "center")
  UI.button.AddMember = eui:uiCreateButton(5, 115, 119, 30, {en = "Add", ar = "\216\165\216\182\216\167\217\129\216\169"}, _, UI.window.AddMember)
  UI.button.CloseAddMember = eui:uiCreateButton(126, 115, 119, 30, {en = "Close", ar = "\216\165\216\186\217\132\216\167\217\130"}, _, UI.window.AddMember)
  UI.window.Invoice = eui:uiCreateRectangle(eui:uiGetReferenceScreenSize() - 300 - 10, false, 300, 400, tocolor(15, 15, 15, 240), true, true, true, true)
  eui:uiSetVisible(UI.window.Invoice, false)
  UI.image.InvoiceLogo = eui:uiCreateImage(10, 10, 50, 50, ":factions-logos/logos/default.png", UI.window.Invoice)
  UI.label.Title = eui:uiCreateLabel(0, 15, 280, 20, {
    en = "INVOICE",
    ar = "\217\129\216\167\216\170\217\136\216\177\216\169"
  }, tocolor(255, 255, 255, 255), "right", "top", UI.window.Invoice)
  eui:uiSetFont(UI.label.Title, "default-large")
  UI.label.InvoiceFactionName = eui:uiCreateLabel(10, 70, 232, 20, "", tocolor(255, 255, 255, 255), "left", "top", UI.window.Invoice)
  UI.label.InvoiceBillInfo = eui:uiCreateLabel(10, 95, 232, 30, "", tocolor(255, 255, 255, 255), "left", "top", UI.window.Invoice)
  UI.gridlist.Invoice = eui:uiCreateGridList(0, 140, 300, 180, tocolor(10, 10, 10), UI.window.Invoice)
  eui:uiGridListAddColumn(UI.gridlist.Invoice, "DESCRIPTION", 0.7)
  eui:uiGridListAddColumn(UI.gridlist.Invoice, "AMOUNT", 0.3)
  eui:uiSetAlign(UI.gridlist.Invoice, "left", "center")
  eui:uiSetProperty(UI.gridlist.Invoice, "Disabled", "True")
  eui:uiSetFont(UI.gridlist.Invoice, "default")
  UI.label.InvoiceTotalAmount = eui:uiCreateLabel(10, 330, 232, 15, "", tocolor(255, 255, 255, 255), "left", "top", UI.window.Invoice)
  UI.button.InvoicePay = eui:uiCreateButton(110, 365, 80, 30, {en = "Pay", ar = "\216\175\217\129\216\185"}, tocolor(0, 0, 0), UI.window.Invoice)
end
addEventHandler("onClientUIReady", resourceRoot, UIKitReady)
addEventHandler("onClientUIKitReady", root, UIKitReady)
function showInvoice(arg0, arg1, arg2, arg3)
  var0 = arg1
  eui:uiSetVisible(UI.window.Invoice, true)
  eui:uiSetText(UI.label.InvoiceFactionName, arg0)
  eui:uiSetText(UI.label.InvoiceBillInfo, "BILL TO:\n" .. tostring((getElementData(localPlayer, "character:name"))) .. "\n")
  eui:uiGridListClear(UI.gridlist.Invoice)
  for forvar9, forvar10 in ipairs(arg3) do
    eui:uiGridListSetItemText(UI.gridlist.Invoice, eui:uiGridListAddRow(UI.gridlist.Invoice), 1, tostring(forvar10[1]))
    eui:uiGridListSetItemText(UI.gridlist.Invoice, eui:uiGridListAddRow(UI.gridlist.Invoice), 2, "$" .. tostring(forvar10[2]))
  end
  var1 = 0 + forvar10[2]
  eui:uiSetText(UI.label.InvoiceTotalAmount, "TOTAL AMOUNT:  #00ff00$" .. tostring(0 + forvar10[2]))
  eui:uiStaticImageLoadImage(UI.image.InvoiceLogo, arg2)
end
addEvent("factions:showInvoice", true)
addEventHandler("factions:showInvoice", root, function(arg0, arg1, arg2)
  var0 = arg2
  showInvoice(arg0.Name, arg0.ID, fromJSON(arg0.FactionData).Logo and ":factions-logos/logos/" .. tostring(arg0.ID) .. ".png" or ":factions-logos/logos/default.png", arg1)
end)
addEvent("factions:invoice:show", true)
addEventHandler("factions:invoice:show", root, function(arg0, arg1, arg2, arg3, arg4)
  showInvoice(arg1, arg2, arg3, arg4)
  var0 = arg0
end)
addEvent("factions:onPlayerPayInvoice", true)
addEventHandler("factions:onPlayerPayInvoice", root, function(arg0)
  if arg0 then
    outputChatBox("ERROR: try again later.", 255, 0, 0)
    return
  end
  eui:uiSetVisible(UI.window.Invoice, false)
  eui:uiSetProperty(UI.button.InvoicePay, "Disabled", "False")
end)
function closeUIWindows(arg0)
  eui:uiSetVisible(UI.window[1], false)
  eui:uiSetVisible(UI.window.SelectFaction, false)
  eui:uiSetVisible(UI.window.FactionWindow, false)
  eui:uiSetVisible(UI.window["Promote/Demote"], false)
  eui:uiSetVisible(UI.window.DutyPerks, false)
  eui:uiSetVisible(UI.window.AddMember, false)
  eui:uiSetVisible(UI.window.Invoice, false)
  if eventName == "onClientPlayerQuitFromCharacter" then
    var0.factions_selection = {}
  end
end
addEvent("onClientPlayerQuitFromCharacter", true)
addEventHandler("onClientPlayerQuitFromCharacter", localPlayer, closeUIWindows)
addEventHandler("onClientPlayerWasted", localPlayer, closeUIWindows)
addEvent("factions:returnBackToMainWindow", true)
addEventHandler("factions:returnBackToMainWindow", root, function()
  eui:uiSetVisible(UI.window.FactionWindow, true)
end)
addEvent("duty:sendPerksForMember", true)
addEventHandler("duty:sendPerksForMember", root, function(arg0, arg1)
  eui:uiCheckListClear(UI.checklist.DutyPerks)
  for forvar6, forvar7 in ipairs(arg0) do
    eui:uiCheckListAddRow(UI.checklist.DutyPerks, tostring(forvar7.Name), eui:uiGetThemeColor("primary"), arg1[forvar7.Name] or false)
  end
end)
addEventHandler("onClientUIMenuSelectChange", root, function(arg0, arg1)
  if source == UI.menu.main then
    currentFactionSection = eui:uiMenuGetItemID(source, arg0)
    if eui:uiMenuGetItemID(source, arg0) == "tasks" then
      triggerServerEvent("factions:tasks:get", localPlayer, tonumber(currentFactionID))
    else
      triggerServerEvent("factions:callFactionInformation", localPlayer, tonumber(currentFactionID), string.lower((eui:uiMenuGetItemID(source, arg0))))
    end
  end
end)
currentFactionSection = "Overview"
addEventHandler("onClientUIClick", root, function()
  if source == UI.button[1] then
    eui:uiSetVisible(UI.window[1], false)
    showCursor(false)
  elseif isLabelButton[source] then
    if isLabelButton[source] == "ChangeFaction" then
      eui:uiSetVisible(UI.window.FactionWindow, false)
      eui:uiSetVisible(UI.window["Promote/Demote"], false)
      eui:uiSetVisible(UI.window.DutyPerks, false)
      eui:uiSetVisible(UI.window.AddMember, false)
      eui:uiSetVisible(UI.window.SelectFaction, true)
    elseif currentFactionSection ~= isLabelButton[source] then
      eui:uiSetVisible(UI.label["FactionSection:" .. tostring(currentFactionSection)], false)
      eui:uiSetColor(UI.label["Section:" .. tostring(currentFactionSection)], 255, 255, 255, 240)
      currentFactionSection = isLabelButton[source]
      eui:uiSetVisible(UI.label["FactionSection:" .. tostring(currentFactionSection)], true)
      eui:uiSetColor(source, 255, 55, 95, 255)
      triggerServerEvent("factions:callFactionInformation", localPlayer, tonumber(currentFactionID), string.lower("members"))
    end
  elseif source == UI.button["Notes.Save"] then
    triggerServerEvent("factions:saveNote", localPlayer, currentFactionInfo, eui:uiGetText(UI.memo.Notes))
  elseif source == UI.button["Vehicles.RespawnAll"] then
    triggerServerEvent("factions:respawnAllVehicles", localPlayer, currentFactionID)
  elseif source == UI.button["Member.Dismissal"] then
    if eui:uiGridListGetSelectedItem(UI.gridlist.Members) ~= -1 then
      triggerServerEvent("factions:removeMemberFromFaction", localPlayer, currentFactionID, (eui:uiGridListGetItemData(UI.gridlist.Members, eui:uiGridListGetSelectedItem(UI.gridlist.Members), 1)))
    end
  elseif source == UI.button["Member.Promote/Demote"] then
    if eui:uiGridListGetSelectedItem(UI.gridlist.Members) ~= -1 then
      eui:uiSetVisible(UI.window["Promote/Demote"], true)
      eui:uiBringToFront(UI.window["Promote/Demote"])
      eui:uiGridListSetItemColor(UI.gridlist["Promote/Demote"], tonumber((eui:uiGridListGetItemData(UI.gridlist.Members, eui:uiGridListGetSelectedItem(UI.gridlist.Members), 2))) - 1, 1, tocolor(0, 255, 0))
      eui:uiSetVisible(UI.window.FactionWindow, false)
    else
      eui:uiSetVisible(UI.window["Promote/Demote"], false)
    end
  elseif source == UI.gridlist.Members then
    if eui:uiGridListGetSelectedItem(UI.gridlist.Members) ~= -1 then
      if eui:uiGridListGetItemText(UI.gridlist.Members, eui:uiGridListGetSelectedItem(UI.gridlist.Members), 4) == "Leader" then
        eui:uiSetText(UI.button["Member.SetLevel"], {
          en = "Set Member",
          ar = "\216\170\216\185\217\138\217\138\217\134 \216\185\216\182\217\136"
        })
      else
        eui:uiSetText(UI.button["Member.SetLevel"], {
          en = "Set Leader",
          ar = "\216\170\216\185\217\138\217\138\217\134 \217\130\216\167\216\166\216\175"
        })
      end
    end
  elseif source == UI.button["Member.SetLevel"] then
    if eui:uiGridListGetSelectedItem(UI.gridlist.Members) ~= -1 then
      triggerServerEvent("factions:changeMemberLevel", localPlayer, currentFactionInfo, (eui:uiGridListGetItemData(UI.gridlist.Members, eui:uiGridListGetSelectedItem(UI.gridlist.Members), 1)))
    else
      eui:uiSetVisible(UI.window["Promote/Demote"], false)
    end
  elseif source == UI.button["Member.DutyPerks"] then
    if eui:uiGridListGetSelectedItem(UI.gridlist.Members) ~= -1 then
      triggerServerEvent("duty:requestPerksForMember", localPlayer, eui:uiGridListGetItemData(UI.gridlist.Members, eui:uiGridListGetSelectedItem(UI.gridlist.Members), 1), currentFactionID)
      eui:uiSetVisible(UI.window.DutyPerks, true)
      eui:uiBringToFront(UI.window.DutyPerks)
      currentMemberID = eui:uiGridListGetItemData(UI.gridlist.Members, eui:uiGridListGetSelectedItem(UI.gridlist.Members), 1)
    end
  elseif source == UI.button["Member.DutyPerks.Save"] then
    eui:uiSetVisible(UI.window.DutyPerks, false)
    for forvar4, forvar5 in ipairs(eui:uiCheckListGetSelectedItems(UI.checklist.DutyPerks) or {}) do
      ({})[eui:uiCheckListGetItemText(UI.checklist.DutyPerks, forvar5)] = true
    end
    triggerServerEvent("duty:saveFactionPerksForMember", localPlayer, currentMemberID, currentFactionID, {})
  elseif source == UI.button["DP:Add"] then
    eui:uiSetVisible(UI.window.FactionWindow, false)
    triggerEvent("duty:req.AddDuty", localPlayer, currentFactionID)
  elseif source == UI.button["DP:Remove"] then
    if eui:uiGridListGetSelectedItem(UI.gridlist.DutyPerks) ~= -1 then
      triggerServerEvent("duty:removeDuty", localPlayer, eui:uiGridListGetItemText(UI.gridlist.DutyPerks, eui:uiGridListGetSelectedItem(UI.gridlist.DutyPerks), 1), currentFactionID)
    end
  elseif source == UI.button["DP:Edit"] then
    if eui:uiGridListGetSelectedItem(UI.gridlist.DutyPerks) ~= -1 then
      eui:uiSetVisible(UI.window.FactionWindow, false)
      triggerEvent("duty:req.EditDuty", localPlayer, currentFactionID, eui:uiGridListGetItemText(UI.gridlist.DutyPerks, eui:uiGridListGetSelectedItem(UI.gridlist.DutyPerks), 1), eui:uiGridListGetItemText(UI.gridlist.DutyPerks, eui:uiGridListGetSelectedItem(UI.gridlist.DutyPerks), 2), unpack((eui:uiGridListGetItemData(UI.gridlist.DutyPerks, eui:uiGridListGetSelectedItem(UI.gridlist.DutyPerks), 1))))
    end
  elseif source == UI.button["DL:Add"] then
    eui:uiSetVisible(UI.window.FactionWindow, false)
    triggerEvent("duty:req.AddDutyLocation", localPlayer, currentFactionID)
  elseif source == UI.button["DL:Remove"] then
    if eui:uiGridListGetSelectedItem(UI.gridlist.DutyLocations) ~= -1 then
      triggerServerEvent("duty:removeDutyLocation", localPlayer, eui:uiGridListGetItemText(UI.gridlist.DutyLocations, eui:uiGridListGetSelectedItem(UI.gridlist.DutyLocations), 1), currentFactionID)
    end
  elseif source == UI.button["DL:Edit"] then
    if eui:uiGridListGetSelectedItem(UI.gridlist.DutyLocations) ~= -1 then
      eui:uiSetVisible(UI.window.FactionWindow, false)
      triggerEvent("duty:req.EditDutyLocation", localPlayer, currentFactionID, eui:uiGridListGetItemText(UI.gridlist.DutyLocations, eui:uiGridListGetSelectedItem(UI.gridlist.DutyLocations), 1), eui:uiGridListGetItemText(UI.gridlist.DutyLocations, eui:uiGridListGetSelectedItem(UI.gridlist.DutyLocations), 2), eui:uiGridListGetItemText(UI.gridlist.DutyLocations, eui:uiGridListGetSelectedItem(UI.gridlist.DutyLocations), 3), eui:uiGridListGetItemText(UI.gridlist.DutyLocations, eui:uiGridListGetSelectedItem(UI.gridlist.DutyLocations), 4), eui:uiGridListGetItemText(UI.gridlist.DutyLocations, eui:uiGridListGetSelectedItem(UI.gridlist.DutyLocations), 5), unpack(split(eui:uiGridListGetItemText(UI.gridlist.DutyLocations, eui:uiGridListGetSelectedItem(UI.gridlist.DutyLocations), 6), ", ")))
    end
  elseif source == UI.button["DVL:Add"] then
    eui:uiSetVisible(UI.window.FactionWindow, false)
    triggerEvent("duty:req.AddDutyVehicleLocation", localPlayer, currentFactionID)
  elseif source == UI.button["DVL:Remove"] then
    if eui:uiGridListGetSelectedItem(UI.gridlist.DutyVehicleLocations) ~= -1 then
      triggerServerEvent("duty:removeDutyVehicleLocation", localPlayer, eui:uiGridListGetItemText(UI.gridlist.DutyVehicleLocations, eui:uiGridListGetSelectedItem(UI.gridlist.DutyVehicleLocations), 1), currentFactionID)
    end
  elseif source == UI.gridlist.FactionRanks then
    if eui:uiGridListGetSelectedItem(source) ~= -1 then
      eui:uiSetText(UI.edit.RankName, tostring(eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1).name))
      eui:uiSetText(UI.edit.RankWage, tostring(eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1).wage))
      if faction_permissions[currentFaction.Type] then
        for forvar5, forvar6 in ipairs(faction_permissions[currentFaction.Type]) do
          if eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1).permissions[forvar6] then
          end
          eui:uiGridListSetItemData(UI.gridlist.FactionRankPermissions, forvar5 - 1, 1, true)
          if true then
            eui:uiGridListSetItemColor(UI.gridlist.FactionRankPermissions, forvar5 - 1, 1, tocolor(0, 255, 0))
          else
            eui:uiGridListSetItemColor(UI.gridlist.FactionRankPermissions, forvar5 - 1, 1, tocolor(255, 0, 0))
          end
        end
      end
    end
  elseif source == UI.button["Ranks.Save"] then
    if 0 < eui:uiGridListGetRowCount(UI.gridlist.FactionRanks) then
      for forvar5 = 0, eui:uiGridListGetRowCount(UI.gridlist.FactionRanks) - 1 do
        table.insert({}, {
          Name = tostring(eui:uiGridListGetItemData(UI.gridlist.FactionRanks, forvar5, 1).name),
          Wage = tonumber(eui:uiGridListGetItemData(UI.gridlist.FactionRanks, forvar5, 1).wage) or 0,
          Permissions = eui:uiGridListGetItemData(UI.gridlist.FactionRanks, forvar5, 1).permissions
        })
      end
      triggerServerEvent("factions:saveRanksChanges", localPlayer, currentFactionInfo, {})
      exports.notifications:output({
        en = "Faction ranks have been saved",
        ar = "\216\170\217\133 \216\173\217\129\216\184 \216\167\217\132\216\177\216\170\216\168"
      }, 4000, "success")
    end
  elseif source == UI.button.CloseAddMember then
    eui:uiSetVisible(UI.window.AddMember, false)
  elseif source == UI.button["Member.AddMember"] then
    eui:uiSetVisible(UI.window.AddMember, true)
    eui:uiBringToFront(UI.window.AddMember)
  elseif source == UI.button.AddMember then
    if eui:uiGetText(UI.edit.AddMember) ~= "" then
      triggerServerEvent("factions:addMemberToFaction", localPlayer, currentFactionInfo, (eui:uiGetText(UI.edit.AddMember)))
      eui:uiSetVisible(UI.window.AddMember, false)
    end
  elseif source == UI.button["Logo.Load"] then
    if string.find(eui:uiGetText(UI.edit.LogoURL), ".png", 1, true) then
      triggerServerEvent("factions:loadFactionLogo", localPlayer, currentFactionInfo, (eui:uiGetText(UI.edit.LogoURL)))
    else
      outputChatBox("ERROR: This URL not allowed.", 255, 0, 0)
    end
  elseif source == UI.button["GOV.Load"] then
    if string.find(eui:uiGetText(UI.edit.GovURL), ".png", 1, true) then
      triggerServerEvent("factions:loadGov", localPlayer, currentFactionInfo, (eui:uiGetText(UI.edit.GovURL)))
    else
      outputChatBox("ERROR: This URL not allowed.", 255, 0, 0)
    end
  elseif source == UI.button.InvoicePay then
    eui:uiSetProperty(UI.button.InvoicePay, "Disabled", "True")
    triggerServerEvent("factions:payInvoice", localPlayer, var0, var1, var2)
  elseif source == UI.button["CancelPromote/Demote"] then
    eui:uiSetVisible(UI.window["Promote/Demote"], false)
    eui:uiSetVisible(UI.window.FactionWindow, true)
  elseif source == UI.button.recruitment_save_changes then
    if currentFaction.recruitment_status == 1 ~= eui:uiSwitchGetSelected(UI.checkbox.open_recruitment) then
      currentFaction.recruitment_status = eui:uiSwitchGetSelected(UI.checkbox.open_recruitment) and 1 or 0
      triggerServerEvent("factions:recruitment:save_changes", localPlayer, currentFactionInfo, (eui:uiSwitchGetSelected(UI.checkbox.open_recruitment)))
    end
  end
end)
SearchResults = {"", ""}
addEventHandler("onClientUITextChange", root, function()
  if source == UI.edit.RankName then
    if eui:uiGridListGetSelectedItem(UI.gridlist.FactionRanks) ~= -1 then
      eui:uiGridListGetItemData(UI.gridlist.FactionRanks, eui:uiGridListGetSelectedItem(UI.gridlist.FactionRanks), 1).name = eui:uiGetText(source)
      eui:uiGridListSetItemText(UI.gridlist.FactionRanks, eui:uiGridListGetSelectedItem(UI.gridlist.FactionRanks), 1, "#" .. tostring(eui:uiGridListGetItemData(UI.gridlist.FactionRanks, eui:uiGridListGetSelectedItem(UI.gridlist.FactionRanks), 1).id) .. " " .. tostring((eui:uiGetText(source))))
      eui:uiGridListSetItemData(UI.gridlist.FactionRanks, eui:uiGridListGetSelectedItem(UI.gridlist.FactionRanks), 1, (eui:uiGridListGetItemData(UI.gridlist.FactionRanks, eui:uiGridListGetSelectedItem(UI.gridlist.FactionRanks), 1)))
    end
  elseif source == UI.edit.RankWage then
    if eui:uiGridListGetSelectedItem(UI.gridlist.FactionRanks) ~= -1 and tonumber((eui:uiGetText(source))) and tonumber((eui:uiGetText(source))) >= 0 then
      eui:uiGridListGetItemData(UI.gridlist.FactionRanks, eui:uiGridListGetSelectedItem(UI.gridlist.FactionRanks), 1).wage = eui:uiGetText(source)
      eui:uiGridListSetItemText(UI.gridlist.FactionRanks, eui:uiGridListGetSelectedItem(UI.gridlist.FactionRanks), 2, "$" .. tostring((eui:uiGetText(source))))
      eui:uiGridListSetItemData(UI.gridlist.FactionRanks, eui:uiGridListGetSelectedItem(UI.gridlist.FactionRanks), 1, (eui:uiGridListGetItemData(UI.gridlist.FactionRanks, eui:uiGridListGetSelectedItem(UI.gridlist.FactionRanks), 1)))
    end
  elseif source == UI.edit.AddMember then
    eui:uiSetText(UI.label.SearchPlayer, "")
    SearchResults = {"", ""}
    if eui:uiGetText(source) ~= "" then
      for forvar4, forvar5 in ipairs(getElementsByType("player")) do
        if getElementData(forvar5, "character:name") and string.find(getElementData(forvar5, "character:name"):lower(), eui:uiGetText(source):lower()) then
          SearchResults = {
            getElementData(forvar5, "character:name"),
            (getElementData(forvar5, "character:id"))
          }
          eui:uiSetText(UI.label.SearchPlayer, "" .. getElementData(forvar5, "character:name") .. " | " .. getElementData(forvar5, "character:id"))
        end
      end
    end
  end
end)
addCommandHandler("factions", function()
  if not getElementData(localPlayer, "character:id") then
    return
  end
  if eui:uiGetVisible(UI.window.SelectFaction) then
    showCursor(false)
    eui:uiSetVisible(UI.window.SelectFaction, false)
    return
  end
  if eui:uiGetVisible(UI.window.FactionWindow) then
    eui:uiSetVisible(UI.window.FactionWindow, false)
    showCursor(false)
    eui:uiSetVisible(UI.window.SelectFaction, false)
    eui:uiSetVisible(UI.window.AddMember, false)
    eui:uiSetVisible(UI.window.DutyPerks, false)
    eui:uiSetVisible(UI.window["Promote/Demote"], false)
  else
    if (getTickCount() - var0) / 1000 < 5 then
      outputChatBox("You can not repeat opening and closing the window in a short time.", 255, 0, 0)
      return
    end
    var0 = getTickCount()
    if #var1.factions_selection == 0 then
      exports.public:loading("factions:get_player_factions", true)
      triggerServerEvent("factions:callPlayerFactions", localPlayer)
    else
      showFaction(currentFactionID)
    end
  end
end, false, false)
bindKey("F2", "down", function()
  executeCommandHandler("factions")
end)
addEvent("factions:showAll", true)
addEventHandler("factions:showAll", root, function(arg0)
  eui:uiSetVisible(UI.window[1], true)
  showCursor(true)
  eui:uiGridListClear(UI.gridlist[1])
  for forvar5, forvar6 in ipairs(arg0) do
    eui:uiGridListSetItemText(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 1, tostring(forvar6.ID))
    eui:uiGridListSetItemText(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 2, tostring(forvar6.Name))
    eui:uiGridListSetItemText(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 3, tostring(({
      "GANG",
      "MAFIA",
      "LAW",
      "GOV",
      "MED",
      "OTHER",
      "NEWS",
      "MECHANIC",
      "ELECTRIC",
      "TRAFFIC",
      "BUSINESS",
      "FAMILY"
    })[(tonumber(forvar6.Type) or 5) + 1]))
  end
end)
function reloadSelectFactionList()
  eui:uiGridListClear(UI.gridlist.SelectFaction)
  for forvar3, forvar4 in ipairs(var0.factions_selection) do
    eui:uiGridListSetItemText(UI.gridlist.SelectFaction, eui:uiGridListAddRow(UI.gridlist.SelectFaction), 1, forvar4.name)
    eui:uiGridListSetItemData(UI.gridlist.SelectFaction, eui:uiGridListAddRow(UI.gridlist.SelectFaction), 1, forvar4.id)
    if tostring(currentFactionID) == tostring(forvar4.id) then
      eui:uiGridListSetItemColor(UI.gridlist.SelectFaction, eui:uiGridListAddRow(UI.gridlist.SelectFaction), 1, (eui:uiGetThemeColor("primary")))
    end
  end
end
addEvent("factions:sendPlayerFactions", true)
addEventHandler("factions:sendPlayerFactions", root, function(arg0)
  var0.factions_selection = arg0
  exports.public:loading("factions:get_player_factions", false)
  if #arg0 > 0 then
  else
    exports.notifications:output({
      en = "Currently you are not in a faction, please join one",
      ar = "\216\173\216\167\217\132\217\138\216\167\217\139 \216\163\217\134\216\170 \217\132\216\179\216\170 \217\129\217\138 \216\163\217\138 \217\129\216\181\217\138\217\132"
    }, 4000, "error", "top")
    return
  end
  reloadSelectFactionList()
  if #var0.factions_selection == 0 then
    eui:uiSetVisible(UI.window.FactionWindow, true)
    showFaction(currentFactionID)
  end
end)
addEventHandler("onClientUIVisibilityChange", root, function(arg0)
  if source == UI.window.SelectFaction and not arg0 then
    showCursor(false)
  end
end)
function showFaction(arg0)
  if #var0.factions_selection > 0 then
    if arg0 then
      for forvar5, forvar6 in ipairs(var0.factions_selection) do
        if tostring(arg0) == tostring(forvar6.id) then
          break
        end
      end
      if not true then
        if tostring(currentFactionID) == tostring(arg0) then
          currentFactionID = nil
          eui:uiSetVisible(UI.window.FactionWindow, false)
        end
        return
      end
    end
    showCursor(true)
    if arg0 then
      triggerServerEvent("factions:callFactionInformation", localPlayer, tonumber(arg0), string.lower("members"))
    else
      triggerServerEvent("factions:callFactionInformation", localPlayer, var0.factions_selection[1].id)
    end
    exports.public:loading("factions:get_faction", true)
  end
end
addEventHandler("onClientUIDoubleClick", root, function()
  if source == UI.gridlist.SelectFaction then
    if eui:uiGridListGetSelectedItem(UI.gridlist.SelectFaction) ~= -1 then
      eui:uiSetVisible(UI.window.SelectFaction, false)
      showFaction((eui:uiGridListGetItemData(UI.gridlist.SelectFaction, eui:uiGridListGetSelectedItem(UI.gridlist.SelectFaction), 1)))
    end
  elseif source == UI.gridlist["Promote/Demote"] then
    if eui:uiGridListGetSelectedItem(source) ~= -1 then
      eui:uiSetVisible(UI.window["Promote/Demote"], false)
      eui:uiSetVisible(UI.window.FactionWindow, true)
      if eui:uiGridListGetSelectedItem(UI.gridlist.Members) ~= -1 then
        triggerServerEvent("factions:changeMemberRank", localPlayer, currentFactionInfo, eui:uiGridListGetItemData(UI.gridlist.Members, eui:uiGridListGetSelectedItem(UI.gridlist.Members), 1), eui:uiGridListGetSelectedItem(source) + 1)
      end
    end
  elseif source == UI.gridlist.FactionRankPermissions then
    if eui:uiGridListGetSelectedItem(UI.gridlist.FactionRanks) ~= -1 and eui:uiGridListGetSelectedItem(source) ~= -1 then
      eui:uiGridListGetItemData(UI.gridlist.FactionRanks, eui:uiGridListGetSelectedItem(UI.gridlist.FactionRanks), 1).permissions[eui:uiGridListGetItemText(source, eui:uiGridListGetSelectedItem(source), 1)] = not eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1)
      eui:uiGridListSetItemData(UI.gridlist.FactionRanks, eui:uiGridListGetSelectedItem(UI.gridlist.FactionRanks), 1, (eui:uiGridListGetItemData(UI.gridlist.FactionRanks, eui:uiGridListGetSelectedItem(UI.gridlist.FactionRanks), 1)))
      eui:uiGridListSetItemData(source, eui:uiGridListGetSelectedItem(source), 1, not eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1))
      if not eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1) then
        eui:uiGridListSetItemColor(source, eui:uiGridListGetSelectedItem(source), 1, tocolor(0, 255, 0))
      else
        eui:uiGridListSetItemColor(source, eui:uiGridListGetSelectedItem(source), 1, tocolor(255, 0, 0))
      end
    end
  elseif source == UI.gridlist.recruitment_applications and eui:uiGridListGetSelectedItem(UI.gridlist.recruitment_applications) ~= -1 then
    triggerServerEvent("factions:recruitment:showApplication", localPlayer, (eui:uiGridListGetItemData(UI.gridlist.recruitment_applications, eui:uiGridListGetSelectedItem(UI.gridlist.recruitment_applications), 1)))
  end
end)
addEvent("factions:sendFactionInformation", true)
addEventHandler("factions:sendFactionInformation", root, function(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12)
  if not arg0 then
    return
  end
  eui:uiSetVisible(UI.window.FactionWindow, true)
  currentFactionID = arg0.ID
  currentFaction = arg0
  currentFactionInfo = arg0.ID
  reloadSelectFactionList()
  currentFactionRanks = fromJSON(arg0.Ranks)
  eui:uiSetText(UI.memo.Notes, tostring(arg0.Note))
  eui:uiGridListClear(UI.gridlist.Members)
  table.sort(arg1, function(arg0, arg1)
    return tonumber(arg0.Rank) > tonumber(arg1.Rank)
  end)
  for forvar20, forvar21 in ipairs(arg1) do
    eui:uiGridListSetItemText(UI.gridlist.Members, eui:uiGridListAddRow(UI.gridlist.Members), 1, forvar21.Name)
    eui:uiGridListSetItemData(UI.gridlist.Members, eui:uiGridListAddRow(UI.gridlist.Members), 1, forvar21.ID)
    eui:uiGridListSetItemText(UI.gridlist.Members, eui:uiGridListAddRow(UI.gridlist.Members), 2, tostring(fromJSON(arg0.Ranks)[tonumber(forvar21.Rank)].Name))
    eui:uiGridListSetItemData(UI.gridlist.Members, eui:uiGridListAddRow(UI.gridlist.Members), 2, forvar21.Rank)
    if tostring(fromJSON(forvar21.Data).LastLogin[1]) .. "/" .. tostring(fromJSON(forvar21.Data).LastLogin[2]) .. "/" .. tostring(fromJSON(forvar21.Data).LastLogin[3]) == tostring(getRealTime().monthday) .. "/" .. tostring(getRealTime().month + 1) .. "/" .. tostring(getRealTime().year + 1900) then
    elseif tonumber(fromJSON(forvar21.Data).LastLogin[2]) == getRealTime().month + 1 then
      if getRealTime().monthday - tonumber(fromJSON(forvar21.Data).LastLogin[1]) >= 10 then
      end
    else
    end
    if getPlayerFromCharacterID(forvar21.ID) then
      eui:uiGridListSetItemColor(UI.gridlist.Members, eui:uiGridListAddRow(UI.gridlist.Members), 1, tocolor(0, 255, 0))
      eui:uiGridListSetItemColor(UI.gridlist.Members, eui:uiGridListAddRow(UI.gridlist.Members), 2, tocolor(0, 255, 0))
      eui:uiGridListSetItemColor(UI.gridlist.Members, eui:uiGridListAddRow(UI.gridlist.Members), 3, tocolor(0, 255, 0))
      eui:uiGridListSetItemColor(UI.gridlist.Members, eui:uiGridListAddRow(UI.gridlist.Members), 4, tocolor(0, 255, 0))
      eui:uiGridListSetItemColor(UI.gridlist.Members, eui:uiGridListAddRow(UI.gridlist.Members), 5, tocolor(0, 255, 0))
      eui:uiGridListSetItemColor(UI.gridlist.Members, eui:uiGridListAddRow(UI.gridlist.Members), 6, tocolor(0, 255, 0))
    else
      eui:uiGridListSetItemColor(UI.gridlist.Members, eui:uiGridListAddRow(UI.gridlist.Members), 1, (tocolor(255, 0, 0)))
      eui:uiGridListSetItemColor(UI.gridlist.Members, eui:uiGridListAddRow(UI.gridlist.Members), 2, (tocolor(255, 0, 0)))
      eui:uiGridListSetItemColor(UI.gridlist.Members, eui:uiGridListAddRow(UI.gridlist.Members), 3, (tocolor(255, 0, 0)))
      eui:uiGridListSetItemColor(UI.gridlist.Members, eui:uiGridListAddRow(UI.gridlist.Members), 4, (tocolor(255, 0, 0)))
      eui:uiGridListSetItemColor(UI.gridlist.Members, eui:uiGridListAddRow(UI.gridlist.Members), 5, (tocolor(255, 0, 0)))
      eui:uiGridListSetItemColor(UI.gridlist.Members, eui:uiGridListAddRow(UI.gridlist.Members), 6, (tocolor(255, 0, 0)))
    end
    eui:uiGridListSetItemText(UI.gridlist.Members, eui:uiGridListAddRow(UI.gridlist.Members), 3, tostring(getRealTime().month + 1 - tonumber(fromJSON(forvar21.Data).LastLogin[2]) .. " months ago"))
    eui:uiGridListSetItemText(UI.gridlist.Members, eui:uiGridListAddRow(UI.gridlist.Members), 4, tostring(forvar21.Level))
    eui:uiGridListSetItemText(UI.gridlist.Members, eui:uiGridListAddRow(UI.gridlist.Members), 5, "$" .. tostring(fromJSON(arg0.Ranks)[tonumber(forvar21.Rank)].Wage))
    eui:uiGridListSetItemText(UI.gridlist.Members, eui:uiGridListAddRow(UI.gridlist.Members), 6, (tostring(fromJSON(forvar21.Data).Duty or "Off duty")))
  end
  eui:uiGridListClear(UI.gridlist.TopMembers)
  table.sort(arg1, function(arg0, arg1)
    return arg0.points > arg1.points
  end)
  for forvar20, forvar21 in ipairs(arg1) do
    eui:uiGridListSetItemText(UI.gridlist.TopMembers, eui:uiGridListAddRow(UI.gridlist.TopMembers), 1, tostring(forvar20))
    eui:uiGridListSetItemText(UI.gridlist.TopMembers, eui:uiGridListAddRow(UI.gridlist.TopMembers), 2, tostring(forvar21.Name))
    eui:uiGridListSetItemText(UI.gridlist.TopMembers, eui:uiGridListAddRow(UI.gridlist.TopMembers), 3, tostring(forvar21.points))
    eui:uiGridListSetItemText(UI.gridlist.TopMembers, eui:uiGridListAddRow(UI.gridlist.TopMembers), 4, forvar21.last_point_at or "")
    if 0 >= forvar21.points then
      eui:uiGridListSetItemColor(UI.gridlist.TopMembers, eui:uiGridListAddRow(UI.gridlist.TopMembers), 3, tocolor(255, 255, 255, 100))
    end
    eui:uiGridListSetItemColor(UI.gridlist.TopMembers, eui:uiGridListAddRow(UI.gridlist.TopMembers), 4, tocolor(255, 255, 255, 100))
  end
  eui:uiSetText(UI.label.FactionTitle, "#" .. tostring(arg0.ID) .. "  " .. tostring((string.format("#%.2X%.2X%.2X", fromJSON(arg0.FactionData).Color[1], fromJSON(arg0.FactionData).Color[2], fromJSON(arg0.FactionData).Color[3]))) .. "" .. tostring(arg0.Name))
  if ({
    "GANG",
    "MAFIA",
    "LAW",
    "GOV",
    "MED",
    "OTHER",
    "NEWS",
    "MECHANIC",
    "ELECTRIC",
    "TRAFFIC",
    "BUSINESS",
    "FAMILY"
  })[(tonumber(arg0.Type) or 5) + 1] == "GANG" or ({
    "GANG",
    "MAFIA",
    "LAW",
    "GOV",
    "MED",
    "OTHER",
    "NEWS",
    "MECHANIC",
    "ELECTRIC",
    "TRAFFIC",
    "BUSINESS",
    "FAMILY"
  })[(tonumber(arg0.Type) or 5) + 1] == "MAFIA" then
    eui:uiSetVisible(UI.button["Vehicles.RespawnAll"], false)
  else
    eui:uiSetVisible(UI.button["Vehicles.RespawnAll"], true)
  end
  if #arg1 ~= 0 then
    eui:uiSetText(UI.label.FactionInfo, {
      en = "" .. tostring((string.format("#%.2X%.2X%.2X", fromJSON(arg0.FactionData).Color[1], fromJSON(arg0.FactionData).Color[2], fromJSON(arg0.FactionData).Color[3]))) .. "\226\128\162 Faction Type \194\187   #FFFFFF" .. tostring(({
        {en = "Gang", ar = "\216\185\216\181\216\167\216\168\216\169"},
        {en = "Mafia", ar = "\217\133\216\167\217\129\217\138\216\167"},
        {
          en = "Law",
          ar = "\217\130\216\167\217\134\217\136\217\134\217\138"
        },
        {en = "Government", ar = "\216\173\217\131\217\136\217\133\217\138"},
        {en = "Medical", ar = "\216\181\216\173\217\138"},
        {en = "Other", ar = "\216\167\216\174\216\177\217\137"},
        {en = "News", ar = "\216\165\216\185\217\132\216\167\217\133"},
        {
          en = "Mechanic",
          ar = "\217\133\217\138\217\131\216\167\217\134\217\138\217\131"
        },
        {
          en = "Electric",
          ar = "\217\131\217\135\216\177\216\168\216\167\216\161"
        },
        {en = "Traffic", ar = "\217\133\216\177\217\136\216\177"},
        {en = "Business", ar = "\216\163\216\185\217\133\216\167\217\132"},
        {en = "Family", ar = "\216\185\216\167\216\166\217\132\216\169"}
      })[(tonumber(arg0.Type) or 5) + 1].en) .. "\n" .. "" .. tostring((string.format("#%.2X%.2X%.2X", fromJSON(arg0.FactionData).Color[1], fromJSON(arg0.FactionData).Color[2], fromJSON(arg0.FactionData).Color[3]))) .. "\226\128\162 Members \194\187   #FFFFFF" .. tostring(#arg1) .. " / " .. tostring(arg0.max_members) .. "   " .. tostring((string.format("#%.2X%.2X%.2X", fromJSON(arg0.FactionData).Color[1], fromJSON(arg0.FactionData).Color[2], fromJSON(arg0.FactionData).Color[3]))) .. "\194\187   #00FF00" .. tostring(0 + 1) .. " online#FFFFFF\n" .. "" .. tostring((string.format("#%.2X%.2X%.2X", fromJSON(arg0.FactionData).Color[1], fromJSON(arg0.FactionData).Color[2], fromJSON(arg0.FactionData).Color[3]))) .. "\226\128\162 Color (RGB) \194\187   #FFFFFF(" .. tostring(fromJSON(arg0.FactionData).Color[1]) .. ", " .. tostring(fromJSON(arg0.FactionData).Color[2]) .. ", " .. tostring(fromJSON(arg0.FactionData).Color[3]) .. ")",
      ar = "" .. tostring((string.format("#%.2X%.2X%.2X", fromJSON(arg0.FactionData).Color[1], fromJSON(arg0.FactionData).Color[2], fromJSON(arg0.FactionData).Color[3]))) .. "\226\128\162 Faction Type \194\187   #FFFFFF" .. tostring(({
        {en = "Gang", ar = "\216\185\216\181\216\167\216\168\216\169"},
        {en = "Mafia", ar = "\217\133\216\167\217\129\217\138\216\167"},
        {
          en = "Law",
          ar = "\217\130\216\167\217\134\217\136\217\134\217\138"
        },
        {en = "Government", ar = "\216\173\217\131\217\136\217\133\217\138"},
        {en = "Medical", ar = "\216\181\216\173\217\138"},
        {en = "Other", ar = "\216\167\216\174\216\177\217\137"},
        {en = "News", ar = "\216\165\216\185\217\132\216\167\217\133"},
        {
          en = "Mechanic",
          ar = "\217\133\217\138\217\131\216\167\217\134\217\138\217\131"
        },
        {
          en = "Electric",
          ar = "\217\131\217\135\216\177\216\168\216\167\216\161"
        },
        {en = "Traffic", ar = "\217\133\216\177\217\136\216\177"},
        {en = "Business", ar = "\216\163\216\185\217\133\216\167\217\132"},
        {en = "Family", ar = "\216\185\216\167\216\166\217\132\216\169"}
      })[(tonumber(arg0.Type) or 5) + 1].ar) .. "\n" .. "" .. tostring((string.format("#%.2X%.2X%.2X", fromJSON(arg0.FactionData).Color[1], fromJSON(arg0.FactionData).Color[2], fromJSON(arg0.FactionData).Color[3]))) .. "\226\128\162 Members \194\187   #FFFFFF" .. tostring(#arg1) .. " / " .. tostring(arg0.max_members) .. "   " .. tostring((string.format("#%.2X%.2X%.2X", fromJSON(arg0.FactionData).Color[1], fromJSON(arg0.FactionData).Color[2], fromJSON(arg0.FactionData).Color[3]))) .. "\194\187   #00FF00" .. tostring(0 + 1) .. " online#FFFFFF\n" .. "" .. tostring((string.format("#%.2X%.2X%.2X", fromJSON(arg0.FactionData).Color[1], fromJSON(arg0.FactionData).Color[2], fromJSON(arg0.FactionData).Color[3]))) .. "\226\128\162 Color (RGB) \194\187   #FFFFFF(" .. tostring(fromJSON(arg0.FactionData).Color[1]) .. ", " .. tostring(fromJSON(arg0.FactionData).Color[2]) .. ", " .. tostring(fromJSON(arg0.FactionData).Color[3]) .. ")"
    }, tocolor(255, 255, 255, 255), "left", "top", UI.window.FactionMain)
    if arg8 and tonumber(arg9) == tonumber(arg0.ID) then
    end
    eui:uiSetText(UI.label.FactionInfo2, "" .. tostring((string.format("#%.2X%.2X%.2X", fromJSON(arg0.FactionData).Color[1], fromJSON(arg0.FactionData).Color[2], fromJSON(arg0.FactionData).Color[3]))) .. "\226\128\162 Hotline \194\187   #FFFFFF" .. tostring(fromJSON(arg0.FactionData).Hotline) .. "\n" .. "" .. tostring((string.format("#%.2X%.2X%.2X", fromJSON(arg0.FactionData).Color[1], fromJSON(arg0.FactionData).Color[2], fromJSON(arg0.FactionData).Color[3]))) .. "\226\128\162 Radio Channel \194\187   #FFFFFF" .. tostring(fromJSON(arg0.FactionData).radio_channel or "-") .. "\n" .. "" .. tostring((string.format("#%.2X%.2X%.2X", fromJSON(arg0.FactionData).Color[1], fromJSON(arg0.FactionData).Color[2], fromJSON(arg0.FactionData).Color[3]))) .. "\226\128\162 Your next wage after \194\187   #FFFFFF" .. tostring(convertTimeToString(arg8 / 1000)) .. "", tocolor(255, 255, 255, 255), "left", "top", UI.window.FactionMain)
    eui:uiSetText(UI.label.level, "Level " .. (arg0.level and tostring(arg0.level) or "0"))
    if 0 < getLevelRequiredPoints(arg0.level) then
    end
    eui:uiProgressBarSetProgress(UI.progress.level, arg0.level_points / getLevelRequiredPoints(arg0.level) * 100)
    eui:uiSetProperty(UI.progress.level, "progress_color", tocolor(fromJSON(arg0.FactionData).Color[1], fromJSON(arg0.FactionData).Color[2], fromJSON(arg0.FactionData).Color[3]))
    eui:uiSetText(UI.label.level_points, tostring(arg0.level_points) .. " / " .. tostring((getLevelRequiredPoints(arg0.level))))
    eui:uiSetColor(UI.label.level, fromJSON(arg0.FactionData).Color[1], fromJSON(arg0.FactionData).Color[2], fromJSON(arg0.FactionData).Color[3])
    eui:uiSetColor(UI.progress.level, fromJSON(arg0.FactionData).Color[1], fromJSON(arg0.FactionData).Color[2], fromJSON(arg0.FactionData).Color[3])
  end
  if fileExists(":factions-logos/logos/" .. tostring(arg0.ID) .. ".png") then
    eui:uiStaticImageLoadImage(UI.image.FactionLogo, fromJSON(arg0.FactionData).Logo and ":factions-logos/logos/" .. tostring(arg0.ID) .. ".png" or ":factions-logos/logos/default.png")
  else
    eui:uiStaticImageLoadImage(UI.image.FactionLogo, ":factions-logos/logos/default.png")
  end
  eui:uiSetProperty(UI.memo.Notes, "SecondColor", tocolor(fromJSON(arg0.FactionData).Color[1], fromJSON(arg0.FactionData).Color[2], fromJSON(arg0.FactionData).Color[3], 255))
  eui:uiGridListClear(UI.gridlist.FactionRankPermissions)
  for forvar25, forvar26 in ipairs(faction_permissions[arg0.Type] or {}) do
    eui:uiGridListSetItemText(UI.gridlist.FactionRankPermissions, eui:uiGridListAddRow(UI.gridlist.FactionRankPermissions), 1, forvar26)
  end
  eui:uiGridListClear(UI.gridlist.Vehicles)
  for forvar25, forvar26 in ipairs(arg2) do
    eui:uiGridListSetItemText(UI.gridlist.Vehicles, eui:uiGridListAddRow(UI.gridlist.Vehicles), 1, tostring(forvar26.ID))
    eui:uiGridListSetItemText(UI.gridlist.Vehicles, eui:uiGridListAddRow(UI.gridlist.Vehicles), 2, tostring(forvar26.Name))
    if isElement((getElementByID("Vehicle:" .. tostring(forvar26.ID)))) then
      eui:uiGridListSetItemText(UI.gridlist.Vehicles, eui:uiGridListAddRow(UI.gridlist.Vehicles), 3, tostring(getVehiclePlateText((getElementByID("Vehicle:" .. tostring(forvar26.ID))))))
      eui:uiGridListSetItemText(UI.gridlist.Vehicles, eui:uiGridListAddRow(UI.gridlist.Vehicles), 4, tostring(getZoneName(getElementPosition((getElementByID("Vehicle:" .. tostring(forvar26.ID)))))) .. ", " .. tostring(getZoneName(getElementPosition((getElementByID("Vehicle:" .. tostring(forvar26.ID)))))))
    end
  end
  if fromJSON(arg0.FactionData).veh_limit then
    eui:uiSetText(UI.label["Vehicles.Limit"], tostring(#arg2) .. " / " .. tostring(fromJSON(arg0.FactionData).veh_limit))
  else
    eui:uiSetText(UI.label["Vehicles.Limit"], tostring(#arg2))
  end
  eui:uiGridListClear(UI.gridlist["properties:interiors"])
  for forvar25, forvar26 in ipairs(arg12) do
    eui:uiGridListSetItemText(UI.gridlist["properties:interiors"], eui:uiGridListAddRow(UI.gridlist["properties:interiors"]), 1, tostring(forvar26.ID))
    eui:uiGridListSetItemText(UI.gridlist["properties:interiors"], eui:uiGridListAddRow(UI.gridlist["properties:interiors"]), 2, tostring(forvar26.Name))
  end
  reloadMenu(_, arg6, tonumber(arg0.Type))
  exports.public:loading("factions:get_faction", false)
  eui:uiSetVisible(UI.container.faction_gov, false)
  if arg6 == "Leader" then
    eui:uiSetVisible(UI.button["Member.Dismissal"], true)
    eui:uiSetVisible(UI.button["Member.Promote/Demote"], true)
    eui:uiSetVisible(UI.button["Member.DutyPerks"], true)
    eui:uiSetVisible(UI.button["Member.AddMember"], true)
    eui:uiSetVisible(UI.button["Member.SetLevel"], true)
    eui:uiSetVisible(UI.button["Notes.Save"], true)
    if arg0.gov == 1 then
      eui:uiSetVisible(UI.container.faction_gov, true)
    end
    triggerServerEvent("duty:getAvailableItemsForFaction", localPlayer, arg0.ID)
  elseif arg6 == "Co-Leader" then
    eui:uiSetVisible(UI.button["Member.Dismissal"], true)
    eui:uiSetVisible(UI.button["Member.Promote/Demote"], false)
    eui:uiSetVisible(UI.button["Member.DutyPerks"], true)
    eui:uiSetVisible(UI.button["Member.AddMember"], true)
    eui:uiSetVisible(UI.button["Member.SetLevel"], true)
    eui:uiSetVisible(UI.button["Notes.Save"], true)
    eui:uiSetVisible(UI.label["Section:Management"], false)
    eui:uiSetVisible(UI.label["Section:Vehicles"], true)
    eui:uiSetVisible(UI.label["Section:Duty"], true)
    eui:uiSetVisible(UI.label["Section:Logs"], true)
  else
    eui:uiSetVisible(UI.button["Member.Dismissal"], false)
    eui:uiSetVisible(UI.button["Member.Promote/Demote"], false)
    eui:uiSetVisible(UI.button["Member.DutyPerks"], false)
    eui:uiSetVisible(UI.button["Member.AddMember"], false)
    eui:uiSetVisible(UI.button["Member.SetLevel"], false)
    eui:uiSetVisible(UI.button["Notes.Save"], false)
    eui:uiSetVisible(UI.label["Section:Management"], false)
    eui:uiSetVisible(UI.label["Section:Vehicles"], false)
    eui:uiSetVisible(UI.label["Section:Duty"], false)
    eui:uiSetVisible(UI.label["Section:Logs"], false)
    return
  end
  eui:uiSetText(UI.edit.LogoURL, "")
  eui:uiGridListClear(UI.gridlist["Promote/Demote"])
  eui:uiGridListClear(UI.gridlist.FactionRanks)
  for forvar25, forvar26 in ipairs((fromJSON(arg0.Ranks))) do
    eui:uiGridListSetItemText(UI.gridlist["Promote/Demote"], eui:uiGridListAddRow(UI.gridlist["Promote/Demote"]), 1, "#" .. tostring(forvar25) .. " " .. tostring(forvar26.Name))
    eui:uiGridListSetItemText(UI.gridlist["Promote/Demote"], eui:uiGridListAddRow(UI.gridlist["Promote/Demote"]), 2, "$" .. tostring(forvar26.Wage))
    eui:uiGridListSetItemText(UI.gridlist.FactionRanks, eui:uiGridListAddRow(UI.gridlist.FactionRanks), 1, "#" .. tostring(forvar25) .. " " .. tostring(forvar26.Name))
    eui:uiGridListSetItemText(UI.gridlist.FactionRanks, eui:uiGridListAddRow(UI.gridlist.FactionRanks), 2, "$" .. tostring(forvar26.Wage))
    eui:uiGridListSetItemData(UI.gridlist.FactionRanks, eui:uiGridListAddRow(UI.gridlist.FactionRanks), 1, {
      id = forvar25,
      name = forvar26.Name,
      wage = forvar26.Wage,
      permissions = forvar26.Permissions or {}
    })
  end
  if arg4 then
    eui:uiSetText(UI.label.FactionBank, "Bank Account: " .. tostring(arg3) .. "\n" .. "Balance: #00FF00$" .. convertNumber(arg4))
  else
    eui:uiSetText(UI.label.FactionBank, "Bank Account: " .. tostring(arg3) .. "\n" .. "Balance: -")
  end
  if fileExists(":gov_images/images/" .. tostring(arg0.ID) .. ".png") then
    eui:uiStaticImageLoadImage(UI.image.FactionGov, ":gov_images/images/" .. tostring(arg0.ID) .. ".png")
    eui:uiSetVisible(UI.image.FactionGov, true)
  else
    eui:uiSetVisible(UI.image.FactionGov, false)
  end
  eui:uiGridListClear(UI.gridlist.Logs)
  for forvar25, forvar26 in ipairs(arg7) do
    eui:uiGridListSetItemText(UI.gridlist.Logs, eui:uiGridListAddRow(UI.gridlist.Logs), 1, tostring(forvar26.details))
    eui:uiGridListSetItemText(UI.gridlist.Logs, eui:uiGridListAddRow(UI.gridlist.Logs), 2, tostring(forvar26.createdAt))
  end
  if arg10 then
    eui:uiGridListClear(UI.gridlist.recruitment_form)
    for forvar25, forvar26 in ipairs(arg10) do
      eui:uiGridListSetItemData(UI.gridlist.recruitment_form, eui:uiGridListAddRow(UI.gridlist.recruitment_form), 1, forvar26.id)
      eui:uiGridListSetItemText(UI.gridlist.recruitment_form, eui:uiGridListAddRow(UI.gridlist.recruitment_form), 1, tostring(forvar25))
      eui:uiGridListSetItemText(UI.gridlist.recruitment_form, eui:uiGridListAddRow(UI.gridlist.recruitment_form), 2, tostring(forvar26.field_name))
      eui:uiGridListSetItemText(UI.gridlist.recruitment_form, eui:uiGridListAddRow(UI.gridlist.recruitment_form), 3, tostring(forvar26.field_type))
      eui:uiGridListSetItemText(UI.gridlist.recruitment_form, eui:uiGridListAddRow(UI.gridlist.recruitment_form), 4, forvar26.required == 1 and "yes" or "no")
    end
  end
  if arg11 then
    eui:uiGridListClear(UI.gridlist.recruitment_applications)
    for forvar25, forvar26 in ipairs(arg11) do
      eui:uiGridListSetItemData(UI.gridlist.recruitment_applications, eui:uiGridListAddRow(UI.gridlist.recruitment_applications), 1, forvar26.id)
      eui:uiGridListSetItemText(UI.gridlist.recruitment_applications, eui:uiGridListAddRow(UI.gridlist.recruitment_applications), 1, tostring(forvar25))
      eui:uiGridListSetItemText(UI.gridlist.recruitment_applications, eui:uiGridListAddRow(UI.gridlist.recruitment_applications), 2, tostring(forvar26.character_name))
      eui:uiGridListSetItemText(UI.gridlist.recruitment_applications, eui:uiGridListAddRow(UI.gridlist.recruitment_applications), 3, tostring(forvar26.status))
      eui:uiGridListSetItemText(UI.gridlist.recruitment_applications, eui:uiGridListAddRow(UI.gridlist.recruitment_applications), 4, tostring(forvar26.created_at))
      for forvar31 = 1, 4 do
        eui:uiGridListSetItemColor(UI.gridlist.recruitment_applications, eui:uiGridListAddRow(UI.gridlist.recruitment_applications), forvar31, var0[forvar26.status] or tocolor(255, 255, 255))
      end
    end
  end
  eui:uiSwitchSetSelected(UI.checkbox.open_recruitment, arg0.recruitment_status == 1)
  eui:uiSetProperty(UI.menu.main, "selection_color", tocolor(fromJSON(arg0.FactionData).Color[1], fromJSON(arg0.FactionData).Color[2], fromJSON(arg0.FactionData).Color[3]))
  eui:uiSetProperty(UI.menu.main, "icons_color", tocolor(fromJSON(arg0.FactionData).Color[1], fromJSON(arg0.FactionData).Color[2], fromJSON(arg0.FactionData).Color[3]))
end)
addEvent("factions:tasks:get:response", true)
addEventHandler("factions:tasks:get:response", root, function(arg0)
  eui:uiGridListClear(UI.gridlist.tasks)
  for forvar4, forvar5 in ipairs(arg0) do
    eui:uiGridListSetItemData(UI.gridlist.tasks, eui:uiGridListAddRow(UI.gridlist.tasks), 1, forvar5.id)
    eui:uiGridListSetItemText(UI.gridlist.tasks, eui:uiGridListAddRow(UI.gridlist.tasks), 1, forvar5.status == "completed" and "\226\156\148" or "")
    eui:uiGridListSetItemText(UI.gridlist.tasks, eui:uiGridListAddRow(UI.gridlist.tasks), 2, tostring(forvar5.description))
    eui:uiGridListSetItemText(UI.gridlist.tasks, eui:uiGridListAddRow(UI.gridlist.tasks), 3, tostring(forvar5.current_count) .. " / " .. tostring(forvar5.required_count))
    eui:uiGridListSetItemText(UI.gridlist.tasks, eui:uiGridListAddRow(UI.gridlist.tasks), 4, tostring(forvar5.points))
    if forvar5.status == "completed" then
      eui:uiGridListSetItemColor(UI.gridlist.tasks, eui:uiGridListAddRow(UI.gridlist.tasks), 1, tocolor(168, 255, 61))
      eui:uiGridListSetItemColor(UI.gridlist.tasks, eui:uiGridListAddRow(UI.gridlist.tasks), 2, tocolor(168, 255, 61))
      eui:uiGridListSetItemColor(UI.gridlist.tasks, eui:uiGridListAddRow(UI.gridlist.tasks), 3, tocolor(168, 255, 61))
      eui:uiGridListSetItemColor(UI.gridlist.tasks, eui:uiGridListAddRow(UI.gridlist.tasks), 4, tocolor(168, 255, 61))
    end
  end
end)
function convertTimeToString(arg0)
  arg0 = tonumber(arg0)
  return math.floor(arg0 / (24 * (60 * 60))) .. "d " .. math.floor(arg0 % (24 * (60 * 60)) / (60 * 60)) .. "h " .. math.floor(arg0 % (24 * (60 * 60)) % (60 * 60) / 60) .. "m " .. math.ceil(arg0 % (24 * (60 * 60)) % (60 * 60) % 60) .. "s"
end
addEvent("duty:sendFactionDutyData", true)
addEventHandler("duty:sendFactionDutyData", root, function(arg0, arg1, arg2)
  eui:uiGridListClear(UI.gridlist.DutyPerks)
  for forvar6, forvar7 in ipairs(arg0) do
    eui:uiGridListSetItemText(UI.gridlist.DutyPerks, eui:uiGridListAddRow(UI.gridlist.DutyPerks), 1, tostring(forvar7.ID))
    eui:uiGridListSetItemText(UI.gridlist.DutyPerks, eui:uiGridListAddRow(UI.gridlist.DutyPerks), 2, tostring(forvar7.Name))
    eui:uiGridListSetItemData(UI.gridlist.DutyPerks, eui:uiGridListAddRow(UI.gridlist.DutyPerks), 1, {
      fromJSON(forvar7.Items),
      fromJSON(forvar7.Weapons),
      fromJSON(forvar7.Skins),
      (fromJSON(forvar7.Locations))
    })
  end
  eui:uiGridListClear(UI.gridlist.DutyLocations)
  for forvar6, forvar7 in ipairs(arg1) do
    eui:uiGridListSetItemText(UI.gridlist.DutyLocations, eui:uiGridListAddRow(UI.gridlist.DutyLocations), 1, tostring(forvar7.ID))
    eui:uiGridListSetItemText(UI.gridlist.DutyLocations, eui:uiGridListAddRow(UI.gridlist.DutyLocations), 2, tostring(forvar7.Name))
    eui:uiGridListSetItemText(UI.gridlist.DutyLocations, eui:uiGridListAddRow(UI.gridlist.DutyLocations), 3, tostring(forvar7.Radius))
    eui:uiGridListSetItemText(UI.gridlist.DutyLocations, eui:uiGridListAddRow(UI.gridlist.DutyLocations), 4, tostring(unpack(fromJSON(forvar7.Position))))
    eui:uiGridListSetItemText(UI.gridlist.DutyLocations, eui:uiGridListAddRow(UI.gridlist.DutyLocations), 5, tostring(unpack(fromJSON(forvar7.Position))))
    eui:uiGridListSetItemText(UI.gridlist.DutyLocations, eui:uiGridListAddRow(UI.gridlist.DutyLocations), 6, tostring(unpack(fromJSON(forvar7.Position))) .. ", " .. tostring(unpack(fromJSON(forvar7.Position))) .. ", " .. tostring(unpack(fromJSON(forvar7.Position))))
  end
  eui:uiGridListClear(UI.gridlist.DutyVehicleLocations)
  for forvar6, forvar7 in ipairs(arg2) do
    eui:uiGridListSetItemText(UI.gridlist.DutyVehicleLocations, eui:uiGridListAddRow(UI.gridlist.DutyVehicleLocations), 1, tostring(forvar7.ID))
    eui:uiGridListSetItemText(UI.gridlist.DutyVehicleLocations, eui:uiGridListAddRow(UI.gridlist.DutyVehicleLocations), 2, tostring(forvar7.VehicleID))
    if isElement((getElementByID("Vehicle:" .. tostring(forvar7.VehicleID)))) then
      eui:uiGridListSetItemText(UI.gridlist.DutyVehicleLocations, eui:uiGridListAddRow(UI.gridlist.DutyVehicleLocations), 3, tostring(getElementData(getElementByID("Vehicle:" .. tostring(forvar7.VehicleID)), "vehicle:name")))
    end
  end
end)
function getPlayerFromCharacterID(arg0)
  for forvar4, forvar5 in ipairs(getElementsByType("player")) do
    if getElementData(forvar5, "character:id") == arg0 then
      return forvar5
    end
  end
  return false
end
function getLevelRequiredPoints(arg0)
  return arg0 * 50
end
addEvent("factions:playDepSound", true)
addEventHandler("factions:playDepSound", root, function()
  playSound("http://b.top4top.net/m_922tispe1.mp3")
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
