-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

GUIEditor = {
  combobox = {},
  label = {},
  button = {},
  window = {},
  gridlist = {},
  memo = {},
  column = {}
}
TTGUI = {
  button = {},
  window = {},
  radiobutton = {},
  label = {}
}
function UIKitReady()
  eui = exports.UIKit
  GUIEditor.window[1] = eui:uiCreateWindow(false, false, 500, 350, "Driving License")
  eui:uiSetVisible(GUIEditor.window[1], false)
  eui:uiWindowSetMovable(GUIEditor.window[1], false)
  GUIEditor.gridlist.license_types = eui:uiCreateGridList(10, 40, 200, 290, tocolor(0, 0, 0, 0), GUIEditor.window[1])
  eui:uiGridListAddColumn(GUIEditor.gridlist.license_types, "License Type", 1)
  eui:uiSetProperty(GUIEditor.gridlist.license_types, "row_height", 35)
  GUIEditor.gridlist[1] = eui:uiCreateGridList(220, 40, 270, 260, tocolor(0, 0, 0, 0), GUIEditor.window[1])
  GUIEditor.column[1] = eui:uiGridListAddColumn(GUIEditor.gridlist[1], "", 0.7)
  GUIEditor.column[2] = eui:uiGridListAddColumn(GUIEditor.gridlist[1], "", 0.3)
  GUIEditor.button[1] = eui:uiCreateButton(390, 310, 100, 30, {en = "Close", ar = "\216\165\216\186\217\132\216\167\217\130"}, _, GUIEditor.window[1])
  GUIEditor.label[1] = eui:uiCreateLabel(220, 310, 150, 30, {
    en = "Double click to choose",
    ar = "\216\167\217\134\217\130\216\177 \217\133\216\177\216\170\217\138\217\134 \217\132\217\132\216\167\216\174\216\170\217\138\216\167\216\177"
  }, tocolor(255, 255, 255, 200), "center", "center", GUIEditor.window[1])
  TTGUI.window[1] = eui:uiCreateWindow(false, false, 940, 450, "Theoretical Test")
  eui:uiSetVisible(TTGUI.window[1], false)
  eui:uiWindowSetMovable(TTGUI.window[1], false)
  TTGUI.label[1] = eui:uiCreateLabel(20, 35, 436, 87, "Question #1", tocolor(255, 255, 255, 255), TTGUI.window[1])
  eui:uiSetAlign(TTGUI.label[1], "left")
  TTGUI.radiobutton[1] = eui:uiCreateRadioButton(0, 33, 376, 20, "", false, _, TTGUI.label[1])
  TTGUI.radiobutton[2] = eui:uiCreateRadioButton(0, 53, 376, 20, "", false, _, TTGUI.label[1])
  TTGUI.radiobutton[3] = eui:uiCreateRadioButton(0, 73, 376, 20, "", false, _, TTGUI.label[1])
  TTGUI.label[2] = eui:uiCreateLabel(20, 152, 436, 87, "Question #2", tocolor(255, 255, 255, 255), TTGUI.window[1])
  eui:uiSetAlign(TTGUI.label[2], "left")
  TTGUI.radiobutton[4] = eui:uiCreateRadioButton(0, 33, 376, 20, "", false, _, TTGUI.label[2])
  TTGUI.radiobutton[5] = eui:uiCreateRadioButton(0, 53, 376, 20, "", false, _, TTGUI.label[2])
  TTGUI.radiobutton[6] = eui:uiCreateRadioButton(0, 73, 376, 20, "", false, _, TTGUI.label[2])
  TTGUI.label[3] = eui:uiCreateLabel(20, 269, 436, 87, "Question #3", tocolor(255, 255, 255, 255), TTGUI.window[1])
  eui:uiSetAlign(TTGUI.label[3], "left")
  TTGUI.radiobutton[7] = eui:uiCreateRadioButton(0, 33, 376, 20, "", false, _, TTGUI.label[3])
  TTGUI.radiobutton[8] = eui:uiCreateRadioButton(0, 53, 376, 20, "", false, _, TTGUI.label[3])
  TTGUI.radiobutton[9] = eui:uiCreateRadioButton(0, 73, 376, 20, "", false, _, TTGUI.label[3])
  TTGUI.label[4] = eui:uiCreateLabel(468, 35, 436, 87, "Question #4", tocolor(255, 255, 255, 255), TTGUI.window[1])
  eui:uiSetAlign(TTGUI.label[4], "left")
  TTGUI.radiobutton[10] = eui:uiCreateRadioButton(0, 33, 276, 20, "", false, _, TTGUI.label[4])
  TTGUI.radiobutton[11] = eui:uiCreateRadioButton(0, 53, 276, 20, "", false, _, TTGUI.label[4])
  TTGUI.radiobutton[12] = eui:uiCreateRadioButton(0, 73, 276, 20, "", false, _, TTGUI.label[4])
  TTGUI.label[5] = eui:uiCreateLabel(468, 152, 436, 87, "Question #5", tocolor(255, 255, 255, 255), TTGUI.window[1])
  eui:uiSetAlign(TTGUI.label[5], "left")
  TTGUI.radiobutton[13] = eui:uiCreateRadioButton(0, 33, 276, 20, "", false, _, TTGUI.label[5])
  TTGUI.radiobutton[14] = eui:uiCreateRadioButton(0, 53, 276, 20, "", false, _, TTGUI.label[5])
  TTGUI.radiobutton[15] = eui:uiCreateRadioButton(0, 73, 276, 20, "", false, _, TTGUI.label[5])
  TTGUI.label[6] = eui:uiCreateLabel(468, 269, 436, 87, "Question #6", tocolor(255, 255, 255, 255), TTGUI.window[1])
  eui:uiSetAlign(TTGUI.label[6], "left")
  TTGUI.radiobutton[16] = eui:uiCreateRadioButton(0, 33, 276, 20, "", false, _, TTGUI.label[6])
  TTGUI.radiobutton[17] = eui:uiCreateRadioButton(0, 53, 276, 20, "", false, _, TTGUI.label[6])
  TTGUI.radiobutton[18] = eui:uiCreateRadioButton(0, 73, 276, 20, "", false, _, TTGUI.label[6])
  TTGUI.button[1] = eui:uiCreateButton(122, 410, 105, 30, {en = "Cancel", ar = "\216\165\217\132\216\186\216\167\216\161"}, tocolor(0, 0, 0, 255), TTGUI.window[1])
  TTGUI.button[2] = eui:uiCreateButton(12, 410, 105, 30, {en = "Submit", ar = "\216\165\216\177\216\179\216\167\217\132"}, tocolor(0, 0, 0, 255), TTGUI.window[1])
  TTGUI.label[8] = eui:uiCreateLabel(237, 410, 337, 30, "", tocolor(255, 255, 255, 255), TTGUI.window[1])
end
addEventHandler("onClientUIReady", resourceRoot, UIKitReady)
addEvent("onClientUIKitReady", true)
addEventHandler("onClientUIKitReady", root, UIKitReady)
addEventHandler("onClientUIClick", root, function()
  if source == GUIEditor.button[1] then
    eui:uiSetVisible(GUIEditor.window[1], false)
  elseif source == TTGUI.button[1] then
    eui:uiSetVisible(TTGUI.window[1], false)
  elseif source == GUIEditor.gridlist.license_types then
    eui:uiGridListClear(GUIEditor.gridlist[1])
    if eui:uiGridListGetSelectedItem(source) ~= -1 then
      for forvar5, forvar6 in ipairs(config.license_stages[eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1)]) do
        eui:uiGridListSetItemText(GUIEditor.gridlist[1], eui:uiGridListAddRow(GUIEditor.gridlist[1]), 1, forvar6.name.en)
        if (cache_trainings or {})[eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1)] or {}[tostring(forvar5 - 1)] then
          eui:uiGridListSetItemColor(GUIEditor.gridlist[1], eui:uiGridListAddRow(GUIEditor.gridlist[1]), 1, tocolor(0, 255, 0, 255))
          eui:uiGridListSetItemText(GUIEditor.gridlist[1], eui:uiGridListAddRow(GUIEditor.gridlist[1]), 2, "\226\156\148")
          eui:uiGridListSetItemColor(GUIEditor.gridlist[1], eui:uiGridListAddRow(GUIEditor.gridlist[1]), 2, tocolor(0, 255, 0, 255))
        else
          eui:uiGridListSetItemColor(GUIEditor.gridlist[1], eui:uiGridListAddRow(GUIEditor.gridlist[1]), 2, tocolor(255, 255, 255, 255))
          eui:uiGridListSetItemText(GUIEditor.gridlist[1], eui:uiGridListAddRow(GUIEditor.gridlist[1]), 2, "$" .. forvar6.price)
          eui:uiGridListSetItemColor(GUIEditor.gridlist[1], eui:uiGridListAddRow(GUIEditor.gridlist[1]), 1, tocolor(255, 255, 255, 255))
        end
        eui:uiGridListSetItemData(GUIEditor.gridlist[1], eui:uiGridListAddRow(GUIEditor.gridlist[1]), 1, {
          eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1),
          forvar5 - 1,
          forvar6.price,
          forvar6.required_stage,
          forvar6.data and forvar6.data.start_position,
          forvar6.data and forvar6.data.vehicle_model,
          forvar6.code
        })
      end
    end
  elseif source == TTGUI.button[2] then
    for forvar5 = 1, 6 do
      for forvar10 = 1, 3 do
        if eui:uiRadioButtonGetSelected(TTGUI.radiobutton[(forvar5 - 1) * 3 + forvar10]) and config.license_stages[currentLicenseType][var0 + 1].data.questions[eui:uiGetText(TTGUI.label[forvar5])][eui:uiGetText(TTGUI.radiobutton[(forvar5 - 1) * 3 + forvar10])] then
        end
      end
    end
    if 0 + 1 == 6 then
      eui:uiSetText(TTGUI.label[8], tostring(0 + 1) .. " correct answers out of 6")
      if 0 + 1 == 0 + 1 then
        eui:uiSetColor(TTGUI.label[8], 0, 255, 0)
        exports.notifications:output({
          en = "All answers are correct! move to the training test",
          ar = "\217\131\217\132 \216\167\217\132\216\165\216\172\216\167\216\168\216\167\216\170 \216\181\216\173\217\138\216\173\216\169! \216\167\217\134\216\170\217\130\217\132 \216\165\217\132\217\137 \216\167\217\132\216\170\216\175\216\177\217\138\216\168"
        }, 4000, "success")
      else
        eui:uiSetColor(TTGUI.label[8], 255, 255, 0)
      end
      setTimer(function(arg0)
        eui:uiSetVisible(TTGUI.window[1], false)
        if arg0 == 6 then
          triggerServerEvent("license:onFinishTraining", localPlayer, currentLicenseType, 0)
        end
      end, 2000, 1, 0 + 1)
    else
      eui:uiSetText(TTGUI.label[8], "Answer all questions")
      eui:uiSetColor(TTGUI.label[8], 255, 0, 0)
    end
  end
end)
addEventHandler("onClientUIDoubleClick", root, function()
  if source == GUIEditor.gridlist[1] and eui:uiGridListGetSelectedItem(source) ~= -1 then
    triggerServerEvent("license:startTraining", localPlayer, eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1)[1], eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1)[2], eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1)[7])
    eui:uiSetVisible(GUIEditor.window[1], false)
  end
end)
addEvent("license:showPedInteraction", true)
addEventHandler("license:showPedInteraction", root, function(arg0)
  cache_trainings = arg0
  eui:uiSetVisible(GUIEditor.window[1], true)
  eui:uiGridListClear(GUIEditor.gridlist[1])
  eui:uiGridListClear(GUIEditor.gridlist.license_types)
  for forvar4, forvar5 in ipairs(config.license_types) do
    eui:uiGridListSetItemText(GUIEditor.gridlist.license_types, eui:uiGridListAddRow(GUIEditor.gridlist.license_types), 1, forvar5 .. " Driving License")
    eui:uiGridListSetItemData(GUIEditor.gridlist.license_types, eui:uiGridListAddRow(GUIEditor.gridlist.license_types), 1, forvar5)
  end
end)
function HitTrainingStreet(arg0)
  if var0[source] then
    return
  end
  if arg0 ~= localPlayer then
    return
  end
  if isElement(EndPoint) then
    destroyElement(EndPoint)
  end
  EndPoint = createMarker(807.74755859375, -1756.6557617188, 11.887375831604, "cylinder", 2.5, 255, 0, 0, 150)
  if isTimer(HitStreetTimer) then
    killTimer(HitStreetTimer)
  end
end
function HitEndPoint(arg0)
  if arg0 == localPlayer and source == EndPoint then
    triggerServerEvent("license:onFinishTraining", localPlayer, currentLicenseType, var0)
    exports.notifications:output({
      en = "The training was successfully complete",
      ar = "\216\170\217\133 \216\167\217\132\216\167\217\134\216\170\217\135\216\167\216\161 \217\133\217\134 \216\167\217\132\216\170\216\175\216\177\217\138\216\168 \216\168\217\134\216\172\216\167\216\173"
    }, 8000, "success")
    cancelDrivingTraining("finish")
  end
end
function LeaveTrainingStreet(arg0)
  if arg0 ~= localPlayer then
    return
  end
  if var0[source] then
    return
  end
  cancelDrivingTraining()
end
function createTrafficLights()
  for forvar3, forvar4 in ipairs(var0) do
    if math.abs(unpack(forvar4) - unpack(forvar4)) > math.abs(unpack(forvar4) - unpack(forvar4)) then
      var1[createColPolygon(unpack(forvar4))] = true
    else
      var1[createColPolygon(unpack(forvar4))] = true
    end
  end
end
function deleteTrafficLights()
  for forvar3, forvar4 in pairs(var0) do
    destroyElement(forvar3)
  end
  var0 = {}
end
function CheckTrafficLights(arg0)
  if not var0[source] then
    return
  end
  if getElementType(arg0) ~= "player" then
    return
  end
  if arg0 ~= localPlayer then
    return
  end
  if getElementRotation(arg0) >= 45 and getElementRotation(arg0) < 135 then
    if getTrafficLightState() == 0 or getTrafficLightState() == 1 or getTrafficLightState() == 2 then
      outputChatBox("You didn't notice the traffic lights", 255, 0, 0)
      exports.notifications:output({
        en = "You didn't notice the traffic lights",
        ar = "\216\163\217\134\216\170 \217\132\217\133 \216\170\217\132\216\167\216\173\216\184 \216\165\216\180\216\167\216\177\216\167\216\170 \216\167\217\132\217\133\216\177\217\136\216\177"
      }, 8000, "error")
      cancelDrivingTraining()
    end
  elseif getElementRotation(arg0) >= 135 and getElementRotation(arg0) < 225 then
    if getTrafficLightState() == 2 or getTrafficLightState() == 3 or getTrafficLightState() == 4 then
      outputChatBox("You didn't notice the traffic lights", 255, 0, 0)
      exports.notifications:output({
        en = "You didn't notice the traffic lights",
        ar = "\216\163\217\134\216\170 \217\132\217\133 \216\170\217\132\216\167\216\173\216\184 \216\165\216\180\216\167\216\177\216\167\216\170 \216\167\217\132\217\133\216\177\217\136\216\177"
      }, 8000, "error")
      cancelDrivingTraining()
    end
  elseif getElementRotation(arg0) >= 225 and getElementRotation(arg0) < 315 then
    if getTrafficLightState() == 0 or getTrafficLightState() == 1 or getTrafficLightState() == 2 then
      outputChatBox("You didn't notice the traffic lights", 255, 0, 0)
      exports.notifications:output({
        en = "You didn't notice the traffic lights",
        ar = "\216\163\217\134\216\170 \217\132\217\133 \216\170\217\132\216\167\216\173\216\184 \216\165\216\180\216\167\216\177\216\167\216\170 \216\167\217\132\217\133\216\177\217\136\216\177"
      }, 8000, "error")
      cancelDrivingTraining()
    end
  elseif (getElementRotation(arg0) >= 315 or getElementRotation(arg0) < 45) and (getTrafficLightState() == 2 or getTrafficLightState() == 3 or getTrafficLightState() == 4) then
    outputChatBox("You didn't notice the traffic lights", 255, 0, 0)
    exports.notifications:output({
      en = "You didn't notice the traffic lights",
      ar = "\216\163\217\134\216\170 \217\132\217\133 \216\170\217\132\216\167\216\173\216\184 \216\165\216\180\216\167\216\177\216\167\216\170 \216\167\217\132\217\133\216\177\217\136\216\177"
    }, 8000, "error")
    cancelDrivingTraining()
  end
end
function startDrivingTraining(arg0, arg1)
  currentLicenseType = arg1
  var0 = arg0
  if config.license_stages[arg1][arg0 + 1].code == "theoretical_test" then
    eui:uiSetVisible(TTGUI.window[1], true)
    for forvar8, forvar9 in pairs(config.license_stages[arg1][arg0 + 1].data.questions) do
      if 1 <= 6 then
        eui:uiSetText(TTGUI.label[1], tostring(forvar8))
        for forvar14, forvar15 in pairs(forvar9) do
          eui:uiSetText(TTGUI.radiobutton[(1 - 1) * 3 + 1], tostring(forvar14))
        end
      else
        break
      end
    end
    eui:uiSetText(TTGUI.label[8], "")
  else
    var1 = true
    if config.license_stages[arg1][arg0 + 1].data.street_polygon then
      if isElement(street_polygon) then
        setElementDimension(street_polygon, getElementDimension(localPlayer))
      else
        street_polygon = createColPolygon(unpack(config.license_stages[arg1][arg0 + 1].data.street_polygon))
        setColPolygonHeight(street_polygon, unpack(config.license_stages[arg1][arg0 + 1].data.street_polygon_height))
        setElementDimension(street_polygon, getElementDimension(localPlayer))
      end
      addEventHandler("onClientColShapeHit", resourceRoot, HitTrainingStreet)
      addEventHandler("onClientColShapeLeave", resourceRoot, LeaveTrainingStreet)
      addEventHandler("onClientHUDRender", root, DrawStreetLines)
    end
    if config.license_stages[arg1][arg0 + 1].data.points then
      current_checkpoint_index = 0
      nextCheckpoint()
      addEventHandler("onClientMarkerHit", root, HitCheckpoint)
    end
    addEventHandler("onClientVehicleDamage", root, VehicleDamage)
    if config.license_stages[arg1][arg0 + 1].data.enable_traffic_lights then
      createTrafficLights()
      addEventHandler("onClientColShapeHit", resourceRoot, CheckTrafficLights)
    end
    addEventHandler("onClientMarkerHit", root, HitEndPoint)
    addEventHandler("onClientVehicleExit", resourceRoot, ExitVehicle)
    addEventHandler("onClientElementDestroy", resourceRoot, DestroyVehicle)
    addEventHandler("onClientPlayerQuitFromCharacter", localPlayer, QuitCharacter)
    if isTimer(HitStreetTimer) then
      killTimer(HitStreetTimer)
    end
    HitStreetTimer = setTimer(function(arg0)
      cancelDrivingTraining()
    end, 300000, 1, arg0)
    if config.license_stages[arg1][arg0 + 1].instruction and config.license_stages[arg1][arg0 + 1].instruction ~= "" then
      exports.notifications:sendNotification("#00FF00" .. config.license_stages[arg1][arg0 + 1].name.en, config.license_stages[arg1][arg0 + 1].instruction, 15000, true, "center")
    end
  end
end
function nextCheckpoint()
  current_checkpoint_index = current_checkpoint_index + 1
  if isElement(current_checkpoint) then
    destroyElement(current_checkpoint)
    current_checkpoint = nil
  end
  if config.license_stages[currentLicenseType][var0 + 1].data.points and config.license_stages[currentLicenseType][var0 + 1].data.points[current_checkpoint_index] then
    current_checkpoint = createMarker(config.license_stages[currentLicenseType][var0 + 1].data.points[current_checkpoint_index][1], config.license_stages[currentLicenseType][var0 + 1].data.points[current_checkpoint_index][2], config.license_stages[currentLicenseType][var0 + 1].data.points[current_checkpoint_index][3], config.license_stages[currentLicenseType][var0 + 1].data.marker_type, config.license_stages[currentLicenseType][var0 + 1].data.marker_size or 4, 255, 0, 0, 255)
    setElementDimension(current_checkpoint, getElementDimension(localPlayer))
    if current_checkpoint_index == #config.license_stages[currentLicenseType][var0 + 1].data.points then
      setMarkerIcon(current_checkpoint, "finish")
    elseif config.license_stages[currentLicenseType][var0 + 1].data.points[current_checkpoint_index + 1] then
      setMarkerIcon(current_checkpoint, "arrow")
      setMarkerTarget(current_checkpoint, config.license_stages[currentLicenseType][var0 + 1].data.points[current_checkpoint_index + 1][1], config.license_stages[currentLicenseType][var0 + 1].data.points[current_checkpoint_index + 1][2], config.license_stages[currentLicenseType][var0 + 1].data.points[current_checkpoint_index + 1][3])
    end
    return true
  elseif current_checkpoint_index >= #config.license_stages[currentLicenseType][var0 + 1].data.points then
    return false
  end
end
function HitCheckpoint(arg0)
  if arg0 ~= localPlayer then
    return
  end
  if source == current_checkpoint then
    if not isPedInVehicle(arg0) then
      return
    end
    if not nextCheckpoint() then
      triggerServerEvent("license:onFinishTraining", localPlayer, currentLicenseType, var0)
      exports.notifications:output({
        en = "The training was successfully complete",
        ar = "\216\170\217\133 \216\167\217\132\216\167\217\134\216\170\217\135\216\167\216\161 \217\133\217\134 \216\167\217\132\216\170\216\175\216\177\217\138\216\168 \216\168\217\134\216\172\216\167\216\173"
      }, 8000, "success")
      cancelDrivingTraining("finish")
    end
  end
end
function cancelDrivingTraining(arg0)
  var0 = false
  if isTimer(HitStreetTimer) then
    killTimer(HitStreetTimer)
  end
  setPedControlState(localPlayer, "handbrake", true)
  setTimer(setPedControlState, 1000, 1, localPlayer, "handbrake", false)
  if isElement(street_polygon) then
    destroyElement(street_polygon)
  end
  street_polygon = nil
  removeEventHandler("onClientColShapeHit", resourceRoot, HitTrainingStreet)
  removeEventHandler("onClientColShapeLeave", resourceRoot, LeaveTrainingStreet)
  removeEventHandler("onClientVehicleDamage", root, VehicleDamage)
  removeEventHandler("onClientColShapeHit", resourceRoot, CheckTrafficLights)
  deleteTrafficLights()
  removeEventHandler("onClientHUDRender", root, DrawStreetLines)
  if isElement(EndPoint) then
    destroyElement(EndPoint)
  end
  EndPoint = nil
  removeEventHandler("onClientMarkerHit", root, HitCheckpoint)
  removeEventHandler("onClientMarkerHit", root, HitEndPoint)
  removeEventHandler("onClientVehicleExit", resourceRoot, ExitVehicle)
  removeEventHandler("onClientElementDestroy", resourceRoot, DestroyVehicle)
  removeEventHandler("onClientPlayerQuitFromCharacter", localPlayer, QuitCharacter)
  triggerServerEvent("license:onCancelDrivingTraining", localPlayer, currentLicenseType, var1, config.license_stages[currentLicenseType][var1 + 1].code, arg0)
  var1 = false
end
addEvent("onClientPlayerQuitFromCharacter", true)
function QuitCharacter(arg0)
  cancelDrivingTraining("QuitFromCharacter")
end
function ExitVehicle(arg0)
  if arg0 == localPlayer and getElementData(source, "DrivingTrainingVehicle") and getElementData(source, "DrivingTrainingVehicle") == localPlayer then
    cancelDrivingTraining()
  end
end
function DestroyVehicle()
  if getElementData(source, "DrivingTrainingVehicle") and getElementData(source, "DrivingTrainingVehicle") == localPlayer and getVehicleController(source) == localPlayer then
    cancelDrivingTraining()
  end
end
addEvent("license:startDrivingTraining", true)
addEventHandler("license:startDrivingTraining", getRootElement(), function(arg0, arg1)
  startDrivingTraining(arg1, arg0)
end)
function VehicleDamage(arg0, arg1, arg2)
  if isPedInVehicle(localPlayer) and getPedOccupiedVehicle(localPlayer) == source and arg2 >= 5 then
    cancelDrivingTraining()
  end
end
addEvent("onClientUseItem", true)
addEventHandler("onClientUseItem", root, function(arg0, arg1, arg2)
  if arg2.Type == "Card" and string.find(arg2.Name, "License", 1, true) then
    exports.notifications:sendNotification("#00FF00" .. tostring(arg2.Name), "#FFFFFF- Personal ID: " .. tostring(arg2.SpecialProperties.ID) .. [[

- Name: ]] .. tostring(arg2.SpecialProperties.Name), 5000)
  end
end)
function isPlayerHaveLicense(arg0, arg1)
  if not getElementData(arg0, "character:id") then
    return false
  end
  for forvar7, forvar8 in ipairs((exports["inventory-system"]:getInventoryItems("character:" .. tostring((getElementData(arg0, "character:id")))))) do
    if forvar8.Name == tostring(arg1) .. " License" and forvar8.SpecialProperties.ID == getElementData(arg0, "character:id") then
      return true
    end
  end
  return false
end
street1 = {
  1139.671,
  -1682.394,
  1144.754,
  -1687.312,
  1144.453,
  -1702.761,
  1143.314,
  -1705.583,
  1139.914,
  -1707.057,
  1047.163,
  -1706.797,
  1045.559,
  -1706.411,
  1044.276,
  -1705.577,
  1043.083,
  -1704.109,
  1042.706,
  -1701.847,
  1042.905,
  -1581.773,
  1044.176,
  -1579.176,
  1047.409,
  -1577.485,
  1190.752,
  -1577.392,
  1200.25,
  -1572.328,
  1201.385,
  -1562.681,
  1201.728,
  -1410.98,
  1199.585,
  -1400.584,
  1186.37,
  -1390.353,
  1071.932,
  -1390.466,
  1030.458,
  -1390.308,
  807.2509,
  -1390.449,
  794.7265,
  -1394.681,
  790.8271,
  -1401.735,
  792.2587,
  -1435.039,
  791.4326,
  -1456.289,
  786.0976,
  -1490.098,
  770.2587,
  -1548.954,
  766.0097,
  -1577.869,
  765.8007,
  -1583.654,
  767.8144,
  -1588.767,
  773.3037,
  -1591.647,
  781.6474,
  -1591.821,
  798.0888,
  -1593.39,
  812.8125,
  -1599.069,
  826.9052,
  -1610.71,
  828.0585,
  -1614.052,
  826.6513,
  -1617.09,
  813.8496,
  -1632.093,
  806.4599,
  -1648.535,
  804.8505,
  -1667.279,
  805.0292,
  -1759.583
}
street2 = {
  1145.12,
  -1668.188,
  1150.083,
  -1668.5,
  1149.999,
  -1712.022,
  1043.124,
  -1712.32,
  1037.447,
  -1709.749,
  1037.295,
  -1581.953,
  1038.093,
  -1576.052,
  1042.519,
  -1572.425,
  1189.17,
  -1572.408,
  1195.18,
  -1567.497,
  1196.097,
  -1562.51,
  1196.19,
  -1415.776,
  1192.975,
  -1405.877,
  1185.073,
  -1400.583,
  1069.062,
  -1400.769,
  805.3388,
  -1400.435,
  798.915,
  -1405.79,
  797.038,
  -1415.684,
  797.2773,
  -1435.653,
  796.6679,
  -1457.11,
  791.6748,
  -1489.954,
  775.4375,
  -1551.068,
  771.6806,
  -1576.35,
  772.5498,
  -1581.517,
  776.5449,
  -1586.491,
  798.916,
  -1588.095,
  815.664,
  -1594.514,
  831.8515,
  -1607.884,
  833.9628,
  -1613.67,
  831.1015,
  -1620.223,
  818.3603,
  -1634.759,
  811.6181,
  -1649.744,
  810.3564,
  -1665.046,
  810.3349,
  -1759.564
}
function DrawStreetLines()
  for forvar3 = 1, #street1, 2 do
    nx2, ny2 = street1[forvar3], street1[forvar3 + 1]
    if street1[forvar3 + 2] and street1[forvar3 + 3] then
      nx2, ny2 = street1[forvar3 + 2], street1[forvar3 + 3]
    end
    dxDrawLine3D(street1[forvar3], street1[forvar3 + 1], var0, nx2, ny2, var0, tocolor(255, 0, 0, 255), 8)
    dxDrawLine3D(street1[forvar3], street1[forvar3 + 1], var0 + 1, nx2, ny2, var0 + 1, tocolor(255, 0, 0, 255), 8)
  end
  for forvar3 = #_FOR_, 1, -2 do
    nx2, ny2 = street2[forvar3 - 1], street2[forvar3]
    if street2[forvar3 - 2] and street2[forvar3 - 3] then
      nx2, ny2 = street2[forvar3 - 3], street2[forvar3 - 2]
    end
    dxDrawLine3D(street2[forvar3 - 1], street2[forvar3], var0, nx2, ny2, var0, tocolor(255, 0, 0, 255), 8)
    dxDrawLine3D(street2[forvar3 - 1], street2[forvar3], var0 + 1, nx2, ny2, var0 + 1, tocolor(255, 0, 0, 255), 8)
  end
end
