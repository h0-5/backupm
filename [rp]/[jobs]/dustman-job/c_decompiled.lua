-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

addEvent("onClientPlayerStartJob", true)
addEventHandler("onClientPlayerStartJob", localPlayer, function(arg0)
  if arg0 ~= "Dustman" then
    return
  end
  if isElement(TrashObject) then
    outputChatBox("You already started the job.", 255, 0, 0)
    return
  end
  if isPedInVehicle(localPlayer) then
    VehicleAttachedMarker = createColCircle(0, 0, 1.5)
    attachElements(VehicleAttachedMarker, getPedOccupiedVehicle(localPlayer), 0, -5, -1.5)
    if var0[getElementModel((getPedOccupiedVehicle(localPlayer)))] then
      createTrashOnPlace()
    end
  end
end)
TrashModels = {
  1265,
  1440,
  1357,
  1441,
  1338,
  1230,
  1450,
  1438
}
JobVehicle = false
isShowMarker = false
function createTrashOnPlace()
  if isElement(TrashArrow) then
    destroyElement(TrashArrow)
  end
  if isElement(TrashObject) then
    destroyElement(TrashObject)
  end
  if isElement(TrashBlip) then
    destroyElement(TrashBlip)
  end
  TrashArrow = nil
  TrashObject = nil
  TrashBlip = nil
  if isTimer(WaitingGroundTimer) then
    killTimer(WaitingGroundTimer)
  end
  TrashObject = createObject(TrashModels[math.random(#TrashModels)], unpack(var0["Las Venturas"][math.random(#var0["Las Venturas"])]))
  if getGroundPosition(unpack(var0["Las Venturas"][math.random(#var0["Las Venturas"])])) == 0 then
    WaitingGroundTimer = setTimer(function(arg0, arg1, arg2)
      if getGroundPosition(arg0, arg1, arg2) ~= 0 then
        setElementPosition(TrashObject, arg0, arg1, getGroundPosition(arg0, arg1, arg2) + math.abs(getElementBoundingBox(TrashObject) - getElementBoundingBox(TrashObject)) / 2)
        TrashArrow = createMarker(arg0, arg1, getGroundPosition(arg0, arg1, arg2) + 2.5, "arrow", 0.6, 0, 200, 0, 150)
        killTimer(WaitingGroundTimer)
      end
    end, 1000, 0, unpack(var0["Las Venturas"][math.random(#var0["Las Venturas"])]))
  else
    setElementPosition(TrashObject, unpack(var0["Las Venturas"][math.random(#var0["Las Venturas"])]))
    TrashArrow = createMarker(unpack(var0["Las Venturas"][math.random(#var0["Las Venturas"])]))
  end
  setElementFrozen(TrashObject, true)
  TrashBlip = createBlip(unpack(var0["Las Venturas"][math.random(#var0["Las Venturas"])]))
  exports.radar:findBestWay(unpack(var0["Las Venturas"][math.random(#var0["Las Venturas"])]))
  isShowMarker = true
end
addEventHandler("onClientObjectDamage", resourceRoot, function()
  if source == TrashObject then
    cancelEvent()
  end
end)
addEventHandler("onClientColShapeHit", resourceRoot, function(arg0)
  if source == VehicleAttachedMarker and arg0 == TrashObject and getVehicleController((getElementAttachedTo(source))) == localPlayer then
    if isElement(TrashArrow) then
      destroyElement(TrashArrow)
    end
    if isElement(TrashObject) then
      destroyElement(TrashObject)
    end
    if isElement(TrashBlip) then
      destroyElement(TrashBlip)
    end
    TrashArrow = nil
    TrashObject = nil
    TrashBlip = nil
    if isTimer(WaitingGroundTimer) then
      killTimer(WaitingGroundTimer)
    end
    exports["job-system"]:givePlayerJobEXP("Dustman", 1)
    createTrashOnPlace()
  end
end)
addEvent("onClientPlayerQuitJob", true)
addEventHandler("onClientPlayerQuitJob", localPlayer, function(arg0)
  if arg0 == "Dustman" then
    stopJob()
  end
end)
function stopJob()
  if isElement(TrashArrow) then
    destroyElement(TrashArrow)
  end
  if isElement(TrashObject) then
    destroyElement(TrashObject)
  end
  if isElement(TrashBlip) then
    destroyElement(TrashBlip)
  end
  if isElement(VehicleAttachedMarker) then
    destroyElement(VehicleAttachedMarker)
  end
  TrashArrow = nil
  TrashObject = nil
  TrashBlip = nil
  VehicleAttachedMarker = nil
  if isTimer(WaitingGroundTimer) then
    killTimer(WaitingGroundTimer)
  end
  isShowMarker = false
end
addEventHandler("onClientPlayerSpawn", localPlayer, function()
  stopJob()
end)
