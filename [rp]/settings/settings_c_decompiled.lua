-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

GUIEditor = {
  gridlist = {},
  window = {},
  button = {},
  edit = {}
}
addEventHandler("onClientResourceStart", resourceRoot, function()
  GUIEditor.window[1] = guiCreateWindow(241, 166, 604, 399, "Server Settings", false)
  guiWindowSetSizable(GUIEditor.window[1], false)
  guiSetAlpha(GUIEditor.window[1], 0.9)
  guiSetVisible(GUIEditor.window[1], false)
  GUIEditor.gridlist[1] = guiCreateGridList(10, 31, 584, 276, false, GUIEditor.window[1])
  guiGridListAddColumn(GUIEditor.gridlist[1], "Setting Name", 0.5)
  guiGridListAddColumn(GUIEditor.gridlist[1], "Value", 0.5)
  GUIEditor.button[1] = guiCreateButton(208, 314, 88, 32, "Set Value", false, GUIEditor.window[1])
  GUIEditor.edit[1] = guiCreateEdit(10, 314, 194, 32, "", false, GUIEditor.window[1])
  GUIEditor.edit[2] = guiCreateEdit(306, 314, 194, 32, "", false, GUIEditor.window[1])
  GUIEditor.button[2] = guiCreateButton(510, 314, 85, 32, "Add Setting", false, GUIEditor.window[1])
  GUIEditor.button[3] = guiCreateButton(10, 358, 585, 31, "Close", false, GUIEditor.window[1])
end)
addEventHandler("onClientGUIClick", resourceRoot, function()
  if source == GUIEditor.button[3] then
    guiSetVisible(GUIEditor.window[1], false)
    showCursor(false)
  elseif source == GUIEditor.button[2] then
    if guiGetText(GUIEditor.edit[2]) ~= "" then
      triggerServerEvent("settings:setSetting", localPlayer, guiGetText(GUIEditor.edit[2]), "")
    end
  elseif source == GUIEditor.button[1] and guiGridListGetSelectedItem(GUIEditor.gridlist[1]) ~= -1 and guiGetText(GUIEditor.edit[1]) ~= "" then
    triggerServerEvent("settings:setSetting", localPlayer, guiGridListGetItemText(GUIEditor.gridlist[1], guiGridListGetSelectedItem(GUIEditor.gridlist[1]), 1), (guiGetText(GUIEditor.edit[1])))
  end
end)
addEvent("settings:showSettings", true)
addEventHandler("settings:showSettings", localPlayer, function(arg0)
  guiSetVisible(GUIEditor.window[1], true)
  showCursor(true)
  guiGridListClear(GUIEditor.gridlist[1])
  for forvar4, forvar5 in ipairs(arg0) do
    guiGridListSetItemText(GUIEditor.gridlist[1], guiGridListAddRow(GUIEditor.gridlist[1]), 1, forvar5.SettingName, false, false)
    guiGridListSetItemText(GUIEditor.gridlist[1], guiGridListAddRow(GUIEditor.gridlist[1]), 2, forvar5.Value, false, false)
  end
end)
UI = {
  window = {},
  label = {},
  checkbox = {},
  switch = {},
  button = {},
  tabpanel = {},
  tab = {},
  image = {}
}
;({}).UIReady = function()
  var0 = exports.UIKit
end
addEventHandler("onClientUIReady", resourceRoot, ({}).UIReady)
addEvent("onClientUIKitReady", true)
addEventHandler("onClientUIKitReady", root, ({}).UIReady)
addEventHandler("onClientUIMenuSelectChange", root, function(arg0, arg1)
  if arg1 and getElementID(source) == "main-menu" and var0:uiMenuGetItemID(source, arg0) == "settings" then
    if not isElement(UI.button[1]) then
      UI.tabpanel[1] = var0:uiCreateTabPanel(10, 110, var0:uiGetSize(arg1) - 20, 320, "", tocolor(0, 0, 0, 0), arg1)
      var0:uiSetProperty(UI.tabpanel[1], "tabs_bar_color", tocolor(29, 32, 37, 0))
      var0:uiSetProperty(UI.tabpanel[1], "tab_selected_color", tocolor(9, 12, 17, 220))
      var0:uiSetProperty(UI.tabpanel[1], "tab_height", 50)
      var0:uiSetProperty(UI.tabpanel[1], "tab_hovered_color", tocolor(9, 12, 17, 100))
      UI.tab[1] = var0:uiCreateTab({en = "General", ar = "\216\185\216\167\217\133"}, "", UI.tabpanel[1])
      UI.tab[3] = var0:uiCreateTab({
        en = "Customization",
        ar = "\216\167\217\132\216\170\216\174\216\181\217\138\216\181"
      }, "", UI.tabpanel[1])
      UI.button[1] = var0:uiCreateButton(15, var0:uiGetSize(arg1) - 50, 150, 35, {
        en = "Save Settings",
        ar = "\216\173\217\129\216\184 \216\167\217\132\216\165\216\185\216\175\216\167\216\175\216\167\216\170"
      }, "primary", arg1)
      for forvar9, forvar10 in ipairs(var1) do
        UI.checkbox[forvar10.id] = var0:uiCreateSwitch(unpack(forvar10.pos))
      end
      var0:uiCreateLabel(15, 40, 420, 15, "Theme Color: #00ffe1(Premium Only)", tocolor(255, 255, 255, 255), UI.tab[3])
      for forvar12, forvar13 in ipairs({
        {
          255,
          55,
          95
        },
        {
          0,
          255,
          133
        },
        {
          153,
          0,
          240
        },
        {
          255,
          64,
          0
        },
        {
          255,
          0,
          0
        },
        {
          0,
          255,
          0
        },
        {
          0,
          150,
          255
        },
        {
          255,
          166,
          0
        },
        {
          255,
          255,
          0
        },
        {
          255,
          0,
          255
        },
        {
          172,
          142,
          104
        },
        {
          94,
          92,
          230
        },
        {
          255,
          214,
          10
        },
        {
          90,
          200,
          245
        },
        {
          255,
          250,
          250
        },
        {
          147,
          231,
          251
        }
      }) do
        UI.image[forvar12] = var0:uiCreateImage(15 + 45 * (forvar12 - 1), 70, 40, 40, ":vehicle-library/circle.png", UI.tab[3])
        var0:uiSetColor(UI.image[forvar12], forvar13[1], forvar13[2], forvar13[3], 50)
        var2[UI.image[forvar12]] = forvar13
        var0:uiSetProperty(UI.image[forvar12], "HoverOpacityEffect", true)
      end
    end
    for forvar7, forvar8 in ipairs(var1) do
      var0:uiSwitchSetSelected(UI.checkbox[forvar8.id], getSetting(forvar8.id) or false)
    end
  end
end)
addEventHandler("onClientUIClick", root, function()
  if source == UI.button[1] then
    for forvar3, forvar4 in ipairs(var0) do
      setSetting(forvar4.id, var1:uiSwitchGetSelected(UI.checkbox[forvar4.id]))
    end
    saveSettings()
    if var2 and exports.hud:isHudItemExists("special_membership:Premium") then
      executeCommandHandler("menu")
      exports.UIKit:setCustomTheme({
        COLORS = {
          primary = tocolor(unpack(var3[var2]))
        }
      })
      exports.UIKit:restartUIKit()
      var2 = false
    end
    exports.notifications:output({
      en = "Your settings have been updated",
      ar = "\216\170\217\133 \216\170\216\173\216\175\217\138\216\171 \216\165\216\185\216\175\216\167\216\175\216\167\216\170\217\131"
    }, 3000, "success")
  elseif var3[source] then
    if var2 then
      var1:uiSetAlpha(var2, 50)
    end
    var2 = source
    var1:uiSetAlpha(source, 255)
  end
end)
addEvent("onClientSettingChange", false)
addEventHandler("onClientSettingChange", localPlayer, function(arg0, arg1, arg2)
  if arg0 == "AntiLag" then
    if arg2 then
      setFarClipDistance(130)
      setVehiclesLODDistance(40)
      setPedsLODDistance(50)
      setCloudsEnabled(false)
      setBirdsEnabled(false)
      setWorldSpecialPropertyEnabled("randomfoliage", false)
    else
      resetFarClipDistance()
      resetVehiclesLODDistance()
      resetPedsLODDistance()
      setCloudsEnabled(true)
      setBirdsEnabled(true)
      setWorldSpecialPropertyEnabled("randomfoliage", true)
    end
  elseif arg0 == "Shader:Water" then
    if arg2 then
      triggerEvent("watershader:update", localPlayer)
    else
      triggerEvent("watershader:update", localPlayer)
    end
  elseif arg0 == "Shader:Vehicles" then
    if arg2 then
      triggerEvent("vehiclesshader:update", localPlayer)
    else
      triggerEvent("vehiclesshader:update", localPlayer)
    end
  end
end)
addEventHandler("onClientResourceStart", resourceRoot, function()
  var0 = xmlLoadFile("settings.xml")
  if not var0 then
    var0 = xmlCreateFile("settings.xml", "settings")
    for forvar3, forvar4 in ipairs(var1) do
      setSetting(forvar4.id, forvar4.default or false)
    end
    saveSettings()
  else
    for forvar3, forvar4 in ipairs(var1) do
      triggerEvent("onClientSettingChange", localPlayer, forvar4.id, false, (getSetting(forvar4.id)))
    end
  end
end)
addEvent("onClientSettingsReady", false)
addEventHandler("onClientResourceStart", root, function(arg0)
  triggerEvent("onClientSettingsReady", getResourceRootElement(arg0))
end)
function getSetting(arg0)
  if not xmlFindChild(var0, tostring(arg0), 0) then
    for forvar5, forvar6 in ipairs(var1) do
      if forvar6.id == arg0 then
        return forvar6.default
      end
    end
    return false
  end
  return xmlNodeGetValue((xmlFindChild(var0, tostring(arg0), 0))) == "true" and true or false
end
function setSetting(arg0, arg1)
  xmlNodeSetValue(xmlFindChild(var0, tostring(arg0), 0) or xmlCreateChild(var0, tostring(arg0)), tostring(arg1))
  if (xmlNodeGetValue(xmlFindChild(var0, tostring(arg0), 0) or xmlCreateChild(var0, tostring(arg0))) == "true" and true or false) ~= arg1 then
    triggerEvent("onClientSettingChange", localPlayer, arg0, xmlNodeGetValue(xmlFindChild(var0, tostring(arg0), 0) or xmlCreateChild(var0, tostring(arg0))) == "true" and true or false, arg1)
  end
  return true
end
function saveSettings()
  xmlSaveFile(var0)
end
addEvent("settings:user:sync", true)
addEventHandler("settings:user:sync", localPlayer, function(arg0)
  var0 = {}
  for forvar4, forvar5 in ipairs(arg0) do
    var0[forvar5.index] = forvar5.value
  end
end)
function getUserSetting(arg0)
  return var0[arg0]
end
addEvent("onClientCharacterSpawn", true)
addEventHandler("onClientCharacterSpawn", localPlayer, function()
  if not exports.hud:isHudItemExists("special_membership:Premium") then
    exports.UIKit:deleteCustomTheme()
  end
end)
