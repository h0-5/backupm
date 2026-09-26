-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

addEvent("EWA:electricityControl", true)
addEventHandler("EWA:electricityControl", root, function(arg0, arg1)
  if arg1 then
    removeEventHandler("onClientRender", root, drawDark)
    addEventHandler("onClientRender", root, drawDark)
  else
    removeEventHandler("onClientRender", root, drawDark)
  end
end)
function drawDark()
  dxDrawRectangle(0, 0, var0, var1, tocolor(0, 0, 0, getAlpha()), false)
end
function getAlpha()
  if getTime() <= 12 then
    return math.min((23 - getTime()) / 23 * 220, 220)
  elseif getTime() > 12 then
    return math.min((23 - (23 - getTime())) / 23 * 220, 220)
  end
end
addEvent("onClientPlayerInteriorChange", true)
addEventHandler("onClientPlayerInteriorChange", localPlayer, function(arg0, arg1)
  if arg0 == 0 and arg1 == 0 then
    triggerEvent("EWA:electricityControl", localPlayer, false, false)
  end
end)
function UIKitReady()
  eui = exports.UIKit
  var0.window[1] = eui:uiCreateWindow(false, false, 250, 130, "Electricity Setting")
  eui:uiSetVisible(var0.window[1], false)
  var0.rect.InteriorID = eui:uiCreateRectangle(10, 40, 230, 30, tocolor(40, 40, 40, 240), true, true, true, true, var0.window[1])
  var0.edit.InteriorID = eui:uiCreateEdit(5, 4, 220, 25, "", "Interior ID", _, var0.rect.InteriorID)
  eui:uiSetProperty(var0.edit.InteriorID, "UnderLineVisible", "False")
  var0.label[1] = eui:uiCreateLabel(5, 75, 240, 15, "...", tocolor(255, 255, 255, 240), "left", "top", var0.window[1])
  eui:uiSetAlign(var0.label[1], "center", "center")
  var0.button[1] = eui:uiCreateButton(5, 95, 119, 30, "Setup", "primary", var0.window[1])
  var0.button[2] = eui:uiCreateButton(126, 95, 119, 30, "Close", "primary", var0.window[1])
  var0.window.bills = eui:uiCreateWindow(false, false, 500, 310, {
    en = "Electricity Bills",
    ar = "\217\129\217\136\216\167\216\170\217\138\216\177 \216\167\217\132\217\131\217\135\216\177\216\168\216\167\216\161"
  })
  eui:uiSetVisible(var0.window.bills, false)
  var0.gridlist.bills = eui:uiCreateGridList(10, 40, 480, 220, _, var0.window.bills)
  eui:uiGridListAddColumn(var0.gridlist.bills, "ID", 0.2)
  eui:uiGridListAddColumn(var0.gridlist.bills, "Interior Name", 0.5)
  eui:uiGridListAddColumn(var0.gridlist.bills, "Cost", 0.3)
  var0.button["bills:pay"] = eui:uiCreateButton(10, 270, 150, 30, {
    en = "Pay Bill",
    ar = "\216\175\217\129\216\185 \216\167\217\132\217\129\216\167\216\170\217\136\216\177\216\169"
  }, tocolor(0, 0, 0, 255), var0.window.bills)
  var0.button["bills:cancel"] = eui:uiCreateButton(170, 270, 100, 30, {en = "Cancel", ar = "\216\165\217\132\216\186\216\167\216\161"}, tocolor(0, 0, 0, 255), var0.window.bills)
end
addEventHandler("onClientUIReady", resourceRoot, UIKitReady)
addEventHandler("onClientUIKitReady", root, UIKitReady)
addEvent("phone:app:request", true)
addEventHandler("phone:app:request", localPlayer, function(arg0, arg1, arg2, arg3, arg4, arg5)
  if arg0 == "electricity" then
    if not isElement(var0.gridlist["app:bills"]) then
      eui:uiSetFont(eui:uiCreateLabel(arg2 + 15, arg3 + 10, 200, 20, {
        en = "Electricity Bills",
        ar = "\217\129\217\136\216\167\216\170\217\138\216\177 \216\167\217\132\217\131\217\135\216\177\216\168\216\167\216\161"
      }, tocolor(255, 255, 255, 255), "left", "top", arg1), "default-large")
      var0.gridlist["app:bills"] = eui:uiCreateGridList(arg2, arg3 + 50, arg4, arg5 - 100, tocolor(0, 0, 0, 0), arg1)
      eui:uiGridListAddColumn(var0.gridlist["app:bills"], "ID", 0.2)
      eui:uiGridListAddColumn(var0.gridlist["app:bills"], "Interior Name", 0.5)
      eui:uiGridListAddColumn(var0.gridlist["app:bills"], "Cost", 0.3)
      var0.button["app:bills:pay"] = eui:uiCreateButton(arg2 + 5, arg3 + arg5 - 40, arg4 - 10, 35, {
        en = "Pay Bill",
        ar = "\216\175\217\129\216\185 \216\167\217\132\217\129\216\167\216\170\217\136\216\177\216\169"
      }, "primary", arg1)
    end
    triggerServerEvent("electric:getBills", localPlayer)
  end
end)
addEventHandler("onClientUIClick", root, function()
  if source == var0.button[1] then
    if tonumber((eui:uiGetText(var0.edit.InteriorID))) then
      if isElement((getElementByID("sys:int:" .. eui:uiGetText(var0.edit.InteriorID)))) then
        if isElement(var1) then
          triggerLatentServerEvent("electric:update_switch", localPlayer, var1, (eui:uiGetText(var0.edit.InteriorID)))
          eui:uiSetVisible(var0.window[1], false)
          var1 = false
          outputChatBox("Electricity is prepared.", 0, 255, 0)
        else
          eui:uiSetText(var0.label[1], "#FF0000Error")
        end
      else
        eui:uiSetText(var0.label[1], "#FF0000Interior not found")
      end
    else
      eui:uiSetText(var0.label[1], "#FF0000Enter interior ID")
    end
  elseif source == var0.button[2] then
    eui:uiSetVisible(var0.window[1], false)
  elseif source == var0.button["bills:pay"] or source == var0.button["app:bills:pay"] then
    if eui:uiGridListGetSelectedItem(source == var0.button["bills:pay"] and var0.gridlist.bills or var0.gridlist["app:bills"]) ~= -1 then
      triggerServerEvent("electric:pay", localPlayer, (eui:uiGridListGetItemText(source == var0.button["bills:pay"] and var0.gridlist.bills or var0.gridlist["app:bills"], eui:uiGridListGetSelectedItem(source == var0.button["bills:pay"] and var0.gridlist.bills or var0.gridlist["app:bills"]), 1)))
    end
  elseif source == var0.button["bills:cancel"] then
    eui:uiSetVisible(var0.window.bills, false)
    showCursor(false)
  end
end)
function closeFDWindow(arg0)
  eui:uiSetVisible(var0.window[1], false)
  eui:uiSetVisible(var0.window.bills, false)
  showCursor(false)
end
addEvent("onClientPlayerQuitFromCharacter", true)
addEventHandler("onClientPlayerQuitFromCharacter", localPlayer, closeFDWindow)
addEventHandler("onClientPlayerWasted", localPlayer, closeFDWindow)
addEvent("electric:sendBillsToPlayer", true)
addEventHandler("electric:sendBillsToPlayer", root, function(arg0)
  eui:uiGridListClear(var0.gridlist.bills)
  if isElement(var0.gridlist["app:bills"]) then
    eui:uiGridListClear(var0.gridlist["app:bills"])
  end
  for forvar5, forvar6 in ipairs(arg0) do
    eui:uiGridListSetItemText(var0.gridlist.bills, eui:uiGridListAddRow(var0.gridlist.bills), 1, tostring(forvar6[2]))
    eui:uiGridListSetItemText(var0.gridlist.bills, eui:uiGridListAddRow(var0.gridlist.bills), 2, tostring(forvar6[1]))
    if isElement(var0.gridlist["app:bills"]) then
      eui:uiGridListSetItemText(var0.gridlist["app:bills"], eui:uiGridListAddRow(var0.gridlist["app:bills"]), 1, tostring(forvar6[2]))
      eui:uiGridListSetItemText(var0.gridlist["app:bills"], eui:uiGridListAddRow(var0.gridlist["app:bills"]), 2, tostring(forvar6[1]))
    end
    if forvar6[4] and forvar6[4] > 0 then
      eui:uiGridListSetItemText(var0.gridlist.bills, eui:uiGridListAddRow(var0.gridlist.bills), 3, "$" .. tostring(forvar6[3]) .. " (-" .. tostring(forvar6[4]) .. "%)")
      if isElement(var0.gridlist["app:bills"]) and row2 then
        eui:uiGridListSetItemText(var0.gridlist["app:bills"], row2, 3, "$" .. tostring(forvar6[3]) .. " (-" .. tostring(forvar6[4]) .. "%)")
      end
    else
      eui:uiGridListSetItemText(var0.gridlist.bills, eui:uiGridListAddRow(var0.gridlist.bills), 3, "$" .. tostring(forvar6[3]))
      if isElement(var0.gridlist["app:bills"]) and row2 then
        eui:uiGridListSetItemText(var0.gridlist["app:bills"], row2, 3, "$" .. tostring(forvar6[3]))
      end
    end
  end
end)
addEvent("onClientElementMenuClick", true)
addEventHandler("onClientElementMenuClick", root, function(arg0, arg1, arg2)
  if not isElement(arg0) then
    return
  end
  if getElementType(arg0) == "ped" and arg1 == "Talk" and getElementData(arg0, "ped:interact") == "electric" then
    eui:uiSetVisible(var0.window.bills, true)
    showCursor(true)
    triggerServerEvent("electric:getBills", localPlayer)
  end
end)
addEvent("electric:openElectricitySetting", true)
addEventHandler("electric:openElectricitySetting", localPlayer, function(arg0, arg1)
  var0 = arg0
  eui:uiSetText(var1.edit.InteriorID, tostring(arg1))
  eui:uiSetText(var1.label[1], "")
  eui:uiSetVisible(var1.window[1], true)
end)
