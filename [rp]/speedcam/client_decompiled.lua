-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

for forvar7, forvar8 in ipairs({
  {
    cam = {
      534.51409912109,
      -1710.2976074219,
      12.032497406006,
      0,
      0,
      330
    },
    pos = {
      538.9453,
      -1716.643,
      12.8025
    },
    radius = 7,
    limit = 140
  },
  {
    cam = {
      531.74853515625,
      -1737.0070800781,
      11.24920463562,
      0,
      0,
      160
    },
    pos = {
      528.1054,
      -1730.51,
      12.1635
    },
    radius = 7,
    limit = 140
  },
  {
    cam = {
      1138.2109375,
      -1389.3280029297,
      12.78995513916,
      0,
      0,
      335
    },
    pos = {
      1141.983,
      -1395.15,
      13.5131
    },
    radius = 7,
    limit = 140
  },
  {
    cam = {
      1136.7322998047,
      -1411.7958984375,
      12.641670227051,
      0,
      0,
      165.99938964844
    },
    pos = {
      1132.256,
      -1406.29,
      13.4646
    },
    radius = 7,
    limit = 140
  },
  {
    cam = {
      1291.0510253906,
      -1622.1466064453,
      12.546875,
      0,
      0,
      75.999389648438
    },
    pos = {
      1297.207,
      -1617.503,
      13.3828
    },
    radius = 7,
    limit = 140
  },
  {
    cam = {
      1318.4946289062,
      -1625.513671875,
      12.546875,
      0,
      0,
      255.99938964844
    },
    pos = {
      1312.723,
      -1629.861,
      13.3828
    },
    radius = 7,
    limit = 140
  }
}) do
  ({})[createColCircle(forvar8.pos[1], forvar8.pos[2], forvar8.radius)] = forvar7
  ;({})[createObject(1733, forvar8.cam[1], forvar8.cam[2], forvar8.cam[3], forvar8.cam[4], forvar8.cam[5], forvar8.cam[6])] = forvar8.limit
end
addEventHandler("onClientColShapeHit", resourceRoot, function(arg0, arg1)
  if arg0 ~= localPlayer then
    return
  end
  if not arg1 then
    return
  end
  if not isPedInVehicle(arg0) then
    return
  end
  if isPedDead(arg0) then
    return
  end
  if var0[source] then
    if getVehicleController((getPedOccupiedVehicle(arg0))) ~= localPlayer then
      return
    end
    if getVehicleSpeed((getPedOccupiedVehicle(arg0))) > var1[var0[source]].limit then
      if var2[getVehicleType((getPedOccupiedVehicle(arg0)))] then
        return
      end
      if var3 and getTickCount() - var3 <= 60000 then
        return
      end
      var3 = getTickCount()
      fadeCamera(false, 0.1, 255, 255, 255)
      setTimer(fadeCamera, 100, 1, true, 1)
      triggerServerEvent("speedcam:overSpeed", localPlayer, getPedOccupiedVehicle(arg0), getVehicleSpeed((getPedOccupiedVehicle(arg0))), var1[var0[source]].limit)
    end
  end
end)
function getVehicleSpeed(arg0)
  return math.sqrt((getElementVelocity(arg0) or 0) ^ 2 + (getElementVelocity(arg0) or 0) ^ 2 + (getElementVelocity(arg0) or 0) ^ 2) * 161
end
addEventHandler("onClientRender", root, function()
  if isPedInVehicle(localPlayer) then
    for forvar7 = 1, #getElementsByType("object", resourceRoot, true) do
      if isElementOnScreen(getElementsByType("object", resourceRoot, true)[forvar7]) and getScreenFromWorldPosition(getElementPosition(getElementsByType("object", resourceRoot, true)[forvar7])) and getScreenFromWorldPosition(getElementPosition(getElementsByType("object", resourceRoot, true)[forvar7])) and getDistanceBetweenPoints3D(getCameraMatrix()) <= 100 and isLineOfSightClear(getCameraMatrix()) then
        dxDrawText(var0[getElementsByType("object", resourceRoot, true)[forvar7]] .. " km/h", getScreenFromWorldPosition(getElementPosition(getElementsByType("object", resourceRoot, true)[forvar7])) + 2, getScreenFromWorldPosition(getElementPosition(getElementsByType("object", resourceRoot, true)[forvar7])) + 2, getScreenFromWorldPosition(getElementPosition(getElementsByType("object", resourceRoot, true)[forvar7])))
        dxDrawText(var0[getElementsByType("object", resourceRoot, true)[forvar7]] .. " km/h", getScreenFromWorldPosition(getElementPosition(getElementsByType("object", resourceRoot, true)[forvar7])))
      end
    end
  end
end)
addEventHandler("onClientResourceStart", resourceRoot, function()
  exports["files-protection"]:loadProtectedModel({
    {
      "speedcam.col",
      1733
    },
    {
      "speedcam.txd",
      1733
    },
    {
      "speedcam.dff",
      1733
    }
  }, "OIAR9d|MVnaw%+3*x1J7=gpAfrf+A!l%-_ofmX@|G7+pU1k|3Aq7EWfZ%xCZYl??")
end)
addEventHandler("onClientResourceStop", resourceRoot, function()
  engineRestoreCOL(1733)
  engineRestoreModel(1733)
end)
addEventHandler("onClientVehicleCollision", root, function(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10)
  if arg1 < 300 then
    return
  end
  if getVehicleController(source) ~= localPlayer then
    return
  end
  if var0 and getTickCount() - var0 <= 60000 then
    return
  end
  var0 = getTickCount()
  if isElement(arg0) and getElementType(arg0) ~= "object" then
    return
  end
  if getZoneName(arg3, arg4, arg5, true) ~= "Los Santos" then
    return
  end
  triggerServerEvent("traffic:violation", localPlayer, source, 1)
end)
for forvar12, forvar13 in ipairs({
  {
    1184.915,
    -1410.938,
    13.3831,
    1185.328,
    -1400.666,
    13.2001
  },
  {
    1337.129,
    -1385.309,
    13.6826,
    1347.911,
    -1385.213,
    13.5178
  },
  {
    1286.835,
    -1718.191,
    13.5468,
    1286.721,
    -1706.592,
    13.5468
  },
  {
    1423.981,
    -1602.254,
    13.54,
    1435.699,
    -1602.191,
    13.5546
  },
  {
    1811.116,
    -1617.771,
    13.5468,
    1811.165,
    -1606.866,
    13.5468
  },
  {
    1976.044,
    -1471.696,
    13.5589,
    1976.204,
    -1463.5,
    13.3972
  },
  {
    1070.721,
    -1846.458,
    13.5468,
    1070.607,
    -1852.341,
    13.3801
  },
  {
    1586.536,
    -1166.912,
    24.0781,
    1586.547,
    -1160.866,
    23.914
  },
  {
    2633.172,
    -1739.283,
    10.8984,
    2633.209,
    -1732.583,
    10.7203
  },
  {
    1695.257,
    -1720.143,
    13.5468,
    1684.165,
    -1720.293,
    13.5468
  },
  {
    911.8017,
    -1562.568,
    13.5449,
    917.8007,
    -1562.568,
    13.3828
  },
  {
    643.3876,
    -1415.712,
    13.5655,
    632.7011,
    -1415.825,
    13.4029
  }
}) do
  if math.abs(unpack(forvar13) - unpack(forvar13)) > math.abs(unpack(forvar13) - unpack(forvar13)) then
    ({})[createColPolygon(unpack(forvar13))] = true
  else
    ({})[createColPolygon(unpack(forvar13))] = true
  end
end
function CheckTrafficLights(arg0)
  if arg0 ~= localPlayer then
    return
  end
  if not var0[source] then
    return
  end
  if not isPedInVehicle(localPlayer) then
    return
  end
  if getElementRotation(arg0) >= 45 and getElementRotation(arg0) < 135 then
    if getTrafficLightState() == 0 or getTrafficLightState() == 1 or getTrafficLightState() == 2 then
      issueTrafficLightViolation()
    end
  elseif getElementRotation(arg0) >= 135 and getElementRotation(arg0) < 225 then
    if getTrafficLightState() == 2 or getTrafficLightState() == 3 or getTrafficLightState() == 4 then
      issueTrafficLightViolation()
    end
  elseif getElementRotation(arg0) >= 225 and getElementRotation(arg0) < 315 then
    if getTrafficLightState() == 0 or getTrafficLightState() == 1 or getTrafficLightState() == 2 then
      issueTrafficLightViolation()
    end
  elseif (getElementRotation(arg0) >= 315 or getElementRotation(arg0) < 45) and (getTrafficLightState() == 2 or getTrafficLightState() == 3 or getTrafficLightState() == 4) then
    issueTrafficLightViolation()
  end
end
addEventHandler("onClientColShapeHit", resourceRoot, CheckTrafficLights)
function issueTrafficLightViolation()
  if not getPedOccupiedVehicle(localPlayer) then
    return
  end
  if getVehicleController((getPedOccupiedVehicle(localPlayer))) ~= localPlayer then
    return
  end
  if var0 and getTickCount() - var0 <= 60000 then
    return
  end
  var0 = getTickCount()
  triggerServerEvent("traffic:violation", localPlayer, getPedOccupiedVehicle(localPlayer), 2)
end
