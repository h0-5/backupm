-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

UI = {
  tab = {},
  edit = {},
  window = {},
  label = {},
  checkbox = {},
  switch = {},
  button = {},
  tabpanel = {},
  gridlist = {},
  scrollbar = {},
  image = {},
  rectangle = {}
}
function UIKitReady()
  eui = exports.UIKit
  UI.window[2] = eui:uiCreateWindow(false, false, 350, 140, "Change Username")
  eui:uiWindowSetMovable(UI.window[2], false)
  eui:uiSetVisible(UI.window[2], false)
  UI.edit.username = eui:uiCreateEdit(5, 4, 320, 25, "", "New Username", _, (eui:uiCreateRectangle(10, 40, 330, 30, tocolor(40, 40, 40, 240), true, true, true, true, UI.window[2])))
  eui:uiSetProperty(UI.edit.username, "UnderLineVisible", "False")
  UI.button.change_username = eui:uiCreateButton(5, 105, 119, 30, "Change", _, UI.window[2])
  UI.button.cancel_change_username = eui:uiCreateButton(126, 105, 119, 30, "Cancel", _, UI.window[2])
end
addEventHandler("onClientUIReady", resourceRoot, UIKitReady)
addEvent("onClientUIKitReady", true)
addEventHandler("onClientUIKitReady", root, UIKitReady)
addEventHandler("onClientUIMenuSelectChange", root, function(arg0, arg1)
  if arg1 and getElementID(source) == "main-menu" then
    if eui:uiMenuGetItemID(source, arg0) == "features" then
      if not isElement(UI.tabpanel[1]) then
        UI.tabpanel[1] = eui:uiCreateTabPanel(10, 90, eui:uiGetSize(arg1) - 20, 270, "", tocolor(30, 30, 30, 0), arg1)
        eui:uiSetProperty(UI.tabpanel[1], "tab_height", 40)
        UI.tab[1] = eui:uiCreateTab("Features Shop", "Features Shop", UI.tabpanel[1])
        eui:uiSetSelectedTab(UI.tabpanel[1], UI.tab[1])
        UI.gridlist[1] = eui:uiCreateGridList(0, 5, eui:uiGetSize(arg1) - 20, eui:uiGetSize(arg1) - 150, tocolor(10, 10, 10, 0), UI.tab[1])
        eui:uiGridListAddColumn(UI.gridlist[1], "Name", 0.8)
        eui:uiGridListAddColumn(UI.gridlist[1], "", 0.2)
        eui:uiSetAlign(UI.gridlist[1], "left", "center")
        for forvar9, forvar10 in ipairs(config.features_list) do
          eui:uiGridListSetItemText(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 1, tostring(forvar10.text))
          eui:uiGridListSetItemText(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 2, tostring(forvar10.price) .. " coins")
          eui:uiGridListSetItemData(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 1, forvar10.code)
          eui:uiGridListSetItemData(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 2, forvar10.price)
        end
        UI.button[1] = eui:uiCreateButton(10, eui:uiGetSize(arg1) - 45, 150, 35, {
          en = "Buy Feature",
          ar = "\216\180\216\177\216\167\216\161 \216\167\217\132\216\174\216\167\216\181\217\138\216\169"
        }, tocolor(0, 0, 0), arg1)
        UI.image[1] = eui:uiCreateImage(eui:uiGetSize(arg1) - 32 - 10, eui:uiGetSize(arg1) - 28 - 10, 24, 24, ":bios-coins/images/coins.png", arg1)
        UI.label[1] = eui:uiCreateLabel(eui:uiGetSize(arg1) - 250, eui:uiGetSize(arg1) - 28 - 10, 200, 24, "0", tocolor(255, 255, 255, 255), "right", "center", arg1)
        UI.tab[2] = eui:uiCreateTab("My Features", "My Current Features", UI.tabpanel[1])
        UI.gridlist[2] = eui:uiCreateGridList(0, 5, eui:uiGetSize(arg1) - 20, eui:uiGetSize(arg1) - 150, tocolor(10, 10, 10, 0), UI.tab[2])
        eui:uiGridListAddColumn(UI.gridlist[2], "Info", 0.6)
        eui:uiGridListAddColumn(UI.gridlist[2], "", 0.15)
        eui:uiGridListAddColumn(UI.gridlist[2], "Date", 0.25)
        eui:uiSetAlign(UI.gridlist[2], "left", "center")
      end
      triggerServerEvent("bc:getFeaturesHistory", localPlayer)
    elseif eui:uiMenuGetItemID(source, arg0) == "memberships" and not isElement(UI.rectangle[1]) then
      UI.rectangle[1] = eui:uiCreateRectangle((eui:uiGetSize(arg1) - 200) / 2, 80, 200, 400, tocolor(19, 22, 27, 240), true, true, true, true, arg1)
      UI.rectangle[2] = eui:uiCreateRectangle((eui:uiGetSize(arg1) - 200) / 2 - 210, 90, 200, 380, tocolor(19, 22, 27, 240), true, true, true, true, arg1)
      UI.rectangle[3] = eui:uiCreateRectangle((eui:uiGetSize(arg1) - 200) / 2 + 210, 90, 200, 380, tocolor(19, 22, 27, 240), true, true, true, true, arg1)
      eui:uiCreateLabel(0, eui:uiGetSize(arg1) - 60, eui:uiGetSize(arg1))
      UI.label.title = eui:uiCreateLabel(0, 40, 200, 30, "Wnash Premium", tocolor(0, 255, 225, 255), "center", "center", UI.rectangle[1])
      eui:uiSetFont(UI.label.title, "default-large")
      UI.image[2] = eui:uiCreateImage((200 - 64) / 2, -30, 64, 64, ":bios-coins/images/premium.png", UI.rectangle[1])
      eui:uiCreateLabel(0, 80, 200, 250, "\t\t\t\t\t\t\216\180\216\167\216\177\216\169 \217\136\217\132\217\136\217\134 \217\133\217\133\217\138\216\178\n\t\t\t\t\t\t\216\180\216\167\216\177\216\169 \216\168\216\172\216\167\217\134\216\168 \216\167\217\132\216\167\216\179\217\133 \217\129\217\138 \216\167\217\132\216\170\216\167\216\168\n\t\t\t\t\t\t$\217\133\216\168\217\132\216\186 500,000\n\t\t\t\t\t\t\216\177\216\170\216\168\216\169 \217\129\217\138 \216\167\217\132\216\175\216\179\217\131\217\136\216\177\216\175\n\t\t\t\t\t\t\216\174\216\181\217\133 35% \217\129\217\138 \216\172\217\133\217\138\216\185 \216\167\217\132\217\133\216\185\216\167\216\177\216\182\n\t\t\t\t\t\t\216\174\216\181\217\133 40% \216\185\217\132\217\137 \217\129\217\136\216\167\216\170\217\138\216\177 \216\167\217\132\217\131\217\135\216\177\216\168\216\167\216\161\n\t\t\t\t\t\t\216\174\216\181\217\133 40% \216\185\217\132\217\137 \216\170\216\179\216\175\217\138\216\175 \216\167\217\132\217\133\216\174\216\167\217\132\217\129\216\167\216\170\n\t\t\t\t\t\t\216\178\217\138\216\167\216\175\216\169 \217\129\217\138 \216\167\217\132\216\177\216\167\216\170\216\168 \216\167\217\132\217\138\217\136\217\133\217\138\n\t\t\t\t\t\t\216\178\217\138\216\167\216\175\216\169 45% \217\129\217\138 \216\177\217\136\216\167\216\170\216\168 \216\167\217\132\217\136\216\184\216\167\216\166\217\129\n\t\t\t\t\t\t\216\178\217\138\216\167\216\175\216\169 45% \217\129\217\138 \216\170\216\173\216\181\217\138\217\132 \216\167\217\132\216\174\216\168\216\177\216\169\n\t\t\t\t\t\t\216\174\216\181\217\133 75% \216\185\217\132\217\137 \216\170\216\181\217\132\217\138\216\173 \216\167\217\132\217\133\216\177\217\131\216\168\216\167\216\170\n\t\t\t\t\t\t\217\133\217\134\216\178\217\132 \217\133\217\130\216\175\217\133 \217\133\217\134 \216\167\216\174\216\170\217\138\216\167\216\177 \216\167\217\132\216\167\216\175\216\167\216\177\216\169 \216\167\217\132\216\185\217\132\217\138\216\167\n\t\t\t\t\t\t\217\133\216\177\217\131\216\168\216\169 \216\174\216\167\216\181\216\169 \217\129\217\130\216\183 \216\168\217\134\216\184\216\167\217\133 \216\167\217\132\216\185\216\182\217\136\217\138\216\169\n\t\t\t\t\t", tocolor(255, 255, 225, 255), "center", "top", UI.rectangle[1])
      eui:uiSetFont(eui:uiCreateLabel(0, 360, 200, 30, "32 USD", tocolor(0, 255, 0, 255), "center", "center", UI.rectangle[1]), "default-large")
      UI.label.title = eui:uiCreateLabel(0, 40, 200, 30, "Wnash Plus", tocolor(255, 170, 0, 255), "center", "center", UI.rectangle[2])
      eui:uiSetFont(UI.label.title, "default-large")
      UI.image[3] = eui:uiCreateImage((200 - 64) / 2, -30, 64, 64, ":bios-coins/images/plus.png", UI.rectangle[2])
      eui:uiCreateLabel(0, 80, 200, 250, "\t\t\t\t\t\t\216\180\216\167\216\177\216\169 \217\136\217\132\217\136\217\134 \217\133\217\133\217\138\216\178\n\t\t\t\t\t\t\216\180\216\167\216\177\216\169 \216\168\216\172\216\167\217\134\216\168 \216\167\217\132\216\167\216\179\217\133 \217\129\217\138 \216\167\217\132\216\170\216\167\216\168\n\t\t\t\t\t\t$\217\133\216\168\217\132\216\186 200,000\n\t\t\t\t\t\t\216\177\216\170\216\168\216\169 \217\129\217\138 \216\167\217\132\216\175\216\179\217\131\217\136\216\177\216\175\n\t\t\t\t\t\t\216\174\216\181\217\133 15% \217\129\217\138 \216\172\217\133\217\138\216\185 \216\167\217\132\217\133\216\185\216\167\216\177\216\182\n\t\t\t\t\t\t\216\174\216\181\217\133 20% \216\185\217\132\217\137 \217\129\217\136\216\167\216\170\217\138\216\177 \216\167\217\132\217\131\217\135\216\177\216\168\216\167\216\161\n\t\t\t\t\t\t\216\174\216\181\217\133 20% \216\185\217\132\217\137 \216\170\216\179\216\175\217\138\216\175 \216\167\217\132\217\133\216\174\216\167\217\132\217\129\216\167\216\170\n\t\t\t\t\t\t\216\178\217\138\216\167\216\175\216\169 \217\129\217\138 \216\167\217\132\216\177\216\167\216\170\216\168 \216\167\217\132\217\138\217\136\217\133\217\138\n\t\t\t\t\t\t\216\178\217\138\216\167\216\175\216\169 30% \217\129\217\138 \216\177\217\136\216\167\216\170\216\168 \216\167\217\132\217\136\216\184\216\167\216\166\217\129\n\t\t\t\t\t\t\216\178\217\138\216\167\216\175\216\169 30% \217\129\217\138 \216\170\216\173\216\181\217\138\217\132 \216\167\217\132\216\174\216\168\216\177\216\169\n\t\t\t\t\t\t\216\174\216\181\217\133 35% \216\185\217\132\217\137 \216\170\216\181\217\132\217\138\216\173 \216\167\217\132\217\133\216\177\217\131\216\168\216\167\216\170\n\t\t\t\t\t", tocolor(255, 255, 225, 255), "center", "top", UI.rectangle[2])
      eui:uiSetFont(eui:uiCreateLabel(0, 340, 200, 30, "22 USD", tocolor(0, 255, 0, 255), "center", "center", UI.rectangle[2]), "default-large")
      UI.label.title = eui:uiCreateLabel(0, 40, 200, 30, "Wnash Classic", tocolor(124, 173, 224, 255), "center", "center", UI.rectangle[3])
      eui:uiSetFont(UI.label.title, "default-large")
      UI.image[4] = eui:uiCreateImage((200 - 64) / 2, -30, 64, 64, ":bios-coins/images/classic.png", UI.rectangle[3])
      eui:uiCreateLabel(0, 80, 200, 250, "\t\t\t\t\t\t\216\180\216\167\216\177\216\169 \217\136\217\132\217\136\217\134 \217\133\217\133\217\138\216\178\n\t\t\t\t\t\t\216\180\216\167\216\177\216\169 \216\168\216\172\216\167\217\134\216\168 \216\167\217\132\216\167\216\179\217\133 \217\129\217\138 \216\167\217\132\216\170\216\167\216\168\n\t\t\t\t\t\t$\217\133\216\168\217\132\216\186 100,000\n\t\t\t\t\t\t\216\177\216\170\216\168\216\169 \217\129\217\138 \216\167\217\132\216\175\216\179\217\131\217\136\216\177\216\175\n\t\t\t\t\t\t\216\174\216\181\217\133 5% \217\129\217\138 \216\172\217\133\217\138\216\185 \216\167\217\132\217\133\216\185\216\167\216\177\216\182\n\t\t\t\t\t\t\216\174\216\181\217\133 10% \216\185\217\132\217\137 \217\129\217\136\216\167\216\170\217\138\216\177 \216\167\217\132\217\131\217\135\216\177\216\168\216\167\216\161\n\t\t\t\t\t\t\216\174\216\181\217\133 10% \216\185\217\132\217\137 \216\170\216\179\216\175\217\138\216\175 \216\167\217\132\217\133\216\174\216\167\217\132\217\129\216\167\216\170\n\t\t\t\t\t\t\216\178\217\138\216\167\216\175\216\169 15% \217\129\217\138 \216\177\217\136\216\167\216\170\216\168 \216\167\217\132\217\136\216\184\216\167\216\166\217\129\n\t\t\t\t\t\t\216\178\217\138\216\167\216\175\216\169 15% \217\129\217\138 \216\170\216\173\216\181\217\138\217\132 \216\167\217\132\216\174\216\168\216\177\216\169\n\t\t\t\t\t\t\216\174\216\181\217\133 20% \216\185\217\132\217\137 \216\170\216\181\217\132\217\138\216\173 \216\167\217\132\217\133\216\177\217\131\216\168\216\167\216\170\n\t\t\t\t\t", tocolor(255, 255, 225, 255), "center", "top", UI.rectangle[3])
      eui:uiSetFont(eui:uiCreateLabel(0, 340, 200, 30, "12 USD", tocolor(0, 255, 0, 255), "center", "center", UI.rectangle[3]), "default-large")
    end
  end
end)
function closeAllWindows(arg0)
  eui:uiSetVisible(UI.window[2], false)
  showCursor(false)
end
addEvent("onClientPlayerQuitFromCharacter", true)
addEventHandler("onClientPlayerQuitFromCharacter", localPlayer, closeAllWindows)
addEventHandler("onClientPlayerWasted", localPlayer, closeAllWindows)
addEventHandler("onClientUIClick", root, function()
  if source == UI.button[1] then
    if eui:uiGridListGetSelectedItem(UI.gridlist[1]) ~= -1 then
      eui:uiGridListSetSelectedItem(UI.gridlist[1], -1)
      if eui:uiGridListGetSelectedItem(UI.gridlist[1]) == 6 then
        eui:uiSetVisible(UI.window[2], true)
        eui:uiBringToFront(UI.window[2])
      else
        triggerServerEvent("features:buyFeature", localPlayer, (eui:uiGridListGetSelectedItem(UI.gridlist[1])))
      end
    end
  elseif source == UI.button[2] then
    showCursor(false)
  elseif source == UI.button.cancel_change_username then
    eui:uiSetVisible(UI.window[2], false)
  elseif source == UI.button.change_username then
    eui:uiSetVisible(UI.window[2], false)
    if utf8.len((eui:uiGetText(UI.edit.username))) > 0 then
      if utf8.match(eui:uiGetText(UI.edit.username):gsub("_", ""), "%W") then
        exports.notifications:output({
          en = "The username contains disallowed characters (" .. utf8.match(eui:uiGetText(UI.edit.username):gsub("_", ""), "%W") .. ")",
          ar = "(" .. utf8.match(eui:uiGetText(UI.edit.username):gsub("_", ""), "%W") .. ") \216\167\216\179\217\133 \216\167\217\132\217\133\216\179\216\170\216\174\216\175\217\133 \217\138\216\173\216\170\217\136\217\138 \216\185\217\132\217\137 \216\177\217\133\217\136\216\178 \216\186\217\138\216\177 \217\133\216\179\217\133\217\136\216\173 \216\168\217\135\216\167"
        }, 5000, "error")
        return
      end
      if not exports.public:isASCII((eui:uiGetText(UI.edit.username))) then
        exports.notifications:output({
          en = "English letters must be used",
          ar = "\217\138\216\172\216\168 \216\167\216\179\216\170\216\174\216\175\216\167\217\133 \216\173\216\177\217\136\217\129 \216\167\217\134\216\172\217\132\217\138\216\178\217\138\216\169"
        }, 4000, "error")
        return
      end
      triggerServerEvent("features:changeUsername", localPlayer, eui:uiGetText(UI.edit.username), var0[7].price, var0[7].text)
    end
  end
end)
addEvent("bc:sendFeaturesHistory", true)
addEventHandler("bc:sendFeaturesHistory", root, function(arg0, arg1)
  eui:uiSetText(UI.label[1], tostring(arg1))
  eui:uiGridListClear(UI.gridlist[2])
  for forvar5, forvar6 in ipairs(arg0) do
    eui:uiGridListSetItemText(UI.gridlist[2], eui:uiGridListAddRow(UI.gridlist[2]), 1, tostring(forvar6.Info))
    eui:uiGridListSetItemText(UI.gridlist[2], eui:uiGridListAddRow(UI.gridlist[2]), 2, tostring(forvar6.BC) .. " coins")
    eui:uiGridListSetItemText(UI.gridlist[2], eui:uiGridListAddRow(UI.gridlist[2]), 3, tostring(forvar6.createdAt))
  end
end)
function getValue(arg0)
  if arg0 == "traffic_tickets_discount" then
    if exports.hud:isHudItemExists("special_membership:Premium") then
    elseif exports.hud:isHudItemExists("special_membership:Plus") then
    elseif exports.hud:isHudItemExists("special_membership:Classic") then
    end
    return 10 / 100
  end
end
