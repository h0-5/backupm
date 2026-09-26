-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

function cancelDamageWhileFlying()
  if var0(var1) then
    cancelEvent()
  end
end
;({}).restorePlayer = function(arg0, arg1)
  var0(arg1, false)
  setPedAnimation(arg1, false)
  setElementVelocity(arg1, 0, 0, 0)
  setElementRotation(arg1, 0, 0, 0)
  setElementCollisionsEnabled(arg1, true)
  arg0:destroySmokeGenerators(arg1)
  arg0.rotations[arg1] = nil
  arg0.previousVelocity[arg1] = nil
end
;({}).createSmokeGenerator = function(arg0, arg1)
  setElementCollisionsEnabled(createObject(2780, getElementPosition(arg1)), false)
  setObjectScale(createObject(2780, getElementPosition(arg1)), 0)
  return (createObject(2780, getElementPosition(arg1)))
end
;({}).createSmokeGenerators = function(arg0, arg1)
  if not arg0.smokeGenerators[arg1] then
    ({})[1] = arg0:createSmokeGenerator(arg1)
    attachElements(({})[1], arg1, 0.75, -0.2, -0.4, -40, 0, 60)
    ;({})[2] = arg0:createSmokeGenerator(arg1)
    attachElements(({})[2], arg1, -0.75, -0.2, -0.4, -40, 0, -60)
    arg0.smokeGenerators[arg1] = {}
  end
end
;({}).destroySmokeGenerators = function(arg0, arg1)
  if arg0.smokeGenerators[arg1] then
    for forvar5, forvar6 in ipairs(arg0.smokeGenerators[arg1]) do
      destroyElement(forvar6)
    end
    arg0.smokeGenerators[arg1] = nil
  end
end
function angleDiff(arg0, arg1)
  arg0, arg1 = arg0 % 360, arg1 % 360
  if (arg0 - arg1) % 360 <= 180 then
    return (arg0 - arg1) % 360
  else
    return -(360 - (arg0 - arg1) % 360)
  end
end
;({}).Start = function()
  addEvent("superman:updateRight", true)
  addEventHandler("onClientResourceStop", getResourceRootElement(var1), var0.Stop, false)
  addEventHandler("onPlayerJoin", var2, var0.onJoin)
  addEventHandler("onPlayerQuit", var2, var0.onQuit)
  addEventHandler("onClientRender", var2, var0.processControls)
  addEventHandler("onClientRender", var2, var0.processFlight)
  addEventHandler("onClientPlayerDamage", var3, var0.onDamage, false)
  addEventHandler("onClientPlayerVehicleEnter", var3, var0.onEnter)
  addEventHandler("onClientElementDataChange", var2, var0.onDataChange)
  addEventHandler("onClientElementStreamIn", var2, var0.onStreamIn)
  addEventHandler("onClientElementStreamOut", var2, var0.onStreamOut)
  addEventHandler("superman:updateRight", var2, var0.updateRight)
  bindKey("jump", "down", var0.onJump)
  addCommandHandler("superman", var0.cmdSuperman)
  var0.smokeGenerators = {}
  var0.rotations = {}
  var0.previousVelocity = {}
  triggerServerEvent("superman:checkRight", var3)
end
addEventHandler("onClientResourceStart", getResourceRootElement((getThisResource())), ({}).Start, false)
addEvent("hud:onClientHudItemClick", true)
addEventHandler("hud:onClientHudItemClick", root, function(arg0, arg1)
  if arg0 == "admintag" then
    if arg1 then
      triggerServerEvent("superman:checkRight", var0)
    else
      triggerServerEvent("superman:checkRight", var0)
    end
  end
end)
;({}).Stop = function()
  setGravity(var1)
  for forvar4 in var2() do
    var0:restorePlayer(forvar4)
  end
end
;({}).onJoin = function(arg0)
  var1(arg0 or source, false)
end
;({}).onQuit = function(arg0, arg1)
  if var1(arg1 or source) then
    var0:restorePlayer(arg1 or source)
  end
end
function showWarning()
  if getScreenFromWorldPosition(getPedBonePosition(var0, 6)) and getScreenFromWorldPosition(getPedBonePosition(var0, 6)) and getScreenFromWorldPosition(getPedBonePosition(var0, 6)) and getScreenFromWorldPosition(getPedBonePosition(var0, 6)) < 100 then
    dxDrawText("You can not warp into a vehicle when superman is activated.", getScreenFromWorldPosition(getPedBonePosition(var0, 6)))
  end
end
function hideWarning()
  removeEventHandler("onClientRender", root, showWarning)
end
;({}).onEnter = function()
  if (var0(var1) or getElementData(var1, "temp:superman:takingOff")) and not isTimer(warningTimer) then
    addEventHandler("onClientRender", root, showWarning)
    warningTimer = setTimer(hideWarning, 5000, 1)
  end
end
;({}).updateRight = function(arg0)
  var0 = arg0
end
;({}).onDamage = function()
  if var1(var2) then
    cancelEvent()
  end
end
;({}).onStreamIn = function()
end
;({}).onStreamOut = function()
  if source and isElement(source) and getElementType(source) == "player" and var1(source) then
    var0.rotations[source] = nil
    var0.previousVelocity[source] = nil
  end
end
;({}).onDataChange = function(arg0, arg1)
  if arg0 == "temp:superman:flying" and isElement(source) and getElementType(source) == "player" and arg1 ~= getElementData(source, arg0) and arg1 == true and getElementData(source, arg0) == false then
    var0:restorePlayer(source)
  end
end
;({}).onJump = function(arg0, arg1)
  if not var0 then
    return
  end
  if not var3(var2) and getPedSimplestTask(var2) == "TASK_SIMPLE_IN_AIR" then
    setElementVelocity(var2, 0, 0, var4)
    setTimer(var1.startFlight, 100, 1)
  end
end
;({}).cmdSuperman = function()
  if not var0 then
    return
  end
  if isPedInVehicle(var2) or var3(var2) then
    return
  end
  setElementVelocity(var2, 0, 0, var4)
  setTimer(var1.startFlight, var5, 1)
  setElementData(var2, "temp:superman:takingOff", true)
end
;({}).startFlight = function()
  setElementData(var1, "temp:superman:takingOff", false)
  if var2(var1) then
    return
  end
  triggerServerEvent("superman:start", var3)
  var4(var1, true)
  setElementVelocity(var1, 0, 0, 0)
  var0.currentSpeed = 0
  var0.extraVelocity = {
    x = 0,
    y = 0,
    z = 0
  }
end
;({}).processControls = function()
  if not var1(var2) then
    var3, var4 = getPedControlState("jump"), var3
    if not var4 and var3 then
      var0.onJump()
    end
    return
  end
  if getPedControlState("forwards") then
    Vector3D:new(0, 0, 0).y = 1
  elseif getPedControlState("backwards") then
    Vector3D:new(0, 0, 0).y = -1
  end
  if getPedControlState("left") then
    Vector3D:new(0, 0, 0).x = 1
  elseif getPedControlState("right") then
    Vector3D:new(0, 0, 0).x = -1
  end
  Vector3D:new(0, 0, 0):Normalize()
  Vector3D:new(getCameraMatrix() - getCameraMatrix(), getCameraMatrix() - getCameraMatrix(), getCameraMatrix() - getCameraMatrix()):Normalize()
  if getPedControlState("sprint") then
  else
  end
  if Vector3D:new(0, 0, 0):Module() == 0 and var0.currentSpeed ~= 0 then
    setGravity(0)
  else
    setGravity(var11)
  end
  if var0.currentSpeed ~= 0 and (Vector3D:new(0, 0, 0):Module() == 0 or var5 * var9 < var0.currentSpeed) then
    var0.currentSpeed = var0.currentSpeed - var6 * var8 * var10
    if 0 > var0.currentSpeed then
      var0.currentSpeed = 0
    end
  elseif Vector3D:new(0, 0, 0):Module() ~= 0 and var5 * var9 > var0.currentSpeed then
    var0.currentSpeed = var0.currentSpeed + var6 * var8 * var10
    if var5 * var9 < var0.currentSpeed then
      var0.currentSpeed = var5 * var9
    end
  end
  if Vector3D:new(0, 0, 0):Module() ~= 0 then
    var0.lastDirection = Vector3D:new(Vector3D:new(getCameraMatrix() - getCameraMatrix(), getCameraMatrix() - getCameraMatrix(), getCameraMatrix() - getCameraMatrix()):Mul(-1).x * Vector3D:new(0, 0, 0).y - Vector3D:new(getCameraMatrix() - getCameraMatrix(), getCameraMatrix() - getCameraMatrix(), getCameraMatrix() - getCameraMatrix()):Mul(-1).y * Vector3D:new(0, 0, 0).x, Vector3D:new(getCameraMatrix() - getCameraMatrix(), getCameraMatrix() - getCameraMatrix(), getCameraMatrix() - getCameraMatrix()):Mul(-1).x * Vector3D:new(0, 0, 0).x + Vector3D:new(getCameraMatrix() - getCameraMatrix(), getCameraMatrix() - getCameraMatrix(), getCameraMatrix() - getCameraMatrix()):Mul(-1).y * Vector3D:new(0, 0, 0).y, Vector3D:new(getCameraMatrix() - getCameraMatrix(), getCameraMatrix() - getCameraMatrix(), getCameraMatrix() - getCameraMatrix()):Mul(-1).z * Vector3D:new(0, 0, 0).y)
  elseif var0.lastDirection then
    if var0.currentSpeed == 0 then
      var0.lastDirection = nil
    end
  else
  end
  Vector3D:new(getElementVelocity(var2)):Normalize()
  if 0 < var0.currentSpeed then
    Vector3D:new(getElementVelocity(var2)):Normalize()
    if 0 < math.sqrt(Vector3D:new(getElementVelocity(var2)).x ^ 2 + Vector3D:new(getElementVelocity(var2)).y ^ 2) then
      if 0 <= angleDiff(var12((Vector3D:new(getElementVelocity(var2)):Mul(var0.currentSpeed))), (var12((Vector3D:new(getElementVelocity(var2)))))) then
        if angleDiff(var12((Vector3D:new(getElementVelocity(var2)):Mul(var0.currentSpeed))), (var12((Vector3D:new(getElementVelocity(var2)))))) > var13 then
        else
        end
      elseif angleDiff(var12((Vector3D:new(getElementVelocity(var2)):Mul(var0.currentSpeed))), (var12((Vector3D:new(getElementVelocity(var2)))))) < var13 then
      else
      end
      Vector3D:new(getElementVelocity(var2)):Mul(var0.currentSpeed).x = -math.sqrt(Vector3D:new(getElementVelocity(var2)):Mul(var0.currentSpeed).x ^ 2 + Vector3D:new(getElementVelocity(var2)):Mul(var0.currentSpeed).y ^ 2) * math.cos(math.rad(var12((Vector3D:new(getElementVelocity(var2)):Mul(var0.currentSpeed))) % 360))
      Vector3D:new(getElementVelocity(var2)):Mul(var0.currentSpeed).y = math.sqrt(Vector3D:new(getElementVelocity(var2)):Mul(var0.currentSpeed).x ^ 2 + Vector3D:new(getElementVelocity(var2)):Mul(var0.currentSpeed).y ^ 2) * math.sin(math.rad(var12((Vector3D:new(getElementVelocity(var2)):Mul(var0.currentSpeed))) % 360))
    end
  end
  if Vector3D:new(getElementVelocity(var2)):Mul(var0.currentSpeed):Module() == 0 then
    var0.extraVelocity = {
      x = 0,
      y = 0,
      z = 0
    }
  end
  setElementVelocity(var2, Vector3D:new(getElementVelocity(var2)):Mul(var0.currentSpeed).x + var0.extraVelocity.x, Vector3D:new(getElementVelocity(var2)):Mul(var0.currentSpeed).y + var0.extraVelocity.y, Vector3D:new(getElementVelocity(var2)):Mul(var0.currentSpeed).z + var0.extraVelocity.z)
  if 0 < var0.extraVelocity.z then
    var0.extraVelocity.z = var0.extraVelocity.z - 1
    if 0 > var0.extraVelocity.z then
      var0.extraVelocity.z = 0
    end
  elseif 0 > var0.extraVelocity.z then
    var0.extraVelocity.z = var0.extraVelocity.z + 1
    if 0 < var0.extraVelocity.z then
      var0.extraVelocity.z = 0
    end
  end
end
;({}).processFlight = function()
  for forvar4 in var1() do
    Vector3D:new(getElementPosition(forvar4)).z = Vector3D:new(getElementPosition(forvar4)).z - getElementDistanceFromCentreOfMassToBaseOfModel(forvar4)
    if Vector3D:new(getElementPosition(forvar4)).z > 0 and processLineOfSight(Vector3D:new(getElementPosition(forvar4)).x, Vector3D:new(getElementPosition(forvar4)).y, Vector3D:new(getElementPosition(forvar4)).z, Vector3D:new(getElementPosition(forvar4)).x, Vector3D:new(getElementPosition(forvar4)).y, Vector3D:new(getElementPosition(forvar4)).z - var2 - 1, true, true, true, true, true, false, false, false) then
    end
    if Vector3D:new(getElementPosition(forvar4)).z - processLineOfSight(Vector3D:new(getElementPosition(forvar4)).x, Vector3D:new(getElementPosition(forvar4)).y, Vector3D:new(getElementPosition(forvar4)).z, Vector3D:new(getElementPosition(forvar4)).x, Vector3D:new(getElementPosition(forvar4)).y, Vector3D:new(getElementPosition(forvar4)).z - var2 - 1, true, true, true, true, true, false, false, false) and Vector3D:new(getElementPosition(forvar4)).z - processLineOfSight(Vector3D:new(getElementPosition(forvar4)).x, Vector3D:new(getElementPosition(forvar4)).y, Vector3D:new(getElementPosition(forvar4)).z, Vector3D:new(getElementPosition(forvar4)).x, Vector3D:new(getElementPosition(forvar4)).y, Vector3D:new(getElementPosition(forvar4)).z - var2 - 1, true, true, true, true, true, false, false, false) < var3 then
      var0:restorePlayer(forvar4)
      if forvar4 == var4 then
        setGravity(var5)
        triggerServerEvent("superman:stop", getRootElement())
      end
    elseif Vector3D:new(getElementPosition(forvar4)).z - processLineOfSight(Vector3D:new(getElementPosition(forvar4)).x, Vector3D:new(getElementPosition(forvar4)).y, Vector3D:new(getElementPosition(forvar4)).z, Vector3D:new(getElementPosition(forvar4)).x, Vector3D:new(getElementPosition(forvar4)).y, Vector3D:new(getElementPosition(forvar4)).z - var2 - 1, true, true, true, true, true, false, false, false) and Vector3D:new(getElementPosition(forvar4)).z - processLineOfSight(Vector3D:new(getElementPosition(forvar4)).x, Vector3D:new(getElementPosition(forvar4)).y, Vector3D:new(getElementPosition(forvar4)).z, Vector3D:new(getElementPosition(forvar4)).x, Vector3D:new(getElementPosition(forvar4)).y, Vector3D:new(getElementPosition(forvar4)).z - var2 - 1, true, true, true, true, true, false, false, false) < var2 then
      var0:processLanding(forvar4, Vector3D:new(getElementVelocity(forvar4)), Vector3D:new(getElementPosition(forvar4)).z - processLineOfSight(Vector3D:new(getElementPosition(forvar4)).x, Vector3D:new(getElementPosition(forvar4)).y, Vector3D:new(getElementPosition(forvar4)).z, Vector3D:new(getElementPosition(forvar4)).x, Vector3D:new(getElementPosition(forvar4)).y, Vector3D:new(getElementPosition(forvar4)).z - var2 - 1, true, true, true, true, true, false, false, false))
    elseif Vector3D:new(getElementVelocity(forvar4)):Module() < var6 then
      var0:processIdleFlight(forvar4)
    else
      var0:processMovingFlight(forvar4, (Vector3D:new(getElementVelocity(forvar4))))
    end
  end
end
;({}).processIdleFlight = function(arg0, arg1)
  if getPedAnimation(arg1) ~= var0 or getPedAnimation(arg1) ~= var1 then
    setPedAnimation(arg1, var0, var1, -1, var2, false, false)
  end
  setElementCollisionsEnabled(arg1, false)
  if arg1 == var3 then
    Vector3D:new(getCameraMatrix() - getCameraMatrix(), getCameraMatrix() - getCameraMatrix(), getCameraMatrix() - getCameraMatrix()):Normalize()
    Vector3D:new(getCameraMatrix() - getCameraMatrix(), getCameraMatrix() - getCameraMatrix(), getCameraMatrix() - getCameraMatrix()):Mul(-1).z = math.atan(Vector3D:new(getCameraMatrix() - getCameraMatrix(), getCameraMatrix() - getCameraMatrix(), getCameraMatrix() - getCameraMatrix()):Mul(-1).x / Vector3D:new(getCameraMatrix() - getCameraMatrix(), getCameraMatrix() - getCameraMatrix(), getCameraMatrix() - getCameraMatrix()):Mul(-1).y)
    if Vector3D:new(getCameraMatrix() - getCameraMatrix(), getCameraMatrix() - getCameraMatrix(), getCameraMatrix() - getCameraMatrix()):Mul(-1).y > 0 then
      Vector3D:new(getCameraMatrix() - getCameraMatrix(), getCameraMatrix() - getCameraMatrix(), getCameraMatrix() - getCameraMatrix()):Mul(-1).z = Vector3D:new(getCameraMatrix() - getCameraMatrix(), getCameraMatrix() - getCameraMatrix(), getCameraMatrix() - getCameraMatrix()):Mul(-1).z + math.pi
    end
    Vector3D:new(getCameraMatrix() - getCameraMatrix(), getCameraMatrix() - getCameraMatrix(), getCameraMatrix() - getCameraMatrix()):Mul(-1).z = math.deg(Vector3D:new(getCameraMatrix() - getCameraMatrix(), getCameraMatrix() - getCameraMatrix(), getCameraMatrix() - getCameraMatrix()):Mul(-1).z) + 180
    setPedRotation(var3, Vector3D:new(getCameraMatrix() - getCameraMatrix(), getCameraMatrix() - getCameraMatrix(), getCameraMatrix() - getCameraMatrix()):Mul(-1).z)
    setElementRotation(var3, 0, 0, Vector3D:new(getCameraMatrix() - getCameraMatrix(), getCameraMatrix() - getCameraMatrix(), getCameraMatrix() - getCameraMatrix()):Mul(-1).z)
  else
    setPedRotation(arg1, (getPedCameraRotation(arg1)))
    setElementRotation(arg1, 0, 0, (getPedCameraRotation(arg1)))
  end
end
;({}).processMovingFlight = function(arg0, arg1, arg2)
  if getPedAnimation(arg1) ~= var0 or getPedAnimation(arg1) ~= var1 then
    setPedAnimation(arg1, var0, var1, -1, var2, true, false)
  end
  if arg1 == var3 then
    setElementCollisionsEnabled(arg1, true)
  else
    setElementCollisionsEnabled(arg1, false)
  end
  if arg2.x == 0 and arg2.y == 0 then
    Vector3D:new(0, 0, 0).z = getPedRotation(arg1)
  else
    Vector3D:new(0, 0, 0).z = math.deg(math.atan(arg2.x / arg2.y))
    if 0 < arg2.y then
      Vector3D:new(0, 0, 0).z = Vector3D:new(0, 0, 0).z - 180
    end
    Vector3D:new(0, 0, 0).z = (Vector3D:new(0, 0, 0).z + 180) % 360
  end
  Vector3D:new(0, 0, 0).x = -math.deg(arg2.z / arg2:Module() * 1.2)
  Vector3D:new(0, 0, 0).x = Vector3D:new(0, 0, 0).x - 40
  if not arg0.rotations[arg1] then
    arg0.rotations[arg1] = 0
  end
  if not arg0.previousVelocity[arg1] then
    arg0.previousVelocity[arg1] = Vector3D:new(0, 0, 0)
  end
  if var5((angleDiff(var4(arg2), (var4(arg0.previousVelocity[arg1]))))) then
  end
  if -0 * var6 / var7 > arg0.rotations[arg1] then
    if -0 * var6 / var7 - arg0.rotations[arg1] > var8 then
      arg0.rotations[arg1] = arg0.rotations[arg1] + var8
    else
      arg0.rotations[arg1] = -0 * var6 / var7
    end
  elseif arg0.rotations[arg1] - -0 * var6 / var7 > var8 then
    arg0.rotations[arg1] = arg0.rotations[arg1] - var8
  else
    arg0.rotations[arg1] = -0 * var6 / var7
  end
  if arg0.rotations[arg1] > var6 then
    arg0.rotations[arg1] = var6
  elseif arg0.rotations[arg1] < -var6 then
    arg0.rotations[arg1] = -var6
  elseif math.abs(arg0.rotations[arg1]) < var9 then
    arg0.rotations[arg1] = 0
  end
  Vector3D:new(0, 0, 0).y = arg0.rotations[arg1]
  setPedRotation(arg1, Vector3D:new(0, 0, 0).z)
  setElementRotation(arg1, Vector3D:new(0, 0, 0).x, Vector3D:new(0, 0, 0).y, Vector3D:new(0, 0, 0).z)
  arg0.previousVelocity[arg1] = arg2
  if arg2:Module() > var10 - var9 and not var11(arg1) then
    arg0:createSmokeGenerators(arg1)
  else
    arg0:destroySmokeGenerators(arg1)
  end
end
;({}).processLanding = function(arg0, arg1, arg2, arg3)
  if getPedAnimation(arg1) ~= var0 or getPedAnimation(arg1) ~= var1 then
    setPedAnimation(arg1, var0, var1, -1, var2, true, false)
  end
  if arg1 == var3 then
    setElementCollisionsEnabled(arg1, true)
  else
    setElementCollisionsEnabled(arg1, false)
  end
  if arg2:Module() > var4 - var5 and not var6(arg1) then
    arg0:createSmokeGenerators(arg1)
  else
    arg0:destroySmokeGenerators(arg1)
  end
  if arg2.x == 0 and arg2.y == 0 then
    Vector3D:new(0, 0, 0).z = getPedRotation(arg1)
  else
    Vector3D:new(0, 0, 0).z = math.deg(math.atan(arg2.x / arg2.y))
    if 0 < arg2.y then
      Vector3D:new(0, 0, 0).z = Vector3D:new(0, 0, 0).z - 180
    end
    Vector3D:new(0, 0, 0).z = (Vector3D:new(0, 0, 0).z + 180) % 360
  end
  Vector3D:new(0, 0, 0).x = -(85 - arg3 * 85 / var7)
  Vector3D:new(0, 0, 0).x = Vector3D:new(0, 0, 0).x - 40
  setPedRotation(arg1, Vector3D:new(0, 0, 0).z)
  setElementRotation(arg1, Vector3D:new(0, 0, 0).x, Vector3D:new(0, 0, 0).y, Vector3D:new(0, 0, 0).z)
end
Vector3D = {
  new = function(arg0, arg1, arg2, arg3)
    return setmetatable({
      x = arg1 or 0,
      y = arg2 or 0,
      z = arg3 or 0
    }, {__index = Vector3D})
  end,
  Copy = function(arg0)
    return Vector3D:new(arg0.x, arg0.y, arg0.z)
  end,
  Normalize = function(arg0)
    if arg0:Module() ~= 0 then
      arg0.x = arg0.x / arg0:Module()
      arg0.y = arg0.y / arg0:Module()
      arg0.z = arg0.z / arg0:Module()
    end
  end,
  Dot = function(arg0, arg1)
    return arg0.x * arg1.x + arg0.y * arg1.y + arg0.z * arg1.z
  end,
  Module = function(arg0)
    return math.sqrt(arg0.x * arg0.x + arg0.y * arg0.y + arg0.z * arg0.z)
  end,
  AddV = function(arg0, arg1)
    return Vector3D:new(arg0.x + arg1.x, arg0.y + arg1.y, arg0.z + arg1.z)
  end,
  SubV = function(arg0, arg1)
    return Vector3D:new(arg0.x - arg1.x, arg0.y - arg1.y, arg0.z - arg1.z)
  end,
  CrossV = function(arg0, arg1)
    return Vector3D:new(arg0.y * arg1.z - arg0.z * arg1.y, arg0.z * arg1.x - arg0.x * arg1.z, arg0.x * arg1.y - arg0.y * arg1.z)
  end,
  Mul = function(arg0, arg1)
    return Vector3D:new(arg0.x * arg1, arg0.y * arg1, arg0.z * arg1)
  end,
  Div = function(arg0, arg1)
    return Vector3D:new(arg0.x / arg1, arg0.y / arg1, arg0.z / arg1)
  end,
  MulV = function(arg0, arg1)
    return Vector3D:new(arg0.x * arg1.x, arg0.y * arg1.y, arg0.z * arg1.z)
  end,
  DivV = function(arg0, arg1)
    return Vector3D:new(arg0.x / arg1.x, arg0.y / arg1.y, arg0.z / arg1.z)
  end
}
