-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

GUIEditor = {
  checkbox = {},
  label = {},
  radiobutton = {},
  button = {},
  window = {},
  edit = {},
  gridlist = {}
}
addEventHandler("onClientResourceStart", resourceRoot, function()
  GUIEditor.window[1] = guiCreateWindow((guiGetScreenSize() - 421) / 2, (guiGetScreenSize() - 310) / 2, 421, 310, "Remote Dispatch Device", false)
  guiWindowSetSizable(GUIEditor.window[1], false)
  guiSetVisible(GUIEditor.window[1], false)
  GUIEditor.gridlist[1] = guiCreateGridList(9, 26, 403, 175, false, GUIEditor.window[1])
  guiGridListAddColumn(GUIEditor.gridlist[1], "Callsign", 0.3)
  guiGridListAddColumn(GUIEditor.gridlist[1], "Full name", 0.3)
  guiGridListAddColumn(GUIEditor.gridlist[1], "Availability", 0.3)
  GUIEditor.label[1] = guiCreateLabel(10, 208, 401, 15, "Status:", false, GUIEditor.window[1])
  GUIEditor.radiobutton[1] = guiCreateRadioButton(49, 0, 107, 15, "On duty", false, GUIEditor.label[1])
  guiSetProperty(GUIEditor.radiobutton[1], "NormalTextColour", "FF00FF00")
  guiRadioButtonSetSelected(GUIEditor.radiobutton[1], true)
  GUIEditor.radiobutton[2] = guiCreateRadioButton(156, 0, 107, 15, "Off duty", false, GUIEditor.label[1])
  guiSetProperty(GUIEditor.radiobutton[2], "NormalTextColour", "FFFF0000")
  GUIEditor.label[2] = guiCreateLabel(10, 235, 52, 20, "Call sign:", false, GUIEditor.window[1])
  GUIEditor.label[3] = guiCreateLabel(192, 235, 59, 20, "Availability:", false, GUIEditor.window[1])
  GUIEditor.edit[1] = guiCreateEdit(62, 234, 120, 21, "", false, GUIEditor.window[1])
  guiSetAlpha(GUIEditor.edit[1], 0.8)
  GUIEditor.edit[2] = guiCreateEdit(256, 234, 129, 21, "", false, GUIEditor.window[1])
  guiSetAlpha(GUIEditor.edit[2], 0.8)
  GUIEditor.button[1] = guiCreateButton(10, 271, 132, 29, "Update", false, GUIEditor.window[1])
  GUIEditor.label[4] = guiCreateLabel(10, 250, 401, 15, "__________________________________________________________________________", false, GUIEditor.window[1])
  guiSetAlpha(GUIEditor.label[4], 0.3)
  guiSetProperty(GUIEditor.label[4], "Disabled", "True")
  GUIEditor.button[2] = guiCreateButton(147, 271, 132, 29, "Close", false, GUIEditor.window[1])
  GUIEditor.checkbox[1] = guiCreateCheckBox(292, 278, 109, 15, "Joint Operations", false, false, GUIEditor.window[1])
end)
function dispatchCMD()
  guiSetVisible(GUIEditor.window[1], not guiGetVisible(GUIEditor.window[1]))
  if guiGetVisible(GUIEditor.window[1]) then
    guiGridListClear(GUIEditor.gridlist[1])
    for forvar3, forvar4 in ipairs(getElementsByType("player")) do
      if getElementData(forvar4, "dispatch") and unpack((getElementData(forvar4, "dispatch"))) == "On duty" then
        guiGridListSetItemText(GUIEditor.gridlist[1], guiGridListAddRow(GUIEditor.gridlist[1]), 1, tostring(unpack((getElementData(forvar4, "dispatch")))), false, false)
        guiGridListSetItemText(GUIEditor.gridlist[1], guiGridListAddRow(GUIEditor.gridlist[1]), 2, tostring(unpack((getElementData(forvar4, "dispatch")))), false, false)
        guiGridListSetItemText(GUIEditor.gridlist[1], guiGridListAddRow(GUIEditor.gridlist[1]), 3, tostring(unpack((getElementData(forvar4, "dispatch")))), false, false)
      end
    end
    var0 = localPlayer
    guiSetText(GUIEditor.edit[1], unpack(getElementData(var0, "dispatch") or {}) or "")
    guiSetText(GUIEditor.edit[2], unpack(getElementData(var0, "dispatch") or {}) or "")
    guiRadioButtonSetSelected(GUIEditor.radiobutton[1], unpack(getElementData(var0, "dispatch") or {}) == "On duty")
    guiRadioButtonSetSelected(GUIEditor.radiobutton[2], unpack(getElementData(var0, "dispatch") or {}) == "Off duty")
  end
end
addEventHandler("onClientGUIClick", resourceRoot, function()
  if source == GUIEditor.button[2] then
    guiSetVisible(GUIEditor.window[1], false)
  elseif source == GUIEditor.button[1] then
    guiSetVisible(GUIEditor.window[1], false)
    if (guiRadioButtonGetSelected(GUIEditor.radiobutton[1]) and "On duty" or "Off duty") == "On duty" then
      triggerServerEvent("dispatch:set", localPlayer, 1, guiGetText(GUIEditor.edit[1]), (guiGetText(GUIEditor.edit[2])))
      exports.radar:setRadarDispatchElements(var0)
    elseif (guiRadioButtonGetSelected(GUIEditor.radiobutton[1]) and "On duty" or "Off duty") == "Off duty" then
      triggerServerEvent("dispatch:set", localPlayer, 0)
      exports.radar:setRadarDispatchElements({})
    end
  end
end)
addEvent("dispatch:show", true)
addEventHandler("dispatch:show", root, function(arg0)
  dispatchCMD()
end)
addEventHandler("onClientElementStreamIn", root, function()
  if getElementType(source) ~= "player" then
    return
  end
  if getElementData(source, "dispatch") then
    var0[source] = true
    if getElementData(localPlayer, "dispatch") then
      exports.radar:setRadarDispatchElements(var0)
    end
  end
end)
addEventHandler("onClientPlayerQuit", root, function()
  var0[source] = nil
  if getElementData(localPlayer, "dispatch") then
    exports.radar:setRadarDispatchElements(var0)
  end
end)
addEventHandler("onClientElementDataChange", root, function(arg0, arg1, arg2)
  if arg0 ~= "dispatch" then
    return
  end
  if getElementType(source) ~= "player" then
    return
  end
  if not arg1 and arg2 then
    var0[source] = true
    if getElementData(localPlayer, "dispatch") then
      exports.radar:setRadarDispatchElements(var0)
    end
  end
  if source == localPlayer then
    if not arg1 and arg2 then
      checkDispatch(true)
    elseif not arg2 then
      checkDispatch(false)
    end
  end
end)
addEventHandler("onClientResourceStart", resourceRoot, function()
  for forvar3, forvar4 in ipairs(getElementsByType("player")) do
    if getElementData(forvar4, "dispatch") then
      var0[forvar4] = true
      exports.radar:setRadarDispatchElements(var0)
    end
  end
  checkDispatch(true)
end)
function checkDispatch(arg0)
  if arg0 then
    if getElementData(localPlayer, "dispatch") then
      exports.radar:setRadarDispatchElements(var0)
    else
      exports.radar:setRadarDispatchElements({})
    end
  else
    exports.radar:setRadarDispatchElements({})
  end
end
addEvent("onClientCharacterSpawn", true)
addEventHandler("onClientCharacterSpawn", localPlayer, function()
  setTimer(function()
    if getElementData(localPlayer, "dispatch") and not exports["inventory-system"]:playerHasItem("Dispatch") then
      triggerServerEvent("dispatch:set", localPlayer, 0)
    end
  end, 5000, 1)
end)
