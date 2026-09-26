-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

UI = {
  window = {},
  label = {},
  button = {},
  gridlist = {}
}
function UIKitReady()
  eui = exports.UIKit
  UI.window[1] = eui:uiCreateWindow(false, false, 500, 420, {
    en = "Air Travel",
    ar = "\216\167\217\132\216\179\217\129\216\177 \216\185\216\168\216\177 \216\167\217\132\216\183\216\167\216\166\216\177\216\169"
  }, _, ":assets/icons/plane.png")
  eui:uiSetVisible(UI.window[1], false)
  eui:uiWindowSetMovable(UI.window[1], false)
  eui:uiSetProperty(eui:uiCreateLabel(0, 40, 490, 50, {
    en = [[
Please select the ticket you wish to use for travel
Then go directly to the gate of the plane and wait for the next flight time

If you do not have travel tickets, you can book through the mobile application
	]],
    ar = "\216\167\217\132\216\177\216\172\216\167\216\161 \216\167\216\174\216\170\217\138\216\167\216\177 \216\167\217\132\216\170\216\176\217\131\216\177\216\169 \216\167\217\132\216\170\217\138 \216\170\216\177\216\186\216\168 \216\168\216\167\216\179\216\170\216\174\216\175\216\167\217\133\217\135\216\167 \217\132\217\132\216\179\217\129\216\177\n\216\171\217\133 \216\167\217\132\216\170\217\136\216\172\217\135 \217\133\216\168\216\167\216\180\216\177\216\169 \216\165\217\132\217\137 \216\168\217\136\216\167\216\168\216\169 \216\167\217\132\216\183\216\167\216\166\216\177\216\169 \217\136\216\167\217\134\216\170\216\184\216\167\216\177 \217\136\217\130\216\170 \216\167\217\132\216\177\216\173\217\132\216\169 \216\167\217\132\217\130\216\167\216\175\217\133\216\169\n\n\216\165\216\176\216\167 \217\131\217\134\216\170 \217\132\216\167\216\170\217\133\217\132\217\131 \216\170\216\176\216\167\217\131\216\177 \216\179\217\129\216\177 \217\138\217\133\217\131\217\134\217\131 \216\167\217\132\216\173\216\172\216\178 \216\185\217\134 \216\183\216\177\217\138\217\130 \216\170\216\183\216\168\217\138\217\130 \216\167\217\132\216\172\217\136\216\167\217\132\n\t"
  }, tocolor(255, 255, 255, 230), "center", "top", UI.window[1]), "color_coded", false)
  eui:uiSetProperty(eui:uiCreateLabel(0, 40, 490, 50, {
    en = [[
Please select the ticket you wish to use for travel
Then go directly to the gate of the plane and wait for the next flight time

If you do not have travel tickets, you can book through the mobile application
	]],
    ar = "\216\167\217\132\216\177\216\172\216\167\216\161 \216\167\216\174\216\170\217\138\216\167\216\177 \216\167\217\132\216\170\216\176\217\131\216\177\216\169 \216\167\217\132\216\170\217\138 \216\170\216\177\216\186\216\168 \216\168\216\167\216\179\216\170\216\174\216\175\216\167\217\133\217\135\216\167 \217\132\217\132\216\179\217\129\216\177\n\216\171\217\133 \216\167\217\132\216\170\217\136\216\172\217\135 \217\133\216\168\216\167\216\180\216\177\216\169 \216\165\217\132\217\137 \216\168\217\136\216\167\216\168\216\169 \216\167\217\132\216\183\216\167\216\166\216\177\216\169 \217\136\216\167\217\134\216\170\216\184\216\167\216\177 \217\136\217\130\216\170 \216\167\217\132\216\177\216\173\217\132\216\169 \216\167\217\132\217\130\216\167\216\175\217\133\216\169\n\n\216\165\216\176\216\167 \217\131\217\134\216\170 \217\132\216\167\216\170\217\133\217\132\217\131 \216\170\216\176\216\167\217\131\216\177 \216\179\217\129\216\177 \217\138\217\133\217\131\217\134\217\131 \216\167\217\132\216\173\216\172\216\178 \216\185\217\134 \216\183\216\177\217\138\217\130 \216\170\216\183\216\168\217\138\217\130 \216\167\217\132\216\172\217\136\216\167\217\132\n\t"
  }, tocolor(255, 255, 255, 230), "center", "top", UI.window[1]), "word_break", true)
  UI.gridlist[1] = eui:uiCreateGridList(5, 150, 490, 170, tocolor(0, 0, 0, 0), UI.window[1])
  eui:uiGridListAddColumn(UI.gridlist[1], "#", 0.4)
  eui:uiGridListAddColumn(UI.gridlist[1], "From", 0.3)
  eui:uiGridListAddColumn(UI.gridlist[1], "To", 0.3)
  eui:uiSetProperty(UI.gridlist[1], "row_height", 30)
  UI.button[1] = eui:uiCreateButton(5, 340, 490, 35, {
    en = "Travel now",
    ar = "\216\167\217\132\216\179\217\129\216\177 \216\167\217\132\216\162\217\134"
  }, "primary", UI.window[1])
  UI.button[2] = eui:uiCreateButton(5, 380, 490, 35, {
    en = "I don't want to travel",
    ar = "\217\132\216\167 \216\163\216\177\217\138\216\175 \216\167\217\132\216\179\217\129\216\177"
  }, _, UI.window[1])
end
addEventHandler("onClientUIReady", resourceRoot, UIKitReady)
addEvent("onClientUIKitReady", true)
addEventHandler("onClientUIKitReady", root, UIKitReady)
function closeUIWindows(arg0)
  eui:uiSetVisible(UI.window[1], false)
  showCursor(false)
end
addEventHandler("onClientPlayerQuitFromCharacter", localPlayer, closeUIWindows)
addEventHandler("onClientPlayerWasted", localPlayer, closeUIWindows)
addEventHandler("onClientUIClick", root, function()
  if source == UI.button[1] then
    if eui:uiGridListGetSelectedItem(UI.gridlist[1]) ~= -1 then
      eui:uiSetVisible(UI.window[1], false)
      showCursor(false)
      triggerServerEvent("airport:select_ticket", localPlayer, eui:uiGridListGetItemData(UI.gridlist[1], eui:uiGridListGetSelectedItem(UI.gridlist[1]), 1).code)
    end
  elseif source == UI.button[2] then
    eui:uiSetVisible(UI.window[1], false)
    showCursor(false)
  end
end)
addEvent("onClientElementMenuClick", true)
addEventHandler("onClientElementMenuClick", root, function(arg0, arg1, arg2)
  if not isElement(arg0) then
    return
  end
  if getElementType(arg0) == "ped" and getElementData(arg0, "ped:interact") == "airport.travel" and arg1 == "Talk" then
    eui:uiGridListClear(UI.gridlist[1])
    eui:uiSetVisible(UI.window[1], true)
    showCursor(true)
    exports.public:loading("airport.get_travel_tickets", true)
    triggerServerEvent("airport:get_travel_tickets", localPlayer)
  end
end)
addEvent("airport:get_travel_tickets:callback", true)
addEventHandler("airport:get_travel_tickets:callback", localPlayer, function(arg0)
  exports.public:loading("airport.get_travel_tickets", false)
  eui:uiGridListClear(UI.gridlist[1])
  for forvar4, forvar5 in pairs(arg0) do
    eui:uiGridListSetItemData(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 1, forvar5)
    eui:uiGridListSetItemText(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 1, forvar5.code)
    eui:uiGridListSetItemText(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 2, forvar5.from)
    eui:uiGridListSetItemText(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 3, forvar5.to)
  end
end)
