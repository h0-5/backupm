-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

function UIKitReady()
  eui = exports.UIKit
  var0.window[1] = eui:uiCreateWindow(eui:uiGetReferenceScreenSize() - 270 - 50, false, 270, 500, {
    en = "Clothes Shop",
    ar = "\217\133\216\173\217\132 \217\133\217\132\216\167\216\168\216\179"
  }, _, ":assets/icons/clothes.png")
  eui:uiWindowSetMovable(var0.window[1], false)
  eui:uiSetVisible(var0.window[1], false)
  var0.container.page_1 = eui:uiCreateContainer(0, 30, 270, 500 - 45, var0.window[1])
  var0.gridlist.sections = eui:uiCreateGridList(5, 20, 270 - 10, 500 - 105, tocolor(10, 10, 10, 0), var0.container.page_1)
  eui:uiGridListAddColumn(var0.gridlist.sections, "Sections", 0.9)
  eui:uiGridListAddColumn(var0.gridlist.sections, "", 0.1)
  eui:uiSetProperty(var0.gridlist.sections, "row_height", 30)
  var0.button.close = eui:uiCreateButton(5, 500 - 40, 270 - 10, 35, {en = "Close", ar = "\216\165\216\186\217\132\216\167\217\130"}, tocolor(0, 0, 0), var0.window[1])
  for forvar7, forvar8 in ipairs(clothes_types) do
    eui:uiGridListSetItemText(var0.gridlist.sections, eui:uiGridListAddRow(var0.gridlist.sections), 1, forvar8.name)
    eui:uiGridListSetItemText(var0.gridlist.sections, eui:uiGridListAddRow(var0.gridlist.sections), 2, "\226\158\148")
    eui:uiGridListSetItemData(var0.gridlist.sections, eui:uiGridListAddRow(var0.gridlist.sections), 1, forvar8)
  end
  var0.container.page_2 = eui:uiCreateContainer(0, 30, 270, 500 - 30 - 45, var0.window[1])
  eui:uiSetVisible(var0.container.page_2, false)
  var0.label.page_2_title = eui:uiCreateLabel(0, 5, 270, 17, "", "primary", "center", "center", var0.container.page_2)
  var0.label.back_to_page_1 = eui:uiCreateImage(15, 5, 15, 15, ":assets/icons/left-arrow.png", var0.container.page_2)
  eui:uiSetProperty(var0.label.back_to_page_1, "HoverOpacityEffect", true)
  var0.gridlist.items = eui:uiCreateGridList(5, 40, 270 - 10, 500 - 140 - 20, tocolor(10, 10, 10, 0), var0.container.page_2)
  eui:uiGridListAddColumn(var0.gridlist.items, "Items", 0.7)
  eui:uiGridListAddColumn(var0.gridlist.items, "", 0.3)
  var0.button.buy = eui:uiCreateButton(5, 500 - 30 - 45 - 35, 270 - 10, 35, {en = "Buy", ar = "\216\180\216\177\216\167\216\161"}, "primary", var0.container.page_2)
  addEventHandler("onClientUIVisibilityChange", root, function(arg0)
    if source == var0.window[1] and not arg0 then
      closeSection()
      triggerServerEvent("clothes:reset", localPlayer)
    end
  end)
end
addEventHandler("onClientUIReady", resourceRoot, UIKitReady)
addEventHandler("onClientUIKitReady", root, UIKitReady)
function closeUIWindows(arg0)
  closeMenu()
end
addEventHandler("onClientPlayerQuitFromCharacter", localPlayer, closeUIWindows)
addEventHandler("onClientPlayerWasted", localPlayer, closeUIWindows)
function openSection(arg0, arg1)
  eui:uiSetVisible(var0.container.page_1, false)
  eui:uiSetVisible(var0.container.page_2, true)
  eui:uiSetText(var0.label.page_2_title, arg0)
  current_clothes_type = arg1
  eui:uiGridListClear(var0.gridlist.items)
  for forvar5, forvar6 in ipairs(clothes_list[arg1]) do
    eui:uiGridListSetItemText(var0.gridlist.items, eui:uiGridListAddRow(var0.gridlist.items), 1, forvar6.name or forvar6.texture)
    eui:uiGridListSetItemText(var0.gridlist.items, eui:uiGridListAddRow(var0.gridlist.items), 2, "$" .. forvar6.price)
    eui:uiGridListSetItemData(var0.gridlist.items, eui:uiGridListAddRow(var0.gridlist.items), 1, forvar5)
    eui:uiGridListSetItemColor(var0.gridlist.items, eui:uiGridListAddRow(var0.gridlist.items), 2, tocolor(0, 255, 0))
  end
end
function openMenu()
  if eui:uiGetVisible(var0.window[1]) then
    return
  end
  eui:uiSetVisible(var0.window[1], true)
  showCursor(true)
  for forvar3, forvar4 in ipairs(clothes_types) do
    if getPedClothes(localPlayer, forvar4.type) and getPedClothes(localPlayer, forvar4.type) then
      var1[forvar4.type] = {
        getPedClothes(localPlayer, forvar4.type)
      }
    end
  end
end
function closeMenu()
  eui:uiSetVisible(var0.window[1], false)
  showCursor(false)
  for forvar3, forvar4 in ipairs(clothes_types) do
    if var1[forvar4.type] then
      addPedClothes(localPlayer, unpack(var1[forvar4.type]))
    else
      removePedClothes(localPlayer, forvar4.type)
    end
  end
  var1 = {}
end
function closeSection()
  if isElement(var0.container.page_2) then
    eui:uiSetVisible(var0.container.page_2, false)
    eui:uiSetVisible(var0.container.page_1, true)
  end
end
addEventHandler("onClientUIDoubleClick", root, function()
  if source == var0.gridlist.sections then
    if eui:uiGridListGetSelectedItem(var0.gridlist.sections) ~= -1 then
      openSection(eui:uiGridListGetItemData(var0.gridlist.sections, eui:uiGridListGetSelectedItem(var0.gridlist.sections), 1).name, eui:uiGridListGetItemData(var0.gridlist.sections, eui:uiGridListGetSelectedItem(var0.gridlist.sections), 1).type)
    end
  elseif source == var0.gridlist.items and eui:uiGridListGetSelectedItem(var0.gridlist.items) ~= -1 then
    addPedClothes(localPlayer, clothes_list[current_clothes_type][eui:uiGridListGetItemData(var0.gridlist.items, eui:uiGridListGetSelectedItem(var0.gridlist.items), 1)].texture, clothes_list[current_clothes_type][eui:uiGridListGetItemData(var0.gridlist.items, eui:uiGridListGetSelectedItem(var0.gridlist.items), 1)].model, current_clothes_type)
  end
end)
addEventHandler("onClientUIClick", root, function()
  if source == var0.button.close then
    closeMenu()
  elseif source == var0.label.back_to_page_1 then
    closeSection()
    triggerServerEvent("clothes:reset", localPlayer)
  elseif source == var0.button.buy and eui:uiGridListGetSelectedItem(var0.gridlist.items) ~= -1 then
    triggerServerEvent("clothes:buy", localPlayer, current_clothes_type, (eui:uiGridListGetItemData(var0.gridlist.items, eui:uiGridListGetSelectedItem(var0.gridlist.items), 1)))
  end
end)
addEvent("onClientElementMenuClick", true)
addEventHandler("onClientElementMenuClick", root, function(arg0, arg1, arg2)
  if arg1 == "Talk" and arg2.interact == "clothes.shop" then
    if getElementModel(localPlayer) ~= 0 then
      exports.notifications:output("Sorry, this feature only for CJ skin", 3000, "error")
      return
    end
    openMenu()
  end
end)
