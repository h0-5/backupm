-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

addEventHandler("onClientResourceStart", resourceRoot, function()
  engineImportTXD(engineLoadTXD("model/iphone.txd"), 330)
  engineReplaceModel(engineLoadDFF("model/phone.dff"), 330)
  engineReplaceCOL(engineLoadCOL("model/phone.col"), 330)
end)
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
  image = {},
  app = {},
  appIcon = {},
  browser = {},
  container = {},
  screen = {}
}
function UIKitReady()
  eui = exports.UIKit
  UI.window.SIM = eui:uiCreateWindow(false, false, 420, 325, "SIM Cards")
  eui:uiSetVisible(UI.window.SIM, false)
  eui:uiWindowSetMovable(UI.window.SIM, false)
  UI.label["SIM:Info"] = eui:uiCreateLabel(0, 50, 420, 20, {
    en = "Phone numbers registered in your name",
    ar = "\216\163\216\177\217\130\216\167\217\133 \216\167\217\132\217\135\217\136\216\167\216\170\217\129 \216\167\217\132\217\133\216\179\216\172\217\132\216\169 \216\168\216\167\216\179\217\133\217\131"
  }, "primary", "center", "top", UI.window.SIM)
  UI.gridlist["SIM:OwnedNumbers"] = eui:uiCreateGridList(10, 75, 400, 120, _, UI.window.SIM)
  eui:uiGridListAddColumn(UI.gridlist["SIM:OwnedNumbers"], "Phone Number", 1)
  eui:uiCreateLabel(0, 205, 420, 20, {
    en = "You can buy a new phone number for $500",
    ar = "\217\138\217\133\217\131\217\134\217\131 \216\180\216\177\216\167\216\161 \216\177\217\130\217\133 \217\135\216\167\216\170\217\129 \216\172\216\175\217\138\216\175 \216\168\216\179\216\185\216\177 $500"
  }, "primary", "center", "top", UI.window.SIM)
  UI.button["SIM:Buy"] = eui:uiCreateButton(10, 235, 195, 35, {
    en = "Buy a new number",
    ar = "\216\180\216\177\216\167\216\161 \216\177\217\130\217\133 \216\172\216\175\217\138\216\175"
  }, _, UI.window.SIM)
  UI.button["SIM:GetCard"] = eui:uiCreateButton(215, 235, 195, 35, {
    en = "Get SIM card ($100)",
    ar = "($100) \216\163\216\174\216\176 \216\167\217\132\216\180\216\177\217\138\216\173\216\169"
  }, _, UI.window.SIM)
  UI.button["SIM:Close"] = eui:uiCreateButton(10, 280, 400, 35, {en = "Close", ar = "\216\165\216\186\217\132\216\167\217\130"}, _, UI.window.SIM)
  UI.image.screen = eui:uiCreateImage(eui:uiGetReferenceScreenSize() - 240 * 1.3 - 40 * 1.3, eui:uiGetReferenceScreenSize() - 500 * 1.3 - 40 * 1.3, 240 * 1.3, 500 * 1.3, ":phone-system/IMG/white_screen.png")
  eui:uiSetVisible(UI.image.screen, false)
  eui:uiSetProperty(UI.image.screen, "DisableFocus", "True")
  eui:uiSetColor(UI.image.screen, 10, 10, 10, 255)
  UI.image.wallpaper = eui:uiCreateImage(0, 0, 240 * 1.3, 500 * 1.3, ":phone-system/IMG/wallpaper3.png", UI.image.screen)
  eui:uiSetProperty(UI.image.wallpaper, "Disabled", "True")
  UI.image.device = eui:uiCreateImage(0, 0, 240 * 1.3, 500 * 1.3, dxCreateTexture(":phone-system/IMG/iPhone2.png", "argb", true, "clamp"), UI.image.screen)
  UI.label.clock = eui:uiCreateLabel(40, 20 * 1.3, 60, 15 * 1.3, "\226\128\162\226\128\162\226\128\162\226\128\162\226\128\162 WT", tocolor(255, 255, 255), "left", "top", UI.image.device)
  eui:uiSetFontSize(UI.label.clock, 0.8)
  UI.label.clock = eui:uiCreateLabel(240 * 1.3 - 80, 20 * 1.3, 60, 15 * 1.3, "9:41 AM", tocolor(255, 255, 255), "left", "top", UI.image.device)
  eui:uiSetFontSize(UI.label.clock, 0.8)
  UI.label.home_screen = eui:uiCreateLabel(0, 0, 240 * 1.3, 500 * 1.3, "", tocolor(255, 255, 255), "left", "top", UI.image.device)
  eui:uiSetProperty(eui:uiCreateRectangle((240 * 1.3 - 50 * 1.3 * 4) / 2, 500 * 1.3 - 75 * 1.3, 50 * 1.3 * 4, 55 * 1.3, tocolor(0, 0, 0, 100), true, true, true, true, UI.label.home_screen), "border_radius", 16)
  UI.appIcon[1] = eui:uiCreateImage((240 * 1.3 - (45 * 1.3 + 1 * 1.3) * 4) / 2, 500 * 1.3 - 70 * 1.3, 45 * 1.3, 45 * 1.3, ":phone-system/IMG/Phone.png", UI.label.home_screen)
  UI.appIcon[2] = eui:uiCreateImage((240 * 1.3 - (45 * 1.3 + 1 * 1.3) * 4) / 2 + (45 * 1.3 + 1 * 1.3), 500 * 1.3 - 70 * 1.3, 45 * 1.3, 45 * 1.3, ":phone-system/IMG/Contacts.png", UI.label.home_screen)
  UI.appIcon[3] = eui:uiCreateImage((240 * 1.3 - (45 * 1.3 + 1 * 1.3) * 4) / 2 + (45 * 1.3 + 1 * 1.3) * 2, 500 * 1.3 - 70 * 1.3, 45 * 1.3, 45 * 1.3, ":phone-system/IMG/Messages.png", UI.label.home_screen)
  UI.appIcon[4] = eui:uiCreateImage((240 * 1.3 - (45 * 1.3 + 1 * 1.3) * 4) / 2 + (45 * 1.3 + 1 * 1.3) * 3, 500 * 1.3 - 70 * 1.3, 45 * 1.3, 45 * 1.3, ":phone-system/IMG/Settings.png", UI.label.home_screen)
  UI.appIcon[5] = eui:uiCreateImage((240 * 1.3 - 50 * 1.3 * 4) / 2, 60, 50 * 1.3, 50 * 1.3, ":phone-system/IMG/Wallet.png", UI.label.home_screen)
  UI.appIcon[6] = eui:uiCreateImage((240 * 1.3 - 50 * 1.3 * 4) / 2 + 50 * 1.3, 60, 50 * 1.3, 50 * 1.3, ":phone-system/IMG/Notes.png", UI.label.home_screen)
  UI.appIcon[7] = eui:uiCreateImage((240 * 1.3 - 50 * 1.3 * 4) / 2 + 50 * 1.3 * 2, 60, 50 * 1.3, 50 * 1.3, ":phone-system/IMG/taxi.png", UI.label.home_screen)
  UI.appIcon[8] = eui:uiCreateImage((240 * 1.3 - 50 * 1.3 * 4) / 2 + 50 * 1.3 * 3, 60, 50 * 1.3, 50 * 1.3, ":phone-system/IMG/Safari.png", UI.label.home_screen)
  UI.appIcon[9] = eui:uiCreateImage((240 * 1.3 - 50 * 1.3 * 4) / 2, 60 + 70, 50 * 1.3, 50 * 1.3, ":phone-system/IMG/WhatsApp.png", UI.label.home_screen)
  UI.appIcon[10] = eui:uiCreateImage((240 * 1.3 - 50 * 1.3 * 4) / 2 + 50 * 1.3, 60 + 70, 50 * 1.3, 50 * 1.3, ":phone-system/IMG/Flights.png", UI.label.home_screen)
  UI.appIcon[11] = eui:uiCreateImage((240 * 1.3 - 50 * 1.3 * 4) / 2 + 50 * 1.3 * 2, 60 + 70, 50 * 1.3, 50 * 1.3, ":phone-system/IMG/electricity.png", UI.label.home_screen)
  UI.appIcon[12] = eui:uiCreateImage((240 * 1.3 - 50 * 1.3 * 4) / 2 + 50 * 1.3 * 3, 60 + 70, 50 * 1.3, 50 * 1.3, ":phone-system/IMG/health.png", UI.label.home_screen)
  UI.appIcon[13] = eui:uiCreateImage((240 * 1.3 - 50 * 1.3 * 4) / 2, 60 + 70 + 70, 50 * 1.3, 50 * 1.3, ":phone-system/IMG/traffic_tickets.png", UI.label.home_screen)
  UI.appIcon[14] = eui:uiCreateImage((240 * 1.3 - 50 * 1.3 * 4) / 2 + 50 * 1.3, 60 + 70 + 70, 50 * 1.3, 50 * 1.3, ":phone-system/IMG/activities.png", UI.label.home_screen)
  for forvar19 = 1, 14 do
    eui:uiSetProperty(UI.appIcon[forvar19], "HoverOpacityEffect", true)
  end
  var0[UI.appIcon[1]] = "phone"
  var0[UI.appIcon[2]] = "contacts"
  var0[UI.appIcon[3]] = "messages"
  var0[UI.appIcon[4]] = "settings"
  var0[UI.appIcon[5]] = "bank"
  var0[UI.appIcon[6]] = "notes"
  var0[UI.appIcon[7]] = "taxi"
  var0[UI.appIcon[8]] = "safari"
  var0[UI.appIcon[9]] = "whatsapp"
  var0[UI.appIcon[10]] = "airport"
  var0[UI.appIcon[11]] = "electricity"
  var0[UI.appIcon[12]] = "health"
  var0[UI.appIcon[13]] = "traffic"
  var0[UI.appIcon[14]] = "activities"
  UI.app.settings = eui:uiCreateContainer(5, 0, 240 * 1.3 - 10, 500 * 1.3, UI.image.device)
  eui:uiSetVisible(UI.app.settings, false)
  UI.label.Title = eui:uiCreateLabel(30, 50, 240 * 1.3 - 10 - 40, 20, {
    en = "Settings",
    ar = "\216\167\217\132\216\165\216\185\216\175\216\167\216\175\216\167\216\170"
  }, tocolor(255, 255, 255, 255), "left", "top", UI.app.settings)
  eui:uiSetFont(UI.label.Title, "default-large")
  eui:uiCreateRectangle(15, 90, 240 * 1.3 - 10 - 30, 1, tocolor(255, 255, 255, 25), false, false, false, false, UI.app.settings)
  UI.label.device_info = eui:uiCreateLabel(30, 120, 180, 100, "", tocolor(255, 255, 255, 255), "left", "top", UI.app.settings)
  UI.button.remove_SIM = eui:uiCreateButton(20, 230, 240 * 1.3 - 10 - 40, 30, {
    en = "Remove SIM",
    ar = "\216\165\216\174\216\177\216\167\216\172 \216\167\217\132\216\180\216\177\217\138\216\173\216\169"
  }, tocolor(255, 69, 58, 255), UI.app.settings)
  sms_notifications = exports.settings:getSetting("sms_notifications")
  UI.checkbox.toggle_sms_notifications = eui:uiCreateSwitch(25, 310, 240 * 1.3 - 10 - 40, 20, {
    en = "Enable SMS notifications",
    ar = "\216\170\217\129\216\185\217\138\217\132 \216\165\216\180\216\185\216\167\216\177\216\167\216\170 \216\167\217\132\216\177\216\179\216\167\216\166\217\132"
  }, sms_notifications or false, _, UI.app.settings)
  UI.app.phone = eui:uiCreateContainer(5, 0, 240 * 1.3 - 10, 500 * 1.3, UI.image.device)
  eui:uiSetVisible(UI.app.phone, false)
  UI.label["contacts:screen:keypad"] = eui:uiCreateLabel(0, 0, 240 * 1.3 - 10, 500 * 1.3, "", tocolor(255, 255, 255), "left", "top", UI.app.phone)
  UI.label.Title = eui:uiCreateLabel(30, 50, 240 * 1.3 - 10 - 40, 20, {
    en = "Calls",
    ar = "\216\167\217\132\216\167\216\170\216\181\216\167\217\132\216\167\216\170"
  }, tocolor(255, 255, 255, 255), "left", "top", UI.label["contacts:screen:keypad"])
  eui:uiSetFont(UI.label.Title, "default-large")
  eui:uiCreateRectangle(15, 90, 240 * 1.3 - 10 - 30, 1, tocolor(255, 255, 255, 25), false, false, false, false, UI.label["contacts:screen:keypad"])
  UI.edit.phone_number = eui:uiCreateEdit(30, 120, 240 * 1.3 - 10 - 60, 30, "", "Phone number", _, UI.label["contacts:screen:keypad"])
  eui:uiSetFont(UI.edit.phone_number, "default-large")
  UI.button.call = eui:uiCreateImage((240 * 1.3 - 10 - 60) / 2, 170, 60, 60, ":phone-system/IMG/icons/accept_call.png", UI.label["contacts:screen:keypad"])
  eui:uiSetProperty(UI.button.call, "HoverOpacityEffect", true)
  UI.gridlist.recent_calls = eui:uiCreateGridList(20, 250, 240 * 1.3 - 10 - 40, 500 * 1.3 - 300, tocolor(0, 0, 0, 0), UI.label["contacts:screen:keypad"])
  eui:uiGridListAddColumn(UI.gridlist.recent_calls, "Recents", 0.8)
  eui:uiGridListAddColumn(UI.gridlist.recent_calls, "", 0.2)
  eui:uiSetAlign(UI.gridlist.recent_calls, "left", "center")
  eui:uiSetProperty(UI.gridlist.recent_calls, "color_coded", true)
  UI.label["contacts:screen:call"] = eui:uiCreateLabel(0, 0, 240 * 1.3 - 10, 500 * 1.3, "", tocolor(255, 255, 255), "left", "top", UI.app.phone)
  eui:uiSetVisible(UI.label["contacts:screen:call"], false)
  UI.button["call:cancel"] = eui:uiCreateImage((240 * 1.3 - 10 - 60) / 2, 370, 60, 60, ":phone-system/IMG/icons/decline_call.png", UI.label["contacts:screen:call"])
  eui:uiSetProperty(UI.button["call:cancel"], "HoverOpacityEffect", true)
  UI.button["call:end"] = eui:uiCreateImage((240 * 1.3 - 10 - 60) / 2, 370, 60, 60, ":phone-system/IMG/icons/decline_call.png", UI.label["contacts:screen:call"])
  eui:uiSetProperty(UI.button["call:end"], "HoverOpacityEffect", true)
  UI.button["call:decline"] = eui:uiCreateImage((240 * 1.3 - 10) / 2 - 80, 370, 50, 50, ":phone-system/IMG/icons/decline_call.png", UI.label["contacts:screen:call"])
  eui:uiSetProperty(UI.button["call:decline"], "HoverOpacityEffect", true)
  UI.button["call:accept"] = eui:uiCreateImage((240 * 1.3 - 10) / 2 + 30, 370, 50, 50, ":phone-system/IMG/icons/accept_call.png", UI.label["contacts:screen:call"])
  eui:uiSetProperty(UI.button["call:accept"], "HoverOpacityEffect", true)
  UI.label["call:number"] = eui:uiCreateLabel(20, 100, 240 * 1.3 - 10 - 40, 30, "00000000", tocolor(255, 255, 255, 255), "center", "center", UI.label["contacts:screen:call"])
  eui:uiSetFont(UI.label["call:number"], "default-large")
  UI.label["call:text"] = eui:uiCreateLabel(20, 130, 240 * 1.3 - 10 - 40, 20, "", tocolor(255, 255, 255, 200), "center", "center", UI.label["contacts:screen:call"])
  eui:uiSetVisible(UI.button["call:cancel"], false)
  eui:uiSetVisible(UI.button["call:end"], false)
  eui:uiSetVisible(UI.button["call:decline"], false)
  eui:uiSetVisible(UI.button["call:accept"], false)
  UI.app.contacts = eui:uiCreateContainer(5, 0, 240 * 1.3 - 10, 500 * 1.3, UI.image.device)
  eui:uiSetVisible(UI.app.contacts, false)
  eui:uiCreateRectangle(15, 90, 240 * 1.3 - 10 - 30, 1, tocolor(255, 255, 255, 25), false, false, false, false, UI.app.contacts)
  UI.label["contacts:screen:1"] = eui:uiCreateLabel(0, 0, 240 * 1.3 - 10, 500 * 1.3, "", tocolor(255, 255, 255), "left", "top", UI.app.contacts)
  UI.label.Title = eui:uiCreateLabel(30, 50, 200, 20, {
    en = "Contacts",
    ar = "\216\172\217\135\216\167\216\170 \216\167\217\132\216\167\216\170\216\181\216\167\217\132"
  }, tocolor(255, 255, 255, 255), "left", "top", UI.label["contacts:screen:1"])
  eui:uiSetFont(UI.label.Title, "default-large")
  UI.gridlist.contacts = eui:uiCreateGridList(15, 90, 240 * 1.3 - 10 - 30, 500 * 1.3 - 250, tocolor(0, 0, 0, 0), UI.label["contacts:screen:1"])
  eui:uiGridListAddColumn(UI.gridlist.contacts, "", 1)
  eui:uiSetAlign(UI.gridlist.contacts, "left", "center")
  eui:uiSetProperty(UI.gridlist.contacts, "row_height", 30)
  eui:uiSetProperty(UI.gridlist.contacts, "columns_names_visible", "False")
  eui:uiSetProperty(UI.gridlist.contacts, "column_height", 0)
  UI.button.chat_with_contact = eui:uiCreateButton(20, 500 * 1.3 - 70 - 70, 240 * 1.3 - 10 - 40, 30, {
    en = "Chat via WhatsApp",
    ar = "\217\133\216\173\216\167\216\175\216\171\216\169 \216\185\216\168\216\177 \216\167\217\132\217\136\216\167\216\170\216\179\216\167\216\168"
  }, tocolor(43, 183, 65, 255), UI.label["contacts:screen:1"])
  UI.button.remove_contact = eui:uiCreateButton(20, 500 * 1.3 - 70 - 35, 240 * 1.3 - 10 - 40, 30, {
    en = "Remove Contact",
    ar = "\216\173\216\176\217\129 \216\172\217\135\216\169 \216\167\217\132\216\167\216\170\216\181\216\167\217\132"
  }, tocolor(255, 69, 58, 255), UI.label["contacts:screen:1"])
  UI.button.add_contact = eui:uiCreateButton(20, 500 * 1.3 - 70, 240 * 1.3 - 10 - 40, 30, {
    en = "Add Contact",
    ar = "\216\165\216\182\216\167\217\129\216\169 \216\172\217\135\216\169 \216\167\216\170\216\181\216\167\217\132"
  }, tocolor(0, 122, 255, 255), UI.label["contacts:screen:1"])
  UI.label["contacts:screen:2"] = eui:uiCreateLabel(0, 0, 240 * 1.3 - 10, 500 * 1.3, "", tocolor(255, 255, 255), "left", "top", UI.app.contacts)
  eui:uiSetVisible(UI.label["contacts:screen:2"], false)
  UI.label["contacts:screen:2:topbar"] = eui:uiCreateLabel(0, 50, 240 * 1.3 - 10, 30, {
    en = "Add Contact",
    ar = "\216\165\216\182\216\167\217\129\216\169 \216\172\217\135\216\169 \216\167\216\170\216\181\216\167\217\132"
  }, tocolor(255, 255, 255, 255), "center", "center", UI.label["contacts:screen:2"])
  UI.button["add_contact:return"] = eui:uiCreateImage(25, 8, 16, 16, ":phone-system/IMG/icons/left-arrow.png", UI.label["contacts:screen:2:topbar"])
  eui:uiSetProperty(UI.button["add_contact:return"], "HoverOpacityEffect", true)
  UI.edit["add_contact:name"] = eui:uiCreateEdit(25, 120, 190, 30, "", "Name", _, UI.label["contacts:screen:2"])
  UI.edit["add_contact:phone"] = eui:uiCreateEdit(25, 160, 190, 30, "", "Phone number", _, UI.label["contacts:screen:2"])
  UI.button["add_contact:add"] = eui:uiCreateButton(25, 240 * 1.3 - 10 - 30, 240 * 1.3 - 10 - 50, 30, {en = "Add", ar = "\216\165\216\182\216\167\217\129\216\169"}, tocolor(0, 122, 255, 240), UI.label["contacts:screen:2"])
  UI.app.messages = eui:uiCreateContainer(5, 0, 240 * 1.3 - 10, 500 * 1.3, UI.image.device)
  eui:uiSetVisible(UI.app.messages, false)
  UI.label["messages:screen1"] = eui:uiCreateLabel(0, 0, 240 * 1.3 - 10, 500 * 1.3, "", tocolor(255, 255, 255), "left", "top", UI.app.messages)
  UI.label.Title = eui:uiCreateLabel(30, 50, 200, 20, {
    en = "Messages",
    ar = "\216\167\217\132\216\177\216\179\216\167\216\166\217\132"
  }, tocolor(255, 255, 255, 255), "left", "top", UI.label["messages:screen1"])
  eui:uiSetFont(UI.label.Title, "default-large")
  eui:uiCreateRectangle(15, 90, 240 * 1.3 - 10 - 30, 1, tocolor(255, 255, 255, 25), false, false, false, false, UI.label["messages:screen1"])
  UI.gridlist.messages = eui:uiCreateGridList(15, 90, 240 * 1.3 - 10 - 30, 500 * 1.3 - 90 - 20, tocolor(10, 10, 10, 0), UI.label["messages:screen1"])
  eui:uiGridListAddColumn(UI.gridlist.messages, "", 1)
  eui:uiSetAlign(UI.gridlist.messages, "left", "center")
  eui:uiSetProperty(UI.gridlist.messages, "row_height", 50)
  eui:uiSetProperty(UI.gridlist.messages, "columns_names_visible", "False")
  eui:uiSetProperty(UI.gridlist.messages, "column_height", 0)
  eui:uiSetProperty(UI.gridlist.messages, "color_coded", true)
  UI.label["messages:chatScreen"] = eui:uiCreateLabel(0, 0, 240 * 1.3 - 10, 500 * 1.3, "", tocolor(255, 255, 255), "left", "top", UI.app.messages)
  eui:uiSetVisible(UI.label["messages:chatScreen"], false)
  UI.label["messages:chatScreen:topbar"] = eui:uiCreateLabel(0, 50, 240 * 1.3 - 10, 30, {en = "", ar = ""}, tocolor(255, 255, 255, 255), "center", "center", UI.label["messages:chatScreen"])
  UI.button["messages:chat:return"] = eui:uiCreateImage(25, 8, 16, 16, ":phone-system/IMG/icons/left-arrow.png", UI.label["messages:chatScreen:topbar"])
  eui:uiSetProperty(UI.button["messages:chat:return"], "HoverOpacityEffect", true)
  UI.label["messages:chat:message"] = eui:uiCreateLabel(25, 100, 190, 300, "", tocolor(255, 255, 255), "left", "top", UI.label["messages:chatScreen"])
  eui:uiSetProperty(UI.label["messages:chat:message"], "color_coded", false)
  eui:uiSetProperty(UI.label["messages:chat:message"], "word_break", true)
  UI.app.wallet = eui:uiCreateContainer(5, 0, 240 * 1.3 - 10, 500 * 1.3, UI.image.device)
  eui:uiSetVisible(UI.app.wallet, false)
  UI.label["wallet:screen:main"] = eui:uiCreateLabel(0, 0, 240 * 1.3 - 10, 500 * 1.3, "", tocolor(255, 255, 255), "left", "top", UI.app.wallet)
  UI.label.Title = eui:uiCreateLabel(30, 50, 200, 20, {en = "Wallet", ar = "Wallet"}, tocolor(255, 255, 255, 255), "left", "top", UI.label["wallet:screen:main"])
  eui:uiSetFont(UI.label.Title, "default-large")
  eui:uiCreateRectangle(15, 90, 240 * 1.3 - 10 - 30, 1, tocolor(255, 255, 255, 25), false, false, false, false, UI.label["wallet:screen:main"])
  eui:uiCreateLabel(30, 100, 240 * 1.3 - 10 - 60, 20, {
    en = "Your Bank Accounts",
    ar = "\216\173\216\179\216\167\216\168\216\167\216\170\217\131 \216\167\217\132\216\168\217\134\217\131\217\138\216\169"
  }, tocolor(255, 255, 255, 255), "center", "top", UI.label["wallet:screen:main"])
  UI.gridlist.bank_accounts = eui:uiCreateGridList(15, 130, 240 * 1.3 - 10 - 30, 300, tocolor(10, 10, 10, 0), UI.label["wallet:screen:main"])
  eui:uiGridListAddColumn(UI.gridlist.bank_accounts, "", 1)
  eui:uiSetAlign(UI.gridlist.bank_accounts, "left", "center")
  eui:uiSetProperty(UI.gridlist.bank_accounts, "row_height", 30)
  eui:uiSetProperty(UI.gridlist.bank_accounts, "columns_names_visible", "False")
  eui:uiSetProperty(UI.gridlist.bank_accounts, "column_height", 0)
  UI.button.copy_bankaccount_id = eui:uiCreateButton(20, 500 * 1.3 - 70, 240 * 1.3 - 10 - 40, 30, {
    en = "Copy Account ID",
    ar = "\217\134\216\179\216\174 \217\133\216\185\216\177\217\129 \216\167\217\132\216\173\216\179\216\167\216\168"
  }, tocolor(0, 122, 255, 255), UI.label["wallet:screen:main"])
  UI.label["wallet:screen:account"] = eui:uiCreateLabel(0, 0, 240 * 1.3 - 10, 500 * 1.3, "", tocolor(255, 255, 255), "left", "top", UI.app.wallet)
  eui:uiSetVisible(UI.label["wallet:screen:account"], false)
  UI.button["wallet:account:return"] = eui:uiCreateImage(25, 58, 16, 16, "IMG/icons/left-arrow.png", UI.label["wallet:screen:account"])
  eui:uiSetProperty(UI.button["wallet:account:return"], "HoverOpacityEffect", true)
  eui:uiCreateLabel(30, 100, 180, 20, {
    en = "Account Balance",
    ar = "\216\177\216\181\217\138\216\175 \216\167\217\132\216\173\216\179\216\167\216\168"
  }, tocolor(255, 255, 255, 255), "center", "top", UI.label["wallet:screen:account"])
  UI.label["wallet:balance"] = eui:uiCreateLabel(30, 130, 180, 30, "$10000", tocolor(0, 255, 0, 255), "center", "center", UI.label["wallet:screen:account"])
  eui:uiSetFont(UI.label["wallet:balance"], "default-large")
  eui:uiCreateLabel(30, 200, 180, 20, {
    en = "Transfer Amount",
    ar = "\216\170\216\173\217\136\217\138\217\132 \217\133\216\168\217\132\216\186"
  }, tocolor(255, 255, 255, 255), "center", "top", UI.label["wallet:screen:account"])
  UI.edit["wallet:transfer:account"] = eui:uiCreateEdit(25, 230, 190, 30, "", {
    en = "Account ID",
    ar = "\217\133\216\185\216\177\217\129 \216\167\217\132\216\173\216\179\216\167\216\168"
  }, _, UI.label["wallet:screen:account"])
  UI.edit["wallet:transfer:amount"] = eui:uiCreateEdit(25, 270, 190, 30, "", {
    en = "Amount",
    ar = "\216\167\217\132\217\133\216\168\217\132\216\186"
  }, _, UI.label["wallet:screen:account"])
  eui:uiCreateLabel(30, 300, 180, 100, {
    en = [[
		You can transfer limited amounts
		To transfer larger amounts you
		must go to the bank
	]],
    ar = "\t\t\216\170\216\179\216\170\216\183\217\138\216\185 \216\170\216\173\217\136\217\138\217\132 \217\133\216\168\216\167\217\132\216\186 \217\133\216\173\216\175\217\136\216\175\216\169\n\t\t\217\132\216\170\216\173\217\136\217\138\217\132 \217\133\216\168\216\167\217\132\216\186 \216\163\217\131\216\168\216\177 \217\138\216\172\216\168 \216\185\217\132\217\138\217\131\n\t\t\216\167\217\132\216\176\217\135\216\167\216\168 \217\132\217\132\216\168\217\134\217\131\n\t"
  }, tocolor(255, 255, 255, 255), "center", "center", UI.label["wallet:screen:account"])
  UI.button["wallet:tranfser"] = eui:uiCreateButton(25, 400, 240 * 1.3 - 10 - 50, 30, {en = "Transfer", ar = "\216\170\216\173\217\136\217\138\217\132"}, tocolor(0, 122, 255, 240), UI.label["wallet:screen:account"])
  UI.app.notes = eui:uiCreateContainer(5, 0, 240 * 1.3 - 10, 500 * 1.3, UI.image.device)
  eui:uiSetVisible(UI.app.notes, false)
  UI.label["notes:screen1"] = eui:uiCreateLabel(0, 0, 240 * 1.3 - 10, 500 * 1.3, "", tocolor(255, 255, 255), "left", "top", UI.app.notes)
  UI.label.Title = eui:uiCreateLabel(30, 50, 200, 20, {
    en = "Notes",
    ar = "\216\167\217\132\217\133\217\132\216\167\216\173\216\184\216\167\216\170"
  }, tocolor(255, 255, 255, 255), "left", "top", UI.label["notes:screen1"])
  eui:uiSetFont(UI.label.Title, "default-large")
  eui:uiCreateRectangle(15, 90, 240 * 1.3 - 10 - 30, 1, tocolor(255, 255, 255, 25), false, false, false, false, UI.label["notes:screen1"])
  UI.memo.notes = eui:uiCreateMemo(15, 95, 240 * 1.3 - 10 - 30, 500 * 1.3 - 95 - 60, "", tocolor(255, 255, 255, 200), UI.label["notes:screen1"])
  UI.button["notes:save"] = eui:uiCreateButton(20, 500 * 1.3 - 55, 240 * 1.3 - 10 - 40, 25, {
    en = "Save Notes",
    ar = "\216\173\217\129\216\184 \216\167\217\132\217\133\217\132\216\167\216\173\216\184\216\167\216\170"
  }, tocolor(0, 122, 255, 255), UI.label["notes:screen1"])
  UI.app.taxi = eui:uiCreateContainer(5, 0, 240 * 1.3 - 10, 500 * 1.3, UI.image.device)
  eui:uiSetVisible(UI.app.taxi, false)
  UI.app.safari = eui:uiCreateContainer(5, 0, 240 * 1.3 - 10, 500 * 1.3, UI.image.device)
  eui:uiSetVisible(UI.app.safari, false)
  UI.browser.safari = eui:uiCreateBrowser(15, 60, 240 * 1.3 - 10 - 30, 500 * 1.3 - 120, false, false, UI.app.safari)
  theBrowser = eui:uiGetBrowser(UI.browser.safari)
  setBrowserProperty(theBrowser, "mobile", "1")
  addEventHandler("onClientBrowserCreated", theBrowser, function()
    loadBrowserURL(source, "https://www.google.com/")
  end)
  UI.app.whatsapp = eui:uiCreateContainer(5, 0, 240 * 1.3 - 10, 500 * 1.3, UI.image.device)
  eui:uiSetVisible(UI.app.whatsapp, false)
  UI.container["whatsapp:screen:main"] = eui:uiCreateContainer(0, 0, 240 * 1.3 - 10, 500 * 1.3, UI.app.whatsapp)
  UI.label.Title = eui:uiCreateLabel(30, 60, 200, 20, {en = "WhatsApp", ar = "WhatsApp"}, tocolor(255, 255, 255, 255), "left", "top", UI.container["whatsapp:screen:main"])
  eui:uiSetFont(UI.label.Title, "default-large")
  eui:uiCreateRectangle(15, 90, 240 * 1.3 - 10 - 30, 1, tocolor(255, 255, 255, 25), false, false, false, false, UI.container["whatsapp:screen:main"])
  UI.button["whatsapp:start_new_chat"] = eui:uiCreateImage(240 * 1.3 - 10 - 50, 65, 15, 15, ":assets/icons/plus.png", UI.container["whatsapp:screen:main"])
  eui:uiSetProperty(UI.button["whatsapp:start_new_chat"], "HoverOpacityEffect", true)
  UI.gridlist.whatsapp = eui:uiCreateGridList(15, 90, 240 * 1.3 - 10 - 30, 500 * 1.3 - 150, tocolor(10, 10, 10, 0), UI.container["whatsapp:screen:main"])
  eui:uiGridListAddColumn(UI.gridlist.whatsapp, "", 1)
  eui:uiSetAlign(UI.gridlist.whatsapp, "left", "center")
  eui:uiSetProperty(UI.gridlist.whatsapp, "row_height", 30)
  eui:uiSetProperty(UI.gridlist.whatsapp, "columns_names_visible", "False")
  eui:uiSetProperty(UI.gridlist.whatsapp, "column_height", 0)
  UI.container["whatsapp:screen:startchat"] = eui:uiCreateContainer(0, 0, 240 * 1.3 - 10, 500 * 1.3, UI.app.whatsapp)
  eui:uiSetVisible(UI.container["whatsapp:screen:startchat"], false)
  UI.label["whatsapp:screen:startchat:topbar"] = eui:uiCreateLabel(0, 50, 240 * 1.3 - 10, 30, {en = "", ar = ""}, tocolor(255, 255, 255, 255), "center", "center", UI.container["whatsapp:screen:startchat"])
  UI.button["whatsapp:screen:startchat:return"] = eui:uiCreateImage(25, 8, 16, 16, ":phone-system/IMG/icons/left-arrow.png", UI.label["whatsapp:screen:startchat:topbar"])
  eui:uiSetProperty(UI.button["whatsapp:screen:startchat:return"], "HoverOpacityEffect", true)
  UI.edit["whatsapp:screen:startchat:phone"] = eui:uiCreateEdit(25, 150, 240 * 1.3 - 10 - 50, 35, "", {
    en = "Phone Number",
    ar = "\216\177\217\130\217\133 \216\167\217\132\217\135\216\167\216\170\217\129"
  }, _, UI.container["whatsapp:screen:startchat"])
  UI.button["whatsapp:screen:startchat:start"] = eui:uiCreateButton(25, 210, 240 * 1.3 - 10 - 50, 35, {
    en = "Start Chat",
    ar = "\216\168\216\175\216\163 \217\133\216\173\216\167\216\175\216\171\216\169"
  }, tocolor(0, 122, 255, 240), UI.container["whatsapp:screen:startchat"])
  UI.container["whatsapp:screen:chat"] = eui:uiCreateContainer(0, 0, 240 * 1.3 - 10, 500 * 1.3, UI.app.whatsapp)
  eui:uiSetVisible(UI.container["whatsapp:screen:chat"], false)
  UI.label["whatsapp:screen:chat:topbar"] = eui:uiCreateLabel(0, 50, 240 * 1.3 - 10, 30, {en = "", ar = ""}, tocolor(255, 255, 255, 255), "center", "center", UI.container["whatsapp:screen:chat"])
  UI.button["whatsapp:screen:chat:return"] = eui:uiCreateImage(25, 8, 16, 16, ":phone-system/IMG/icons/left-arrow.png", UI.label["whatsapp:screen:chat:topbar"])
  eui:uiSetProperty(UI.button["whatsapp:screen:chat:return"], "HoverOpacityEffect", true)
  eui:uiCreateImage(15, 90, 240 * 1.3 - 10 - 30, 500 * 1.3 - 180, ":phone-system/IMG/whatsapp_wallpaper.png", UI.container["whatsapp:screen:chat"])
  UI.browser.whatsapp = eui:uiCreateBrowser(15, 90, 240 * 1.3 - 10 - 30, 500 * 1.3 - 180, true, true, UI.container["whatsapp:screen:chat"])
  whatsapp_browser = eui:uiGetBrowser(UI.browser.whatsapp)
  setBrowserProperty(whatsapp_browser, "mobile", "1")
  addEventHandler("onClientBrowserCreated", whatsapp_browser, function()
    loadBrowserURL(source, "http://mta/phone-system/html/whatsapp.html")
  end)
  UI.edit["whatsapp:input"] = eui:uiCreateEdit(20, 500 * 1.3 - 80, 240 * 1.3 - 10 - 40, 30, "", {en = "Text", ar = "\216\167\217\132\217\134\216\181"}, _, UI.container["whatsapp:screen:chat"])
  UI.button["whatsapp:send_location"] = eui:uiCreateImage(240 * 1.3 - 10 - 66, 500 * 1.3 - 37, 16, 16, "IMG/icons/location.png", UI.container["whatsapp:screen:chat"])
  eui:uiSetProperty(UI.button["whatsapp:send_location"], "HoverOpacityEffect", true)
  UI.app.airport = eui:uiCreateContainer(5, 0, 240 * 1.3 - 10, 500 * 1.3, UI.image.device)
  eui:uiSetVisible(UI.app.airport, false)
  UI.label["airport:screen:main"] = eui:uiCreateLabel(0, 0, 240 * 1.3 - 10, 500 * 1.3, "", tocolor(255, 255, 255), "left", "top", UI.app.airport)
  UI.label.Title = eui:uiCreateLabel(30, 50, 200, 20, {
    en = "Travel Tickets",
    ar = "Travel Tickets"
  }, tocolor(255, 255, 255, 255), "left", "top", UI.label["airport:screen:main"])
  eui:uiSetFont(UI.label.Title, "default-large")
  eui:uiCreateRectangle(15, 90, 240 * 1.3 - 10 - 30, 1, tocolor(255, 255, 255, 25), false, false, false, false, UI.label["airport:screen:main"])
  eui:uiCreateLabel(30, 100, 240 * 1.3 - 10 - 60, 20, {
    en = "Your Tickets",
    ar = "\216\170\216\176\216\167\217\131\216\177\217\131"
  }, tocolor(255, 255, 255, 255), "center", "top", UI.label["airport:screen:main"])
  UI.gridlist.travel_tickets = eui:uiCreateGridList(15, 130, 240 * 1.3 - 10 - 30, 400, tocolor(10, 10, 10, 0), UI.label["airport:screen:main"])
  eui:uiGridListAddColumn(UI.gridlist.travel_tickets, "", 1)
  eui:uiSetAlign(UI.gridlist.travel_tickets, "left", "center")
  eui:uiSetProperty(UI.gridlist.travel_tickets, "row_height", 30)
  eui:uiSetProperty(UI.gridlist.travel_tickets, "columns_names_visible", "False")
  eui:uiSetProperty(UI.gridlist.travel_tickets, "column_height", 0)
  UI.label.travel_ticket_details = eui:uiCreateLabel(25, 440, 240 * 1.3 - 10 - 50, 50, "", tocolor(255, 255, 255), "left", "top", UI.label["airport:screen:main"])
  UI.button.buy_travel_ticket = eui:uiCreateButton(20, 500 * 1.3 - 75, 240 * 1.3 - 10 - 40, 35, {
    en = "Buy Travel Ticket",
    ar = "\216\180\216\177\216\167\216\161 \216\170\216\176\217\131\216\177\216\169 \216\179\217\129\216\177"
  }, tocolor(0, 122, 255, 255), UI.label["airport:screen:main"])
  UI.label["airport:screen:buy_ticket"] = eui:uiCreateLabel(0, 0, 240 * 1.3 - 10, 500 * 1.3, "", tocolor(255, 255, 255), "left", "top", UI.app.airport)
  eui:uiSetVisible(UI.label["airport:screen:buy_ticket"], false)
  UI.label["airport:buy_ticket:title"] = eui:uiCreateLabel(0, 50, 240 * 1.3 - 10, 30, {
    en = "Buy Ticket",
    ar = "\216\180\216\177\216\167\216\161 \216\170\216\176\217\131\216\177\216\169"
  }, tocolor(255, 255, 255, 255), "center", "center", UI.label["airport:screen:buy_ticket"])
  UI.button["airport:buy_ticket:return"] = eui:uiCreateImage(25, 58, 16, 16, "IMG/icons/left-arrow.png", UI.label["airport:screen:buy_ticket"])
  eui:uiSetProperty(UI.button["airport:buy_ticket:return"], "HoverOpacityEffect", true)
  UI.gridlist["airport:buy_ticket:from"] = eui:uiCreateGridList(25, 100, 240 * 1.3 - 10 - 50, 150, tocolor(0, 0, 0, 0), UI.label["airport:screen:buy_ticket"])
  eui:uiGridListAddColumn(UI.gridlist["airport:buy_ticket:from"], "From", 1)
  UI.gridlist["airport:buy_ticket:to"] = eui:uiCreateGridList(25, 260, 240 * 1.3 - 10 - 50, 150, tocolor(0, 0, 0, 0), UI.label["airport:screen:buy_ticket"])
  eui:uiGridListAddColumn(UI.gridlist["airport:buy_ticket:to"], "To", 1)
  UI.label["airport:buy_ticket:price"] = eui:uiCreateLabel(25, 500 * 1.3 - 110, 240 * 1.3 - 10 - 50, 20, "$0", tocolor(0, 255, 0, 255), "center", "top", UI.label["airport:screen:buy_ticket"])
  UI.button["airport:buy_ticket"] = eui:uiCreateButton(25, 500 * 1.3 - 80, 240 * 1.3 - 10 - 50, 35, {en = "Buy", ar = "\216\180\216\177\216\167\216\161"}, tocolor(0, 122, 255, 240), UI.label["airport:screen:buy_ticket"])
  for forvar20, forvar21 in ipairs({
    "Los Santos",
    "San Fierro",
    "Las Venturas",
    "Cayo Perico"
  }) do
    eui:uiGridListSetItemText(UI.gridlist["airport:buy_ticket:from"], eui:uiGridListAddRow(UI.gridlist["airport:buy_ticket:from"]), 1, forvar21)
    eui:uiGridListSetItemText(UI.gridlist["airport:buy_ticket:to"], eui:uiGridListAddRow(UI.gridlist["airport:buy_ticket:to"]), 1, forvar21)
  end
  UI.app.electricity = eui:uiCreateContainer(5, 0, 240 * 1.3 - 10, 500 * 1.3, UI.image.device)
  eui:uiSetVisible(UI.app.electricity, false)
  UI.app.traffic = eui:uiCreateContainer(5, 0, 240 * 1.3 - 10, 500 * 1.3, UI.image.device)
  eui:uiSetVisible(UI.app.traffic, false)
  UI.app.bank = eui:uiCreateContainer(5, 0, 240 * 1.3 - 10, 500 * 1.3, UI.image.device)
  eui:uiSetVisible(UI.app.bank, false)
  UI.app.activities = eui:uiCreateContainer(5, 0, 240 * 1.3 - 10, 500 * 1.3, UI.image.device)
  eui:uiSetVisible(UI.app.activities, false)
  UI.app.health = eui:uiCreateContainer(5, 0, 240 * 1.3 - 10, 500 * 1.3, UI.image.device)
  eui:uiSetVisible(UI.app.health, false)
  UI.label.Title = eui:uiCreateLabel(30, 50, 240 * 1.3 - 10 - 40, 20, {en = "Health", ar = "\216\167\217\132\216\181\216\173\216\169"}, tocolor(255, 74, 74, 255), "left", "top", UI.app.health)
  eui:uiSetFont(UI.label.Title, "default-large")
  eui:uiCreateRectangle(15, 90, 240 * 1.3 - 10 - 30, 1, tocolor(255, 255, 255, 25), false, false, false, false, UI.app.health)
  for forvar21, forvar22 in ipairs({
    {
      title = {
        en = "Fat",
        ar = "\216\167\217\132\216\179\217\133\217\134\216\169"
      },
      stat = "fat"
    },
    {
      title = {
        en = "Stamina",
        ar = "\217\130\217\136\216\169 \216\167\217\132\216\170\216\173\217\133\217\132"
      },
      stat = "stamina"
    },
    {
      title = {
        en = "Muscle",
        ar = "\216\167\217\132\216\185\216\182\217\132\216\167\216\170"
      },
      stat = "muscle"
    }
  }) do
    eui:uiCreateLabel(30, 150, 240 * 1.3 - 10 - 60, 20, forvar22.title, tocolor(255, 74, 74, 255), "left", "top", UI.app.health)
    UI.label["health:" .. forvar22.stat] = eui:uiCreateLabel(30, 150, 240 * 1.3 - 10 - 60, 20, "0 / 0", tocolor(255, 255, 255, 255), "right", "top", UI.app.health)
    UI.progressbar["health:" .. forvar22.stat] = eui:uiCreateProgressBar(30, 150 + 25, 240 * 1.3 - 10 - 60, 5, tocolor(255, 255, 255, 240), UI.app.health)
    eui:uiSetProperty(UI.progressbar["health:" .. forvar22.stat], "show_progress", false)
  end
  HOME_BUTTON = eui:uiCreateRectangle((240 * 1.3 - 10 - 100 * 1.3) / 2, 500 * 1.3 - 20 * 1.3, 100 * 1.3, 5, tocolor(255, 255, 255, 200), false, false, false, false, UI.image.device)
  eui:uiSetProperty(HOME_BUTTON, "HoverOpacityEffect", true)
end
addEventHandler("onClientUIReady", resourceRoot, UIKitReady)
addEvent("onClientUIKitReady", true)
addEventHandler("onClientUIKitReady", root, UIKitReady)
function calculateTravelTicketPrice()
  if eui:uiGridListGetSelectedItem(UI.gridlist["airport:buy_ticket:from"]) ~= -1 then
  end
  if eui:uiGridListGetSelectedItem(UI.gridlist["airport:buy_ticket:to"]) ~= -1 then
  end
  eui:uiSetText(UI.label["airport:buy_ticket:price"], "$" .. tostring(var0[eui:uiGridListGetItemText(UI.gridlist["airport:buy_ticket:from"], eui:uiGridListGetSelectedItem(UI.gridlist["airport:buy_ticket:from"]), 1)][eui:uiGridListGetItemText(UI.gridlist["airport:buy_ticket:to"], eui:uiGridListGetSelectedItem(UI.gridlist["airport:buy_ticket:to"]), 1)]))
end
addEvent("phone:receiveSMS", true)
addEventHandler("phone:receiveSMS", root, function(arg0, arg1, arg2, arg3)
  if not hasPhone() then
    return
  end
  table.insert(var0, {
    id = arg3,
    title = tostring(arg0) .. [[

#a3a3a3]] .. utfSub(string.gsub(split(arg1, "\n")[1], "\n", ""), 1, math.min(utfLen((string.gsub(split(arg1, "\n")[1], "\n", ""))), 35)) .. "...",
    message = "" .. ("" .. arg2.hour .. ":" .. arg2.minute .. ":" .. arg2.second) .. [[


]] .. arg1
  })
  reloadSMS()
  if sms_notifications then
    exports.notifications:output({
      en = "New SMS from (" .. tostring(arg0) .. ")",
      ar = "(" .. tostring(arg0) .. ") \216\177\216\179\216\167\217\132\216\169 \217\134\216\181\217\138\216\169 \216\172\216\175\217\138\216\175\216\169 \217\133\217\134"
    }, 10000, "info", "right")
  end
end)
function reloadSMS()
  eui:uiGridListClear(UI.gridlist.messages)
  for forvar4 = 1, #var0 do
    eui:uiGridListSetItemText(UI.gridlist.messages, eui:uiGridListAddRow(UI.gridlist.messages), 1, var0[#var0 - forvar4 + 1].title)
    eui:uiGridListSetItemData(UI.gridlist.messages, eui:uiGridListAddRow(UI.gridlist.messages), 1, var0[#var0 - forvar4 + 1].message)
  end
end
addEvent("phone:deleteSMS", true)
addEventHandler("phone:deleteSMS", root, function(arg0)
  for forvar4 = 1, #var0 do
    if var0[forvar4].id and var0[forvar4].id == arg0 then
      table.remove(var0, forvar4)
      break
    end
  end
  _FOR_()
end)
addEvent("telecom:showPhoneNumbers", true)
addEventHandler("telecom:showPhoneNumbers", root, function(arg0)
  eui:uiSetVisible(UI.window.SIM, true)
  showCursor(true)
  eui:uiGridListClear(UI.gridlist["SIM:OwnedNumbers"])
  for forvar4, forvar5 in ipairs(arg0) do
    eui:uiGridListSetItemText(UI.gridlist["SIM:OwnedNumbers"], eui:uiGridListAddRow(UI.gridlist["SIM:OwnedNumbers"]), 1, forvar5.phone_number)
  end
end)
function getCurrentGameTime()
  if #tostring(getTime()) == 1 then
  end
  x = getTime() <= 0 and "AM" or "PM"
  return getTime() % 12 .. ":" .. ("0" .. getTime()) .. " " .. x
end
;({
  currentApp = false,
  data = false,
  item = false,
  call = {},
  default_contacts = {
    {"Emergency", 911}
  }
}).open = function(arg0, arg1)
  if not eui:uiGetVisible(UI.image.screen) then
    bindKey("mouse2", "down", var0.cursor_visible)
    exports.notifications:showKeyDescription("phone:cursor", "Right Click", "Show/Hide Cursor")
  end
  eui:uiSetVisible(UI.image.screen, true)
  var0.item = arg0
  if not arg0.SpecialProperties.serial or not var1[arg0.SpecialProperties.serial] then
    triggerServerEvent("phone:data:request", localPlayer, arg0)
  end
  triggerServerEvent("phone:onOpen", localPlayer, arg1)
  eui:uiSetText(UI.label.device_info, "Serial Number: " .. tostring(arg0.SpecialProperties.serial) .. [[

Phone Number: ]] .. tostring(arg0.SpecialProperties.phone_number or "N/A") .. [[

Voucher: ]] .. tostring(arg0.SpecialProperties.voucher or 0))
  eui:uiSetText(UI.label.clock, getCurrentGameTime())
  if not isTimer(update_clock_timer) then
    update_clock_timer = setTimer(function()
      eui:uiSetText(UI.label.clock, getCurrentGameTime())
    end, 2000, 0)
  end
end
;({
  currentApp = false,
  data = false,
  item = false,
  call = {},
  default_contacts = {
    {"Emergency", 911}
  }
}).cursor_visible = function(arg0, arg1)
  var0.cursor_status = not var0.cursor_status
  showCursor(var0.cursor_status)
end
;({
  currentApp = false,
  data = false,
  item = false,
  call = {},
  default_contacts = {
    {"Emergency", 911}
  }
}).close = function(arg0)
  if eui:uiGetVisible(UI.image.screen) then
    eui:uiSetVisible(UI.image.screen, false)
    triggerServerEvent("phone:onClose", localPlayer, arg0)
    showCursor(false)
    focusBrowser()
    var0.cursor_status = false
    unbindKey("mouse2", "down", var0.cursor_visible)
    exports.notifications:hideKeyDescription("phone:cursor")
    if isTimer(update_clock_timer) then
      killTimer(update_clock_timer)
    end
  end
end
addEvent("onClientPlayerQuitFromCharacter", true)
addEventHandler("onClientPlayerQuitFromCharacter", localPlayer, function(arg0)
  if eui:uiSetVisible(UI.image.screen) then
    var0.close()
  end
end)
function closeUI()
  if eui:uiSetVisible(UI.image.screen) then
    var0.close()
  end
end
addEventHandler("onClientPlayerWasted", localPlayer, closeUI)
addEventHandler("onClientUseItem", root, function(arg0, arg1, arg2, arg3)
  if not arg1 then
    return
  end
  if arg2.Type == "Phone" then
    if eui:uiGetVisible(UI.image.screen) then
      var0.close(true)
    else
      exports["inventory-system"]:showInventory(false)
      var0.open(arg2, true)
    end
  end
end)
function hasPhone()
  if not getElementData(localPlayer, "character:id") then
    return false
  end
  for forvar5, forvar6 in ipairs((exports["inventory-system"]:getInventoryItems("character:" .. tostring((getElementData(localPlayer, "character:id")))))) do
    if forvar6.Type == "Phone" then
      return true
    end
  end
  return false
end
addCommandHandler("phone", function()
  if not getElementData(localPlayer, "character:id") then
    return
  end
  if isPedDead(localPlayer) then
    return
  end
  if eui:uiGetVisible(UI.image.screen) then
    var0.close(true)
  else
    for forvar6, forvar7 in ipairs((exports["inventory-system"]:getInventoryItems("character:" .. tostring((getElementData(localPlayer, "character:id")))))) do
      if forvar7.Type == "Phone" then
        var0.open(forvar7, true)
        break
      end
    end
    if not true then
      exports.notifications:output({
        en = "You don't have a phone",
        ar = "\217\132\217\138\216\179 \217\132\216\175\217\138\217\131 \216\172\217\136\216\167\217\132"
      }, 3000, "warning", "top")
    end
  end
end, false, false)
bindKey("F3", "down", "phone")
addEvent("onClientRemoveItem", true)
addEventHandler("onClientRemoveItem", root, function(arg0, arg1, arg2)
  if arg1 and arg2.Type == "Phone" and var0.item and var0.item.ID == arg0 then
    var0.close()
    if arg2.SpecialProperties.serial and var1[arg2.SpecialProperties.serial] then
      var1[arg2.SpecialProperties.serial] = nil
    end
  end
end)
addEvent("phone:data:request:callback", true)
addEventHandler("phone:data:request:callback", localPlayer, function(arg0)
  var0.data = arg0
  var0.currentID = arg0.id
  var1[arg0.id] = arg0
  eui:uiSetText(UI.memo.notes, arg0.notes or "")
  eui:uiGridListClear(UI.gridlist.contacts)
  for forvar4, forvar5 in ipairs(var0.default_contacts) do
    eui:uiGridListSetItemText(UI.gridlist.contacts, eui:uiGridListAddRow(UI.gridlist.contacts), 1, forvar5[1] .. "  (" .. forvar5[2] .. ")")
    eui:uiGridListSetItemData(UI.gridlist.contacts, eui:uiGridListAddRow(UI.gridlist.contacts), 1, forvar5[2])
  end
  for forvar4, forvar5 in ipairs(arg0.contacts) do
    eui:uiGridListSetItemText(UI.gridlist.contacts, eui:uiGridListAddRow(UI.gridlist.contacts), 1, forvar5[1] .. "  (" .. forvar5[2] .. ")")
    eui:uiGridListSetItemData(UI.gridlist.contacts, eui:uiGridListAddRow(UI.gridlist.contacts), 1, forvar5[2])
  end
end)
addEvent("phone:requestBankAccounts:callback", true)
addEventHandler("phone:requestBankAccounts:callback", localPlayer, function(arg0)
  eui:uiGridListClear(UI.gridlist.bank_accounts)
  for forvar4, forvar5 in ipairs(arg0) do
    eui:uiGridListSetItemText(UI.gridlist.bank_accounts, eui:uiGridListAddRow(UI.gridlist.bank_accounts), 1, tostring(forvar5.code))
    eui:uiGridListSetItemData(UI.gridlist.bank_accounts, eui:uiGridListAddRow(UI.gridlist.bank_accounts), 1, forvar5.amount)
  end
end)
addEvent("phone:app:request", false)
;({
  currentApp = false,
  data = false,
  item = false,
  call = {},
  default_contacts = {
    {"Emergency", 911}
  }
}).openApp = function(arg0)
  if var0.currentApp then
    eui:uiSetVisible(UI.app[var0.currentApp], false)
  else
    eui:uiSetVisible(UI.image.wallpaper, false)
    eui:uiSetVisible(UI.label.home_screen, false)
  end
  var0.currentApp = arg0
  eui:uiSetVisible(UI.app[arg0], true)
  triggerEvent("phone:app:request", localPlayer, arg0, UI.app[arg0], 15, 40, eui:uiGetSize(UI.app[arg0]) - 30, eui:uiGetSize(UI.app[arg0]) - 80)
end
addEventHandler("onClientUIClick", root, function()
  if source == UI.button["SIM:Close"] then
    eui:uiSetVisible(UI.window.SIM, false)
    showCursor(false)
  elseif source == UI.button["SIM:Buy"] then
    triggerServerEvent("telecom:buyPhoneNumber", localPlayer)
    eui:uiSetVisible(UI.window.SIM, false)
    showCursor(false)
  elseif source == UI.button["SIM:GetCard"] then
    if eui:uiGridListGetSelectedItem(UI.gridlist["SIM:OwnedNumbers"]) ~= -1 then
      eui:uiGridListSetSelectedItem(UI.gridlist["SIM:OwnedNumbers"], -1)
      triggerServerEvent("telecom:requestSIMCard", localPlayer, (eui:uiGridListGetItemText(UI.gridlist["SIM:OwnedNumbers"], eui:uiGridListGetSelectedItem(UI.gridlist["SIM:OwnedNumbers"]), 1)))
    end
  elseif source == HOME_BUTTON then
    if var0.currentApp then
      eui:uiSetVisible(UI.app[var0.currentApp], false)
      eui:uiSetVisible(UI.image.wallpaper, true)
      eui:uiSetVisible(UI.label.home_screen, true)
      var0.currentApp = false
      focusBrowser()
    else
      var0.close(true)
    end
  elseif var1[source] then
    var0.openApp(var1[source])
    if var1[source] == "wallet" then
      triggerServerEvent("phone:requestBankAccounts", localPlayer)
    elseif var1[source] == "whatsapp" then
      whatsappChatList()
    elseif var1[source] == "airport" then
      triggerServerEvent("airport:get_travel_tickets", localPlayer)
    elseif var1[source] == "health" then
      eui:uiSetText(UI.label["health:fat"], tostring((exports.roleplay:getCharacterStat(21))) .. " / 1000")
      eui:uiSetText(UI.label["health:stamina"], tostring((exports.roleplay:getCharacterStat(22))) .. " / 1000")
      eui:uiSetText(UI.label["health:muscle"], tostring((exports.roleplay:getCharacterStat(23))) .. " / 1000")
      eui:uiProgressBarSetProgress(UI.progressbar["health:fat"], exports.roleplay:getCharacterStat(21) / 1000 * 100)
      eui:uiProgressBarSetProgress(UI.progressbar["health:stamina"], exports.roleplay:getCharacterStat(22) / 1000 * 100)
      eui:uiProgressBarSetProgress(UI.progressbar["health:muscle"], exports.roleplay:getCharacterStat(23) / 1000 * 100)
    end
  elseif source == UI.button.remove_SIM then
    if var0.item and var0.item.SpecialProperties.phone_number then
      triggerServerEvent("phone:SIM:remove", localPlayer, var0.item)
      var0.item.SpecialProperties.phone_number = nil
    end
  elseif source == UI.button["notes:save"] then
    if eui:uiGetText(UI.memo.notes) ~= var0.data.notes then
      triggerServerEvent("phone:notes:save", localPlayer, var0.currentID, (eui:uiGetText(UI.memo.notes)))
      var0.data.notes = eui:uiGetText(UI.memo.notes)
    end
  elseif source == UI.button.add_contact then
    eui:uiSetVisible(UI.label["contacts:screen:1"], false)
    eui:uiSetVisible(UI.label["contacts:screen:2"], true)
    eui:uiSetText(UI.edit["add_contact:name"], "")
    eui:uiSetText(UI.edit["add_contact:phone"], "")
  elseif source == UI.button.remove_contact then
    if eui:uiGridListGetSelectedItem(UI.gridlist.contacts) ~= -1 then
      eui:uiGridListSetSelectedItem(UI.gridlist.contacts, -1)
      eui:uiGridListRemoveRow(UI.gridlist.contacts, (eui:uiGridListGetSelectedItem(UI.gridlist.contacts)))
      triggerServerEvent("phone:contacts:remove", localPlayer, var0.currentID, (eui:uiGridListGetItemData(UI.gridlist.contacts, eui:uiGridListGetSelectedItem(UI.gridlist.contacts), 1)))
    end
  elseif source == UI.button.chat_with_contact then
    if eui:uiGridListGetSelectedItem(UI.gridlist.contacts) ~= -1 then
      var0.openApp("whatsapp")
      openWhatsappChat((eui:uiGridListGetItemData(UI.gridlist.contacts, eui:uiGridListGetSelectedItem(UI.gridlist.contacts), 1)))
    end
  elseif source == UI.button["add_contact:return"] then
    eui:uiSetVisible(UI.label["contacts:screen:2"], false)
    eui:uiSetVisible(UI.label["contacts:screen:1"], true)
  elseif source == UI.button["add_contact:add"] then
    if var0.currentID then
      if utf8.len((eui:uiGetText(UI.edit["add_contact:name"]))) < 2 then
        exports.notifications:output({
          en = "The name is too short",
          ar = "\216\167\217\132\216\167\216\179\217\133 \217\130\216\181\217\138\216\177 \216\172\216\175\216\167\217\139"
        }, 3000, "error")
        return
      end
      if utf8.len((eui:uiGetText(UI.edit["add_contact:name"]))) > 25 then
        exports.notifications:output({
          en = "The name is too long",
          ar = "\216\167\217\132\216\167\216\179\217\133 \216\183\217\136\217\138\217\132 \216\172\216\175\216\167\217\139"
        }, 3000, "error")
        return
      end
      if not tonumber((eui:uiGetText(UI.edit["add_contact:phone"]))) then
        exports.notifications:output({
          en = "Invalid phone number",
          ar = "\216\177\217\130\217\133 \216\167\217\132\217\135\216\167\216\170\217\129 \216\186\217\138\216\177 \216\181\216\173\217\138\216\173"
        }, 3000, "error")
        return
      end
      if not (utf8.len((eui:uiGetText(UI.edit["add_contact:phone"]))) > 0) or not (utf8.len((eui:uiGetText(UI.edit["add_contact:phone"]))) < 10) then
        exports.notifications:output({
          en = "Invalid phone number",
          ar = "\216\177\217\130\217\133 \216\167\217\132\217\135\216\167\216\170\217\129 \216\186\217\138\216\177 \216\181\216\173\217\138\216\173"
        }, 3000, "error")
        return
      end
      triggerServerEvent("phone:contacts:add", localPlayer, var0.currentID, eui:uiGetText(UI.edit["add_contact:name"]), (eui:uiGetText(UI.edit["add_contact:phone"])))
      eui:uiSetVisible(UI.label["contacts:screen:2"], false)
      eui:uiSetVisible(UI.label["contacts:screen:1"], true)
    end
  elseif source == UI.button.call then
    if tonumber((eui:uiGetText(UI.edit.phone_number))) then
      if getTickCount() - var2 <= 2000 then
        return
      end
      var2 = getTickCount()
      call((eui:uiGetText(UI.edit.phone_number)))
    end
  elseif source == UI.button["call:cancel"] then
    hideCallScreen()
    triggerServerEvent("onPlayerEndCall", localPlayer, CallData)
  elseif source == UI.button["call:accept"] then
    triggerServerEvent("onPlayerAcceptCall", localPlayer, currentCaller, CallData)
  elseif source == UI.button["call:decline"] then
    hideCallScreen()
    triggerServerEvent("onPlayerEndCall", localPlayer, CallData)
  elseif source == UI.button["call:end"] then
    hideCallScreen()
    triggerServerEvent("onPlayerEndCall", localPlayer, CallData)
  elseif source == UI.button["messages:chat:return"] then
    eui:uiSetVisible(UI.label["messages:chatScreen"], false)
    eui:uiSetVisible(UI.label["messages:screen1"], true)
  elseif source == UI.button["wallet:account:return"] then
    eui:uiSetVisible(UI.label["wallet:screen:account"], false)
    eui:uiSetVisible(UI.label["wallet:screen:main"], true)
    var0.currentWalletAccount = nil
  elseif source == UI.button.copy_bankaccount_id then
    if eui:uiGridListGetSelectedItem(UI.gridlist.bank_accounts) ~= -1 then
      setClipboard((eui:uiGridListGetItemText(UI.gridlist.bank_accounts, eui:uiGridListGetSelectedItem(UI.gridlist.bank_accounts), 1)))
      exports.notifications:output({
        en = "ID copied",
        ar = "\216\170\217\133 \217\134\216\179\216\174 \216\167\217\132\217\133\216\185\216\177\217\129"
      }, 3000, "success")
    end
  elseif source == UI.button["wallet:tranfser"] then
    if not var0.currentWalletAccount then
      return
    end
    if eui:uiGetText(UI.edit["wallet:transfer:account"]) ~= "" and tonumber((eui:uiGetText(UI.edit["wallet:transfer:amount"]))) and 0 < tonumber((eui:uiGetText(UI.edit["wallet:transfer:amount"]))) then
      if tonumber((eui:uiGetText(UI.edit["wallet:transfer:amount"]))) > 20000 then
        exports.notifications:output({
          en = "You can't transfer that much amount",
          ar = "\217\132\216\167\217\138\217\133\217\131\217\134\217\131 \216\170\216\173\217\136\217\138\217\132 \217\135\216\176\216\167 \216\167\217\132\217\133\216\168\217\132\216\186 \216\167\217\132\217\131\216\168\217\138\216\177"
        }, 3500, "error")
        return
      end
      if var0.currentWalletAccount == eui:uiGetText(UI.edit["wallet:transfer:account"]) then
        return
      end
      eui:uiSetText(UI.edit["wallet:transfer:amount"], "")
      triggerServerEvent("phone:wallet:transfer", localPlayer, var0.currentWalletAccount, eui:uiGetText(UI.edit["wallet:transfer:account"]), (tonumber((eui:uiGetText(UI.edit["wallet:transfer:amount"])))))
    end
  elseif source == UI.button["whatsapp:screen:chat:return"] then
    eui:uiSetVisible(UI.container["whatsapp:screen:chat"], false)
    eui:uiSetVisible(UI.container["whatsapp:screen:main"], true)
    var0.current_whatsapp_phone_number = nil
  elseif source == UI.button["whatsapp:screen:startchat:return"] then
    eui:uiSetVisible(UI.container["whatsapp:screen:startchat"], false)
    eui:uiSetVisible(UI.container["whatsapp:screen:main"], true)
  elseif source == UI.button["whatsapp:start_new_chat"] then
    eui:uiSetVisible(UI.container["whatsapp:screen:main"], false)
    eui:uiSetVisible(UI.container["whatsapp:screen:startchat"], true)
  elseif source == UI.button["whatsapp:screen:startchat:start"] then
    if eui:uiGetText(UI.edit["whatsapp:screen:startchat:phone"]) ~= "" and tonumber((eui:uiGetText(UI.edit["whatsapp:screen:startchat:phone"]))) then
      eui:uiSetVisible(UI.container["whatsapp:screen:startchat"], false)
      openWhatsappChat((eui:uiGetText(UI.edit["whatsapp:screen:startchat:phone"])))
    end
  elseif source == UI.button.buy_travel_ticket then
    eui:uiSetVisible(UI.label["airport:screen:main"], false)
    eui:uiSetVisible(UI.label["airport:screen:buy_ticket"], true)
  elseif source == UI.button["airport:buy_ticket:return"] then
    eui:uiSetVisible(UI.label["airport:screen:buy_ticket"], false)
    eui:uiSetVisible(UI.label["airport:screen:main"], true)
  elseif source == UI.gridlist["airport:buy_ticket:from"] or source == UI.gridlist["airport:buy_ticket:to"] then
    calculateTravelTicketPrice()
  elseif source == UI.button["airport:buy_ticket"] then
    if eui:uiGridListGetSelectedItem(UI.gridlist["airport:buy_ticket:from"]) == -1 then
      return
    end
    if eui:uiGridListGetSelectedItem(UI.gridlist["airport:buy_ticket:to"]) == -1 then
      return
    end
    if eui:uiGridListGetItemText(UI.gridlist["airport:buy_ticket:from"], eui:uiGridListGetSelectedItem(UI.gridlist["airport:buy_ticket:from"]), 1) == eui:uiGridListGetItemText(UI.gridlist["airport:buy_ticket:to"], eui:uiGridListGetSelectedItem(UI.gridlist["airport:buy_ticket:to"]), 1) then
      return
    end
    eui:uiGridListSetSelectedItem(UI.gridlist["airport:buy_ticket:from"], -1)
    eui:uiGridListSetSelectedItem(UI.gridlist["airport:buy_ticket:to"], -1)
    triggerServerEvent("airport:buy_ticket", localPlayer, eui:uiGridListGetItemText(UI.gridlist["airport:buy_ticket:from"], eui:uiGridListGetSelectedItem(UI.gridlist["airport:buy_ticket:from"]), 1), (eui:uiGridListGetItemText(UI.gridlist["airport:buy_ticket:to"], eui:uiGridListGetSelectedItem(UI.gridlist["airport:buy_ticket:to"]), 1)))
  elseif source == UI.gridlist.travel_tickets then
    if eui:uiGridListGetSelectedItem(UI.gridlist.travel_tickets) ~= -1 then
      eui:uiSetText(UI.label.travel_ticket_details, "" .. "" .. "${color.primary}Code: #ffffff" .. tostring(eui:uiGridListGetItemData(UI.gridlist.travel_tickets, eui:uiGridListGetSelectedItem(UI.gridlist.travel_tickets), 1).code) .. "\n" .. "${color.primary}From: #ffffff" .. tostring(eui:uiGridListGetItemData(UI.gridlist.travel_tickets, eui:uiGridListGetSelectedItem(UI.gridlist.travel_tickets), 1).from) .. "\n" .. "${color.primary}To: #ffffff" .. tostring(eui:uiGridListGetItemData(UI.gridlist.travel_tickets, eui:uiGridListGetSelectedItem(UI.gridlist.travel_tickets), 1).to) .. "\n" .. "${color.primary}Purchase Date: #ffffff" .. tostring(eui:uiGridListGetItemData(UI.gridlist.travel_tickets, eui:uiGridListGetSelectedItem(UI.gridlist.travel_tickets), 1).createdAt) .. "")
    else
      eui:uiSetText(UI.label.travel_ticket_details, "")
    end
  elseif source == UI.button["whatsapp:send_location"] then
    if getElementInterior(localPlayer) ~= 0 or getElementDimension(localPlayer) ~= 0 then
      insertWhatsappMessage(var0.currentID, var0.current_whatsapp_phone_number, "Your location could not be determined", "received", "red")
      return
    end
    insertWhatsappMessage(var0.currentID, var0.current_whatsapp_phone_number, "Location (" .. getZoneName(getElementPosition(localPlayer)) .. " - " .. getZoneName(getElementPosition(localPlayer)) .. "), click to see on map", "sent")
    if not var0.item.SpecialProperties.phone_number then
      insertWhatsappMessage(var0.currentID, var0.current_whatsapp_phone_number, "Error. No SIM card!", "received", "red")
      return
    end
    if not var0.item.SpecialProperties.voucher or not (0 < var0.item.SpecialProperties.voucher) then
      insertWhatsappMessage(var0.currentID, var0.current_whatsapp_phone_number, "Error. No Internet!", "received", "red")
      return
    end
    playSound("sounds/send.mp3")
    triggerServerEvent("phone:whatsapp:send", localPlayer, var0.item, var0.item.SpecialProperties.phone_number, var0.current_whatsapp_phone_number, "Location (" .. getZoneName(getElementPosition(localPlayer)) .. " - " .. getZoneName(getElementPosition(localPlayer)) .. "), click to see on map", {
      message_type = "location",
      location = {
        getElementPosition(localPlayer)
      }
    })
    var0.item.SpecialProperties.voucher = (var0.item.SpecialProperties.voucher or 0) - 1
  elseif source == UI.checkbox.toggle_sms_notifications then
    exports.settings:setSetting("sms_notifications", eui:uiSwitchGetSelected(source) and "true" or "false")
    sms_notifications = eui:uiSwitchGetSelected(source)
  end
end)
addEvent("airport:get_travel_tickets:callback", true)
addEventHandler("airport:get_travel_tickets:callback", localPlayer, function(arg0)
  eui:uiGridListClear(UI.gridlist.travel_tickets)
  for forvar4, forvar5 in pairs(arg0) do
    eui:uiGridListSetItemText(UI.gridlist.travel_tickets, eui:uiGridListAddRow(UI.gridlist.travel_tickets), 1, forvar5.code .. "  (To: " .. forvar5.to .. ")")
    eui:uiGridListSetItemData(UI.gridlist.travel_tickets, eui:uiGridListAddRow(UI.gridlist.travel_tickets), 1, forvar5)
  end
end)
addEventHandler("onClientUIAccepted", root, function()
  if source == UI.edit["whatsapp:input"] and eui:uiGetText(source) ~= "" then
    if utf8.len((eui:uiGetText(source))) > 100 then
      exports.notifications:output({
        en = "The message is very long",
        ar = "\216\167\217\132\216\177\216\179\216\167\217\132\216\169 \216\183\217\136\217\138\217\132\216\169 \216\172\216\175\216\167\217\139"
      }, 3500, "error")
      return
    end
    eui:uiSetText(source, "")
    insertWhatsappMessage(var0.currentID, var0.current_whatsapp_phone_number, eui:uiGetText(source), "sent")
    if not var0.item.SpecialProperties.phone_number then
      insertWhatsappMessage(var0.currentID, var0.current_whatsapp_phone_number, "Error. No SIM card!", "received", "red")
      return
    end
    if not var0.item.SpecialProperties.voucher or not (var0.item.SpecialProperties.voucher > 0) then
      insertWhatsappMessage(var0.currentID, var0.current_whatsapp_phone_number, "Error. No Internet!", "received", "red")
      return
    end
    playSound("sounds/send.mp3")
    triggerServerEvent("phone:whatsapp:send", localPlayer, var0.item, var0.item.SpecialProperties.phone_number, var0.current_whatsapp_phone_number, (eui:uiGetText(source)))
    var0.item.SpecialProperties.voucher = (var0.item.SpecialProperties.voucher or 0) - 1
  end
end)
whatsapp_messages = {}
function whatsappChatList()
  if whatsapp_messages[tostring(var0.currentID)] then
    eui:uiGridListClear(UI.gridlist.whatsapp)
    for forvar4, forvar5 in pairs(whatsapp_messages[tostring(var0.currentID)]) do
      eui:uiGridListSetItemText(UI.gridlist.whatsapp, eui:uiGridListAddRow(UI.gridlist.whatsapp), 1, checkContactNumber(tostring(forvar4)))
      eui:uiGridListSetItemData(UI.gridlist.whatsapp, eui:uiGridListAddRow(UI.gridlist.whatsapp), 1, tostring(forvar4))
    end
  end
end
function openWhatsappChat(arg0)
  eui:uiSetVisible(UI.container["whatsapp:screen:main"], false)
  eui:uiSetVisible(UI.container["whatsapp:screen:chat"], true)
  executeBrowserJavascript(whatsapp_browser, "document.body.innerHTML = '';")
  if not whatsapp_messages[tostring(var0.currentID)] then
    whatsapp_messages[tostring(var0.currentID)] = {}
  end
  if not whatsapp_messages[tostring(var0.currentID)][tostring(arg0)] then
    whatsapp_messages[tostring(var0.currentID)][tostring(arg0)] = {
      list = {}
    }
    whatsappChatList()
  end
  for forvar5, forvar6 in ipairs(whatsapp_messages[tostring(var0.currentID)][tostring(arg0)].list or {}) do
    insertWhatsappMessageBox(forvar5, forvar6.text, forvar6.type, forvar6.color, forvar6.data)
  end
  var0.current_whatsapp_phone_number = arg0
  eui:uiSetText(UI.label["whatsapp:screen:chat:topbar"], checkContactNumber(arg0))
end
function insertWhatsappMessageBox(arg0, arg1, arg2, arg3, arg4)
  if arg4 and arg4.message_type then
  end
  executeBrowserJavascript(whatsapp_browser, "\t\tdocument.body.innerHTML += '<div id=\"msg-" .. arg0 .. "\" class=\"message-row " .. arg2 .. " " .. ("" .. " " .. arg4.message_type) .. "\"><div class=\"message" .. (arg3 and " red" or "") .. "\">" .. arg1 .. [[
</div></div>';
		window.scrollTo(0, document.body.scrollHeight);
	]])
end
function insertWhatsappMessage(arg0, arg1, arg2, arg3, arg4, arg5)
  if not whatsapp_messages[tostring(arg0)] then
    whatsapp_messages[tostring(arg0)] = {}
  end
  if not whatsapp_messages[tostring(arg0)][tostring(arg1)] then
    whatsapp_messages[tostring(arg0)][tostring(arg1)] = {
      list = {}
    }
  end
  table.insert(whatsapp_messages[tostring(arg0)][tostring(arg1)].list, {
    text = arg2,
    type = arg3,
    color = arg4,
    data = arg5
  })
  if var0.current_whatsapp_phone_number == arg1 then
    insertWhatsappMessageBox(#whatsapp_messages[tostring(arg0)][tostring(arg1)].list, arg2, arg3, arg4, arg5)
  end
end
addEvent("phone:whatsapp:on_location_click", true)
addEventHandler("phone:whatsapp:on_location_click", root, function(arg0)
  if not split(arg0, "-")[2] then
    return
  end
  if whatsapp_messages[tostring(var0.currentID)][tostring(var0.current_whatsapp_phone_number)].list[tonumber(split(arg0, "-")[2])] and whatsapp_messages[tostring(var0.currentID)][tostring(var0.current_whatsapp_phone_number)].list[tonumber(split(arg0, "-")[2])].data then
    exports.radar:findBestWay(unpack(whatsapp_messages[tostring(var0.currentID)][tostring(var0.current_whatsapp_phone_number)].list[tonumber(split(arg0, "-")[2])].data.location))
    exports.notifications:output({
      en = "The location is marked on the map",
      ar = "\216\170\217\133 \216\170\216\173\216\175\217\138\216\175 \216\167\217\132\217\133\217\136\217\130\216\185 \216\185\217\132\217\137 \216\167\217\132\216\174\216\177\217\138\216\183\216\169"
    }, 4000)
  end
end)
addEvent("phone:whatsapp:receive", true)
addEventHandler("phone:whatsapp:receive", localPlayer, function(arg0, arg1, arg2, arg3)
  insertWhatsappMessage(arg0, arg1, arg2, "received", _, arg3)
  playSound("sounds/notification.mp3")
  if not eui:uiGetVisible(UI.image.screen) then
    exports.notifications:output({
      en = "WhatsApp: Message from " .. tostring((checkContactNumber(arg1))) .. ")",
      ar = "WhatsApp: (" .. tostring((checkContactNumber(arg1))) .. ") \216\177\216\179\216\167\217\132\216\169 \217\133\217\134"
    }, 5000, _, "right")
  end
end)
addEventHandler("onClientUIDoubleClick", root, function()
  if source == UI.gridlist.contacts then
    if eui:uiGridListGetSelectedItem(source) ~= -1 then
      var0.openApp("phone")
      eui:uiSetText(UI.edit.phone_number, tostring((eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1))))
    end
  elseif source == UI.gridlist.messages then
    if eui:uiGridListGetSelectedItem(source) ~= -1 then
      eui:uiSetVisible(UI.label["messages:screen1"], false)
      eui:uiSetVisible(UI.label["messages:chatScreen"], true)
      eui:uiSetText(UI.label["messages:chat:message"], (eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1)))
    end
  elseif source == UI.gridlist.bank_accounts then
    if eui:uiGridListGetSelectedItem(source) ~= -1 then
      eui:uiSetVisible(UI.label["wallet:screen:main"], false)
      eui:uiSetVisible(UI.label["wallet:screen:account"], true)
      eui:uiSetText(UI.label["wallet:balance"], "$" .. exports.public:formatNumber((eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1))))
      var0.currentWalletAccount = eui:uiGridListGetItemText(source, eui:uiGridListGetSelectedItem(source), 1)
    end
  elseif source == UI.gridlist.whatsapp then
    if eui:uiGridListGetSelectedItem(source) ~= -1 then
      openWhatsappChat((eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1)))
    end
  elseif source == UI.gridlist.recent_calls and eui:uiGridListGetSelectedItem(source) ~= -1 then
    call((eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1)))
  end
end)
function checkContactNumber(arg0)
  arg0 = tostring(arg0)
  if var0.data and var0.data.contacts then
    for forvar4, forvar5 in ipairs(var0.data.contacts) do
      if tostring(forvar5[2]) == arg0 then
        return tostring(forvar5[1])
      end
    end
  end
  return arg0
end
addEvent("phone:contacts:add:callback", true)
addEventHandler("phone:contacts:add:callback", root, function(arg0, arg1)
  eui:uiGridListSetItemText(UI.gridlist.contacts, eui:uiGridListAddRow(UI.gridlist.contacts), 1, arg0 .. "  (" .. arg1 .. ")")
  eui:uiGridListSetItemData(UI.gridlist.contacts, eui:uiGridListAddRow(UI.gridlist.contacts), 1, arg1)
end)
function hideCallScreen()
  eui:uiSetVisible(UI.label["contacts:screen:call"], false)
  eui:uiSetVisible(UI.label["contacts:screen:keypad"], true)
end
function showOutgoingCallScreen(arg0)
  var0.openApp("phone")
  eui:uiSetVisible(UI.label["contacts:screen:keypad"], false)
  eui:uiSetVisible(UI.label["contacts:screen:call"], true)
  eui:uiSetVisible(UI.button["call:cancel"], true)
  eui:uiSetVisible(UI.button["call:end"], false)
  eui:uiSetVisible(UI.button["call:decline"], false)
  eui:uiSetVisible(UI.button["call:accept"], false)
  eui:uiSetText(UI.label["call:text"], "Calling...")
  if var0.data and var0.data.contacts then
    for forvar4, forvar5 in ipairs(var0.data.contacts) do
      if tostring(forvar5[2]) == tostring(arg0) then
        eui:uiSetText(UI.label["call:number"], tostring(forvar5[1]))
        return
      end
    end
  end
  eui:uiSetText(UI.label["call:number"], tostring(arg0))
end
function showIncomingCallScreen(arg0)
  var0.openApp("phone")
  eui:uiSetVisible(UI.label["contacts:screen:keypad"], false)
  eui:uiSetVisible(UI.label["contacts:screen:call"], true)
  eui:uiSetVisible(UI.button["call:cancel"], false)
  eui:uiSetVisible(UI.button["call:end"], false)
  eui:uiSetVisible(UI.button["call:decline"], true)
  eui:uiSetVisible(UI.button["call:accept"], true)
  eui:uiSetText(UI.label["call:text"], "iPhone")
  if var0.data and var0.data.contacts then
    for forvar4, forvar5 in ipairs(var0.data.contacts) do
      if tostring(forvar5[2]) == tostring(arg0) then
        eui:uiSetText(UI.label["call:number"], tostring(forvar5[1]))
        return
      end
    end
  end
  eui:uiSetText(UI.label["call:number"], tostring(arg0))
end
function showOngoingCallScreen(arg0)
  var0.openApp("phone")
  eui:uiSetVisible(UI.label["contacts:screen:keypad"], false)
  eui:uiSetVisible(UI.label["contacts:screen:call"], true)
  eui:uiSetVisible(UI.button["call:cancel"], false)
  eui:uiSetVisible(UI.button["call:end"], true)
  eui:uiSetVisible(UI.button["call:decline"], false)
  eui:uiSetVisible(UI.button["call:accept"], false)
  eui:uiSetText(UI.label["call:text"], "00:00")
  if var0.data and var0.data.contacts then
    for forvar4, forvar5 in ipairs(var0.data.contacts) do
      if tostring(forvar5[2]) == tostring(arg0) then
        eui:uiSetText(UI.label["call:number"], tostring(forvar5[1]))
        return
      end
    end
  end
  eui:uiSetText(UI.label["call:number"], tostring(arg0))
end
function reloadRecentCalls()
  eui:uiGridListClear(UI.gridlist.recent_calls)
  for forvar5 = 1, math.min(#var0, 20) do
    eui:uiGridListSetItemText(UI.gridlist.recent_calls, eui:uiGridListAddRow(UI.gridlist.recent_calls), 1, checkContactNumber(tostring(var0[#var0 - forvar5 + 1].phone_number)) .. " #a3a3a3- " .. tostring(var0[#var0 - forvar5 + 1].duration))
    eui:uiGridListSetItemData(UI.gridlist.recent_calls, eui:uiGridListAddRow(UI.gridlist.recent_calls), 1, var0[#var0 - forvar5 + 1].phone_number)
    if getRealTime().timestamp - var0[#var0 - forvar5 + 1].end_at < 60 then
      eui:uiGridListSetItemText(UI.gridlist.recent_calls, eui:uiGridListAddRow(UI.gridlist.recent_calls), 2, "#a3a3a3" .. getRealTime().timestamp - var0[#var0 - forvar5 + 1].end_at .. "s ago")
    else
      eui:uiGridListSetItemText(UI.gridlist.recent_calls, eui:uiGridListAddRow(UI.gridlist.recent_calls), 2, "#a3a3a3" .. math.floor((getRealTime().timestamp - var0[#var0 - forvar5 + 1].end_at) / 60) .. "m ago")
    end
  end
end
addEvent("phone:app:request", true)
addEventHandler("phone:app:request", localPlayer, function(arg0, arg1, arg2, arg3, arg4, arg5)
  if arg0 == "phone" then
    reloadRecentCalls()
  end
end)
function call(arg0)
  if tonumber(arg0) then
    if not var0.item.SpecialProperties.phone_number and arg0 ~= "911" then
      exports.notifications:output({
        en = "The phone does not have a SIM card",
        ar = "\216\167\217\132\217\135\216\167\216\170\217\129 \217\132\216\167\217\138\216\173\216\170\217\136\217\138 \216\185\217\132\217\137 \216\180\216\177\217\138\216\173\216\169 \216\167\216\170\216\181\216\167\217\132"
      }, 3000, "error")
      return
    end
    showOutgoingCallScreen(arg0)
    CallData = {
      localPlayer,
      _,
      arg0,
      _
    }
    triggerServerEvent("phone:phoneCall", localPlayer, arg0, var0.item.SpecialProperties.phone_number)
  end
end
CallData = {}
addEvent("onClientReceiveCall", true)
addEventHandler("onClientReceiveCall", root, function(arg0, arg1, arg2, arg3)
  if arg3 == "hotline" then
    currentCaller = arg0
    CallData = {
      arg0,
      localPlayer,
      arg1,
      arg2
    }
    triggerServerEvent("onPlayerAcceptCall", localPlayer, currentCaller, CallData, arg3)
  else
    showIncomingCallScreen(arg1)
    currentCaller = arg0
    CallData = {
      arg0,
      localPlayer,
      arg1,
      arg2
    }
    exports.notifications:output({
      en = checkContactNumber(tostring(arg1)) .. " is calling you ..",
      ar = checkContactNumber(tostring(arg1)) .. " \217\138\216\170\216\181\217\132 \216\168\217\131 .."
    }, 8000, _, "right")
    if isElement(ringtone_sound) then
      destroyElement(ringtone_sound)
    end
    ringtone_sound = playSound("sounds/iphone_ringtone.mp3")
  end
end)
addEvent("onClientFoundPhoneNumber", true)
addEventHandler("onClientFoundPhoneNumber", localPlayer, function()
end)
addEvent("onClientNotFoundPhoneNumber", true)
addEventHandler("onClientNotFoundPhoneNumber", localPlayer, function()
  if isElement(callSound) then
    destroyElement(callSound)
  end
  callSound = playSound("https://translate.google.com/translate_tts?ie=UTF-8&client=tw-ob&tl=en&q=" .. "This number is not available right now, please try again later", false)
end)
addEventHandler("onClientSoundStopped", root, function()
  if source == callSound or source == ringtone_sound then
    triggerEvent("onClientPlayerEndCall", localPlayer)
  end
end)
addEvent("onClientPlayerStartCall", true)
addEventHandler("onClientPlayerStartCall", root, function(arg0, arg1, arg2)
  outputChatBox("You can talk on the phone using the command /p", 180, 180, 180)
  outputChatBox("/p \217\138\217\133\217\131\217\134\217\131 \216\167\217\132\216\170\216\173\216\175\216\171 \217\129\217\138 \216\167\217\132\217\135\216\167\216\170\217\129 \216\168\216\167\216\179\216\170\216\174\216\175\216\167\217\133 \216\167\217\132\216\163\217\133\216\177", 180, 180, 180)
  showOngoingCallScreen(arg2)
  CallData = arg1
  current_call_phone_number = arg2
  var0 = getTickCount()
  if isTimer(callTimer) then
    killTimer(callTimer)
  end
  callTimer = setTimer(countCallTime, 1000, 0)
  if isElement(ringtone_sound) then
    destroyElement(ringtone_sound)
  end
end)
function countCallTime()
  eui:uiSetText(UI.label["call:text"], msToTimeStr((getTickCount() - var0) / 1000))
end
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
  return ("0" .. tostring(math.fmod(math.floor(arg0 / 60), 60))) .. ":" .. "0" .. tostring(math.fmod(arg0, 60))
end
addEvent("onClientPlayerEndCall", true)
addEventHandler("onClientPlayerEndCall", root, function()
  hideCallScreen()
  if isTimer(callTimer) then
    killTimer(callTimer)
    table.insert(var0, {
      phone_number = current_call_phone_number,
      duration = msToTimeStr((getTickCount() - var1) / 1000),
      end_at = getRealTime().timestamp
    })
    reloadRecentCalls()
  end
  if isElement(callSound) then
    callSound = false
    stopSound(callSound)
  end
  if isElement(ringtone_sound) then
    destroyElement(ringtone_sound)
  end
end)
