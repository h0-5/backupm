-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

function showVehicleShop(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7)
  if var0.state == arg0 then
    return
  end
  var0.state = arg0
  showCursor(arg0)
  if arg0 then
    table.sort(arg5, function(arg0, arg1)
      return tonumber(arg0.Price) < tonumber(arg1.Price)
    end)
    var0.vehicles = arg5
    if not getElementData(localPlayer, "vehlib:handling.savedPos") or type((getElementData(localPlayer, "vehlib:handling.savedPos"))) ~= "table" then
      setElementData(localPlayer, "vehlib:handling.savedPos", {
        getElementPosition(localPlayer)
      })
    end
    var0.savedDim = getElementDimension(localPlayer)
    setElementFrozen(localPlayer, true)
    setElementDimension(localPlayer, 61000)
    if #arg5 > 0 then
      var0.index = 1
      var0.preview_vehicle = createVehicle(tonumber(arg5[1].MTAModel) >= 30000 and 579 or tonumber(arg5[1].MTAModel), arg1, arg2, arg3, 0, 0, arg4)
      if tonumber(arg5[1].MTAModel) >= 30000 then
        setElementData(var0.preview_vehicle, "customModel", (tonumber(arg5[1].MTAModel)))
      end
      setElementDimension(var0.preview_vehicle, 61000)
      setVehicleColor(var0.preview_vehicle, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255)
      setElementFrozen(var0.preview_vehicle, true)
      setCameraMatrix(getPointFromDistanceRotation(arg1, arg2, arg7 or 8, -arg4 - 20))
      setTimer(changeVehiclePreviewIndex, 100, 1, 1)
    end
    bindKey("arrow_r", "down", var0.changePreview)
    bindKey("arrow_l", "down", var0.changePreview)
    eui:uiSetVisible(UI.window.veh_info, true)
    eui:uiSetVisible(UI.window.veh_specs, true)
  else
    eui:uiSetVisible(UI.window.veh_info, false)
    eui:uiSetVisible(UI.window.veh_specs, false)
    eui:uiSetVisible(UI.window.rent_vehicle, false)
    if isElement(var0.preview_vehicle) then
      destroyElement(var0.preview_vehicle)
    end
    unbindKey("arrow_r", "down", var0.changePreview)
    unbindKey("arrow_l", "down", var0.changePreview)
    setCameraTarget(localPlayer)
    if not arg6 then
      if var0.savedDim then
        setElementDimension(localPlayer, var0.savedDim)
        setElementFrozen(localPlayer, false)
      end
      setElementData(localPlayer, "vehlib:handling.savedPos", nil)
    end
  end
end
;({
  state = false,
  vehicles = {},
  index = 1,
  preview_vehicle = false,
  savedDim = 0
}).changePreview = function(arg0, arg1)
  if isElement(var0.preview_vehicle) then
    if arg0 ~= "arrow_l" or not math.max(var0.index - 1, 1) then
    end
    var0.index = math.min(var0.index + 1, #var0.vehicles)
    changeVehiclePreviewIndex(var0.index)
  end
end
function changeVehiclePreviewIndex(arg0)
  if not isElement(var0.preview_vehicle) then
    return
  end
  setElementFrozen(var0.preview_vehicle, true)
  if tonumber(var0.vehicles[arg0].MTAModel) >= 30000 then
    setElementModel(var0.preview_vehicle, 579)
    setElementData(var0.preview_vehicle, "customModel", (tonumber(var0.vehicles[arg0].MTAModel)))
  else
    setElementData(var0.preview_vehicle, "customModel", nil)
    setElementModel(var0.preview_vehicle, (tonumber(var0.vehicles[arg0].MTAModel)))
  end
  setElementPosition(var0.preview_vehicle, getElementPosition(var0.preview_vehicle))
  setElementFrozen(var0.preview_vehicle, false)
  if exports.hud:isHudItemExists("special_membership:Premium") then
  elseif exports.hud:isHudItemExists("special_membership:Plus") then
  elseif exports.hud:isHudItemExists("special_membership:Classic") then
  end
  var0.vehicles[arg0].discounted_price = math.floor(tonumber(var0.vehicles[arg0].Price) - tonumber(var0.vehicles[arg0].Price) * (5 / 100))
  if 5 == 0 then
  else
  end
  eui:uiSetText(UI.label.veh_name, ((var0.vehicles[arg0].Brand .. " " .. var0.vehicles[arg0].Model .. " " .. var0.vehicles[arg0].Year) .. [[

#00FF00$]] .. tostring(convertNumber(var0.vehicles[arg0].Price)) .. "  #FFFFFFwith tax ($" .. tostring(convertNumber(var0.vehicles[arg0].Tax)) .. ")") .. [[

#00FF00$]] .. tostring(convertNumber((math.floor(tonumber(var0.vehicles[arg0].Price) - tonumber(var0.vehicles[arg0].Price) * (5 / 100))))) .. " #FFFF00(-" .. tostring(5) .. "%)  #FFFFFFwith tax ($" .. tostring(convertNumber(var0.vehicles[arg0].Tax)) .. ")")
  eui:uiSetText(UI.labelValue[1], tostring(fromJSON(var0.vehicles[arg0].Handling).maxVelocity or "?") .. "  km/h")
  eui:uiSetText(UI.labelValue[2], tostring(fromJSON(var0.vehicles[arg0].Handling).engineAcceleration or "?") .. "  m/s2")
  eui:uiSetText(UI.labelValue[3], tostring(fromJSON(var0.vehicles[arg0].Handling).engineInertia) .. "  kg m2")
  eui:uiSetText(UI.labelValue[4], tostring(fromJSON(var0.vehicles[arg0].Handling).driveType))
  eui:uiSetText(UI.labelValue[5], tostring(fromJSON(var0.vehicles[arg0].Handling).engineType))
  eui:uiProgressBarSetProgress(UI.progressbar[1], (fromJSON(var0.vehicles[arg0].Handling).maxVelocity or 0) / 360 * 100)
  eui:uiProgressBarSetProgress(UI.progressbar[2], (fromJSON(var0.vehicles[arg0].Handling).engineAcceleration or 0) / 100 * 100)
  if var0.vehicles[arg0].Rentable == 1 then
    eui:uiSetVisible(UI.button.show_rent_vehicle, true)
  else
    eui:uiSetVisible(UI.button.show_rent_vehicle, false)
  end
end
addEvent("vehlib:openVehicleShop", true)
addEventHandler("vehlib:openVehicleShop", root, function(arg0, arg1, arg2, arg3, arg4, arg5, arg6)
  showVehicleShop(true, arg2, arg3, arg4, arg5, arg1, _, arg6)
end)
function UIKitReady()
  eui = exports.UIKit
  UI.window.veh_shop = eui:uiCreateRectangle(10, (eui:uiGetReferenceScreenSize() - eui:uiGetReferenceScreenSize() + 20) / 2, 320, eui:uiGetReferenceScreenSize() - 20, tocolor(9, 12, 17, 250), true, true, true, true)
  eui:uiSetVisible(UI.window.veh_shop, false)
  UI.label.Title = eui:uiCreateLabel(0, 0, 320, 50, {
    en = "Vehicles List",
    ar = "\217\130\216\167\216\166\217\133\216\169 \216\167\217\132\217\133\216\177\217\131\216\168\216\167\216\170"
  }, tocolor(255, 255, 255, 255), "center", "center", UI.window.veh_shop)
  eui:uiSetFont(UI.label.Title, "default-large")
  eui:uiCreateRectangle(0, 50, 320, 1, tocolor(255, 255, 255, 20), false, false, false, false, UI.window.veh_shop)
  UI.button.close_shop = eui:uiCreateButton(10, eui:uiGetReferenceScreenSize() - 70, 300, 40, {en = "Close", ar = "\216\165\216\186\217\132\216\167\217\130"}, tocolor(10, 10, 10, 240), UI.window.veh_shop)
  eui:uiSetProperty(UI.button.close_shop, "HoverTextColor", tocolor(255, 48, 48))
  UI.gridlist.vehicles = eui:uiCreateGridList(10, 60, 300, eui:uiGetReferenceScreenSize() - 120 - 20, tocolor(5, 8, 13, 255), UI.window.veh_shop)
  eui:uiGridListAddColumn(UI.gridlist.vehicles, "Vehicles", 1)
  eui:uiSetAlign(UI.gridlist.vehicles, "left", "center")
  eui:uiSetProperty(UI.gridlist.vehicles, "row_height", 40)
  eui:uiSetProperty(UI.gridlist.vehicles, "columns_names_visible", "False")
  eui:uiSetProperty(UI.gridlist.vehicles, "column_height", 0)
  UI.window.veh_info = eui:uiCreateRectangle((eui:uiGetReferenceScreenSize() - 420) / 2, eui:uiGetReferenceScreenSize() - 180 - 20, 420, 180, "bg_default", true, true, true, true)
  eui:uiSetVisible(UI.window.veh_info, false)
  UI.label.veh_name = eui:uiCreateLabel(0, 10, 420, 30, "Vehicle Name", tocolor(255, 255, 255, 255), "center", "top", UI.window.veh_info)
  eui:uiSetFont(UI.label.veh_name, "default-large")
  eui:uiCreateRectangle(0, 180 - 110, 420, 1, tocolor(255, 255, 255, 20), false, false, false, false, UI.window.veh_info)
  for forvar9, forvar10 in ipairs(var0) do
    UI.image[forvar9] = eui:uiCreateImage((420 - (35 * #var0 - 5)) / 2 + 35 * (forvar9 - 1), 180 - 30 - 10 - 60, 30, 30, ":vehicle-library/circle.png", UI.window.veh_info)
    eui:uiSetColor(UI.image[forvar9], forvar10[1], forvar10[2], forvar10[3], 50)
    var1[UI.image[forvar9]] = forvar10
  end
  eui:uiCreateRectangle(0, 180 - 60, 420, 1, tocolor(255, 255, 255, 20), false, false, false, false, UI.window.veh_info)
  UI.button.buy_vehicle = eui:uiCreateButton(10, 180 - 50, (420 - 30) / 2, 40, {en = "Purchase", ar = "\216\180\216\177\216\167\216\161"}, "primary", UI.window.veh_info)
  UI.button.close_shop = eui:uiCreateButton(10 + 420 / 2 - 5, 180 - 50, (420 - 30) / 2, 40, {en = "Close", ar = "\216\165\216\186\217\132\216\167\217\130"}, _, UI.window.veh_info)
  eui:uiSetProperty(UI.button.close_shop, "HoverTextColor", tocolor(255, 48, 48))
  UI.button.left_arrow = eui:uiCreateImage(-80, (180 - 50) / 2, 50, 50, ":assets/images/left-arrow.png", UI.window.veh_info)
  UI.button.right_arrow = eui:uiCreateImage(420 + 30, (180 - 50) / 2, 50, 50, ":assets/images/right-arrow.png", UI.window.veh_info)
  eui:uiSetProperty(UI.button.left_arrow, "HoverOpacityEffect", true)
  eui:uiSetProperty(UI.button.right_arrow, "HoverOpacityEffect", true)
  eui:uiSetColor(UI.button.left_arrow, 0, 0, 0, 200)
  eui:uiSetColor(UI.button.right_arrow, 0, 0, 0, 200)
  UI.window.veh_specs = eui:uiCreateRectangle(eui:uiGetReferenceScreenSize() - 280 - 30, false, 250, 400, "bg_default", true, true, true, true)
  eui:uiSetVisible(UI.window.veh_specs, false)
  UI.button.test_drive = eui:uiCreateButton(10, 300, 230, 40, {
    en = "Test Drive",
    ar = "\216\170\216\172\216\177\216\168\216\169 \216\167\217\132\217\130\217\138\216\167\216\175\216\169"
  }, "primary", UI.window.veh_specs)
  UI.button.show_rent_vehicle = eui:uiCreateButton(10, 350, 230, 40, {
    en = "Rent Vehicle",
    ar = "\216\167\216\179\216\170\216\166\216\172\216\167\216\177 \216\167\217\132\217\133\216\177\217\131\216\168\216\169"
  }, "primary", UI.window.veh_specs)
  for forvar10, forvar11 in ipairs({
    {
      en = "Max Speed",
      ar = "\216\167\217\132\216\179\216\177\216\185\216\169 \216\167\217\132\217\130\216\181\217\136\217\137",
      progress = true
    },
    {
      en = "Acceleration",
      ar = "\216\167\217\132\216\170\216\179\216\167\216\177\216\185",
      progress = true
    },
    {
      en = "Engine Inertia",
      ar = "\216\185\216\178\217\133 \216\167\217\132\217\133\216\173\216\177\217\131"
    },
    {
      en = "Drive Type",
      ar = "\217\134\217\136\216\185 \216\167\217\132\217\130\217\138\216\167\216\175\216\169"
    },
    {
      en = "Engine Type",
      ar = "\217\134\217\136\216\185 \216\167\217\132\217\133\216\173\216\177\217\131"
    }
  }) do
    eui:uiCreateLabel(20, 20 + 55 * (forvar10 - 1), 210, 20, forvar11, tocolor(255, 255, 255, 255), "left", "top", UI.window.veh_specs)
    UI.labelValue[forvar10] = eui:uiCreateLabel(20, 20 + 55 * (forvar10 - 1), 210, 20, "-", tocolor(255, 255, 255, 255), "right", "top", UI.window.veh_specs)
    if forvar11.progress then
      UI.progressbar[forvar10] = eui:uiCreateProgressBar(20, 20 + 55 * (forvar10 - 1) + 30, 210, 5, _, UI.window.veh_specs)
      eui:uiSetProperty(UI.progressbar[forvar10], "background_color", tocolor(30, 30, 30, 255))
      eui:uiSetProperty(UI.progressbar[forvar10], "show_progress", false)
    end
  end
  UI.window.rent_vehicle = eui:uiCreateWindow(false, false, 440, 250, {
    en = "Rent Vehicle",
    ar = "\216\167\216\179\216\170\216\166\216\172\216\167\216\177 \217\133\216\177\217\131\216\168\216\169"
  }, _, ":assets/icons/car.png")
  eui:uiWindowSetMovable(UI.window.rent_vehicle, false)
  eui:uiSetVisible(UI.window.rent_vehicle, false)
  eui:uiCreateLabel(15, 30, 420, 15, {
    en = "Please confirm the following information about this vehicle.",
    ar = "\217\138\216\177\216\172\217\137 \216\170\216\163\217\131\217\138\216\175 \216\167\217\132\217\133\216\185\217\132\217\136\217\133\216\167\216\170 \216\167\217\132\216\170\216\167\217\132\217\138\216\169 \216\173\217\136\217\132 \217\135\216\176\217\135 \216\167\217\132\216\179\217\138\216\167\216\177\216\169"
  }, tocolor(255, 255, 255, 240), UI.window.rent_vehicle)
  UI.label["rent_vehicle:info"] = eui:uiCreateLabel(15, 60, 420, 15, [[
Vehicle Name:
Brand:]], "primary", UI.window.rent_vehicle)
  UI.label["rent_vehicle:price"] = eui:uiCreateLabel(15, 160, 420, 15, "", tocolor(255, 255, 255, 255), "left", "center", UI.window.rent_vehicle)
  eui:uiCreateLabel(15, 120, 150, 25, {
    en = "Rental Duration",
    ar = "\217\133\216\175\216\169 \216\167\217\132\216\167\216\179\216\170\216\166\216\172\216\167\216\177"
  }, "primary", "left", "center", UI.window.rent_vehicle)
  UI.combobox["rent_vehicle:duration"] = eui:uiCreateComboBox(130, 120, 250, 20, "Duration", tocolor(255, 255, 255), UI.window.rent_vehicle)
  for forvar11, forvar12 in ipairs(config.rent_durations) do
    eui:uiComboBoxAddItem(UI.combobox["rent_vehicle:duration"], forvar12.label)
  end
  UI.button.rent_vehicle = eui:uiCreateButton(10, 250 - 45, 190, 35, {
    en = "Rent",
    ar = "\216\167\216\179\216\170\216\166\216\172\216\167\216\177"
  }, _, UI.window.rent_vehicle)
  UI.button["rent_vehicle:cancel"] = eui:uiCreateButton(310, 250 - 45, 120, 35, {en = "Cancel", ar = "\216\165\217\132\216\186\216\167\216\161"}, _, UI.window.rent_vehicle)
  UI.window.veh_sell = eui:uiCreateWindow(false, false, 450, 550, {
    en = "Sell Vehicles",
    ar = "\216\168\217\138\216\185 \216\167\217\132\217\133\216\177\217\131\216\168\216\167\216\170"
  }, _, ":assets/icons/car.png")
  eui:uiSetVisible(UI.window.veh_sell, false)
  eui:uiCreateLabel(0, 60, 450, 60, {
    en = [[
	Do you want to sell your vehicle but don't want to wait to find a buyer?
	We can buy it from you at an affordable price

	Choose the vehicle you want to sell
	]],
    ar = "\t\217\135\217\132 \216\170\216\177\216\186\216\168 \217\129\217\138 \216\168\217\138\216\185 \217\133\216\177\217\131\216\168\216\170\217\131 \217\136\217\132\217\131\217\134\217\131 \217\132\216\167\216\170\216\177\217\138\216\175 \216\167\217\134\216\170\216\184\216\167\216\177 \216\167\217\132\216\185\216\171\217\136\216\177 \216\185\217\132\217\137 \217\133\216\180\216\170\216\177\217\138 \216\159\n\t\217\134\216\173\217\134 \217\134\216\179\216\170\216\183\217\138\216\185 \216\180\216\177\216\167\216\164\217\135\216\167 \217\133\217\134\217\131 \216\168\216\179\216\185\216\177 \217\133\217\134\216\167\216\179\216\168\n\n\t\216\167\216\174\216\170\216\177 \216\167\217\132\217\133\216\177\217\131\216\168\216\169 \216\167\217\132\216\170\217\138 \216\170\216\177\216\186\216\168 \217\129\217\138 \216\168\217\138\216\185\217\135\216\167\n\t"
  }, tocolor(255, 255, 255, 255), "center", "top", UI.window.veh_sell)
  UI.gridlist.owned_vehicles = eui:uiCreateGridList(10, 150, 430, 200, tocolor(6, 8, 13, 255), UI.window.veh_sell)
  eui:uiGridListAddColumn(UI.gridlist.owned_vehicles, "ID", 0.2)
  eui:uiGridListAddColumn(UI.gridlist.owned_vehicles, "Name", 0.8)
  eui:uiSetAlign(UI.gridlist.owned_vehicles, "left", "center")
  eui:uiSetProperty(UI.gridlist.owned_vehicles, "row_height", 20)
  UI.label.sell_price = eui:uiCreateLabel(0, 370, 450, 50, {
    en = [[
	The estimated price of the vehicle is
	-
	#ffffffDo you agree to sell the vehicle at this price ?
	]],
    ar = "\t\216\167\217\132\216\179\216\185\216\177 \216\167\217\132\216\170\217\130\216\175\217\138\216\177\217\138 \217\132\217\132\217\133\216\177\217\131\216\168\216\169 \217\135\217\136\n\t-\n\t#ffffff\217\135\217\132 \216\163\217\134\216\170 \217\133\217\136\216\167\217\129\217\130 \216\185\217\132\217\137 \216\168\217\138\216\185 \216\167\217\132\217\133\216\177\217\131\216\168\216\169 \216\168\217\135\216\176\216\167 \216\167\217\132\216\179\216\185\216\177 \216\159\n\t"
  }, tocolor(255, 255, 255, 255), "center", "top", UI.window.veh_sell)
  UI.button.sell_vehicle = eui:uiCreateButton(10, 460, 430, 35, {
    en = "Yes, I agree to sell the vehicle",
    ar = "\217\134\216\185\217\133\216\140 \216\163\217\136\216\167\217\129\217\130 \216\185\217\132\217\137 \216\168\217\138\216\185 \216\167\217\132\217\133\216\177\217\131\216\168\216\169"
  }, "primary", UI.window.veh_sell)
  UI.button.cancel_sell_vehicle = eui:uiCreateButton(10, 505, 430, 35, {en = "Cancel", ar = "\216\165\217\132\216\186\216\167\216\161"}, _, UI.window.veh_sell)
  UI.label.test_drive = eui:uiCreateRectangle(false, 100, 400, 60, tocolor(0, 0, 0, 30))
  eui:uiSetVisible(UI.label.test_drive, false)
  UI.label.test_drive_label = eui:uiCreateLabel(0, 0, 400, 60, "Test Drive", tocolor(255, 0, 0, 255), "center", "center", UI.label.test_drive)
  eui:uiSetFont(UI.label.test_drive_label, "hud-large")
end
addEventHandler("onClientUIReady", resourceRoot, UIKitReady)
addEventHandler("onClientUIKitReady", root, UIKitReady)
function changeAlpha()
  if var0[source] and var1 ~= source then
    eui:uiSetAlpha(source, eventName == "onClientUIMouseEnter" and 240 or 50)
  end
end
addEventHandler("onClientUIMouseEnter", root, changeAlpha)
addEventHandler("onClientUIMouseLeave", root, changeAlpha)
function exitVehicleEvent(arg0, arg1)
  eui:uiSetVisible(UI.label.test_drive, false)
  removeEventHandler("onClientPlayerVehicleExit", localPlayer, exitVehicleEvent)
  triggerServerEvent("carshop:testDrive:cancel", localPlayer)
end
addEvent("carshop:testDrive:start", true)
addEventHandler("carshop:testDrive:start", localPlayer, function()
  eui:uiSetVisible(UI.label.test_drive, true)
end)
addEvent("carshop:testDrive:onCancel", true)
addEventHandler("carshop:testDrive:onCancel", localPlayer, function()
  eui:uiSetVisible(UI.label.test_drive, false)
  removeEventHandler("onClientPlayerVehicleExit", localPlayer, exitVehicleEvent)
end)
addEventHandler("onClientUIComboBoxAccepted", root, function()
  if source == UI.combobox["rent_vehicle:duration"] then
    eui:uiSetText(UI.label["rent_vehicle:price"], "= #00ff00$" .. convertNumber(config.rent_durations[eui:uiComboBoxGetSelected(source) + 1].time * (tonumber(current_rental_vehicle_info.RentPrice) or 0)))
  end
end)
addEventHandler("onClientUIClick", root, function()
  if source == UI.button.buy_vehicle then
    showVehicleShop(false)
    var2.vehicles[var2.index].Price = var2.vehicles[var2.index].discounted_price
    triggerServerEvent("vehlib:buyVehicle", localPlayer, var2.vehicles[var2.index], unpack(var1[var0]))
  elseif source == UI.button.test_drive then
    showVehicleShop(false, _, _, _, _, _, true)
    triggerServerEvent("carshop:testDrive", localPlayer, var2.vehicles[var2.index].ID, true)
    addEventHandler("onClientPlayerVehicleExit", localPlayer, exitVehicleEvent)
    exports.notifications:output({
      en = "Exit the vehicle to stop the test drive",
      ar = "\216\167\216\174\216\177\216\172 \217\133\217\134 \216\167\217\132\217\133\216\177\217\131\216\168\216\169 \217\132\217\132\216\170\217\136\217\130\217\129 \216\185\217\134 \216\167\217\132\216\170\216\172\216\177\216\168\216\169"
    }, 8000, "info")
  elseif source == UI.button.close_shop then
    showVehicleShop(false)
  elseif source == UI.button.show_rent_vehicle then
    eui:uiSetText(UI.label["rent_vehicle:info"], {
      en = "${color.primary}\226\128\162 Vehicle Name  \194\187  #FFFFFF" .. tostring(var2.vehicles[var2.index].Model) .. " " .. tostring(var2.vehicles[var2.index].Year) .. "\n" .. "${color.primary}\226\128\162 Brand  \194\187  #FFFFFF" .. tostring(var2.vehicles[var2.index].Brand),
      ar = "${color.primary}\226\128\162 \216\167\216\179\217\133 \216\167\217\132\217\133\216\177\217\131\216\168\216\169  \194\187  #FFFFFF" .. tostring(var2.vehicles[var2.index].Model) .. " " .. tostring(var2.vehicles[var2.index].Year) .. "\n" .. "${color.primary}\226\128\162 \216\167\217\132\216\180\216\185\216\167\216\177  \194\187  #FFFFFF" .. tostring(var2.vehicles[var2.index].Brand)
    })
    eui:uiSetVisible(UI.window.rent_vehicle, true)
    current_rental_vehicle_info = var2.vehicles[var2.index]
  elseif source == UI.button.rent_vehicle then
    if eui:uiComboBoxGetSelected(UI.combobox["rent_vehicle:duration"]) ~= -1 then
      showVehicleShop(false)
      triggerServerEvent("vehlib:rentVehicle", localPlayer, current_rental_vehicle_info.ID, eui:uiComboBoxGetSelected(UI.combobox["rent_vehicle:duration"]) + 1, unpack(var1[var0]))
    else
    end
  elseif source == UI.button["rent_vehicle:cancel"] then
    eui:uiSetVisible(UI.window.rent_vehicle, false)
  elseif var1[source] then
    if var0 then
      eui:uiSetAlpha(var0, 50)
    end
    var0 = source
    eui:uiSetAlpha(source, 255)
    setVehicleColor(var2.preview_vehicle, unpack(var1[source]))
  elseif source == UI.button.cancel_sell_vehicle then
    eui:uiSetVisible(UI.window.veh_sell, false)
    showCursor(false)
  elseif source == UI.gridlist.owned_vehicles then
    if eui:uiGridListGetSelectedItem(source) ~= -1 then
      eui:uiSetText(UI.label.sell_price, {
        en = [[
			The estimated price of the vehicle is
			#00ff00$]] .. tostring((convertNumber(math.floor(eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1) * 0.55)))) .. [[
			
			#ffffffDo you agree to sell the vehicle at this price ?
			]],
        ar = "\t\t\t\216\167\217\132\216\179\216\185\216\177 \216\167\217\132\216\170\217\130\216\175\217\138\216\177\217\138 \217\132\217\132\217\133\216\177\217\131\216\168\216\169 \217\135\217\136\n\t\t\t#00ff00$" .. tostring((convertNumber(math.floor(eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1) * 0.55)))) .. "\t\t\t\n\t\t\t#ffffff\217\135\217\132 \216\163\217\134\216\170 \217\133\217\136\216\167\217\129\217\130 \216\185\217\132\217\137 \216\168\217\138\216\185 \216\167\217\132\217\133\216\177\217\131\216\168\216\169 \216\168\217\135\216\176\216\167 \216\167\217\132\216\179\216\185\216\177 \216\159\n\t\t\t"
      })
    else
      eui:uiSetText(UI.label.sell_price, {
        en = [[
			The estimated price of the vehicle is
			-
			#ffffffDo you agree to sell the vehicle at this price ?
			]],
        ar = "\t\t\t\216\167\217\132\216\179\216\185\216\177 \216\167\217\132\216\170\217\130\216\175\217\138\216\177\217\138 \217\132\217\132\217\133\216\177\217\131\216\168\216\169 \217\135\217\136\n\t\t\t-\n\t\t\t#ffffff\217\135\217\132 \216\163\217\134\216\170 \217\133\217\136\216\167\217\129\217\130 \216\185\217\132\217\137 \216\168\217\138\216\185 \216\167\217\132\217\133\216\177\217\131\216\168\216\169 \216\168\217\135\216\176\216\167 \216\167\217\132\216\179\216\185\216\177 \216\159\n\t\t\t"
      })
    end
  elseif source == UI.button.sell_vehicle then
    if eui:uiGridListGetSelectedItem(UI.gridlist.owned_vehicles) ~= -1 then
      if not isElement((getElementByID("Vehicle:" .. tostring((eui:uiGridListGetItemText(UI.gridlist.owned_vehicles, eui:uiGridListGetSelectedItem(UI.gridlist.owned_vehicles), 1)))))) then
        exports.notifications:output({
          en = "The vehicle must be nearby",
          ar = "\217\138\216\172\216\168 \216\163\217\134 \216\170\217\131\217\136\217\134 \216\167\217\132\217\133\216\177\217\131\216\168\216\169 \217\129\217\138 \217\133\217\131\216\167\217\134 \217\130\216\177\217\138\216\168"
        }, 4000, "error")
        return
      end
      if getDistanceBetweenPoints3D(getElementPosition(localPlayer)) > 100 then
        exports.notifications:output({
          en = "The vehicle must be nearby",
          ar = "\217\138\216\172\216\168 \216\163\217\134 \216\170\217\131\217\136\217\134 \216\167\217\132\217\133\216\177\217\131\216\168\216\169 \217\129\217\138 \217\133\217\131\216\167\217\134 \217\130\216\177\217\138\216\168"
        }, 4000, "error")
        return
      end
      eui:uiSetVisible(UI.window.veh_sell, false)
      showCursor(false)
      triggerServerEvent("sell_vehicle:sell", localPlayer, (eui:uiGridListGetItemText(UI.gridlist.owned_vehicles, eui:uiGridListGetSelectedItem(UI.gridlist.owned_vehicles), 1)))
    end
  elseif source == UI.button.left_arrow then
    var2.changePreview("arrow_l", "down")
  elseif source == UI.button.right_arrow then
    var2.changePreview("arrow_r", "down")
  end
end)
function getPointFromDistanceRotation(arg0, arg1, arg2, arg3)
  return arg0 + math.cos((math.rad(90 - arg3))) * arg2, arg1 + math.sin((math.rad(90 - arg3))) * arg2
end
addEvent("sell_vehicle:show", true)
addEventHandler("sell_vehicle:show", root, function(arg0)
  eui:uiSetText(UI.label.sell_price, {
    en = [[
	The estimated price of the vehicle is
	-
	#ffffffDo you agree to sell the vehicle at this price ?
	]],
    ar = "\t\216\167\217\132\216\179\216\185\216\177 \216\167\217\132\216\170\217\130\216\175\217\138\216\177\217\138 \217\132\217\132\217\133\216\177\217\131\216\168\216\169 \217\135\217\136\n\t-\n\t#ffffff\217\135\217\132 \216\163\217\134\216\170 \217\133\217\136\216\167\217\129\217\130 \216\185\217\132\217\137 \216\168\217\138\216\185 \216\167\217\132\217\133\216\177\217\131\216\168\216\169 \216\168\217\135\216\176\216\167 \216\167\217\132\216\179\216\185\216\177 \216\159\n\t"
  })
  eui:uiSetVisible(UI.window.veh_sell, true)
  showCursor(true)
  eui:uiGridListClear(UI.gridlist.owned_vehicles)
  for forvar7, forvar8 in ipairs(arg0) do
    eui:uiGridListSetItemText(UI.gridlist.owned_vehicles, eui:uiGridListAddRow(UI.gridlist.owned_vehicles), 1, tostring(forvar8.ID))
    eui:uiGridListSetItemText(UI.gridlist.owned_vehicles, eui:uiGridListAddRow(UI.gridlist.owned_vehicles), 2, tostring(forvar8.Name))
    eui:uiGridListSetItemData(UI.gridlist.owned_vehicles, eui:uiGridListAddRow(UI.gridlist.owned_vehicles), 1, forvar8.PurchasePrice)
    eui:uiGridListSetItemColor(UI.gridlist.owned_vehicles, eui:uiGridListAddRow(UI.gridlist.owned_vehicles), 1, tocolor(255, 234, 176, 255))
    eui:uiGridListSetItemColor(UI.gridlist.owned_vehicles, eui:uiGridListAddRow(UI.gridlist.owned_vehicles), 2, tocolor(255, 234, 176, 255))
  end
end)
