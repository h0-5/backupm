-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

machine = {controlState = false}
machine.controller_marker = createMarker(-12.284775543213001, -250.8578338623, 21.147882461548, "cylinder", 1.5, 10, 10, 10, 255)
machine.matriel_object = createObject(1388, -11.2, -250.7, 20, 0, 0, 270)
machine.matriel_controle_object = createObject(1390, 27.5, -250.8, 20.5, 0, 0, 0)
setObjectScale(machine.matriel_controle_object, 4.2)
setElementDoubleSided(machine.matriel_object, false)
addEventHandler("onClientMarkerHit", resourceRoot, function(arg0)
  if source == machine.controller_marker then
    if arg0 ~= localPlayer then
      return
    end
    if getElementData(arg0, "job") == var0 then
      machine.startController()
    end
  end
end)
function machine.createLoad()
  if isElement(machine.cuntsolo) then
    destroyElement(machine.cuntsolo)
    destroyElement(machine.cuntsolo_colshape)
  end
  machine.cuntsolo = createObject(2934, 25.700000762939, -251.39999389648, 10.60000038147, 0, 0, 90)
  machine.cuntsolo_colshape = createColCircle(25.700000762939, -251.39999389648, 5)
  attachElements(machine.cuntsolo_colshape, machine.cuntsolo, 0, 0, -5)
end
machine.createLoad()
function machine.rope()
  dxDrawLine3D(getElementPosition(machine.matriel_controle_object))
end
function machine.startController()
  machine.controlState = true
  setCameraMatrix(-8.790445327759, -250.8512878418, 22.893310546875, 27.5, -250.8, 5.5)
  bindKey("space", "down", machine.controller)
  bindKey("arrow_u", "up", machine.controller)
  bindKey("arrow_d", "up", machine.controller)
  bindKey("mouse_wheel_up", "down", machine.controller)
  bindKey("mouse_wheel_down", "down", machine.controller)
  bindKey("enter", "up", machine.controller)
  bindKey("space", "down", machine.controller)
  addEventHandler("onClientRender", root, machine.rope)
  outputChatBox("** Use 'arrow_u', 'arrow_d' and mouse wheels to control the machine.", 255, 200, 0)
  outputChatBox("** Press 'space' to leave the controller.", 255, 200, 0)
  if isElement(guideMarker) then
    destroyElement(guideMarker)
  end
  setElementFrozen(localPlayer, true)
end
function machine.stopController()
  machine.controlState = false
  unbindKey("space", "down", machine.controller)
  unbindKey("arrow_u", "up", machine.controller)
  unbindKey("arrow_d", "up", machine.controller)
  unbindKey("mouse_wheel_up", "down", machine.controller)
  unbindKey("mouse_wheel_down", "down", machine.controller)
  unbindKey("enter", "up", machine.controller)
  unbindKey("space", "down", machine.controller)
  removeEventHandler("onClientRender", root, machine.rope)
  setCameraTarget(localPlayer)
  setElementFrozen(localPlayer, false)
end
function machine.checkVehicle()
  for forvar3, forvar4 in ipairs(getElementsWithinColShape(machine.cuntsolo_colshape, "vehicle")) do
    if getElementModel(forvar4) == 578 and not getElementData(forvar4, "trucker:load") then
      return forvar4
    end
  end
  return false
end
function machine.controller(arg0)
  if arg0 == "arrow_u" then
    if getElementPosition(machine.matriel_controle_object) < 20.1 then
      moveObject(machine.matriel_controle_object, 4000 / var0, getElementPosition(machine.matriel_controle_object))
    else
      moveObject(machine.matriel_controle_object, 500, getElementPosition(machine.matriel_controle_object))
    end
  elseif arg0 == "arrow_d" then
    if getElementPosition(machine.matriel_controle_object) > 9.5 then
      moveObject(machine.matriel_controle_object, 4000 / var0, getElementPosition(machine.matriel_controle_object))
      if getElementPosition(machine.matriel_controle_object) - 2 <= 13.5 and isElement(machine.cuntsolo) then
        if isElementAttached(machine.cuntsolo) then
          if machine.checkVehicle() then
            exports.notifications:showDirective("Press #ff375f'Enter'#FFFFFF to put the load on the truck", tocolor(255, 255, 255, 255), 5000)
          end
        else
          attachElements(machine.cuntsolo, machine.matriel_controle_object, 0, 0, -2.6, 0, 0, 90)
        end
      end
    else
      moveObject(machine.matriel_controle_object, 500, getElementPosition(machine.matriel_controle_object))
    end
  elseif arg0 == "mouse_wheel_up" then
    if getElementPosition(machine.matriel_controle_object) < 27.2 then
      moveObject(machine.matriel_controle_object, 4000 / var0, getElementPosition(machine.matriel_controle_object) + 2, getElementPosition(machine.matriel_controle_object))
    else
      moveObject(machine.matriel_controle_object, 500, 27.2, getElementPosition(machine.matriel_controle_object))
    end
  elseif arg0 == "mouse_wheel_down" then
    if getElementPosition(machine.matriel_controle_object) > -8 then
      moveObject(machine.matriel_controle_object, 4000 / var0, getElementPosition(machine.matriel_controle_object) - 2, getElementPosition(machine.matriel_controle_object))
    else
      moveObject(machine.matriel_controle_object, 500, -8, getElementPosition(machine.matriel_controle_object))
    end
  elseif arg0 == "enter" then
    if machine.checkVehicle() then
      destroyElement(machine.cuntsolo)
      destroyElement(machine.cuntsolo_colshape)
      moveObject(machine.matriel_controle_object, 2000, getElementPosition(machine.matriel_controle_object))
      triggerServerEvent("trucker:attachElement", localPlayer, (machine.checkVehicle()))
      TargetPoint.create()
      outputChatBox("Press 'space' and go to the marker shown on the map.", 255, 200, 0)
    end
  elseif arg0 == "space" then
    machine.stopController()
  end
end
