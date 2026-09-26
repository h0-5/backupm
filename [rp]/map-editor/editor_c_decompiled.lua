-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

function setMapEditorState(arg0, arg1, arg2, arg3, arg4)
  if arg0 then
    addEventHandler("onClientPreRender", getRootElement(), RenderMoveElement)
    bindKey("mouse_wheel_up", "down", ScrollMouse)
    bindKey("mouse_wheel_down", "down", ScrollMouse)
    bindKey("arrow_l", "down", MoveElement)
    bindKey("arrow_r", "down", MoveElement)
    bindKey("arrow_u", "down", MoveElement)
    bindKey("arrow_d", "down", MoveElement)
    addEventHandler("onClientClick", root, ClickElements)
    bindKey("lshift", "both", PressShiftKey)
    addEventHandler("onClientElementDimensionChange", localPlayer, changeIntDimEvent)
    addEventHandler("onClientElementInteriorChange", localPlayer, changeIntDimEvent)
    addEventHandler("onClientPlayerTarget", localPlayer, playerTargetEvent)
    addEventHandler("onClientObjectDamage", root, objectDamageEvent)
  else
    removeEventHandler("onClientPreRender", getRootElement(), RenderMoveElement)
    unbindKey("mouse_wheel_up", "down", ScrollMouse)
    unbindKey("mouse_wheel_down", "down", ScrollMouse)
    unbindKey("arrow_l", "down", MoveElement)
    unbindKey("arrow_r", "down", MoveElement)
    unbindKey("arrow_u", "down", MoveElement)
    unbindKey("arrow_d", "down", MoveElement)
    removeEventHandler("onClientClick", root, ClickElements)
    unbindKey("lshift", "both", PressShiftKey)
    removeEventHandler("onClientElementDimensionChange", localPlayer, changeIntDimEvent)
    removeEventHandler("onClientElementInteriorChange", localPlayer, changeIntDimEvent)
    removeEventHandler("onClientPlayerTarget", localPlayer, playerTargetEvent)
    removeEventHandler("onClientObjectDamage", root, objectDamageEvent)
  end
end
function getObjectEditor(arg0)
  if not isElement(arg0) then
    return false
  end
  return getElementData(arg0, "editor")
end
function setObjectEditor(arg0, arg1)
  if not isElement(arg0) then
    return false
  end
  setElementData(arg0, "editor", arg1 or nil)
  if isElement(arg1) and exports.hud:getHudSetting("gloves") then
    setElementData(arg0, "fingerprints", nil)
  end
end
function isCanEditObject(arg0)
  if isElement((getObjectEditor(arg0))) then
    if getObjectEditor(arg0) == localPlayer then
      return true
    end
  else
    return true
  end
  return false
end
Editor = {
  State = false,
  EditElementsState = false,
  ClickedElement = false,
  MovedElement = false
}
MapEditorWindowVisible = true
msx, msy = guiGetScreenSize() / 1024, guiGetScreenSize() / 768
addEvent("onClientElementMenuClick", true)
addEventHandler("onClientElementMenuClick", root, function(arg0, arg1, arg2)
  if getElementType(arg0) == "object" and arg1 == "Move" then
    if exports.hud:getHudSetting("admintag") then
      moveElement(arg0, 100)
    else
      moveElement(arg0, 15)
    end
  end
end)
function moveElement(arg0, arg1)
  if not isElement(arg0) then
    return false
  end
  if not tonumber(getDistanceBetweenPoints3D(getElementPosition(arg0)) or 0) then
    return false
  end
  if (getDistanceBetweenPoints3D(getElementPosition(arg0)) or 0) <= (arg1 or 5) then
    if isCanEditObject(arg0) then
      setMapEditorState(true, "WorldMap", "all")
      Editor.MovedElement = arg0
      Editor.ClickedElement = arg0
      setObjectEditor(arg0, localPlayer)
      setElementCollidableWith(arg0, localPlayer, false)
    else
      outputChatBox("You can not move this object now.", 255, 0, 0)
    end
  end
end
function getCurrentEditorObject()
  return Editor.ClickedElement
end
addEvent("editor:move", true)
addEventHandler("editor:move", localPlayer, function(arg0)
  if isElement(arg0) and getElementType(arg0) == "object" and getDistanceBetweenPoints3D(getElementPosition(localPlayer)) <= 5 then
    moveElement(arg0)
  end
end)
function changeIntDimEvent()
  if Editor.ClickedElement and isElement(Editor.ClickedElement) then
    Editor.ClickedElement = false
    setMapEditorState(false)
  end
end
function playerTargetEvent()
  if Editor.ClickedElement and isElement(Editor.ClickedElement) and getPedControlState(localPlayer, "aim_weapon") then
    setElementCollidableWith(Editor.ClickedElement, localPlayer, true)
    setObjectEditor(Editor.ClickedElement, nil)
    triggerServerEvent("Editor:updateElement", localPlayer, Editor.ClickedElement, getElementPosition(Editor.ClickedElement))
    Editor.ClickedElement = false
    setMapEditorState(false)
  end
end
function objectDamageEvent(arg0, arg1)
  if source ~= Editor.ClickedElement then
    return
  end
  if arg0 > 10 then
    setElementCollidableWith(Editor.ClickedElement, localPlayer, true)
    setObjectEditor(Editor.ClickedElement, nil)
    triggerServerEvent("Editor:updateElement", localPlayer, Editor.ClickedElement, getElementPosition(Editor.ClickedElement))
    Editor.ClickedElement = false
    setMapEditorState(false)
  end
end
function ClickElements(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7)
  if getEditElementsState() == false then
    return
  end
  if isMouseInPosition(10 * msx, 20 * msy, 210 * msx, 320 * msy) then
    return
  end
  if arg1 == "down" then
    if CurrentLabel ~= "CurrentElement" then
      if isElement(Editor.ClickedElement) then
        setElementCollidableWith(Editor.ClickedElement, localPlayer, true)
        setObjectEditor(Editor.ClickedElement, nil)
        triggerServerEvent("Editor:updateElement", localPlayer, Editor.ClickedElement, getElementPosition(Editor.ClickedElement))
      end
      setObjectEditor(Editor.ClickedElement, nil)
      Editor.ClickedElement = false
      setMapEditorState(false)
    end
    if isElement(Editor.MovedElement) then
      setObjectEditor(Editor.MovedElement, nil)
      setElementCollidableWith(Editor.MovedElement, localPlayer, true)
    end
    Editor.MovedElement = false
    if isElement(arg7) then
      if getElementType(arg7) ~= "object" then
        return
      end
      if arg7 == Editor.ClickedElement then
        return
      end
      if isCanEditObject(arg7) == false then
        outputChatBox("You can't edit this object.", 255, 0, 0)
        return
      end
      if arg0 == "right" then
        if CurrentLabel ~= "CurrentElement" then
          Editor.MovedElement = arg7
        end
      elseif arg0 == "left" then
        if var0 then
          outputChatBox("ERROR")
        else
          if CurrentLabel == "CurrentElement" and isElement(Editor.ClickedElement) then
            setObjectEditor(Editor.ClickedElement, nil)
            triggerServerEvent("Editor:updateElement", localPlayer, Editor.ClickedElement, getElementPosition(Editor.ClickedElement))
          end
          Editor.ClickedElement = arg7
        end
      end
    end
  end
end
function isMouseInPosition(arg0, arg1, arg2, arg3)
  if isCursorShowing() then
    if arg0 <= getCursorPosition() * var0 and arg1 <= getCursorPosition() * var1 and getCursorPosition() * var0 <= arg0 + arg2 and getCursorPosition() * var1 <= arg1 + arg3 then
      return true
    else
      return false
    end
  else
    return false
  end
end
function getEditElementsState()
  return MapEditorWindowVisible
end
function PressShiftKey(arg0, arg1)
  if getEditElementsState() == false then
    return
  end
  if arg1 == "down" then
    var0 = true
  elseif arg1 == "up" then
    var0 = false
  end
end
function ScrollMouse(arg0)
  if getEditElementsState() == false then
    return
  end
  if Editor.ClickedElement ~= false then
    if var0 then
    end
    if arg0 == "mouse_wheel_up" then
      setElementRotation(Editor.ClickedElement, getElementRotation(Editor.ClickedElement))
    elseif arg0 == "mouse_wheel_down" then
      setElementRotation(Editor.ClickedElement, getElementRotation(Editor.ClickedElement))
    end
  end
end
function MoveElement(arg0, arg1)
  if getEditElementsState() == false then
    return
  end
  if Editor.ClickedElement ~= false then
    if arg0 == "arrow_l" then
      setElementPosition(Editor.ClickedElement, getPointFromDistanceRotation(getElementPosition(Editor.ClickedElement)))
    elseif arg0 == "arrow_r" then
      setElementPosition(Editor.ClickedElement, getPointFromDistanceRotation(getElementPosition(Editor.ClickedElement)))
    elseif arg0 == "arrow_u" then
      setElementPosition(Editor.ClickedElement, getPointFromDistanceRotation(getElementPosition(Editor.ClickedElement)))
    elseif arg0 == "arrow_d" then
      setElementPosition(Editor.ClickedElement, getPointFromDistanceRotation(getElementPosition(Editor.ClickedElement)))
    end
  end
end
function RenderMoveElement()
  if not getEditElementsState() then
    return
  end
  if isCursorShowing() and Editor.MovedElement ~= false and isElement(Editor.MovedElement) then
    if processLineOfSight(getCameraMatrix()) == nil or processLineOfSight(getCameraMatrix()) == nil or processLineOfSight(getCameraMatrix()) == nil then
    end
    if processLineOfSight(getCameraMatrix()) ~= localPlayer and getDistanceBetweenPoints3D(getElementPosition(localPlayer)) <= 15 then
      setElementPosition(Editor.MovedElement, 0, 0, 0 + getElementDistanceFromCentreOfMassToBaseOfModel(Editor.MovedElement))
      setElementInterior(Editor.MovedElement, getElementInterior(localPlayer))
      setElementDimension(Editor.MovedElement, getElementDimension(localPlayer))
      if getKeyState("num_8") then
        setElementRotation(Editor.MovedElement, getElementRotation(Editor.MovedElement))
      elseif getKeyState("num_2") then
        setElementRotation(Editor.MovedElement, getElementRotation(Editor.MovedElement))
      elseif getKeyState("num_6") then
        setElementRotation(Editor.MovedElement, getElementRotation(Editor.MovedElement) + 1, getElementRotation(Editor.MovedElement))
      elseif getKeyState("num_4") then
        setElementRotation(Editor.MovedElement, getElementRotation(Editor.MovedElement) - 1, getElementRotation(Editor.MovedElement))
      end
    end
  end
  if Editor.ClickedElement ~= false and isElement(Editor.ClickedElement) then
    dxDrawLine3D(Editor.ClickedElement.matrix:transformPosition(Vector3(getElementBoundingBox(Editor.ClickedElement))).x, Editor.ClickedElement.matrix:transformPosition(Vector3(getElementBoundingBox(Editor.ClickedElement))).y, Editor.ClickedElement.matrix:transformPosition(Vector3(getElementBoundingBox(Editor.ClickedElement))).z, Editor.ClickedElement.matrix:transformPosition(Vector3(getElementBoundingBox(Editor.ClickedElement))).x, Editor.ClickedElement.matrix:transformPosition(Vector3(getElementBoundingBox(Editor.ClickedElement))).y, Editor.ClickedElement.matrix:transformPosition(Vector3(getElementBoundingBox(Editor.ClickedElement))).z, tocolor(0, 0, 255, 150), 2)
    dxDrawLine3D(Editor.ClickedElement.matrix:transformPosition(Vector3(getElementBoundingBox(Editor.ClickedElement))).x, Editor.ClickedElement.matrix:transformPosition(Vector3(getElementBoundingBox(Editor.ClickedElement))).y, Editor.ClickedElement.matrix:transformPosition(Vector3(getElementBoundingBox(Editor.ClickedElement))).z, Editor.ClickedElement.matrix:transformPosition(Vector3(getElementBoundingBox(Editor.ClickedElement))).x, Editor.ClickedElement.matrix:transformPosition(Vector3(getElementBoundingBox(Editor.ClickedElement))).y, Editor.ClickedElement.matrix:transformPosition(Vector3(getElementBoundingBox(Editor.ClickedElement))).z, tocolor(0, 0, 255, 150), 2)
    dxDrawLine3D(Editor.ClickedElement.matrix:transformPosition(Vector3(getElementBoundingBox(Editor.ClickedElement))).x, Editor.ClickedElement.matrix:transformPosition(Vector3(getElementBoundingBox(Editor.ClickedElement))).y, Editor.ClickedElement.matrix:transformPosition(Vector3(getElementBoundingBox(Editor.ClickedElement))).z, Editor.ClickedElement.matrix:transformPosition(Vector3(getElementBoundingBox(Editor.ClickedElement))).x, Editor.ClickedElement.matrix:transformPosition(Vector3(getElementBoundingBox(Editor.ClickedElement))).y, Editor.ClickedElement.matrix:transformPosition(Vector3(getElementBoundingBox(Editor.ClickedElement))).z, tocolor(0, 0, 255, 150), 2)
    dxDrawLine3D(Editor.ClickedElement.matrix:transformPosition(Vector3(getElementBoundingBox(Editor.ClickedElement))).x, Editor.ClickedElement.matrix:transformPosition(Vector3(getElementBoundingBox(Editor.ClickedElement))).y, Editor.ClickedElement.matrix:transformPosition(Vector3(getElementBoundingBox(Editor.ClickedElement))).z, Editor.ClickedElement.matrix:transformPosition(Vector3(getElementBoundingBox(Editor.ClickedElement))).x, Editor.ClickedElement.matrix:transformPosition(Vector3(getElementBoundingBox(Editor.ClickedElement))).y, Editor.ClickedElement.matrix:transformPosition(Vector3(getElementBoundingBox(Editor.ClickedElement))).z, tocolor(0, 0, 255, 150), 2)
    dxDrawLine3D(Editor.ClickedElement.matrix:transformPosition(Vector3(getElementBoundingBox(Editor.ClickedElement))).x, Editor.ClickedElement.matrix:transformPosition(Vector3(getElementBoundingBox(Editor.ClickedElement))).y, Editor.ClickedElement.matrix:transformPosition(Vector3(getElementBoundingBox(Editor.ClickedElement))).z, Editor.ClickedElement.matrix:transformPosition(Vector3(getElementBoundingBox(Editor.ClickedElement))).x, Editor.ClickedElement.matrix:transformPosition(Vector3(getElementBoundingBox(Editor.ClickedElement))).y, Editor.ClickedElement.matrix:transformPosition(Vector3(getElementBoundingBox(Editor.ClickedElement))).z, tocolor(0, 0, 255, 150), 2)
    dxDrawLine3D(Editor.ClickedElement.matrix:transformPosition(Vector3(getElementBoundingBox(Editor.ClickedElement))).x, Editor.ClickedElement.matrix:transformPosition(Vector3(getElementBoundingBox(Editor.ClickedElement))).y, Editor.ClickedElement.matrix:transformPosition(Vector3(getElementBoundingBox(Editor.ClickedElement))).z, Editor.ClickedElement.matrix:transformPosition(Vector3(getElementBoundingBox(Editor.ClickedElement))).x, Editor.ClickedElement.matrix:transformPosition(Vector3(getElementBoundingBox(Editor.ClickedElement))).y, Editor.ClickedElement.matrix:transformPosition(Vector3(getElementBoundingBox(Editor.ClickedElement))).z, tocolor(0, 0, 255, 150), 2)
    dxDrawLine3D(Editor.ClickedElement.matrix:transformPosition(Vector3(getElementBoundingBox(Editor.ClickedElement))).x, Editor.ClickedElement.matrix:transformPosition(Vector3(getElementBoundingBox(Editor.ClickedElement))).y, Editor.ClickedElement.matrix:transformPosition(Vector3(getElementBoundingBox(Editor.ClickedElement))).z, Editor.ClickedElement.matrix:transformPosition(Vector3(getElementBoundingBox(Editor.ClickedElement))).x, Editor.ClickedElement.matrix:transformPosition(Vector3(getElementBoundingBox(Editor.ClickedElement))).y, Editor.ClickedElement.matrix:transformPosition(Vector3(getElementBoundingBox(Editor.ClickedElement))).z, tocolor(0, 0, 255, 150), 2)
    dxDrawLine3D(Editor.ClickedElement.matrix:transformPosition(Vector3(getElementBoundingBox(Editor.ClickedElement))).x, Editor.ClickedElement.matrix:transformPosition(Vector3(getElementBoundingBox(Editor.ClickedElement))).y, Editor.ClickedElement.matrix:transformPosition(Vector3(getElementBoundingBox(Editor.ClickedElement))).z, Editor.ClickedElement.matrix:transformPosition(Vector3(getElementBoundingBox(Editor.ClickedElement))).x, Editor.ClickedElement.matrix:transformPosition(Vector3(getElementBoundingBox(Editor.ClickedElement))).y, Editor.ClickedElement.matrix:transformPosition(Vector3(getElementBoundingBox(Editor.ClickedElement))).z, tocolor(0, 0, 255, 150), 2)
    dxDrawLine3D(Editor.ClickedElement.matrix:transformPosition(Vector3(getElementBoundingBox(Editor.ClickedElement))).x, Editor.ClickedElement.matrix:transformPosition(Vector3(getElementBoundingBox(Editor.ClickedElement))).y, Editor.ClickedElement.matrix:transformPosition(Vector3(getElementBoundingBox(Editor.ClickedElement))).z, Editor.ClickedElement.matrix:transformPosition(Vector3(getElementBoundingBox(Editor.ClickedElement))).x, Editor.ClickedElement.matrix:transformPosition(Vector3(getElementBoundingBox(Editor.ClickedElement))).y, Editor.ClickedElement.matrix:transformPosition(Vector3(getElementBoundingBox(Editor.ClickedElement))).z, tocolor(0, 0, 255, 150), 2)
    dxDrawLine3D(Editor.ClickedElement.matrix:transformPosition(Vector3(getElementBoundingBox(Editor.ClickedElement))).x, Editor.ClickedElement.matrix:transformPosition(Vector3(getElementBoundingBox(Editor.ClickedElement))).y, Editor.ClickedElement.matrix:transformPosition(Vector3(getElementBoundingBox(Editor.ClickedElement))).z, Editor.ClickedElement.matrix:transformPosition(Vector3(getElementBoundingBox(Editor.ClickedElement))).x, Editor.ClickedElement.matrix:transformPosition(Vector3(getElementBoundingBox(Editor.ClickedElement))).y, Editor.ClickedElement.matrix:transformPosition(Vector3(getElementBoundingBox(Editor.ClickedElement))).z, tocolor(0, 0, 255, 150), 2)
    dxDrawLine3D(Editor.ClickedElement.matrix:transformPosition(Vector3(getElementBoundingBox(Editor.ClickedElement))).x, Editor.ClickedElement.matrix:transformPosition(Vector3(getElementBoundingBox(Editor.ClickedElement))).y, Editor.ClickedElement.matrix:transformPosition(Vector3(getElementBoundingBox(Editor.ClickedElement))).z, Editor.ClickedElement.matrix:transformPosition(Vector3(getElementBoundingBox(Editor.ClickedElement))).x, Editor.ClickedElement.matrix:transformPosition(Vector3(getElementBoundingBox(Editor.ClickedElement))).y, Editor.ClickedElement.matrix:transformPosition(Vector3(getElementBoundingBox(Editor.ClickedElement))).z, tocolor(0, 0, 255, 150), 2)
    dxDrawLine3D(Editor.ClickedElement.matrix:transformPosition(Vector3(getElementBoundingBox(Editor.ClickedElement))).x, Editor.ClickedElement.matrix:transformPosition(Vector3(getElementBoundingBox(Editor.ClickedElement))).y, Editor.ClickedElement.matrix:transformPosition(Vector3(getElementBoundingBox(Editor.ClickedElement))).z, Editor.ClickedElement.matrix:transformPosition(Vector3(getElementBoundingBox(Editor.ClickedElement))).x, Editor.ClickedElement.matrix:transformPosition(Vector3(getElementBoundingBox(Editor.ClickedElement))).y, Editor.ClickedElement.matrix:transformPosition(Vector3(getElementBoundingBox(Editor.ClickedElement))).z, tocolor(0, 0, 255, 150), 2)
  end
end
function getPointFromDistanceRotation(arg0, arg1, arg2, arg3)
  return arg0 + math.cos((math.rad(90 - arg3))) * arg2, arg1 + math.sin((math.rad(90 - arg3))) * arg2
end
function findRotation(arg0, arg1, arg2, arg3)
  return -math.deg(math.atan2(arg2 - arg0, arg3 - arg1)) < 0 and -math.deg(math.atan2(arg2 - arg0, arg3 - arg1)) + 360 or -math.deg(math.atan2(arg2 - arg0, arg3 - arg1))
end
GUIEditor = {
  scrollpane = {},
  edit = {},
  button = {},
  window = {},
  label = {}
}
addEventHandler("onClientResourceStart", resourceRoot, function()
  GUIEditor.window[1] = guiCreateWindow(6, 238, 238, 367, "Editor", false)
  guiWindowSetSizable(GUIEditor.window[1], false)
  guiSetVisible(GUIEditor.window[1], false)
  GUIEditor.scrollpane[1] = guiCreateScrollPane(10, 27, 218, 298, false, GUIEditor.window[1])
  GUIEditor.label[1] = guiCreateLabel(0, 10, 26, 15, "ID:", false, GUIEditor.scrollpane[1])
  guiSetFont(GUIEditor.label[1], "default-bold-small")
  GUIEditor.label[2] = guiCreateLabel(26, 10, 192, 15, "", false, GUIEditor.scrollpane[1])
  GUIEditor.label[3] = guiCreateLabel(0, 40, 59, 15, "- Position:", false, GUIEditor.scrollpane[1])
  guiSetFont(GUIEditor.label[3], "default-bold-small")
  GUIEditor.label[4] = guiCreateLabel(0, 60, 218, 22, "X", false, GUIEditor.scrollpane[1])
  guiSetFont(GUIEditor.label[4], "default-bold-small")
  guiLabelSetVerticalAlign(GUIEditor.label[4], "center")
  GUIEditor.edit[1] = guiCreateEdit(16, 1, 202, 21, "", false, GUIEditor.label[4])
  GUIEditor.label[5] = guiCreateLabel(0, 82, 218, 22, "Y", false, GUIEditor.scrollpane[1])
  guiSetFont(GUIEditor.label[5], "default-bold-small")
  guiLabelSetVerticalAlign(GUIEditor.label[5], "center")
  GUIEditor.edit[2] = guiCreateEdit(16, 1, 202, 21, "", false, GUIEditor.label[5])
  GUIEditor.label[6] = guiCreateLabel(0, 104, 218, 22, "Z", false, GUIEditor.scrollpane[1])
  guiSetFont(GUIEditor.label[6], "default-bold-small")
  guiLabelSetVerticalAlign(GUIEditor.label[6], "center")
  GUIEditor.edit[3] = guiCreateEdit(16, 1, 202, 21, "", false, GUIEditor.label[6])
  GUIEditor.label[7] = guiCreateLabel(0, 132, 218, 22, "Interior", false, GUIEditor.scrollpane[1])
  guiSetFont(GUIEditor.label[7], "default-bold-small")
  guiLabelSetVerticalAlign(GUIEditor.label[7], "center")
  GUIEditor.edit[4] = guiCreateEdit(64, 1, 154, 21, "", false, GUIEditor.label[7])
  GUIEditor.label[8] = guiCreateLabel(0, 154, 218, 22, "Dimension", false, GUIEditor.scrollpane[1])
  guiSetFont(GUIEditor.label[8], "default-bold-small")
  guiLabelSetVerticalAlign(GUIEditor.label[8], "center")
  GUIEditor.edit[5] = guiCreateEdit(64, 1, 154, 21, "", false, GUIEditor.label[8])
  guiSetEnabled(GUIEditor.label[7], false)
  guiSetEnabled(GUIEditor.label[8], false)
  GUIEditor.label[9] = guiCreateLabel(0, 186, 63, 15, "- Rotation:", false, GUIEditor.scrollpane[1])
  guiSetFont(GUIEditor.label[9], "default-bold-small")
  GUIEditor.label[10] = guiCreateLabel(0, 205, 218, 22, "RX", false, GUIEditor.scrollpane[1])
  guiSetFont(GUIEditor.label[10], "default-bold-small")
  guiLabelSetVerticalAlign(GUIEditor.label[10], "center")
  GUIEditor.edit[6] = guiCreateEdit(21, 1, 197, 21, "", false, GUIEditor.label[10])
  GUIEditor.label[11] = guiCreateLabel(0, 227, 218, 22, "RY", false, GUIEditor.scrollpane[1])
  guiSetFont(GUIEditor.label[11], "default-bold-small")
  guiLabelSetVerticalAlign(GUIEditor.label[11], "center")
  GUIEditor.edit[7] = guiCreateEdit(21, 1, 197, 21, "", false, GUIEditor.label[11])
  GUIEditor.label[12] = guiCreateLabel(0, 249, 218, 22, "RZ", false, GUIEditor.scrollpane[1])
  guiSetFont(GUIEditor.label[12], "default-bold-small")
  guiLabelSetVerticalAlign(GUIEditor.label[12], "center")
  GUIEditor.edit[8] = guiCreateEdit(21, 1, 197, 21, "", false, GUIEditor.label[12])
  GUIEditor.button[1] = guiCreateButton(10, 329, 138, 28, "Save Changes", false, GUIEditor.window[1])
  GUIEditor.button[2] = guiCreateButton(153, 329, 75, 28, "Cancel", false, GUIEditor.window[1])
end)
function showEditObjectWindow(arg0)
  if isElement(arg0) then
    var0 = {
      getElementPosition(arg0)
    }
    guiSetVisible(GUIEditor.window[1], true)
    guiSetText(GUIEditor.label[2], tostring(getElementID(arg0)))
    guiSetText(GUIEditor.edit[1], tostring(getElementPosition(arg0)))
    guiSetText(GUIEditor.edit[2], tostring(getElementPosition(arg0)))
    guiSetText(GUIEditor.edit[3], tostring(getElementPosition(arg0)))
    guiSetText(GUIEditor.edit[4], tostring(getElementInterior(arg0)))
    guiSetText(GUIEditor.edit[5], tostring(getElementDimension(arg0)))
    guiSetText(GUIEditor.edit[6], tostring(getElementRotation(arg0)))
    guiSetText(GUIEditor.edit[7], tostring(getElementRotation(arg0)))
    guiSetText(GUIEditor.edit[8], tostring(getElementRotation(arg0)))
  else
    guiSetVisible(GUIEditor.window[1], false)
  end
end
addEvent("onClientElementMenuClick", true)
addEventHandler("onClientElementMenuClick", localPlayer, function(arg0, arg1, arg2)
  if not isElement(arg0) then
    return
  end
  if getElementType(arg0) == "object" and arg1 == "Admin: Editor" then
    showEditObjectWindow(arg0)
  end
end)
addEventHandler("onClientGUIClick", resourceRoot, function()
  if source == GUIEditor.button[2] then
    showEditObjectWindow(false)
    if isElement((getElementByID(guiGetText(GUIEditor.label[2])))) then
      setElementPosition(getElementByID(guiGetText(GUIEditor.label[2])), unpack(var0))
      setElementRotation(getElementByID(guiGetText(GUIEditor.label[2])), unpack(var0))
      setElementInterior(getElementByID(guiGetText(GUIEditor.label[2])), unpack(var0))
      setElementDimension(getElementByID(guiGetText(GUIEditor.label[2])), unpack(var0))
    end
  elseif source == GUIEditor.button[1] then
    showEditObjectWindow(false)
    if isElement((getElementByID(guiGetText(GUIEditor.label[2])))) then
      triggerServerEvent("Editor:updateElement", localPlayer, getElementByID(guiGetText(GUIEditor.label[2])), getElementPosition((getElementByID(guiGetText(GUIEditor.label[2])))))
      setObjectEditor(getElementByID(guiGetText(GUIEditor.label[2])), nil)
    end
  end
end)
addEventHandler("onClientGUIChanged", resourceRoot, function()
  if source == GUIEditor.edit[1] or source == GUIEditor.edit[2] or source == GUIEditor.edit[3] then
    if tonumber((guiGetText(GUIEditor.edit[1]))) and tonumber((guiGetText(GUIEditor.edit[2]))) and tonumber((guiGetText(GUIEditor.edit[3]))) then
      setElementPosition(getElementByID(guiGetText(GUIEditor.label[2])), tonumber((guiGetText(GUIEditor.edit[1]))), tonumber((guiGetText(GUIEditor.edit[2]))), tonumber((guiGetText(GUIEditor.edit[3]))))
    end
  elseif source == GUIEditor.edit[6] or source == GUIEditor.edit[7] or source == GUIEditor.edit[8] then
    if tonumber((guiGetText(GUIEditor.edit[6]))) and tonumber((guiGetText(GUIEditor.edit[7]))) and tonumber((guiGetText(GUIEditor.edit[8]))) then
      setElementRotation(getElementByID(guiGetText(GUIEditor.label[2])), tonumber((guiGetText(GUIEditor.edit[6]))), tonumber((guiGetText(GUIEditor.edit[7]))), tonumber((guiGetText(GUIEditor.edit[8]))))
    end
  elseif source == GUIEditor.edit[4] then
    if tonumber((guiGetText(source))) then
      setElementInterior(getElementByID(guiGetText(GUIEditor.label[2])), tonumber((guiGetText(source))))
    end
  elseif source == GUIEditor.edit[5] and tonumber((guiGetText(source))) then
    setElementDimension(getElementByID(guiGetText(GUIEditor.label[2])), tonumber((guiGetText(source))))
  end
end)
