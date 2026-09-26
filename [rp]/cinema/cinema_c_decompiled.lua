-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

UI = {
  window = {},
  label = {},
  button = {},
  gridlist = {},
  edit = {},
  browser = {},
  checkbox = {},
  combobox = {}
}
function UIKitReady()
  eui = exports.UIKit
  UI.window.cinema = eui:uiCreateWindow(false, false, 1100, 620, {
    en = "Cinema",
    ar = "\216\167\217\132\216\179\217\138\217\134\217\133\216\167"
  })
  eui:uiSetVisible(UI.window.cinema, false)
  eui:uiWindowSetMovable(UI.window.cinema, false)
  eui:uiSetProperty(UI.window.cinema, "close_button", true)
  UI.combobox.room = eui:uiCreateComboBox(20, 90, 300, 25, "Room", tocolor(255, 255, 255), UI.window.cinema)
  for forvar3, forvar4 in ipairs(config.rooms) do
    eui:uiComboBoxAddItem(UI.combobox.room, forvar4.name)
  end
  UI.edit.display_name = eui:uiCreateEdit(20, 140, 300, 35, "", {
    en = "Display Name",
    ar = "\216\167\216\179\217\133 \216\167\217\132\216\185\216\177\216\182"
  }, _, UI.window.cinema)
  UI.edit.ticket_price = eui:uiCreateEdit(20, 185, 300, 35, "", {
    en = "Ticket Price",
    ar = "\216\179\216\185\216\177 \216\167\217\132\216\170\216\176\217\131\216\177\216\169"
  }, _, UI.window.cinema)
  UI.checkbox.open_cinema = eui:uiCreateSwitch(20, 260, 200, 20, {
    en = "Open Cinema",
    ar = "\217\129\216\170\216\173 \216\167\217\132\216\179\217\138\217\134\217\133\216\167"
  }, false, _, UI.window.cinema)
  UI.button.save_changes = eui:uiCreateButton(20, 560, 300, 40, {
    en = "Save Changes",
    ar = "\216\173\217\129\216\184 \216\167\217\132\216\170\216\186\217\138\217\138\216\177\216\167\216\170"
  }, "primary", UI.window.cinema)
  UI.button.start = eui:uiCreateButton(20, 515, 300, 40, {en = "Start", ar = "\216\168\216\175\216\163"}, "primary", UI.window.cinema)
  UI.button.reset_tickets = eui:uiCreateButton(20, 470, 300, 40, {
    en = "Reset Tickets",
    ar = "\216\165\216\185\216\167\216\175\216\169 \216\170\216\185\217\138\217\138\217\134 \216\167\217\132\216\170\216\176\216\167\217\131\216\177"
  }, "primary", UI.window.cinema)
  UI.edit.url = eui:uiCreateEdit(340, 70, 740, 25, "", {
    en = "URL",
    ar = "\216\167\217\132\216\177\216\167\216\168\216\183"
  }, _, UI.window.cinema)
  UI.browser.cinema = eui:uiCreateBrowser(340, 100, 740, 500, false, false, UI.window.cinema)
  theBrowser = eui:uiGetBrowser(UI.browser.cinema)
  addEventHandler("onClientBrowserCreated", theBrowser, function()
    loadBrowserURL(source, "https://www.google.com/")
  end)
  addEventHandler("onClientBrowserDocumentReady", theBrowser, function(arg0)
    eui:uiSetText(UI.edit.url, tostring(arg0))
  end)
  addEventHandler("onClientBrowserNavigate", theBrowser, function(arg0)
    eui:uiSetText(UI.edit.url, tostring(arg0))
  end)
  UI.window.buy_ticket = eui:uiCreateWindow(false, false, 450, 350, {
    en = "Cinema Tickets",
    ar = "\216\170\216\176\216\167\217\131\216\177 \216\167\217\132\216\179\217\138\217\134\217\133\216\167"
  })
  eui:uiWindowSetMovable(UI.window.buy_ticket, false)
  eui:uiSetVisible(UI.window.buy_ticket, false)
  UI.gridlist.buy_ticket = eui:uiCreateGridList(5, 30, 440, 245, tocolor(10, 10, 10, 0), UI.window.buy_ticket)
  eui:uiGridListAddColumn(UI.gridlist.buy_ticket, "Tickets", 0.5)
  eui:uiGridListAddColumn(UI.gridlist.buy_ticket, "", 0.3)
  eui:uiGridListAddColumn(UI.gridlist.buy_ticket, "", 0.2)
  eui:uiSetProperty(UI.gridlist.buy_ticket, "row_height", 30)
  UI.button.close_buy_ticket = eui:uiCreateButton(5, 310, 440, 35, {en = "Close", ar = "\216\165\216\186\217\132\216\167\217\130"}, _, UI.window.buy_ticket)
  UI.button.buy_ticket = eui:uiCreateButton(5, 270, 440, 35, {en = "Buy", ar = "\216\180\216\177\216\167\216\161"}, "primary", UI.window.buy_ticket)
end
addEventHandler("onClientUIReady", resourceRoot, UIKitReady)
addEventHandler("onClientUIKitReady", root, UIKitReady)
function closeUIWindows(arg0)
  eui:uiSetVisible(UI.window.cinema, false)
  eui:uiSetVisible(UI.window.buy_ticket, false)
  showCursor(false)
end
addEvent("onClientPlayerQuitFromCharacter", true)
addEventHandler("onClientPlayerQuitFromCharacter", localPlayer, closeUIWindows)
addEventHandler("onClientPlayerWasted", localPlayer, closeUIWindows)
addEventHandler("onClientUIVisibilityChange", root, function(arg0)
  if source == UI.window.cinema and not arg0 then
    showCursor(false)
  end
end)
addEventHandler("onClientUIAccepted", root, function()
  if source == UI.edit.url and eui:uiGetText(source) ~= "" then
    loadBrowserURL(theBrowser, (eui:uiGetText(source)))
  end
end)
addEvent("cinema:control:open", true)
addEventHandler("cinema:control:open", localPlayer, function(arg0)
  var0 = arg0
  eui:uiSetVisible(UI.window.cinema, true)
  showCursor(true)
end)
addEventHandler("onClientUIClick", root, function()
  if source == UI.button.save_changes then
    if eui:uiComboBoxGetSelected(UI.combobox.room) ~= -1 then
      var0[config.rooms[eui:uiComboBoxGetSelected(UI.combobox.room) + 1].code].url = eui:uiGetText(UI.edit.url)
      var0[config.rooms[eui:uiComboBoxGetSelected(UI.combobox.room) + 1].code].display_name = eui:uiGetText(UI.edit.display_name)
      var0[config.rooms[eui:uiComboBoxGetSelected(UI.combobox.room) + 1].code].ticket_price = eui:uiGetText(UI.edit.ticket_price)
      var0[config.rooms[eui:uiComboBoxGetSelected(UI.combobox.room) + 1].code].open = eui:uiSwitchGetSelected(UI.checkbox.open_cinema)
      triggerServerEvent("cinema:save", localPlayer, config.rooms[eui:uiComboBoxGetSelected(UI.combobox.room) + 1].code, eui:uiGetText(UI.edit.url), eui:uiGetText(UI.edit.display_name), eui:uiGetText(UI.edit.ticket_price), (eui:uiSwitchGetSelected(UI.checkbox.open_cinema)))
    end
  elseif source == UI.button.reset_tickets then
    if eui:uiComboBoxGetSelected(UI.combobox.room) ~= -1 then
      triggerServerEvent("cinema:reset_ticket", localPlayer, config.rooms[eui:uiComboBoxGetSelected(UI.combobox.room) + 1].code)
    end
  elseif source == UI.button.start then
    if eui:uiComboBoxGetSelected(UI.combobox.room) ~= -1 then
      triggerServerEvent("cinema:start", localPlayer, config.rooms[eui:uiComboBoxGetSelected(UI.combobox.room) + 1].code)
    end
  elseif source == UI.button.close_buy_ticket then
    eui:uiSetVisible(UI.window.buy_ticket, false)
    showCursor(false)
  elseif source == UI.button.buy_ticket and eui:uiGridListGetSelectedItem(UI.gridlist.buy_ticket) ~= -1 then
    triggerServerEvent("cinema:buy_ticket", localPlayer, eui:uiGridListGetItemData(UI.gridlist.buy_ticket, eui:uiGridListGetSelectedItem(UI.gridlist.buy_ticket), 1).room_code)
  end
end)
addEventHandler("onClientUIComboBoxAccepted", root, function()
  if source == UI.combobox.room and eui:uiComboBoxGetSelected(source) ~= -1 then
    eui:uiSetText(UI.edit.display_name, tostring(var0[config.rooms[eui:uiComboBoxGetSelected(source) + 1].code].display_name))
    eui:uiSetText(UI.edit.ticket_price, tostring(var0[config.rooms[eui:uiComboBoxGetSelected(source) + 1].code].ticket_price))
    eui:uiSetText(UI.edit.url, tostring(var0[config.rooms[eui:uiComboBoxGetSelected(source) + 1].code].url))
    loadBrowserURL(theBrowser, tostring(var0[config.rooms[eui:uiComboBoxGetSelected(source) + 1].code].url))
    eui:uiSwitchSetSelected(UI.checkbox.open_cinema, var0[config.rooms[eui:uiComboBoxGetSelected(source) + 1].code].open or false)
  end
end)
addEvent("cinema:buy_ticket:open", true)
addEventHandler("cinema:buy_ticket:open", localPlayer, function(arg0)
  eui:uiSetVisible(UI.window.buy_ticket, true)
  showCursor(true)
  eui:uiGridListClear(UI.gridlist.buy_ticket)
  for forvar4, forvar5 in ipairs(arg0) do
    eui:uiGridListSetItemText(UI.gridlist.buy_ticket, eui:uiGridListAddRow(UI.gridlist.buy_ticket), 1, forvar5.name)
    eui:uiGridListSetItemText(UI.gridlist.buy_ticket, eui:uiGridListAddRow(UI.gridlist.buy_ticket), 2, forvar5.room_code)
    eui:uiGridListSetItemText(UI.gridlist.buy_ticket, eui:uiGridListAddRow(UI.gridlist.buy_ticket), 3, "$" .. forvar5.price)
    eui:uiGridListSetItemColor(UI.gridlist.buy_ticket, eui:uiGridListAddRow(UI.gridlist.buy_ticket), 3, tocolor(0, 255, 0))
    eui:uiGridListSetItemData(UI.gridlist.buy_ticket, eui:uiGridListAddRow(UI.gridlist.buy_ticket), 1, forvar5)
  end
end)
browserURL = {}
addEventHandler("onClientBrowserCreated", resourceRoot, function()
  if not var0 then
    return
  end
  browserURL[source] = var0
  dxSetShaderValue(var1.shader.normal, "tex", source)
  loadBrowserURL(source, var0)
end)
function playVideo(arg0)
  if not isElement(var0.shader.normal) then
    var0.shader.normal = dxCreateShader(var1, 0, 0, true, "all")
    engineApplyShaderToWorldTexture(var0.shader.normal, "int_ScreenNormal")
  end
  if not isElement(browserTxd) then
    var2 = arg0
    browserTxd = createBrowser(var3, var4, false, false)
    if not renderStatus then
      renderStatus = true
    end
  else
    loadBrowserURL(browserTxd, arg0)
    if browserURL[browserTxd] ~= arg0 then
      browserURL[browserTxd] = arg0
      requestBrowserDomains({arg0}, true, function(arg0)
        if arg0 then
          loadBrowserURL(browserTxd, var0)
        end
      end)
    end
  end
end
function stopVideo()
  if isElement(browserTxd) then
    destroyElement(browserTxd)
    browserTxd = nil
  end
  if isElement(var0.shader.normal) then
    destroyElement(var0.shader.normal)
    var0.shader.normal = nil
  end
end
addEventHandler("onClientColShapeLeave", resourceRoot, function(arg0, arg1)
  if arg0 ~= localPlayer then
    return
  end
  stopVideo()
end)
addEvent("cinema:video:sync", true)
addEventHandler("cinema:video:sync", root, function(arg0, arg1, arg2)
  playVideo(arg1.url .. "&start=" .. arg2 - arg1.timestamp .. "&t=" .. arg2 - arg1.timestamp)
end)
