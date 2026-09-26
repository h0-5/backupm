-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

UI = {
  edit = {},
  window = {},
  label = {},
  button = {},
  rect = {},
  image = {},
  checkbox = {},
  combobox = {},
  gridlist = {}
}
function destroyPreview()
  if isElement(var0) then
    exports.object_preview:destroyObjectPreview(var0)
  end
  if isElement(var1) then
    destroyElement(var1)
  end
end
addEventHandler("onClientResourceStop", resourceRoot, function()
  if isElement(var0) then
    exports.object_preview:destroyObjectPreview(var0)
  end
end)
function UIKitReady()
  eui = exports.UIKit
  UI.window[1] = eui:uiCreateWindow(false, false, 485, 385, "Shops List")
  eui:uiWindowSetMovable(UI.window[1], false)
  eui:uiSetVisible(UI.window[1], false)
  UI.gridlist[1] = eui:uiCreateGridList(5, 35, 475, 310, tocolor(10, 10, 10), UI.window[1])
  eui:uiGridListAddColumn(UI.gridlist[1], "ID", 0.2)
  eui:uiGridListAddColumn(UI.gridlist[1], "Name", 0.8)
  eui:uiSetAlign(UI.gridlist[1], "left", "center")
  UI.button[1] = eui:uiCreateButton(5, 350, 475, 30, "Hide", tocolor(0, 0, 0), UI.window[1])
  UI.window.furniture = eui:uiCreateRectangle(200, false, 300, 550, tocolor(8, 12, 18, 250), true, true, true, true)
  eui:uiSetVisible(UI.window.furniture, false)
  UI.label.Title = eui:uiCreateLabel(15, 10, 200, 30, "IKEA", tocolor(255, 255, 255, 255), "left", "center", UI.window.furniture)
  eui:uiSetFont(UI.label.Title, "default-large")
  UI.gridlist.furniture = eui:uiCreateGridList(5, 50, 290, 410, tocolor(20, 20, 20, 0), UI.window.furniture)
  eui:uiGridListAddColumn(UI.gridlist.furniture, "Item", 0.7)
  eui:uiGridListAddColumn(UI.gridlist.furniture, "Price", 0.3)
  eui:uiSetAlign(UI.gridlist.furniture, "left", "center")
  UI.button["furniture:buy"] = eui:uiCreateButton(5, 470, 290, 35, {en = "Buy", ar = "\216\180\216\177\216\167\216\161"}, "primary", UI.window.furniture)
  UI.button["furniture:close"] = eui:uiCreateButton(5, 510, 290, 35, {en = "Close", ar = "\216\165\216\186\217\132\216\167\217\130"}, tocolor(0, 0, 0, 255), UI.window.furniture)
  for forvar3, forvar4 in ipairs(furnitures_items) do
    eui:uiGridListSetItemData(UI.gridlist.furniture, eui:uiGridListAddRow(UI.gridlist.furniture), 1, forvar4)
    eui:uiGridListSetItemText(UI.gridlist.furniture, eui:uiGridListAddRow(UI.gridlist.furniture), 1, forvar4.name)
    eui:uiGridListSetItemText(UI.gridlist.furniture, eui:uiGridListAddRow(UI.gridlist.furniture), 2, "$" .. forvar4.price)
    eui:uiGridListSetItemColor(UI.gridlist.furniture, eui:uiGridListAddRow(UI.gridlist.furniture), 2, tocolor(0, 255, 0))
  end
  UI.window[2] = eui:uiCreateWindow(false, false, 680, 450, "Shop", _, "shopping-cart.png")
  eui:uiSetVisible(UI.window[2], false)
  eui:uiWindowSetMovable(UI.window[2], false)
  eui:uiSetProperty(UI.window[2], "close_button", true)
  UI.gridlist[2] = eui:uiCreateGridList(10, 50, 380, 360, tocolor(20, 20, 20, 0), UI.window[2])
  eui:uiGridListAddColumn(UI.gridlist[2], "Item", 0.75)
  eui:uiGridListAddColumn(UI.gridlist[2], "Price", 0.25)
  eui:uiSetAlign(UI.gridlist[2], "left", "center")
  eui:uiCreateLabel(15, 420, 200, 20, {
    en = "Double click to add item to cart",
    ar = "\216\167\217\134\217\130\216\177 \217\133\216\177\216\170\217\138\217\134 \216\185\217\132\217\137 \216\167\217\132\216\186\216\177\216\182 \217\132\216\165\216\182\216\167\217\129\216\170\217\135 \217\132\217\132\216\179\217\132\216\169"
  }, tocolor(255, 255, 255, 200), "left", "center", UI.window[2])
  UI.rect.item_preview = eui:uiCreateRectangle(420, 20, 250, 80, tocolor(9, 13, 19, 250), true, true, true, true, UI.window[2])
  UI.rect.cart = eui:uiCreateRectangle(420, 110, 250, 295, tocolor(9, 13, 19, 250), true, true, true, true, UI.window[2])
  eui:uiCreateRectangle(10, 260, 230, 1, tocolor(255, 255, 255, 10), false, false, false, false, UI.rect.cart)
  UI.gridlist.cart = eui:uiCreateGridList(5, 5, 240, 245, tocolor(20, 20, 20, 0), UI.rect.cart)
  eui:uiGridListAddColumn(UI.gridlist.cart, "Cart", 0.75)
  eui:uiGridListAddColumn(UI.gridlist.cart, "", 0.25)
  eui:uiSetAlign(UI.gridlist.cart, "left", "center")
  eui:uiCreateLabel(15, 265, 100, 25, {
    en = "Total",
    ar = "\216\167\217\132\217\133\216\172\217\133\217\136\216\185"
  }, tocolor(255, 255, 255, 200), "left", "center", UI.rect.cart)
  UI.label.total_cart = eui:uiCreateLabel(0, 265, 235, 25, "$0", tocolor(0, 255, 0, 255), "right", "center", UI.rect.cart)
  UI.image[1] = eui:uiCreateImage(15, 10, 60, 60, ":items/images/item.png", UI.rect.item_preview)
  UI.label.Price = eui:uiCreateLabel(80, 0, 160, 80, "$0", tocolor(255, 255, 255, 255), "center", "center", UI.rect.item_preview)
  eui:uiSetFont(UI.label.Price, "default-large")
  UI.label.Buy = eui:uiCreateLabel(0, 300, 250, 30, {
    en = "Buy \194\187",
    ar = "\216\180\216\177\216\167\216\161 \194\187"
  }, tocolor(255, 255, 255, 150), "center", "center", UI.rect.cart)
  eui:uiSetFont(UI.label.Buy, "default-large")
  UI.window.RegisteredShops = eui:uiCreateWindow(false, false, 500, 380, {
    en = "Registered Shops",
    ar = "\216\167\217\132\217\133\216\173\217\132\216\167\216\170 \216\167\217\132\216\170\216\172\216\167\216\177\217\138\216\169 \216\167\217\132\217\133\216\179\216\172\217\132\216\169"
  })
  eui:uiSetVisible(UI.window.RegisteredShops, false)
  eui:uiWindowSetMovable(UI.window.RegisteredShops, false)
  eui:uiCreateLabel(0, 50, 500, 20, {
    en = "The following list shows the shops registered by you",
    ar = "\216\170\217\136\216\182\216\173 \216\167\217\132\217\130\216\167\216\166\217\133\216\169 \216\167\217\132\216\170\216\167\217\132\217\138\216\169 \216\167\217\132\217\133\216\173\217\132\216\167\216\170 \216\167\217\132\216\170\216\172\216\167\216\177\217\138\216\169 \216\167\217\132\216\170\217\138 \217\130\217\133\216\170 \216\168\216\170\216\179\216\172\217\138\217\132\217\135\216\167"
  }, tocolor(255, 255, 255, 200), "center", "top", UI.window.RegisteredShops)
  UI.gridlist.RegisteredShops = eui:uiCreateGridList(10, 80, 480, 250, _, UI.window.RegisteredShops)
  eui:uiGridListAddColumn(UI.gridlist.RegisteredShops, "ID", 0.15)
  eui:uiGridListAddColumn(UI.gridlist.RegisteredShops, "Name", 0.6)
  eui:uiGridListAddColumn(UI.gridlist.RegisteredShops, "Type", 0.25)
  eui:uiSetAlign(UI.gridlist.RegisteredShops, "left", "center")
  UI.button.RegisterNewShop = eui:uiCreateButton(10, 340, 150, 30, {
    en = "Register New Shop",
    ar = "\216\170\216\179\216\172\217\138\217\132 \217\133\216\173\217\132 \216\172\216\175\217\138\216\175"
  }, _, UI.window.RegisteredShops)
  UI.button.RemoveRegisteredShop = eui:uiCreateButton(165, 340, 150, 30, {
    en = "Cancel Shop",
    ar = "\216\165\217\132\216\186\216\167\216\161 \216\167\217\132\217\133\216\173\217\132"
  }, _, UI.window.RegisteredShops)
  UI.button.CloseRegisteredShops = eui:uiCreateButton(390, 340, 100, 30, {en = "Close", ar = "\216\165\216\186\217\132\216\167\217\130"}, _, UI.window.RegisteredShops)
  UI.window.RegisterShop = eui:uiCreateWindow(false, false, 420, 380, {
    en = "Register a Shop",
    ar = "\216\170\216\179\216\172\217\138\217\132 \217\133\216\173\217\132 \216\170\216\172\216\167\216\177\217\138"
  })
  eui:uiSetVisible(UI.window.RegisterShop, false)
  eui:uiWindowSetMovable(UI.window.RegisterShop, false)
  eui:uiCreateLabel(15, 50, 200, 15, {
    en = "Enter shop name:",
    ar = "\216\163\216\175\216\174\217\132 \216\167\216\179\217\133 \216\167\217\132\217\133\216\173\217\132:"
  }, tocolor(255, 255, 255, 255), "left", "top", UI.window.RegisterShop)
  UI.edit["RS:Name"] = eui:uiCreateEdit(15, 75, 280, 25, "", {
    en = "shop name",
    ar = "\216\167\216\179\217\133 \216\167\217\132\217\133\216\173\217\132"
  }, _, UI.window.RegisterShop)
  eui:uiCreateLabel(15, 120, 200, 15, {
    en = "Select shop type:",
    ar = "\217\134\217\136\216\185 \216\167\217\132\217\133\216\173\217\132:"
  }, tocolor(255, 255, 255, 255), "left", "top", UI.window.RegisterShop)
  UI.gridlist["RS:Type"] = eui:uiCreateGridList(10, 150, 400, 150, _, UI.window.RegisterShop)
  eui:uiGridListAddColumn(UI.gridlist["RS:Type"], "Name", 0.4)
  eui:uiGridListAddColumn(UI.gridlist["RS:Type"], "Description", 0.6)
  eui:uiSetAlign(UI.gridlist["RS:Type"], "left", "center")
  for forvar3, forvar4 in ipairs(shop_types) do
    eui:uiGridListSetItemText(UI.gridlist["RS:Type"], eui:uiGridListAddRow(UI.gridlist["RS:Type"]), 1, forvar4.name)
    eui:uiGridListSetItemText(UI.gridlist["RS:Type"], eui:uiGridListAddRow(UI.gridlist["RS:Type"]), 2, forvar4.description)
    eui:uiGridListSetItemData(UI.gridlist["RS:Type"], eui:uiGridListAddRow(UI.gridlist["RS:Type"]), 1, forvar3)
  end
  UI.label["RS:CostNote"] = eui:uiCreateLabel(15, 310, 200, 15, {
    en = "Note: Registration fee is #00ff00$5000.",
    ar = "#00ff00$5000#ffffff \217\133\217\132\216\167\216\173\216\184\216\169: \216\177\216\179\217\136\217\133 \216\167\217\132\216\170\216\179\216\172\217\138\217\132"
  }, tocolor(255, 255, 255, 220), "left", "top", UI.window.RegisterShop)
  UI.button.RegisterShop = eui:uiCreateButton(10, 340, 150, 30, {en = "Register", ar = "\216\170\216\179\216\172\217\138\217\132"}, "primary", UI.window.RegisterShop)
  UI.button.CancelRegisterShop = eui:uiCreateButton(165, 340, 100, 30, {en = "Cancel", ar = "\216\165\217\132\216\186\216\167\216\161"}, _, UI.window.RegisterShop)
  UI.window.MerchandiseMain = eui:uiCreateRectangle(false, false, 500, 380, tocolor(5, 5, 5, 250), true, true, true, true)
  eui:uiSetVisible(UI.window.MerchandiseMain, false)
  UI.label.MerchandiseMainTitle = eui:uiCreateLabel(0, 10, 500, 20, {
    en = "Buying Merchandise for Shops",
    ar = "\216\180\216\177\216\167\216\161 \216\167\217\132\216\168\216\182\216\167\216\166\216\185 \217\132\217\132\217\133\216\173\217\132\216\167\216\170 \216\167\217\132\216\170\216\172\216\167\216\177\217\138\216\169"
  }, tocolor(255, 255, 255, 255), "center", "top", UI.window.MerchandiseMain)
  eui:uiSetFont(UI.label.MerchandiseMainTitle, "default-large")
  eui:uiCreateLabel(0, 50, 500, 20, {
    en = [[
Choose the shop you want to buy merchandise for
Double click to choose]],
    ar = "\217\130\217\133 \216\168\216\167\216\174\216\170\217\138\216\167\216\177 \216\167\217\132\217\133\216\173\217\132 \216\167\217\132\216\176\217\138 \216\170\216\177\216\186\216\168 \216\168\216\180\216\177\216\167\216\161 \216\168\216\182\216\167\216\185\216\169 \217\132\217\135\n\216\167\217\134\217\130\216\177 \217\133\216\177\216\170\217\138\217\134 \217\132\217\132\216\167\216\174\216\170\217\138\216\167\216\177"
  }, tocolor(255, 255, 255, 200), "center", "top", UI.window.MerchandiseMain)
  UI.gridlist.MerchandiseMain = eui:uiCreateGridList(10, 100, 480, 230, tocolor(15, 15, 15, 0), UI.window.MerchandiseMain)
  eui:uiGridListAddColumn(UI.gridlist.MerchandiseMain, "ID", 0.15)
  eui:uiGridListAddColumn(UI.gridlist.MerchandiseMain, "Name", 0.6)
  eui:uiGridListAddColumn(UI.gridlist.MerchandiseMain, "Type", 0.25)
  eui:uiSetAlign(UI.gridlist.MerchandiseMain, "left", "center")
  UI.button.CloseMerchandiseMain = eui:uiCreateButton(10, 340, 480, 30, {en = "Close", ar = "\216\165\216\186\217\132\216\167\217\130"}, tocolor(20, 20, 20, 255), UI.window.MerchandiseMain)
  UI.window.BuyGoods = eui:uiCreateRectangle(false, false, 600, 480, tocolor(5, 5, 5, 250), true, true, true, true)
  eui:uiSetVisible(UI.window.BuyGoods, false)
  UI.label.BuyGoodsTitle = eui:uiCreateLabel(0, 10, 600, 20, {
    en = "Buy Merchandise",
    ar = "\216\180\216\177\216\167\216\161 \216\168\216\182\216\167\216\185\216\169"
  }, tocolor(255, 255, 255, 255), "center", "top", UI.window.BuyGoods)
  eui:uiSetFont(UI.label.BuyGoodsTitle, "default-large")
  UI.gridlist.BuyGoods = eui:uiCreateGridList(10, 50, 580, 350, tocolor(10, 10, 10, 0), UI.window.BuyGoods)
  eui:uiGridListAddColumn(UI.gridlist.BuyGoods, "Name", 0.4)
  eui:uiGridListAddColumn(UI.gridlist.BuyGoods, "Current QTY", 0.2)
  eui:uiGridListAddColumn(UI.gridlist.BuyGoods, "Buy QTY", 0.2)
  eui:uiGridListAddColumn(UI.gridlist.BuyGoods, "Cost", 0.2)
  eui:uiSetAlign(UI.gridlist.BuyGoods, "left", "center")
  UI.button.BuyGoods = eui:uiCreateButton(10, 395, 580, 35, {
    en = "Buy Selected Item",
    ar = "\216\180\216\177\216\167\216\161 \216\167\217\132\216\186\216\177\216\182 \216\167\217\132\217\133\216\173\216\175\216\175"
  }, "primary", UI.window.BuyGoods)
  UI.button.CloseBuyGoods = eui:uiCreateButton(10, 435, 580, 35, {en = "Close", ar = "\216\165\216\186\217\132\216\167\217\130"}, tocolor(10, 10, 10, 255), UI.window.BuyGoods)
  UI.window.ShopManager = eui:uiCreateWindow(false, false, 600, 450, "Shop Manager")
  eui:uiSetVisible(UI.window.ShopManager, false)
  UI.label["ShopManager:Info"] = eui:uiCreateLabel(15, 50, 420, 80, "${color.primary}\226\128\162 Shop ID  \194\187  #FFFFFF\n${color.primary}\226\128\162 Shop Name  \194\187  #FFFFFF\n${color.primary}\226\128\162 Shop Owner  \194\187  #FFFFFF\n${color.primary}\226\128\162 Shop Type  \194\187  #FFFFFF", tocolor(255, 255, 255, 255), "left", "top", UI.window.ShopManager)
  UI.label["ShopManager:Balance"] = eui:uiCreateLabel(0, 50, 585, 20, "$0", tocolor(0, 255, 0, 255), "right", "top", UI.window.ShopManager)
  eui:uiSetFont(UI.label["ShopManager:Balance"], "default-large")
  UI.button["ShopManager:Withdraw"] = eui:uiCreateButton(490, 80, 100, 35, {en = "Withdraw", ar = "\216\179\216\173\216\168"}, tocolor(0, 0, 0), UI.window.ShopManager)
  UI.gridlist["ShopManager:Goods"] = eui:uiCreateGridList(10, 140, 580, 200, tocolor(0, 0, 0), UI.window.ShopManager)
  eui:uiGridListAddColumn(UI.gridlist["ShopManager:Goods"], "Name", 0.6)
  eui:uiGridListAddColumn(UI.gridlist["ShopManager:Goods"], "Price", 0.2)
  eui:uiGridListAddColumn(UI.gridlist["ShopManager:Goods"], "Quantity", 0.2)
  eui:uiSetAlign(UI.gridlist["ShopManager:Goods"], "left", "center")
  UI.edit["ShopManager:Label"] = eui:uiCreateEdit(15, 350, 250, 30, "", {en = "Name", ar = "\216\167\217\132\216\167\216\179\217\133"}, _, UI.window.ShopManager)
  UI.edit["ShopManager:Price"] = eui:uiCreateEdit(285, 350, 200, 30, "", {en = "Price", ar = "\216\167\217\132\216\179\216\185\216\177"}, _, UI.window.ShopManager)
  UI.button["ShopManager:Save"] = eui:uiCreateButton(520, 350, 70, 40, {en = "Save", ar = "\216\173\217\129\216\184"}, tocolor(0, 0, 0), UI.window.ShopManager)
  eui:uiCreateRectangle(0, 400, 600, 1, tocolor(255, 255, 255, 20), false, false, false, false, UI.window.ShopManager)
  UI.button["ShopManager:Close"] = eui:uiCreateButton(5, 410, 590, 35, {en = "Close", ar = "\216\165\216\186\217\132\216\167\217\130"}, tocolor(0, 0, 0), UI.window.ShopManager)
end
addEventHandler("onClientUIReady", resourceRoot, UIKitReady)
addEventHandler("onClientUIKitReady", root, UIKitReady)
function closeFDWindow(arg0)
  eui:uiSetVisible(UI.window[1], false)
  eui:uiSetVisible(UI.window[2], false)
  eui:uiSetVisible(UI.window.RegisteredShops, false)
  eui:uiSetVisible(UI.window.RegisterShop, false)
  eui:uiSetVisible(UI.window.furniture, false)
  showCursor(false)
end
addEvent("onClientPlayerQuitFromCharacter", true)
addEventHandler("onClientPlayerQuitFromCharacter", localPlayer, closeFDWindow)
addEventHandler("onClientPlayerWasted", localPlayer, closeFDWindow)
addEventHandler("onClientUIVisibilityChange", root, function(arg0)
  if source == UI.window[2] and not arg0 then
    showCursor(false)
    destroyPreview()
  end
end)
function addToCart(arg0)
  arg0.Quantity = 1
  table.insert(var0, arg0)
  reloadCartList()
end
function deleteFromCart(arg0)
  for forvar4, forvar5 in ipairs(var0) do
    if forvar5.ID == arg0.ID then
      var0[forvar4].Quantity = var0[forvar4].Quantity - 1
      if var0[forvar4].Quantity == 0 then
        table.remove(var0, forvar4)
      end
      reloadCartList()
      break
    end
  end
end
function reloadCartList()
  eui:uiGridListClear(UI.gridlist.cart)
  for forvar4, forvar5 in ipairs(var0) do
    eui:uiGridListSetItemData(UI.gridlist.cart, eui:uiGridListAddRow(UI.gridlist.cart), 1, forvar5)
    eui:uiGridListSetItemText(UI.gridlist.cart, eui:uiGridListAddRow(UI.gridlist.cart), 1, "x" .. tostring(forvar5.Quantity) .. "  " .. tostring(forvar5.Name))
    eui:uiGridListSetItemText(UI.gridlist.cart, eui:uiGridListAddRow(UI.gridlist.cart), 2, "$" .. tostring(forvar5.Price * forvar5.Quantity))
    eui:uiGridListSetItemColor(UI.gridlist.cart, eui:uiGridListAddRow(UI.gridlist.cart), 2, tocolor(84, 255, 84))
  end
  eui:uiSetText(UI.label.total_cart, "$ " .. tostring(0 + tonumber(forvar5.Price) * tonumber(forvar5.Quantity)))
end
function clearCart()
  var0 = {}
  reloadCartList()
end
function getCartTotal()
  for forvar4, forvar5 in ipairs(var0) do
  end
  return 0 + tonumber(forvar5.Price) * tonumber(forvar5.Quantity)
end
function changeAlpha()
  if source == UI.label.Buy then
    eui:uiSetAlpha(source, eventName == "onClientUIMouseEnter" and 150 or 200)
  elseif source == UI.label.Close then
    if eventName == "onClientUIMouseEnter" then
    end
    eui:uiSetColor(source, 255, 0, 0, 200)
  end
end
addEventHandler("onClientUIMouseEnter", root, changeAlpha)
addEventHandler("onClientUIMouseLeave", root, changeAlpha)
addEvent("shops:buyItemFromShop:callback", true)
addEventHandler("shops:buyItemFromShop:callback", root, function()
  clearCart()
  var0 = false
  exports.public:loading("shops:checkout", false)
end)
addEventHandler("onClientUIDoubleClick", root, function()
  if source == UI.gridlist[2] then
    if eui:uiGridListGetSelectedItem(UI.gridlist[2]) ~= -1 then
      addToCart((eui:uiGridListGetItemData(UI.gridlist[2], eui:uiGridListGetSelectedItem(UI.gridlist[2]), 1)))
    end
  elseif source == UI.gridlist.cart and eui:uiGridListGetSelectedItem(UI.gridlist.cart) ~= -1 then
    deleteFromCart((eui:uiGridListGetItemData(UI.gridlist.cart, eui:uiGridListGetSelectedItem(UI.gridlist.cart), 1)))
  end
end)
addEventHandler("onClientUIClick", root, function()
  if source == UI.button[1] then
    eui:uiSetVisible(UI.window[1], false)
    showCursor(false)
  elseif source == UI.label.Close then
    eui:uiSetVisible(UI.window[2], false)
    showCursor(false)
    destroyPreview()
  elseif source == UI.gridlist[2] then
    if eui:uiGridListGetSelectedItem(UI.gridlist[2]) ~= -1 then
      eui:uiStaticImageLoadImage(UI.image[1], (exports["inventory-system"]:getItemImageName((eui:uiGridListGetItemData(UI.gridlist[2], eui:uiGridListGetSelectedItem(UI.gridlist[2]), 1)))))
      eui:uiSetText(UI.label.Price, "#00FF00$" .. formatNumber(eui:uiGridListGetItemData(UI.gridlist[2], eui:uiGridListGetSelectedItem(UI.gridlist[2]), 1).Price))
      destroyPreview()
      if eui:uiGridListGetItemData(UI.gridlist[2], eui:uiGridListGetSelectedItem(UI.gridlist[2]), 1).Type == "Skin" or eui:uiGridListGetItemData(UI.gridlist[2], eui:uiGridListGetSelectedItem(UI.gridlist[2]), 1).Type == "Custom Skin" then
        var0 = createPed(eui:uiGridListGetItemData(UI.gridlist[2], eui:uiGridListGetSelectedItem(UI.gridlist[2]), 1).Properties.SkinID or 0, getCameraMatrix())
        setElementAlpha(var0, 0)
        setElementInterior(var0, getElementInterior(localPlayer))
        setElementDimension(var0, getElementDimension(localPlayer))
        var1 = exports.object_preview:createObjectPreview(var0, 0, 0, 180, (var2 - 550) / 2 + 550, (var3 - 300) / 2, 300, 300, false, true, false)
        setElementAlpha(var0, 255)
        if eui:uiGridListGetItemData(UI.gridlist[2], eui:uiGridListGetSelectedItem(UI.gridlist[2]), 1).Type == "Custom Skin" and eui:uiGridListGetItemData(UI.gridlist[2], eui:uiGridListGetSelectedItem(UI.gridlist[2]), 1).SpecialProperties and tonumber(eui:uiGridListGetItemData(UI.gridlist[2], eui:uiGridListGetSelectedItem(UI.gridlist[2]), 1).SpecialProperties.SkinID) then
          exports["skin-system"]:applySkinToPlayer(var0, {
            false,
            eui:uiGridListGetItemData(UI.gridlist[2], eui:uiGridListGetSelectedItem(UI.gridlist[2]), 1).Properties.Image
          }, var1)
          setElementModel(var0, eui:uiGridListGetItemData(UI.gridlist[2], eui:uiGridListGetSelectedItem(UI.gridlist[2]), 1).SpecialProperties.SkinID)
        end
      elseif eui:uiGridListGetItemData(UI.gridlist[2], eui:uiGridListGetSelectedItem(UI.gridlist[2]), 1).Properties.Model then
        var0 = exports.models:createObject(eui:uiGridListGetItemData(UI.gridlist[2], eui:uiGridListGetSelectedItem(UI.gridlist[2]), 1).Properties.Model, getCameraMatrix())
        setElementAlpha(var0, 0)
        setElementInterior(var0, getElementInterior(localPlayer))
        setElementDimension(var0, getElementDimension(localPlayer))
        var1 = exports.object_preview:createObjectPreview(var0, 40, 0, 0, (var2 - 550) / 2 + 550, (var3 - 300) / 2, 300, 300, false, true, true)
        setElementAlpha(var0, 255)
      end
    else
      eui:uiStaticImageLoadImage(UI.image[1], ":items/images/item.png")
      eui:uiSetText(UI.label.Price, "$0")
      destroyPreview()
    end
  elseif source == UI.gridlist.furniture then
    if eui:uiGridListGetSelectedItem(UI.gridlist.furniture) ~= -1 then
      destroyPreview()
      if eui:uiGridListGetItemData(UI.gridlist.furniture, eui:uiGridListGetSelectedItem(UI.gridlist.furniture), 1).model then
        var0 = exports.models:createObject(eui:uiGridListGetItemData(UI.gridlist.furniture, eui:uiGridListGetSelectedItem(UI.gridlist.furniture), 1).model, getCameraMatrix())
        setElementAlpha(var0, 0)
        setElementInterior(var0, getElementInterior(localPlayer))
        setElementDimension(var0, getElementDimension(localPlayer))
        var1 = exports.object_preview:createObjectPreview(var0, 40, 0, 0, (var2 - 500) / 2, (var3 - 500) / 2, 500, 500, false, true, true)
        setElementAlpha(var0, 255)
      end
    else
      destroyPreview()
    end
  elseif source == UI.label.Buy then
    if var4 then
      exports.notifications:output({
        en = "Please wait...",
        ar = "\216\167\217\134\216\170\216\184\216\177 \217\133\217\134 \217\129\216\182\217\132\217\131..."
      }, 3000, "warning")
      return
    end
    if getCartTotal() <= getPlayerMoney(localPlayer) then
      if #var5 > 0 then
        eui:uiLabelApplyShakeAnimation(source, tocolor(0, 255, 0, 255))
        var4 = true
        exports.public:loading("shops:checkout", true)
        triggerServerEvent("shops:checkout", localPlayer, shop.currentID, var5)
      elseif eui:uiGridListGetSelectedItem(UI.gridlist[2]) ~= -1 then
        addToCart((eui:uiGridListGetItemData(UI.gridlist[2], eui:uiGridListGetSelectedItem(UI.gridlist[2]), 1)))
        eui:uiLabelApplyShakeAnimation(source, tocolor(0, 255, 0, 255))
        var4 = true
        exports.public:loading("shops:checkout", true)
        triggerServerEvent("shops:checkout", localPlayer, shop.currentID, var5)
      end
    else
      eui:uiLabelApplyShakeAnimation(source)
    end
  elseif source == UI.button.CancelRegisterShop then
    eui:uiSetVisible(UI.window.RegisterShop, false)
    showCursor(false)
  elseif source == UI.gridlist["RS:Type"] then
    if eui:uiGridListGetSelectedItem(UI.gridlist["RS:Type"]) ~= -1 then
      if shop_types[tonumber((eui:uiGridListGetItemData(UI.gridlist["RS:Type"], eui:uiGridListGetSelectedItem(UI.gridlist["RS:Type"]), 1)))] then
        for forvar7, forvar8 in ipairs(shop_types[tonumber((eui:uiGridListGetItemData(UI.gridlist["RS:Type"], eui:uiGridListGetSelectedItem(UI.gridlist["RS:Type"]), 1)))].items) do
        end
      end
      eui:uiSetText(UI.label["RS:CostNote"], {
        en = "Note: Registration fee (Including goods' prices) is #00ff00$" .. formatNumber((0 + forvar8.price * 200) * 0.8 + 5000) .. ".",
        ar = "#00ff00$" .. formatNumber((0 + forvar8.price * 200) * 0.8 + 5000) .. "#ffffff (\216\180\216\167\217\133\217\132 \216\179\216\185\216\177 \216\167\217\132\216\168\216\182\216\167\216\185\216\169) \217\133\217\132\216\167\216\173\216\184\216\169: \216\177\216\179\217\136\217\133 \216\167\217\132\216\170\216\179\216\172\217\138\217\132"
      })
    end
  elseif source == UI.button.RegisterShop then
    if var6 then
      exports.notifications:output({
        en = "Wait please",
        ar = "\216\167\217\134\216\170\216\184\216\177 \217\133\217\134 \217\129\216\182\217\132\217\131"
      }, 3500, "warning")
      return
    end
    if eui:uiGetText(UI.edit["RS:Name"]) ~= "" then
      if 2 >= (string.gsub(eui:uiGetText(UI.edit["RS:Name"]), " ", "") and utf8.len((string.gsub(eui:uiGetText(UI.edit["RS:Name"]), " ", ""))) or 0) then
        exports.notifications:output({
          en = "The shop name is short",
          ar = "\216\167\216\179\217\133 \216\167\217\132\217\133\216\173\217\132 \217\130\216\181\217\138\216\177"
        }, 3500, "warning")
        return
      end
      if (string.gsub(eui:uiGetText(UI.edit["RS:Name"]), " ", "") and utf8.len((string.gsub(eui:uiGetText(UI.edit["RS:Name"]), " ", ""))) or 0) > 35 then
        exports.notifications:output({
          en = "The shop name is too long",
          ar = "\216\167\216\179\217\133 \216\167\217\132\217\133\216\173\217\132 \216\183\217\136\217\138\217\132 \216\172\216\175\216\167\217\139"
        }, 3500, "warning")
        return
      end
      if eui:uiGridListGetSelectedItem(UI.gridlist["RS:Type"]) ~= -1 then
        eui:uiSetVisible(UI.window.RegisterShop, false)
        showCursor(false)
        var6 = true
        triggerServerEvent("shops:register", localPlayer, eui:uiGetText(UI.edit["RS:Name"]), (eui:uiGridListGetItemData(UI.gridlist["RS:Type"], eui:uiGridListGetSelectedItem(UI.gridlist["RS:Type"]), 1)))
        eui:uiSetText(UI.edit["RS:Name"], "")
      else
        exports.notifications:output({
          en = "Select the shop type",
          ar = "\216\173\216\175\216\175 \217\134\217\136\216\185 \216\167\217\132\217\133\216\173\217\132"
        }, 3500, "warning")
      end
    else
      exports.notifications:output({
        en = "Enter the shop name",
        ar = "\216\163\216\175\216\174\217\132 \216\167\216\179\217\133 \216\167\217\132\217\133\216\173\217\132"
      }, 3500, "warning")
    end
  elseif source == UI.button["ShopManager:Close"] then
    eui:uiSetVisible(UI.window.ShopManager, false)
    showCursor(false)
    currentShopManagerID = false
  elseif source == UI.gridlist["ShopManager:Goods"] then
    if eui:uiGridListGetSelectedItem(source) ~= -1 then
      eui:uiSetText(UI.edit["ShopManager:Label"], eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1).SpecialProperties.Label or "")
      eui:uiSetText(UI.edit["ShopManager:Price"], eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1).Price or 0)
    else
      eui:uiSetText(UI.edit["ShopManager:Label"], "")
      eui:uiSetText(UI.edit["ShopManager:Price"], "")
    end
  elseif source == UI.button["ShopManager:Withdraw"] then
    if eui:uiGetText(UI.label["ShopManager:Balance"]) ~= "$0" then
      triggerServerEvent("shops:takeMoney", localPlayer, currentShopManagerID)
      eui:uiSetText(UI.label["ShopManager:Balance"], "$0")
    end
  elseif source == UI.button["ShopManager:Save"] then
    if eui:uiGridListGetSelectedItem(UI.gridlist["ShopManager:Goods"]) ~= -1 and tonumber((eui:uiGetText(UI.edit["ShopManager:Price"]))) and 0 <= tonumber((eui:uiGetText(UI.edit["ShopManager:Price"]))) then
      if tonumber((eui:uiGetText(UI.edit["ShopManager:Price"]))) > 100000000 then
        exports.notifications:output({
          en = "The price is too high",
          ar = "\216\167\217\132\216\179\216\185\216\177 \217\133\216\177\216\170\217\129\216\185 \216\172\216\175\216\167\217\139"
        }, 3000, "warning")
        return
      end
      if eui:uiGridListGetItemData(UI.gridlist["ShopManager:Goods"], eui:uiGridListGetSelectedItem(UI.gridlist["ShopManager:Goods"]), 1).SpecialProperties.Label == eui:uiGetText(UI.edit["ShopManager:Label"]) and tonumber((eui:uiGetText(UI.edit["ShopManager:Price"]))) == eui:uiGridListGetItemData(UI.gridlist["ShopManager:Goods"], eui:uiGridListGetSelectedItem(UI.gridlist["ShopManager:Goods"]), 1).Price then
        return
      end
      if utf8.len((eui:uiGetText(UI.edit["ShopManager:Label"]))) > 20 then
        exports.notifications:output({
          en = "The name is too long",
          ar = "\216\167\217\132\216\167\216\179\217\133 \216\183\217\136\217\138\217\132 \216\172\216\175\216\167\217\139"
        }, 3000, "warning")
        return
      end
      if eui:uiGetText(UI.edit["ShopManager:Label"]) == "" then
        eui:uiGridListGetItemData(UI.gridlist["ShopManager:Goods"], eui:uiGridListGetSelectedItem(UI.gridlist["ShopManager:Goods"]), 1).SpecialProperties.Label = nil
        eui:uiGridListSetItemText(UI.gridlist["ShopManager:Goods"], eui:uiGridListGetSelectedItem(UI.gridlist["ShopManager:Goods"]), 1, eui:uiGridListGetItemData(UI.gridlist["ShopManager:Goods"], eui:uiGridListGetSelectedItem(UI.gridlist["ShopManager:Goods"]), 1).Name)
      else
        eui:uiGridListGetItemData(UI.gridlist["ShopManager:Goods"], eui:uiGridListGetSelectedItem(UI.gridlist["ShopManager:Goods"]), 1).SpecialProperties.Label = eui:uiGetText(UI.edit["ShopManager:Label"])
        eui:uiGridListSetItemText(UI.gridlist["ShopManager:Goods"], eui:uiGridListGetSelectedItem(UI.gridlist["ShopManager:Goods"]), 1, eui:uiGridListGetItemData(UI.gridlist["ShopManager:Goods"], eui:uiGridListGetSelectedItem(UI.gridlist["ShopManager:Goods"]), 1).Name .. " (" .. eui:uiGetText(UI.edit["ShopManager:Label"]) .. ")")
      end
      eui:uiGridListGetItemData(UI.gridlist["ShopManager:Goods"], eui:uiGridListGetSelectedItem(UI.gridlist["ShopManager:Goods"]), 1).Price = tonumber((eui:uiGetText(UI.edit["ShopManager:Price"])))
      eui:uiGridListSetItemData(UI.gridlist["ShopManager:Goods"], eui:uiGridListGetSelectedItem(UI.gridlist["ShopManager:Goods"]), 1, (eui:uiGridListGetItemData(UI.gridlist["ShopManager:Goods"], eui:uiGridListGetSelectedItem(UI.gridlist["ShopManager:Goods"]), 1)))
      eui:uiGridListSetItemText(UI.gridlist["ShopManager:Goods"], eui:uiGridListGetSelectedItem(UI.gridlist["ShopManager:Goods"]), 2, "$" .. tonumber((eui:uiGetText(UI.edit["ShopManager:Price"]))))
      triggerServerEvent("shops:manager:updateItem", localPlayer, currentShopManagerID, fromJSON(toJSON((eui:uiGridListGetItemData(UI.gridlist["ShopManager:Goods"], eui:uiGridListGetSelectedItem(UI.gridlist["ShopManager:Goods"]), 1)))), eui:uiGetText(UI.edit["ShopManager:Label"]), (tonumber((eui:uiGetText(UI.edit["ShopManager:Price"])))))
      eui:uiSetText(UI.edit["ShopManager:Label"], "")
      eui:uiSetText(UI.edit["ShopManager:Price"], "")
      eui:uiGridListSetSelectedItem(UI.gridlist["ShopManager:Goods"], -1)
    end
  elseif source == UI.button.RegisterNewShop then
    eui:uiSetVisible(UI.window.RegisteredShops, false)
    eui:uiSetVisible(UI.window.RegisterShop, true)
  elseif source == UI.button.CloseRegisteredShops then
    eui:uiSetVisible(UI.window.RegisteredShops, false)
    showCursor(false)
  elseif source == UI.button.CloseMerchandiseMain then
    eui:uiSetVisible(UI.window.MerchandiseMain, false)
    showCursor(false)
  elseif source == UI.button.CloseBuyGoods then
    eui:uiSetVisible(UI.window.BuyGoods, false)
  elseif source == UI.button.BuyGoods then
    if eui:uiGridListGetSelectedItem(UI.gridlist.BuyGoods) ~= -1 then
      if var6 then
        exports.notifications:output({
          en = "Wait please",
          ar = "\216\167\217\134\216\170\216\184\216\177 \217\133\217\134 \217\129\216\182\217\132\217\131"
        }, 3500, "warning")
        return
      end
      if 0 >= tonumber((eui:uiGridListGetItemText(UI.gridlist.BuyGoods, eui:uiGridListGetSelectedItem(UI.gridlist.BuyGoods), 3))) then
        exports.notifications:output({
          en = "You can't buy more of this item",
          ar = "\217\132\216\167\217\138\217\133\217\131\217\134\217\131 \216\180\216\177\216\167\216\161 \216\167\217\132\217\133\216\178\217\138\216\175 \217\133\217\134 \217\135\216\176\216\167 \216\167\217\132\216\186\216\177\216\182"
        }, 3500, "warning")
        return
      end
      var6 = true
      eui:uiGridListSetSelectedItem(UI.gridlist.BuyGoods, -1)
      triggerServerEvent("shops:goods:buy", localPlayer, var7.id, (eui:uiGridListGetItemText(UI.gridlist.BuyGoods, eui:uiGridListGetSelectedItem(UI.gridlist.BuyGoods), 1)))
    end
  elseif source == UI.button.RemoveRegisteredShop then
    if eui:uiGridListGetSelectedItem(UI.gridlist.RegisteredShops) ~= -1 then
      if var6 then
        exports.notifications:output({
          en = "Wait please",
          ar = "\216\167\217\134\216\170\216\184\216\177 \217\133\217\134 \217\129\216\182\217\132\217\131"
        }, 3500, "warning")
        return
      end
      var6 = true
      eui:uiGridListRemoveRow(UI.gridlist.RegisteredShops, (eui:uiGridListGetSelectedItem(UI.gridlist.RegisteredShops)))
      eui:uiGridListSetSelectedItem(UI.gridlist.RegisteredShops, -1)
      triggerServerEvent("shops:removeShop", localPlayer, (eui:uiGridListGetItemText(UI.gridlist.RegisteredShops, eui:uiGridListGetSelectedItem(UI.gridlist.RegisteredShops), 1)))
    end
  elseif source == UI.button["furniture:buy"] then
    if eui:uiGridListGetSelectedItem(UI.gridlist.furniture) ~= -1 then
      if var4 then
        exports.notifications:output({
          en = "Please wait...",
          ar = "\216\167\217\134\216\170\216\184\216\177 \217\133\217\134 \217\129\216\182\217\132\217\131..."
        }, 3000, "warning")
        return
      end
      if getPlayerMoney(localPlayer) >= tonumber(eui:uiGridListGetItemData(UI.gridlist.furniture, eui:uiGridListGetSelectedItem(UI.gridlist.furniture), 1).price) then
        var4 = true
        triggerServerEvent("shops:furniture:buy", localPlayer, (eui:uiGridListGetItemData(UI.gridlist.furniture, eui:uiGridListGetSelectedItem(UI.gridlist.furniture), 1)))
      end
    end
  elseif source == UI.button["furniture:close"] then
    eui:uiSetVisible(UI.window.furniture, false)
    showCursor(false)
    destroyPreview()
  end
end)
addEvent("shops:response", true)
addEventHandler("shops:response", localPlayer, function()
  var0 = false
end)
addEventHandler("onClientUIDoubleClick", root, function()
  if source == UI.gridlist.MerchandiseMain and eui:uiGridListGetSelectedItem(source) ~= -1 then
    eui:uiSetVisible(UI.window.BuyGoods, true)
    eui:uiBringToFront(UI.window.BuyGoods)
    eui:uiGridListClear(UI.gridlist.BuyGoods)
    var0 = {
      id = eui:uiGridListGetItemText(source, eui:uiGridListGetSelectedItem(source), 1),
      type = eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 3)
    }
    triggerServerEvent("shops:goods:getShopItems", localPlayer, (eui:uiGridListGetItemText(source, eui:uiGridListGetSelectedItem(source), 1)))
  end
end)
addEvent("shops:goods:getShopItems:response", true)
addEventHandler("shops:goods:getShopItems:response", root, function(arg0)
  eui:uiGridListClear(UI.gridlist.BuyGoods)
  for forvar5, forvar6 in ipairs(shop_types[var0.type].items) do
    eui:uiGridListSetItemText(UI.gridlist.BuyGoods, eui:uiGridListAddRow(UI.gridlist.BuyGoods), 1, tostring(forvar6.name))
    for forvar12, forvar13 in ipairs(arg0) do
      if forvar13.Name == forvar6.name then
        break
      end
    end
    eui:uiGridListSetItemText(UI.gridlist.BuyGoods, eui:uiGridListAddRow(UI.gridlist.BuyGoods), 2, tostring(forvar13.Quantity) .. " / 200")
    eui:uiGridListSetItemText(UI.gridlist.BuyGoods, eui:uiGridListAddRow(UI.gridlist.BuyGoods), 3, tostring(200 - forvar13.Quantity))
    eui:uiGridListSetItemText(UI.gridlist.BuyGoods, eui:uiGridListAddRow(UI.gridlist.BuyGoods), 4, "$" .. (200 - forvar13.Quantity) * forvar6.price * 0.8)
    eui:uiGridListSetItemColor(UI.gridlist.BuyGoods, eui:uiGridListAddRow(UI.gridlist.BuyGoods), 4, tocolor(0, 255, 0))
  end
end)
addEvent("shops:showShops", true)
addEventHandler("shops:showShops", root, function(arg0)
  eui:uiSetVisible(UI.window[1], true)
  showCursor(true)
  eui:uiGridListClear(UI.gridlist[1])
  for forvar4, forvar5 in pairs(arg0) do
    eui:uiGridListSetItemText(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 1, tostring(forvar5.id))
    eui:uiGridListSetItemText(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 2, tostring(forvar5.name))
  end
end)
addEvent("shops:playPurchaseSound", true)
addEventHandler("shops:playPurchaseSound", localPlayer, function()
  playSound("purchase.wav")
end)
addEvent("onClientElementMenuClick", true)
addEventHandler("onClientElementMenuClick", root, function(arg0, arg1, arg2)
  if not isElement(arg0) then
    return
  end
  if getElementType(arg0) == "ped" and arg1 == "Talk" and arg2.interact == "furniture.shop" then
    eui:uiSetVisible(UI.window.furniture, true)
    showCursor(true)
  end
end)
addEvent("shops:showRegisteredShops", true)
addEventHandler("shops:showRegisteredShops", localPlayer, function(arg0)
  eui:uiSetVisible(UI.window.RegisteredShops, true)
  showCursor(true)
  eui:uiGridListClear(UI.gridlist.RegisteredShops)
  for forvar4, forvar5 in ipairs(arg0) do
    eui:uiGridListSetItemText(UI.gridlist.RegisteredShops, eui:uiGridListAddRow(UI.gridlist.RegisteredShops), 1, tostring(forvar5.id))
    eui:uiGridListSetItemText(UI.gridlist.RegisteredShops, eui:uiGridListAddRow(UI.gridlist.RegisteredShops), 2, tostring(forvar5.name))
    eui:uiGridListSetItemText(UI.gridlist.RegisteredShops, eui:uiGridListAddRow(UI.gridlist.RegisteredShops), 3, tostring(shop_types[forvar5.type].name))
  end
end)
addEvent("shops:goods:showRegisteredShops", true)
addEventHandler("shops:goods:showRegisteredShops", localPlayer, function(arg0)
  eui:uiSetVisible(UI.window.MerchandiseMain, true)
  showCursor(true)
  eui:uiGridListClear(UI.gridlist.MerchandiseMain)
  for forvar4, forvar5 in ipairs(arg0) do
    if forvar5.type ~= 1 then
      eui:uiGridListSetItemText(UI.gridlist.MerchandiseMain, eui:uiGridListAddRow(UI.gridlist.MerchandiseMain), 1, tostring(forvar5.id))
      eui:uiGridListSetItemText(UI.gridlist.MerchandiseMain, eui:uiGridListAddRow(UI.gridlist.MerchandiseMain), 2, tostring(forvar5.name))
      eui:uiGridListSetItemText(UI.gridlist.MerchandiseMain, eui:uiGridListAddRow(UI.gridlist.MerchandiseMain), 3, tostring(shop_types[forvar5.type].name))
      eui:uiGridListSetItemData(UI.gridlist.MerchandiseMain, eui:uiGridListAddRow(UI.gridlist.MerchandiseMain), 3, forvar5.type)
    end
  end
end)
addEvent("shops:show", true)
addEventHandler("shops:show", root, function(arg0, arg1, arg2, arg3)
  showShop(true, arg0, arg1, arg2, arg3)
end)
addEvent("shops:showManager", true)
addEventHandler("shops:showManager", localPlayer, function(arg0, arg1, arg2)
  currentShopManagerID = arg0.id
  var0 = arg2
  eui:uiSetVisible(UI.window.ShopManager, true)
  showCursor(true)
  eui:uiSetText(UI.label["ShopManager:Info"], "${color.primary}\226\128\162 Shop ID  \194\187  #FFFFFF" .. tostring(arg0.id) .. "\n" .. "${color.primary}\226\128\162 Shop Name  \194\187  #FFFFFF" .. tostring(arg0.name) .. "\n" .. "${color.primary}\226\128\162 Shop Owner  \194\187  #FFFFFF" .. tostring(arg0.owner) .. "\n" .. "${color.primary}\226\128\162 Shop Type  \194\187  #FFFFFF" .. tostring(shop_types[arg0.type].name), tocolor(255, 255, 255, 255), "left", "top", UI.window.ShopManager)
  eui:uiSetText(UI.label["ShopManager:Balance"], "$" .. formatNumber(arg0.balance))
  eui:uiGridListClear(UI.gridlist["ShopManager:Goods"])
  for forvar6, forvar7 in ipairs(arg1) do
    eui:uiGridListSetItemData(UI.gridlist["ShopManager:Goods"], eui:uiGridListAddRow(UI.gridlist["ShopManager:Goods"]), 1, forvar7)
    eui:uiGridListSetItemText(UI.gridlist["ShopManager:Goods"], eui:uiGridListAddRow(UI.gridlist["ShopManager:Goods"]), 1, tostring(forvar7.Name) .. " (" .. tostring(forvar7.SpecialProperties.Label) .. ")")
    eui:uiGridListSetItemText(UI.gridlist["ShopManager:Goods"], eui:uiGridListAddRow(UI.gridlist["ShopManager:Goods"]), 2, "$" .. tostring(forvar7.Price))
    eui:uiGridListSetItemColor(UI.gridlist["ShopManager:Goods"], eui:uiGridListAddRow(UI.gridlist["ShopManager:Goods"]), 2, tocolor(0, 220, 0, 255))
    eui:uiGridListSetItemText(UI.gridlist["ShopManager:Goods"], eui:uiGridListAddRow(UI.gridlist["ShopManager:Goods"]), 3, tostring(forvar7.Quantity))
  end
  if arg0.type == 1 then
    eui:uiSetVisible(UI.edit["ShopManager:Label"], true)
    eui:uiSetVisible(UI.edit["ShopManager:Price"], true)
    eui:uiSetVisible(UI.button["ShopManager:Save"], true)
  else
    eui:uiSetVisible(UI.edit["ShopManager:Label"], false)
    eui:uiSetVisible(UI.edit["ShopManager:Price"], false)
    eui:uiSetVisible(UI.button["ShopManager:Save"], false)
  end
end)
shop = {
  currentID = false,
  name = "SHOP",
  status = false
}
function showShop(arg0, arg1, arg2, arg3, arg4)
  if not getElementData(localPlayer, "character:id") then
    return false
  end
  shop.status = arg0
  showCursor(arg0)
  eui:uiSetVisible(UI.window[2], arg0)
  if arg0 then
    clearCart()
    shop.currentID = arg1
    shop.name = arg2 or "Shop"
    shop.type = arg3
    shop.goods = arg4
    eui:uiSetText(UI.window[2], tostring(shop.name))
    eui:uiStaticImageLoadImage(UI.image[1], ":items/images/item.png")
    eui:uiSetText(UI.label.Price, "$0")
    eui:uiGridListClear(UI.gridlist[2])
    for forvar8, forvar9 in ipairs(arg4) do
      eui:uiGridListSetItemData(UI.gridlist[2], eui:uiGridListAddRow(UI.gridlist[2]), 1, forvar9)
      eui:uiGridListSetItemText(UI.gridlist[2], eui:uiGridListAddRow(UI.gridlist[2]), 1, tostring(forvar9.Name) .. " (" .. tostring(forvar9.SpecialProperties.Label) .. ")")
      if forvar9.Price ~= 0 or not "Free" then
      end
      eui:uiGridListSetItemText(UI.gridlist[2], eui:uiGridListAddRow(UI.gridlist[2]), 2, "$" .. tostring(forvar9.Price))
      eui:uiGridListSetItemColor(UI.gridlist[2], eui:uiGridListAddRow(UI.gridlist[2]), 2, tocolor(0, 220, 0, 255))
    end
  else
    shop.currentID = false
  end
end
function showShopItems()
  eui:uiGridListClear(UI.gridlist[2])
  eui:uiStaticImageLoadImage(UI.image[1], ":items/images/item.png")
  eui:uiSetText(UI.label.Price, "$0")
end
function formatNumber(arg0)
  while true do
    k = string.gsub(arg0, "^(-?%d+)(%d%d%d)", "%1,%2")
    if k == 0 then
      break
    end
  end
  return string.gsub(arg0, "^(-?%d+)(%d%d%d)", "%1,%2")
end
