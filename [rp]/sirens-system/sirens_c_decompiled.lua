-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

addEventHandler("onClientResourceStart", resourceRoot, function()
  engineImportTXD(exports["files-protection"]:loadTXD("policelights.txd"), 1939)
  engineReplaceModel(exports["files-protection"]:loadDFF("policelights.dff"), 1939)
  engineReplaceCOL(exports["files-protection"]:loadCOL("policelights.col"), 1939)
  engineImportTXD(exports["files-protection"]:loadTXD("courtlights.txd"), 1937)
  engineReplaceModel(exports["files-protection"]:loadDFF("courtlights.dff"), 1937)
end)
function toggleEmergencyLights(arg0, arg1)
  if arg1 then
    if not isTimer(var0[arg0]) then
      var0[arg0] = setTimer(function(arg0)
        if type(arg0) ~= "boolean" and isElement(arg0) then
          if getVehicleLightState(arg0, 0) == 0 then
            setVehicleLightState(arg0, 0, 1)
            setVehicleLightState(arg0, 1, 0)
            setVehicleLightState(arg0, 2, 1)
            setVehicleLightState(arg0, 3, 0)
            setVehicleHeadLightColor(arg0, 0, 0, 255)
          else
            setVehicleLightState(arg0, 0, 0)
            setVehicleLightState(arg0, 1, 1)
            setVehicleLightState(arg0, 2, 0)
            setVehicleLightState(arg0, 3, 1)
            setVehicleHeadLightColor(arg0, 255, 0, 0)
          end
        else
          killTimer(var0[arg0])
          var0[arg0] = nil
        end
      end, 200, 0, arg0)
    end
  else
    if isTimer(var0[arg0]) then
      killTimer(var0[arg0])
    end
    var0[arg0] = nil
    setVehicleLightState(arg0, 0, 0)
    setVehicleLightState(arg0, 1, 0)
    setVehicleLightState(arg0, 2, 0)
    setVehicleLightState(arg0, 3, 0)
    setVehicleHeadLightColor(arg0, 255, 255, 255)
  end
end
addEventHandler("onClientElementDataChange", root, function(arg0, arg1, arg2)
  if arg0 == "siren:sound" then
    if not isElementStreamedIn(source) then
      return
    end
    if arg2 then
      if isElement(var0[source]) then
        stopSound(var0[source])
      end
      var0[source] = playSound3D(arg2 or "sounds/siren.wav", getElementPosition(source))
      attachElements(var0[source], source)
      setSoundMaxDistance(var0[source], 50)
    else
      if isElement(var0[source]) then
        stopSound(var0[source])
      end
      var0[source] = nil
    end
  elseif arg0 == "temp:emg_lights" then
    if arg2 then
      toggleEmergencyLights(source, true)
    else
      toggleEmergencyLights(source, false)
    end
  end
end)
addEventHandler("onClientElementStreamIn", root, function(arg0, arg1)
  if not getElementData(source, "siren:sound") then
    return
  end
  if isElement(var0[source]) then
    stopSound(var0[source])
  end
  var0[source] = playSound3D(getElementData(source, "siren:sound") or "sounds/siren.wav", getElementPosition(source))
  attachElements(var0[source], source)
  setSoundMaxDistance(var0[source], 50)
  if getElementData(source, "temp:emg_lights") then
    toggleEmergencyLights(source, true)
  end
end)
addEventHandler("onClientElementStreamOut", root, function(arg0, arg1)
  if not getElementData(source, "siren:sound") then
    return
  end
  if isElement(var0[source]) then
    stopSound(var0[source])
  end
  var0[source] = nil
  if getElementData(source, "temp:emg_lights") then
    toggleEmergencyLights(source, false)
  end
end)
addEventHandler("onClientElementDestroy", root, function(arg0, arg1)
  if isElement(var0[source]) then
    stopSound(var0[source])
  end
  var0[source] = nil
  if isTimer(var1[source]) then
    killTimer(var1[source])
  end
  var1[source] = nil
end)
