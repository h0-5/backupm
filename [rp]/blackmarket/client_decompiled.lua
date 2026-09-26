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
  image = {}
}
function UIKitReady()
  eui = exports.UIKit
  UI.window.blackmarket = eui:uiCreateRectangle(false, false, 700, 440, tocolor(19, 22, 27, 240), true, true, true, true)
  eui:uiSetVisible(UI.window.blackmarket, false)
  eui:uiBringToFront(UI.window.blackmarket)
  UI.label.MainMenuTitle = eui:uiCreateLabel(15, 10, 200, 30, "Black Market", tocolor(255, 255, 255), "left", "top", UI.window.blackmarket)
  eui:uiSetFont(UI.label.MainMenuTitle, "default-large")
  UI.container.sell = eui:uiCreateContainer(0, 0, 700 - 150 - 15, 440 - 10, (eui:uiCreateRectangle(150 + 10, 5, 700 - 150 - 15, 440 - 10, tocolor(9, 12, 17, 220), true, true, true, true, UI.window.blackmarket)))
  eui:uiSetVisible(UI.container.sell, false)
  UI.gridlist.items = eui:uiCreateGridList(10, 10, (700 - 150 - 15) / 2, 440 - 10 - 20, tocolor(0, 0, 0, 100), UI.container.sell)
  eui:uiGridListAddColumn(UI.gridlist.items, "Items", 0.7)
  eui:uiGridListAddColumn(UI.gridlist.items, "Price", 0.3)
  eui:uiSetAlign(UI.gridlist.items, "left", "center")
  eui:uiSetProperty(UI.gridlist.items, "column_height", 30)
  eui:uiSetProperty(UI.gridlist.items, "row_height", 25)
  eui:uiSetFont(eui:uiCreateLabel((700 - 150 - 15) / 2 + 20, 20, (700 - 150 - 15) / 2 - 30, 20, {
    en = "Instant Sale",
    ar = "\216\167\217\132\216\168\217\138\216\185 \216\167\217\132\217\129\217\136\216\177\217\138"
  }, "primary", "center", "top", UI.container.sell), "default-large")
  eui:uiSetProperty(eui:uiCreateLabel((700 - 150 - 15) / 2 + 20, 50, (700 - 150 - 15) / 2 - 30, 60, {
    en = [[
		When you sell the item through the immediate sale, you will get the money at the same time, but you cannot determine the selling price
	]],
    ar = "\t\t\216\185\217\134\216\175 \216\168\217\138\216\185 \216\167\217\132\216\186\216\177\216\182 \216\185\217\134 \216\183\216\177\217\138\217\130 \216\167\217\132\216\168\217\138\216\185 \216\167\217\132\217\129\217\136\216\177\217\138 \216\179\216\170\216\173\216\181\217\132 \216\185\217\132\217\137 \216\167\217\132\217\133\216\167\217\132 \217\129\217\138 \217\134\217\129\216\179 \216\167\217\132\217\136\217\130\216\170 \217\136\217\132\217\131\217\134\217\131 \217\132\216\167\216\170\216\179\216\170\216\183\217\138\216\185 \216\170\216\173\216\175\217\138\216\175 \216\179\216\185\216\177 \216\167\217\132\216\168\217\138\216\185\n\t"
  }, tocolor(255, 255, 255, 255), "center", "top", UI.container.sell), "color_coded", false)
  eui:uiSetProperty(eui:uiCreateLabel((700 - 150 - 15) / 2 + 20, 50, (700 - 150 - 15) / 2 - 30, 60, {
    en = [[
		When you sell the item through the immediate sale, you will get the money at the same time, but you cannot determine the selling price
	]],
    ar = "\t\t\216\185\217\134\216\175 \216\168\217\138\216\185 \216\167\217\132\216\186\216\177\216\182 \216\185\217\134 \216\183\216\177\217\138\217\130 \216\167\217\132\216\168\217\138\216\185 \216\167\217\132\217\129\217\136\216\177\217\138 \216\179\216\170\216\173\216\181\217\132 \216\185\217\132\217\137 \216\167\217\132\217\133\216\167\217\132 \217\129\217\138 \217\134\217\129\216\179 \216\167\217\132\217\136\217\130\216\170 \217\136\217\132\217\131\217\134\217\131 \217\132\216\167\216\170\216\179\216\170\216\183\217\138\216\185 \216\170\216\173\216\175\217\138\216\175 \216\179\216\185\216\177 \216\167\217\132\216\168\217\138\216\185\n\t"
  }, tocolor(255, 255, 255, 255), "center", "top", UI.container.sell), "word_break", true)
  UI.button.instant_sale = eui:uiCreateButton((700 - 150 - 15) / 2 + 20, 120, (700 - 150 - 15) / 2 - 30, 35, {
    en = "Instant Sale",
    ar = "\216\168\217\138\216\185 \217\129\217\136\216\177\217\138"
  }, "primary", UI.container.sell)
  eui:uiCreateRectangle((700 - 150 - 15) / 2 + 20, 180, (700 - 150 - 15) / 2 - 30, 1, tocolor(255, 255, 255, 20), false, false, false, false, UI.container.sell)
  eui:uiSetFont(eui:uiCreateLabel((700 - 150 - 15) / 2 + 20, 210, (700 - 150 - 15) / 2 - 30, 20, {
    en = "Set for Sale",
    ar = "\216\185\216\177\216\182 \217\132\217\132\216\168\217\138\216\185"
  }, "primary", "center", "top", UI.container.sell), "default-large")
  eui:uiSetProperty(eui:uiCreateLabel((700 - 150 - 15) / 2 + 20, 240, (700 - 150 - 15) / 2 - 30, 60, {
    en = [[
		When you offer the item for sale, you can set the price, but you will not get the money unless someone else buys the item offered
	]],
    ar = "\t\t\216\185\217\134\216\175 \216\185\216\177\216\182 \216\167\217\132\216\186\216\177\216\182 \217\132\217\132\216\168\217\138\216\185 \216\170\216\179\216\170\216\183\217\138\216\185 \216\170\216\173\216\175\217\138\216\175 \216\167\217\132\216\179\216\185\216\177 \217\136\217\132\217\131\217\134\217\131 \217\132\217\134 \216\170\216\173\216\181\217\132 \216\185\217\132\217\137 \216\167\217\132\216\163\217\133\217\136\216\167\217\132 \216\165\217\132\216\167 \217\129\217\138 \216\173\216\167\217\132\216\169 \217\130\217\138\216\167\217\133 \216\180\216\174\216\181 \216\162\216\174\216\177 \216\168\216\180\216\177\216\167\216\161 \216\167\217\132\216\186\216\177\216\182 \216\167\217\132\217\133\216\185\216\177\217\136\216\182\n\t"
  }, tocolor(255, 255, 255, 255), "center", "top", UI.container.sell), "color_coded", false)
  eui:uiSetProperty(eui:uiCreateLabel((700 - 150 - 15) / 2 + 20, 240, (700 - 150 - 15) / 2 - 30, 60, {
    en = [[
		When you offer the item for sale, you can set the price, but you will not get the money unless someone else buys the item offered
	]],
    ar = "\t\t\216\185\217\134\216\175 \216\185\216\177\216\182 \216\167\217\132\216\186\216\177\216\182 \217\132\217\132\216\168\217\138\216\185 \216\170\216\179\216\170\216\183\217\138\216\185 \216\170\216\173\216\175\217\138\216\175 \216\167\217\132\216\179\216\185\216\177 \217\136\217\132\217\131\217\134\217\131 \217\132\217\134 \216\170\216\173\216\181\217\132 \216\185\217\132\217\137 \216\167\217\132\216\163\217\133\217\136\216\167\217\132 \216\165\217\132\216\167 \217\129\217\138 \216\173\216\167\217\132\216\169 \217\130\217\138\216\167\217\133 \216\180\216\174\216\181 \216\162\216\174\216\177 \216\168\216\180\216\177\216\167\216\161 \216\167\217\132\216\186\216\177\216\182 \216\167\217\132\217\133\216\185\216\177\217\136\216\182\n\t"
  }, tocolor(255, 255, 255, 255), "center", "top", UI.container.sell), "word_break", true)
  UI.edit.sale_price = eui:uiCreateEdit((700 - 150 - 15) / 2 + 20, 330, (700 - 150 - 15) / 2 - 30, 35, "", {
    en = "Selling price",
    ar = "\216\179\216\185\216\177 \216\167\217\132\216\168\217\138\216\185"
  }, "primary", UI.container.sell)
  UI.button.set_for_sale = eui:uiCreateButton((700 - 150 - 15) / 2 + 20, 380, (700 - 150 - 15) / 2 - 30, 35, {
    en = "Set for sale",
    ar = "\216\185\216\177\216\182 \217\132\217\132\216\168\217\138\216\185"
  }, "primary", UI.container.sell)
  UI.container.buy = eui:uiCreateContainer(0, 0, 700 - 150 - 15, 440 - 10, (eui:uiCreateRectangle(150 + 10, 5, 700 - 150 - 15, 440 - 10, tocolor(9, 12, 17, 220), true, true, true, true, UI.window.blackmarket)))
  eui:uiSetVisible(UI.container.buy, false)
  UI.gridlist.offers = eui:uiCreateGridList(10, 10, 700 - 150 - 15 - 20, 440 - 10 - 60, tocolor(0, 0, 0, 100), UI.container.buy)
  eui:uiGridListAddColumn(UI.gridlist.offers, "Item", 0.8)
  eui:uiGridListAddColumn(UI.gridlist.offers, "Price", 0.2)
  eui:uiSetAlign(UI.gridlist.offers, "left", "center")
  eui:uiSetProperty(UI.gridlist.offers, "column_height", 30)
  eui:uiSetProperty(UI.gridlist.offers, "row_height", 25)
  UI.button.buy = eui:uiCreateButton(700 - 150 - 15 - 160, 440 - 10 - 40, 150, 30, {en = "Buy", ar = "\216\180\216\177\216\167\216\161"}, "primary", UI.container.buy)
  eui:uiSetProperty(eui:uiCreateMenu(5, 80, 150, 400, tocolor(19, 22, 27, 0), UI.window.blackmarket), "hovered_row_color", tocolor(9, 12, 17, 100))
  eui:uiSetProperty(eui:uiCreateMenu(5, 80, 150, 400, tocolor(19, 22, 27, 0), UI.window.blackmarket), "selected_row_color", tocolor(9, 12, 17, 200))
  eui:uiSetProperty(eui:uiCreateMenu(5, 80, 150, 400, tocolor(19, 22, 27, 0), UI.window.blackmarket), "row_height", 40)
  eui:uiMenuAddRow(eui:uiCreateMenu(5, 80, 150, 400, tocolor(19, 22, 27, 0), UI.window.blackmarket), {en = "Sell", ar = "\216\168\217\138\216\185"}, tocolor(29, 32, 37, 0), _, UI.container.sell)
  eui:uiMenuAddRow(eui:uiCreateMenu(5, 80, 150, 400, tocolor(19, 22, 27, 0), UI.window.blackmarket), {en = "Buy", ar = "\216\180\216\177\216\167\216\161"}, tocolor(29, 32, 37, 0), _, UI.container.buy)
  UI.button.close = eui:uiCreateButton(10, 440 - 45, 150 - 10, 35, {en = "Close", ar = "\216\165\216\186\217\132\216\167\217\130"}, tocolor(9, 12, 17, 220), UI.window.blackmarket)
  eui:uiSetProperty(UI.button.close, "HoverTextColor", tocolor(255, 0, 0))
end
addEventHandler("onClientUIReady", resourceRoot, UIKitReady)
addEvent("onClientUIKitReady", true)
addEventHandler("onClientUIKitReady", root, UIKitReady)
function closeUIWindows(arg0)
  eui:uiSetVisible(UI.window.blackmarket, false)
  showCursor(false)
end
addEventHandler("onClientPlayerQuitFromCharacter", localPlayer, closeUIWindows)
addEventHandler("onClientPlayerWasted", localPlayer, closeUIWindows)
function showBlackMarket()
  eui:uiSetVisible(UI.window.blackmarket, true)
  showCursor(true)
  refreshItemsList()
end
function refreshItemsList()
  eui:uiGridListClear(UI.gridlist.items)
  if not getElementData(localPlayer, "character:id") then
    return
  end
  for forvar5 = 1, #exports["inventory-system"]:getInventoryItems("character:" .. tostring((getElementData(localPlayer, "character:id")))) do
    if exports["inventory-system"]:getInventoryItems("character:" .. tostring((getElementData(localPlayer, "character:id"))))[forvar5] and (allowed_items_types[exports["inventory-system"]:getInventoryItems("character:" .. tostring((getElementData(localPlayer, "character:id"))))[forvar5].Type] or exports["inventory-system"]:getInventoryItems("character:" .. tostring((getElementData(localPlayer, "character:id"))))[forvar5].Properties.stolen) and not exports["inventory-system"]:getInventoryItems("character:" .. tostring((getElementData(localPlayer, "character:id"))))[forvar5].SpecialProperties.isFactionDuty and prices[exports["inventory-system"]:getInventoryItems("character:" .. tostring((getElementData(localPlayer, "character:id"))))[forvar5].Name] then
      eui:uiGridListSetItemData(UI.gridlist.items, eui:uiGridListAddRow(UI.gridlist.items), 1, exports["inventory-system"]:getInventoryItems("character:" .. tostring((getElementData(localPlayer, "character:id"))))[forvar5])
      eui:uiGridListSetItemText(UI.gridlist.items, eui:uiGridListAddRow(UI.gridlist.items), 1, tostring(exports["inventory-system"]:getInventoryItems("character:" .. tostring((getElementData(localPlayer, "character:id"))))[forvar5].Name))
      eui:uiGridListSetItemText(UI.gridlist.items, eui:uiGridListAddRow(UI.gridlist.items), 2, "$" .. tostring(prices[exports["inventory-system"]:getInventoryItems("character:" .. tostring((getElementData(localPlayer, "character:id"))))[forvar5].Name]))
      eui:uiGridListSetItemColor(UI.gridlist.items, eui:uiGridListAddRow(UI.gridlist.items), 2, tocolor(0, 255, 0))
    end
  end
end
addEvent("blackmarket:show", true)
addEventHandler("blackmarket:show", localPlayer, function(arg0)
  showBlackMarket()
  eui:uiGridListClear(UI.gridlist.offers)
  for forvar4 = 1, #arg0 do
    if arg0[forvar4] and arg0[forvar4].SpecialProperties.blackmarket then
      eui:uiGridListSetItemText(UI.gridlist.offers, eui:uiGridListAddRow(UI.gridlist.offers), 1, tostring(arg0[forvar4].Name))
      eui:uiGridListSetItemData(UI.gridlist.offers, eui:uiGridListAddRow(UI.gridlist.offers), 1, arg0[forvar4])
      eui:uiGridListSetItemText(UI.gridlist.offers, eui:uiGridListAddRow(UI.gridlist.offers), 2, "$" .. tostring(arg0[forvar4].SpecialProperties.blackmarket[1]))
      eui:uiGridListSetItemColor(UI.gridlist.offers, eui:uiGridListAddRow(UI.gridlist.offers), 2, tocolor(0, 255, 0))
    end
  end
end)
addEventHandler("onClientUIClick", root, function()
  if source == UI.button.instant_sale then
    if var0 then
      exports.notifications:output({
        en = "Please wait",
        ar = "\216\167\217\132\216\177\216\172\216\167\216\161 \216\167\217\132\216\167\217\134\216\170\216\184\216\167\216\177"
      }, 3000, "warning")
      return
    end
    if eui:uiGridListGetSelectedItem(UI.gridlist.items) ~= -1 then
      var0 = true
      triggerServerEvent("blackmarket:instant_sale", localPlayer, eui:uiGridListGetItemData(UI.gridlist.items, eui:uiGridListGetSelectedItem(UI.gridlist.items), 1).ID, eui:uiGridListGetItemData(UI.gridlist.items, eui:uiGridListGetSelectedItem(UI.gridlist.items), 1).Name)
    end
  elseif source == UI.button.set_for_sale then
    if var0 then
      exports.notifications:output({
        en = "Please wait",
        ar = "\216\167\217\132\216\177\216\172\216\167\216\161 \216\167\217\132\216\167\217\134\216\170\216\184\216\167\216\177"
      }, 3000, "warning")
      return
    end
    if eui:uiGridListGetSelectedItem(UI.gridlist.items) ~= -1 and tonumber((eui:uiGetText(UI.edit.sale_price))) and tonumber((eui:uiGetText(UI.edit.sale_price))) > 0 and tonumber((eui:uiGetText(UI.edit.sale_price))) <= 1000000 then
      var0 = true
      triggerServerEvent("blackmarket:offer_sale", localPlayer, eui:uiGridListGetItemData(UI.gridlist.items, eui:uiGridListGetSelectedItem(UI.gridlist.items), 1), tonumber((eui:uiGetText(UI.edit.sale_price))))
    end
  elseif source == UI.button.buy then
    if var0 then
      exports.notifications:output({
        en = "Please wait",
        ar = "\216\167\217\132\216\177\216\172\216\167\216\161 \216\167\217\132\216\167\217\134\216\170\216\184\216\167\216\177"
      }, 3000, "warning")
      return
    end
    if eui:uiGridListGetSelectedItem(UI.gridlist.offers) ~= -1 then
      var0 = true
      triggerServerEvent("blackmarket:buy", localPlayer, (eui:uiGridListGetItemData(UI.gridlist.offers, eui:uiGridListGetSelectedItem(UI.gridlist.offers), 1)))
    end
  elseif source == UI.button.close then
    eui:uiSetVisible(UI.window.blackmarket, false)
    showCursor(false)
  end
end)
addEvent("blackmarket:instant_sale:callback", true)
addEventHandler("blackmarket:instant_sale:callback", localPlayer, function()
  var0 = false
  refreshItemsList()
end)
addEvent("blackmarket:offer_sale:callback", true)
addEventHandler("blackmarket:offer_sale:callback", localPlayer, function()
  eui:uiSetText(UI.edit.sale_price, "")
  var0 = false
  refreshItemsList()
end)
addEvent("blackmarket:buy:callback", true)
addEventHandler("blackmarket:buy:callback", localPlayer, function()
  var0 = false
end)
