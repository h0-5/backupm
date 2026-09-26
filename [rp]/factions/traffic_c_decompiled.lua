-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

UI = {
  window = {},
  label = {},
  button = {},
  gridlist = {},
  edit = {}
}
function UIKitReady()
  eui = exports.UIKit
  UI.window[1] = eui:uiCreateWindow(false, false, 600, 340, {
    en = "Your Vehicles Tickets",
    ar = "\217\133\216\174\216\167\217\132\217\129\216\167\216\170 \216\167\217\132\217\133\216\177\217\131\216\168\216\167\216\170"
  })
  eui:uiSetVisible(UI.window[1], false)
  eui:uiWindowSetMovable(UI.window[1], false)
  UI.gridlist[1] = eui:uiCreateGridList(10, 40, 580, 220, _, UI.window[1])
  eui:uiGridListAddColumn(UI.gridlist[1], "ID", 0.05)
  eui:uiGridListAddColumn(UI.gridlist[1], "Vehicle ID", 0.12)
  eui:uiGridListAddColumn(UI.gridlist[1], "Amount", 0.13)
  eui:uiGridListAddColumn(UI.gridlist[1], "Time", 0.25)
  eui:uiGridListAddColumn(UI.gridlist[1], "By", 0.15)
  eui:uiGridListAddColumn(UI.gridlist[1], "Reason", 0.25)
  UI.label["vehtickets:total"] = eui:uiCreateLabel(10, 270, 232, 20, {en = "", ar = ""}, tocolor(255, 255, 255, 255), "left", "center", UI.window[1])
  UI.button[1] = eui:uiCreateButton(10, 300, 150, 30, {
    en = "Pay Selected Ticket",
    ar = "\216\175\217\129\216\185 \216\167\217\132\217\133\216\174\216\167\217\132\217\129\216\169 \216\167\217\132\217\133\216\173\216\175\216\175\216\169"
  }, tocolor(0, 0, 0, 255), UI.window[1])
  UI.button[5] = eui:uiCreateButton(170, 300, 150, 30, {
    en = "Pay All Tickets",
    ar = "\216\175\217\129\216\185 \216\172\217\133\217\138\216\185 \216\167\217\132\217\133\216\174\216\167\217\132\217\129\216\167\216\170"
  }, tocolor(0, 0, 0, 255), UI.window[1])
  UI.button[2] = eui:uiCreateButton(490, 300, 100, 30, {en = "Cancel", ar = "\216\165\217\132\216\186\216\167\216\161"}, tocolor(0, 0, 0, 255), UI.window[1])
  UI.window[2] = eui:uiCreateWindow(false, false, 600, 340, {
    en = "Your Tickets",
    ar = "\217\133\216\174\216\167\217\132\217\129\216\167\216\170\217\131"
  })
  eui:uiSetVisible(UI.window[2], false)
  eui:uiWindowSetMovable(UI.window[2], false)
  UI.gridlist[2] = eui:uiCreateGridList(10, 40, 580, 220, _, UI.window[2])
  eui:uiGridListAddColumn(UI.gridlist[2], "ID", 0.05)
  eui:uiGridListAddColumn(UI.gridlist[2], "Offense", 0.35)
  eui:uiGridListAddColumn(UI.gridlist[2], "Fine", 0.15)
  eui:uiGridListAddColumn(UI.gridlist[2], "By", 0.2)
  eui:uiGridListAddColumn(UI.gridlist[2], "Date", 0.2)
  UI.label["offenses:total"] = eui:uiCreateLabel(10, 270, 232, 20, {en = "", ar = ""}, tocolor(255, 255, 255, 255), "left", "center", UI.window[2])
  UI.button[3] = eui:uiCreateButton(10, 300, 150, 30, {
    en = "Pay Selected Ticket",
    ar = "\216\175\217\129\216\185 \216\167\217\132\217\133\216\174\216\167\217\132\217\129\216\169 \216\167\217\132\217\133\216\173\216\175\216\175\216\169"
  }, tocolor(0, 0, 0, 255), UI.window[2])
  UI.button[6] = eui:uiCreateButton(170, 300, 150, 30, {
    en = "Pay All Tickets",
    ar = "\216\175\217\129\216\185 \216\172\217\133\217\138\216\185 \216\167\217\132\217\133\216\174\216\167\217\132\217\129\216\167\216\170"
  }, tocolor(0, 0, 0, 255), UI.window[2])
  UI.button[4] = eui:uiCreateButton(490, 300, 100, 30, {en = "Cancel", ar = "\216\165\217\132\216\186\216\167\216\161"}, tocolor(0, 0, 0, 255), UI.window[2])
  UI.window.transfer_ownership = eui:uiCreateWindow(false, false, 350, 450, {
    en = "Transfer Vehicle Ownership",
    ar = "\217\134\217\130\217\132 \217\133\217\132\217\131\217\138\216\169 \216\167\217\132\217\133\216\177\217\131\216\168\216\169"
  })
  eui:uiSetVisible(UI.window.transfer_ownership, false)
  eui:uiCreateLabel(10, 60, 330, 30, {
    en = [[
		The transfer of ownership will not take place
		without the consent of the other party
		and the payment of the specified amount

		((  Transfer fee: #00ff00$5000#ffffff  ))
	]],
    ar = "\t\t\217\132\217\134 \217\138\216\170\217\133 \217\134\217\130\217\132 \216\167\217\132\217\133\217\132\217\131\217\138\216\169 \216\168\216\175\217\136\217\134 \217\133\217\136\216\167\217\129\217\130\216\169 \216\167\217\132\216\183\216\177\217\129 \216\167\217\132\216\162\216\174\216\177\n\t\t\217\136\216\175\217\129\216\185 \216\167\217\132\217\133\216\168\217\132\216\186 \216\167\217\132\217\133\216\173\216\175\216\175\n\n\t\t((  #00ff00$5000#ffffff :\216\177\216\179\217\136\217\133 \217\134\217\130\217\132 \216\167\217\132\217\133\217\132\217\131\217\138\216\169  ))\n\t"
  }, tocolor(255, 255, 255, 255), "center", "top", UI.window.transfer_ownership)
  UI.edit["transfer_ownership:id"] = eui:uiCreateEdit(20, 170, 310, 35, "", {
    en = "Vehicle ID",
    ar = "\217\133\216\185\216\177\217\129 \216\167\217\132\217\133\216\177\217\131\216\168\216\169 (ID)"
  }, _, UI.window.transfer_ownership)
  UI.edit["transfer_ownership:new_owner"] = eui:uiCreateEdit(20, 215, 310, 35, "", {
    en = "New owner name",
    ar = "\216\167\216\179\217\133 \216\167\217\132\217\133\216\167\217\132\217\131 \216\167\217\132\216\172\216\175\217\138\216\175"
  }, _, UI.window.transfer_ownership)
  UI.label.dollar = eui:uiCreateLabel(20, 270, 20, 35, "$", tocolor(0, 255, 0, 255), "center", "center", UI.window.transfer_ownership)
  eui:uiSetFont(UI.label.dollar, "default-large")
  UI.edit["transfer_ownership:price"] = eui:uiCreateEdit(50, 270, 280, 35, "", {en = "Price", ar = "\216\167\217\132\216\179\216\185\216\177"}, _, UI.window.transfer_ownership)
  UI.button.transfer_ownership = eui:uiCreateButton(10, 350, 330, 40, {
    en = "Tranfer Now",
    ar = "\217\134\217\130\217\132 \216\167\217\132\216\162\217\134"
  }, "primary", UI.window.transfer_ownership)
  UI.button.cancel_transfer_ownership = eui:uiCreateButton(10, 400, 330, 40, {
    en = "I don't want to transfer the ownership",
    ar = "\217\132\216\167 \216\163\216\177\217\138\216\175 \217\134\217\130\217\132 \216\167\217\132\217\133\217\132\217\131\217\138\216\169"
  }, tocolor(0, 0, 0, 255), UI.window.transfer_ownership)
  eui:uiSetProperty(UI.button.cancel_transfer_ownership, "HoverTextColor", tocolor(255, 0, 0))
  UI.window.transfer_ownership_approval = eui:uiCreateRectangle(false, false, 350, 350, tocolor(8, 12, 18, 240), true, true, true, true)
  eui:uiSetVisible(UI.window.transfer_ownership_approval, false)
  UI.label.transfer_ownership_approval = eui:uiCreateLabel(15, 60, 320, 30, {en = [[
		
	]], ar = [[

	]]}, tocolor(255, 255, 255, 255), "left", "top", UI.window.transfer_ownership_approval)
  UI.button.transfer_ownership_accept = eui:uiCreateButton(10, 250, 330, 40, {
    en = "Accept and Pay",
    ar = "\216\167\217\132\217\133\217\136\216\167\217\129\217\130\216\169 \217\136\216\167\217\132\216\175\217\129\216\185"
  }, "primary", UI.window.transfer_ownership_approval)
  UI.button.transfer_ownership_reject = eui:uiCreateButton(10, 300, 330, 40, {en = "Reject", ar = "\216\177\217\129\216\182"}, tocolor(0, 0, 0, 255), UI.window.transfer_ownership_approval)
  eui:uiSetProperty(UI.button.transfer_ownership_reject, "HoverTextColor", tocolor(255, 0, 0))
end
addEventHandler("onClientUIReady", resourceRoot, UIKitReady)
addEventHandler("onClientUIKitReady", root, UIKitReady)
function closeUIWindows(arg0)
  eui:uiSetVisible(UI.window[1], false)
  eui:uiSetVisible(UI.window[2], false)
  eui:uiSetVisible(UI.window.transfer_ownership, false)
  eui:uiSetVisible(UI.window.transfer_ownership_approval, false)
  showCursor(false)
end
addEvent("onClientPlayerQuitFromCharacter", true)
addEventHandler("onClientPlayerQuitFromCharacter", localPlayer, closeUIWindows)
addEventHandler("onClientPlayerWasted", localPlayer, closeUIWindows)
addEvent("phone:app:request", true)
addEventHandler("phone:app:request", localPlayer, function(arg0, arg1, arg2, arg3, arg4, arg5)
  if arg0 == "traffic" then
    if not isElement(UI.gridlist["app:traffic_tickets"]) then
      eui:uiSetFont(eui:uiCreateLabel(arg2 + 15, arg3 + 10, 200, 20, {
        en = "Traffic Tickets",
        ar = "\217\133\216\174\216\167\217\132\217\129\216\167\216\170 \216\167\217\132\217\133\216\177\217\136\216\177"
      }, tocolor(255, 255, 255, 255), "left", "top", arg1), "default-large")
      UI.gridlist["app:traffic_tickets"] = eui:uiCreateGridList(arg2, arg3 + 50, arg4, arg5 - 140, tocolor(0, 0, 0, 0), arg1)
      eui:uiGridListAddColumn(UI.gridlist["app:traffic_tickets"], "Vehicle", 0.2)
      eui:uiGridListAddColumn(UI.gridlist["app:traffic_tickets"], "Amount", 0.3)
      eui:uiGridListAddColumn(UI.gridlist["app:traffic_tickets"], "Reason", 0.5)
      UI.button["app:traffic_tickets:pay_all"] = eui:uiCreateButton(arg2 + 5, arg3 + arg5 - 80, arg4 - 10, 35, {
        en = "Pay All",
        ar = "\216\175\217\129\216\185 \216\172\217\133\217\138\216\185 \216\167\217\132\217\133\216\174\216\167\217\132\217\129\216\167\216\170"
      }, "primary", arg1)
      UI.button["app:traffic_tickets:pay"] = eui:uiCreateButton(arg2 + 5, arg3 + arg5 - 40, arg4 - 10, 35, {en = "Pay", ar = "\216\175\217\129\216\185"}, "primary", arg1)
    end
    triggerServerEvent("traffic:getTicketsForPlayer", localPlayer)
  end
end)
addEvent("traffic:sendTicketsToPlayer", true)
addEventHandler("traffic:sendTicketsToPlayer", root, function(arg0, arg1)
  exports.public:loading("traffic_tickets.get", false)
  eui:uiGridListClear(UI.gridlist[1])
  if isElement(UI.gridlist["app:traffic_tickets"]) then
    eui:uiGridListClear(UI.gridlist["app:traffic_tickets"])
  end
  for forvar6, forvar7 in ipairs(arg0) do
    for forvar11, forvar12 in ipairs(forvar7[2]) do
      eui:uiGridListSetItemData(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 1, tostring(forvar12.id))
      eui:uiGridListSetItemText(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 1, tostring(forvar12.id))
      eui:uiGridListSetItemText(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 2, tostring(forvar12.vehicleID))
      eui:uiGridListSetItemText(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 3, "$" .. tostring(forvar12.amount))
      eui:uiGridListSetItemText(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 4, tostring(forvar12.time))
      eui:uiGridListSetItemText(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 5, tostring(forvar12.issuer))
      eui:uiGridListSetItemText(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 6, tostring(forvar12.reason))
      if forvar12.status == "Paid" then
        eui:uiGridListSetItemColor(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 1, tocolor(0, 255, 0))
        eui:uiGridListSetItemColor(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 2, tocolor(0, 255, 0))
        eui:uiGridListSetItemColor(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 3, tocolor(0, 255, 0))
        eui:uiGridListSetItemColor(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 4, tocolor(0, 255, 0))
        eui:uiGridListSetItemColor(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 5, tocolor(0, 255, 0))
        eui:uiGridListSetItemColor(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 6, tocolor(0, 255, 0))
      elseif forvar12.status == "Unpaid" then
        eui:uiGridListSetItemColor(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 1, tocolor(255, 0, 0))
        eui:uiGridListSetItemColor(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 2, tocolor(255, 0, 0))
        eui:uiGridListSetItemColor(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 3, tocolor(255, 0, 0))
        eui:uiGridListSetItemColor(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 4, tocolor(255, 0, 0))
        eui:uiGridListSetItemColor(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 5, tocolor(255, 0, 0))
        eui:uiGridListSetItemColor(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 6, tocolor(255, 0, 0))
      end
      if isElement(UI.gridlist["app:traffic_tickets"]) then
        eui:uiGridListSetItemData(UI.gridlist["app:traffic_tickets"], eui:uiGridListAddRow(UI.gridlist["app:traffic_tickets"]), 1, tostring(forvar12.id))
        eui:uiGridListSetItemText(UI.gridlist["app:traffic_tickets"], eui:uiGridListAddRow(UI.gridlist["app:traffic_tickets"]), 1, tostring(forvar12.vehicleID))
        eui:uiGridListSetItemText(UI.gridlist["app:traffic_tickets"], eui:uiGridListAddRow(UI.gridlist["app:traffic_tickets"]), 2, "$" .. tostring(forvar12.amount))
        eui:uiGridListSetItemText(UI.gridlist["app:traffic_tickets"], eui:uiGridListAddRow(UI.gridlist["app:traffic_tickets"]), 3, tostring(forvar12.reason))
        eui:uiGridListSetItemColor(UI.gridlist["app:traffic_tickets"], eui:uiGridListAddRow(UI.gridlist[1]), 2, tocolor(0, 255, 0))
      end
    end
  end
  eui:uiSetText(UI.label["vehtickets:total"], {
    en = "#ffffff\226\128\162 " .. "Total Amount \194\187 #00FF00" .. "$" .. tostring(convertNumber(arg1)),
    ar = "#ffffff\226\128\162 " .. "\216\167\217\132\217\133\216\168\217\132\216\186 \216\167\217\132\216\165\216\172\217\133\216\167\217\132\217\138 \194\187 #00FF00" .. "$" .. tostring(convertNumber(arg1))
  })
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
addEvent("police:sendOffensesForPlayer", true)
addEventHandler("police:sendOffensesForPlayer", root, function(arg0, arg1)
  eui:uiGridListClear(UI.gridlist[2])
  for forvar5, forvar6 in ipairs(arg0) do
    eui:uiGridListSetItemData(UI.gridlist[2], eui:uiGridListAddRow(UI.gridlist[2]), 1, tostring(forvar6.id))
    eui:uiGridListSetItemText(UI.gridlist[2], eui:uiGridListAddRow(UI.gridlist[2]), 1, tostring(forvar6.id))
    eui:uiGridListSetItemText(UI.gridlist[2], eui:uiGridListAddRow(UI.gridlist[2]), 2, tostring(forvar6.offense))
    eui:uiGridListSetItemText(UI.gridlist[2], eui:uiGridListAddRow(UI.gridlist[2]), 3, "$" .. tostring(forvar6.fine))
    eui:uiGridListSetItemText(UI.gridlist[2], eui:uiGridListAddRow(UI.gridlist[2]), 4, tostring(forvar6.issuer))
    eui:uiGridListSetItemText(UI.gridlist[2], eui:uiGridListAddRow(UI.gridlist[2]), 5, tostring(forvar6.issuedAt))
    eui:uiGridListSetItemColor(UI.gridlist[2], eui:uiGridListAddRow(UI.gridlist[2]), 1, tocolor(255, 0, 0))
    eui:uiGridListSetItemColor(UI.gridlist[2], eui:uiGridListAddRow(UI.gridlist[2]), 2, tocolor(255, 0, 0))
    eui:uiGridListSetItemColor(UI.gridlist[2], eui:uiGridListAddRow(UI.gridlist[2]), 3, tocolor(255, 0, 0))
    eui:uiGridListSetItemColor(UI.gridlist[2], eui:uiGridListAddRow(UI.gridlist[2]), 4, tocolor(255, 0, 0))
    eui:uiGridListSetItemColor(UI.gridlist[2], eui:uiGridListAddRow(UI.gridlist[2]), 5, tocolor(255, 0, 0))
  end
  eui:uiSetText(UI.label["offenses:total"], {
    en = "#ffffff\226\128\162 " .. "Total Amount \194\187 #00FF00" .. "$" .. tostring(convertNumber(arg1)),
    ar = "#ffffff\226\128\162 " .. "\216\167\217\132\217\133\216\168\217\132\216\186 \216\167\217\132\216\165\216\172\217\133\216\167\217\132\217\138 \194\187 #00FF00" .. "$" .. tostring(convertNumber(arg1))
  })
end)
addEventHandler("onClientUIClick", root, function()
  if source == UI.button[1] then
    if eui:uiGridListGetSelectedItem(UI.gridlist[1]) ~= -1 then
      triggerServerEvent("traffic:payTicket", localPlayer, (eui:uiGridListGetItemData(UI.gridlist[1], eui:uiGridListGetSelectedItem(UI.gridlist[1]), 1)))
    end
  elseif source == UI.button[2] then
    eui:uiSetVisible(UI.window[1], false)
    showCursor(false)
  elseif source == UI.button["app:traffic_tickets:pay"] then
    if eui:uiGridListGetSelectedItem(UI.gridlist["app:traffic_tickets"]) ~= -1 then
      triggerServerEvent("traffic:payTicket", localPlayer, (eui:uiGridListGetItemData(UI.gridlist["app:traffic_tickets"], eui:uiGridListGetSelectedItem(UI.gridlist["app:traffic_tickets"]), 1)))
    end
  elseif source == UI.button["app:traffic_tickets:pay_all"] then
    if eui:uiGridListGetRowCount(UI.gridlist["app:traffic_tickets"]) > 0 then
      triggerServerEvent("traffic:payAllTickets", localPlayer)
    end
  elseif source == UI.button[5] then
    if eui:uiGridListGetRowCount(UI.gridlist[1]) > 0 then
      triggerServerEvent("traffic:payAllTickets", localPlayer)
    end
  elseif source == UI.button[3] then
    if eui:uiGridListGetSelectedItem(UI.gridlist[2]) ~= -1 then
      triggerServerEvent("police:payOffenseFine", localPlayer, (eui:uiGridListGetItemData(UI.gridlist[2], eui:uiGridListGetSelectedItem(UI.gridlist[2]), 1)))
    end
  elseif source == UI.button[4] then
    eui:uiSetVisible(UI.window[2], false)
    showCursor(false)
  elseif source == UI.button[6] then
    if eui:uiGridListGetRowCount(UI.gridlist[2]) > 0 then
      triggerServerEvent("police:payAllOffenseFines", localPlayer)
    end
  elseif source == UI.button.cancel_transfer_ownership then
    eui:uiSetVisible(UI.window.transfer_ownership, false)
    showCursor(false)
  elseif source == UI.button.transfer_ownership then
    if eui:uiGetText(UI.edit["transfer_ownership:id"]) == "" or not tonumber((eui:uiGetText(UI.edit["transfer_ownership:id"]))) then
      exports.notifications:output({
        en = "Please enter the vehicle ID",
        ar = "\216\167\217\132\216\177\216\172\216\167\216\161 \216\167\216\175\216\174\216\167\217\132 \217\133\216\185\216\177\217\129 \216\167\217\132\217\133\216\177\217\131\216\168\216\169"
      }, 3500, "error")
      return
    end
    if eui:uiGetText(UI.edit["transfer_ownership:new_owner"]) == "" then
      exports.notifications:output({
        en = "Please enter the new owner name",
        ar = "\216\167\217\132\216\177\216\172\216\167\216\161 \216\167\216\175\216\174\216\167\217\132 \216\167\216\179\217\133 \216\167\217\132\217\133\216\167\217\132\217\131 \216\167\217\132\216\172\216\175\217\138\216\175"
      }, 3500, "error")
      return
    end
    if getElementData(localPlayer, "character:name") == eui:uiGetText(UI.edit["transfer_ownership:new_owner"]) then
      return
    end
    for forvar7, forvar8 in ipairs(getElementsByType("player")) do
      if getElementData(forvar8, "character:name") == eui:uiGetText(UI.edit["transfer_ownership:new_owner"]) then
        break
      end
    end
    if not isElement(forvar8) then
      exports.notifications:output({
        en = "The new owner must be close to you",
        ar = "\217\138\216\172\216\168 \216\163\217\134 \217\138\217\131\217\136\217\134 \216\167\217\132\217\133\216\167\217\132\217\131 \216\167\217\132\216\172\216\175\217\138\216\175 \217\130\216\177\217\138\216\168 \217\133\217\134\217\131"
      }, 3500, "error")
      return
    end
    if 5 < getDistanceBetweenPoints3D(getElementPosition(localPlayer)) then
      exports.notifications:output({
        en = "The new owner must be close to you",
        ar = "\217\138\216\172\216\168 \216\163\217\134 \217\138\217\131\217\136\217\134 \216\167\217\132\217\133\216\167\217\132\217\131 \216\167\217\132\216\172\216\175\217\138\216\175 \217\130\216\177\217\138\216\168 \217\133\217\134\217\131"
      }, 3500, "error")
      return
    end
    exports.notifications:output({
      en = "The consent of the other party is being obtained",
      ar = "\216\172\216\167\216\177\217\138 \216\167\216\174\216\176 \217\133\217\136\216\167\217\129\217\130\216\169 \216\167\217\132\216\183\216\177\217\129 \216\167\217\132\216\162\216\174\216\177"
    }, 5000, "info")
    triggerServerEvent("traffic:transfer_ownership:approval", localPlayer, forvar8, eui:uiGetText(UI.edit["transfer_ownership:id"]), (eui:uiGetText(UI.edit["transfer_ownership:price"])))
    eui:uiSetText(UI.edit["transfer_ownership:id"], "")
    eui:uiSetText(UI.edit["transfer_ownership:new_owner"], "")
    eui:uiSetText(UI.edit["transfer_ownership:price"], "")
    eui:uiSetVisible(UI.window.transfer_ownership, false)
    showCursor(false)
  elseif source == UI.button.transfer_ownership_reject then
    eui:uiSetVisible(UI.window.transfer_ownership_approval, false)
    showCursor(false)
  elseif source == UI.button.transfer_ownership_accept then
    if current_transfer_ownershio_approval then
      triggerServerEvent("traffic:transfer_ownership:approval:accept", localPlayer, unpack(current_transfer_ownershio_approval))
      current_transfer_ownershio_approval = nil
    end
    eui:uiSetVisible(UI.window.transfer_ownership_approval, false)
    showCursor(false)
  end
end)
addEvent("traffic:transfer_ownership:approval", true)
addEventHandler("traffic:transfer_ownership:approval", root, function(arg0, arg1, arg2)
  if not isElement(arg0) then
    return
  end
  if isElement((getElementByID("Vehicle:" .. tostring(arg1)))) then
    eui:uiSetText(UI.label.transfer_ownership_approval, {
      en = [[
			Request approval to transfer ownership of a vehicle to you

			Vehicle Name:  ]] .. tostring((getElementData(getElementByID("Vehicle:" .. tostring(arg1)), "vehicle:name"))) .. [[
			
			Owner: ]] .. tostring((getElementData(arg0, "character:name"))) .. [[
			

			Price:  #00ff00$]] .. tostring(arg2) .. [[
			
			#ffffff
			Do you accept?
		]],
      ar = "\t\t\t\216\183\217\132\216\168 \217\133\217\136\216\167\217\129\217\130\216\169 \216\185\217\132\217\137 \217\134\217\130\217\132 \217\133\217\132\217\131\217\138\216\169 \217\133\216\177\217\131\216\168\216\169 \217\132\217\131 \n\t\t\t\n\t\t\tVehicle Name:  " .. tostring((getElementData(getElementByID("Vehicle:" .. tostring(arg1)), "vehicle:name"))) .. [[
			
			Owner: ]] .. tostring((getElementData(arg0, "character:name"))) .. [[
			

			Price:  #00ff00$]] .. tostring(arg2) .. "\t\t\t\n\t\t\t#ffffff\n\t\t\t\217\135\217\132 \216\170\217\136\216\167\217\129\217\130 \216\185\217\132\217\137 \216\176\217\132\217\131\216\159\n\t\t"
    })
    current_transfer_ownershio_approval = {
      arg0,
      arg1,
      arg2
    }
    eui:uiSetVisible(UI.window.transfer_ownership_approval, true)
    showCursor(true)
  end
end)
addEvent("onClientElementMenuClick", true)
addEventHandler("onClientElementMenuClick", root, function(arg0, arg1, arg2)
  if not isElement(arg0) then
    return
  end
  if getElementType(arg0) == "ped" then
    if getElementData(arg0, "ped:interact") == "traffic.tickets" then
      if arg1 == "Talk" then
        eui:uiGridListClear(UI.gridlist[1])
        eui:uiSetVisible(UI.window[1], true)
        showCursor(true)
        exports.public:loading("traffic_tickets.get", true)
        triggerServerEvent("traffic:getTicketsForPlayer", localPlayer)
      end
    elseif getElementData(arg0, "ped:interact") == "offenses" then
      if arg1 == "Talk" then
        eui:uiSetVisible(UI.window[2], true)
        showCursor(true)
        triggerServerEvent("police:getOffensesForPlayer", localPlayer)
      end
    elseif getElementData(arg0, "ped:interact") == "traffic.ownership_transfer" and arg1 == "Talk" then
      eui:uiSetVisible(UI.window.transfer_ownership, true)
      showCursor(true)
    end
  end
end)
