-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

addEvent("onClientElementMenuClick", true)
addEventHandler("onClientElementMenuClick", root, function(arg0, arg1, arg2)
  if arg1 == "Mechanic Panel" then
    if not isElement(arg0) then
      return
    end
    if getElementType(arg0) == "vehicle" then
      if getVehicleType(arg0) ~= "BMX" and getVehicleType(arg0) ~= "Boat" and getVehicleType(arg0) ~= "Bike" and getVehicleType(arg0) ~= "Quad" and isVehicleLocked(arg0) then
        return
      end
      if getDistanceBetweenPoints3D(getElementPosition(localPlayer)) <= 6 then
        showMechanicPanel(arg0)
      end
    end
  end
end)
UI = {
  tab = {},
  progressbar = {},
  edit = {},
  window = {},
  label = {},
  checkbox = {},
  switch = {},
  button = {},
  tabpanel = {},
  radiobutton = {},
  gridlist = {},
  memo = {},
  scrollbar = {},
  combobox = {}
}
function UIKitReady()
  eui = exports.UIKit
  UI.window[1] = eui:uiCreateWindow(false, false, 250, 338, "Mechanic Panel")
  eui:uiSetVisible(UI.window[1], false)
  UI.gridlist[1] = eui:uiCreateGridList(5, 35, 240, 260, tocolor(10, 10, 10, 0), UI.window[1])
  eui:uiGridListAddColumn(UI.gridlist[1], "Menu", 0.8)
  eui:uiGridListAddColumn(UI.gridlist[1], "", 0.2)
  eui:uiSetAlign(UI.gridlist[1], "left", "center")
  UI.button[2] = eui:uiCreateButton(5, 303, 240, 30, {en = "Close", ar = "\216\165\216\186\217\132\216\167\217\130"}, _, UI.window[1])
end
addEventHandler("onClientUIReady", resourceRoot, UIKitReady)
addEventHandler("onClientUIKitReady", root, UIKitReady)
function closeUIWindows(arg0)
  eui:uiSetVisible(UI.window[1], false)
  showCursor(false)
end
addEvent("onClientPlayerQuitFromCharacter", true)
addEventHandler("onClientPlayerQuitFromCharacter", localPlayer, closeUIWindows)
addEventHandler("onClientPlayerWasted", localPlayer, closeUIWindows)
function showMechanicPanel(arg0)
  var0 = arg0
  eui:uiSetVisible(UI.window[1], true)
  openMainSection()
end
addEventHandler("onClientUIClick", root, function()
  if source == UI.button[2] then
    eui:uiSetVisible(UI.window[1], false)
  elseif source == UI.gridlist[1] and eui:uiGridListGetSelectedItem(source) ~= -1 and split(var0.currentPath, "/")[#split(var0.currentPath, "/")] == "Repaint" then
    currentSelectedColor = {
      255,
      255,
      255
    }
    colorPicker.openSelect()
  end
end)
addEventHandler("onClientUIDoubleClick", root, function()
  if source == UI.gridlist[1] and eui:uiGridListGetSelectedItem(source) ~= -1 then
    if eui:uiGridListGetItemText(source, eui:uiGridListGetSelectedItem(source), 1) == "..." then
      split(var1.currentPath, "/")[#split(var1.currentPath, "/")] = nil
      var1.currentPath = table.concat(split(var1.currentPath, "/"), "/")
      if (split(var1.currentPath, "/")[#split(var1.currentPath, "/")] or "") == "" then
        openMainSection()
      elseif (split(var1.currentPath, "/")[#split(var1.currentPath, "/")] or "") == "Upgrades" then
        showUpgradesInList()
      end
    elseif eui:uiGridListGetItemText(source, eui:uiGridListGetSelectedItem(source), 1) == "Upgrades" then
      var1.currentPath = var1.currentPath .. "/" .. eui:uiGridListGetItemText(source, eui:uiGridListGetSelectedItem(source), 1)
      showUpgradesInList()
    elseif eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1) == "upgrade-slot" then
      showVehicleUpgradesBySlot((eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 2)))
      var1.currentPath = var1.currentPath .. "/sub-upgrades"
    elseif type((eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1))) == "table" and eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1).type == "upgrade" then
      if eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1).current then
        triggerServerEvent("mechanic:removeUpgrade", localPlayer, var0, tonumber(eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1).value), tonumber(eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1).price))
      else
        triggerServerEvent("mechanic:addUpgrade", localPlayer, var0, tonumber(eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1).value), tonumber(eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1).price))
      end
    elseif var1.currentPath == "" then
      var1.currentPath = var1.currentPath .. "/" .. eui:uiGridListGetItemText(source, eui:uiGridListGetSelectedItem(source), 1)
      eui:uiGridListClear(UI.gridlist[1])
      eui:uiGridListSetItemText(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 1, "...")
      if eui:uiGridListGetItemText(source, eui:uiGridListGetSelectedItem(source), 1) == "Repair" then
        if getVehicleDoorState(var0, 0) + getVehicleDoorState(var0, 1) + getVehicleDoorState(var0, 2) + getVehicleDoorState(var0, 3) + getVehicleDoorState(var0, 4) + getVehicleDoorState(var0, 5) + getVehiclePanelState(var0, 0) + getVehiclePanelState(var0, 1) + getVehiclePanelState(var0, 2) + getVehiclePanelState(var0, 3) + getVehiclePanelState(var0, 4) + getVehiclePanelState(var0, 5) + getVehiclePanelState(var0, 6) ~= 0 then
          eui:uiGridListSetItemText(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 1, "Body")
          eui:uiGridListSetItemText(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 2, "$" .. tostring((math.floor(getVehicleDoorState(var0, 0) * 100 + getVehicleDoorState(var0, 1) * 100 + getVehicleDoorState(var0, 2) * 100 + getVehicleDoorState(var0, 3) * 100 + getVehicleDoorState(var0, 4) * 100 + getVehicleDoorState(var0, 5) * 100 + getVehiclePanelState(var0, 0) * 100 + getVehiclePanelState(var0, 1) * 100 + getVehiclePanelState(var0, 2) * 100 + getVehiclePanelState(var0, 3) * 100 + getVehiclePanelState(var0, 4) * 100 + getVehiclePanelState(var0, 5) * 100 + getVehiclePanelState(var0, 6) * 100))))
          eui:uiGridListSetItemData(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 2, {
            (math.floor(getVehicleDoorState(var0, 0) * 100 + getVehicleDoorState(var0, 1) * 100 + getVehicleDoorState(var0, 2) * 100 + getVehicleDoorState(var0, 3) * 100 + getVehicleDoorState(var0, 4) * 100 + getVehicleDoorState(var0, 5) * 100 + getVehiclePanelState(var0, 0) * 100 + getVehiclePanelState(var0, 1) * 100 + getVehiclePanelState(var0, 2) * 100 + getVehiclePanelState(var0, 3) * 100 + getVehiclePanelState(var0, 4) * 100 + getVehiclePanelState(var0, 5) * 100 + getVehiclePanelState(var0, 6) * 100))
          })
        end
        if getElementHealth(var0) < 1000 then
          eui:uiGridListSetItemText(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 1, "Engine")
          eui:uiGridListSetItemText(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 2, "$" .. tostring((math.floor((1 - getElementHealth(var0) / 1000) * 2000))))
          eui:uiGridListSetItemData(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 2, {
            (math.floor((1 - getElementHealth(var0) / 1000) * 2000))
          })
        end
        for forvar26, forvar27 in ipairs({
          {
            "Front left wheel",
            getVehicleWheelStates(var0)
          },
          {
            "Front right wheel",
            getVehicleWheelStates(var0)
          },
          {
            "Rear left wheel",
            getVehicleWheelStates(var0)
          },
          {
            "Rear right wheel",
            getVehicleWheelStates(var0)
          }
        }) do
          if forvar27[2] ~= 0 then
            eui:uiGridListSetItemText(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 1, forvar27[1])
            eui:uiGridListSetItemText(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 2, "$" .. tostring(forvar27[2] * 50))
            eui:uiGridListSetItemData(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 2, {
              forvar27[2] * 50,
              forvar26
            })
          end
        end
      elseif eui:uiGridListGetItemText(source, eui:uiGridListGetSelectedItem(source), 1) == "Repaint" then
        currentSelectedColor = {
          255,
          255,
          255
        }
        colorPicker.openSelect()
        for forvar9 = 1, 4 do
          eui:uiGridListSetItemText(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 1, "Color " .. tostring(forvar9))
          eui:uiGridListSetItemText(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 2, "\226\128\162\226\128\162\226\128\162")
        end
        eui:uiGridListSetItemText(UI.gridlist[1], _FOR_:uiGridListAddRow(UI.gridlist[1]), 1, "Change Colors")
        eui:uiGridListSetItemText(UI.gridlist[1], _FOR_:uiGridListAddRow(UI.gridlist[1]), 2, "$1000")
        eui:uiGridListSetItemColor(UI.gridlist[1], 1, 2, tocolor(getVehicleColor(var0, true)))
        eui:uiGridListSetItemColor(UI.gridlist[1], 2, 2, tocolor(getVehicleColor(var0, true)))
        eui:uiGridListSetItemColor(UI.gridlist[1], 3, 2, tocolor(getVehicleColor(var0, true)))
        eui:uiGridListSetItemColor(UI.gridlist[1], 4, 2, tocolor(getVehicleColor(var0, true)))
      elseif eui:uiGridListGetItemText(source, eui:uiGridListGetSelectedItem(source), 1) == "Replace Lights" then
        currentSelectedColor = {
          255,
          255,
          255
        }
        colorPicker.openSelect()
        eui:uiGridListSetItemText(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 1, "Change Color")
        eui:uiGridListSetItemText(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 2, "$1500")
      end
    else
      if isElement(var0) then
        if 6 < getDistanceBetweenPoints3D(getElementPosition(localPlayer)) then
          eui:uiSetVisible(UI.window[1], false)
          return
        end
      else
        eui:uiSetVisible(UI.window[1], false)
        return
      end
      if split(var1.currentPath, "/")[#split(var1.currentPath, "/")] == "Repair" then
        if getPlayerMoney(localPlayer) >= eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 2)[1] then
          eui:uiGridListRemoveRow(source, (eui:uiGridListGetSelectedItem(source)))
        end
        if eui:uiGridListGetItemText(source, eui:uiGridListGetSelectedItem(source), 1) == "Body" then
          triggerServerEvent("mechanic:repairBody", localPlayer, var0)
        elseif eui:uiGridListGetItemText(source, eui:uiGridListGetSelectedItem(source), 1) == "Engine" then
          triggerServerEvent("mechanic:repairEngine", localPlayer, var0)
        else
          triggerServerEvent("mechanic:repairWheels", localPlayer, var0, eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 2)[2])
        end
      elseif split(var1.currentPath, "/")[#split(var1.currentPath, "/")] == "Repaint" then
        if eui:uiGridListGetItemText(source, eui:uiGridListGetSelectedItem(source), 1) == "Change Colors" then
          triggerServerEvent("mechanic:changeVehicleColor", localPlayer, var0, eui:uiGridListGetItemColor(UI.gridlist[1], 1, 2))
        end
      elseif split(var1.currentPath, "/")[#split(var1.currentPath, "/")] == "Replace Lights" then
        triggerServerEvent("mechanic:changeLightsColor", localPlayer, var0, unpack(currentSelectedColor))
      end
    end
  end
end)
function openMainSection()
  eui:uiGridListClear(UI.gridlist[1])
  for forvar3, forvar4 in ipairs(var0.main_section) do
    eui:uiGridListSetItemText(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 1, tostring(forvar4))
  end
  var0.currentPath = ""
end
function showUpgradesInList()
  eui:uiGridListClear(UI.gridlist[1])
  eui:uiGridListSetItemText(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 1, "...")
  for forvar3 = 0, 16 do
    if 0 < #getUpgradesFromSectionName(forvar3) then
      eui:uiGridListSetItemText(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 1, tostring((getVehicleUpgradeSlotName(forvar3))))
      eui:uiGridListSetItemData(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 1, "upgrade-slot")
      eui:uiGridListSetItemText(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 2, "(" .. #getUpgradesFromSectionName(forvar3) .. ")  \226\158\157")
      eui:uiGridListSetItemData(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 2, forvar3)
    end
  end
end
function showVehicleUpgradesBySlot(arg0)
  eui:uiGridListClear(UI.gridlist[1])
  eui:uiGridListSetItemText(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 1, "...")
  for forvar6, forvar7 in ipairs((getVehicleCompatibleUpgrades(var0, arg0))) do
    eui:uiGridListSetItemText(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 1, veh_upgrades[tostring(forvar7)].name)
    eui:uiGridListSetItemData(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 1, {
      type = "upgrade",
      value = forvar7,
      price = veh_upgrades[tostring(forvar7)].price,
      current = forvar7 == getVehicleUpgradeOnSlot(var0, arg0)
    })
    eui:uiGridListSetItemText(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 2, "$" .. veh_upgrades[tostring(forvar7)].price)
    if forvar7 == getVehicleUpgradeOnSlot(var0, arg0) then
      eui:uiGridListSetItemColor(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 1, tocolor(0, 255, 0))
      eui:uiGridListSetItemColor(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 2, tocolor(0, 255, 0))
    end
  end
end
function getUpgradesFromSectionName(arg0)
  if isElement(var0) then
    for forvar6, forvar7 in pairs(getVehicleCompatibleUpgrades(var0, arg0)) do
      table.insert({}, {
        forvar7,
        1,
        3500
      })
    end
  end
  return {}
end
veh_upgrades = {}
addEventHandler("onClientResourceStart", resourceRoot, function()
  if xmlLoadFile("upgrades.xml") then
    for forvar4, forvar5 in ipairs(xmlNodeGetChildren((xmlLoadFile("upgrades.xml")))) do
      veh_upgrades[xmlNodeGetAttribute(forvar5, "id")] = {
        name = xmlNodeGetAttribute(forvar5, "name"),
        price = xmlNodeGetAttribute(forvar5, "price") or 2000
      }
    end
    xmlUnloadFile((xmlLoadFile("upgrades.xml")))
  end
  fileDelete("upgrades.xml")
end)
