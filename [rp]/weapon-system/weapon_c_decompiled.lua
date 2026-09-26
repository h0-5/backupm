-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

addEventHandler("onClientPlayerSpawn", localPlayer, function()
  var0 = 0
  var1 = false
  var2.index = 0
  var2.selected = false
end)
addEventHandler("onClientPlayerWasted", localPlayer, function()
  var0 = 0
  var1 = false
  var2.index = 0
  var2.selected = false
  endTaserInjury()
end)
function getCurrentWeapon()
  return var0
end
;({
  list = {},
  index = 0,
  selected = false,
  visible = false
}).switch = function(arg0, arg1)
  if arg1 == "down" then
    if var0.visible then
      return
    end
    if not getElementData(localPlayer, "character:id") then
      return
    end
    if isPedDead(localPlayer) then
      return
    end
    if getPedControlState(localPlayer, "aim_weapon") then
      return
    end
    var0.list = {}
    for forvar7, forvar8 in ipairs((exports["inventory-system"]:getInventoryItems("character:" .. tostring((getElementData(localPlayer, "character:id")))))) do
      if forvar8.Type == "Weapon" then
        table.insert(var0.list, {
          forvar8,
          (exports["inventory-system"]:getItemImageName(forvar8))
        })
      end
    end
    bindKey("next_weapon", "down", var0.select)
    bindKey("previous_weapon", "down", var0.select)
    addEventHandler("onClientRender", root, var0.draw)
    var0.visible = true
    if isTimer(var1) then
      killTimer(var1)
    end
    var1 = setTimer(function()
      var0.switch(_, "up")
    end, 500, 1)
  else
    if not var0.visible then
      return
    end
    unbindKey("next_weapon", "down", var0.select)
    unbindKey("previous_weapon", "down", var0.select)
    removeEventHandler("onClientRender", root, var0.draw)
    var0.visible = false
    var2 = var0.list[var0.index] and var0.list[var0.index][1] or false
    if var2 and var2 and var2.ID == var2.ID then
      return
    end
    if var2 then
      if var2.SpecialProperties.Ammo == 1 and tonumber(var2.Properties.WeapModel) ~= var3 then
        if isAmmoWeapon(getSlotFromWeapon(tonumber(var2.Properties.WeapModel))) then
          toggleControl("fire", false)
        end
      else
        toggleControl("fire", true)
      end
      if var2.Name == "Taser" then
        toggleControl("fire", false)
      end
    else
      toggleControl("fire", true)
    end
    triggerServerEvent("weapons:switchWeapon", localPlayer, var2 and var2.ID or false)
  end
end
function UIKitReady()
  eui = exports.UIKit
  GRADIENT_BG = eui:getUIImage("gradient_x")
  UIFONT = eui:getUIFont("default-large")
  UIFONTSMALL = eui:getUIFont("ui-default")
end
addEventHandler("onClientUIReady", resourceRoot, UIKitReady)
addEvent("onClientUIKitReady", true)
addEventHandler("onClientUIKitReady", root, UIKitReady)
hud_bg = exports.hud:getBGTexture()
;({
  list = {},
  index = 0,
  selected = false,
  visible = false
}).draw_selection = function()
  for forvar7 = var4.index - 2, var4.index + 2 do
    if forvar7 == var4.index then
      dxDrawImage(var0, var2, var3, var1, GRADIENT_BG, 0, 0, 0, tocolor(0, 8, 20, 255), true)
      if hud_bg then
        dxDrawImage(var0, var2 + var1 - 1, var3, 1, hud_bg, 0, 0, 0, tocolor(255, 255, 255, 150), true)
      else
        hud_bg = exports.hud:getBGTexture()
      end
      if var4.list[forvar7] then
        dxDrawRectangle(var0 + var3 + 4 * var5, var2 + (var1 - var1 / 2) / 2, 2 * var5, var1 / 2, tocolor(255, 255, 255, 255), true)
        dxDrawImage(var0 + var3 - var1 - 15 * var5, var2 + (var1 - var1 * 0.8) / 2, var1, var1 * 0.8, var4.list[forvar7][2], 0, 0, 0, tocolor(255, 255, 255, 255), true)
        dxDrawText(var4.list[forvar7][1].Name, var0, var2 + 5 * var5, var0 + var3 - 30 * var5 - var1, var2 + var1, tocolor(255, 255, 255, 255), 0.95, UIFONT, "right", "top", false, false, true, false, false)
        dxDrawText(tostring((var4.list[forvar7][1].SpecialProperties.Ammo or 1) - 1), var0, var2, var0 + var3 - 30 * var5 - var1, var2 + var1 - 5 * var5, tocolor(255, 255, 255, 150), 1, UIFONTSMALL, "right", "bottom", false, false, true, false, false)
      else
        dxDrawRectangle(var0 + var3 + 4 * var5, var2 + (var1 - var1 / 2) / 2, 4 * var5, var1 / 2, tocolor(255, 0, 0, 255), true)
        dxDrawText("NO WEAPON", var0, var2, var0 + var3 - 30 * var5, var2 + var1, tocolor(255, 0, 0, 255), 0.95, UIFONT, "right", "center", false, false, true, false, false)
      end
    elseif var4.list[forvar7] then
      dxDrawImage(var0 + 50 * var5, var2, var3 - 50 * var5, var1, GRADIENT_BG, 0, 0, 0, tocolor(0, 8, 20, 100), true)
      dxDrawImage(var0 + var3 - var1 - 5 * var5, var2 + (var1 - var1 * 0.8) / 2, var1, var1 * 0.8, var4.list[forvar7][2], 0, 0, 0, tocolor(255, 255, 255, 255), true)
      dxDrawText(var4.list[forvar7][1].Name .. "  (" .. tostring((var4.list[forvar7][1].SpecialProperties.Ammo or 1) - 1) .. ")", var0, var2, var0 + var3 - 20 * var5 - var1, var2 + var1, tocolor(255, 255, 255, 150), 1, UIFONTSMALL, "right", "center", false, false, true, false, false)
    end
  end
end
for forvar19, forvar20 in pairs((getBoundKeys("previous_weapon"))) do
  break
end
function cancel_q_key(arg0, arg1)
  if arg0 == var0 then
    if arg1 then
      if not getElementData(localPlayer, "character:id") then
        return
      end
      if isPedDead(localPlayer) then
        return
      end
      var1.list = {}
      for forvar7, forvar8 in ipairs((exports["inventory-system"]:getInventoryItems("character:" .. tostring((getElementData(localPlayer, "character:id")))))) do
        if forvar8.Type == "Weapon" then
          table.insert(var1.list, {
            forvar8,
            (exports["inventory-system"]:getItemImageName(forvar8))
          })
        end
      end
      addEventHandler("onClientRender", root, var1.draw_selection)
      bindKey("mouse_wheel_up", "down", var1.selection_key)
      bindKey("mouse_wheel_down", "down", var1.selection_key)
      bindKey("arrow_u", "down", var1.selection_key)
      bindKey("arrow_d", "down", var1.selection_key)
    else
      removeEventHandler("onClientRender", root, var1.draw_selection)
      unbindKey("mouse_wheel_up", "down", var1.selection_key)
      unbindKey("mouse_wheel_down", "down", var1.selection_key)
      unbindKey("arrow_u", "down", var1.selection_key)
      unbindKey("arrow_d", "down", var1.selection_key)
      var2 = var1.list[var1.index] and var1.list[var1.index][1] or false
      if var2 and var2 and var2.ID == var2.ID then
        return
      end
      if var2 then
        if var2.SpecialProperties.Ammo == 1 and tonumber(var2.Properties.WeapModel) ~= var3 then
          if isAmmoWeapon(getSlotFromWeapon(tonumber(var2.Properties.WeapModel))) then
            toggleControl("fire", false)
          end
        else
          toggleControl("fire", true)
        end
        if var2.Name == "Taser" then
          toggleControl("fire", false)
        end
      else
        toggleControl("fire", true)
      end
      triggerServerEvent("weapons:switchWeapon", localPlayer, var2 and var2.ID or false)
    end
    if not isPedInVehicle(localPlayer) then
      cancelEvent()
    end
  end
end
addEventHandler("onClientKey", root, cancel_q_key)
;({
  list = {},
  index = 0,
  selected = false,
  visible = false
}).selection_key = function(arg0, arg1)
  if arg0 == "mouse_wheel_up" or arg0 == "arrow_u" then
    if var0.index > 0 then
      playSound(":assets/sounds/plastic-bubble-click.wav")
    end
    var0.index = math.max(var0.index - 1, 0)
  elseif arg0 == "mouse_wheel_down" or arg0 == "arrow_d" then
    if var0.index < #var0.list then
      playSound(":assets/sounds/plastic-bubble-click.wav")
    end
    var0.index = math.min(var0.index + 1, #var0.list)
  end
end
;({
  list = {},
  index = 0,
  selected = false,
  visible = false
}).draw = function()
  for forvar5 = var1.index - 1, var1.index + 1 do
    dxDrawImage((var0 - 130 * 3 - 20) / 2 + (100 - 130) / 2, var2 - 150, 130, 130, GRADIENT_BG, 0, 0, 0, tocolor(0, 0, 0, forvar5 == var1.index and 255 or 100), true)
    if not (forvar5 == var1.index) or not tocolor(186, 255, 0, 255) then
    end
    dxDrawRectangle((var0 - 130 * 3 - 20) / 2 + (100 - 130) / 2, var2 - 150 + 130, 130, forvar5 == var1.index and 6 or 4, tocolor(255, 255, 255, 220), true)
    if var1.list[forvar5] then
      dxDrawImage((var0 - 130 * 3 - 20) / 2 + 20, var2 - 150, 60, 60, var1.list[forvar5][2], 0, 0, 0, tocolor(255, 255, 255, forvar5 == var1.index and 255 or 100), true)
      dxDrawText(var1.list[forvar5][1].Name, (var0 - 130 * 3 - 20) / 2 + (100 - 130) / 2, var2 - 150 + 60, (var0 - 130 * 3 - 20) / 2 + (100 - 130) / 2 + 130, var2 - 150 + 60 + 30, tocolor(255, 255, 255, forvar5 == var1.index and 255 or 100), forvar5 == var1.index and 1.1 or 1, "arial", "center", "center", false, false, true, false, false)
      if forvar5 == var1.index then
        dxDrawText(tostring((var1.list[forvar5][1].SpecialProperties.Ammo or 1) - 1), (var0 - 130 * 3 - 20) / 2 + (100 - 130) / 2, var2 - 150 + 60 + 30, (var0 - 130 * 3 - 20) / 2 + (100 - 130) / 2 + 130, var2 - 150 + 60 + 30 + 20, tocolor(255, 255, 255, 255), 1, "arial", "center", "center", false, false, true, false, false)
      end
    else
      dxDrawText(forvar5 == var1.index and "No Weapon" or "-", (var0 - 130 * 3 - 20) / 2 + (100 - 130) / 2, var2 - 150 + 60, (var0 - 130 * 3 - 20) / 2 + (100 - 130) / 2 + 130, var2 - 150 + 60 + 30, tocolor(255, 0, 0, forvar5 == var1.index and 255 or 100), forvar5 == var1.index and 1.1 or 1, "arial", "center", "center", false, false, true, false, false)
    end
  end
end
;({
  list = {},
  index = 0,
  selected = false,
  visible = false
}).select = function(arg0, arg1)
  if isTimer(var0) then
    killTimer(var0)
  end
  if arg0 == "previous_weapon" or arg0 == "mouse_wheel_up" then
    var1.index = math.max((var1.index - 1) % (#var1.list + 1), 0)
  elseif arg0 == "next_weapon" or arg0 == "mouse_wheel_down" then
    var1.index = math.min((var1.index + 1) % (#var1.list + 1), #var1.list)
  end
  var0 = setTimer(function()
    var0.switch(_, "up")
  end, 500, 1)
end
addEventHandler("onClientPlayerWeaponFire", localPlayer, function(arg0)
  if not var0 and isAmmoWeapon((getPedWeaponSlot(localPlayer))) then
    toggleControl("fire", false)
    setPedWeaponSlot(localPlayer, 0)
  end
  if getPedTotalAmmo(localPlayer, (getPedWeaponSlot(localPlayer))) <= 1 then
    if isAmmoWeapon((getPedWeaponSlot(localPlayer))) then
      toggleControl("fire", false)
    end
  elseif var1.index == 0 and getPedWeaponSlot(localPlayer) ~= 0 then
    toggleControl("fire", false)
  end
end)
function isAmmoWeapon(arg0)
  return ({
    [2] = true,
    [3] = true,
    [4] = true,
    [5] = true,
    [6] = true,
    [7] = true
  })[arg0] or false
end
function WeaponSwitch(arg0, arg1)
  if var0 then
    if arg1 ~= getSlotFromWeapon(tonumber(var0.Properties.WeapModel)) then
      cancelEvent()
    end
  elseif arg1 ~= 0 then
    cancelEvent()
  end
end
addEventHandler("onClientPlayerWeaponSwitch", localPlayer, WeaponSwitch)
addEvent("onClientRemoveItem", true)
addEventHandler("onClientRemoveItem", root, function(arg0, arg1, arg2)
  if arg1 and arg2.Type == "Weapon" and var0 and arg2.ID == var0.ID and arg2.Name == var0.Name then
    var0 = false
  end
end)
addCommandHandler("Reload weapon", function()
  setTimer(var0, 50, 1)
end)
bindKey("r", "down", "Reload weapon")
addEventHandler("onClientResourceStart", resourceRoot, function()
  for forvar3, forvar4 in pairs(var0) do
    engineImportTXD(engineLoadTXD("models/" .. forvar3 .. ".txd", forvar4), forvar4)
    engineReplaceModel(engineLoadDFF("models/" .. forvar3 .. ".dff", forvar4), forvar4)
  end
end)
function shotTaser(arg0, arg1)
  if var0 and var0.Name == "Taser" and getTickCount() - var1 >= 3000 then
    var1 = getTickCount()
    if isElement((getPedTarget(localPlayer))) and getPedControlState(localPlayer, "aim_weapon") then
      if getElementType((getPedTarget(localPlayer))) ~= "player" then
        return
      end
      if getDistanceBetweenPoints3D(getElementPosition(localPlayer)) <= 10 then
        for forvar19 = 1, 10 do
          fxAddPunchImpact(getPedTargetEnd(localPlayer))
          fxAddSparks(getPedTargetEnd(localPlayer))
        end
        fxAddPunchImpact(getPedTargetStart(localPlayer))
        triggerServerEvent("weapons:taser_injury", localPlayer, getPedTarget(localPlayer), unpack(var2[math.random(1, #var2)]))
      end
    end
  end
end
bindKey("rctrl", "up", shotTaser)
bindKey("lctrl", "up", shotTaser)
bindKey("mouse1", "up", shotTaser)
addEvent("weapons:playSound", true)
addEventHandler("weapons:playSound", root, function(arg0)
  setSoundVolume(playSound3D("sounds/taser.wav", getElementPosition(source)), 1)
  setSoundVolume(playSound3D("sounds/taser.wav", getPedTargetEnd(arg0)), 1)
  setSoundMaxDistance(playSound3D("sounds/taser.wav", getPedTargetEnd(arg0)), 50)
end)
taser_injury = false
addEvent("weapons:taser_injury", true)
addEventHandler("weapons:taser_injury", localPlayer, function(arg0)
  if not taser_injury then
    addEventHandler("onClientKey", root, keyEvent)
    taser_injury = true
  end
  if isTimer(taser_injury_timer) then
    killTimer(taser_injury_timer)
  end
  taser_injury_timer = setTimer(function()
    removeEventHandler("onClientKey", root, keyEvent)
    taser_injury = false
  end, arg0, 1)
end)
function endTaserInjury()
  if isTimer(taser_injury_timer) then
    killTimer(taser_injury_timer)
  end
  if taser_injury then
    removeEventHandler("onClientKey", root, keyEvent)
    taser_injury = false
  end
end
function keyEvent(arg0, arg1)
  if not var0[arg0] then
    cancelEvent()
  end
end
function quitCharacterEvent(arg0)
  endTaserInjury()
end
addEvent("onClientPlayerQuitFromCharacter", true)
addEventHandler("onClientPlayerQuitFromCharacter", localPlayer, quitCharacterEvent)
