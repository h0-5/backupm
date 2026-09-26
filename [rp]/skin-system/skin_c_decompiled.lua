-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

UI = {
  tab = {},
  edit = {},
  window = {},
  label = {},
  checkbox = {},
  button = {},
  gridlist = {},
  combobox = {}
}
function UIKitReady()
  eui = exports.UIKit
  UI.window[1] = eui:uiCreateWindow(false, false, 350, 400, "Fashion Dupont")
  eui:uiWindowSetMovable(UI.window[1], false)
  eui:uiSetVisible(UI.window[1], false)
  UI.gridlist[1] = eui:uiCreateGridList(5, 35, 340, 260, tocolor(10, 10, 10), UI.window[1])
  eui:uiGridListAddColumn(UI.gridlist[1], "SkinID", 0.15)
  eui:uiGridListAddColumn(UI.gridlist[1], "Description", 0.65)
  eui:uiGridListAddColumn(UI.gridlist[1], "Price", 0.2)
  eui:uiSetAlign(UI.gridlist[1], "left", "center")
  UI.checkbox[1] = eui:uiCreateCheckBox(10, 307, 150, 15, "My private skins.", true, _, UI.window[1])
  UI.button[1] = eui:uiCreateButton(5, 332, 340, 30, "Buy Skin", tocolor(0, 0, 0), UI.window[1])
  UI.button[2] = eui:uiCreateButton(5, 365, 340, 30, "Close", tocolor(0, 0, 0), UI.window[1])
  UI.window.AddSkin = eui:uiCreateRectangle(false, false, 380, 220, tocolor(15, 15, 15, 240), true, true, true, true)
  eui:uiSetVisible(UI.window.AddSkin, false)
  UI.label.Title = eui:uiCreateLabel(10, 10, 232, 20, "Clothing", tocolor(255, 255, 255, 255), "left", "top", UI.window.AddSkin)
  eui:uiSetFont(UI.label.Title, "default-large")
  UI.edit.SkinID = eui:uiCreateEdit(10, 45, 360, 20, "", "Skin ID", _, UI.window.AddSkin)
  UI.edit.Description = eui:uiCreateEdit(10, 70, 360, 20, "", "Description", _, UI.window.AddSkin)
  UI.edit.URL = eui:uiCreateEdit(10, 95, 360, 20, "", "URL (.png)", _, UI.window.AddSkin)
  UI.edit.Price = eui:uiCreateEdit(10, 120, 360, 20, "", "Price", _, UI.window.AddSkin)
  UI.checkbox.isPrivate = eui:uiCreateCheckBox(10, 155, 360, 20, "Private skin", true, _, UI.window.AddSkin)
  UI.button.AddSkin = eui:uiCreateButton(5, 185, 100, 30, "Add", tocolor(0, 0, 0), UI.window.AddSkin)
  UI.button.CloseAddSkin = eui:uiCreateButton(110, 185, 100, 30, "Close", tocolor(0, 0, 0), UI.window.AddSkin)
  UI.button.RemoveSkin = eui:uiCreateButton(215, 185, 100, 30, "Remove", tocolor(0, 0, 0), UI.window.AddSkin)
  eui:uiSetVisible(UI.button.RemoveSkin, false)
end
addEventHandler("onClientUIReady", resourceRoot, UIKitReady)
addEventHandler("onClientUIKitReady", root, UIKitReady)
function closeUIWindows(arg0)
  eui:uiSetVisible(UI.window[1], false)
  eui:uiSetVisible(UI.window.AddSkin, false)
  showCursor(false)
end
addEvent("onClientPlayerQuitFromCharacter", true)
addEventHandler("onClientPlayerQuitFromCharacter", localPlayer, closeUIWindows)
addEventHandler("onClientPlayerWasted", localPlayer, closeUIWindows)
addEventHandler("onClientUIClick", root, function()
  if source == UI.button[1] then
    if eui:uiGridListGetSelectedItem(UI.gridlist[1]) ~= -1 then
      eui:uiSetVisible(UI.window[1], false)
      showCursor(false)
      triggerServerEvent("skins:buySkin", localPlayer, eui:uiGridListGetItemData(UI.gridlist[1], eui:uiGridListGetSelectedItem(UI.gridlist[1]), 1).ID, var0.Ped)
    end
  elseif source == UI.button[2] then
    eui:uiSetVisible(UI.window[1], false)
    showCursor(false)
  elseif source == UI.button.CloseAddSkin then
    eui:uiSetVisible(UI.window.AddSkin, false)
    showCursor(false)
    if eui:uiGetText(UI.label.Title) == "Edit Skin" then
      eui:uiSetVisible(UI.window[1], false)
    end
  elseif source == UI.checkbox[1] then
    if eui:uiCheckBoxGetSelected(source) then
      eui:uiGridListClear(UI.gridlist[1])
      for forvar5, forvar6 in ipairs(var0.Skins or {}) do
        if forvar6.private == 1 and forvar6.Owner == var1(localPlayer, "character:id") then
          eui:uiGridListSetItemText(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 1, tostring(forvar6.SkinID))
          eui:uiGridListSetItemText(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 2, tostring(forvar6.Description))
          eui:uiGridListSetItemText(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 3, "$" .. tostring(forvar6.Price))
          eui:uiGridListSetItemData(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 1, forvar6)
        end
      end
    else
      eui:uiGridListClear(UI.gridlist[1])
      for forvar4, forvar5 in ipairs(var0.Skins or {}) do
        if forvar5.private == 0 or forvar5.private == 1 and forvar5.Owner == var1(localPlayer, "character:id") then
          eui:uiGridListSetItemText(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 1, tostring(forvar5.SkinID))
          eui:uiGridListSetItemText(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 2, tostring(forvar5.Description))
          eui:uiGridListSetItemText(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 3, "$" .. tostring(forvar5.Price))
          eui:uiGridListSetItemData(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 1, forvar5)
        end
      end
    end
  elseif source == UI.button.AddSkin then
    if tonumber((eui:uiGetText(UI.edit.SkinID))) and eui:uiGetText(UI.edit.Description) ~= "" and eui:uiGetText(UI.edit.URL) ~= "" and tonumber((eui:uiGetText(UI.edit.Price))) then
      if eui:uiGetText(source) == "Add" and (utfSub(string.gsub(eui:uiGetText(UI.edit.URL), "https", "http"), utfLen((string.gsub(eui:uiGetText(UI.edit.URL), "https", "http"))) - 3, (utfLen((string.gsub(eui:uiGetText(UI.edit.URL), "https", "http"))))) ~= ".png" or string.find(string.gsub(eui:uiGetText(UI.edit.URL), "https", "http"), "?", 1, true)) then
        outputChatBox("Error: invalid image URL", 230, 0, 0)
        return
      end
      if isAddForShop and tonumber((eui:uiGetText(UI.edit.Price))) and not (0 < tonumber((eui:uiGetText(UI.edit.Price)))) then
        return
      end
      if eui:uiGetText(source) == "Add" then
        triggerServerEvent("skins:addNewSkin", localPlayer, tonumber((eui:uiGetText(UI.edit.SkinID))), eui:uiGetText(UI.edit.Description), string.gsub(eui:uiGetText(UI.edit.URL), "https", "http"), tonumber((eui:uiGetText(UI.edit.Price))), eui:uiCheckBoxGetSelected(UI.checkbox.isPrivate) == true and 1 or 0, isAddForShop, var2)
      elseif eui:uiGetText(source) == "Save" then
        triggerServerEvent("skins:updateSkin", localPlayer, var0.ID, tonumber((eui:uiGetText(UI.edit.SkinID))), eui:uiGetText(UI.edit.Description), string.gsub(eui:uiGetText(UI.edit.URL), "https", "http"), tonumber((eui:uiGetText(UI.edit.Price))), eui:uiCheckBoxGetSelected(UI.checkbox.isPrivate) == true and 1 or 0)
      end
      eui:uiSetVisible(UI.window.AddSkin, false)
      if isAddForShop then
        eui:uiSetVisible(UI.window[1], true)
      end
    end
  elseif source == UI.button.RemoveSkin then
    eui:uiSetVisible(UI.window.AddSkin, false)
    eui:uiSetVisible(UI.window[1], true)
    triggerServerEvent("skins:removeSkin", localPlayer, var0.V)
  end
end)
addEventHandler("onClientUIDoubleClick", root, function()
  if source == UI.gridlist[1] and eui:uiGridListGetSelectedItem(UI.gridlist[1]) ~= -1 and eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(UI.gridlist[1]), 1).Owner == var0(localPlayer, "character:id") then
    eui:uiSetVisible(UI.window[1], false)
    eui:uiSetText(UI.label.Title, "Edit Skin")
    eui:uiSetVisible(UI.window.AddSkin, true)
    eui:uiBringToFront(UI.window.AddSkin)
    eui:uiSetText(UI.button.AddSkin, "Save")
    eui:uiSetText(UI.edit.SkinID, tostring(eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(UI.gridlist[1]), 1).SkinID))
    eui:uiSetText(UI.edit.Description, tostring(eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(UI.gridlist[1]), 1).Description))
    eui:uiSetText(UI.edit.URL, tostring(eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(UI.gridlist[1]), 1).Skin_URL))
    eui:uiSetText(UI.edit.Price, tostring(eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(UI.gridlist[1]), 1).Price))
    eui:uiSetVisible(UI.button.RemoveSkin, true)
    eui:uiCheckBoxSetSelected(UI.checkbox.isPrivate, eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(UI.gridlist[1]), 1).private == 1 and true or false)
    eui:uiSetProperty(UI.edit.URL, "Disabled", "True")
    var1.ID = eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(UI.gridlist[1]), 1).ID
    var1.V = eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(UI.gridlist[1]), 1)
  end
end)
addEvent("onClientElementMenuShow", true)
addEventHandler("onClientElementMenuShow", localPlayer, function(arg0, arg1, arg2)
  if not (arg1 <= 3) then
    return
  end
  if arg2 == "ped" then
    if not var0(arg0) then
      return
    end
    if var1(arg0, "ped:interact") == "skins" then
      exports.interaction:addInteractOption(arg0, {
        text = "Add new skin"
      })
    end
  end
end)
isAddForShop = true
addEvent("onClientElementMenuClick", true)
addEventHandler("onClientElementMenuClick", localPlayer, function(arg0, arg1, arg2)
  if not var0(arg0) then
    return
  end
  if var1(arg0) == "ped" and var2(arg0, "ped:interact") == "skins" then
    if arg1 == "Talk" then
      eui:uiSetVisible(UI.window[1], true)
      showCursor(true)
      triggerServerEvent("skins:getSkinsDatabase", localPlayer)
      var3.Ped = arg0
    elseif arg1 == "Add new skin" then
      eui:uiSetVisible(UI.window.AddSkin, true)
      eui:uiSetText(UI.label.Title, "Clothing")
      eui:uiSetText(UI.button.AddSkin, "Add")
      eui:uiSetText(UI.edit.SkinID, "")
      eui:uiSetText(UI.edit.Description, "")
      eui:uiSetText(UI.edit.URL, "")
      eui:uiSetText(UI.edit.Price, "")
      eui:uiSetVisible(UI.button.RemoveSkin, false)
      eui:uiCheckBoxSetSelected(UI.checkbox.isPrivate, true)
      eui:uiSetProperty(UI.edit.URL, "Disabled", "False")
      eui:uiSetVisible(UI.checkbox.isPrivate, true)
      isAddForShop = true
    end
  end
end)
addEvent("skins:showAddSkinWindow", true)
addEventHandler("skins:showAddSkinWindow", localPlayer, function(arg0)
  eui:uiSetVisible(UI.window.AddSkin, true)
  eui:uiSetText(UI.label.Title, "Clothing")
  eui:uiSetText(UI.button.AddSkin, "Add")
  eui:uiSetText(UI.edit.SkinID, "")
  eui:uiSetText(UI.edit.Description, "")
  eui:uiSetText(UI.edit.URL, "")
  eui:uiSetText(UI.edit.Price, "")
  eui:uiSetVisible(UI.button.RemoveSkin, false)
  eui:uiCheckBoxSetSelected(UI.checkbox.isPrivate, false)
  eui:uiSetProperty(UI.edit.URL, "Disabled", "False")
  eui:uiSetVisible(UI.checkbox.isPrivate, false)
  isAddForShop = false
  var0 = arg0
end)
addEvent("skins:sendSkinsDatabaseToClient", true)
addEventHandler("skins:sendSkinsDatabaseToClient", root, function(arg0)
  eui:uiCheckBoxSetSelected(UI.checkbox[1], false)
  var0.Skins = arg0
  eui:uiGridListClear(UI.gridlist[1])
  for forvar5, forvar6 in ipairs(arg0) do
    if forvar6.private == 0 or forvar6.private == 1 and forvar6.Owner == var1(localPlayer, "character:id") then
      eui:uiGridListSetItemText(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 1, tostring(forvar6.SkinID))
      eui:uiGridListSetItemText(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 2, tostring(forvar6.Description))
      eui:uiGridListSetItemText(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 3, "$" .. tostring(forvar6.Price))
      eui:uiGridListSetItemData(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 1, forvar6)
    end
  end
end)
addEventHandler("onClientResourceStart", resourceRoot, function()
  downloading_label = guiCreateLabel(100, guiGetScreenSize() - 15, 200, 15, "", false)
  guiSetAlpha(downloading_label, 0.4)
  if not var0(localPlayer, "character:id") then
    return
  end
  for forvar6, forvar7 in ipairs(getElementsByType("player", root, true)) do
    if isElementStreamedIn(forvar7) and var0(forvar7, "custom-skin") and type((var0(forvar7, "custom-skin"))) == "table" then
      applySkinToPlayer(forvar7, (var0(forvar7, "custom-skin")))
    end
  end
  if not var1 then
    addEventHandler("onClientElementStreamIn", root, onStreamIn)
    var1 = true
  end
end)
addEvent("onClientCharacterSpawn", true)
addEventHandler("onClientCharacterSpawn", localPlayer, function()
  if not var0 then
    addEventHandler("onClientElementStreamIn", root, onStreamIn)
    var0 = true
  end
end)
function onStreamIn()
  if var0(source) ~= "player" and var0(source) ~= "ped" then
    return
  end
  if var1(source, "custom-skin") and type((var1(source, "custom-skin"))) == "table" then
    applySkinToPlayer(source, (var1(source, "custom-skin")))
  end
end
function onStreamOut()
  if pending_set_custom_skin[source] then
    pending_set_custom_skin[source] = nil
  end
  if var0[source] then
    return
  end
  removeSkinFromPlayer(source)
end
function onElementDestroy()
  if pending_set_custom_skin[source] then
    pending_set_custom_skin[source] = nil
  end
  if var0[source] then
    return
  end
  removeSkinFromPlayer(source)
end
addEventHandler("onClientElementStreamOut", root, onStreamOut)
addEventHandler("onClientElementDestroy", root, onElementDestroy)
function onQuitGame(arg0)
  if pending_set_custom_skin[source] then
    pending_set_custom_skin[source] = nil
  end
end
addEventHandler("onClientPlayerQuit", root, onQuitGame)
function saveSkin(arg0, arg1)
  if not var1("skins/" .. tostring(arg0) .. "." .. var0) then
    var3(var2("skins/" .. tostring(arg0) .. "." .. var0), arg1)
    var4((var2("skins/" .. tostring(arg0) .. "." .. var0)))
  end
end
function FileUnProtection(arg0, arg1)
  if fileGetSize((var0(arg0, true))) <= 65540 then
  else
    fileSetPos(var0(arg0, true), 65540)
  end
  var3((var0(arg0, true)))
  return var2("tea", var1(var0(arg0, true), 65540), {key = arg1}) .. var1(var0(arg0, true), fileGetSize((var0(arg0, true))) - 65540)
end
function applySkinToPlayer(arg0, arg1, arg2)
  if arg0 and arg1[2] then
    setPedCustomSkin(arg0, md5(arg1[2]), arg1[2], arg2)
    return
  end
end
function removeSkinFromPlayer(arg0, arg1)
  if arg1 then
    pending_set_custom_skin[arg0] = nil
    exports.object_preview:setTexture(arg1, false)
  else
    removePedCustomSkin(arg0)
  end
end
addEventHandler("onClientElementDataChange", root, function(arg0, arg1, arg2)
  if arg0 == "custom-skin" then
    if arg2 then
      if isElementStreamedIn(source) then
        if not var0(localPlayer, "character:id") then
          return
        end
        applySkinToPlayer(source, arg2)
      end
    else
      removeSkinFromPlayer(source)
    end
  end
end)
addCommandHandler("skinstat", function()
  outputDebugString("All Textures = " .. tostring(#getElementsByType("texture", resourceRoot)))
  outputDebugString("All Shaders = " .. tostring(#getElementsByType("shader", resourceRoot)))
end)
function downloadTexture(arg0, arg1)
  addToDownloadQueue(arg0, arg1)
end
function addToDownloadQueue(arg0, arg1)
  if not arg0 then
    return
  end
  if var0[arg0] then
    arg1(arg0, 0)
    return
  end
  for forvar5, forvar6 in ipairs(var1) do
    if forvar6[1] == arg0 then
      return
    end
  end
  table.insert(var1, {
    arg0,
    arg1,
    url_by_skin_code[arg0]
  })
  guiSetText(downloading_label, "Downloading Skins (" .. tostring(#var1) .. ")")
  if #var1 == 1 then
    triggerServerEvent("skins:download", localPlayer, arg0, url_by_skin_code[arg0])
  end
end
function removeFromDownloadQueue(arg0)
  for forvar4, forvar5 in ipairs(var0) do
    if forvar5[1] == arg0 then
      table.remove(var0, forvar4)
      if #var0 == 0 then
        guiSetText(downloading_label, "")
        break
      end
      guiSetText(downloading_label, "Downloading Skins (" .. tostring(#var0) .. ")")
      triggerServerEvent("skins:download", localPlayer, var0[1][1], var0[1][3])
      break
    end
  end
end
function downloadCallBack(arg0, arg1, arg2)
  if arg0 == 1 then
    if arg2 then
      saveSkin(arg1, arg2)
      arg2 = nil
      for forvar6, forvar7 in ipairs(var0) do
        if forvar7[1] == arg1 then
          forvar7[2](arg1, 1)
        end
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
addEvent("skins:download:callback", true)
addEventHandler("skins:download:callback", localPlayer, downloadCallBack)
function getTexture(arg0, arg1)
  if var0[arg0] then
    return arg1(var0[arg0])
  end
  if var2("skins/" .. arg0 .. "." .. var1) then
    var5((var3("skins/" .. arg0 .. "." .. var1, true)))
    var6("tea", var4(var3("skins/" .. arg0 .. "." .. var1, true), fileGetSize((var3("skins/" .. arg0 .. "." .. var1, true)))), {
      key = "CSKINENCPRO"
    }, function(arg0)
      if arg0 then
        if not var0[var1] then
          var4(var3(":skin-system/skins/" .. var1 .. "_TEMP." .. var2), arg0)
          var5((var3(":skin-system/skins/" .. var1 .. "_TEMP." .. var2)))
          arg0 = nil
          var0[var1] = var6(":skin-system/skins/" .. var1 .. "_TEMP." .. var2, "dxt1")
          fileDelete(":skin-system/skins/" .. var1 .. "_TEMP." .. var2)
        end
        if not var0[var1] then
          var0[var1] = nil
          var7(false)
        else
          var8[var1] = 0
          var7(var0[var1])
        end
      else
        var7(false)
      end
    end)
  else
    arg1(false, "download")
    downloadTexture(arg0, function(arg0, arg1)
      if arg1 == 1 then
        for forvar5, forvar6 in pairs(pending_set_custom_skin) do
          if forvar6[2] == arg0 then
            setCustomSkin(forvar6[1], forvar6[2], forvar6[3], forvar6[4])
          end
        end
      else
        for forvar5, forvar6 in pairs(pending_set_custom_skin) do
          if forvar6[2] == arg0 then
            pending_set_custom_skin[forvar5] = nil
          end
        end
      end
    end)
  end
end
url_by_skin_code = {}
pending_set_custom_skin = {}
processing_set_custom_skin = {}
function getPendingSetCustomSkinCount()
  for forvar4, forvar5 in pairs(pending_set_custom_skin) do
  end
  return 0 + 1
end
function getProcessingSetCustomSkinCount()
  for forvar4, forvar5 in pairs(processing_set_custom_skin) do
  end
  return 0 + 1
end
addCommandHandler("skinsq", function()
  outputDebugString("Queue Count (Pending) = " .. tostring(getPendingSetCustomSkinCount()))
  outputDebugString("Queue Count (Processing) = " .. tostring(getProcessingSetCustomSkinCount()))
end)
function setPedCustomSkin(arg0, arg1, arg2, arg3)
  if var0[arg0] and var0[arg0] == arg1 then
    return false
  end
  if processing_set_custom_skin[arg0] and processing_set_custom_skin[arg0] == arg1 then
    return false
  end
  pending_set_custom_skin[arg0] = {
    arg0,
    arg1,
    arg2,
    arg3
  }
  if getProcessingSetCustomSkinCount() > 1 then
    return
  end
  setCustomSkin(arg0, arg1, arg2, arg3)
end
function setCustomSkin(arg0, arg1, arg2, arg3)
  if isTimer(check_next_pending_timer) then
    return
  end
  url_by_skin_code[arg1] = arg2
  processing_set_custom_skin[arg0] = arg1
  getTexture(arg1, function(arg0, arg1)
    if arg0 then
      if processing_set_custom_skin[var0] and processing_set_custom_skin[var0] == var1 then
        if var2 then
          exports.object_preview:setTexture(var2, arg0)
          var3[var0] = var1
        else
          if not var4[var0] then
            var4[var0] = var5(var6, 0, 150, true, "ped")
          elseif var3[var0] then
            var7[var3[var0]] = var7[var3[var0]] - 1
            if var7[var3[var0]] == 0 then
              destroyElement(var8[var3[var0]])
              var8[var3[var0]] = nil
            end
            var3[var0] = nil
          end
          if var4[var0] then
            engineApplyShaderToWorldTexture(var4[var0], var9(getElementModel(var0)), var0)
            dxSetShaderValue(var4[var0], "tex", arg0)
            var3[var0] = var1
            var7[var1] = var7[var1] + 1
          end
        end
      end
    elseif arg1 ~= "download" and var4[var0] then
      removePedCustomSkin(var0)
    end
    if processing_set_custom_skin[var0] and processing_set_custom_skin[var0] == var1 then
      processing_set_custom_skin[var0] = nil
    end
    if arg1 ~= "download" then
      pending_set_custom_skin[var0] = nil
    end
    collectgarbage()
    checkNextSetQueue()
  end)
end
function checkNextSetQueue()
  if isTimer(check_next_pending_timer) then
    return
  end
  check_next_pending_timer = setTimer(function()
    killTimer(check_next_pending_timer)
    check_next_pending_timer = nil
    for forvar3, forvar4 in pairs(pending_set_custom_skin) do
      if not processing_set_custom_skin[forvar4[2]] then
        setCustomSkin(forvar4[1], forvar4[2], forvar4[3], forvar4[4])
        break
      end
    end
  end, 500, 1)
end
function removePedCustomSkin(arg0)
  pending_set_custom_skin[arg0] = nil
  processing_set_custom_skin[arg0] = nil
  if not var0[arg0] then
    return
  end
  if var1[arg0] then
    var2[var1[arg0]] = var2[var1[arg0]] - 1
    if var2[var1[arg0]] == 0 then
      destroyElement(var3[var1[arg0]])
      var3[var1[arg0]] = nil
    end
  end
  var1[arg0] = nil
  destroyElement(var0[arg0])
  var0[arg0] = nil
  collectgarbage()
end
