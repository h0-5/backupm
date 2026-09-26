-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

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
  UI.window[1] = eui:uiCreateWindow(50, false, 250, 330, "Attachments")
  eui:uiSetVisible(UI.window[1], false)
  UI.label.MainSection = eui:uiCreateLabel(5, 35, 240, 290, "", "primary", "left", "top", UI.window[1])
  UI.gridlist[1] = eui:uiCreateGridList(0, 0, 240, 210, tocolor(10, 10, 10, 0), UI.label.MainSection)
  eui:uiGridListAddColumn(UI.gridlist[1], "Elements", 0.9)
  UI.button[2] = eui:uiCreateButton(0, 260, 240, 30, {en = "Close", ar = "\216\165\216\186\217\132\216\167\217\130"}, tocolor(0, 0, 0), UI.label.MainSection)
  UI.button[3] = eui:uiCreateButton(0, 225, 240, 30, {en = "Remove", ar = "\216\173\216\176\217\129"}, tocolor(0, 0, 0), UI.label.MainSection)
  UI.label.Section2 = eui:uiCreateLabel(5, 35, 240, 290, "", "primary", "left", "top", UI.window[1])
  eui:uiSetVisible(UI.label.Section2, false)
  UI.label.ReturnToMainSection = eui:uiCreateLabel(0, 0, 240, 20, {
    en = "Return back",
    ar = "\216\167\217\132\216\185\217\136\216\175\216\169 \217\132\217\132\216\174\217\132\217\129"
  }, "primary", "center", "center", UI.label.Section2)
  UI.checkbox[1] = eui:uiCreateCheckBox(10, 25, 120, 20, "Collision", true, _, UI.label.Section2)
  eui:uiCreateLabel(0, 45, 20, 20, "X", tocolor(255, 255, 255, 255), "center", "center", UI.label.Section2)
  UI.edit.x = eui:uiCreateEdit(25, 45, 210, 20, "", "Offset X", _, UI.label.Section2)
  eui:uiCreateLabel(0, 45 + 22, 20, 20, "Y", tocolor(255, 255, 255, 255), "center", "center", UI.label.Section2)
  UI.edit.y = eui:uiCreateEdit(25, 45 + 22, 210, 20, "", "Offset Y", _, UI.label.Section2)
  eui:uiCreateLabel(0, 45 + 44, 20, 20, "Z", tocolor(255, 255, 255, 255), "center", "center", UI.label.Section2)
  UI.edit.z = eui:uiCreateEdit(25, 45 + 44, 210, 20, "Offset Z", "", _, UI.label.Section2)
  eui:uiCreateLabel(0, 45 + 44 + 20 + 15, 20, 20, "RX", tocolor(255, 255, 255, 255), "center", "center", UI.label.Section2)
  UI.edit.rx = eui:uiCreateEdit(25, 45 + 44 + 20 + 15, 210, 20, "", "Offset RX", _, UI.label.Section2)
  eui:uiCreateLabel(0, 45 + 44 + 20 + 15 + 22, 20, 20, "RY", tocolor(255, 255, 255, 255), "center", "center", UI.label.Section2)
  UI.edit.ry = eui:uiCreateEdit(25, 45 + 44 + 20 + 15 + 22, 210, 20, "", "Offset RY", _, UI.label.Section2)
  eui:uiCreateLabel(0, 45 + 44 + 20 + 15 + 44, 20, 20, "RZ", tocolor(255, 255, 255, 255), "center", "center", UI.label.Section2)
  UI.edit.rz = eui:uiCreateEdit(25, 45 + 44 + 20 + 15 + 44, 210, 20, "Offset RZ", "", _, UI.label.Section2)
  UI.label.scale = eui:uiCreateLabel(0, 45 + 44 + 20 + 15 + 66, 50, 20, "Scale", _, "center", "center", UI.label.Section2)
  UI.edit.scale = eui:uiCreateEdit(55, 45 + 44 + 20 + 15 + 66, 160, 20, "Scale X", "", _, UI.label.Section2)
  UI.edit.scaleY = eui:uiCreateEdit(55, 45 + 44 + 20 + 15 + 66 + 20, 160, 20, "Scale Y", "", _, UI.label.Section2)
  UI.edit.scaleZ = eui:uiCreateEdit(55, 45 + 44 + 20 + 15 + 66 + 40, 160, 20, "Scale Z", "", _, UI.label.Section2)
  eui:uiSetVisible(UI.label.scale, false)
  eui:uiSetVisible(UI.edit.scale, false)
  eui:uiSetVisible(UI.edit.scaleY, false)
  eui:uiSetVisible(UI.edit.scaleZ, false)
  UI.button[1] = eui:uiCreateButton(0, 260, 240, 30, {
    en = "Apply Changes",
    ar = "\216\170\216\183\216\168\217\138\217\130 \216\167\217\132\216\170\216\186\217\138\217\138\216\177\216\167\216\170"
  }, "primary", UI.label.Section2)
end
addEventHandler("onClientUIReady", resourceRoot, UIKitReady)
addEventHandler("onClientUIKitReady", root, UIKitReady)
function closeUIWindows(arg0)
  eui:uiSetVisible(UI.window[1], false)
end
addEvent("onClientPlayerQuitFromCharacter", true)
addEventHandler("onClientPlayerQuitFromCharacter", localPlayer, closeUIWindows)
addEventHandler("onClientPlayerWasted", localPlayer, closeUIWindows)
function changeAlpha()
  if source == UI.label.ReturnToMainSection then
    eui:uiSetAlpha(source, eventName == "onClientUIMouseEnter" and 100 or 255)
  end
end
addEventHandler("onClientUIMouseEnter", root, changeAlpha)
addEventHandler("onClientUIMouseLeave", root, changeAlpha)
addEventHandler("onClientUIChanged", root, function()
  if source == UI.edit.scale or source == UI.edit.scaleY or source == UI.edit.scaleZ then
    if tonumber((eui:uiGetText(source))) then
      if tonumber((eui:uiGetText(source))) > 3 then
        eui:uiSetText(source, "3")
      end
    else
      eui:uiSetText(source, "")
    end
  elseif source == UI.edit.rx or source == UI.edit.ry or source == UI.edit.rz then
    if tonumber("-0") then
      if tonumber("-0") > 360 then
        eui:uiSetText(source, "360")
      elseif tonumber("-0") < -360 then
        eui:uiSetText(source, "-360")
      end
    else
      eui:uiSetText(source, "")
    end
  end
end)
addEventHandler("onClientUIClick", root, function()
  if source == UI.button[2] then
    eui:uiSetVisible(UI.window[1], false)
  elseif source == UI.label.ReturnToMainSection then
    eui:uiSetVisible(UI.label.Section2, false)
    eui:uiSetVisible(UI.label.MainSection, true)
  elseif source == UI.button[1] then
    if eui:uiGridListGetSelectedItem(UI.gridlist[1]) ~= -1 then
      if tonumber(eui:uiGetText(UI.edit.x)) and tonumber(eui:uiGetText(UI.edit.y)) and tonumber(eui:uiGetText(UI.edit.z)) and tonumber(eui:uiGetText(UI.edit.rx)) and tonumber(eui:uiGetText(UI.edit.ry)) and tonumber(eui:uiGetText(UI.edit.rz)) and tonumber(eui:uiGetText(UI.edit.scale)) then
        if tonumber(eui:uiGetText(UI.edit.x)) <= getElementBoundingBox(var0) + 1 and tonumber(eui:uiGetText(UI.edit.x)) >= getElementBoundingBox(var0) - 1 and tonumber(eui:uiGetText(UI.edit.y)) <= getElementBoundingBox(var0) + 1 and tonumber(eui:uiGetText(UI.edit.y)) >= getElementBoundingBox(var0) - 1 and tonumber(eui:uiGetText(UI.edit.z)) <= getElementBoundingBox(var0) + 1 and tonumber(eui:uiGetText(UI.edit.z)) >= getElementBoundingBox(var0) - 1 then
          triggerServerEvent("attachments:changeOffset", localPlayer, eui:uiGridListGetItemData(UI.gridlist[1], eui:uiGridListGetSelectedItem(UI.gridlist[1]), 1).ID, var0, tonumber(eui:uiGetText(UI.edit.x)), tonumber(eui:uiGetText(UI.edit.y)), tonumber(eui:uiGetText(UI.edit.z)), tonumber(eui:uiGetText(UI.edit.rx)), tonumber(eui:uiGetText(UI.edit.ry)), tonumber(eui:uiGetText(UI.edit.rz)), {
            tonumber(eui:uiGetText(UI.edit.scale)),
            tonumber(eui:uiGetText(UI.edit.scaleY)) or tonumber(eui:uiGetText(UI.edit.scale)),
            tonumber(eui:uiGetText(UI.edit.scaleZ)) or tonumber(eui:uiGetText(UI.edit.scale))
          }, false)
          eui:uiGridListGetItemData(UI.gridlist[1], eui:uiGridListGetSelectedItem(UI.gridlist[1]), 1).ScaleZ, eui:uiGridListGetItemData(UI.gridlist[1], eui:uiGridListGetSelectedItem(UI.gridlist[1]), 1).ScaleY, eui:uiGridListGetItemData(UI.gridlist[1], eui:uiGridListGetSelectedItem(UI.gridlist[1]), 1).ScaleX, eui:uiGridListGetItemData(UI.gridlist[1], eui:uiGridListGetSelectedItem(UI.gridlist[1]), 1).rz_Offset, eui:uiGridListGetItemData(UI.gridlist[1], eui:uiGridListGetSelectedItem(UI.gridlist[1]), 1).ry_Offset, eui:uiGridListGetItemData(UI.gridlist[1], eui:uiGridListGetSelectedItem(UI.gridlist[1]), 1).rx_Offset, eui:uiGridListGetItemData(UI.gridlist[1], eui:uiGridListGetSelectedItem(UI.gridlist[1]), 1).z_Offset, eui:uiGridListGetItemData(UI.gridlist[1], eui:uiGridListGetSelectedItem(UI.gridlist[1]), 1).y_Offset, eui:uiGridListGetItemData(UI.gridlist[1], eui:uiGridListGetSelectedItem(UI.gridlist[1]), 1).x_Offset = tonumber(eui:uiGetText(UI.edit.scaleZ)) or tonumber(eui:uiGetText(UI.edit.scale)), tonumber(eui:uiGetText(UI.edit.scaleY)) or tonumber(eui:uiGetText(UI.edit.scale)), tonumber(eui:uiGetText(UI.edit.scale)), tonumber(eui:uiGetText(UI.edit.rz)), tonumber(eui:uiGetText(UI.edit.ry)), tonumber(eui:uiGetText(UI.edit.rx)), tonumber(eui:uiGetText(UI.edit.z)), tonumber(eui:uiGetText(UI.edit.y)), tonumber(eui:uiGetText(UI.edit.x))
          eui:uiGridListGetItemData(UI.gridlist[1], eui:uiGridListGetSelectedItem(UI.gridlist[1]), 1).Data.collision = false
          eui:uiGridListSetItemData(UI.gridlist[1], eui:uiGridListGetSelectedItem(UI.gridlist[1]), 1, (eui:uiGridListGetItemData(UI.gridlist[1], eui:uiGridListGetSelectedItem(UI.gridlist[1]), 1)))
        else
          outputChatBox("Error: The coordinates are out of bounds.", 255, 0, 0)
        end
      end
    end
  elseif source == UI.button[3] and eui:uiGridListGetSelectedItem(UI.gridlist[1]) ~= -1 then
    triggerServerEvent("attachments:detachObject", localPlayer, eui:uiGridListGetItemData(UI.gridlist[1], eui:uiGridListGetSelectedItem(UI.gridlist[1]), 1).ID, var0)
    eui:uiGridListRemoveRow(UI.gridlist[1], (eui:uiGridListGetSelectedItem(UI.gridlist[1])))
  end
end)
function drawElementBoundingBox()
  if isElement(var0) then
    dxDrawLine3D(var0.matrix:transformPosition(Vector3(getElementBoundingBox(var0))).x, var0.matrix:transformPosition(Vector3(getElementBoundingBox(var0))).y, var0.matrix:transformPosition(Vector3(getElementBoundingBox(var0))).z, var0.matrix:transformPosition(Vector3(getElementBoundingBox(var0))).x, var0.matrix:transformPosition(Vector3(getElementBoundingBox(var0))).y, var0.matrix:transformPosition(Vector3(getElementBoundingBox(var0))).z, tocolor(255, 0, 0, 200), 1)
    dxDrawLine3D(var0.matrix:transformPosition(Vector3(getElementBoundingBox(var0))).x, var0.matrix:transformPosition(Vector3(getElementBoundingBox(var0))).y, var0.matrix:transformPosition(Vector3(getElementBoundingBox(var0))).z, var0.matrix:transformPosition(Vector3(getElementBoundingBox(var0))).x, var0.matrix:transformPosition(Vector3(getElementBoundingBox(var0))).y, var0.matrix:transformPosition(Vector3(getElementBoundingBox(var0))).z, tocolor(255, 0, 0, 200), 1)
    dxDrawLine3D(var0.matrix:transformPosition(Vector3(getElementBoundingBox(var0))).x, var0.matrix:transformPosition(Vector3(getElementBoundingBox(var0))).y, var0.matrix:transformPosition(Vector3(getElementBoundingBox(var0))).z, var0.matrix:transformPosition(Vector3(getElementBoundingBox(var0))).x, var0.matrix:transformPosition(Vector3(getElementBoundingBox(var0))).y, var0.matrix:transformPosition(Vector3(getElementBoundingBox(var0))).z, tocolor(255, 0, 0, 200), 1)
    dxDrawLine3D(var0.matrix:transformPosition(Vector3(getElementBoundingBox(var0))).x, var0.matrix:transformPosition(Vector3(getElementBoundingBox(var0))).y, var0.matrix:transformPosition(Vector3(getElementBoundingBox(var0))).z, var0.matrix:transformPosition(Vector3(getElementBoundingBox(var0))).x, var0.matrix:transformPosition(Vector3(getElementBoundingBox(var0))).y, var0.matrix:transformPosition(Vector3(getElementBoundingBox(var0))).z, tocolor(255, 0, 0, 200), 1)
    dxDrawLine3D(var0.matrix:transformPosition(Vector3(getElementBoundingBox(var0))).x, var0.matrix:transformPosition(Vector3(getElementBoundingBox(var0))).y, var0.matrix:transformPosition(Vector3(getElementBoundingBox(var0))).z, var0.matrix:transformPosition(Vector3(getElementBoundingBox(var0))).x, var0.matrix:transformPosition(Vector3(getElementBoundingBox(var0))).y, var0.matrix:transformPosition(Vector3(getElementBoundingBox(var0))).z, tocolor(255, 0, 0, 200), 1)
    dxDrawLine3D(var0.matrix:transformPosition(Vector3(getElementBoundingBox(var0))).x, var0.matrix:transformPosition(Vector3(getElementBoundingBox(var0))).y, var0.matrix:transformPosition(Vector3(getElementBoundingBox(var0))).z, var0.matrix:transformPosition(Vector3(getElementBoundingBox(var0))).x, var0.matrix:transformPosition(Vector3(getElementBoundingBox(var0))).y, var0.matrix:transformPosition(Vector3(getElementBoundingBox(var0))).z, tocolor(255, 0, 0, 200), 1)
    dxDrawLine3D(var0.matrix:transformPosition(Vector3(getElementBoundingBox(var0))).x, var0.matrix:transformPosition(Vector3(getElementBoundingBox(var0))).y, var0.matrix:transformPosition(Vector3(getElementBoundingBox(var0))).z, var0.matrix:transformPosition(Vector3(getElementBoundingBox(var0))).x, var0.matrix:transformPosition(Vector3(getElementBoundingBox(var0))).y, var0.matrix:transformPosition(Vector3(getElementBoundingBox(var0))).z, tocolor(255, 0, 0, 200), 1)
    dxDrawLine3D(var0.matrix:transformPosition(Vector3(getElementBoundingBox(var0))).x, var0.matrix:transformPosition(Vector3(getElementBoundingBox(var0))).y, var0.matrix:transformPosition(Vector3(getElementBoundingBox(var0))).z, var0.matrix:transformPosition(Vector3(getElementBoundingBox(var0))).x, var0.matrix:transformPosition(Vector3(getElementBoundingBox(var0))).y, var0.matrix:transformPosition(Vector3(getElementBoundingBox(var0))).z, tocolor(255, 0, 0, 200), 1)
    dxDrawLine3D(var0.matrix:transformPosition(Vector3(getElementBoundingBox(var0))).x, var0.matrix:transformPosition(Vector3(getElementBoundingBox(var0))).y, var0.matrix:transformPosition(Vector3(getElementBoundingBox(var0))).z, var0.matrix:transformPosition(Vector3(getElementBoundingBox(var0))).x, var0.matrix:transformPosition(Vector3(getElementBoundingBox(var0))).y, var0.matrix:transformPosition(Vector3(getElementBoundingBox(var0))).z, tocolor(255, 0, 0, 200), 1)
    dxDrawLine3D(var0.matrix:transformPosition(Vector3(getElementBoundingBox(var0))).x, var0.matrix:transformPosition(Vector3(getElementBoundingBox(var0))).y, var0.matrix:transformPosition(Vector3(getElementBoundingBox(var0))).z, var0.matrix:transformPosition(Vector3(getElementBoundingBox(var0))).x, var0.matrix:transformPosition(Vector3(getElementBoundingBox(var0))).y, var0.matrix:transformPosition(Vector3(getElementBoundingBox(var0))).z, tocolor(255, 0, 0, 200), 1)
    dxDrawLine3D(var0.matrix:transformPosition(Vector3(getElementBoundingBox(var0))).x, var0.matrix:transformPosition(Vector3(getElementBoundingBox(var0))).y, var0.matrix:transformPosition(Vector3(getElementBoundingBox(var0))).z, var0.matrix:transformPosition(Vector3(getElementBoundingBox(var0))).x, var0.matrix:transformPosition(Vector3(getElementBoundingBox(var0))).y, var0.matrix:transformPosition(Vector3(getElementBoundingBox(var0))).z, tocolor(255, 0, 0, 200), 1)
    dxDrawLine3D(var0.matrix:transformPosition(Vector3(getElementBoundingBox(var0))).x, var0.matrix:transformPosition(Vector3(getElementBoundingBox(var0))).y, var0.matrix:transformPosition(Vector3(getElementBoundingBox(var0))).z, var0.matrix:transformPosition(Vector3(getElementBoundingBox(var0))).x, var0.matrix:transformPosition(Vector3(getElementBoundingBox(var0))).y, var0.matrix:transformPosition(Vector3(getElementBoundingBox(var0))).z, tocolor(255, 0, 0, 200), 1)
  else
    removeEventHandler("onClientRender", root, drawElementBoundingBox)
  end
end
function changeAttachmentOffset(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8)
  if (current_attachment_data or {}).bone then
  else
  end
  if not (arg2 <= getElementBoundingBox(arg1) + 0.5) or not (arg2 >= getElementBoundingBox(arg1) - 0.5) or not (arg3 <= getElementBoundingBox(arg1) + 0.5) or not (arg3 >= getElementBoundingBox(arg1) - 0.5) or not (arg4 <= getElementBoundingBox(arg1) + 0.5) or not (arg4 >= getElementBoundingBox(arg1) - 0.5) then
    outputChatBox("Error: The coordinates are out of bounds.", 255, 0, 0)
    return false
  end
  if arg5 > 360 or arg5 < -360 then
    arg5 = 0
  end
  if arg6 > 360 or arg6 < -360 then
    arg6 = 0
  end
  if arg7 > 360 or arg7 < -360 then
    arg7 = 0
  end
  setObjectScale(arg0, math.max(arg8[1], 0.2), math.max(arg8[2], 0.2), math.max(arg8[3], 0.2))
  if (current_attachment_data or {}).bone then
    exports.pAttach:setPositionOffset(arg0, arg2, arg3, arg4)
    exports.pAttach:setRotationOffset(arg0, arg5, arg6, arg7)
  else
    attachElements(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7)
  end
  return true
end
function movemnet(arg0, arg1)
  if arg1 == "down" then
    if not isCursorShowing() then
      return
    end
    if getKeyState("lshift") then
    end
    if isTimer(var0) then
      killTimer(var0)
    end
    if arg0 == "arrow_l" then
      eui:uiSetText(UI.edit.x, tostring(tonumber(eui:uiGetText(UI.edit.x)) - 0.04))
      var0 = setTimer(function()
        var0 = var0 - var1
        eui:uiSetText(UI.edit.x, tostring(var0))
        changeAttachmentOffset(var2, var3, var0, var4, var5, var6, var7, var8, var9)
      end, 500, 0)
    elseif arg0 == "arrow_r" then
      eui:uiSetText(UI.edit.x, tostring(tonumber(eui:uiGetText(UI.edit.x)) - 0.04 + 0.04))
      var0 = setTimer(function()
        var0 = var0 + var1
        eui:uiSetText(UI.edit.x, tostring(var0))
        changeAttachmentOffset(var2, var3, var0, var4, var5, var6, var7, var8, var9)
      end, 500, 0)
    elseif arg0 == "arrow_u" then
      eui:uiSetText(UI.edit.y, tostring(tonumber(eui:uiGetText(UI.edit.y)) + 0.04))
      var0 = setTimer(function()
        var0 = var0 + var1
        eui:uiSetText(UI.edit.y, tostring(var0))
        changeAttachmentOffset(var2, var3, var4, var0, var5, var6, var7, var8, var9)
      end, 500, 0)
    elseif arg0 == "arrow_d" then
      eui:uiSetText(UI.edit.y, tostring(tonumber(eui:uiGetText(UI.edit.y)) + 0.04 - 0.04))
      var0 = setTimer(function()
        var0 = var0 - var1
        eui:uiSetText(UI.edit.y, tostring(var0))
        changeAttachmentOffset(var2, var3, var4, var0, var5, var6, var7, var8, var9)
      end, 500, 0)
    elseif arg0 == "pgup" then
      eui:uiSetText(UI.edit.z, tostring(tonumber(eui:uiGetText(UI.edit.z)) + 0.04))
      var0 = setTimer(function()
        var0 = var0 + var1
        eui:uiSetText(UI.edit.z, tostring(var0))
        changeAttachmentOffset(var2, var3, var4, var5, var0, var6, var7, var8, var9)
      end, 500, 0)
    elseif arg0 == "pgdn" then
      eui:uiSetText(UI.edit.z, tostring(tonumber(eui:uiGetText(UI.edit.z)) + 0.04 - 0.04))
      var0 = setTimer(function()
        var0 = var0 - var1
        eui:uiSetText(UI.edit.z, tostring(var0))
        changeAttachmentOffset(var2, var3, var4, var5, var0, var6, var7, var8, var9)
      end, 500, 0)
    end
    changeAttachmentOffset(var1, var2, tonumber(eui:uiGetText(UI.edit.x)) - 0.04 + 0.04, tonumber(eui:uiGetText(UI.edit.y)) + 0.04 - 0.04, tonumber(eui:uiGetText(UI.edit.z)) + 0.04 - 0.04, tonumber(eui:uiGetText(UI.edit.rx)), tonumber(eui:uiGetText(UI.edit.ry)), tonumber(eui:uiGetText(UI.edit.rz)), {
      tonumber(eui:uiGetText(UI.edit.scale)),
      tonumber(eui:uiGetText(UI.edit.scaleY)) or tonumber(eui:uiGetText(UI.edit.scale)),
      tonumber(eui:uiGetText(UI.edit.scaleZ)) or tonumber(eui:uiGetText(UI.edit.scale))
    })
  elseif arg1 == "up" and isTimer(var0) then
    killTimer(var0)
  end
end
function isTogAttachOpen()
  return eui:uiGetVisible(UI.window[1]), var0
end
addEventHandler("onClientUIVisibilityChange", root, function()
  if source == UI.window[1] then
    if eui:uiGetVisible(source) then
      removeEventHandler("onClientRender", root, drawElementBoundingBox)
      addEventHandler("onClientRender", root, drawElementBoundingBox)
      bindKey("arrow_l", "both", movemnet)
      bindKey("arrow_r", "both", movemnet)
      bindKey("arrow_u", "both", movemnet)
      bindKey("arrow_d", "both", movemnet)
      bindKey("pgup", "both", movemnet)
      bindKey("pgdn", "both", movemnet)
    else
      removeEventHandler("onClientRender", root, drawElementBoundingBox)
      unbindKey("arrow_l", "both", movemnet)
      unbindKey("arrow_r", "both", movemnet)
      unbindKey("arrow_u", "both", movemnet)
      unbindKey("arrow_d", "both", movemnet)
      unbindKey("pgup", "both", movemnet)
      unbindKey("pgdn", "both", movemnet)
      if isTimer(var0) then
        killTimer(var0)
      end
    end
  end
end)
addEventHandler("onClientUIDoubleClick", root, function()
  if source == UI.gridlist[1] and eui:uiGridListGetSelectedItem(source) ~= -1 then
    eui:uiSetText(UI.edit.x, tostring(eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1).x_Offset))
    eui:uiSetText(UI.edit.y, tostring(eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1).y_Offset))
    eui:uiSetText(UI.edit.z, tostring(eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1).z_Offset))
    eui:uiSetText(UI.edit.rx, tostring(eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1).rx_Offset))
    eui:uiSetText(UI.edit.ry, tostring(eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1).ry_Offset))
    eui:uiSetText(UI.edit.rz, tostring(eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1).rz_Offset))
    eui:uiSetText(UI.edit.scale, tostring(eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1).ScaleX))
    eui:uiSetText(UI.edit.scaleY, tostring(eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1).ScaleY))
    eui:uiSetText(UI.edit.scaleZ, tostring(eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1).ScaleZ))
    eui:uiCheckBoxSetSelected(UI.checkbox[1], eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1).Data.collision or false)
    eui:uiSetVisible(UI.label.MainSection, false)
    eui:uiSetVisible(UI.label.Section2, true)
    var0 = getElementByID("attachment:" .. tostring(eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1).ID))
    current_attachment_data = eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1).Data
  end
end)
addEvent("attachments:openTogAttach", true)
addEventHandler("attachments:openTogAttach", root, function(arg0, arg1)
  var0 = arg1
  eui:uiSetVisible(UI.window[1], true)
  eui:uiGridListClear(UI.gridlist[1])
  for forvar5, forvar6 in ipairs(arg0) do
    forvar6.Data = fromJSON(forvar6.Data)
    eui:uiGridListSetItemText(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 1, tostring(fromJSON(forvar6.Data).item.Name))
    eui:uiGridListSetItemData(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 1, forvar6)
  end
  if getElementType(var0) == "player" then
    eui:uiSetVisible(UI.checkbox[1], false)
    eui:uiSetVisible(UI.label.scale, false)
    eui:uiSetVisible(UI.edit.scale, false)
    eui:uiSetVisible(UI.edit.scaleY, false)
    eui:uiSetVisible(UI.edit.scaleZ, false)
  else
    eui:uiSetVisible(UI.checkbox[1], true)
    eui:uiSetVisible(UI.label.scale, true)
    eui:uiSetVisible(UI.edit.scale, true)
    eui:uiSetVisible(UI.edit.scaleY, true)
    eui:uiSetVisible(UI.edit.scaleZ, true)
  end
end)
addEvent("onClientUseItemForElement", true)
addEventHandler("onClientUseItemForElement", localPlayer, function(arg0, arg1, arg2, arg3)
  if not arg3.Properties.Model then
    return
  end
  if not eui:uiGetVisible(UI.window[1]) then
    return
  end
  if var0 ~= arg0 then
    return
  end
  if processLineOfSight(getCameraMatrix()) == nil or processLineOfSight(getCameraMatrix()) == nil or processLineOfSight(getCameraMatrix()) == nil then
    return
  end
  if getElementType(arg0) == "vehicle" then
    if arg3.SpecialProperties and arg3.SpecialProperties.isFactionDuty then
      exports.notifications:output("This is a duty item, you can't attach it to the vehicle", 4000, "error")
      return
    end
    triggerServerEvent("glueObjectToElement", localPlayer, arg3, arg0, -math.cos((math.rad(getElementRotation(arg0)))) * math.sin((math.rad(getElementRotation(arg0)))) * (processLineOfSight(getCameraMatrix()) - getElementPosition(arg0)) + (-math.sin((math.rad(getElementRotation(arg0)))) * math.sin((math.rad(getElementRotation(arg0)))) * math.sin((math.rad(getElementRotation(arg0)))) + math.cos((math.rad(getElementRotation(arg0)))) * math.cos((math.rad(getElementRotation(arg0))))) * (processLineOfSight(getCameraMatrix()) - getElementPosition(arg0)) + (math.cos((math.rad(getElementRotation(arg0)))) * math.sin((math.rad(getElementRotation(arg0)))) * math.sin((math.rad(getElementRotation(arg0)))) + math.sin((math.rad(getElementRotation(arg0)))) * math.cos((math.rad(getElementRotation(arg0))))) * (processLineOfSight(getCameraMatrix()) - getElementPosition(arg0)), math.sin((math.rad(getElementRotation(arg0)))) * (processLineOfSight(getCameraMatrix()) - getElementPosition(arg0)) - math.sin((math.rad(getElementRotation(arg0)))) * math.cos((math.rad(getElementRotation(arg0)))) * (processLineOfSight(getCameraMatrix()) - getElementPosition(arg0)) + math.cos((math.rad(getElementRotation(arg0)))) * math.cos((math.rad(getElementRotation(arg0)))) * (processLineOfSight(getCameraMatrix()) - getElementPosition(arg0)), math.cos((math.rad(getElementRotation(arg0)))) * math.cos((math.rad(getElementRotation(arg0)))) * (processLineOfSight(getCameraMatrix()) - getElementPosition(arg0)) + (math.sin((math.rad(getElementRotation(arg0)))) * math.sin((math.rad(getElementRotation(arg0)))) * math.cos((math.rad(getElementRotation(arg0)))) + math.cos((math.rad(getElementRotation(arg0)))) * math.sin((math.rad(getElementRotation(arg0))))) * (processLineOfSight(getCameraMatrix()) - getElementPosition(arg0)) + (-math.cos((math.rad(getElementRotation(arg0)))) * math.sin((math.rad(getElementRotation(arg0)))) * math.cos((math.rad(getElementRotation(arg0)))) + math.sin((math.rad(getElementRotation(arg0)))) * math.sin((math.rad(getElementRotation(arg0))))) * (processLineOfSight(getCameraMatrix()) - getElementPosition(arg0)), 0 - getElementRotation(arg0), 0 - getElementRotation(arg0), getElementRotation(arg0) - getElementRotation(arg0))
  elseif getElementType(arg0) == "player" then
    if arg0 ~= localPlayer then
      return
    end
    if arg3.Name == "AK-47" or arg3.Name == "M4" then
    elseif arg3.Name == "Sniper" then
    end
    triggerServerEvent("glueObjectToElement", localPlayer, arg3, arg0, -0.02, -0.13, -0.21, 0, 0, 0)
  end
end)
addEventHandler("onClientElementMenuShow", localPlayer, function(arg0, arg1)
  if arg0 ~= localPlayer then
    return
  end
  exports.interaction:addInteractOption(arg0, {
    text = "Attachments"
  })
end)
