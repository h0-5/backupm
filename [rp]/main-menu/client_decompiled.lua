-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

function MainMenuKey(arg0, arg1)
  if getElementData(localPlayer, "character:id") then
    showSideBar(not var0.state)
  end
end
bindKey("F1", "down", MainMenuKey)
addCommandHandler("menu", MainMenuKey, false, false)
addEvent("onClientPlayerQuitFromCharacter", true)
addEventHandler("onClientPlayerQuitFromCharacter", localPlayer, function(arg0)
  showSideBar(false)
end)
function showEscapeView(arg0)
  showSideBar(arg0)
end
function showSideBar(arg0)
  var0.state = arg0
  showCursor(arg0)
  if arg0 then
    var0.anim = {
      getTickCount(),
      var0.alpha,
      var0.sideX,
      250,
      10,
      true
    }
    addEventHandler("onClientRender", root, main_menu_draw, false, "high-2")
    eui:uiSetVisible(UI.window.MainMenu, true)
    eui:uiMenuSetSelectedRow(var1, 1)
  else
    removeEventHandler("onClientRender", root, main_menu_draw)
    var0.alpha = 0
    var0.anim = {
      getTickCount(),
      var0.alpha,
      var0.sideX,
      0,
      -260,
      false
    }
    eui:uiSetVisible(UI.window.MainMenu, false)
  end
end
function main_menu_draw()
  var0.alpha, var0.sideX = animation(unpack(var0.anim))
  dxDrawRectangle(0, 0, var1, var2, tocolor(0, 0, 0, math.max(0, var0.alpha - 80)), var3)
  dxDrawRectangle(0, 0, var4, var2, tocolor(0, 3, 8, var0.alpha), var3)
  dxDrawImage(var4, 0, var1, var2, ":assets/images/bg_gradient.png", 0, 0, 0, tocolor(0, 3, 8, var0.alpha), var3)
  dxDrawRectangle(var4 + 2 * var5, 0, 1 * var5, var2, tocolor(255, 255, 255, 10), var3)
  dxDrawImage(var6, var7, var8, var8, ":assets/images/logo.png", 0, 0, 0, tocolor(255, 255, 255, 200), var3)
  dxDrawImage((var4 - 450 * var5) / 2, var4 + (var2 - var4 - 450 * var9 * var5) / 2 + 200 * var5, 450 * var5, 450 * var9 * var5, ":assets/images/logo_text.png", -90, 0, 0, tocolor(255, 255, 255, 50), var3)
end
function cancelBindsEvent(arg0, arg1)
  if arg1 and (arg0 == "F1" or arg0 == "F2" or arg0 == "F3" or arg0 == "F4" or arg0 == "F11" or arg0 == "F7") then
    cancelEvent()
  end
end
function animation(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8)
  return interpolateBetween(arg2, arg3, arg4, arg5, arg6, arg7, (getTickCount() - arg0) / (arg0 + arg1 - arg0), arg8)
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
  radiobutton = {},
  gridlist = {},
  memo = {},
  scrollbar = {},
  combobox = {},
  container = {},
  image = {},
  rectangle = {}
}
function UIKitReady()
  eui = exports.UIKit
  menu_bg = eui:getUIImage("gradient_x")
  UI.window.MainMenu = eui:uiCreateRectangle(false, false, eui:uiGetReferenceScreenSize() * 0.75 - 130, eui:uiGetReferenceScreenSize() * 0.65, tocolor(19, 22, 27, 0), true, true, true, true)
  eui:uiSetVisible(UI.window.MainMenu, false)
  eui:uiBringToFront(UI.window.MainMenu)
  var0 = eui:uiCreateMenu(5, 15, 220, eui:uiGetReferenceScreenSize() * 0.65, tocolor(19, 22, 27, 0), UI.window.MainMenu)
  eui:uiSetProperty(var0, "hovered_row_color", tocolor(9, 12, 17, 100))
  eui:uiSetProperty(var0, "selected_row_color", tocolor(3, 6, 11, 250))
  eui:uiSetProperty(var0, "row_height", 33)
  eui:uiSetProperty(var0, "icons_color", (eui:uiGetThemeColor("primary")))
  eui:uiSetProperty(var0, "selection_color", tocolor(255, 255, 255))
  setElementID(var0, "main-menu")
  for forvar11, forvar12 in ipairs(var1) do
    UI.container[forvar12.id] = eui:uiCreateContainer(0, 0, eui:uiGetReferenceScreenSize() * 0.75 - 130 - 220 - 30, eui:uiGetReferenceScreenSize() * 0.65 - 10, (eui:uiCreateRectangle(220 + 30, 5, eui:uiGetReferenceScreenSize() * 0.75 - 130 - 220 - 30, eui:uiGetReferenceScreenSize() * 0.65 - 10, tocolor(3, 6, 11, 240), true, true, true, true, UI.window.MainMenu)))
    eui:uiSetVisible(UI.container[forvar12.id], false)
    UI.label.title = eui:uiCreateLabel(0, 10, eui:uiGetReferenceScreenSize() * 0.75 - 130 - 220 - 30, 30, forvar12.title, tocolor(255, 255, 255, 255), "center", "center", UI.container[forvar12.id])
    eui:uiSetFont(UI.label.title, "default-large")
    eui:uiMenuAddRow(var0, forvar12.title, tocolor(29, 32, 37, 0), forvar12.icon, UI.container[forvar12.id], forvar12.id)
  end
  eui:uiCreateRectangle(30, 0, 10, 2, tocolor(255, 255, 255, 240), false, false, false, false, (eui:uiCreateRectangle(220 + 30, 5, eui:uiGetReferenceScreenSize() * 0.75 - 130 - 220 - 30, eui:uiGetReferenceScreenSize() * 0.65 - 10, tocolor(3, 6, 11, 240), true, true, true, true, UI.window.MainMenu)))
  eui:uiCreateRectangle(eui:uiGetReferenceScreenSize() * 0.75 - 130 - 220 - 30 - 30 - 10, eui:uiGetReferenceScreenSize() * 0.65 - 10 - 2, 10, 2, tocolor(255, 255, 255, 240), false, false, false, false, (eui:uiCreateRectangle(220 + 30, 5, eui:uiGetReferenceScreenSize() * 0.75 - 130 - 220 - 30, eui:uiGetReferenceScreenSize() * 0.65 - 10, tocolor(3, 6, 11, 240), true, true, true, true, UI.window.MainMenu)))
  eui:uiCreateRectangle(eui:uiGetReferenceScreenSize() * 0.75 - 130 - 220 - 30 - 30 - 10, 0, 10, 2, tocolor(255, 255, 255, 240), false, false, false, false, (eui:uiCreateRectangle(220 + 30, 5, eui:uiGetReferenceScreenSize() * 0.75 - 130 - 220 - 30, eui:uiGetReferenceScreenSize() * 0.65 - 10, tocolor(3, 6, 11, 240), true, true, true, true, UI.window.MainMenu)))
  eui:uiCreateRectangle(30, eui:uiGetReferenceScreenSize() * 0.65 - 10 - 2, 10, 2, tocolor(255, 255, 255, 240), false, false, false, false, (eui:uiCreateRectangle(220 + 30, 5, eui:uiGetReferenceScreenSize() * 0.75 - 130 - 220 - 30, eui:uiGetReferenceScreenSize() * 0.65 - 10, tocolor(3, 6, 11, 240), true, true, true, true, UI.window.MainMenu)))
  UI.tabpanel[1] = eui:uiCreateTabPanel(10, 110, eui:uiGetReferenceScreenSize() * 0.75 - 130 - 220 - 30 - 20, 320, "", tocolor(0, 0, 0, 0), UI.container.character_info)
  eui:uiSetProperty(UI.tabpanel[1], "tabs_bar_color", tocolor(29, 32, 37, 0))
  eui:uiSetProperty(UI.tabpanel[1], "tab_selected_color", tocolor(9, 12, 17, 220))
  eui:uiSetProperty(UI.tabpanel[1], "tab_height", 60)
  eui:uiSetProperty(UI.tabpanel[1], "tab_hovered_color", tocolor(9, 12, 17, 100))
  UI.tab[1] = eui:uiCreateTab({
    en = "Info",
    ar = "\217\133\216\185\217\132\217\136\217\133\216\167\216\170"
  }, "", UI.tabpanel[1])
  UI.label[1] = eui:uiCreateLabel(15, 25, ((eui:uiGetReferenceScreenSize() * 0.75 - 130 - 220 - 30 - 40) * 0.7 - 20) / 2, 300, "", tocolor(255, 255, 255, 255), "left", "top", (eui:uiCreateRectangle(5, 25, (eui:uiGetReferenceScreenSize() * 0.75 - 130 - 220 - 30 - 40) * 0.7, eui:uiGetReferenceScreenSize() * 0.65 - 10 - 210, tocolor(9, 12, 17, 180), true, true, true, true, UI.tab[1])))
  UI.label[4] = eui:uiCreateLabel(15 + ((eui:uiGetReferenceScreenSize() * 0.75 - 130 - 220 - 30 - 40) * 0.7 - 20) / 2, 25, ((eui:uiGetReferenceScreenSize() * 0.75 - 130 - 220 - 30 - 40) * 0.7 - 20) / 2, 300, "", tocolor(255, 255, 255, 255), "left", "top", (eui:uiCreateRectangle(5, 25, (eui:uiGetReferenceScreenSize() * 0.75 - 130 - 220 - 30 - 40) * 0.7, eui:uiGetReferenceScreenSize() * 0.65 - 10 - 210, tocolor(9, 12, 17, 180), true, true, true, true, UI.tab[1])))
  eui:uiSetProperty(UI.label[1], "line_spacing", 35)
  eui:uiSetProperty(UI.label[4], "line_spacing", 35)
  UI.label.level = eui:uiCreateLabel(0, 30, (eui:uiGetReferenceScreenSize() * 0.75 - 130 - 220 - 30 - 40) * 0.3, 30, "Level ${color.primary}1", tocolor(255, 255, 255, 255), "center", "top", (eui:uiCreateRectangle(5 + (eui:uiGetReferenceScreenSize() * 0.75 - 130 - 220 - 30 - 40) * 0.7 + 10, 25, (eui:uiGetReferenceScreenSize() * 0.75 - 130 - 220 - 30 - 40) * 0.3, (eui:uiGetReferenceScreenSize() * 0.65 - 10 - 210 - 10) * 0.5, tocolor(9, 12, 17, 180), true, true, true, true, UI.tab[1])))
  UI.label.level_exp = eui:uiCreateLabel(0, 60, (eui:uiGetReferenceScreenSize() * 0.75 - 130 - 220 - 30 - 40) * 0.3, 30, "10000 / 10000", tocolor(255, 255, 255, 255), "center", "top", (eui:uiCreateRectangle(5 + (eui:uiGetReferenceScreenSize() * 0.75 - 130 - 220 - 30 - 40) * 0.7 + 10, 25, (eui:uiGetReferenceScreenSize() * 0.75 - 130 - 220 - 30 - 40) * 0.3, (eui:uiGetReferenceScreenSize() * 0.65 - 10 - 210 - 10) * 0.5, tocolor(9, 12, 17, 180), true, true, true, true, UI.tab[1])))
  eui:uiSetFont(UI.label.level, "default-large")
  UI.progressbar[1] = eui:uiCreateProgressBar(20, 100, (eui:uiGetReferenceScreenSize() * 0.75 - 130 - 220 - 30 - 40) * 0.3 - 40, 6, _, (eui:uiCreateRectangle(5 + (eui:uiGetReferenceScreenSize() * 0.75 - 130 - 220 - 30 - 40) * 0.7 + 10, 25, (eui:uiGetReferenceScreenSize() * 0.75 - 130 - 220 - 30 - 40) * 0.3, (eui:uiGetReferenceScreenSize() * 0.65 - 10 - 210 - 10) * 0.5, tocolor(9, 12, 17, 180), true, true, true, true, UI.tab[1])))
  eui:uiSetProperty(UI.progressbar[1], "background_color", tocolor(20, 20, 20, 240))
  eui:uiSetProperty(UI.progressbar[1], "show_progress", false)
  eui:uiSetProperty(UI.progressbar[1], "progress_animation", true)
  UI.button.goto_level_awards = eui:uiCreateButton(15, (eui:uiGetReferenceScreenSize() * 0.65 - 10 - 210 - 10) * 0.5 - 50, (eui:uiGetReferenceScreenSize() * 0.75 - 130 - 220 - 30 - 40) * 0.3 - 30, 35, {
    en = "Level Awards",
    ar = "\216\172\217\136\216\167\216\166\216\178 \216\167\217\132\217\133\216\179\216\170\217\136\217\137"
  }, _, (eui:uiCreateRectangle(5 + (eui:uiGetReferenceScreenSize() * 0.75 - 130 - 220 - 30 - 40) * 0.7 + 10, 25, (eui:uiGetReferenceScreenSize() * 0.75 - 130 - 220 - 30 - 40) * 0.3, (eui:uiGetReferenceScreenSize() * 0.65 - 10 - 210 - 10) * 0.5, tocolor(9, 12, 17, 180), true, true, true, true, UI.tab[1])))
  UI.label.play_time = eui:uiCreateLabel(0, 0, (eui:uiGetReferenceScreenSize() * 0.75 - 130 - 220 - 30 - 40) * 0.3, (eui:uiGetReferenceScreenSize() * 0.65 - 10 - 210 - 10) * 0.5, [[
Play Time

00:00:00:00]], tocolor(255, 255, 255, 255), "center", "center", (eui:uiCreateRectangle(5 + (eui:uiGetReferenceScreenSize() * 0.75 - 130 - 220 - 30 - 40) * 0.7 + 10, 25 + (eui:uiGetReferenceScreenSize() * 0.65 - 10 - 210 - 10) * 0.5 + 10, (eui:uiGetReferenceScreenSize() * 0.75 - 130 - 220 - 30 - 40) * 0.3, (eui:uiGetReferenceScreenSize() * 0.65 - 10 - 210 - 10) * 0.5, tocolor(9, 12, 17, 180), true, true, true, true, UI.tab[1])))
  eui:uiSetFont(UI.label.play_time, "default-large")
  UI.tab[2] = eui:uiCreateTab({
    en = "Vehicles",
    ar = "\216\167\217\132\217\133\216\177\217\131\216\168\216\167\216\170"
  }, "", UI.tabpanel[1])
  UI.label.vehicles = eui:uiCreateLabel(10, 10, 340, 20, "", tocolor(255, 255, 255, 255), "left", "top", UI.tab[2])
  UI.gridlist.vehicles = eui:uiCreateGridList(0, 40, eui:uiGetReferenceScreenSize() * 0.75 - 130 - 220 - 30 - 20, eui:uiGetReferenceScreenSize() * 0.65 - 10 - 220, tocolor(10, 10, 10, 0), UI.tab[2])
  eui:uiGridListAddColumn(UI.gridlist.vehicles, "ID", 0.2)
  eui:uiGridListAddColumn(UI.gridlist.vehicles, "Name", 0.65)
  eui:uiGridListAddColumn(UI.gridlist.vehicles, "Plate", 0.15)
  eui:uiSetAlign(UI.gridlist.vehicles, "left", "center")
  eui:uiSetProperty(UI.gridlist.vehicles, "color_coded", true)
  eui:uiSetProperty(UI.gridlist.vehicles, "row_height", 30)
  UI.tab[3] = eui:uiCreateTab({
    en = "Interiors",
    ar = "\216\167\217\132\216\168\217\138\217\136\216\170 \217\136\216\167\217\132\217\133\216\173\217\132\216\167\216\170"
  }, "", UI.tabpanel[1])
  UI.label.interiors = eui:uiCreateLabel(10, 10, 340, 20, "", tocolor(255, 255, 255, 255), "left", "top", UI.tab[3])
  UI.gridlist.interiors = eui:uiCreateGridList(0, 40, eui:uiGetReferenceScreenSize() * 0.75 - 130 - 220 - 30 - 20, eui:uiGetReferenceScreenSize() * 0.65 - 10 - 220, tocolor(10, 10, 10, 0), UI.tab[3])
  eui:uiGridListAddColumn(UI.gridlist.interiors, "ID", 0.2)
  eui:uiGridListAddColumn(UI.gridlist.interiors, "Name", 0.6)
  eui:uiGridListAddColumn(UI.gridlist.interiors, "Status", 0.2)
  eui:uiSetAlign(UI.gridlist.interiors, "left", "center")
  eui:uiSetProperty(UI.gridlist.interiors, "color_coded", true)
  eui:uiSetProperty(UI.gridlist.interiors, "row_height", 30)
  eui:uiCreateRectangle(5, eui:uiGetReferenceScreenSize() * 0.65 - 10 - 60, eui:uiGetReferenceScreenSize() * 0.75 - 130 - 220 - 30 - 10, 1, tocolor(255, 255, 255, 10), false, false, false, false, UI.container.character_info)
  UI.label.username = eui:uiCreateLabel(20, eui:uiGetReferenceScreenSize() * 0.65 - 10 - 50, 200, 35, "", tocolor(255, 255, 255, 50), "left", "center", UI.container.character_info)
  UI.button["character:quit"] = eui:uiCreateButton(eui:uiGetReferenceScreenSize() * 0.75 - 130 - 220 - 30 - 200 - 15, eui:uiGetReferenceScreenSize() * 0.65 - 10 - 50, 200, 35, {
    en = "Quit Character",
    ar = "\216\174\216\177\217\136\216\172 \217\133\217\134 \216\167\217\132\216\180\216\174\216\181\217\138\216\169"
  }, "primary", UI.container.character_info)
  eui:uiSetProperty(UI.button["character:quit"], "HoverGlow", true)
  eui:uiCreateLabel(0, eui:uiGetReferenceScreenSize() * 0.65 - 10 - 40, eui:uiGetReferenceScreenSize() * 0.75 - 130 - 220 - 30, 30, "Version 2.1.0  -  Wnash Time Roleplay  -  Season 3", tocolor(255, 255, 255, 50), "center", "center", UI.container.about)
  UI.rectangle.discord = eui:uiCreateRectangle(10, 100, eui:uiGetReferenceScreenSize() * 0.75 - 130 - 220 - 30 - 20, 50, tocolor(19, 22, 27, 240), true, true, true, true, UI.container.about)
  eui:uiCreateImage(10, 5, 40, 40, "icons/discord.png", UI.rectangle.discord)
  eui:uiCreateLabel(60, 0, 200, 50, "\216\167\217\132\216\175\216\179\217\131\217\136\216\177\216\175 \216\167\217\132\216\177\216\179\217\133\217\138", tocolor(255, 255, 255, 255), "left", "center", UI.rectangle.discord)
  UI.button.copy_discord = eui:uiCreateButton(eui:uiGetReferenceScreenSize() * 0.75 - 130 - 220 - 30 - 20 - 100, 10, 90, 30, {
    en = "Copy Link",
    ar = "\217\134\216\179\216\174 \216\167\217\132\216\177\216\167\216\168\216\183"
  }, tocolor(9, 12, 17, 220), UI.rectangle.discord)
  UI.rectangle["discord.factions"] = eui:uiCreateRectangle(10, 160, eui:uiGetReferenceScreenSize() * 0.75 - 130 - 220 - 30 - 20, 50, tocolor(19, 22, 27, 240), true, true, true, true, UI.container.about)
  eui:uiCreateImage(10, 5, 40, 40, "icons/discord.png", UI.rectangle["discord.factions"])
  eui:uiCreateLabel(60, 0, 200, 50, "\216\175\216\179\217\131\217\136\216\177\216\175 \216\167\217\132\217\129\216\167\217\131\216\180\217\134\216\167\216\170", tocolor(255, 255, 255, 255), "left", "center", UI.rectangle["discord.factions"])
  UI.button["copy_discord.factions"] = eui:uiCreateButton(eui:uiGetReferenceScreenSize() * 0.75 - 130 - 220 - 30 - 20 - 100, 10, 90, 30, {
    en = "Copy Link",
    ar = "\217\134\216\179\216\174 \216\167\217\132\216\177\216\167\216\168\216\183"
  }, tocolor(9, 12, 17, 220), UI.rectangle["discord.factions"])
  UI.rectangle["discord.gangs"] = eui:uiCreateRectangle(10, 220, eui:uiGetReferenceScreenSize() * 0.75 - 130 - 220 - 30 - 20, 50, tocolor(19, 22, 27, 240), true, true, true, true, UI.container.about)
  eui:uiCreateImage(10, 5, 40, 40, "icons/discord.png", UI.rectangle["discord.gangs"])
  eui:uiCreateLabel(60, 0, 200, 50, "\216\175\216\179\217\131\217\136\216\177\216\175 \216\167\217\132\216\185\216\181\216\167\216\168\216\167\216\170", tocolor(255, 255, 255, 255), "left", "center", UI.rectangle["discord.gangs"])
  UI.button["copy_discord.gangs"] = eui:uiCreateButton(eui:uiGetReferenceScreenSize() * 0.75 - 130 - 220 - 30 - 20 - 100, 10, 90, 30, {
    en = "Copy Link",
    ar = "\217\134\216\179\216\174 \216\167\217\132\216\177\216\167\216\168\216\183"
  }, tocolor(9, 12, 17, 220), UI.rectangle["discord.gangs"])
  UI.rectangle.youtube = eui:uiCreateRectangle(10, 280, eui:uiGetReferenceScreenSize() * 0.75 - 130 - 220 - 30 - 20, 50, tocolor(19, 22, 27, 240), true, true, true, true, UI.container.about)
  eui:uiCreateImage(10, 5, 40, 40, "icons/youtube.png", UI.rectangle.youtube)
  eui:uiCreateLabel(60, 0, 200, 50, "Wnash Time RolePlay", tocolor(255, 255, 255, 255), "left", "center", UI.rectangle.youtube)
  UI.button.copy_youtube = eui:uiCreateButton(eui:uiGetReferenceScreenSize() * 0.75 - 130 - 220 - 30 - 20 - 100, 10, 90, 30, {
    en = "Copy Link",
    ar = "\217\134\216\179\216\174 \216\167\217\132\216\177\216\167\216\168\216\183"
  }, tocolor(9, 12, 17, 220), UI.rectangle.youtube)
  UI.rectangle.store = eui:uiCreateRectangle(10, 340, eui:uiGetReferenceScreenSize() * 0.75 - 130 - 220 - 30 - 20, 50, tocolor(19, 22, 27, 240), true, true, true, true, UI.container.about)
  eui:uiCreateImage(10, 5, 40, 40, ":assets/images/logo-circle.png", UI.rectangle.store)
  eui:uiCreateLabel(60, 0, 200, 50, "\216\167\217\132\217\133\216\170\216\172\216\177 \216\167\217\132\216\177\216\179\217\133\217\138", tocolor(255, 255, 255, 255), "left", "center", UI.rectangle.store)
  UI.button.copy_store = eui:uiCreateButton(eui:uiGetReferenceScreenSize() * 0.75 - 130 - 220 - 30 - 20 - 100, 10, 90, 30, {
    en = "Copy Link",
    ar = "\217\134\216\179\216\174 \216\167\217\132\216\177\216\167\216\168\216\183"
  }, tocolor(9, 12, 17, 220), UI.rectangle.store)
  eui:uiSetClickAction(UI.button.copy_discord, "https://discord.gg/wnashtime")
  eui:uiSetClickAction(UI.button.copy_youtube, "https://www.youtube.com/channel/UCAPHuNaKb1dF1zcYMH7HdCw")
  eui:uiSetClickAction(UI.button.copy_store, "https://store.wnashtime.net")
  eui:uiSetClickAction(UI.button["copy_discord.factions"], "https://discord.gg/TJPjhE8XMf")
  eui:uiSetClickAction(UI.button["copy_discord.gangs"], "https://discord.gg/rQRMUkx7Pz")
  UI.gridlist.staff = eui:uiCreateGridList(10, 50, eui:uiGetReferenceScreenSize() * 0.75 - 130 - 220 - 30 - 20, (eui:uiGetReferenceScreenSize() * 0.65 - 10 - 50) / 2, tocolor(0, 0, 0, 0), UI.container.onlinestaff)
  eui:uiGridListAddColumn(UI.gridlist.staff, "Admins Team", 0.5)
  eui:uiGridListAddColumn(UI.gridlist.staff, "", 0.15)
  eui:uiGridListAddColumn(UI.gridlist.staff, "", 0.2)
  eui:uiGridListAddColumn(UI.gridlist.staff, "", 0.15)
  eui:uiSetAlign(UI.gridlist.staff, "left", "center")
  eui:uiSetProperty(UI.gridlist.staff, "color_coded", true)
  UI.gridlist.staff2 = eui:uiCreateGridList(10, 50 + (eui:uiGetReferenceScreenSize() * 0.65 - 10 - 50) / 2 + 10, eui:uiGetReferenceScreenSize() * 0.75 - 130 - 220 - 30 - 20, (eui:uiGetReferenceScreenSize() * 0.65 - 10 - 100) / 2, tocolor(0, 0, 0, 0), UI.container.onlinestaff)
  eui:uiGridListAddColumn(UI.gridlist.staff2, "Supports Team", 0.5)
  eui:uiGridListAddColumn(UI.gridlist.staff2, "", 0.15)
  eui:uiGridListAddColumn(UI.gridlist.staff2, "", 0.2)
  eui:uiGridListAddColumn(UI.gridlist.staff2, "", 0.15)
  eui:uiSetAlign(UI.gridlist.staff2, "left", "center")
  eui:uiSetProperty(UI.gridlist.staff2, "color_coded", true)
  UI.container.notlinked = eui:uiCreateContainer(0, 0, eui:uiGetReferenceScreenSize() * 0.75 - 130 - 220 - 30, eui:uiGetReferenceScreenSize() * 0.65 - 10, UI.container.linkdiscord)
  UI.container.linked = eui:uiCreateContainer(0, 0, eui:uiGetReferenceScreenSize() * 0.75 - 130 - 220 - 30, eui:uiGetReferenceScreenSize() * 0.65 - 10, UI.container.linkdiscord)
  eui:uiSetVisible(UI.container.notlinked, true)
  eui:uiSetVisible(UI.container.linked, false)
  UI.image.WT = eui:uiCreateImage((eui:uiGetReferenceScreenSize() * 0.75 - 130 - 220 - 30) / 2 - 80 - 40, 70, 80, 80, ":assets/images/logo-circle.png", UI.container.linkdiscord)
  UI.image.Discord = eui:uiCreateImage((eui:uiGetReferenceScreenSize() * 0.75 - 130 - 220 - 30) / 2 + 40, 70, 80, 80, "icons/discord.png", UI.container.linkdiscord)
  UI.image.Link = eui:uiCreateImage((eui:uiGetReferenceScreenSize() * 0.75 - 130 - 220 - 30) / 2 - 15, 100, 30, 30, "icons/link.png", UI.container.linkdiscord)
  eui:uiCreateLabel(15, 180, eui:uiGetReferenceScreenSize() * 0.75 - 130 - 220 - 30 - 30, 80, "\t\t\216\167\217\132\216\162\217\134 \217\138\217\133\217\131\217\134\217\131 \216\177\216\168\216\183 \216\173\216\179\216\167\216\168\217\131 \216\168\216\173\216\179\216\167\216\168 \216\167\217\132\216\175\216\179\217\131\217\136\216\177\216\175 \216\167\217\132\216\174\216\167\216\181 \216\168\217\131\n\t\t\216\167\217\132\216\177\216\168\216\183 \216\179\217\138\216\179\216\167\216\185\216\175\217\131 \216\185\217\132\217\137 \216\170\216\163\217\133\217\138\217\134 \216\173\216\179\216\167\216\168\217\131 \216\168\216\180\217\131\217\132 \216\163\217\129\216\182\217\132 \217\136\216\167\217\132\216\173\216\181\217\136\217\132 \216\185\217\132\217\137 \217\133\217\133\217\138\216\178\216\167\216\170 \216\185\216\175\217\138\216\175\216\169\n\n\t\t\217\132\216\177\216\168\216\183 \216\173\216\179\216\167\216\168\217\131 \217\130\217\133 \216\168\216\165\217\134\216\180\216\167\216\161 \216\177\217\133\216\178 \216\172\216\175\217\138\216\175 \216\185\217\134 \216\183\216\177\217\138\217\130 \216\167\217\132\216\182\216\186\216\183 \216\185\217\132\217\137 \216\178\216\177 '\216\165\217\134\216\180\216\167\216\161 \216\177\217\133\216\178' \216\168\216\167\217\132\216\163\216\179\217\129\217\132\n\t\t\216\171\217\133 \216\170\217\136\216\172\217\135 \216\165\217\132\217\137 \216\167\217\132\216\181\217\129\216\173\216\169 \216\167\217\132\216\170\216\167\217\132\217\138\216\169\n\t\t${color.primary}https://wnashtime.net/linkdiscord\n\t", tocolor(255, 255, 255, 255), "center", "top", UI.container.notlinked)
  UI.button.copy_link_url = eui:uiCreateButton((eui:uiGetReferenceScreenSize() * 0.75 - 130 - 220 - 30 - 120) / 2, 300, 120, 30, {
    en = "Copy Link",
    ar = "\217\134\216\179\216\174 \216\167\217\132\216\177\216\167\216\168\216\183"
  }, tocolor(0, 0, 0, 240), UI.container.notlinked)
  UI.rectangle.code = eui:uiCreateRectangle((eui:uiGetReferenceScreenSize() * 0.75 - 130 - 220 - 30 - 350) / 2, 370, 350, 40, tocolor(19, 22, 27, 240), true, true, true, true, UI.container.notlinked)
  UI.label.code = eui:uiCreateLabel(0, 0, 350, 40, "* * * * * * * * * * * * * * * * * * * * * * *", tocolor(255, 255, 255, 255), "center", "center", UI.rectangle.code)
  eui:uiSetFont(UI.label.code, "default-large")
  UI.button.generate_code = eui:uiCreateButton((eui:uiGetReferenceScreenSize() * 0.75 - 130 - 220 - 30 - 170) / 2, 420, 170, 35, {
    en = "Generate Code",
    ar = "\216\165\217\134\216\180\216\167\216\161 \216\177\217\133\216\178"
  }, "primary", UI.container.notlinked)
  eui:uiCreateLabel(15, 480, eui:uiGetReferenceScreenSize() * 0.75 - 130 - 220 - 30 - 30, 30, "\t\t\216\168\216\185\216\175 \216\165\217\134\216\180\216\167\216\161 \216\167\217\132\216\177\217\133\216\178 \216\179\217\138\217\131\217\136\217\134 \216\181\216\167\217\132\216\173 \217\132\217\132\216\167\216\179\216\170\216\174\216\175\216\167\217\133 \216\174\217\132\216\167\217\132 5 \216\175\217\130\216\167\216\166\217\130\n\t\t\217\138\217\133\217\131\217\134 \217\134\216\179\216\174 \216\167\217\132\216\177\217\133\216\178 \216\185\217\134 \216\183\216\177\217\138\217\130 \216\167\217\132\216\182\216\186\216\183 \216\185\217\132\217\138\217\135\n\t", tocolor(255, 255, 255, 255), "center", "top", UI.container.notlinked)
  eui:uiCreateLabel(15, 180, eui:uiGetReferenceScreenSize() * 0.75 - 130 - 220 - 30 - 30, 20, "\t\t\216\173\216\179\216\167\216\168\217\131 \217\133\216\177\216\168\217\136\216\183 \216\168\216\173\216\179\216\167\216\168 \216\167\217\132\216\175\216\179\217\131\217\136\216\177\216\175 \216\167\217\132\216\170\216\167\217\132\217\138\n\t", tocolor(255, 255, 255, 255), "center", "top", UI.container.linked)
  UI.label.discord_tag = eui:uiCreateLabel(15, 210, eui:uiGetReferenceScreenSize() * 0.75 - 130 - 220 - 30 - 30, 30, "-", "primary", "center", "top", UI.container.linked)
  eui:uiSetFont(UI.label.discord_tag, "default-large")
  UI.label.discord_id = eui:uiCreateLabel(15, 240, eui:uiGetReferenceScreenSize() * 0.75 - 130 - 220 - 30 - 30, 20, [[
		ID: XXXXXXXXXXXXXXXXXXXX
	]], tocolor(255, 255, 255, 150), "center", "top", UI.container.linked)
  eui:uiCreateLabel(15, 410, eui:uiGetReferenceScreenSize() * 0.75 - 130 - 220 - 30 - 30, 40, "\t\t\217\129\217\138 \216\173\216\167\217\132\216\169 \216\177\216\186\216\168\216\170\217\131 \216\168\216\170\216\186\217\138\217\138\216\177 \216\173\216\179\216\167\216\168 \216\167\217\132\216\175\216\179\217\131\217\136\216\177\216\175 \216\167\217\132\217\133\216\177\216\168\217\136\216\183 \216\168\216\173\216\179\216\167\216\168\217\131\n\t\t\217\138\217\133\217\131\217\134\217\131 \216\165\217\132\216\186\216\167\216\161 \216\167\217\132\216\177\216\168\216\183 \217\136\216\165\216\185\216\167\216\175\216\169 \216\174\216\183\217\136\216\167\216\170 \216\167\217\132\216\177\216\168\216\183 \217\133\216\185 \216\167\217\132\216\173\216\179\216\167\216\168 \216\167\217\132\216\172\216\175\217\138\216\175\n\t", tocolor(255, 255, 255, 255), "center", "top", UI.container.linked)
  UI.button.unlinkdiscord = eui:uiCreateButton((eui:uiGetReferenceScreenSize() * 0.75 - 130 - 220 - 30 - 170) / 2, 470, 170, 35, {
    en = "Unlink the Discord",
    ar = "\216\165\217\132\216\186\216\167\216\161 \216\177\216\168\216\183 \216\167\217\132\216\175\216\179\217\131\217\136\216\177\216\175"
  }, "primary", UI.container.linked)
  UI.image.avatar = eui:uiCreateBrowser((eui:uiGetReferenceScreenSize() * 0.75 - 130 - 220 - 30 - 100) / 2, 280, 100, 100, false, true, UI.container.linked)
  addEventHandler("onClientBrowserCreated", eui:uiGetBrowser(UI.image.avatar), function()
    loadBrowserURL(source, "https://i.postimg.cc/fRxyqZQ6/logo.png")
  end)
  UI.tabpanel.leaderboard = eui:uiCreateTabPanel(10, 110, eui:uiGetReferenceScreenSize() * 0.75 - 130 - 220 - 30 - 20, 320, "", tocolor(0, 0, 0, 0), UI.container.leaderboard)
  eui:uiSetProperty(UI.tabpanel.leaderboard, "tabs_bar_color", tocolor(29, 32, 37, 0))
  eui:uiSetProperty(UI.tabpanel.leaderboard, "tab_selected_color", tocolor(9, 12, 17, 220))
  eui:uiSetProperty(UI.tabpanel.leaderboard, "tab_height", 50)
  eui:uiSetProperty(UI.tabpanel.leaderboard, "tab_hovered_color", tocolor(9, 12, 17, 100))
  UI.tab["leaderboard:levels"] = eui:uiCreateTab({
    en = "Levels",
    ar = "\216\167\217\132\217\133\216\179\216\170\217\136\217\138\216\167\216\170"
  }, "", UI.tabpanel.leaderboard)
  UI.tab["leaderboard:activities"] = eui:uiCreateTab({
    en = "Activities",
    ar = "\216\167\217\132\216\163\217\134\216\180\216\183\216\169"
  }, "", UI.tabpanel.leaderboard)
  UI.gridlist["leaderboard:levels"] = eui:uiCreateGridList(0, 30, eui:uiGetReferenceScreenSize() * 0.75 - 130 - 220 - 30 - 20, eui:uiGetReferenceScreenSize() * 0.65 - 10 - 150, tocolor(10, 10, 10, 0), UI.tab["leaderboard:levels"])
  eui:uiGridListAddColumn(UI.gridlist["leaderboard:levels"], "", 0.2)
  eui:uiGridListAddColumn(UI.gridlist["leaderboard:levels"], "Name", 0.5)
  eui:uiGridListAddColumn(UI.gridlist["leaderboard:levels"], "Level", 0.3)
  eui:uiSetAlign(UI.gridlist["leaderboard:levels"], "left", "center")
  eui:uiSetProperty(UI.gridlist["leaderboard:levels"], "color_coded", true)
  eui:uiSetProperty(UI.gridlist["leaderboard:levels"], "row_height", 40)
  UI.gridlist["leaderboard:activities"] = eui:uiCreateGridList(0, 30, eui:uiGetReferenceScreenSize() * 0.75 - 130 - 220 - 30 - 20, eui:uiGetReferenceScreenSize() * 0.65 - 10 - 150, tocolor(10, 10, 10, 0), UI.tab["leaderboard:activities"])
  eui:uiGridListAddColumn(UI.gridlist["leaderboard:activities"], "", 0.2)
  eui:uiGridListAddColumn(UI.gridlist["leaderboard:activities"], "Name", 0.5)
  eui:uiGridListAddColumn(UI.gridlist["leaderboard:activities"], "Points", 0.3)
  eui:uiSetAlign(UI.gridlist["leaderboard:activities"], "left", "center")
  eui:uiSetProperty(UI.gridlist["leaderboard:activities"], "color_coded", true)
  eui:uiSetProperty(UI.gridlist["leaderboard:activities"], "row_height", 40)
end
addEventHandler("onClientUIReady", resourceRoot, UIKitReady)
addEvent("onClientUIKitReady", true)
addEventHandler("onClientUIKitReady", root, UIKitReady)
addEventHandler("onClientUIClick", root, function()
  if source == UI.button["character:quit"] then
    addEventHandler("onClientKey", root, cancelBindsEvent)
    showSideBar(false)
    exports.public:loading("character:quit", true)
    exports.roleplay:switchOutPlayer()
    setTimer(function()
      triggerServerEvent("character:quit", localPlayer)
      removeEventHandler("onClientKey", root, cancelBindsEvent)
      exports.public:loading("character:quit", false)
    end, 6000, 1)
  elseif source == UI.button.copy_discord then
    setClipboard("https://discord.gg/wnashtime")
    exports.notifications:output({
      en = "Link copied",
      ar = "\216\170\217\133 \217\134\216\179\216\174 \216\167\217\132\216\177\216\167\216\168\216\183"
    }, 3000, "success")
  elseif source == UI.button.copy_youtube then
    setClipboard("https://www.youtube.com/channel/UCAPHuNaKb1dF1zcYMH7HdCw")
    exports.notifications:output({
      en = "Link copied",
      ar = "\216\170\217\133 \217\134\216\179\216\174 \216\167\217\132\216\177\216\167\216\168\216\183"
    }, 3000, "success")
  elseif source == UI.button.copy_store then
    setClipboard("https://store.wnashtime.net")
    exports.notifications:output({
      en = "Link copied",
      ar = "\216\170\217\133 \217\134\216\179\216\174 \216\167\217\132\216\177\216\167\216\168\216\183"
    }, 3000, "success")
  elseif source == UI.button["copy_discord.factions"] then
    setClipboard("https://discord.gg/TJPjhE8XMf")
    exports.notifications:output({
      en = "Link copied",
      ar = "\216\170\217\133 \217\134\216\179\216\174 \216\167\217\132\216\177\216\167\216\168\216\183"
    }, 3000, "success")
  elseif source == UI.button["copy_discord.gangs"] then
    setClipboard("https://discord.gg/rQRMUkx7Pz")
    exports.notifications:output({
      en = "Link copied",
      ar = "\216\170\217\133 \217\134\216\179\216\174 \216\167\217\132\216\177\216\167\216\168\216\183"
    }, 3000, "success")
  elseif source == UI.button.copy_link_url then
    setClipboard("https://wnashtime.net/linkdiscord")
    exports.notifications:output({
      en = "Link copied",
      ar = "\216\170\217\133 \217\134\216\179\216\174 \216\167\217\132\216\177\216\167\216\168\216\183"
    }, 3000, "success")
  elseif source == UI.label.code then
    if currentLinkCode then
      setClipboard(currentLinkCode)
      exports.notifications:output({
        en = "Code copied",
        ar = "\216\170\217\133 \217\134\216\179\216\174 \216\167\217\132\216\177\217\133\216\178"
      }, 3000, "success")
      eui:uiLabelApplyShakeAnimation(UI.label.code, tocolor(0, 255, 0, 255))
    else
      exports.notifications:output({
        en = "Generate code first",
        ar = "\217\130\217\133 \216\168\216\165\217\134\216\180\216\167\216\161 \216\177\217\133\216\178 \216\163\217\136\217\132\216\167\217\139"
      }, 3000, "error")
      eui:uiLabelApplyShakeAnimation(UI.label.code, tocolor(255, 0, 0, 255))
    end
  elseif source == UI.button.generate_code then
    if var0 then
      exports.notifications:output({
        en = "Please wait...",
        ar = "\216\167\217\134\216\170\216\184\216\177 \217\133\217\134 \217\129\216\182\217\132\217\131..."
      }, 3000, "warning")
      return
    end
    var0 = true
    triggerServerEvent("main-menu:linkdiscord:generateCode", localPlayer)
  elseif source == UI.button.unlinkdiscord then
    eui:uiSetVisible(UI.container.linked, false)
    eui:uiSetVisible(UI.container.notlinked, true)
    triggerServerEvent("main-menu:linkdiscord:unlink", localPlayer, var1.id)
    var1 = false
  elseif source == UI.button.goto_level_awards then
    eui:uiMenuSetSelectedRow(var2, 9)
  end
end)
addEvent("main-menu:linkdiscord:generateCode:callback", true)
addEventHandler("main-menu:linkdiscord:generateCode:callback", localPlayer, function(arg0)
  if arg0 then
    eui:uiSetText(UI.label.code, arg0)
    currentLinkCode = arg0
    setClipboard(currentLinkCode)
  end
  var0 = false
  eui:uiLabelApplyShakeAnimation(UI.label.code, tocolor(255, 55, 95, 255))
  exports.notifications:output({
    en = "Code generated and copied",
    ar = "\216\170\217\133 \216\165\217\134\216\180\216\167\216\161 \217\136\217\134\216\179\216\174 \216\167\217\132\216\177\217\133\216\178"
  }, 6000, "success")
end)
addEvent("main-menu:linkdiscord:sync", true)
addEventHandler("main-menu:linkdiscord:sync", localPlayer, function(arg0)
  var0 = arg0
  eui:uiSetVisible(UI.container.notlinked, false)
  eui:uiSetVisible(UI.container.linked, true)
  eui:uiSetText(UI.label.discord_tag, arg0.username or "-")
  eui:uiSetText(UI.label.discord_id, "ID: " .. tostring(arg0.id))
  if arg0.avatar and arg0.avatar ~= "" then
    loadBrowserURL(eui:uiGetBrowser(UI.image.avatar), arg0.avatar)
  end
end)
requestBrowserDomains({
  "cdn.discordapp.com",
  "wnashtime.net"
})
addEventHandler("onClientUIMenuSelectChange", root, function(arg0, arg1)
  if source == var0 then
    if arg1 == UI.container.onlinestaff then
      triggerServerEvent("admin:showStaff", localPlayer)
    elseif arg1 == UI.container.leaderboard then
      if eui:uiGetSelectedTab(UI.tabpanel.leaderboard) == UI.tab["leaderboard:levels"] then
        updateLeaderboard("levels")
      elseif eui:uiGetSelectedTab(UI.tabpanel.leaderboard) == UI.tab["leaderboard:activities"] then
        updateLeaderboard("activities")
      end
    end
  end
end)
addEvent("admin:showStaff", true)
addEventHandler("admin:showStaff", root, function(arg0, arg1)
  eui:uiGridListClear(UI.gridlist.staff)
  eui:uiGridListClear(UI.gridlist.staff2)
  for forvar7, forvar8 in ipairs(arg1) do
    eui:uiGridListSetItemText(unpack(forvar8) and UI.gridlist.staff2 or UI.gridlist.staff, eui:uiGridListAddRow(unpack(forvar8) and UI.gridlist.staff2 or UI.gridlist.staff), 1, "\226\128\162    [" .. tostring(unpack(forvar8)) .. "]  " .. (getElementData(unpack(forvar8)) or "-") .. "  (#ff375f" .. unpack(forvar8) .. "#FFFFFF)")
    eui:uiGridListSetItemText(unpack(forvar8) and UI.gridlist.staff2 or UI.gridlist.staff, eui:uiGridListAddRow(unpack(forvar8) and UI.gridlist.staff2 or UI.gridlist.staff), 2, "ID: #ff375f" .. tostring((exports.roleplay:getPlayerID(unpack(forvar8)))))
    eui:uiGridListSetItemText(unpack(forvar8) and UI.gridlist.staff2 or UI.gridlist.staff, eui:uiGridListAddRow(unpack(forvar8) and UI.gridlist.staff2 or UI.gridlist.staff), 3, unpack(forvar8) and "Hidden Admin" or "")
    eui:uiGridListSetItemText(unpack(forvar8) and UI.gridlist.staff2 or UI.gridlist.staff, eui:uiGridListAddRow(unpack(forvar8) and UI.gridlist.staff2 or UI.gridlist.staff), 4, unpack(forvar8) and "#00FF00On-Duty" or "#FF0000Off-Duty")
    if unpack(forvar8) then
    end
  end
  eui:uiGridListSetColumnText(UI.gridlist.staff2, 1, "Supports Team  (" .. 0 + 1 .. ")")
  eui:uiGridListSetColumnText(UI.gridlist.staff, 1, "Admins Team  (" .. #arg1 - (0 + 1) .. ")")
end)
addEventHandler("onClientUIVisibilityChange", root, function(arg0)
  if arg0 and source == UI.window.MainMenu then
    eui:uiSetText(UI.label[1], {
      en = "${color.primary}\226\128\162 Personal ID \194\187  #FFFFFF" .. tostring(exports.roleplay.getCharacter().ID) .. "" .. "\n" .. "${color.primary}\226\128\162 " .. "Name \194\187  #FFFFFF" .. tostring(exports.roleplay.getCharacter().Name) .. "\n" .. "${color.primary}\226\128\162 " .. "Gender \194\187  #FFFFFF" .. tostring(var0[tonumber(exports.roleplay.getCharacter().Info.Gender)]) .. "" .. "\n" .. "${color.primary}\226\128\162 " .. "Date of birth \194\187  #FFFFFF" .. exports.roleplay.getCharacter().Info.BirthDate[1] .. "/" .. exports.roleplay.getCharacter().Info.BirthDate[2] .. "/" .. exports.roleplay.getCharacter().Info.BirthDate[3] .. "\n" .. "${color.primary}\226\128\162 " .. "Age \194\187  #FFFFFF" .. tostring(exports.roleplay.getCharacter().Info.Age) .. " years old" .. "\n" .. "${color.primary}\226\128\162 " .. "Fingerprints \194\187  #FFFFFF" .. tostring(exports.roleplay.getCharacter().Info.FingerPrint) .. "" .. "\n" .. "${color.primary}\226\128\162 " .. "Country \194\187  #FFFFFF" .. tostring(exports.roleplay.getCharacter().country and var1[exports.roleplay.getCharacter().country] or "Unknown") .. "" .. "\n" .. "${color.primary}\226\128\162 " .. "Career \194\187  #FFFFFF" .. (getElementData(localPlayer, "job") or "Unemployed") .. [[

 ]] .. "\n" .. "${color.primary}\226\128\162 " .. "Money \194\187  #00FF00" .. "$" .. tostring(convertNumber((getPlayerMoney()))) .. "\n" .. "${color.primary}\226\128\162 " .. "Main Bank Account \194\187  #FFFFFF" .. tostring(exports.roleplay.getCharacter().Info.BankAccount or "Not Found") .. [[


]] .. "",
      ar = "${color.primary}\226\128\162 \216\177\217\130\217\133 \216\167\217\132\217\135\217\136\217\138\216\169 \194\187  #FFFFFF" .. tostring(exports.roleplay.getCharacter().ID) .. "" .. "\n" .. "${color.primary}\226\128\162 " .. "\216\167\217\132\216\167\216\179\217\133 \194\187  #FFFFFF" .. tostring(exports.roleplay.getCharacter().Name) .. "\n" .. "${color.primary}\226\128\162 " .. "\216\167\217\132\216\172\217\134\216\179 \194\187  #FFFFFF" .. tostring(var0[tonumber(exports.roleplay.getCharacter().Info.Gender)]) .. "" .. "\n" .. "${color.primary}\226\128\162 " .. "\216\170\216\167\216\177\217\138\216\174 \216\167\217\132\217\133\217\138\217\132\216\167\216\175 \194\187  #FFFFFF" .. exports.roleplay.getCharacter().Info.BirthDate[1] .. "/" .. exports.roleplay.getCharacter().Info.BirthDate[2] .. "/" .. exports.roleplay.getCharacter().Info.BirthDate[3] .. "\n" .. "${color.primary}\226\128\162 " .. "\216\167\217\132\216\185\217\133\216\177 \194\187  #FFFFFF" .. tostring(exports.roleplay.getCharacter().Info.Age) .. " \216\179\217\134\216\169" .. "\n" .. "${color.primary}\226\128\162 " .. "\216\168\216\181\217\133\216\169 \216\167\217\132\216\163\216\181\216\168\216\185 \194\187  #FFFFFF" .. tostring(exports.roleplay.getCharacter().Info.FingerPrint) .. "" .. "\n" .. "${color.primary}\226\128\162 " .. "\216\167\217\132\216\172\217\134\216\179\217\138\216\169 \194\187  #FFFFFF" .. tostring(exports.roleplay.getCharacter().country and var1[exports.roleplay.getCharacter().country] or "Unknown") .. "" .. "\n" .. "${color.primary}\226\128\162 " .. "\216\167\217\132\217\133\217\135\217\134\216\169 \194\187  #FFFFFF" .. (getElementData(localPlayer, "job") or "Unemployed") .. "\n" .. "${color.primary}\226\128\162 " .. "\216\167\217\132\217\133\216\167\217\132 \194\187  #00FF00" .. "$" .. tostring(convertNumber((getPlayerMoney()))) .. "\n" .. "${color.primary}\226\128\162 " .. "\216\167\217\132\216\173\216\179\216\167\216\168 \216\167\217\132\216\168\217\134\217\131\217\138 \216\167\217\132\216\177\216\166\217\138\216\179\217\138 \194\187  #FFFFFF" .. tostring(exports.roleplay.getCharacter().Info.BankAccount or "\217\132\216\167\217\138\217\136\216\172\216\175") .. [[


]] .. ""
    })
    eui:uiSetText(UI.label.level, "Level ${color.primary} " .. tostring(exports["level-system"]:getPlayerLevel()))
    eui:uiSetText(UI.label.level_exp, "" .. tostring(exports["level-system"]:getPlayerLevel()) .. " / " .. tostring(exports["level-system"]:getPlayerLevel()) .. "")
    eui:uiSetText(UI.label.play_time, {
      en = [[
Play Time

]] .. tostring((convertTimeToString((exports["play-time"]:getCurrentPlayTime())))),
      ar = "\217\136\217\130\216\170 \216\167\217\132\217\132\216\185\216\168\n\n" .. tostring((convertTimeToString((exports["play-time"]:getCurrentPlayTime()))))
    })
    eui:uiProgressBarSetProgress(UI.progressbar[1], exports["level-system"]:getPlayerLevel() / exports["level-system"]:getPlayerLevel() * 100)
    for forvar21, forvar22 in ipairs(exports.roleplay.getCharacter().Info.Languages or {"English"}) do
    end
    eui:uiSetText(UI.label[4], {
      en = "${color.primary}\226\128\162 " .. "Marital Status \194\187  #FFFFFF" .. (exports.roleplay.getCharacter().Info.marital_status or "Single") .. [[


]] .. "${color.primary}\226\128\162 " .. "Languages: #FFFFFF" .. "\n" .. ("" .. "${color.primary}  \194\187 #FFFFFF" .. tostring(forvar22) .. " " .. "(100%)" .. "\n") .. "\n" .. "${color.primary}\226\128\162 " .. "Cars Driving License:  #FFFFFF" .. (getElementData(localPlayer, "license.Vehicles") and "Yes" or "#FF0000No") .. "\n" .. "${color.primary}\226\128\162 " .. "Boats Driving License:  #FFFFFF" .. (getElementData(localPlayer, "license.Boats") and "Yes" or "#FF0000No") .. "\n" .. "${color.primary}\226\128\162 " .. "Aircraft Driving License:  #FFFFFF" .. (getElementData(localPlayer, "license.Aircraft") and "Yes" or "#FF0000No") .. "\n" .. "${color.primary}\226\128\162 " .. "Pilots License:  #FFFFFF" .. (#{} == 0 and "#FF0000No" or "Yes"),
      ar = "${color.primary}\226\128\162 " .. "\216\167\217\132\216\173\216\167\217\132\216\169 \216\167\217\132\216\167\216\172\216\170\217\133\216\167\216\185\217\138\216\169 \194\187  #FFFFFF" .. (exports.roleplay.getCharacter().Info.marital_status and ({Single = "\216\163\216\185\216\178\216\168", Married = "\217\133\216\170\216\178\217\136\216\172"})[exports.roleplay.getCharacter().Info.marital_status] or "\216\163\216\185\216\178\216\168") .. [[


]] .. "${color.primary}\226\128\162 " .. "\216\167\217\132\217\132\216\186\216\167\216\170: #FFFFFF" .. "\n" .. ("" .. "${color.primary}  \194\187 #FFFFFF" .. tostring(forvar22) .. " " .. "(100%)" .. "\n") .. "\n" .. "${color.primary}\226\128\162 " .. "\216\177\216\174\216\181\216\169 \217\130\217\138\216\167\216\175\216\169 \216\167\217\132\216\179\217\138\216\167\216\177\216\167\216\170:  #FFFFFF" .. (getElementData(localPlayer, "license.Vehicles") and "\217\134\216\185\217\133" or "#FF0000\217\132\216\167") .. "\n" .. "${color.primary}\226\128\162 " .. "\216\177\216\174\216\181\216\169 \217\130\217\138\216\167\216\175\216\169 \216\167\217\132\217\130\217\136\216\167\216\177\216\168:  #FFFFFF" .. (getElementData(localPlayer, "license.Boats") and "\217\134\216\185\217\133" or "#FF0000\217\132\216\167") .. "\n" .. "${color.primary}\226\128\162 " .. "\216\177\216\174\216\181\216\169 \217\130\217\138\216\167\216\175\216\169 \216\167\217\132\216\183\216\167\216\166\216\177\216\167\216\170:  #FFFFFF" .. (getElementData(localPlayer, "license.Aircraft") and "\217\134\216\185\217\133" or "#FF0000\217\132\216\167") .. "\n" .. "${color.primary}\226\128\162 " .. "\216\177\216\174\216\181\216\169 \216\167\217\132\216\183\217\138\216\177\216\167\217\134:  #FFFFFF" .. (#{} == 0 and "#FF0000\217\132\216\167" or "\217\134\216\185\217\133")
    })
    eui:uiSetText(UI.label.username, "Current Username: " .. tostring(getElementData(localPlayer, "character:account")))
  end
end)
addEventHandler("onClientUITabSwitched", root, function(arg0, arg1)
  if arg1 == UI.tab[2] then
    if getTickCount() - var0.vehicles < 10000 then
      return
    end
    var0.vehicles = getTickCount()
    triggerServerEvent("main-menu:characterInfo:getVehicles", localPlayer)
  elseif arg1 == UI.tab[3] then
    if 10000 > getTickCount() - var0.interiors then
      return
    end
    var0.interiors = getTickCount()
    triggerServerEvent("main-menu:characterInfo:getInteriors", localPlayer)
  elseif arg1 == UI.tab["leaderboard:levels"] then
    updateLeaderboard("levels")
  elseif arg1 == UI.tab["leaderboard:activities"] then
    updateLeaderboard("activities")
  end
end)
function updateLeaderboard(arg0)
  if getTickCount() - var0["leaderboard:" .. arg0] < 10000 then
    return
  end
  var0["leaderboard:" .. arg0] = getTickCount()
  triggerServerEvent("leaderboard:get", localPlayer, arg0)
end
addEvent("main-menu:characterInfo:getVehicles:callback", true)
addEventHandler("main-menu:characterInfo:getVehicles:callback", localPlayer, function(arg0, arg1)
  eui:uiSetText(UI.label.vehicles, "Vehicles  #FFFFFF" .. "( ${color.primary}" .. tostring(#arg0) .. "#ffffff / " .. tostring(arg1) .. " )")
  eui:uiGridListClear(UI.gridlist.vehicles)
  for forvar6, forvar7 in ipairs(arg0) do
    if forvar7.impounded then
    elseif forvar7.hidden == 1 then
      eui:uiGridListSetItemColor(UI.gridlist.vehicles, eui:uiGridListAddRow(UI.gridlist.vehicles), 2, tocolor(180, 180, 180, 255))
    end
    eui:uiGridListSetItemText(UI.gridlist.vehicles, eui:uiGridListAddRow(UI.gridlist.vehicles), 1, tostring(forvar7.ID))
    eui:uiGridListSetItemColor(UI.gridlist.vehicles, eui:uiGridListAddRow(UI.gridlist.vehicles), 1, eui:uiGetThemeColor("primary"))
    eui:uiGridListSetItemText(UI.gridlist.vehicles, eui:uiGridListAddRow(UI.gridlist.vehicles), 2, (forvar7.Name .. "  |  #FF0000(Impounded)#FFFFFF") .. "  |  (Hidden)")
    eui:uiGridListSetItemText(UI.gridlist.vehicles, eui:uiGridListAddRow(UI.gridlist.vehicles), 3, forvar7.plate or "")
  end
end)
addEvent("main-menu:characterInfo:getInteriors:callback", true)
addEventHandler("main-menu:characterInfo:getInteriors:callback", localPlayer, function(arg0, arg1)
  eui:uiSetText(UI.label.interiors, "Interiors  #FFFFFF" .. "( ${color.primary}" .. tostring(#arg0) .. "#ffffff / " .. tostring(arg1) .. " )")
  eui:uiGridListClear(UI.gridlist.interiors)
  for forvar6, forvar7 in ipairs(arg0) do
    eui:uiGridListSetItemText(UI.gridlist.interiors, eui:uiGridListAddRow(UI.gridlist.interiors), 1, tostring(forvar7.id))
    eui:uiGridListSetItemColor(UI.gridlist.interiors, eui:uiGridListAddRow(UI.gridlist.interiors), 1, eui:uiGetThemeColor("primary"))
    eui:uiGridListSetItemText(UI.gridlist.interiors, eui:uiGridListAddRow(UI.gridlist.interiors), 2, tostring(forvar7.name))
    eui:uiGridListSetItemText(UI.gridlist.interiors, eui:uiGridListAddRow(UI.gridlist.interiors), 3, tostring(forvar7.status))
    if forvar7.status == "rented" then
      eui:uiGridListSetItemColor(UI.gridlist.interiors, eui:uiGridListAddRow(UI.gridlist.interiors), 3, tocolor(255, 255, 0))
      eui:uiGridListSetItemText(UI.gridlist.interiors, eui:uiGridListAddRow(UI.gridlist.interiors), 3, tostring(forvar7.status) .. " ($" .. tostring(forvar7.price) .. ")")
    elseif forvar7.status == "owned" then
      eui:uiGridListSetItemColor(UI.gridlist.interiors, eui:uiGridListAddRow(UI.gridlist.interiors), 3, tocolor(168, 255, 168))
    end
  end
end)
addEvent("leaderboard:get:response", true)
addEventHandler("leaderboard:get:response", localPlayer, function(arg0, arg1)
  eui:uiGridListClear(UI.gridlist["leaderboard:" .. arg0])
  if arg0 == "levels" then
    for forvar6, forvar7 in ipairs(arg1) do
      eui:uiGridListSetItemText(UI.gridlist["leaderboard:" .. arg0], eui:uiGridListAddRow(UI.gridlist["leaderboard:" .. arg0]), 1, tostring(forvar6) .. ".")
      eui:uiGridListSetItemText(UI.gridlist["leaderboard:" .. arg0], eui:uiGridListAddRow(UI.gridlist["leaderboard:" .. arg0]), 2, tostring(forvar7.name))
      eui:uiGridListSetItemText(UI.gridlist["leaderboard:" .. arg0], eui:uiGridListAddRow(UI.gridlist["leaderboard:" .. arg0]), 3, tostring(forvar7.level))
    end
  elseif arg0 == "activities" then
    for forvar6, forvar7 in ipairs(arg1) do
      eui:uiGridListSetItemText(UI.gridlist["leaderboard:" .. arg0], eui:uiGridListAddRow(UI.gridlist["leaderboard:" .. arg0]), 1, tostring(forvar6) .. ".")
      eui:uiGridListSetItemText(UI.gridlist["leaderboard:" .. arg0], eui:uiGridListAddRow(UI.gridlist["leaderboard:" .. arg0]), 2, tostring(forvar7.name))
      eui:uiGridListSetItemText(UI.gridlist["leaderboard:" .. arg0], eui:uiGridListAddRow(UI.gridlist["leaderboard:" .. arg0]), 3, tostring(forvar7.points))
    end
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
function convertTimeToString(arg0)
  arg0 = tonumber(arg0)
  return math.floor(arg0 / (24 * (60 * 60))) .. "d " .. math.floor(arg0 % (24 * (60 * 60)) / (60 * 60)) .. "h " .. math.floor(arg0 % (24 * (60 * 60)) % (60 * 60) / 60) .. "m"
end
