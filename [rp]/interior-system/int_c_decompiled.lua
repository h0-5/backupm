-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

addEvent("interior:onClientMarkerHit", true)
addEventHandler("interior:onClientMarkerHit", localPlayer, function(arg0, arg1, arg2, arg3)
  if isPedInVehicle(localPlayer) then
    return
  end
  var0 = arg1
  removeEventHandler("onClientRender", root, drawInteriorName)
  addEventHandler("onClientRender", root, drawInteriorName)
  if arg3 then
    exports.notifications:showDirective("Interior ID#" .. var1(arg0) .. [[

Press #ff375f'F'#FFFFFF to ]] .. var1(arg2) .. [[

#a9a9a9OR
#FFFFFFPress #ff375f'H'#FFFFFF to show property panel]], tocolor(255, 255, 255, 255))
    exports.notifications:showKeyDescription("interior:enter", "F", arg2)
    exports.notifications:showKeyDescription("interior:panel", "H", "Show property panel")
  else
    exports.notifications:showKeyDescription("interior:enter", "F", arg2)
    exports.notifications:showDirective("Interior ID#" .. var1(arg0) .. [[

Press #ff375f'F'#FFFFFF to ]] .. var1(arg2) .. "", tocolor(255, 255, 255, 255))
  end
end)
addEvent("interior:onClientMarkerLeave", true)
addEventHandler("interior:onClientMarkerLeave", localPlayer, function()
  var0 = ""
  removeEventHandler("onClientRender", root, drawInteriorName)
  exports.notifications:hideDirective()
  exports.notifications:hideKeyDescription("interior:enter")
  exports.notifications:hideKeyDescription("interior:panel")
end)
addEvent("interior:syncOwnedIntsLocations", true)
addEventHandler("interior:syncOwnedIntsLocations", localPlayer, function(arg0)
  for forvar4, forvar5 in ipairs(arg0) do
    if not var0[var1(forvar5.id)] then
      setElementInterior(createBlip(unpack(forvar5.pos)), unpack(forvar5.pos))
      setElementDimension(createBlip(unpack(forvar5.pos)), unpack(forvar5.pos))
      setElementData(createBlip(unpack(forvar5.pos)), "blip:name", "Interior (ID: " .. var1(forvar5.id) .. ")")
      var0[var1(forvar5.id)] = createBlip(unpack(forvar5.pos))
    end
  end
end)
addEvent("interior:syncOwnedIntsLocation", true)
addEventHandler("interior:syncOwnedIntsLocation", localPlayer, function(arg0, arg1, arg2)
  if arg0 then
    if not var0[var1(arg1)] then
      setElementInterior(createBlip(unpack(arg2)), unpack(arg2))
      setElementDimension(createBlip(unpack(arg2)), unpack(arg2))
      setElementData(createBlip(unpack(arg2)), "blip:name", "Interior (ID: " .. var1(arg1) .. ")")
      var0[var1(arg1)] = createBlip(unpack(arg2))
    end
  elseif var0[var1(arg1)] then
    destroyElement(var0[var1(arg1)])
    var0[var1(arg1)] = false
  end
end)
function drawInteriorName()
  if var0 == "" then
    removeEventHandler("onClientRender", root, drawInteriorName)
    return
  end
  dxDrawText(var1(var0), 0, var2 - 60, var3, var2, tocolor(0, 0, 0, 220), 2, "arial", "center", "center", false, false, false, false, false)
  dxDrawText(var1(var0), 0, var2 - 60, var3, var2, tocolor(255, 255, 255, 220), 2, "arial", "center", "center", false, false, false, false, false)
end
UI = {
  edit = {},
  window = {},
  label = {},
  checkbox = {},
  switch = {},
  button = {},
  radiobutton = {}
}
function UIKitReady()
  eui = exports.UIKit
  UI.window[1] = eui:uiCreateWindow(false, false, 439, 187, "Purchase Property")
  eui:uiWindowSetMovable(UI.window[1], false)
  eui:uiSetVisible(UI.window[1], false)
  eui:uiCreateLabel(10, 40, 420, 15, "Please confirm the following information about this property.", tocolor(255, 255, 255, 240), UI.window[1])
  UI.label[1] = eui:uiCreateLabel(10, 70, 420, 15, "Interior Name: ", "primary", UI.window[1])
  UI.label[2] = eui:uiCreateLabel(10, 90, 420, 15, "Address: ", "primary", UI.window[1])
  UI.label[3] = eui:uiCreateLabel(10, 125, 420, 15, "Pricing: ", tocolor(255, 255, 255, 230), UI.window[1])
  eui:uiSetAlign(UI.label[3], "center", "center")
  UI.button[1] = eui:uiCreateButton(5, 152, 120, 30, {en = "Purchase", ar = "\216\180\216\177\216\167\216\161"}, _, UI.window[1])
  UI.button[2] = eui:uiCreateButton(314, 152, 120, 30, {en = "Cancel", ar = "\216\165\217\132\216\186\216\167\216\161"}, _, UI.window[1])
  UI.button[3] = eui:uiCreateButton(130, 152, 130, 30, {
    en = "Preview Interior",
    ar = "\217\133\216\185\216\167\217\138\217\134\216\169 \217\133\217\134 \216\167\217\132\216\175\216\167\216\174\217\132"
  }, _, UI.window[1])
  UI.window[2] = eui:uiCreateWindow(false, false, 439, 237, "Property Panel")
  eui:uiWindowSetMovable(UI.window[2], false)
  eui:uiSetVisible(UI.window[2], false)
  UI.label[4] = eui:uiCreateLabel(10, 40, 420, 130, "", "primary", UI.window[2])
  UI.button[4] = eui:uiCreateButton(314, 202, 120, 30, {en = "Cancel", ar = "\216\165\217\132\216\186\216\167\216\161"}, _, UI.window[2])
  UI.button[5] = eui:uiCreateButton(5, 202, 120, 30, {
    en = "Sell property",
    ar = "\216\168\217\138\216\185"
  }, _, UI.window[2])
  UI.window.CheckInt = eui:uiCreateWindow(false, false, 400, 350, "Check Interior")
  eui:uiSetVisible(UI.window.CheckInt, false)
  UI.label.Logs = eui:uiCreateLabel(10, 50, 380, 150, "", tocolor(255, 255, 255, 255), "left", "top", UI.window.CheckInt)
  UI.button.CloseCheckInt = eui:uiCreateButton(0, 320, 400, 30, "Close", _, UI.window.CheckInt)
end
addEventHandler("onClientUIReady", resourceRoot, UIKitReady)
addEventHandler("onClientUIKitReady", root, UIKitReady)
function closeUIWindows()
  eui:uiSetVisible(UI.window[1], false)
  eui:uiSetVisible(UI.window[2], false)
  eui:uiSetVisible(UI.window.CheckInt, false)
  showCursor(false)
end
addEventHandler("onClientPlayerWasted", localPlayer, closeUIWindows)
addEvent("onClientPlayerQuitFromCharacter", true)
addEventHandler("onClientPlayerQuitFromCharacter", localPlayer, function()
  for forvar3, forvar4 in pairs(var0) do
    destroyElement(forvar4)
  end
  var0 = {}
end)
addEvent("interiors:checkint", true)
addEventHandler("interiors:checkint", localPlayer, function(arg0, arg1)
  eui:uiSetVisible(UI.window.CheckInt, true)
  showCursor(true)
  for forvar6, forvar7 in ipairs({
    "Last Enter",
    "Last Exit",
    "Last Lock",
    "Last Unlock"
  }) do
    if arg1[forvar7] then
    else
    end
  end
  eui:uiSetText(UI.label.Logs, ("" .. "${color.primary}\226\128\162 " .. var0(forvar7) .. "  \194\187\n    #FFFFFF" .. var0(arg1[forvar7].value) .. "  (" .. var0(arg1[forvar7].time) .. ")\n") .. "${color.primary}\226\128\162 " .. var0(forvar7) .. "  \194\187\n    #FFFFFF-\n")
  eui:uiSetText(UI.window.CheckInt, "Check Interior ID #" .. var0(arg0))
end)
addEventHandler("onClientUIClick", root, function(arg0)
  if source == UI.button.CloseCheckInt then
    eui:uiSetVisible(UI.window.CheckInt, false)
    showCursor(false)
  end
end)
addEvent("interior:openPanel", true)
addEventHandler("interior:openPanel", root, function(arg0, arg1, arg2, arg3, arg4)
  eui:uiSetVisible(UI.window[2], true)
  showCursor(true)
  if getElementData(arg0, "interior:status") == "rented" then
    if arg3.OriginalOwner then
      arg2 = arg3.OriginalOwner:gsub("faction:", "")
    else
      arg2 = "-"
    end
  end
  eui:uiSetText(UI.label[4], "${color.primary}\226\128\162 Interior ID  \194\187  #FFFFFF" .. var0(getElementData(arg0, "interior:id")) .. "\n" .. "${color.primary}\226\128\162 Interior Name  \194\187  #FFFFFF" .. var0(getElementData(arg0, "interior:name")) .. "\n" .. "${color.primary}\226\128\162 Address  \194\187  #FFFFFF" .. var0((math.floor(math.sqrt((getElementPosition(localPlayer) or 0) ^ 2 + (getElementPosition(localPlayer) or 0) ^ 2)))) .. " " .. var0(getZoneName(getElementPosition(localPlayer))) .. ", " .. var0(getZoneName(getElementPosition(localPlayer))) .. "\n" .. "${color.primary}\226\128\162 Original Price  \194\187  #00FF00$" .. var0(convertNumber((getElementData(arg0, "interior:price")))) .. "\n" .. "${color.primary}\226\128\162 Purchase Price  \194\187  #00FF00$" .. var0(convertNumber(arg3.PurchasePrice or 0)) .. "\n" .. "${color.primary}\226\128\162 The date of purchase  \194\187  #FFFFFF" .. var0(arg3.PurchaseDate) .. "\n" .. "${color.primary}\226\128\162 Owner  \194\187  #FFFFFF" .. var0(arg2) .. ("\n" .. "${color.primary}\226\128\162 Renter  \194\187  #FFFFFF" .. var0(arg2)) .. "\n" .. "You can sell this property for #00FF00$" .. var0(convertNumber(math.ceil((arg3.PurchasePrice or 0) * arg4))) .. "")
  currentIntID = getElementID(arg0):gsub("sys:int:", "")
  currentIntMarker = arg1
end)
addEvent("interior:openPurchaseWindow", true)
addEventHandler("interior:openPurchaseWindow", root, function(arg0, arg1)
  eui:uiSetVisible(UI.window[1], true)
  showCursor(true)
  eui:uiSetText(UI.window[1], "Purchase Property")
  eui:uiSetText(UI.button[1], {en = "Purchase", ar = "\216\180\216\177\216\167\216\161"})
  eui:uiSetText(UI.label[1], "\226\128\162 Interior Name  \194\187  #FFFFFF" .. var0(getElementData(arg0, "interior:name")))
  eui:uiSetText(UI.label[2], "\226\128\162 Address  \194\187  #FFFFFF" .. var0((math.floor(math.sqrt((getElementPosition(localPlayer) or 0) ^ 2 + (getElementPosition(localPlayer) or 0) ^ 2)))) .. " " .. var0(getZoneName(getElementPosition(localPlayer))) .. ", " .. var0(getZoneName(getElementPosition(localPlayer))))
  eui:uiSetText(UI.label[3], "Pricing: #00FF00$" .. var0(convertNumber((getElementData(arg0, "interior:price")))) .. " #FFFFFFwith tax ($" .. math.floor(tonumber((getElementData(arg0, "interior:price"))) * 0.0025) .. ")")
  currentIntIDToPurchase = getElementID(arg0):gsub("sys:int:", "")
  currentIntMarkerToPurchase = arg1
end)
addEvent("interior:openRentWindow", true)
addEventHandler("interior:openRentWindow", root, function(arg0, arg1)
  eui:uiSetVisible(UI.window[1], true)
  showCursor(true)
  eui:uiSetText(UI.window[1], "Rent Property")
  eui:uiSetText(UI.button[1], {
    en = "Rent",
    ar = "\216\167\216\179\216\170\216\166\216\172\216\167\216\177"
  })
  eui:uiSetText(UI.label[1], "\226\128\162 Interior Name  \194\187  #FFFFFF" .. var0(getElementData(arg0, "interior:name")))
  eui:uiSetText(UI.label[2], "\226\128\162 Address  \194\187  #FFFFFF" .. var0((math.floor(math.sqrt((getElementPosition(localPlayer) or 0) ^ 2 + (getElementPosition(localPlayer) or 0) ^ 2)))) .. " " .. var0(getZoneName(getElementPosition(localPlayer))) .. ", " .. var0(getZoneName(getElementPosition(localPlayer))))
  eui:uiSetText(UI.label[3], "Pricing: #00FF00$" .. var0(convertNumber((getElementData(arg0, "interior:price")))) .. " #FFFFFFwith tax ($" .. math.floor(tonumber((getElementData(arg0, "interior:price"))) * 0.0025) .. ")")
  currentIntIDToPurchase = getElementID(arg0):gsub("sys:int:", "")
  currentIntMarkerToPurchase = arg1
end)
addEventHandler("onClientUIClick", root, function()
  if source == UI.button[1] then
    if eui:uiGetText(source) == "Purchase" then
      triggerServerEvent("interior:buyInterior", localPlayer, currentIntIDToPurchase)
    else
      triggerServerEvent("interior:rentInterior", localPlayer, currentIntIDToPurchase)
    end
    eui:uiSetVisible(UI.window[1], false)
    showCursor(false)
  elseif source == UI.button[3] then
    triggerServerEvent("interior:previewInterior", localPlayer, currentIntIDToPurchase, currentIntMarkerToPurchase)
    eui:uiSetVisible(UI.window[1], false)
    showCursor(false)
  elseif source == UI.button[2] then
    eui:uiSetVisible(UI.window[1], false)
    showCursor(false)
  elseif source == UI.button[4] then
    eui:uiSetVisible(UI.window[2], false)
    showCursor(false)
  elseif source == UI.button[5] then
    triggerServerEvent("interior:sellInterior", localPlayer, currentIntID)
    eui:uiSetVisible(UI.window[2], false)
    showCursor(false)
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
function UIKitReady()
  eui = exports.UIKit
  var0 = eui:getUIFont("default-large")
end
addEventHandler("onClientUIReady", resourceRoot, UIKitReady)
addEventHandler("onClientUIKitReady", root, UIKitReady)
function drawIntDesc()
  if isPlayerMapVisible() then
    return
  end
  for forvar9 = 1, #getElementsWithinRange(getCameraMatrix()) do
    if getElementData(getElementsWithinRange(getCameraMatrix())[forvar9], "interior:id") and isElement(getElementsWithinRange(getCameraMatrix())[forvar9]) and isLineOfSightClear(getCameraMatrix()) and getScreenFromWorldPosition(getElementPosition(getElementsWithinRange(getCameraMatrix())[forvar9])) and getScreenFromWorldPosition(getElementPosition(getElementsWithinRange(getCameraMatrix())[forvar9])) then
      if (getElementData(getElementsWithinRange(getCameraMatrix())[forvar9], "interior:type") == 0 or getElementData(getElementsWithinRange(getCameraMatrix())[forvar9], "interior:type") == 1) and getElementData(getElementsWithinRange(getCameraMatrix())[forvar9], "interior:status"):lower() == "for sale" then
      elseif getElementData(getElementsWithinRange(getCameraMatrix())[forvar9], "interior:type") == 3 and getElementData(getElementsWithinRange(getCameraMatrix())[forvar9], "interior:status") ~= "rented" then
      elseif exports.hud:getHudSetting("admintag") then
      else
      end
      dxDrawText((var0(getElementData(getElementsWithinRange(getCameraMatrix())[forvar9], "interior:name")) .. [[

(( ID: ]] .. var0((getElementData(getElementsWithinRange(getCameraMatrix())[forvar9], "interior:id"))) .. " ))"):gsub("#%x%x%x%x%x%x", ""), getScreenFromWorldPosition(getElementPosition(getElementsWithinRange(getCameraMatrix())[forvar9])) + 2, getScreenFromWorldPosition(getElementPosition(getElementsWithinRange(getCameraMatrix())[forvar9])) + 2, getScreenFromWorldPosition(getElementPosition(getElementsWithinRange(getCameraMatrix())[forvar9])))
      dxDrawText(var0(getElementData(getElementsWithinRange(getCameraMatrix())[forvar9], "interior:name")) .. [[

(( ID: ]] .. var0((getElementData(getElementsWithinRange(getCameraMatrix())[forvar9], "interior:id"))) .. " ))", getScreenFromWorldPosition(getElementPosition(getElementsWithinRange(getCameraMatrix())[forvar9])))
    end
  end
end
addEventHandler("onClientResourceStart", resourceRoot, function()
  for forvar3 = 2, 4 do
    setInteriorFurnitureEnabled(forvar3, false)
  end
  if getElementData(localPlayer, "describtion:show") then
    addEventHandler("onClientRender", root, drawIntDesc)
  end
end)
addEventHandler("onClientElementDataChange", localPlayer, function(arg0, arg1)
  if arg0 == "describtion:show" then
    if getElementData(localPlayer, "describtion:show") then
      removeEventHandler("onClientRender", root, drawIntDesc)
      addEventHandler("onClientRender", root, drawIntDesc)
    else
      removeEventHandler("onClientRender", root, drawIntDesc)
    end
  end
end)
addEventHandler("onClientElementInteriorChange", localPlayer, function(arg0, arg1)
  triggerEvent("onClientPlayerInteriorChange", localPlayer, arg1, (getElementDimension(localPlayer)))
  triggerServerEvent("onPlayerInteriorChange", localPlayer, arg1, (getElementDimension(localPlayer)))
end)
addEventHandler("onClientElementDimensionChange", localPlayer, function(arg0, arg1)
  triggerEvent("onClientPlayerInteriorChange", localPlayer, getElementInterior(localPlayer), arg1)
  triggerServerEvent("onPlayerInteriorChange", localPlayer, getElementInterior(localPlayer), arg1)
end)
addEvent("interior:playSound", true)
addEventHandler("interior:playSound", root, function(arg0, arg1, arg2, arg3, arg4, arg5)
  setElementInterior(playSound3D(arg0, arg1, arg2, arg3, false), arg4)
  setElementDimension(playSound3D(arg0, arg1, arg2, arg3, false), arg5)
end)
