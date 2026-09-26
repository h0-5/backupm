-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

GUIEditor = {
  scrollpane = {},
  edit = {},
  button = {},
  label = {},
  staticimage = {},
  combobox = {}
}
addEventHandler("onClientResourceStart", resourceRoot, function()
  GUIEditor.staticimage[1] = guiCreateStaticImage(49, 148, 264, 422, ":interface/rectangle.png", false)
  guiSetProperty(GUIEditor.staticimage[1], "ImageColours", "tl:DD000000 tr:DD000000 bl:DD000000 br:DD000000")
  guiSetVisible(GUIEditor.staticimage[1], false)
  GUIEditor.staticimage[2] = guiCreateStaticImage(0, 0, 264, 31, ":interface/rectangle.png", false, GUIEditor.staticimage[1])
  guiSetProperty(GUIEditor.staticimage[2], "ImageColours", "tl:FE000000 tr:FE000000 bl:FE000000 br:FE000000")
  GUIEditor.label[1] = guiCreateLabel(0, 0, 264, 31, "SETTING", false, GUIEditor.staticimage[2])
  guiLabelSetHorizontalAlign(GUIEditor.label[1], "center", false)
  guiLabelSetVerticalAlign(GUIEditor.label[1], "center")
  GUIEditor.staticimage[3] = guiCreateStaticImage(0, 31, 264, 2, ":interface/rectangle.png", false, GUIEditor.staticimage[1])
  guiSetProperty(GUIEditor.staticimage[3], "ImageColours", "tl:FFAD0000 tr:FFAD0000 bl:FFAD0000 br:FFAD0000")
  GUIEditor.scrollpane[1] = guiCreateScrollPane(10, 43, 254, 343, false, GUIEditor.staticimage[1])
  GUIEditor.label[2] = guiCreateLabel(10, 0, 244, 15, "ID: 0000", false, GUIEditor.scrollpane[1])
  GUIEditor.label[3] = guiCreateLabel(10, 17, 69, 23, "Name:", false, GUIEditor.scrollpane[1])
  guiLabelSetVerticalAlign(GUIEditor.label[3], "center")
  GUIEditor.edit[1] = guiCreateEdit(79, 17, 160, 23, "", false, GUIEditor.scrollpane[1])
  guiSetAlpha(GUIEditor.edit[1], 0.8)
  GUIEditor.label[4] = guiCreateLabel(10, 44, 69, 21, "Interact:", false, GUIEditor.scrollpane[1])
  guiLabelSetVerticalAlign(GUIEditor.label[4], "center")
  GUIEditor.combobox[1] = guiCreateComboBox(79, 44, 160, 300, "", false, GUIEditor.scrollpane[1])
  for forvar3, forvar4 in ipairs(var0) do
    guiComboBoxAddItem(GUIEditor.combobox[1], tostring(forvar4))
  end
  GUIEditor.label[5] = guiCreateLabel(10, 75, 69, 23, "Skin:", false, GUIEditor.scrollpane[1])
  guiLabelSetVerticalAlign(GUIEditor.label[5], "center")
  GUIEditor.label[6] = guiCreateLabel(10, 98, 244, 15, "Position:", false, GUIEditor.scrollpane[1])
  guiLabelSetVerticalAlign(GUIEditor.label[6], "center")
  GUIEditor.label[7] = guiCreateLabel(10, 119, 31, 20, "X:", false, GUIEditor.scrollpane[1])
  guiLabelSetHorizontalAlign(GUIEditor.label[7], "center", false)
  guiLabelSetVerticalAlign(GUIEditor.label[7], "center")
  GUIEditor.edit[2] = guiCreateEdit(51, 119, 188, 20, "", false, GUIEditor.scrollpane[1])
  guiSetAlpha(GUIEditor.edit[2], 0.8)
  GUIEditor.label[8] = guiCreateLabel(10, 139, 31, 20, "Y:", false, GUIEditor.scrollpane[1])
  guiLabelSetHorizontalAlign(GUIEditor.label[8], "center", false)
  guiLabelSetVerticalAlign(GUIEditor.label[8], "center")
  GUIEditor.label[9] = guiCreateLabel(10, 159, 31, 20, "Z:", false, GUIEditor.scrollpane[1])
  guiLabelSetHorizontalAlign(GUIEditor.label[9], "center", false)
  guiLabelSetVerticalAlign(GUIEditor.label[9], "center")
  GUIEditor.edit[3] = guiCreateEdit(51, 139, 188, 20, "", false, GUIEditor.scrollpane[1])
  guiSetAlpha(GUIEditor.edit[3], 0.8)
  GUIEditor.edit[4] = guiCreateEdit(51, 159, 188, 20, "", false, GUIEditor.scrollpane[1])
  guiSetAlpha(GUIEditor.edit[4], 0.8)
  GUIEditor.combobox[2] = guiCreateComboBox(79, 75, 160, 200, "", false, GUIEditor.scrollpane[1])
  guiComboBoxAddItem(GUIEditor.combobox[2], "0")
  GUIEditor.label[10] = guiCreateLabel(10, 179, 51, 20, "Rotation:", false, GUIEditor.scrollpane[1])
  guiLabelSetVerticalAlign(GUIEditor.label[10], "center")
  GUIEditor.edit[5] = guiCreateEdit(81, 179, 158, 20, "", false, GUIEditor.scrollpane[1])
  guiSetAlpha(GUIEditor.edit[5], 0.8)
  GUIEditor.label[11] = guiCreateLabel(10, 209, 61, 20, "Interior:", false, GUIEditor.scrollpane[1])
  guiLabelSetVerticalAlign(GUIEditor.label[11], "center")
  GUIEditor.edit[6] = guiCreateEdit(81, 209, 158, 20, "", false, GUIEditor.scrollpane[1])
  guiSetAlpha(GUIEditor.edit[6], 0.8)
  GUIEditor.label[12] = guiCreateLabel(10, 229, 61, 20, "Dimension:", false, GUIEditor.scrollpane[1])
  guiLabelSetVerticalAlign(GUIEditor.label[12], "center")
  GUIEditor.edit[7] = guiCreateEdit(81, 229, 158, 20, "", false, GUIEditor.scrollpane[1])
  guiSetAlpha(GUIEditor.edit[7], 0.8)
  GUIEditor.label[13] = guiCreateLabel(10, 264, 61, 20, "Frozen:", false, GUIEditor.scrollpane[1])
  guiLabelSetVerticalAlign(GUIEditor.label[13], "center")
  GUIEditor.combobox[3] = guiCreateComboBox(81, 264, 158, 69, "", false, GUIEditor.scrollpane[1])
  guiComboBoxAddItem(GUIEditor.combobox[3], "true")
  guiComboBoxAddItem(GUIEditor.combobox[3], "false")
  GUIEditor.label[14] = guiCreateLabel(10, 303, 229, 15, "Type:", false, GUIEditor.scrollpane[1])
  guiLabelSetVerticalAlign(GUIEditor.label[14], "center")
  GUIEditor.combobox[4] = guiCreateComboBox(10, 323, 229, 198, "", false, GUIEditor.scrollpane[1])
  guiSetAlpha(GUIEditor.combobox[4], 0.8)
  guiComboBoxAddItem(GUIEditor.combobox[4], "immortal: (almost) never dies")
  guiComboBoxAddItem(GUIEditor.combobox[4], "scared: will put hands up or crouch down upon being attacked")
  guiComboBoxAddItem(GUIEditor.combobox[4], "defending: will try to shoot back upon being attacked (given it has a weapon, otherwise punch)")
  guiComboBoxAddItem(GUIEditor.combobox[4], "immortal: (almost) never dies (duplicate to 0)")
  guiComboBoxAddItem(GUIEditor.combobox[4], "pannicing: will run away in pannic upon being attacked")
  guiComboBoxAddItem(GUIEditor.combobox[4], "public transport user: will enter any operated trams")
  GUIEditor.label[15] = guiCreateLabel(10, 355, 229, 15, "Shop ID (for seller interact):", false, GUIEditor.scrollpane[1])
  GUIEditor.edit[8] = guiCreateEdit(10, 375, 229, 20, "", false, GUIEditor.scrollpane[1])
  guiSetAlpha(GUIEditor.edit[8], 0.8)
  GUIEditor.label[16] = guiCreateLabel(10, 405, 229, 15, "Weapon:", false, GUIEditor.scrollpane[1])
  guiLabelSetVerticalAlign(GUIEditor.label[16], "center")
  GUIEditor.combobox[5] = guiCreateComboBox(10, 425, 229, 198, "", false, GUIEditor.scrollpane[1])
  guiSetAlpha(GUIEditor.combobox[5], 0.8)
  for forvar3, forvar4 in ipairs(var1) do
    guiComboBoxAddItem(GUIEditor.combobox[5], getWeaponNameFromID(forvar4))
  end
  GUIEditor.label[17] = guiCreateLabel(10, 460, 229, 15, "Gates ID:", false, GUIEditor.scrollpane[1])
  GUIEditor.edit[9] = guiCreateEdit(10, 480, 229, 20, "", false, GUIEditor.scrollpane[1])
  guiSetAlpha(GUIEditor.edit[9], 0.8)
  GUIEditor.label[18] = guiCreateLabel(10, 520, 229, 15, "Animation:", false, GUIEditor.scrollpane[1])
  guiLabelSetVerticalAlign(GUIEditor.label[16], "center")
  GUIEditor.combobox[6] = guiCreateComboBox(10, 540, 229, 195, "", false, GUIEditor.scrollpane[1])
  GUIEditor.combobox[7] = guiCreateComboBox(10, 565, 229, 195, "", false, GUIEditor.scrollpane[1])
  GUIEditor.button[1] = guiCreateButton(6, 392, 82, 26, "CLOSE", false, GUIEditor.staticimage[1])
  GUIEditor.button[2] = guiCreateButton(177, 392, 82, 26, "SAVE", false, GUIEditor.staticimage[1])
  GUIEditor.button[3] = guiCreateButton(91, 392, 83, 26, "DELETE", false, GUIEditor.staticimage[1])
end)
addEventHandler("onClientGUIComboBoxAccepted", resourceRoot, function(arg0)
  if arg0 == GUIEditor.combobox[6] and tostring(guiComboBoxGetItemText(GUIEditor.combobox[6], (guiComboBoxGetSelected(GUIEditor.combobox[6])))) ~= "" then
    guiComboBoxClear(GUIEditor.combobox[7])
    for forvar7, forvar8 in ipairs(exports["anim-system"]:getAllAnimations().anims[tostring(guiComboBoxGetItemText(GUIEditor.combobox[6], (guiComboBoxGetSelected(GUIEditor.combobox[6]))))]) do
      guiComboBoxAddItem(GUIEditor.combobox[7], forvar8)
    end
  end
end)
addEventHandler("onClientGUIClick", root, function()
  if source == GUIEditor.button[1] then
    guiSetVisible(GUIEditor.staticimage[1], false)
    showCursor(false)
  elseif source == GUIEditor.button[2] then
    if not (guiGetText(GUIEditor.edit[2]) or false) or not (guiGetText(GUIEditor.edit[3]) or false) or not (guiGetText(GUIEditor.edit[4]) or false) then
      return
    end
    getElementData(getPedFromID((tonumber((string.gsub(guiGetText(GUIEditor.label[2]), "ID: ", ""))))), "ped:data").GatesID, getElementData(getPedFromID((tonumber((string.gsub(guiGetText(GUIEditor.label[2]), "ID: ", ""))))), "ped:data").ShopID, getElementData(getPedFromID((tonumber((string.gsub(guiGetText(GUIEditor.label[2]), "ID: ", ""))))), "ped:data").Frozen = guiGetText(GUIEditor.edit[9]), guiGetText(GUIEditor.edit[8]), guiComboBoxGetSelected(GUIEditor.combobox[3]) == 0 and true or false
    getElementData(getPedFromID((tonumber((string.gsub(guiGetText(GUIEditor.label[2]), "ID: ", ""))))), "ped:data").anim = {
      guiComboBoxGetItemText(GUIEditor.combobox[6], guiComboBoxGetSelected(GUIEditor.combobox[6])),
      (guiComboBoxGetItemText(GUIEditor.combobox[7], guiComboBoxGetSelected(GUIEditor.combobox[7])))
    }
    if guiComboBoxGetSelected(GUIEditor.combobox[5]) ~= -1 then
      getElementData(getPedFromID((tonumber((string.gsub(guiGetText(GUIEditor.label[2]), "ID: ", ""))))), "ped:data").Weapon = getWeaponIDFromName(guiComboBoxGetItemText(GUIEditor.combobox[5], (guiComboBoxGetSelected(GUIEditor.combobox[5]))))
    end
    triggerServerEvent("ped:updatePedInDataBase", localPlayer, tonumber((string.gsub(guiGetText(GUIEditor.label[2]), "ID: ", ""))), guiGetText(GUIEditor.edit[1]) or "Unnamed Ped", guiComboBoxGetItemText(GUIEditor.combobox[1], (guiComboBoxGetSelected(GUIEditor.combobox[1]))) or "", math.max(guiComboBoxGetSelected(GUIEditor.combobox[4]), 0), {
      tonumber(guiComboBoxGetItemText(GUIEditor.combobox[2], (guiComboBoxGetSelected(GUIEditor.combobox[2])))) or 0,
      guiGetText(GUIEditor.edit[2]) or false,
      guiGetText(GUIEditor.edit[3]) or false,
      guiGetText(GUIEditor.edit[4]) or false,
      guiGetText(GUIEditor.edit[5]) or false,
      tonumber(guiGetText(GUIEditor.edit[6])) or false,
      tonumber(guiGetText(GUIEditor.edit[7])) or false
    }, getElementData(getPedFromID((tonumber((string.gsub(guiGetText(GUIEditor.label[2]), "ID: ", ""))))), "ped:data"), getElementData(getPedFromID((tonumber((string.gsub(guiGetText(GUIEditor.label[2]), "ID: ", ""))))), "ped:owner"), (guiComboBoxGetSelected(GUIEditor.combobox[5])))
  elseif source == GUIEditor.button[3] then
    triggerServerEvent("ped:deletePedFromDataBase", localPlayer, (tonumber((string.gsub(guiGetText(GUIEditor.label[2]), "ID: ", "")))))
    guiSetVisible(GUIEditor.staticimage[1], false)
    showCursor(false)
  end
end)
function getPedFromID(arg0)
  return getElementByID("ped:" .. tostring(arg0)) or false
end
skins = {
  [0] = {
    7,
    14,
    15,
    17,
    20,
    21,
    24,
    25,
    26,
    29,
    35,
    36,
    37,
    44,
    46,
    57,
    58,
    59,
    60,
    68,
    72,
    98,
    147,
    185,
    186,
    187,
    223,
    227,
    228,
    234,
    235,
    240,
    258,
    259
  },
  [1] = {
    9,
    11,
    12,
    40,
    41,
    55,
    56,
    69,
    76,
    88,
    89,
    91,
    93,
    129,
    130,
    141,
    148,
    150,
    151,
    190,
    191,
    192,
    193,
    194,
    196,
    211,
    215,
    216,
    219,
    224,
    225,
    226,
    233,
    263
  }
}
addEvent("onClientElementMenuShow", true)
addEventHandler("onClientElementMenuShow", root, function(arg0, arg1, arg2)
  if arg2 == "ped" and arg1 <= 3 then
    if not isElement(arg0) then
      return
    end
    exports.interaction:addInteractOption(arg0, {
      text = "Talk",
      data = {
        interact = getElementData(arg0, "ped:interact"),
        data = getElementData(arg0, "ped:data")
      }
    })
  end
end)
addEvent("onClientElementMenuClick", true)
addEventHandler("onClientElementMenuClick", root, function(arg0, arg1, arg2)
  if getElementType(arg0) == "ped" and arg1 == "Edit" then
    guiSetVisible(GUIEditor.staticimage[1], true)
    showCursor(true)
    guiSetText(GUIEditor.label[2], "ID: " .. tostring(arg2.ID))
    guiSetText(GUIEditor.edit[1], tostring((getElementData(arg0, "ped:name"))))
    guiSetText(GUIEditor.edit[2], tostring(getElementPosition(arg0)))
    guiSetText(GUIEditor.edit[3], tostring(getElementPosition(arg0)))
    guiSetText(GUIEditor.edit[4], tostring(getElementPosition(arg0)))
    guiSetText(GUIEditor.edit[5], tostring(getElementRotation(arg0)))
    guiSetText(GUIEditor.edit[6], tostring((getElementInterior(arg0))))
    guiSetText(GUIEditor.edit[7], tostring((getElementDimension(arg0))))
    guiComboBoxClear(GUIEditor.combobox[2])
    guiComboBoxAddItem(GUIEditor.combobox[2], (getElementModel(arg0)))
    guiComboBoxSetSelected(GUIEditor.combobox[2], 0)
    for forvar16, forvar17 in ipairs(getValidPedModels()) do
      if forvar17 ~= getElementModel(arg0) then
        guiComboBoxAddItem(GUIEditor.combobox[2], tostring(forvar17))
      end
    end
    if getElementData(arg0, "ped:data").Frozen then
      guiComboBoxSetSelected(GUIEditor.combobox[3], 0)
    else
      guiComboBoxSetSelected(GUIEditor.combobox[3], 1)
    end
    guiComboBoxSetSelected(GUIEditor.combobox[4], (getElementData(arg0, "ped:behaviour")))
    guiSetText(GUIEditor.edit[8], tostring(getElementData(arg0, "ped:data").ShopID))
    for forvar20, forvar21 in ipairs(var0) do
      if forvar21 == getElementData(arg0, "ped:interact") then
        break
      end
    end
    guiComboBoxSetSelected(GUIEditor.combobox[1], forvar20 - 1)
    guiComboBoxClear(GUIEditor.combobox[6])
    guiComboBoxClear(GUIEditor.combobox[7])
    for forvar21, forvar22 in ipairs(exports["anim-system"]:getAllAnimations().groups) do
      if guiComboBoxAddItem(GUIEditor.combobox[6], forvar22) and getElementData(arg0, "ped:data").anim and getElementData(arg0, "ped:data").anim[1] == forvar22 then
        guiComboBoxSetSelected(GUIEditor.combobox[6], (guiComboBoxAddItem(GUIEditor.combobox[6], forvar22)))
        for forvar27, forvar28 in ipairs(exports["anim-system"]:getAllAnimations().anims[forvar22]) do
          if guiComboBoxAddItem(GUIEditor.combobox[7], forvar28) and getElementData(arg0, "ped:data").anim and getElementData(arg0, "ped:data").anim[2] == forvar28 then
            guiComboBoxSetSelected(GUIEditor.combobox[7], (guiComboBoxAddItem(GUIEditor.combobox[7], forvar28)))
          end
        end
      end
    end
  end
end)
function UIKitReady()
  eui = exports.UIKit
  var0 = eui:getUIFont("default-large")
end
addEventHandler("onClientUIReady", resourceRoot, UIKitReady)
addEventHandler("onClientUIKitReady", root, UIKitReady)
setTimer(function()
  var0 = getCameraMatrix() and getCameraMatrix() and getCameraMatrix() and getElementsWithinRange(getCameraMatrix()) or {}
  if not isPedInVehicle(localPlayer) then
    if #(getElementPosition(localPlayer) and getElementPosition(localPlayer) and getElementPosition(localPlayer) and getElementsWithinRange(getElementPosition(localPlayer)) or {}) > 0 then
      if not var1 then
        exports.notifications:showKeyDescription("ped:talk", "E", "Talk")
        var1 = true
      end
    elseif var1 then
      exports.notifications:hideKeyDescription("ped:talk")
      var1 = false
    end
  end
end, 1500, 0)
function drawPedsName()
  if not getElementData(localPlayer, "character:id") then
    return
  end
  if isPlayerMapVisible() then
    return
  end
  for forvar7 = 1, #var0 do
    if var0[forvar7] ~= localPlayer and isElement(var0[forvar7]) and isElementOnScreen(var0[forvar7]) and getElementData(var0[forvar7], "ped:name") and getDistanceBetween3DPoints(getPedBonePosition(var0[forvar7], 8)) <= 15 then
      setPedLookAt(var0[forvar7], getPedBonePosition(var0[forvar7], 8))
      if isLineOfSightClear(getCameraMatrix()) and getScreenFromWorldPosition(getPedBonePosition(var0[forvar7], 8)) and getScreenFromWorldPosition(getPedBonePosition(var0[forvar7], 8)) then
        dxDrawText(tostring((getElementData(var0[forvar7], "ped:name"))) .. " (NPC)", getScreenFromWorldPosition(getPedBonePosition(var0[forvar7], 8)) + 2, getScreenFromWorldPosition(getPedBonePosition(var0[forvar7], 8)) + 2, getScreenFromWorldPosition(getPedBonePosition(var0[forvar7], 8)))
        dxDrawText(tostring((getElementData(var0[forvar7], "ped:name"))) .. " #FF0000(NPC)", getScreenFromWorldPosition(getPedBonePosition(var0[forvar7], 8)))
      end
    end
  end
end
addEventHandler("onClientCharacterSpawn", localPlayer, function()
  addEventHandler("onClientRender", root, drawPedsName, false)
end)
addEventHandler("onClientResourceStart", resourceRoot, function()
  if getElementData(localPlayer, "character:id") then
    addEventHandler("onClientRender", root, drawPedsName, false)
  end
end)
addEventHandler("onClientPlayerQuitFromCharacter", localPlayer, function()
  removeEventHandler("onClientRender", root, drawPedsName)
end)
function getDistanceBetween3DPoints(arg0, arg1, arg2, arg3, arg4, arg5)
  return math.sqrt((arg3 - arg0) ^ 2 + (arg4 - arg1) ^ 2 + (arg5 - arg2) ^ 2)
end
function doPedShootDefence(arg0, arg1)
  setPedAimTarget(arg0, getElementPosition(arg1))
  setPedControlState(arg0, "aim_weapon", true)
  setPedControlState(arg0, "fire", true)
  reloadWeaponForPed(arg0)
  if var0[arg0] then
    var0[arg0] = var0[arg0] + 1
  else
    var0[arg0] = 1
  end
  if var0[arg0] == 10 or var0[arg0] > 10 then
    pedStopShooting(arg0)
    var0[arg0] = 0
  end
end
function pedStopShooting(arg0)
  setPedControlState(arg0, "aim_weapon", false)
  setPedControlState(arg0, "fire", false)
  if var0[source] then
    killTimer(var0[source])
    var0[source] = nil
  end
end
function reloadWeaponForPed(arg0)
end
function tryAttackPed(arg0, arg1, arg2, arg3)
  if tonumber(getElementData(source, "ped:behaviour")) then
    if tonumber(getElementData(source, "ped:behaviour")) == 0 or tonumber(getElementData(source, "ped:behaviour")) == 3 then
      setElementHealth(source, 100)
      cancelEvent()
    elseif tonumber(getElementData(source, "ped:behaviour")) == 1 then
      if ({
        "handsup",
        "WEAPON_crouch"
      })[math.random(#{
        "handsup",
        "WEAPON_crouch"
      })] == "handsup" then
        setPedAnimation(source, "ped", ({
          "handsup",
          "WEAPON_crouch"
        })[math.random(#{
          "handsup",
          "WEAPON_crouch"
        })], -1, false, false, true, true)
      else
        setPedAnimation(source, "ped", ({
          "handsup",
          "WEAPON_crouch"
        })[math.random(#{
          "handsup",
          "WEAPON_crouch"
        })])
      end
    elseif tonumber(getElementData(source, "ped:behaviour")) == 2 then
      doPedShootDefence(source, arg0)
      if not var0 then
        var0[source] = setTimer(doPedShootDefence, 1000, 10, source, arg0)
      end
    elseif tonumber(getElementData(source, "ped:behaviour")) == 4 then
      setPedAnimation(source, "ped", "sprint_panic")
    end
  end
end
addEventHandler("onClientPedDamage", getRootElement(), tryAttackPed)
function pedTalk(arg0, arg1)
  triggerServerEvent("ped:pedTalk", localPlayer, arg0, arg1)
end
addEventHandler("onClientElementStreamIn", resourceRoot, function()
  if getElementData(source, "ped:data") and getElementData(source, "ped:data").anim then
    setPedAnimation(source, getElementData(source, "ped:data").anim[1], getElementData(source, "ped:data").anim[2], -1, true, false, false, true)
  end
end)
function talk_key(arg0, arg1)
  if isPedDead(localPlayer) then
    return
  end
  if isPedInVehicle(localPlayer) then
    return
  end
  if isCursorShowing() then
    return
  end
  for forvar8, forvar9 in ipairs(var0) do
    if isElement(forvar9) and getDistanceBetweenPoints2D(getElementPosition(localPlayer)) < 3 then
      table.insert({}, {
        forvar9,
        (getDistanceBetweenPoints2D(getElementPosition(localPlayer)))
      })
    end
  end
  table.sort({}, function(arg0, arg1)
    return tonumber(arg0[2]) < tonumber(arg1[2])
  end)
  if #{} > 0 then
    exports.interaction:executeInteractOption(({})[1][1], {
      text = "Talk",
      data = {
        interact = getElementData(({})[1][1], "ped:interact"),
        data = getElementData(({})[1][1], "ped:data")
      }
    })
  end
end
bindKey("E", "down", talk_key)
