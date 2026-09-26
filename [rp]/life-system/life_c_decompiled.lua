-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

addEventHandler("onClientResourceStart", resourceRoot, function()
  setBlurLevel(0)
  setPedTargetingMarkerEnabled(false)
  setAmbientSoundEnabled("gunfire", false)
  setOcclusionsEnabled(false)
  setWorldSpecialPropertyEnabled("extraairresistance", false)
  engineSetAsynchronousLoading(true, true)
  setWorldSoundEnabled(1, true, true)
  setWorldSoundEnabled(2, true, true)
  setWorldSoundEnabled(3, true, true)
  setWorldSoundEnabled(4, true, true)
  setWorldSoundEnabled(5, true, true)
  setWorldSoundEnabled(41, false, true)
  setWorldSoundEnabled(0, 28, false, true)
  setWorldSoundEnabled(20, false, true)
  setWorldSoundEnabled(21, false, true)
  setWorldSoundEnabled(22, false, true)
  setWorldSoundEnabled(23, false, true)
  setWorldSoundEnabled(24, false, true)
  engineReplaceModel(engineLoadDFF("pee.dff"), 1248)
end)
function walking(arg0, arg1)
  if arg1 == "down" then
    if getKeyState("space") then
      return
    end
    setPedControlState(localPlayer, "walk", true)
  end
end
bindKey("forwards", "down", walking)
bindKey("backwards", "down", walking)
bindKey("left", "down", walking)
bindKey("right", "down", walking)
addEventHandler("onClientPlayerDamage", root, function(arg0, arg1, arg2, arg3)
  if var0[tostring(arg1)] then
    if source == localPlayer then
      if arg2 == 5 then
      elseif arg2 == 6 then
      elseif arg2 == 7 then
      else
      end
      setTimer(function(arg0, arg1)
        if isElement(arg1) then
          fxAddBlood(getPedBonePosition(arg1, arg0))
        end
      end, 500, 15, 52, localPlayer)
    end
    if arg0 == localPlayer then
      if arg2 == 5 then
      elseif arg2 == 6 then
      elseif arg2 == 7 then
      else
      end
      setTimer(function(arg0, arg1)
        if isElement(arg1) then
          fxAddBlood(getPedBonePosition(arg1, arg0))
        end
      end, 500, 15, 52, source)
    end
  end
end)
function getCharacterStatus(arg0)
  return var0 and var0[arg0] or false
end
function setCharacterStatus(arg0, arg1)
  if not var0 then
    var0 = {}
  end
  arg1 = math.min(math.max(arg1, 0), 100)
  var0[arg0] = arg1
  triggerServerEvent("character_status:update", localPlayer, arg0, arg1)
  triggerEvent("onClientCharacterStatusChange", localPlayer, var0)
end
function getCharacterDamages()
  return var0
end
addEvent("character_status:sendToClient", true)
addEventHandler("character_status:sendToClient", localPlayer, function(arg0, arg1)
  var0 = arg0
  var1 = arg1
  triggerEvent("onClientCharacterStatusChange", localPlayer, var0)
  startCharacterStatusTimer()
end)
addEvent("damages:sync", true)
addEventHandler("damages:sync", localPlayer, function(arg0)
  var0 = arg0
end)
addEvent("character_status:update", true)
addEventHandler("character_status:update", localPlayer, function(arg0, arg1)
  var0[arg0] = arg1
  triggerEvent("onClientCharacterStatusChange", localPlayer, var0)
end)
function startCharacterStatusTimer()
  if isTimer(var0) then
    killTimer(var0)
  end
  var0 = setTimer(function()
    if not isPedDead(localPlayer) and not getElementData(localPlayer, "prisoner") then
      if var0.thirsty == 0 then
        exports.notifications:output({
          en = "Your character is thirsty",
          ar = "\216\180\216\174\216\181\217\138\216\170\217\131 \216\170\216\180\216\185\216\177 \216\168\216\167\217\132\216\185\216\183\216\180"
        }, 8000, "warning", "right")
        setElementHealth(localPlayer, getElementHealth(localPlayer) - 2)
      else
        var0.thirsty = math.min(math.max((var0.thirsty or 0) - 1, 0), 100)
      end
      if var0.hungry == 0 then
        exports.notifications:output({
          en = "Your character is hungry",
          ar = "\216\180\216\174\216\181\217\138\216\170\217\131 \216\170\216\180\216\185\216\177 \216\168\216\167\217\132\216\172\217\136\216\185"
        }, 8000, "warning", "right")
        setElementHealth(localPlayer, getElementHealth(localPlayer) - 2)
      else
        var0.hungry = math.min(math.max((var0.hungry or 0) - 0.5, 0), 100)
      end
      if var0.urine == 100 then
        exports.notifications:output({
          en = "Your character needs to pee, type /piss to pee",
          ar = "\217\132\217\132\216\170\216\168\217\136\217\132 /piss \216\180\216\174\216\181\217\138\216\170\217\131 \216\168\216\173\216\167\216\172\216\169 \217\132\217\130\216\182\216\167\216\161 \216\167\217\132\216\173\216\167\216\172\216\169\216\140 \216\167\217\131\216\170\216\168"
        }, 8000, "warning", "right")
        setElementHealth(localPlayer, getElementHealth(localPlayer) - 2)
      else
        var0.urine = math.min(math.max((var0.urine or 0) + 0.2, 0), 100)
      end
      if var0.cleanness == 0 then
        exports.notifications:output({
          en = "Your character smells bad, you have to take a shower",
          ar = "\216\180\216\174\216\181\217\138\216\170\217\131 \216\170\217\134\216\168\216\185\216\171 \217\133\217\134\217\135\216\167 \216\177\216\167\216\166\216\173\216\169 \217\131\216\177\217\138\217\135\216\169\216\140 \216\185\217\132\217\138\217\131 \216\167\217\132\216\167\216\179\216\170\216\173\217\133\216\167\217\133"
        }, 8000, "warning", "right")
      else
        var0.cleanness = math.min(math.max((var0.cleanness or 0) - 0.05, 0), 100)
      end
      if getPedAnimation(localPlayer) ~= "CRACK" or getPedAnimation(localPlayer) ~= "crckidle2" then
        if var0.sleepy == 100 then
          exports.notifications:output({
            en = "Your character needs sleep",
            ar = "\216\180\216\174\216\181\217\138\216\170\217\131 \216\168\216\173\216\167\216\172\216\169 \217\132\217\132\217\134\217\136\217\133"
          }, 8000, "warning", "right")
          setElementHealth(localPlayer, getElementHealth(localPlayer) - 1)
        else
          var0.sleepy = math.min(math.max((var0.sleepy or 0) + 0.15, 0), 100)
        end
      end
      if getElementHealth(localPlayer) == 0 then
        setElementData(localPlayer, "dead_reason", "character_status")
      end
      if true then
        triggerServerEvent("character_status:sync", localPlayer, var0)
        triggerEvent("onClientCharacterStatusChange", localPlayer, var0)
      end
    end
  end, 60000, 0)
end
addEvent("character_status:request_sync", true)
addEventHandler("character_status:request_sync", root, function()
  if not getElementData(localPlayer, "character:id") then
    return
  end
  triggerServerEvent("character_status:sync", localPlayer, var0)
end)
addEvent("onClientCharacterRespawn", true)
addEventHandler("onClientCharacterRespawn", root, function(arg0)
  if var0.thirsty == 0 then
    var0.thirsty = 20
  end
  if var0.hungry == 0 then
    var0.hungry = 20
  end
  triggerServerEvent("character_status:sync", localPlayer, var0)
  triggerEvent("onClientCharacterStatusChange", localPlayer, var0)
end)
function stopCharacterStatusTimer()
  if isTimer(var0) then
    killTimer(var0)
  end
  disableSleepyEffect()
end
is_sleepy = false
addEvent("onClientCharacterStatusChange", false)
addEventHandler("onClientCharacterStatusChange", localPlayer, function(arg0)
  if arg0.sleepy == 100 then
    if isTimer(sleepyTimer) then
      return
    end
    sleepyTimer = setTimer(enableSleepyEffect, 8000, 1)
  else
    disableSleepyEffect()
  end
end)
function enableSleepyEffect()
  if is_sleepy then
    return
  end
  is_sleepy = true
  addEventHandler("onClientRender", root, drawDarkForSleep)
  setCameraDrunkLevel(40)
  exports.notifications:output({
    en = "Your character needs sleep, type /sleep to sleep",
    ar = "\217\132\217\132\217\134\217\136\217\133 /sleep \216\180\216\174\216\181\217\138\216\170\217\131 \216\168\216\173\216\167\216\172\216\169 \217\132\217\132\217\134\217\136\217\133\216\140 \216\167\217\131\216\170\216\168"
  }, 10000, "warning", "right")
end
function disableSleepyEffect()
  if isTimer(sleepyTimer) then
    killTimer(sleepyTimer)
  end
  if not is_sleepy then
    return
  end
  is_sleepy = false
  removeEventHandler("onClientRender", root, drawDarkForSleep)
  setCameraDrunkLevel(0)
  setElementDimension(localPlayer, getElementDimension(localPlayer) + 1)
  setElementDimension(localPlayer, (getElementDimension(localPlayer)))
end
function drawDarkForSleep()
  dxDrawRectangle(0, 0, var0, var1, tocolor(0, 0, 0, math.random(180, 200)), false)
end
addEvent("drug:use", true)
addEventHandler("drug:use", localPlayer, function(arg0)
  if arg0 then
    setElementData(localPlayer, "temp:drugEffect", 60, false)
    var0.sleepy = math.max(var0.sleepy - 50, 0)
    var0.fatigue = 0
    triggerServerEvent("character_status:sync", localPlayer, var0)
    triggerEvent("onClientCharacterStatusChange", localPlayer, var0)
    if isTimer(drugEffectTimer) then
      killTimer(drugEffectTimer)
    end
    drugEffectTimer = setTimer(function()
      setElementData(localPlayer, "temp:drugEffect", nil, false)
    end, 300000, 1)
  end
end)
addEventHandler("onClientSettingsReady", resourceRoot, function()
  if not getElementData(localPlayer, "character:id") then
    return
  end
  if exports.settings:getSetting("head_turning") then
    addEventHandler("onClientRender", root, onClientLookAtRender)
  else
    removeEventHandler("onClientRender", root, onClientLookAtRender)
    updateLookAt()
  end
end)
addEventHandler("onClientSettingChange", localPlayer, function(arg0, arg1, arg2)
  if arg0 == "head_turning" then
    if arg2 then
      addEventHandler("onClientRender", root, onClientLookAtRender)
    else
      removeEventHandler("onClientRender", root, onClientLookAtRender)
      updateLookAt()
    end
  end
end)
function onClientLookAtRender()
  setPedLookAt(localPlayer, getPedBonePosition(localPlayer, 8) - 300 * math.sin((math.rad(360 - getPedCameraRotation(localPlayer)))), getPedBonePosition(localPlayer, 8) + 300 * math.cos((math.rad(360 - getPedCameraRotation(localPlayer)))), getPedBonePosition(localPlayer, 8))
end
function updateLookAt()
  setPedLookAt(localPlayer, 0, 0, 0, 0)
end
addEvent("onClientCharacterSpawn", true)
addEventHandler("onClientCharacterSpawn", localPlayer, function(arg0)
  if exports.settings:getSetting("head_turning") then
    addEventHandler("onClientRender", root, onClientLookAtRender)
  else
    updateLookAt()
  end
end)
addEventHandler("onClientPlayerWasted", localPlayer, function(arg0)
  if exports.settings:getSetting("head_turning") then
    removeEventHandler("onClientRender", root, onClientLookAtRender)
  end
end)
addEvent("onClientPlayerQuitFromCharacter", true)
addEventHandler("onClientPlayerQuitFromCharacter", localPlayer, function(arg0)
  removeEventHandler("onClientRender", root, onClientLookAtRender)
  updateLookAt()
  handObject = false
  stopCharacterStatusTimer()
  cancelAlcoholEffect()
  if drugEffectTimer and isTimer(drugEffectTimer) then
    setElementData(localPlayer, "temp:drugEffect", nil, false)
    killTimer(drugEffectTimer)
  end
end)
addEvent("onClientElementMenuShow", true)
addEventHandler("onClientElementMenuShow", localPlayer, function(arg0, arg1, arg2)
  if arg1 <= 2 and arg2 == "object" then
    if not isElement(arg0) then
      return
    end
    if isPedInVehicle(localPlayer) then
      return
    end
    if getElementData(arg0, "item:data") and getElementData(arg0, "item:data").Properties.Carry and (math.abs(getElementBoundingBox(arg0)) + math.abs(getElementBoundingBox(arg0))) * (math.abs(getElementBoundingBox(arg0)) + math.abs(getElementBoundingBox(arg0))) * (math.abs(getElementBoundingBox(arg0)) + math.abs(getElementBoundingBox(arg0))) <= 0.5 then
      exports.interaction:addInteractOption(arg0, {
        text = "Carry",
        data = {
          (getElementData(arg0, "item:data"))
        }
      })
    end
  end
end)
addCommandHandler("put", function(arg0, arg1)
  if isElement(var0) then
    triggerServerEvent("life:setAnimation", localPlayer, "CARRY", "putdwn", -1, false, false, false, false)
    setTimer(function(arg0)
      triggerServerEvent("life:carryElement:putdown", localPlayer, var0, getPointFromDistanceRotation(getElementPosition(localPlayer)))
      var0 = false
    end, 1000, 1, var0)
  end
end, false, false)
handObject = false
addCommandHandler("drop", function(arg0, arg1)
  if isElement(handObject) then
    setElementRotation(handObject, 0, 90, getElementRotation(localPlayer))
    triggerServerEvent("life:drop", localPlayer, handObject, getPointFromDistanceRotation(getElementPosition(localPlayer)))
    handObject = false
  end
end, false, false)
addEvent("life:hand:object", true)
addEventHandler("life:hand:object", localPlayer, function(arg0)
  handObject = arg0
end)
addEvent("life:execute_drop", true)
addEventHandler("life:execute_drop", localPlayer, function()
  executeCommandHandler("drop")
end)
addEvent("life:vomit", true)
addEventHandler("life:vomit", root, function()
  setTimer(function(arg0)
    if isElement(arg0) then
      createEffect("puke", getPointFromDistanceRotation(getElementPosition(arg0)))
    end
  end, 4000, 1, source)
end)
addEvent("life:smell", true)
addEventHandler("life:smell", root, function()
  createEffect("puke", getElementPosition(source))
end)
function getPointFromDistanceRotation(arg0, arg1, arg2, arg3)
  return arg0 + math.cos((math.rad(90 - arg3))) * arg2, arg1 + math.sin((math.rad(90 - arg3))) * arg2
end
addEventHandler("onClientVehicleStartEnter", root, function(arg0)
  if arg0 ~= localPlayer then
    return
  end
  if getDistanceBetweenPoints3D(getElementPosition(arg0)) > 6 then
    cancelEvent()
    return
  end
  if isElement(var0) then
    cancelEvent()
  end
end)
addEvent("carry:sync", true)
addEventHandler("carry:sync", localPlayer, function(arg0)
  var0 = arg0
end)
function quitCharacterOrServer()
  if isElement(var0) then
    triggerServerEvent("life:carryElement:putdown", localPlayer, var0, getPointFromDistanceRotation(getElementPosition(localPlayer)))
    var0 = false
  end
end
addEventHandler("onClientResourceStop", resourceRoot, quitCharacterOrServer)
addEventHandler("onClientPlayerQuitFromCharacter", localPlayer, quitCharacterOrServer)
addEvent("onClientUseItem", true)
addEventHandler("onClientUseItem", root, function(arg0, arg1, arg2)
  if arg2.Name == "Identity Card" then
    if eui:uiGetVisible(GUIEditor.container.identity_card) then
      eui:uiSetVisible(GUIEditor.container.identity_card, false)
    else
      eui:uiSetText(GUIEditor.label.identity_card_id, string.format("%09d", tostring(arg2.SpecialProperties.PersonalID)))
      eui:uiSetText(GUIEditor.label.identity_card_name, tostring(arg2.SpecialProperties.Name))
      eui:uiSetText(GUIEditor.label.identity_card_birthdate, arg2.SpecialProperties.BirthDate[1] .. "-" .. arg2.SpecialProperties.BirthDate[2] .. "-" .. arg2.SpecialProperties.BirthDate[3])
      eui:uiSetText(GUIEditor.label.identity_card_sex, tostring(arg2.SpecialProperties.Gender == 1 and "Male" or "Female"))
      eui:uiSetVisible(GUIEditor.container.identity_card, true)
    end
  end
end)
function toggleCockpitView()
  if not var0 then
    if getCameraTarget() == localPlayer or getCameraTarget() == getPedOccupiedVehicle(localPlayer) then
      var0 = true
      addEventHandler("onClientPreRender", root, updateCamera)
      addEventHandler("onClientCursorMove", root, freecamMouse)
    end
  else
    var0 = false
    setCameraTarget(localPlayer, localPlayer)
    removeEventHandler("onClientPreRender", root, updateCamera)
    removeEventHandler("onClientCursorMove", root, freecamMouse)
  end
end
addCommandHandler("fp", toggleCockpitView)
addCommandHandler("cockpit", toggleCockpitView)
function updateCamera()
  if var0 then
    if var1 and var2 and not var3 and startTick and getTickCount() - startTick > var4 then
      var2 = false
      var3 = true
      if var5 > 0 then
        var6 = var5 / var7
      elseif var5 < 0 then
        var6 = var5 / -var7
      end
      if var8 > 0 then
        var9 = var8 / var7
      elseif var8 < 0 then
        var9 = var8 / -var7
      end
    end
    if var3 then
      var10 = var10 + 1
      if var5 > 0 then
        var5 = var5 - var6
      elseif var5 < 0 then
        var5 = var5 + var6
      end
      if var10 >= var7 then
        var3 = false
        var10 = 0
      end
    end
    inVehicle = isPedInVehicle(localPlayer)
    if inVehicle then
      if not isElement((getPedOccupiedVehicle(localPlayer))) then
        return
      end
      cameraAngleX = var5 - math.rad(getElementRotation((getPedOccupiedVehicle(localPlayer))))
      cameraAngleY = var8 + math.rad(getElementRotation((getPedOccupiedVehicle(localPlayer))))
      if getPedControlState(localPlayer, "vehicle_look_behind") or getPedControlState(localPlayer, "vehicle_look_right") and getPedControlState(localPlayer, "vehicle_look_left") then
        cameraAngleX = cameraAngleX + math.rad(180)
      elseif getPedControlState(localPlayer, "vehicle_look_left") then
        cameraAngleX = cameraAngleX - math.rad(90)
      elseif getPedControlState(localPlayer, "vehicle_look_right") then
        cameraAngleX = cameraAngleX + math.rad(90)
      end
    else
      if var1 then
        var5 = var5 - math.rad(getElementRotation(localPlayer))
      end
      cameraAngleX = var5
      cameraAngleY = var8
    end
    var1 = inVehicle
    setCameraMatrix((getPedBonePosition(localPlayer, 6) + getPedBonePosition(localPlayer, 7)) / 2, (getPedBonePosition(localPlayer, 6) + getPedBonePosition(localPlayer, 7)) / 2, (getPedBonePosition(localPlayer, 6) + getPedBonePosition(localPlayer, 7)) / 2 - 0.2 + 0.2, (getPedBonePosition(localPlayer, 6) + getPedBonePosition(localPlayer, 7)) / 2 + math.cos(cameraAngleY) * math.sin(cameraAngleX) * 100, (getPedBonePosition(localPlayer, 6) + getPedBonePosition(localPlayer, 7)) / 2 + math.cos(cameraAngleY) * math.cos(cameraAngleX) * 100, (getPedBonePosition(localPlayer, 6) + getPedBonePosition(localPlayer, 7)) / 2 - 0.2 + 0.2 + math.sin(cameraAngleY) * 100, 0)
  end
end
function freecamMouse(arg0, arg1, arg2, arg3)
  if isCursorShowing() or isMTAWindowActive() then
    var0 = 5
    return
  elseif var0 > 0 then
    var0 = var0 - 1
    return
  end
  startTick = getTickCount()
  var1 = true
  if var2 then
    var2 = false
    var3 = 0
  end
  arg2 = arg2 - guiGetScreenSize() / 2
  arg3 = arg3 - guiGetScreenSize() / 2
  var4 = var4 + arg2 * var5 * 0.01745
  var6 = var6 - arg3 * var5 * 0.01745
  if var4 > var7 then
    var4 = var4 - 2 * var7
  elseif var4 < -var7 then
    var4 = var4 + 2 * var7
  end
  if var6 > var7 then
    var6 = var6 - 2 * var7
  elseif var6 < -var7 then
    var6 = var6 + 2 * var7
  end
  if var6 < -var7 / 4 then
    var6 = -var7 / 4
  elseif var6 > var7 / 2.1 then
    var6 = var7 / 2.1
  end
end
addEvent("life:alcoholEffects", true)
addEventHandler("life:alcoholEffects", root, function(arg0)
  if isTimer(var0) then
    killTimer(var0)
  end
  setCameraDrunkLevel(arg0 * 2.55)
  exports.public:setBlurShaderVisible(true, true, arg0 * 0.05)
  var0 = setTimer(function()
    setCameraDrunkLevel(1)
    exports.public:setBlurShaderVisible(false, true)
  end, math.max(arg0 * 0.3 * 1000, 2000), 1)
end)
addEventHandler("onClientPlayerWasted", localPlayer, function()
  cancelAlcoholEffect()
end)
function cancelAlcoholEffect()
  if isTimer(var0) then
    killTimer(var0)
    setCameraDrunkLevel(1)
    exports.public:setBlurShaderVisible(false, true)
  end
end
addEventHandler("onClientPlayerWeaponFire", root, function(arg0, arg1, arg2, arg3, arg4, arg5, arg6)
  if source == localPlayer then
    return
  end
  if arg0 == 23 then
    return
  end
  if getDistanceBetweenPoints3D(getElementPosition(localPlayer)) <= 100 and getTickCount() - var0 >= 5000 then
    if exports.hud:getPlayerHudSetting(localPlayer, "admintag") and not getElementData(localPlayer, "admin:hideadmin") then
      outputChatBox("WARNING! Your character heard shots fired in this area (" .. tostring(getElementData(source, "character:name")) .. ").", 181, 181, 181)
    else
      outputChatBox("WARNING! Your character heard shots fired in this area.", 181, 181, 181)
    end
    var0 = getTickCount()
  end
end)
addEvent("life:setTime", true)
addEventHandler("life:setTime", localPlayer, function(arg0, arg1)
  setTime(arg0, arg1)
end)
GUIEditor = {
  button = {},
  window = {},
  container = {},
  image = {},
  label = {}
}
function UIKitReadySecondary()
  eui = exports.UIKit
  GUIEditor.window[1] = eui:uiCreateWindow(false, false, 338, 110, {
    en = "Identity Card",
    ar = "\216\168\216\183\216\167\217\130\216\169 \216\167\217\132\217\135\217\136\217\138\216\169"
  })
  eui:uiWindowSetMovable(GUIEditor.window[1], false)
  eui:uiSetVisible(GUIEditor.window[1], false)
  eui:uiCreateLabel(10, 30, 318, 20, {
    en = "Do you need a new copy of your Identity Card? ($40)",
    ar = "\217\135\217\132 \216\170\216\173\216\170\216\167\216\172 \216\165\217\132\217\137 \217\134\216\179\216\174\216\169 \216\172\216\175\217\138\216\175\216\169 \217\133\217\134 \216\168\216\183\216\167\217\130\216\169 \216\167\217\132\217\135\217\136\217\138\216\169\216\159 (40$)"
  }, tocolor(255, 255, 255, 255), "left", "top", GUIEditor.window[1])
  GUIEditor.button[1] = eui:uiCreateButton(10, 70, 157, 35, {en = "Yes!", ar = "\217\134\216\185\217\133"}, _, GUIEditor.window[1])
  GUIEditor.button[2] = eui:uiCreateButton(171, 70, 157, 35, {
    en = "No, thanks.",
    ar = "\217\132\216\167 \216\180\217\131\216\177\216\167\217\139"
  }, _, GUIEditor.window[1])
  GUIEditor.container.identity_card = eui:uiCreateContainer(100, false, 512, 288)
  eui:uiSetVisible(GUIEditor.container.identity_card, false)
  GUIEditor.image.identity_card = eui:uiCreateImage(0, 0, 512, 288, "images/identity_card.png", GUIEditor.container.identity_card)
  GUIEditor.label.identity_card_id = eui:uiCreateLabel(200, 97.5, 100, 20, "ID HERE", tocolor(0, 0, 0, 255), "left", "top", GUIEditor.image.identity_card)
  GUIEditor.label.identity_card_name = eui:uiCreateLabel(230, 122, 200, 30, "NAME HERE", tocolor(0, 0, 0, 255), "left", "top", GUIEditor.image.identity_card)
  eui:uiSetFont(GUIEditor.label.identity_card_name, "default-large")
  GUIEditor.label.identity_card_birthdate = eui:uiCreateLabel(155, 200, 200, 30, "BIRTH DATE HERE", tocolor(0, 0, 0, 255), "left", "top", GUIEditor.image.identity_card)
  GUIEditor.label.identity_card_sex = eui:uiCreateLabel(328, 200, 100, 30, "SEX HERE", tocolor(0, 0, 0, 255), "left", "top", GUIEditor.image.identity_card)
end
addEventHandler("onClientUIReady", resourceRoot, UIKitReadySecondary)
addEventHandler("onClientUIKitReady", root, UIKitReadySecondary)
addEventHandler("onClientUIClick", root, function()
  if source == GUIEditor.button[1] then
    triggerServerEvent("life:newIdentity", localPlayer)
    eui:uiSetVisible(GUIEditor.window[1], false)
  elseif source == GUIEditor.button[2] then
    eui:uiSetVisible(GUIEditor.window[1], false)
  end
end)
addEvent("onClientElementMenuClick", true)
addEventHandler("onClientElementMenuClick", root, function(arg0, arg1, arg2)
  if not isElement(arg0) then
    return
  end
  if getElementType(arg0) == "ped" and getElementData(arg0, "ped:interact") == "identity" and arg1 == "Talk" then
    eui:uiSetVisible(GUIEditor.window[1], true)
  end
end)
addEventHandler("onClientPlayerDamage", localPlayer, function(arg0, arg1, arg2, arg3)
  if arg1 == 0 or arg1 == 1 or arg1 == 14 or arg1 == 15 or arg1 == 41 then
    cancelEvent()
  end
end)
addEventHandler("onClientPlayerStealthKill", localPlayer, function(arg0)
  cancelEvent()
end)
UI = {
  window = {},
  label = {},
  button = {},
  edit = {}
}
function UIKitReady()
  UI.window[1] = eui:uiCreateWindow(false, false, 420, 200, {
    en = "Receive the salary",
    ar = "\216\167\216\179\216\170\217\132\216\167\217\133 \216\167\217\132\216\177\216\167\216\170\216\168"
  })
  eui:uiSetVisible(UI.window[1], false)
  UI.label.Info = eui:uiCreateLabel(10, 40, 232, 20, "", tocolor(255, 255, 255, 255), "left", "top", UI.window[1])
  UI.button[1] = eui:uiCreateButton(5, 165, 100, 30, {
    en = "Take now",
    ar = "\216\167\216\174\216\176 \216\167\217\132\216\162\217\134"
  }, tocolor(0, 0, 0, 255), UI.window[1])
  UI.button[2] = eui:uiCreateButton(110, 165, 150, 30, {
    en = "I will take it later",
    ar = "\216\179\217\136\217\129 \216\162\216\174\216\176\217\135 \217\132\216\167\216\173\217\130\216\167\217\139"
  }, tocolor(0, 0, 0, 255), UI.window[1])
  UI.window[2] = eui:uiCreateWindow(false, false, 400, 310, {
    en = "Change Name",
    ar = "\216\170\216\186\217\138\217\138\216\177 \216\167\217\132\216\167\216\179\217\133"
  })
  eui:uiSetVisible(UI.window[2], false)
  eui:uiCreateLabel(10, 60, 380, 30, {
    en = [[
		You can change your name once every week
		Please stick to using a realistic name to avoid being penalized

		((  Name change fee: #00ff00$3000#ffffff  ))
	]],
    ar = "\t\t\217\138\217\133\217\131\217\134\217\131 \216\170\216\186\217\138\217\138\216\177 \216\167\216\179\217\133\217\131 \217\133\216\177\216\169 \217\136\216\167\216\173\216\175\216\169 \217\131\217\132 \216\163\216\179\216\168\217\136\216\185\n\t\t\217\138\216\177\216\172\217\137 \216\167\217\132\216\167\217\132\216\170\216\178\216\167\217\133 \216\168\216\167\216\179\216\170\216\174\216\175\216\167\217\133 \216\167\216\179\217\133 \217\136\216\167\217\130\216\185\217\138 \217\132\216\170\216\172\217\134\216\168 \216\167\217\132\216\170\216\185\216\177\216\182 \217\132\217\132\216\185\217\130\217\136\216\168\216\169\n\n\t\t((  #00ff00$3000#ffffff :\216\177\216\179\217\136\217\133 \216\170\216\186\217\138\217\138\216\177 \216\167\217\132\216\167\216\179\217\133  ))\n\t"
  }, tocolor(255, 255, 255, 255), "center", "top", UI.window[2])
  UI.edit.new_name = eui:uiCreateEdit(20, 150, 360, 35, "", {
    en = "New Name",
    ar = "\216\167\217\132\216\167\216\179\217\133 \216\167\217\132\216\172\216\175\217\138\216\175"
  }, _, UI.window[2])
  UI.button.change_name = eui:uiCreateButton(10, 210, 380, 40, {
    en = "Change Now",
    ar = "\216\170\216\186\217\138\217\138\216\177 \216\167\217\132\216\162\217\134"
  }, "primary", UI.window[2])
  UI.button.cancel_change_name = eui:uiCreateButton(10, 260, 380, 40, {
    en = "I don't want to change the name",
    ar = "\217\132\216\167 \216\163\216\177\217\138\216\175 \216\170\216\186\217\138\217\138\216\177 \216\167\217\132\216\167\216\179\217\133"
  }, _, UI.window[2])
  eui:uiSetProperty(UI.button.cancel_change_name, "HoverTextColor", tocolor(255, 0, 0))
  UI.window.carry_request = eui:uiCreateRectangle(false, eui:uiGetReferenceScreenSize() - 150, 350, 100, "bg_default", true, true, true, true)
  eui:uiSetVisible(UI.window.carry_request, false)
  UI.label.carry_request = eui:uiCreateLabel(10, 10, 330, 50, {
    en = "Player (" .. "" .. [[
) asks for permission to carry you
	]],
    ar = "\216\165\216\176\217\134 \216\168\216\173\217\133\217\132\217\131 (" .. "" .. ") \217\138\216\183\217\132\216\168 \216\167\217\132\217\132\216\167\216\185\216\168\n\t"
  }, tocolor(255, 255, 255, 255), "center", "center", UI.window.carry_request)
  UI.button["carry_request:accept"] = eui:uiCreateButton(10, 55, 160, 35, {en = "Accept", ar = "\217\130\216\168\217\136\217\132"}, "primary", UI.window.carry_request)
  UI.button["carry_request:reject"] = eui:uiCreateButton(180, 55, 160, 35, {en = "Reject", ar = "\216\177\217\129\216\182"}, _, UI.window.carry_request)
end
addEventHandler("onClientUIReady", resourceRoot, UIKitReady)
addEventHandler("onClientUIKitReady", root, UIKitReady)
function closeUIWindows(arg0)
  eui:uiSetVisible(GUIEditor.window[1], false)
  eui:uiSetVisible(GUIEditor.container.identity_card, false)
  eui:uiSetVisible(UI.window[1], false)
  eui:uiSetVisible(UI.window[2], false)
  eui:uiSetVisible(UI.window.carry_request, false)
  showCursor(false)
end
addEvent("onClientPlayerQuitFromCharacter", true)
addEventHandler("onClientPlayerQuitFromCharacter", localPlayer, closeUIWindows)
addEventHandler("onClientPlayerWasted", localPlayer, closeUIWindows)
addEvent("life:showSavedSalary", true)
addEventHandler("life:showSavedSalary", root, function(arg0, arg1)
  eui:uiSetVisible(UI.window[1], true)
  showCursor(true)
  eui:uiSetText(UI.label.Info, {
    en = "${color.primary}\226\128\162 Total Salary  \194\187  #00FF00$" .. tostring(arg0) .. "\n${color.primary}\226\128\162 Your Bank Account  \194\187  #FFFFFF" .. (arg1 or "Not exist") .. [[


]] .. "Give me your bank card to register your account" .. [[

and transfer the salary to your bank account directly the next time.]] .. "",
    ar = "${color.primary}\226\128\162 \217\131\216\167\217\133\217\132 \216\167\217\132\216\177\216\167\216\170\216\168  \194\187  #00FF00$" .. tostring(arg0) .. "\n${color.primary}\226\128\162 \216\173\216\179\216\167\216\168\217\131 \216\167\217\132\216\168\217\134\217\131\217\138  \194\187  #FFFFFF" .. (arg1 or "\217\132\216\167\217\138\217\136\216\172\216\175") .. [[


]] .. "\216\163\216\185\216\183\217\134\217\138 \216\168\216\183\216\167\217\130\216\169 \216\167\217\132\216\168\217\134\217\131 \217\132\216\170\216\179\216\172\217\138\217\132 \216\173\216\179\216\167\216\168\217\131" .. "\n\217\136\216\170\216\173\217\136\217\138\217\132 \216\167\217\132\216\177\216\167\216\170\216\168 \216\165\217\132\217\137 \216\173\216\179\216\167\216\168\217\131 \216\167\217\132\216\168\217\134\217\131\217\138 \217\133\216\168\216\167\216\180\216\177\216\169 \217\129\217\138 \216\167\217\132\217\133\216\177\216\169 \216\167\217\132\217\130\216\167\216\175\217\133\216\169." .. ""
  })
end)
addEventHandler("onClientUIChanged", root, function()
  if source == UI.edit.new_name and eui:uiGetText(source) ~= "" then
    eui:uiSetText(source, (eui:uiGetText(source):gsub("_", " "):gsub("%s+", " "):gsub("(%a)([%w_]*)", var0)))
  end
end)
addEventHandler("onClientUIClick", root, function()
  if source == UI.button[1] then
    triggerServerEvent("life:takeSavedSalary", localPlayer)
    eui:uiSetVisible(UI.window[1], false)
    showCursor(false)
  elseif source == UI.button[2] then
    eui:uiSetVisible(UI.window[1], false)
    showCursor(false)
  elseif source == UI.button.change_name then
    if var0 then
      return
    end
    for forvar6, forvar7 in ipairs((split(eui:uiGetText(UI.edit.new_name), " "))) do
      if not isASCII(forvar7) then
        break
      end
    end
    if utfLen((eui:uiGetText(UI.edit.new_name))) == 0 then
      exports.notifications:output({
        en = "Enter the new name",
        ar = "\216\163\216\175\216\174\217\132 \216\167\217\132\216\167\216\179\217\133 \216\167\217\132\216\172\216\175\217\138\216\175"
      }, 8000, "error")
      return
    end
    if utfSub(eui:uiGetText(UI.edit.new_name), 1, 1) == " " then
      exports.notifications:output({
        en = "There is a space at the beginning of the name",
        ar = "\217\138\217\136\216\172\216\175 \217\133\216\179\216\167\217\129\216\169 \217\129\217\138 \216\168\216\175\216\167\217\138\216\169 \216\167\216\179\217\133 \216\167\217\132\216\180\216\174\216\181\217\138\216\169"
      }, 8000, "error")
      return
    end
    if utfSub(eui:uiGetText(UI.edit.new_name), utfLen((eui:uiGetText(UI.edit.new_name))), (utfLen((eui:uiGetText(UI.edit.new_name))))) == " " then
      exports.notifications:output({
        en = "There is a space at the end of the name",
        ar = "\217\138\217\136\216\172\216\175 \217\133\216\179\216\167\217\129\216\169 \217\129\217\138 \217\134\217\135\216\167\217\138\216\169 \216\167\216\179\217\133 \216\167\217\132\216\180\216\174\216\181\217\138\216\169"
      }, 8000, "error")
      return
    end
    if string.match(eui:uiGetText(UI.edit.new_name), "%d+") then
      exports.notifications:output({
        en = "The character name must not contain numbers",
        ar = "\217\138\216\172\216\168 \216\163\217\134 \217\132\216\167 \217\138\216\173\216\170\217\136\217\138 \216\167\216\179\217\133 \216\167\217\132\216\180\216\174\216\181\217\138\216\169 \216\185\217\132\217\137 \216\163\216\177\217\130\216\167\217\133"
      }, 8000, "error")
      return
    end
    if not string.match(eui:uiGetText(UI.edit.new_name), "^[+-]?%a+%s[%a+'?.?]+%a$") then
      exports.notifications:output({
        en = "Invalid character name",
        ar = "\216\167\216\179\217\133 \216\167\217\132\216\180\216\174\216\181\217\138\216\169 \216\186\217\138\216\177 \216\181\216\167\217\132\216\173"
      }, 6000, "error")
      return
    end
    if false and utfLen((eui:uiGetText(UI.edit.new_name))) >= 5 and utfLen((eui:uiGetText(UI.edit.new_name))) <= 22 then
      var0 = true
      triggerServerEvent("character:change_name", localPlayer, (eui:uiGetText(UI.edit.new_name)))
    else
      exports.notifications:output({
        en = "The name must be in the form (FirstName SecondName)",
        ar = "\217\138\216\172\216\168 \216\163\217\134 \217\138\216\170\217\131\217\136\217\134 \216\167\217\132\216\167\216\179\217\133 \217\133\217\134 \216\167\216\179\217\133 \216\163\217\136\217\132 \217\136\216\167\216\179\217\133 \216\171\216\167\217\134\217\138"
      }, 8000, "error")
    end
  elseif source == UI.button.cancel_change_name then
    eui:uiSetVisible(UI.window[2], false)
    showCursor(false)
  elseif source == UI.button["carry_request:accept"] then
    eui:uiSetVisible(UI.window.carry_request, false)
    showCursor(false)
    if current_carry_requester and isElement(current_carry_requester) then
      triggerServerEvent("carry:send_request:callback", localPlayer, current_carry_requester)
    end
    current_carry_requester = nil
  elseif source == UI.button["carry_request:reject"] then
    eui:uiSetVisible(UI.window.carry_request, false)
    showCursor(false)
  end
end)
function isASCII(arg0)
  for forvar4 = 1, #arg0 do
    if arg0:byte(forvar4) < 33 or arg0:byte(forvar4) > 126 then
      return false
    end
  end
  return _FOR_
end
addEvent("character:change_name:callback", true)
addEventHandler("character:change_name:callback", localPlayer, function(arg0)
  if arg0 then
    eui:uiSetVisible(UI.window[2], false)
    showCursor(false)
  end
  eui:uiSetText(UI.edit.new_name, "")
  var0 = false
end)
addEvent("onClientElementMenuClick", true)
addEventHandler("onClientElementMenuClick", root, function(arg0, arg1, arg2)
  if not isElement(arg0) then
    return
  end
  if getElementType(arg0) == "ped" and getElementData(arg0, "ped:interact") == "change_name" and arg1 == "Talk" then
    eui:uiSetVisible(UI.window[2], true)
    showCursor(true)
  end
end)
function getActualVelocity(arg0, arg1, arg2, arg3)
  return (arg1 ^ 2 + arg2 ^ 2 + arg3 ^ 2) ^ 0.5
end
function updateDamage(arg0)
  var0 = getActualVelocity(arg0, getElementVelocity(arg0))
  if var1 - var0 >= 0.25 and not isElementFrozen(arg0) then
    if var1 - var0 >= 0.45 then
      if getVehicleType((getPedOccupiedVehicle(localPlayer))) == "BMX" or getVehicleType((getPedOccupiedVehicle(localPlayer))) == "Bike" or getVehicleType((getPedOccupiedVehicle(localPlayer))) == "Train" then
        return
      end
      if processLineOfSight(getElementPosition(localPlayer)) then
        if not exports.hud:getHudSetting("seatbelt") and getVehicleType((getPedOccupiedVehicle(localPlayer))) ~= "Train" then
          triggerServerEvent("life:vehicle_crash:throw_player", (getPedOccupiedVehicle(localPlayer)))
        end
      elseif not exports.hud:getHudSetting("seatbelt") and getVehicleType((getPedOccupiedVehicle(localPlayer))) ~= "Train" then
        triggerServerEvent("life:vehicle_crash:throw_player", (getPedOccupiedVehicle(localPlayer)))
      end
    end
    c_lasthealth = getElementHealth(localPlayer) - 20 * var1
    if c_lasthealth <= 0 then
      c_lasthealth = 0
    end
    setElementHealth(localPlayer, c_lasthealth)
  end
  var1 = var0
end
addEventHandler("onClientRender", root, function()
  if isPedInVehicle(localPlayer) then
    c_veh = getPedOccupiedVehicle(localPlayer)
    if c_veh then
      updateDamage(c_veh)
    end
  else
    var0 = 0
    var1 = 0
  end
end)
addEventHandler("onClientPlayerDamage", localPlayer, function(arg0, arg1, arg2, arg3)
  if isElement(arg0) then
    table.insert(var0, {
      tick = getTickCount(),
      attacker = arg0,
      rot = findRotation(getElementPosition(localPlayer))
    })
  end
end)
function findRotation(arg0, arg1, arg2, arg3)
  return -var0(var1(arg2 - arg0, arg3 - arg1)) < 0 and -var0(var1(arg2 - arg0, arg3 - arg1)) + 360 or -var0(var1(arg2 - arg0, arg3 - arg1))
end
function anim(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8)
  if arg1 < getTickCount() - arg0 then
    return arg5, arg6, arg7
  end
  return interpolateBetween(arg2, arg3, arg4, arg5, arg6, arg7, (getTickCount() - arg0) / arg1, arg8)
end
addEventHandler("onClientRender", root, function()
  for forvar3 = 1, #var0 do
    if var0[forvar3] then
      dxDrawImage(var1, var2, var3, var3, "images/damage_indicator.png", getElementRotation(getCamera()) - var0[forvar3].rot, 0, 0, tocolor(255, 255, 255, (anim(var0[forvar3].tick, 2000, 100, 0, 0, 0, 0, 0, "Linear"))))
      if anim(var0[forvar3].tick, 2000, 100, 0, 0, 0, 0, 0, "Linear") == 0 then
        var0[forvar3] = nil
      end
    end
  end
end)
createWater(-2699.32, 912.66015, 66.35, -2690.99, 914.24121, 66.35, -2699.05, 935, 66.35, -2691.34, 935, 66.35)
createWater(-2645.9, 953.20996, 70.7, -2632.74, 953.1416, 70.7, -2645.82, 961, 70.7, -2632.97, 961, 70.7)
createWater(-2679.44, 931.9, 78.45, -2667.68, 931.9, 78.45, -2679.44, 942, 78.45, -2667.68, 942, 78.45)
createWater(-2646.42, 842, 62.75, -2639.75, 842, 62.75, -2646.66, 855.96289, 62.75, -2639.41, 856.21972, 62.75)
current_carry_requester = false
addEvent("carry:send_request", true)
addEventHandler("carry:send_request", root, function()
  if not getElementData(source, "character:name") then
    return
  end
  current_carry_requester = source
  eui:uiSetVisible(UI.window.carry_request, true)
  eui:uiSetText(UI.label.carry_request, {
    en = "Player (" .. getElementData(source, "character:name") .. [[
) asks for permission to carry you
	]],
    ar = "\217\138\216\183\217\132\216\168 \216\167\217\132\217\132\216\167\216\185\216\168 (" .. getElementData(source, "character:name") .. ") \216\167\216\176\217\134 \216\168\216\173\217\133\217\132\217\131\n\t"
  })
end)
addEventHandler("onClientPlayerDamage", localPlayer, function(arg0, arg1, arg2, arg3)
  if arg1 >= 22 and arg1 <= 34 and var0[arg2] and getElementData(source, "temp:armor") and getElementData(source, "temp:armor") > 0 and 0 < getPedStat(source, 164) then
    setElementData(source, "temp:armor", (math.max(getElementData(source, "temp:armor") - math.max(arg3 * ((1500 - getPedStat(source, 164)) / 1500), 0), 0)))
    cancelEvent()
  end
end, _, "low-5")
