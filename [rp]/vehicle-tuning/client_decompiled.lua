-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

UI = {
  window = {},
  label = {},
  button = {},
  gridlist = {},
  progressbar = {},
  labelValue = {},
  rangeslider = {}
}
function UIKitReady()
  eui = exports.UIKit
  UI.window[1] = eui:uiCreateWindow(20, false, 280, 450, {
    en = "Vehicles Tuning",
    ar = "\216\182\216\168\216\183 \216\167\217\132\217\133\216\177\217\131\216\168\216\167\216\170"
  }, _, ":assets/icons/car.png")
  eui:uiSetVisible(UI.window[1], false)
  eui:uiWindowSetMovable(UI.window[1], false)
  UI.button[1] = eui:uiCreateButton(10, 365, 260, 35, {en = "Purchase", ar = "\216\180\216\177\216\167\216\161"}, "primary", UI.window[1])
  UI.button[2] = eui:uiCreateButton(10, 405, 260, 35, {en = "Close", ar = "\216\165\216\186\217\132\216\167\217\130"}, _, UI.window[1])
  eui:uiSetVisible(UI.button[1], false)
  eui:uiSetProperty(UI.button[2], "HoverTextColor", tocolor(255, 48, 48))
  UI.gridlist[1] = eui:uiCreateGridList(10, 50, 260, 295, tocolor(10, 10, 10, 0), UI.window[1])
  eui:uiGridListAddColumn(UI.gridlist[1], "Option", 0.6)
  eui:uiGridListAddColumn(UI.gridlist[1], "", 0.4)
  eui:uiSetAlign(UI.gridlist[1], "left", "center")
  eui:uiSetProperty(UI.gridlist[1], "row_height", 25)
  UI.window[2] = eui:uiCreateRectangle(eui:uiGetReferenceScreenSize() - 280 - 20, false, 280, 400, tocolor(15, 15, 15, 240), true, true, true, true)
  eui:uiSetVisible(UI.window[2], false)
  for forvar6, forvar7 in ipairs({
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
    eui:uiCreateLabel(20, 20 + 55 * (forvar6 - 1), 240, 20, forvar7, tocolor(255, 255, 255, 255), "left", "top", UI.window[2])
    UI.labelValue[forvar6] = eui:uiCreateLabel(20, 20 + 55 * (forvar6 - 1), 240, 20, "-", tocolor(255, 255, 255, 255), "right", "top", UI.window[2])
    if forvar7.progress then
      UI.progressbar[forvar6] = eui:uiCreateProgressBar(20, 20 + 55 * (forvar6 - 1) + 30, 240, 5, tocolor(0, 150, 255, 240), UI.window[2])
      eui:uiSetProperty(UI.progressbar[forvar6], "background_color", tocolor(30, 30, 30, 255))
      eui:uiSetProperty(UI.progressbar[forvar6], "show_progress", false)
    end
  end
  showSections()
  handlings = {
    {
      label = "Max Speed (km/h)",
      property = "maxVelocity",
      min = 80,
      max = 380,
      step = 20
    },
    {
      label = "Acceleration",
      property = "engineAcceleration",
      min = 1,
      max = 50,
      step = 1
    },
    {
      label = "Engine Inertia",
      property = "engineInertia",
      min = -1000,
      max = 1000,
      step = 10
    },
    {
      label = "Supension Height",
      property = "suspensionLowerLimit",
      min = -50,
      max = 50,
      step = 1
    },
    {
      label = "Supension Bias",
      property = "suspensionFrontRearBias",
      min = 0,
      max = 1,
      step = 0.01
    },
    {
      label = "Supension Force",
      property = "suspensionForceLevel",
      min = 0,
      max = 100,
      step = 1
    },
    {
      label = "Supension Damping",
      property = "suspensionDamping",
      min = 0,
      max = 100,
      step = 1
    },
    {
      label = "Steering Lock",
      property = "steeringLock",
      min = 0,
      max = 360,
      step = 1
    },
    {
      label = "Drag Coefficiency",
      property = "dragCoeff",
      min = -200,
      max = 200,
      step = 1
    },
    {
      label = "Braking Power",
      property = "brakeDeceleration",
      min = 1,
      max = 100,
      step = 1
    },
    {
      label = "Braking Bias",
      property = "brakeBias",
      min = 0,
      max = 1,
      step = 0.01
    },
    {
      label = "Traction Multiplier",
      property = "tractionMultiplier",
      min = -100000,
      max = 100000,
      step = 10
    },
    {
      label = "Traction Bias",
      property = "tractionBias",
      min = 0,
      max = 1,
      step = 0.01
    }
  }
  UI.window[3] = eui:uiCreateWindow(20, false, 300, 700, "Vehicles Handling", _, ":assets/icons/car.png")
  eui:uiSetVisible(UI.window[3], false)
  for forvar7, forvar8 in ipairs(handlings) do
    UI.rangeslider[forvar8.property] = eui:uiCreateRangeSlider(20, 30, 260, 40, forvar8.label, "primary", tocolor(30, 30, 30), true, UI.window[3])
    eui:uiSetProperty(UI.rangeslider[forvar8.property], "min_value", forvar8.min)
    eui:uiSetProperty(UI.rangeslider[forvar8.property], "max_value", forvar8.max)
    eui:uiSetProperty(UI.rangeslider[forvar8.property], "step_size", forvar8.step)
  end
end
addEventHandler("onClientUIReady", resourceRoot, UIKitReady)
addEvent("onClientUIKitReady", true)
addEventHandler("onClientUIKitReady", root, UIKitReady)
function closeUIWindows(arg0)
  eui:uiSetVisible(UI.window[1], false)
  eui:uiSetVisible(UI.window[2], false)
  showCursor(false)
end
addEvent("onClientPlayerQuitFromCharacter", true)
addEventHandler("onClientPlayerQuitFromCharacter", localPlayer, closeUIWindows)
addEventHandler("onClientPlayerWasted", localPlayer, closeUIWindows)
function showSections()
  eui:uiGridListClear(UI.gridlist[1])
  for forvar3, forvar4 in ipairs(var0) do
    eui:uiGridListSetItemText(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 1, forvar4.name)
    eui:uiGridListSetItemData(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 1, "section")
    eui:uiGridListSetItemColor(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 1, tocolor(255, 255, 255, 255))
  end
  eui:uiSetVisible(UI.button[1], false)
  eui:uiSetVisible(UI.window[2], false)
  var1 = "sections"
end
function showEngines()
  eui:uiGridListClear(UI.gridlist[1])
  eui:uiGridListSetItemText(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 1, "...")
  for forvar4, forvar5 in ipairs(Engines) do
    eui:uiGridListSetItemText(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 1, forvar5.name)
    eui:uiGridListSetItemText(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 2, "$" .. formatNumber(forvar5.price))
    eui:uiGridListSetItemData(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 1, forvar4)
    eui:uiGridListSetItemColor(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 1, tocolor(255, 255, 255, 255))
    eui:uiGridListSetItemColor(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 2, tocolor(0, 220, 0, 255))
  end
  eui:uiSetVisible(UI.button[1], true)
  eui:uiSetVisible(UI.window[2], true)
end
function showTinting()
  eui:uiGridListClear(UI.gridlist[1])
  eui:uiGridListSetItemText(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 1, "...")
  for forvar4, forvar5 in ipairs({
    {
      name = "Add vehicle tinting",
      price = 20000
    },
    {
      name = "Remove vehicle tinting",
      price = 5000
    }
  }) do
    eui:uiGridListSetItemText(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 1, forvar5.name)
    eui:uiGridListSetItemText(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 2, "$" .. formatNumber(forvar5.price))
    eui:uiGridListSetItemData(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 1, forvar5.price)
    eui:uiGridListSetItemColor(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 1, tocolor(255, 255, 255, 255))
    eui:uiGridListSetItemColor(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 2, tocolor(0, 220, 0, 255))
  end
  eui:uiSetVisible(UI.button[1], true)
  eui:uiSetVisible(UI.window[2], false)
end
function showBackfire()
  eui:uiGridListClear(UI.gridlist[1])
  eui:uiGridListSetItemText(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 1, "...")
  for forvar4, forvar5 in ipairs({
    {
      name = "Add Back-fire",
      price = 500000
    },
    {
      name = "Remove Back-fire",
      price = 5000
    }
  }) do
    eui:uiGridListSetItemText(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 1, forvar5.name)
    eui:uiGridListSetItemText(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 2, "$" .. formatNumber(forvar5.price))
    eui:uiGridListSetItemData(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 1, forvar5.price)
    eui:uiGridListSetItemColor(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 1, tocolor(255, 255, 255, 255))
    eui:uiGridListSetItemColor(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 2, tocolor(0, 220, 0, 255))
  end
  eui:uiSetVisible(UI.button[1], true)
  eui:uiSetVisible(UI.window[2], false)
end
function showLockReplacement()
  eui:uiGridListClear(UI.gridlist[1])
  eui:uiGridListSetItemText(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 1, "...")
  for forvar4, forvar5 in ipairs({
    {
      name = "Replace the lock",
      price = 10000
    }
  }) do
    eui:uiGridListSetItemText(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 1, forvar5.name)
    eui:uiGridListSetItemText(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 2, "$" .. formatNumber(forvar5.price))
    eui:uiGridListSetItemData(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 1, forvar5.price)
    eui:uiGridListSetItemColor(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 1, tocolor(255, 255, 255, 255))
    eui:uiGridListSetItemColor(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 2, tocolor(0, 220, 0, 255))
  end
  eui:uiSetVisible(UI.button[1], true)
  eui:uiSetVisible(UI.window[2], false)
end
neon_list = {
  {
    name = "Remove Neon",
    price = 1000
  },
  {name = "Red Neon", price = 50000},
  {name = "Blue Neon", price = 50000},
  {name = "Green Neon", price = 50000},
  {
    name = "Yellow Neon",
    price = 50000
  },
  {name = "Pink Neon", price = 50000},
  {name = "White Neon", price = 50000}
}
function showNeon()
  eui:uiGridListClear(UI.gridlist[1])
  eui:uiGridListSetItemText(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 1, "...")
  for forvar4, forvar5 in ipairs(neon_list) do
    eui:uiGridListSetItemText(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 1, forvar5.name)
    eui:uiGridListSetItemText(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 2, "$" .. formatNumber(forvar5.price))
    eui:uiGridListSetItemData(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 1, forvar5.price)
    eui:uiGridListSetItemColor(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 1, tocolor(255, 255, 255, 255))
    eui:uiGridListSetItemColor(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 2, tocolor(0, 220, 0, 255))
  end
  eui:uiSetVisible(UI.button[1], true)
  eui:uiSetVisible(UI.window[2], false)
end
addEventHandler("onClientUIDoubleClick", root, function()
  if source == UI.gridlist[1] and eui:uiGridListGetSelectedItem(UI.gridlist[1]) ~= -1 then
    if var0 == "sections" then
      var0 = eui:uiGridListGetItemText(UI.gridlist[1], eui:uiGridListGetSelectedItem(UI.gridlist[1]), 1)
      if eui:uiGridListGetItemText(UI.gridlist[1], eui:uiGridListGetSelectedItem(UI.gridlist[1]), 1) == "Engines" then
        showEngines()
      elseif eui:uiGridListGetItemText(UI.gridlist[1], eui:uiGridListGetSelectedItem(UI.gridlist[1]), 1) == "Vehicle Tinting" then
        showTinting()
      elseif eui:uiGridListGetItemText(UI.gridlist[1], eui:uiGridListGetSelectedItem(UI.gridlist[1]), 1) == "Neon" then
        showNeon()
      elseif eui:uiGridListGetItemText(UI.gridlist[1], eui:uiGridListGetSelectedItem(UI.gridlist[1]), 1) == "Back-fire" then
        showBackfire()
      elseif eui:uiGridListGetItemText(UI.gridlist[1], eui:uiGridListGetSelectedItem(UI.gridlist[1]), 1) == "Lock Replacement" then
        showLockReplacement()
      end
    elseif eui:uiGridListGetSelectedItem(UI.gridlist[1]) == 0 then
      showSections()
    end
  end
end)
addEventHandler("onClientUIClick", root, function()
  if source == UI.gridlist[1] then
    if eui:uiGridListGetSelectedItem(UI.gridlist[1]) ~= -1 then
      if var0 == "Engines" then
        if eui:uiGridListGetItemData(UI.gridlist[1], eui:uiGridListGetSelectedItem(UI.gridlist[1]), 1) then
          eui:uiSetText(UI.labelValue[1], tostring(Engines[eui:uiGridListGetItemData(UI.gridlist[1], eui:uiGridListGetSelectedItem(UI.gridlist[1]), 1)].handling.maxVelocity) .. "  km/h")
          eui:uiSetText(UI.labelValue[2], tostring(Engines[eui:uiGridListGetItemData(UI.gridlist[1], eui:uiGridListGetSelectedItem(UI.gridlist[1]), 1)].handling.engineAcceleration) .. "  m/s2")
          eui:uiSetText(UI.labelValue[3], tostring(Engines[eui:uiGridListGetItemData(UI.gridlist[1], eui:uiGridListGetSelectedItem(UI.gridlist[1]), 1)].handling.engineInertia) .. "  kg m2")
          eui:uiSetText(UI.labelValue[4], tostring(Engines[eui:uiGridListGetItemData(UI.gridlist[1], eui:uiGridListGetSelectedItem(UI.gridlist[1]), 1)].handling.driveType))
          eui:uiSetText(UI.labelValue[5], tostring(Engines[eui:uiGridListGetItemData(UI.gridlist[1], eui:uiGridListGetSelectedItem(UI.gridlist[1]), 1)].handling.engineType))
          eui:uiProgressBarSetProgress(UI.progressbar[1], Engines[eui:uiGridListGetItemData(UI.gridlist[1], eui:uiGridListGetSelectedItem(UI.gridlist[1]), 1)].handling.maxVelocity / 360 * 100)
          eui:uiProgressBarSetProgress(UI.progressbar[2], Engines[eui:uiGridListGetItemData(UI.gridlist[1], eui:uiGridListGetSelectedItem(UI.gridlist[1]), 1)].handling.engineAcceleration / 100 * 100)
        end
      elseif var0 == "Neon" and eui:uiGridListGetSelectedItem(UI.gridlist[1]) ~= -1 and var1 then
        if getElementData(var1, "customModel") then
        end
        if neon_vehicles[560] then
          removeNeon(var1)
          if 1 < eui:uiGridListGetSelectedItem(UI.gridlist[1]) then
            addNeon(var1, eui:uiGridListGetSelectedItem(UI.gridlist[1]) - 1)
          end
        else
          exports.notifications:output({
            en = "You cannot install neon lights on this vehicle",
            ar = "\217\132\216\167 \217\138\217\133\217\131\217\134\217\131 \216\170\216\177\217\131\217\138\216\168 \216\182\217\136\216\161 \216\167\217\132\217\134\217\138\217\136\217\134 \216\185\217\132\217\137 \217\135\216\176\217\135 \216\167\217\132\216\179\217\138\216\167\216\177\216\169"
          }, 3000, "error")
        end
      end
    end
  elseif source == UI.button[1] then
    if eui:uiGridListGetSelectedItem(UI.gridlist[1]) ~= -1 then
      if var0 == "Engines" then
        if not getPedOccupiedVehicle(localPlayer) then
          return
        end
        if getVehicleType((getPedOccupiedVehicle(localPlayer))) == "Automobile" or getVehicleType((getPedOccupiedVehicle(localPlayer))) == "Monster Truck" then
          triggerServerEvent("vehtuning:engine:purchase", localPlayer, (eui:uiGridListGetItemData(UI.gridlist[1], eui:uiGridListGetSelectedItem(UI.gridlist[1]), 1)))
          eui:uiGridListSetSelectedItem(UI.gridlist[1], -1)
        else
          exports.notifications:output({
            en = "You can't tune this vehicle",
            ar = "\217\132\216\167\217\138\217\133\217\131\217\134 \216\170\216\185\216\175\217\138\217\132 \217\135\216\176\217\135 \216\167\217\132\217\133\216\177\217\131\216\168\216\169"
          }, 3000, "error")
        end
      elseif var0 == "Vehicle Tinting" then
        triggerServerEvent("vehtuning:tint:purchase", localPlayer, eui:uiGridListGetSelectedItem(UI.gridlist[1]) == 1 and "add" or "remove", (eui:uiGridListGetItemData(UI.gridlist[1], eui:uiGridListGetSelectedItem(UI.gridlist[1]), 1)))
        eui:uiGridListSetSelectedItem(UI.gridlist[1], -1)
      elseif var0 == "Neon" then
        if getElementData(var1, "customModel") then
        end
        if neon_vehicles[560] then
          triggerServerEvent("vehtuning:neon:purchase", localPlayer, eui:uiGridListGetSelectedItem(UI.gridlist[1]), (eui:uiGridListGetItemData(UI.gridlist[1], eui:uiGridListGetSelectedItem(UI.gridlist[1]), 1)))
        else
          exports.notifications:output({
            en = "You cannot install neon lights on this vehicle",
            ar = "\217\132\216\167 \217\138\217\133\217\131\217\134\217\131 \216\170\216\177\217\131\217\138\216\168 \216\182\217\136\216\161 \216\167\217\132\217\134\217\138\217\136\217\134 \216\185\217\132\217\137 \217\135\216\176\217\135 \216\167\217\132\217\133\216\177\217\131\216\168\216\169"
          }, 3000, "error")
        end
      elseif var0 == "Back-fire" then
        triggerServerEvent("vehtuning:backfire:purchase", localPlayer, eui:uiGridListGetSelectedItem(UI.gridlist[1]) == 1 and "add" or "remove", (eui:uiGridListGetItemData(UI.gridlist[1], eui:uiGridListGetSelectedItem(UI.gridlist[1]), 1)))
        eui:uiGridListSetSelectedItem(UI.gridlist[1], -1)
      elseif var0 == "Lock Replacement" then
        triggerServerEvent("vehtuning:replace_lock", localPlayer)
        eui:uiGridListSetSelectedItem(UI.gridlist[1], -1)
      end
    end
  elseif source == UI.button[2] then
    eui:uiSetVisible(UI.window[1], false)
    eui:uiSetVisible(UI.window[2], false)
    showCursor(false)
  end
end)
addEventHandler("onClientUIVisibilityChange", root, function(arg0)
  if not arg0 and source == UI.window[1] and var0 then
    removeNeon(var0)
    if getElementData(var0, "neon") and getElementData(var0, "neon")[2] == 1 then
      addNeon(var0, getElementData(var0, "neon")[1])
    end
    var0 = false
  end
end)
function formatNumber(arg0)
  while true do
    k = string.gsub(arg0, "^(-?%d+)(%d%d%d)", "%1,%2")
    if k == 0 then
      break
    end
  end
  return string.gsub(arg0, "^(-?%d+)(%d%d%d)", "%1,%2")
end
addEventHandler("onClientResourceStart", resourceRoot, function()
  for forvar3, forvar4 in ipairs(var0) do
    createMarker(unpack(forvar4.pos))
    setElementData(createBlip(unpack(forvar4.pos)), "blip:name", "\217\131\216\177\216\167\216\172 \216\170\216\185\216\175\217\138\217\132 \216\167\217\132\216\179\217\138\216\167\216\177\216\167\216\170")
  end
end)
addEventHandler("onClientMarkerHit", resourceRoot, function(arg0, arg1)
  if arg0 ~= localPlayer then
    return
  end
  if not arg1 then
    return
  end
  if isPedInVehicle(localPlayer) then
    if getPedOccupiedVehicleSeat(localPlayer) ~= 0 then
      return
    end
    if math.abs(getElementPosition(localPlayer) - getElementPosition(source)) > 5 then
      return
    end
    var0 = getPedOccupiedVehicle(localPlayer)
    if getVehicleType((getPedOccupiedVehicle(localPlayer))) == "BMX" then
      exports.notifications:output({
        en = "You can't tune this vehicle",
        ar = "\217\132\216\167\217\138\217\133\217\131\217\134 \216\170\216\185\216\175\217\138\217\132 \217\135\216\176\217\135 \216\167\217\132\217\133\216\177\217\131\216\168\216\169"
      }, 3000, "error")
      return
    end
    showSections()
    eui:uiSetVisible(UI.window[1], true)
    eui:uiSetVisible(UI.window[2], false)
    showCursor(true)
    setElementVelocity(getPedOccupiedVehicle(localPlayer), 0, 0, 0)
    setElementPosition(getPedOccupiedVehicle(localPlayer), getElementPosition(source))
    setElementAlpha(source, 0)
  else
    if math.abs(getElementPosition(localPlayer) - getElementPosition(source)) > 5 then
      return
    end
    exports.notifications:output({
      en = "You should be in a vehicle",
      ar = "\217\138\216\172\216\168 \216\163\217\134 \216\170\217\131\217\136\217\134 \217\129\217\138 \216\179\217\138\216\167\216\177\216\169"
    }, 3000, "error")
  end
end)
addEventHandler("onClientMarkerLeave", resourceRoot, function(arg0, arg1)
  if arg0 ~= localPlayer then
    return
  end
  eui:uiSetVisible(UI.window[1], false)
  eui:uiSetVisible(UI.window[2], false)
  showCursor(false)
  setElementAlpha(source, 150)
end)
neon_vehicles = {
  [400] = true,
  [401] = true,
  [402] = true,
  [403] = true,
  [404] = true,
  [405] = true,
  [409] = true,
  [410] = true,
  [415] = true,
  [411] = true,
  [412] = true,
  [413] = true,
  [415] = true,
  [416] = true,
  [418] = true,
  [419] = true,
  [420] = true,
  [421] = true,
  [422] = true,
  [423] = true,
  [426] = true,
  [428] = true,
  [429] = true,
  [431] = true,
  [434] = true,
  [436] = true,
  [437] = true,
  [438] = true,
  [439] = true,
  [440] = true,
  [442] = true,
  [445] = true,
  [446] = true,
  [451] = true,
  [458] = true,
  [459] = true,
  [466] = true,
  [467] = true,
  [470] = true,
  [474] = true,
  [475] = true,
  [477] = true,
  [479] = true,
  [480] = true,
  [482] = true,
  [483] = true,
  [489] = true,
  [490] = true,
  [491] = true,
  [492] = true,
  [494] = true,
  [495] = true,
  [496] = true,
  [498] = true,
  [499] = true,
  [500] = true,
  [502] = true,
  [503] = true,
  [504] = true,
  [505] = true,
  [506] = true,
  [507] = true,
  [508] = true,
  [516] = true,
  [517] = true,
  [518] = true,
  [525] = true,
  [526] = true,
  [527] = true,
  [528] = true,
  [529] = true,
  [533] = true,
  [534] = true,
  [535] = true,
  [536] = true,
  [540] = true,
  [541] = true,
  [542] = true,
  [543] = true,
  [545] = true,
  [546] = true,
  [547] = true,
  [549] = true,
  [550] = true,
  [551] = true,
  [552] = true,
  [554] = true,
  [555] = true,
  [558] = true,
  [559] = true,
  [560] = true,
  [561] = true,
  [562] = true,
  [565] = true,
  [566] = true,
  [567] = true,
  [575] = true,
  [576] = true,
  [579] = true,
  [580] = true,
  [582] = true,
  [585] = true,
  [587] = true,
  [588] = true,
  [589] = true,
  [596] = true,
  [597] = true,
  [598] = true,
  [599] = true,
  [600] = true,
  [602] = true,
  [603] = true,
  [604] = true,
  [605] = true,
  [609] = true
}
function addNeon(arg0, arg1)
  if not var0[arg0] then
    if not var1[arg1] then
      return
    end
    if not getElementPosition(arg0) or not getElementPosition(arg0) or not getElementPosition(arg0) then
      return
    end
    if getElementData(arg0, "customModel") then
    end
    if neon_vehicles[560] then
      setElementDimension(createObject(1940, getElementPosition(arg0)), (getElementDimension(arg0)))
      setElementInterior(createObject(1940, getElementPosition(arg0)), (getElementInterior(arg0)))
      setElementData(createObject(1940, getElementPosition(arg0)), "customModel", var1[arg1])
      setElementDimension(createObject(1940, getElementPosition(arg0)), (getElementDimension(arg0)))
      setElementInterior(createObject(1940, getElementPosition(arg0)), (getElementInterior(arg0)))
      setElementData(createObject(1940, getElementPosition(arg0)), "customModel", var1[arg1])
      if 560 == 401 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 0.9, 0, -0.55)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -0.9, 0, -0.55)
      elseif 560 == 411 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 0.95, 0, -0.63)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -0.95, 0, -0.63)
      elseif 560 == 416 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 0.9, 0, -0.7)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -0.9, 0, -0.7)
      elseif 560 == 422 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 0.85, 0, -0.66)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -0.85, 0, -0.66)
      elseif 560 == 429 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 0.9, 0, -0.51)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -0.9, 0, -0.51)
      elseif 560 == 445 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 0.95, 0, -0.55)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -0.95, 0, -0.55)
      elseif 560 == 459 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 0.8, 0, -0.78)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -0.8, 0, -0.78)
      elseif 560 == 498 or 560 == 609 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 1.1, 0, -0.7)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -1.1, 0, -0.7)
      elseif 560 == 499 or 560 == 498 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 0.8, 0, -0.6)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -0.8, 0, -0.6)
      elseif 560 == 504 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 0.95, 0, -0.55)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -0.95, 0, -0.55)
      elseif 560 == 575 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 0.9, 0, -0.38)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -0.9, 0, -0.38)
      elseif 560 == 535 or 560 == 536 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 0.95, 0, -0.6)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -0.95, 0, -0.6)
      elseif 560 == 496 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 0.85, 0, -0.5)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -0.85, 0, -0.5)
      elseif 560 == 602 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 0.95, 0, -0.6)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -0.95, 0, -0.6)
      elseif 560 == 518 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 0.95, 0.15, -0.5)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -0.95, 0.15, -0.5)
      elseif 560 == 402 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 1, 0, -0.63)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -1, 0, -0.63)
      elseif 560 == 541 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 0.9, 0, -0.45)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -0.9, 0, -0.45)
      elseif 560 == 482 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 0.95, 0.05, -0.82)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -0.95, 0.05, -0.82)
      elseif 560 == 438 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 0.95, 0, -0.72)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -0.95, 0, -0.72)
      elseif 560 == 527 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 0.92, 0.15, -0.47)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -0.92, 0.15, -0.47)
      elseif 560 == 483 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 0.85, 0.3, -0.8)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -0.85, 0.3, -0.8)
      elseif 560 == 431 or 560 == 437 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 1.3, 1.8, -0.77)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -1.3, 1.8, -0.77)
      elseif 560 == 415 or 560 == 542 or 560 == 466 or 560 == 604 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 0.9, 0, -0.57)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -0.9, 0, -0.57)
      elseif 560 == 589 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 0.92, 0.1, -0.43)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -0.92, 0.1, -0.43)
      elseif 560 == 480 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 0.72, 0, -0.53)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -0.72, 0, -0.53)
      elseif 560 == 507 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 1.1, 0, -0.65)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -1.1, 0, -0.65)
      elseif 560 == 562 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 0.95, 0.15, -0.48)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -0.95, 0.15, -0.48)
      elseif 560 == 419 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 0.97, 0.1, -0.61)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -0.97, 0.1, -0.61)
      elseif 560 == 587 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 1.05, -0.05, -0.61)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -1.05, -0.05, -0.61)
      elseif 560 == 490 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 0.9, 0.1, -0.66)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -0.9, 0.1, -0.66)
      elseif 560 == 528 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 0.9, 0.15, -0.59)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -0.9, 0.15, -0.59)
      elseif 560 == 533 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 0.93, 0, -0.51)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -0.93, 0, -0.51)
      elseif 560 == 565 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 0.83, 0, -0.47)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -0.83, 0, -0.47)
      elseif 560 == 526 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 0.93, 0, -0.61)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -0.93, 0, -0.61)
      elseif 560 == 492 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 0.93, 0, -0.5)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -0.93, 0, -0.5)
      elseif 560 == 588 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 1.4, 0, -0.71)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -1.4, 0, -0.71)
      elseif 560 == 434 then
        destroyElement(neon3)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 0, 0.85, -0.83)
      elseif 560 == 494 or 560 == 502 or 560 == 503 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 0.93, -0.07, -0.71)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -0.93, -0.07, -0.71)
      elseif 560 == 579 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 0.96, 0.05, -0.55)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -0.96, 0.05, -0.55)
      elseif 560 == 545 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 0.93, 0, -0.64)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -0.93, 0, -0.64)
      elseif 560 == 546 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 1, -0.1, -0.53)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -1, -0.1, -0.53)
      elseif 560 == 559 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 0.95, 0, -0.48)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -0.95, 0, -0.48)
      elseif 560 == 508 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 1.1, -0.4, -1.07)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -1.1, -0.4, -1.07)
      elseif 560 == 400 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 0.8, 0, -0.73)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -0.8, 0, -0.73)
      elseif 560 == 403 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 0.7, 1.75, -1.2)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -0.7, 1.75, -1.2)
      elseif 560 == 517 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 0.95, 0.1, -0.62)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -0.95, 0.1, -0.62)
      elseif 560 == 410 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 0.91, 0, -0.45)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -0.91, 0, -0.45)
      elseif 560 == 551 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 0.98, 0, -0.6)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -0.98, 0, -0.6)
      elseif 560 == 500 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 0.7, 0.2, -0.6)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -0.7, 0.2, -0.6)
      elseif 560 == 418 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 0.98, 0, -0.89)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -0.98, 0, -0.89)
      elseif 560 == 423 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 1, 0.2, -0.75)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -1, 0.2, -0.75)
      elseif 560 == 516 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 1, 0.2, -0.65)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -1, 0.2, -0.65)
      elseif 560 == 582 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 1, -0.15, -0.78)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -1, -0.15, -0.78)
      elseif 560 == 467 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 0.99, 0.15, -0.55)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -0.99, 0.15, -0.55)
      elseif 560 == 470 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 1.1, 0.02, -0.42)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -1.1, 0.02, -0.42)
      elseif 560 == 404 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 0.83, 0, -0.48)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -0.83, 0, -0.48)
      elseif 560 == 603 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 0.97, 0, -0.7)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -0.97, 0, -0.7)
      elseif 560 == 600 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 1, 0.15, -0.56)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -1, 0.15, -0.56)
      elseif 560 == 596 or 560 == 597 or 560 == 426 or 560 == 420 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 1, 0.2, -0.53)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -1, 0.2, -0.53)
      elseif 560 == 598 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 0.97, 0.1, -0.48)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -0.97, 0.1, -0.48)
      elseif 560 == 599 or 560 == 489 or 560 == 505 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 0.85, 0.1, -0.69)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -0.85, 0.1, -0.69)
      elseif 560 == 413 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 0.9, 0.1, -0.77)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -0.9, 0.1, -0.77)
      elseif 560 == 436 or 560 == 547 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 0.87, 0, -0.53)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -0.87, 0, -0.53)
      elseif 560 == 479 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 1, 0.15, -0.51)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -1, 0.15, -0.51)
      elseif 560 == 534 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 0.98, 0.3, -0.6)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -0.98, 0.3, -0.6)
      elseif 560 == 442 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 1.05, 0.15, -0.66)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -1.05, 0.15, -0.66)
      elseif 560 == 440 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 0.95, 0.15, -0.95)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -0.95, 0.15, -0.95)
      elseif 560 == 475 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 0.91, 0, -0.6)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -0.91, 0, -0.6)
      elseif 560 == 605 or 560 == 543 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 1, 0, -0.47)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -1, 0, -0.47)
      elseif 560 == 495 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 0.9, 0.15, -0.83)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -0.9, 0.15, -0.83)
      elseif 560 == 567 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 1.1, 0.25, -0.65)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -1.1, 0.25, -0.65)
      elseif 560 == 428 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 1.15, 0.1, -0.8)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -1.15, 0.1, -0.8)
      elseif 560 == 405 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 0.95, 0.1, -0.67)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -0.95, 0.1, -0.67)
      elseif 560 == 458 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 0.95, 0, -0.65)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -0.95, 0, -0.65)
      elseif 560 == 580 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 1.15, 0, -0.53)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -1.15, 0, -0.53)
      elseif 560 == 439 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 0.9, 0.15, -0.68)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -0.9, 0.15, -0.68)
      elseif 560 == 561 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 0.95, 0, -0.63)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -0.95, 0, -0.63)
      elseif 560 == 409 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 0.9, -1, -0.53)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -0.9, -1, -0.53)
      elseif 560 == 560 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 0.95, 0.05, -0.49)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -0.95, 0.05, -0.49)
      elseif 560 == 550 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 1.05, 0, -0.65)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -1.05, 0, -0.65)
      elseif 560 == 506 or 560 == 451 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 0.95, -0.15, -0.57)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -0.95, -0.15, -0.57)
      elseif 560 == 566 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 0.95, 0, -0.53)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -0.95, 0, -0.53)
      elseif 560 == 549 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 0.95, 0, -0.47)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -0.95, 0, -0.47)
      elseif 560 == 576 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 1.05, 0.05, -0.47)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -1.05, 0.05, -0.47)
      elseif 560 == 525 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 1.1, 0.05, -0.39)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -1.1, 0.05, -0.39)
      elseif 560 == 558 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 0.95, -0.05, -0.43)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -0.95, -0.05, -0.43)
      elseif 560 == 552 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 1.1, 0.45, -0.3)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -1.1, 0.45, -0.3)
      elseif 560 == 540 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 1.05, 0, -0.7)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -1.05, 0, -0.7)
      elseif 560 == 491 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 0.9, 0, -0.61)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -0.9, 0, -0.61)
      elseif 560 == 412 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 0.95, 0, -0.64)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -0.95, 0, -0.64)
      elseif 560 == 421 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 0.95, 0.1, -0.66)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -0.95, 0.1, -0.66)
      elseif 560 == 529 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 1, -0.05, -0.46)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -1, -0.05, -0.46)
      elseif 560 == 555 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 0.8, 0, -0.5)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -0.8, 0, -0.5)
      elseif 560 == 554 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 0.9, 0, -0.6)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -0.9, 0, -0.6)
      elseif 560 == 477 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 0.99, 0, -0.57)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -0.99, 0, -0.57)
      elseif 560 == 585 then
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, 1.05, 0, -0.42)
        attachElements(createObject(1940, getElementPosition(arg0)), arg0, -1.05, 0, -0.42)
      end
      var0[arg0] = {
        createObject(1940, getElementPosition(arg0)),
        (createObject(1940, getElementPosition(arg0)))
      }
    end
  end
end
function removeNeon(arg0)
  if var0[arg0] then
    for forvar5 = 1, #var0[arg0] do
      destroyElement(var0[arg0][forvar5])
    end
    _FOR_[arg0] = nil
  end
end
addEventHandler("onClientElementStreamIn", root, function()
  if getElementType(source) == "vehicle" and getElementData(source, "neon") and getElementData(source, "neon")[2] == 1 and getVehicleEngineState(source) then
    addNeon(source, getElementData(source, "neon")[1])
  end
end)
addEventHandler("onClientElementStreamOut", root, function()
  if getElementType(source) == "vehicle" and getElementData(source, "neon") then
    removeNeon(source)
  end
end)
addEventHandler("onClientElementDataChange", root, function(arg0, arg1, arg2)
  if arg0 == "neon" and getElementType(source) == "vehicle" and isElementStreamedIn(source) then
    if arg2 then
      if arg2[2] == 1 then
        if getVehicleEngineState(source) then
          addNeon(source, arg2[1])
        end
      else
        removeNeon(source)
      end
    else
      removeNeon(source)
    end
  end
end)
addEventHandler("onClientElementDimensionChange", root, function(arg0, arg1)
  if var0[source] then
    for forvar6 = 1, #var0[source] do
      setElementDimension(var0[source][forvar6], arg1)
    end
  end
end)
addEventHandler("onClientElementInteriorChange", root, function(arg0, arg1)
  if var0[source] then
    for forvar6 = 1, #var0[source] do
      setElementInterior(var0[source][forvar6], arg1)
    end
  end
end)
addEventHandler("onClientElementDestroy", root, function()
  if var0[source] then
    removeNeon(source)
  end
end)
addEventHandler("onClientResourceStart", resourceRoot, function()
  for forvar3, forvar4 in ipairs(var0) do
    if not isGarageOpen(forvar4[1]) then
      setGarageOpen(forvar4[1], true)
    end
  end
  for forvar3, forvar4 in ipairs({
    8,
    11,
    12,
    19,
    32,
    36,
    40,
    41,
    47
  }) do
    if not isGarageOpen(forvar4) then
      setGarageOpen(forvar4, true)
    end
    setColPolygonHeight(createColPolygon(getGarageBoundingBox(forvar4)), getGaragePosition(forvar4))
    var1[createColPolygon(getGarageBoundingBox(forvar4))] = forvar4
  end
end)
addEventHandler("onClientColShapeHit", resourceRoot, function(arg0)
  if arg0 ~= localPlayer then
    return
  end
  if not var0[source] then
    return
  end
  if not isPedInVehicle(arg0) then
    return
  end
  if getVehicleController((getPedOccupiedVehicle(localPlayer))) ~= arg0 then
    return
  end
  if getVehicleController((getPedOccupiedVehicle(localPlayer))) == localPlayer and isVehicleOnGround((getPedOccupiedVehicle(localPlayer))) then
    if math.floor(getVehicleDoorState(getPedOccupiedVehicle(localPlayer), 0) * 50 + getVehicleDoorState(getPedOccupiedVehicle(localPlayer), 1) * 50 + getVehicleDoorState(getPedOccupiedVehicle(localPlayer), 2) * 50 + getVehicleDoorState(getPedOccupiedVehicle(localPlayer), 3) * 50 + getVehicleDoorState(getPedOccupiedVehicle(localPlayer), 4) * 50 + getVehicleDoorState(getPedOccupiedVehicle(localPlayer), 5) * 50 + getVehiclePanelState(getPedOccupiedVehicle(localPlayer), 0) * 25 + getVehiclePanelState(getPedOccupiedVehicle(localPlayer), 1) * 25 + getVehiclePanelState(getPedOccupiedVehicle(localPlayer), 2) * 25 + getVehiclePanelState(getPedOccupiedVehicle(localPlayer), 3) * 25 + getVehiclePanelState(getPedOccupiedVehicle(localPlayer), 4) * 25 + getVehiclePanelState(getPedOccupiedVehicle(localPlayer), 5) * 25 + getVehiclePanelState(getPedOccupiedVehicle(localPlayer), 6) * 25 + getVehicleWheelStates((getPedOccupiedVehicle(localPlayer))) * 80 + getVehicleWheelStates((getPedOccupiedVehicle(localPlayer))) * 80 + getVehicleWheelStates((getPedOccupiedVehicle(localPlayer))) * 80 + getVehicleWheelStates((getPedOccupiedVehicle(localPlayer))) * 80 + (1000 - getElementHealth((getPedOccupiedVehicle(localPlayer)))) / 10 * 0.5 - (getVehicleDoorState(getPedOccupiedVehicle(localPlayer), 0) * 50 + getVehicleDoorState(getPedOccupiedVehicle(localPlayer), 1) * 50 + getVehicleDoorState(getPedOccupiedVehicle(localPlayer), 2) * 50 + getVehicleDoorState(getPedOccupiedVehicle(localPlayer), 3) * 50 + getVehicleDoorState(getPedOccupiedVehicle(localPlayer), 4) * 50 + getVehicleDoorState(getPedOccupiedVehicle(localPlayer), 5) * 50 + getVehiclePanelState(getPedOccupiedVehicle(localPlayer), 0) * 25 + getVehiclePanelState(getPedOccupiedVehicle(localPlayer), 1) * 25 + getVehiclePanelState(getPedOccupiedVehicle(localPlayer), 2) * 25 + getVehiclePanelState(getPedOccupiedVehicle(localPlayer), 3) * 25 + getVehiclePanelState(getPedOccupiedVehicle(localPlayer), 4) * 25 + getVehiclePanelState(getPedOccupiedVehicle(localPlayer), 5) * 25 + getVehiclePanelState(getPedOccupiedVehicle(localPlayer), 6) * 25 + getVehicleWheelStates((getPedOccupiedVehicle(localPlayer))) * 80 + getVehicleWheelStates((getPedOccupiedVehicle(localPlayer))) * 80 + getVehicleWheelStates((getPedOccupiedVehicle(localPlayer))) * 80 + getVehicleWheelStates((getPedOccupiedVehicle(localPlayer))) * 80 + (1000 - getElementHealth((getPedOccupiedVehicle(localPlayer)))) / 10 * 0.5) * getMembershipRepairDiscount()) == 0 then
      exports.notifications:output({
        en = "Your vehicle does not need to repair",
        ar = "\217\133\216\177\217\131\216\168\216\170\217\131 \217\132\216\167 \216\170\216\173\216\170\216\167\216\172 \216\165\217\132\217\137 \216\165\216\181\217\132\216\167\216\173"
      }, 3000, "warning")
    else
      bindKey("R", "down", BindFixVehicle, source)
      exports.notifications:showKeyDescription("vehicle:fix", "R", "Fix your vehicle #00FF00$" .. tostring((math.floor(getVehicleDoorState(getPedOccupiedVehicle(localPlayer), 0) * 50 + getVehicleDoorState(getPedOccupiedVehicle(localPlayer), 1) * 50 + getVehicleDoorState(getPedOccupiedVehicle(localPlayer), 2) * 50 + getVehicleDoorState(getPedOccupiedVehicle(localPlayer), 3) * 50 + getVehicleDoorState(getPedOccupiedVehicle(localPlayer), 4) * 50 + getVehicleDoorState(getPedOccupiedVehicle(localPlayer), 5) * 50 + getVehiclePanelState(getPedOccupiedVehicle(localPlayer), 0) * 25 + getVehiclePanelState(getPedOccupiedVehicle(localPlayer), 1) * 25 + getVehiclePanelState(getPedOccupiedVehicle(localPlayer), 2) * 25 + getVehiclePanelState(getPedOccupiedVehicle(localPlayer), 3) * 25 + getVehiclePanelState(getPedOccupiedVehicle(localPlayer), 4) * 25 + getVehiclePanelState(getPedOccupiedVehicle(localPlayer), 5) * 25 + getVehiclePanelState(getPedOccupiedVehicle(localPlayer), 6) * 25 + getVehicleWheelStates((getPedOccupiedVehicle(localPlayer))) * 80 + getVehicleWheelStates((getPedOccupiedVehicle(localPlayer))) * 80 + getVehicleWheelStates((getPedOccupiedVehicle(localPlayer))) * 80 + getVehicleWheelStates((getPedOccupiedVehicle(localPlayer))) * 80 + (1000 - getElementHealth((getPedOccupiedVehicle(localPlayer)))) / 10 * 0.5 - (getVehicleDoorState(getPedOccupiedVehicle(localPlayer), 0) * 50 + getVehicleDoorState(getPedOccupiedVehicle(localPlayer), 1) * 50 + getVehicleDoorState(getPedOccupiedVehicle(localPlayer), 2) * 50 + getVehicleDoorState(getPedOccupiedVehicle(localPlayer), 3) * 50 + getVehicleDoorState(getPedOccupiedVehicle(localPlayer), 4) * 50 + getVehicleDoorState(getPedOccupiedVehicle(localPlayer), 5) * 50 + getVehiclePanelState(getPedOccupiedVehicle(localPlayer), 0) * 25 + getVehiclePanelState(getPedOccupiedVehicle(localPlayer), 1) * 25 + getVehiclePanelState(getPedOccupiedVehicle(localPlayer), 2) * 25 + getVehiclePanelState(getPedOccupiedVehicle(localPlayer), 3) * 25 + getVehiclePanelState(getPedOccupiedVehicle(localPlayer), 4) * 25 + getVehiclePanelState(getPedOccupiedVehicle(localPlayer), 5) * 25 + getVehiclePanelState(getPedOccupiedVehicle(localPlayer), 6) * 25 + getVehicleWheelStates((getPedOccupiedVehicle(localPlayer))) * 80 + getVehicleWheelStates((getPedOccupiedVehicle(localPlayer))) * 80 + getVehicleWheelStates((getPedOccupiedVehicle(localPlayer))) * 80 + getVehicleWheelStates((getPedOccupiedVehicle(localPlayer))) * 80 + (1000 - getElementHealth((getPedOccupiedVehicle(localPlayer)))) / 10 * 0.5) * getMembershipRepairDiscount()))))
      exports.notifications:sendNotification("#00FF00Fix Vehicle", "The cost of repairing the vehicle: #00FF00$" .. tostring((math.floor(getVehicleDoorState(getPedOccupiedVehicle(localPlayer), 0) * 50 + getVehicleDoorState(getPedOccupiedVehicle(localPlayer), 1) * 50 + getVehicleDoorState(getPedOccupiedVehicle(localPlayer), 2) * 50 + getVehicleDoorState(getPedOccupiedVehicle(localPlayer), 3) * 50 + getVehicleDoorState(getPedOccupiedVehicle(localPlayer), 4) * 50 + getVehicleDoorState(getPedOccupiedVehicle(localPlayer), 5) * 50 + getVehiclePanelState(getPedOccupiedVehicle(localPlayer), 0) * 25 + getVehiclePanelState(getPedOccupiedVehicle(localPlayer), 1) * 25 + getVehiclePanelState(getPedOccupiedVehicle(localPlayer), 2) * 25 + getVehiclePanelState(getPedOccupiedVehicle(localPlayer), 3) * 25 + getVehiclePanelState(getPedOccupiedVehicle(localPlayer), 4) * 25 + getVehiclePanelState(getPedOccupiedVehicle(localPlayer), 5) * 25 + getVehiclePanelState(getPedOccupiedVehicle(localPlayer), 6) * 25 + getVehicleWheelStates((getPedOccupiedVehicle(localPlayer))) * 80 + getVehicleWheelStates((getPedOccupiedVehicle(localPlayer))) * 80 + getVehicleWheelStates((getPedOccupiedVehicle(localPlayer))) * 80 + getVehicleWheelStates((getPedOccupiedVehicle(localPlayer))) * 80 + (1000 - getElementHealth((getPedOccupiedVehicle(localPlayer)))) / 10 * 0.5 - (getVehicleDoorState(getPedOccupiedVehicle(localPlayer), 0) * 50 + getVehicleDoorState(getPedOccupiedVehicle(localPlayer), 1) * 50 + getVehicleDoorState(getPedOccupiedVehicle(localPlayer), 2) * 50 + getVehicleDoorState(getPedOccupiedVehicle(localPlayer), 3) * 50 + getVehicleDoorState(getPedOccupiedVehicle(localPlayer), 4) * 50 + getVehicleDoorState(getPedOccupiedVehicle(localPlayer), 5) * 50 + getVehiclePanelState(getPedOccupiedVehicle(localPlayer), 0) * 25 + getVehiclePanelState(getPedOccupiedVehicle(localPlayer), 1) * 25 + getVehiclePanelState(getPedOccupiedVehicle(localPlayer), 2) * 25 + getVehiclePanelState(getPedOccupiedVehicle(localPlayer), 3) * 25 + getVehiclePanelState(getPedOccupiedVehicle(localPlayer), 4) * 25 + getVehiclePanelState(getPedOccupiedVehicle(localPlayer), 5) * 25 + getVehiclePanelState(getPedOccupiedVehicle(localPlayer), 6) * 25 + getVehicleWheelStates((getPedOccupiedVehicle(localPlayer))) * 80 + getVehicleWheelStates((getPedOccupiedVehicle(localPlayer))) * 80 + getVehicleWheelStates((getPedOccupiedVehicle(localPlayer))) * 80 + getVehicleWheelStates((getPedOccupiedVehicle(localPlayer))) * 80 + (1000 - getElementHealth((getPedOccupiedVehicle(localPlayer)))) / 10 * 0.5) * getMembershipRepairDiscount()))) .. [[

Press 'R' to fix your vehicle]], 4000, true, "center")
    end
  end
end)
function getMembershipRepairDiscount()
  if exports.hud:isHudItemExists("special_membership:Premium") then
  elseif exports.hud:isHudItemExists("special_membership:Plus") then
  elseif exports.hud:isHudItemExists("special_membership:Classic") then
  end
  if exports.hud:isHudItemExists("special_membership:Booster") then
  end
  return math.min(1, (20 + 10) / 100)
end
addEventHandler("onClientColShapeLeave", resourceRoot, function(arg0)
  if arg0 ~= localPlayer then
    return
  end
  if not var0[source] then
    return
  end
  unbindKey("R", "down", BindFixVehicle)
  exports.notifications:hideKeyDescription("vehicle:fix")
  triggerLatentServerEvent("spraygarage:leave", localPlayer)
end)
function BindFixVehicle(arg0, arg1, arg2)
  unbindKey("R", "down", BindFixVehicle)
  exports.notifications:hideKeyDescription("vehicle:fix")
  if isPedInVehicle(localPlayer) then
    triggerServerEvent("vehicles:fixVehicleInSprayColShape", localPlayer, var0[arg2])
  end
end
