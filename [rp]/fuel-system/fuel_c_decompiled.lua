-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

addEventHandler("onClientResourceStart", resourceRoot, function()
  for forvar5, forvar6 in ipairs((xmlNodeGetChildren((xmlLoadFile("car_data.xml"))))) do
    var0[tonumber(xmlNodeGetAttribute(forvar6, "id"))] = tonumber(xmlNodeGetAttribute(forvar6, "fuel"))
  end
  xmlUnloadFile((xmlLoadFile("car_data.xml")))
  fileDelete("car_data.xml")
end)
function getVehicleOrginalFuel(arg0)
  if getVehicleType(arg0) == "Automobile" or getVehicleType(arg0) == "Bike" or getVehicleType(arg0) == "Boat" or getVehicleType(arg0) == "Monster Truck" or getVehicleType(arg0) == "Quad" then
    if not var0[arg0] then
      arg0 = 0
    end
    if var0[arg0] then
      fuel = var0[arg0]
    else
      fuel = var0[0]
    end
    return fuel
  end
end
function getVehiclePercentageFuel(arg0)
  if getElementType(arg0) == "vehicle" and (getVehicleType(arg0) == "Automobile" or getVehicleType(arg0) == "Bike" or getVehicleType(arg0) == "Boat" or getVehicleType(arg0) == "Monster Truck" or getVehicleType(arg0) == "Quad") then
    if getElementData(arg0, "fuel") or 0 then
      return (getElementData(arg0, "fuel") or 0) / var0[getElementModel(arg0)] * 100
    end
  end
end
addEvent("onClientElementMenuShow", true)
addEventHandler("onClientElementMenuShow", localPlayer, function(arg0, arg1, arg2)
  if arg1 <= 5 and arg2 == "object" and isElement(arg0) then
    if not isPedInVehicle(localPlayer) then
      return
    end
    if getElementModel(arg0) == 3465 and getVehicleHandling((getPedOccupiedVehicle(localPlayer))).engineType == "electric" then
      exports.interaction:addInteractOption(arg0, {
        text = "Charge Car",
        data = {
          label = "#ff5c5cCharge Car"
        }
      })
    end
  end
end)
function UIKitReady()
  eui = exports.UIKit
  var0.fuel_container = eui:uiCreateWindow(false, eui:uiGetReferenceScreenSize() - 200 - 100, 400, 200, "Tesla Supercharger")
  eui:uiSetVisible(var0.fuel_container, false)
  eui:uiWindowSetMovable(var0.fuel_container, false)
  eui:uiSetProperty(var0.fuel_container, "topline_color", tocolor(255, 0, 0, 255))
  eui:uiSetProperty(var0.fuel_container, "close_button", true)
  var0.progress_text = eui:uiCreateLabel(0, 50, 400, 20, "0 %", tocolor(255, 255, 255), "center", "center", var0.fuel_container)
  var0.progressbar = eui:uiCreateProgressBar(25, 90, 350, 5, tocolor(255, 0, 0), var0.fuel_container)
  eui:uiSetProperty(var0.progressbar, "background_color", tocolor(0, 0, 0, 255))
  eui:uiSetProperty(var0.progressbar, "progress_animation", true)
  eui:uiSetProperty(var0.progressbar, "show_progress", false)
  var0.scrollbar = eui:uiCreateScrollBar(25, 80, 350, 25, tocolor(255, 255, 255), tocolor(0, 0, 0, 0), true, var0.fuel_container)
  eui:uiSetProperty(var0.scrollbar, "thumb_size", 2)
  eui:uiCreateRectangle(0, 140, 400, 1, tocolor(255, 255, 255, 10), false, false, false, false, var0.fuel_container)
  var0.price_text = eui:uiCreateLabel(20, 155, 200, 35, "Total:  #00ff00$ 0", tocolor(255, 255, 255), "left", "center", var0.fuel_container)
  eui:uiSetFont(var0.price_text, "default-large")
  var0.fuel_button = eui:uiCreateButton(190, 155, 200, 35, {
    en = "Chrage Car",
    ar = "\216\180\216\173\217\134 \216\167\217\132\216\179\217\138\216\167\216\177\216\169"
  }, tocolor(255, 0, 0, 255), var0.fuel_container)
  eui:uiSetProperty(var0.fuel_button, "HoverGlow", true)
  addEventHandler("onClientUIVisibilityChange", var0.fuel_container, function(arg0)
    if not arg0 then
      showCursor(false)
    end
  end)
end
addEventHandler("onClientUIReady", resourceRoot, UIKitReady)
addEvent("onClientUIKitReady", true)
addEventHandler("onClientUIKitReady", root, UIKitReady)
addEventHandler("onClientUIScroll", root, function()
  if source == var0.scrollbar then
    eui:uiProgressBarSetProgress(var0.progressbar, (eui:uiScrollBarGetScrollPosition(source)))
    if not isElement(current_refuel_vehicle) then
      return
    end
    eui:uiSetText(var0.progress_text, tostring((eui:uiScrollBarGetScrollPosition(source))) .. " %")
    eui:uiSetText(var0.price_text, "Total:  #00ff00$ " .. tostring((math.floor((eui:uiScrollBarGetScrollPosition(source) - getVehiclePercentageFuel(current_refuel_vehicle)) * 1.5))))
  end
end)
addEventHandler("onClientUIClick", root, function()
  if source == var0.fuel_button then
    exports.public:loading("fuel:refuel", true)
    triggerServerEvent("fuel:refuel", localPlayer, (eui:uiScrollBarGetScrollPosition(var0.scrollbar)))
  end
end)
addEvent("fuel:refuel:callback", true)
addEventHandler("fuel:refuel:callback", localPlayer, function()
  exports.public:loading("fuel:refuel", false)
  eui:uiSetVisible(var0.fuel_container, false)
  showCursor(false)
end)
addEvent("fuel:show_refuel", true)
addEventHandler("fuel:show_refuel", localPlayer, function(arg0)
  current_refuel_vehicle = arg0
  eui:uiSetVisible(var0.fuel_container, true)
  showCursor(true)
  eui:uiProgressBarSetProgress(var0.progressbar, (getVehiclePercentageFuel(arg0)))
  eui:uiScrollBarSetScrollPosition(var0.scrollbar, (getVehiclePercentageFuel(arg0)))
end)
