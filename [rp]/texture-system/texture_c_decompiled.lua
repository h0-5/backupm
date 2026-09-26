-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

addEventHandler("onClientUseItemForElement", root, function(arg0, arg1, arg2, arg3)
  if arg3.Type == "Texture" and (getElementType(arg0) == "object" or getElementType(arg0) == "vehicle") then
    guiSetText(GUIEditor.label[4], tostring(getElementModel(arg0)))
    guiSetVisible(GUIEditor.window[1], true)
    guiSetSize(GUIEditor.window[1], 355, 166, false)
    guiComboBoxClear(GUIEditor.combobox[1])
    var0 = arg0
    currentWorldModel = false
    for forvar8, forvar9 in ipairs(engineGetModelTextureNames(tostring(getElementModel(arg0)))) do
      guiComboBoxAddItem(GUIEditor.combobox[1], tostring(forvar9))
    end
    ItemsCount = #engineGetModelTextureNames(tostring(getElementModel(arg0)))
    if getElementType(arg0) == "vehicle" then
      guiComboBoxAddItem(GUIEditor.combobox[1], "vehiclegeneric256")
      guiComboBoxAddItem(GUIEditor.combobox[1], "bodymap")
      guiComboBoxAddItem(GUIEditor.combobox[1], "vehicledash32")
      guiComboBoxAddItem(GUIEditor.combobox[1], "vehicleenvmap128")
      guiComboBoxAddItem(GUIEditor.combobox[1], "vehiclegrunge256")
      guiComboBoxAddItem(GUIEditor.combobox[1], "vehiclelights128")
      guiComboBoxAddItem(GUIEditor.combobox[1], "vehiclepoldecals128")
      guiComboBoxAddItem(GUIEditor.combobox[1], "xvehicleenv128")
    end
    guiComboBoxSetSelected(GUIEditor.combobox[1], 0)
    testTexture(GUIEditor.combobox[1])
  end
end)
GUIEditor = {
  label = {},
  edit = {},
  button = {},
  window = {},
  gridlist = {},
  combobox = {}
}
addEventHandler("onClientResourceStart", resourceRoot, function()
  GUIEditor.window[1] = guiCreateWindow((guiGetScreenSize() - 355) / 2, (guiGetScreenSize() - 392) / 2, 355, 166, "Add Texture", false)
  guiWindowSetSizable(GUIEditor.window[1], false)
  guiSetVisible(GUIEditor.window[1], false)
  GUIEditor.label[1] = guiCreateLabel(10, 56, 87, 15, "Texture name:", false, GUIEditor.window[1])
  GUIEditor.label[2] = guiCreateLabel(10, 88, 34, 15, "URL (.png):", false, GUIEditor.window[1])
  GUIEditor.combobox[1] = guiCreateComboBox(97, 54, 181, 448, "", false, GUIEditor.window[1])
  GUIEditor.button[1] = guiCreateButton(289, 56, 25, 20, "<", false, GUIEditor.window[1])
  GUIEditor.button[2] = guiCreateButton(318, 56, 25, 20, ">", false, GUIEditor.window[1])
  GUIEditor.edit[1] = guiCreateEdit(45, 84, 300, 23, "", false, GUIEditor.window[1])
  GUIEditor.label[3] = guiCreateLabel(10, 29, 59, 15, "Model ID:", false, GUIEditor.window[1])
  GUIEditor.label[4] = guiCreateLabel(79, 29, 87, 15, "0000", false, GUIEditor.window[1])
  guiSetFont(GUIEditor.label[4], "default-bold-small")
  guiLabelSetColor(GUIEditor.label[4], 255, 254, 254)
  GUIEditor.label[5] = guiCreateLabel(10, 145, 335, 15, "....", false, GUIEditor.window[1])
  guiSetFont(GUIEditor.label[5], "default-bold-small")
  guiLabelSetHorizontalAlign(GUIEditor.label[5], "center", false)
  GUIEditor.gridlist[1] = guiCreateGridList(10, 170, 335, 178, false, GUIEditor.window[1])
  guiGridListAddColumn(GUIEditor.gridlist[1], "Texture name", 0.3)
  guiGridListAddColumn(GUIEditor.gridlist[1], "URL", 0.6)
  GUIEditor.button[3] = guiCreateButton(9, 353, 98, 29, "Remove", false, GUIEditor.window[1])
  GUIEditor.button[4] = guiCreateButton(59, 117, 114, 28, "Apply", false, GUIEditor.window[1])
  GUIEditor.button[5] = guiCreateButton(179, 117, 114, 28, "Close", false, GUIEditor.window[1])
  GUIEditor.button[6] = guiCreateButton(112, 353, 98, 29, "Remove all", false, GUIEditor.window[1])
  GUIEditor.label.loading = guiCreateLabel((var0 - 200) / 2, var1 - 15, 200, 15, "", false)
  guiSetAlpha(GUIEditor.label.loading, 0.4)
  guiLabelSetHorizontalAlign(GUIEditor.label.loading, "center")
end)
addEvent("onClientElementMenuClick", true)
addEventHandler("onClientElementMenuClick", root, function(arg0, arg1, arg2)
  if not isElement(arg0) then
    return
  end
  if (getElementType(arg0) == "vehicle" or getElementType(arg0) == "object") and arg1 == "Admin: Textures" then
    guiSetVisible(GUIEditor.window[1], true)
    guiSetSize(GUIEditor.window[1], 355, 166, false)
    guiComboBoxClear(GUIEditor.combobox[1])
    var0 = arg0
    currentWorldModel = false
    guiSetText(GUIEditor.label[4], tostring(getElementModel(arg0)))
    for forvar6, forvar7 in ipairs(engineGetModelTextureNames(tostring(getElementModel(arg0)))) do
      guiComboBoxAddItem(GUIEditor.combobox[1], tostring(forvar7))
    end
    ItemsCount = #engineGetModelTextureNames(tostring(getElementModel(arg0)))
    if getElementType(arg0) == "vehicle" then
      guiComboBoxAddItem(GUIEditor.combobox[1], "vehiclegeneric256")
      guiComboBoxAddItem(GUIEditor.combobox[1], "bodymap")
      guiComboBoxAddItem(GUIEditor.combobox[1], "vehicledash32")
      guiComboBoxAddItem(GUIEditor.combobox[1], "vehicleenvmap128")
      guiComboBoxAddItem(GUIEditor.combobox[1], "vehiclegrunge256")
      guiComboBoxAddItem(GUIEditor.combobox[1], "vehiclelights128")
      guiComboBoxAddItem(GUIEditor.combobox[1], "vehiclepoldecals128")
      guiComboBoxAddItem(GUIEditor.combobox[1], "xvehicleenv128")
    end
    guiComboBoxSetSelected(GUIEditor.combobox[1], 0)
    testTexture(GUIEditor.combobox[1])
  end
end)
addEvent("onClientUseTextureForWorld", true)
addEventHandler("onClientUseTextureForWorld", root, function(arg0, arg1, arg2, arg3)
  guiSetVisible(GUIEditor.window[1], true)
  guiSetSize(GUIEditor.window[1], 355, 166, false)
  guiComboBoxClear(GUIEditor.combobox[1])
  currentWorldModel = arg0
  var0 = false
  for forvar7, forvar8 in ipairs(engineGetModelTextureNames(tostring(arg0))) do
    guiComboBoxAddItem(GUIEditor.combobox[1], tostring(forvar8))
  end
  ItemsCount = #engineGetModelTextureNames(tostring(arg0))
  guiComboBoxSetSelected(GUIEditor.combobox[1], 0)
  testTexture(GUIEditor.combobox[1])
  guiSetText(GUIEditor.label[4], tostring(arg0))
end)
function updateTexturesSettings()
  var0.stopDownloading = exports.settings:getSetting("Textures:stopDownloading")
  var0.hideAll = exports.settings:getSetting("Textures:hideAll")
  var0.hideAllExceptVehicles = exports.settings:getSetting("Textures:hideAllExceptVehicles")
end
addEvent("onClientSettingsReady", true)
addEventHandler("onClientSettingsReady", resourceRoot, updateTexturesSettings)
addEvent("onClientCharacterSpawn", true)
addEventHandler("onClientCharacterSpawn", localPlayer, updateTexturesSettings)
addEvent("onClientSettingChange", false)
addEventHandler("onClientSettingChange", localPlayer, function(arg0, arg1, arg2)
  if arg0 == "Textures:stopDownloading" then
    var0.stopDownloading = arg2
  elseif arg0 == "Textures:hideAll" then
    var0.hideAll = arg2
    for forvar6, forvar7 in pairs(var1 or {}) do
      for forvar11, forvar12 in pairs(forvar7 or {}) do
        removeElementTexture(forvar6, forvar11)
      end
    end
  elseif arg0 == "Textures:hideAllExceptVehicles" then
    var0.hideAllExceptVehicles = arg2
    for forvar6, forvar7 in pairs(var1 or {}) do
      if isElement(forvar6) and getElementType(forvar6) ~= "vehicle" then
        for forvar12, forvar13 in pairs(forvar7 or {}) do
          removeElementTexture(forvar6, forvar12)
        end
      end
    end
  end
end)
dxSetShaderValue(dxCreateShader([[
	texture tex;
	technique replace {
		pass P0 {
			Texture[0] = tex;
		}
	}
]], 0, 0, true, "world,object,vehicle"), "tex", (dxCreateTexture("Testing.jpg", "dxt3", true, "clamp", "2d", 1)))
addEventHandler("onClientGUIComboBoxAccepted", resourceRoot, function()
  if source == GUIEditor.combobox[1] then
    testTexture(source)
  end
end)
function testTexture(arg0)
  if currentWorldModel then
    if var0 then
      engineRemoveShaderFromWorldTexture(var1, var0)
      if isElement(WMShaders[var0]) then
        engineApplyShaderToWorldTexture(WMShaders[var0], var0)
      end
    end
    engineApplyShaderToWorldTexture(var1, (guiComboBoxGetItemText(arg0, guiComboBoxGetSelected(arg0))))
    var0 = guiComboBoxGetItemText(arg0, guiComboBoxGetSelected(arg0))
    if isElement(WMShaders[var0]) then
      engineRemoveShaderFromWorldTexture(WMShaders[var0], var0)
    end
  else
    if var0 and isElement(var2) then
      engineRemoveShaderFromWorldTexture(var1, var0, var2)
      if var3[var2] and isElement(var3[var2][var0]) then
        engineApplyShaderToWorldTexture(var3[var2][var0], var0, var2)
      end
    end
    engineApplyShaderToWorldTexture(var1, guiComboBoxGetItemText(arg0, guiComboBoxGetSelected(arg0)), var4)
    var0 = guiComboBoxGetItemText(arg0, guiComboBoxGetSelected(arg0))
    var2 = var4
    if var3[var2] and isElement(var3[var2][var0]) then
      engineRemoveShaderFromWorldTexture(var3[var2][var0], var0, var2)
    end
  end
end
function cancelTestTexture()
  if currentWorldModel then
    if var0 then
      engineRemoveShaderFromWorldTexture(var1, var0)
      if isElement(WMShaders[var0]) then
        engineApplyShaderToWorldTexture(WMShaders[var0], var0)
      end
    end
  elseif var0 then
    engineRemoveShaderFromWorldTexture(var1, var0, var2)
    if var3[var2] and isElement(var3[var2][var0]) and var4[var2] and var4[var2][var0] then
      engineApplyShaderToWorldTexture(var3[var2][var0], var0, var2)
    end
  end
  var0 = false
  var2 = false
end
addEventHandler("onClientMouseEnter", resourceRoot, function()
  if source == GUIEditor.label[5] then
    guiLabelSetColor(source, 255, 0, 0)
  end
end)
addEventHandler("onClientMouseLeave", resourceRoot, function()
  if source == GUIEditor.label[5] then
    guiLabelSetColor(source, 255, 255, 255)
  end
end)
addEventHandler("onClientGUIDoubleClick", resourceRoot, function()
  if source == GUIEditor.gridlist[1] and guiGridListGetSelectedItem(GUIEditor.gridlist[1]) ~= -1 then
    setClipboard((guiGridListGetItemText(GUIEditor.gridlist[1], guiGridListGetSelectedItem(GUIEditor.gridlist[1]), 2)))
    outputChatBox("The URL has been copied", 255, 55, 95)
  end
end)
addEventHandler("onClientGUIClick", resourceRoot, function()
  if source == GUIEditor.button[1] then
    if guiComboBoxGetSelected(GUIEditor.combobox[1]) > 0 then
      guiComboBoxSetSelected(GUIEditor.combobox[1], guiComboBoxGetSelected(GUIEditor.combobox[1]) - 1)
      testTexture(GUIEditor.combobox[1])
    end
  elseif source == GUIEditor.button[2] then
    if guiComboBoxGetSelected(GUIEditor.combobox[1]) < ItemsCount - 1 then
      guiComboBoxSetSelected(GUIEditor.combobox[1], guiComboBoxGetSelected(GUIEditor.combobox[1]) + 1)
      testTexture(GUIEditor.combobox[1])
    end
  elseif source == GUIEditor.button[4] then
    if guiComboBoxGetSelected(GUIEditor.combobox[1]) ~= -1 then
      if string.gsub(guiGetText(GUIEditor.edit[1]), " ", "") ~= "" and string.find(string.gsub(guiGetText(GUIEditor.edit[1]), " ", ""), ".png", 1, true) then
        if currentWorldModel then
          triggerServerEvent("textures:addTextureToWorldModel", localPlayer, currentWorldModel, guiComboBoxGetItemText(GUIEditor.combobox[1], (guiComboBoxGetSelected(GUIEditor.combobox[1]))), string.gsub(guiGetText(GUIEditor.edit[1]), " ", ""), getElementInterior(localPlayer), (getElementDimension(localPlayer)))
        else
          triggerServerEvent("textures:addTextureToElement", localPlayer, var0, guiComboBoxGetItemText(GUIEditor.combobox[1], (guiComboBoxGetSelected(GUIEditor.combobox[1]))), string.gsub(guiGetText(GUIEditor.edit[1]), " ", ""), getElementInterior(var0), (getElementDimension(var0)))
        end
      else
        outputChatBox("ERROR: invalid URL.", 255, 0, 0)
      end
    end
  elseif source == GUIEditor.button[5] then
    var0 = false
    guiSetVisible(GUIEditor.window[1], false)
    cancelTestTexture()
  elseif source == GUIEditor.label[5] then
    if guiGetSize(GUIEditor.window[1], false) == 166 then
      guiSetSize(GUIEditor.window[1], 355, 392, false)
      guiSetSize(GUIEditor.gridlist[1], 335, 178, false)
      guiSetSize(GUIEditor.button[3], 98, 29, false)
      guiSetSize(GUIEditor.button[6], 98, 29, false)
      guiGridListClear(GUIEditor.gridlist[1])
      if currentWorldModel then
        for forvar7, forvar8 in ipairs(var1 or {}) do
          if forvar8[3] == getElementInterior(localPlayer) and forvar8[4] == getElementDimension(localPlayer) then
            guiGridListSetItemText(GUIEditor.gridlist[1], guiGridListAddRow(GUIEditor.gridlist[1]), 1, tostring(forvar8[1]), false, false)
            guiGridListSetItemText(GUIEditor.gridlist[1], guiGridListAddRow(GUIEditor.gridlist[1]), 2, tostring(forvar8[2]), false, false)
            guiGridListSetItemData(GUIEditor.gridlist[1], guiGridListAddRow(GUIEditor.gridlist[1]), 1, forvar8)
          end
        end
      else
        for forvar7, forvar8 in ipairs(var2[tostring(getElementID(var0))] or {}) do
          if forvar8[3] == getElementInterior(localPlayer) and forvar8[4] == getElementDimension(localPlayer) then
            guiGridListSetItemText(GUIEditor.gridlist[1], guiGridListAddRow(GUIEditor.gridlist[1]), 1, tostring(forvar8[1]), false, false)
            guiGridListSetItemText(GUIEditor.gridlist[1], guiGridListAddRow(GUIEditor.gridlist[1]), 2, tostring(forvar8[2]), false, false)
            guiGridListSetItemData(GUIEditor.gridlist[1], guiGridListAddRow(GUIEditor.gridlist[1]), 1, forvar8)
          end
        end
      end
    else
      guiSetSize(GUIEditor.window[1], 355, 166, false)
    end
  elseif source == GUIEditor.button[3] and guiGridListGetSelectedItem(GUIEditor.gridlist[1]) ~= -1 then
    cancelTestTexture()
    if currentWorldModel then
      triggerServerEvent("textures:removeTexture", localPlayer, currentWorldModel, guiGridListGetItemData(GUIEditor.gridlist[1], guiGridListGetSelectedItem(GUIEditor.gridlist[1]), 1)[5])
    else
      triggerServerEvent("textures:removeTexture", localPlayer, var0, guiGridListGetItemData(GUIEditor.gridlist[1], guiGridListGetSelectedItem(GUIEditor.gridlist[1]), 1)[5])
    end
    guiGridListRemoveRow(GUIEditor.gridlist[1], (guiGridListGetSelectedItem(GUIEditor.gridlist[1])))
  end
end)
addEventHandler("onClientElementDimensionChange", localPlayer, function(arg0, arg1)
  if arg0 ~= 0 then
    for forvar5, forvar6 in ipairs(var0) do
      if forvar6[4] == arg0 then
        removeElementTexture("worldmodel", forvar6[1])
      end
    end
  end
  for forvar5, forvar6 in ipairs(var0) do
    if forvar6[4] == arg1 then
      setWorldTexture(forvar6[1], forvar6[2])
    end
  end
end)
addEvent("textures:response:allTexturesTable", true)
addEventHandler("textures:response:allTexturesTable", localPlayer, function(arg0, arg1)
  var0 = arg0
  var1 = arg1
  for forvar6, forvar7 in ipairs(var1) do
    if forvar7[4] == 0 or forvar7[4] == getElementDimension(localPlayer) then
      setWorldTexture(forvar7[1], forvar7[2])
    end
  end
  for forvar6, forvar7 in pairs(var0) do
    if isElement((getElementByID(forvar6))) and isElementStreamedIn((getElementByID(forvar6))) then
      for forvar12, forvar13 in ipairs(forvar7) do
        setElementTexture(getElementByID(forvar6), forvar13[1], forvar13[2])
      end
    end
  end
end)
addEvent("textures:allTexturesTable:update", true)
addEventHandler("textures:allTexturesTable:update", localPlayer, function(arg0, arg1)
  var0[arg0] = arg1
  if isElement((getElementByID(arg0))) then
    for forvar6, forvar7 in ipairs(arg1 or {}) do
      setElementTexture(getElementByID(arg0), forvar7[1], forvar7[2])
    end
  end
end)
addEvent("textures:allWorldTexturesTable:update", true)
addEventHandler("textures:allWorldTexturesTable:update", localPlayer, function(arg0, arg1)
  if arg1 then
    table.insert(var0, arg1)
    setWorldTexture(arg1[1], arg1[2])
  else
    for forvar5, forvar6 in ipairs(var0) do
      if forvar6[5] == arg0 then
        table.remove(var0, forvar5)
        break
      end
    end
  end
end)
WMShaders = {}
addEventHandler("onClientPlayerSpawn", localPlayer, function()
  addEventHandler("onClientElementStreamOut", root, onRemoveShader)
  addEventHandler("onClientElementDestroy", root, onRemoveShader)
  addEventHandler("onClientElementStreamIn", root, onStreamIn)
end)
function removeEvents(arg0)
  removeEventHandler("onClientElementStreamOut", root, onRemoveShader)
  removeEventHandler("onClientElementDestroy", root, onRemoveShader)
  removeEventHandler("onClientElementStreamIn", root, onStreamIn)
end
addEvent("onClientPlayerQuitFromCharacter", true)
addEventHandler("onClientPlayerQuitFromCharacter", localPlayer, removeEvents)
addEventHandler("onClientPlayerWasted", localPlayer, removeEvents)
function onSystemStart()
  if getElementData(localPlayer, "character:id") then
    addEventHandler("onClientElementStreamOut", root, onRemoveShader)
    addEventHandler("onClientElementDestroy", root, onRemoveShader)
    addEventHandler("onClientElementStreamIn", root, onStreamIn)
  end
  dxSetShaderValue(dxCreateShader(var0), "tex", (dxCreateTexture("fd_decals.png", "dxt5", true, "clamp", "2d", 1)))
  engineApplyShaderToWorldTexture(dxCreateShader(var0), "bus92decals128")
  dxSetShaderValue(dxCreateShader(var0), "tex", (dxCreateTexture("fd_decals.png", "dxt5", true, "clamp", "2d", 1)))
  engineApplyShaderToWorldTexture(dxCreateShader(var0), "polmav92decal64b")
  engineApplyShaderToWorldTexture(dxCreateShader(var0), "polmav92sadecal64")
  engineApplyShaderToWorldTexture(dxCreateShader(var0), "ws_gaydar")
  engineApplyShaderToWorldTexture(dxCreateShader(var0), "ws_mural1")
  dxSetShaderValue(dxCreateShader(var0), "tex", (dxCreateTexture("fd_decals.png", "dxt5", true, "clamp", "2d", 1)))
  engineApplyShaderToWorldTexture(dxCreateShader(var0), "ws_gayflag1")
  dxSetShaderValue(dxCreateShader(var0), "tex", (dxCreateTexture("flag.png", "dxt5", true, "clamp", "2d", 1)))
  if isElement((dxCreateShader(var0))) then
    dxSetShaderValue(dxCreateShader(var0), "tex", (dxCreateTexture("fd_decals.png", "dxt5", true, "clamp", "2d", 1)))
    engineApplyShaderToWorldTexture(dxCreateShader(var0), "shad_ped")
  end
end
addEventHandler("onClientResourceStart", resourceRoot, onSystemStart)
function getPath(arg0)
  return md5(tostring(arg0)) .. "." .. var0
end
setTimer(function()
  engineStreamingFreeUpMemory(52428800)
end, 60000, 0)
function downloadTexture(arg0, arg1)
  addToDownloadQueue(arg0, arg1)
end
function addToDownloadQueue(arg0, arg1)
  if var0[arg0] then
    arg1(arg0, 0)
    return
  end
  for forvar5, forvar6 in ipairs(var1) do
    if forvar6[1] == arg0 then
      return
    end
  end
  table.insert(var1, {arg0, arg1})
  guiSetText(GUIEditor.label.loading, "Downloading Textures (" .. tostring(#var1) .. ")")
  if #var1 == 1 then
    triggerServerEvent("textures:downloadTexture", localPlayer, arg0)
  end
end
function removeFromDownloadQueue(arg0)
  for forvar4, forvar5 in ipairs(var0) do
    if forvar5[1] == arg0 then
      table.remove(var0, forvar4)
      if #var0 == 0 then
        guiSetText(GUIEditor.label.loading, "")
        break
      end
      guiSetText(GUIEditor.label.loading, "Downloading Textures (" .. tostring(#var0) .. ")")
      triggerServerEvent("textures:downloadTexture", localPlayer, var0[1][1])
      break
    end
  end
end
function downloadCallBack(arg0, arg1, arg2)
  if arg0 == 1 then
    if arg2 then
      saveTextureFile(arg1, arg2)
    end
    for forvar6, forvar7 in ipairs(var0) do
      if forvar7[1] == arg1 then
        forvar7[2](arg1, 1)
      end
    end
    removeFromDownloadQueue(arg1)
  else
    for forvar6, forvar7 in ipairs(var0) do
      if forvar7[1] == arg1 then
        forvar7[2](arg1, 0)
      end
    end
    var1[arg1] = true
    removeFromDownloadQueue(arg1)
  end
end
addEvent("textures:downloadTexture:callBack", true)
addEventHandler("textures:downloadTexture:callBack", localPlayer, downloadCallBack)
addEvent("textures:loadFromURL", true)
addEventHandler("textures:loadFromURL", root, function(arg0, arg1)
  saveTextureFile(arg0, arg1)
end)
function getTexture(arg0, arg1)
  if var0[arg0] then
    return arg1(var0[arg0])
  end
  if fileExists("textures/" .. arg0 .. "." .. var1) then
    if fileGetSize((fileOpen("textures/" .. arg0 .. "." .. var1, true))) / 1024 > 300 then
      return arg1(false)
    end
    fileClose((fileOpen("textures/" .. arg0 .. "." .. var1, true)))
    if not fileRead(fileOpen("textures/" .. arg0 .. "." .. var1, true), (fileGetSize((fileOpen("textures/" .. arg0 .. "." .. var1, true))))) then
      outputDebugString("Maybe OOM? " .. tostring("textures/" .. arg0 .. "." .. var1) .. " - " .. tostring((fileGetSize((fileOpen("textures/" .. arg0 .. "." .. var1, true))))))
      return arg1(false)
    end
    decodeString("tea", fileRead(fileOpen("textures/" .. arg0 .. "." .. var1, true), (fileGetSize((fileOpen("textures/" .. arg0 .. "." .. var1, true))))), {
      key = "TEXTURESPROENCRYPTIONSTRONG"
    }, function(arg0)
      if arg0 and not string.find(arg0, "<html", 1, true) then
        fileWrite(fileCreate(":texture-system/textures/" .. (var0 .. "_TEMP") .. ".texture"), arg0)
        fileClose((fileCreate(":texture-system/textures/" .. (var0 .. "_TEMP") .. ".texture")))
        var1[var0] = dxCreateTexture(":texture-system/textures/" .. (var0 .. "_TEMP") .. ".texture", "dxt5", true, "clamp")
        fileDelete(":texture-system/textures/" .. (var0 .. "_TEMP") .. ".texture")
        if not isElement(var1[var0]) then
          var1[var0] = nil
          return var2(false)
        else
          var3[var0] = 0
          return var2(var1[var0])
        end
      end
    end)
  else
    if not var3[arg0] then
      var3[arg0] = {}
    end
    table.insert(var3[arg0], arg1)
    downloadTexture(arg0, function(arg0, arg1)
      if arg1 == 1 then
        if var0[arg0] then
          for forvar5, forvar6 in ipairs(var0[arg0]) do
            getTexture(arg0, forvar6)
          end
        end
      elseif var0[arg0] then
        for forvar5, forvar6 in ipairs(var0[arg0]) do
          forvar6(false)
        end
        var0[arg0] = nil
      end
    end)
  end
end
function setElementTexture(arg0, arg1, arg2)
  if var0.hideAll then
    return false
  end
  if var0.hideAllExceptVehicles and getElementType(arg0) ~= "vehicle" then
    return false
  end
  if var1[arg0] and var1[arg0][arg1] and var1[arg0][arg1] == arg2 then
    return false
  end
  for forvar7, forvar8 in ipairs(var2) do
    if forvar8[1] == arg0 and forvar8[2] == arg1 and forvar8[3] == arg2 then
      return false
    end
  end
  table.insert(var2, {
    arg0,
    arg1,
    arg2
  })
  getTexture(arg2, function(arg0)
    if arg0 then
      if not var0[var1] then
        var0[var1] = {}
      end
      if not var0[var1][var2] or not isElement(var0[var1][var2]) then
        var0[var1][var2] = dxCreateShader(var3, 0, 200, true, var4)
        if var4 == "world" then
          engineApplyShaderToWorldTexture(var0[var1][var2], var2)
        else
          engineApplyShaderToWorldTexture(var0[var1][var2], var2, var1)
        end
        dxSetShaderValue(var0[var1][var2], "tex", arg0)
        if not var5[var1] then
          var5[var1] = {}
        end
        var5[var1][var2] = var6
        var7[var6] = var7[var6] + 1
        for forvar4, forvar5 in ipairs(var8) do
          if forvar5[1] == var1 and forvar5[2] == var2 and forvar5[3] == var6 then
            table.remove(var8, forvar4)
            break
          end
        end
      end
    end
  end)
end
function setWorldTexture(arg0, arg1)
  if var0.hideAll then
    return false
  end
  setElementTexture("worldmodel", arg0, arg1)
end
function onStreamIn()
  if var0.hideAll then
    return
  end
  if not getElementData(localPlayer, "character:id") then
    return
  end
  if not getElementID(source) then
    return
  end
  if not var1[getElementID(source)] then
    return
  end
  if getElementType(source) == "object" then
    if var0.hideAllExceptVehicles then
      return
    end
    for forvar7, forvar8 in ipairs(var1[getElementID(source)]) do
      if false and tonumber(forvar8[3]) == getElementInterior(localPlayer) and tonumber(forvar8[4]) == getElementDimension(localPlayer) then
        setElementTexture(source, forvar8[1], forvar8[2])
      end
    end
  elseif getElementType(source) == "vehicle" then
    for forvar5, forvar6 in ipairs(var1[getElementID(source)] or {}) do
      setElementTexture(source, forvar6[1], forvar6[2])
    end
  end
end
function onRemoveShader()
  if (getElementType(source) == "object" or getElementType(source) == "vehicle") and var0[source] then
    for forvar4, forvar5 in pairs(var0[source] or {}) do
      removeElementTexture(source, forvar4)
    end
    var0[source] = nil
    var1[source] = nil
  end
end
function removeElementTexture(arg0, arg1)
  if not var0[arg0] then
    return
  end
  if not var0[arg0][arg1] then
    return
  end
  if arg0 == "worldmodel" then
    engineRemoveShaderFromWorldTexture(var0[arg0][arg1], arg1)
  else
    engineRemoveShaderFromWorldTexture(var0[arg0][arg1], arg1, arg0)
  end
  if var1[arg0][arg1] then
    var2[var1[arg0][arg1]] = var2[var1[arg0][arg1]] - 1
    if var2[var1[arg0][arg1]] == 0 then
      destroyElement(var3[var1[arg0][arg1]])
      var3[var1[arg0][arg1]] = nil
    end
  end
  var1[arg0][arg1] = nil
  destroyElement(var0[arg0][arg1])
  var0[arg0][arg1] = nil
end
addEvent("textures:onRemoveTexture", true)
addEventHandler("textures:onRemoveTexture", localPlayer, function(arg0, arg1, arg2, arg3)
  if not isElement(arg0) or not arg0 then
    arg0 = "worldmodel"
  end
  removeElementTexture(arg0, arg1)
end)
function saveTextureFile(arg0, arg1)
  if arg0 and arg1 and not fileExists("textures/" .. tostring(arg0) .. "." .. var0) then
    fileWrite(fileCreate("textures/" .. tostring(arg0) .. "." .. var0), arg1)
    fileClose((fileCreate("textures/" .. tostring(arg0) .. "." .. var0)))
  end
end
