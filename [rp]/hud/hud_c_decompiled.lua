-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

function updateHudItemsList(arg0)
  arg0 = arg0 or var0(localPlayer, "hud:items") or {}
  ;({})[1] = {
    "showhud",
    var1 and "on" or "off",
    "tagmode",
    "Show/Hide Hud",
    ""
  }
  for forvar6 = 1, #arg0 do
    ({})[forvar6 + #{}] = arg0[forvar6]
  end
  var2 = {}
end
function isHudShowing()
  return var0
end
addEvent("onClientCharacterSpawn", true)
addEventHandler("onClientCharacterSpawn", localPlayer, function(arg0)
  removeEventHandler("onClientRender", root, drawPlayersName)
  removeEventHandler("onClientRender", root, drawHUD)
  addEventHandler("onClientRender", root, drawPlayersName, false, "high-2")
  addEventHandler("onClientRender", root, drawHUD)
  var0 = getHudSetting("showhud")
  showStatusHud(true)
end)
addEvent("onClientPlayerQuitFromCharacter", true)
addEventHandler("onClientPlayerQuitFromCharacter", localPlayer, function(arg0)
  removeEventHandler("onClientRender", root, drawPlayersName)
  removeEventHandler("onClientRender", root, drawHUD)
  showStatusHud(false)
end)
addEventHandler("onClientResourceStart", resourceRoot, function()
  fileClose((fileCreate("tempfile.png")))
  for forvar6, forvar7 in ipairs({
    "seatbelt.png",
    "police.png",
    "walkingstyle.png",
    "handcuffs.png",
    "admin_badge.png",
    "head_turning.png",
    "mask.png",
    "tagmode.png",
    "facbadge.png",
    "togpm.png",
    "reportpanel.png",
    "engine.png",
    "handbrake.png",
    "car_lights.png",
    "car_lock.png",
    "blindfold.png",
    "gasmask.png",
    "heart.png",
    "gloves.png",
    "phone.png",
    "diamond.png",
    "medical_mask.png",
    "support_badge.png",
    "support_badge_2.png",
    "developer_badge.png",
    "developer_badge2.png",
    "booster.png",
    "pro.png",
    "AFK.png",
    "admin2.png",
    "verified.png",
    "rope.png",
    "classic.png",
    "youtuber.png",
    "vehicle_engine.png",
    "vehicle_handbrake.png",
    "vehicle_lights.png",
    "vehicle_lock.png",
    "vehicle_seatbelt.png"
  }) do
    if fileExists("icons/" .. var0(forvar7)) then
      fileWrite(fileOpen("tempfile.png"), (exports["files-protection"]:FileUnProtection(":hud/icons/" .. var0(forvar7))))
      fileFlush((fileOpen("tempfile.png")))
      fileClose((fileOpen("tempfile.png")))
      var1["icons/" .. var0(forvar7)] = dxCreateTexture("tempfile.png", "dxt5", true, "clamp")
    end
  end
  for forvar7, forvar8 in ipairs({
    "fatigue.png",
    "health.png",
    "hungry.png",
    "sleep.png",
    "thirsty.png",
    "toilet.png",
    "shower.png",
    "shield.png"
  }) do
    var1[forvar8] = dxCreateTexture("status_icons/" .. var0(forvar8), "dxt3", true, "clamp")
  end
  var1["hud_bg.png"] = dxCreateTexture("hud_bg.png", "argb", true, "clamp")
  var2 = {}
  for forvar8, forvar9 in ipairs(var3(localPlayer, "hud:items") or {}) do
    var2[forvar9[1]] = forvar9[2] == "on"
  end
  if var3(localPlayer, "character:id") then
    addEventHandler("onClientRender", root, drawPlayersName, false, "high-2")
    addEventHandler("onClientRender", root, drawHUD)
    showStatusHud(true)
  end
  fileDelete("tempfile.png")
end)
function getBGTexture()
  return var0["hud_bg.png"]
end
hoveredItem = 0
hoveredVehItem = 0
hoveredHud = false
iconsVisible = false
function dxDrawRoundedRectangle(arg0, arg1, arg2, arg3, arg4, arg5, arg6)
  arg2 = arg2 - arg5 * 2
  arg3 = arg3 - arg5 * 2
  arg0 = var0(arg0 + arg5)
  arg1 = var0(arg1 + arg5)
  if arg2 >= 0 and arg3 >= 0 then
    var1(arg0, arg1, arg2, arg3, arg4, arg6)
    var1(arg0, arg1 - arg5, arg2, arg5, arg4, arg6)
    var1(arg0, arg1 + arg3, arg2, arg5, arg4, arg6)
    var1(arg0 - arg5, arg1, arg5, arg3, arg4, arg6)
    var1(arg0 + arg2, arg1, arg5, arg3, arg4, arg6)
    dxDrawCircle(arg0, arg1, arg5, 180, 270, arg4, arg4, 7, _, arg6)
    dxDrawCircle(arg0 + arg2, arg1, arg5, 270, 360, arg4, arg4, 7, _, arg6)
    dxDrawCircle(arg0 + arg2, arg1 + arg3, arg5, 0, 90, arg4, arg4, 7, _, arg6)
    dxDrawCircle(arg0, arg1 + arg3, arg5, 90, 180, arg4, arg4, 7, _, arg6)
  end
end
function anim(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10)
  return var1(arg2, arg3, arg4, arg6, arg7, arg8, (var0() - arg0) / (arg0 + arg1 - arg0), arg10)
end
bindKey("F4", "both", function(arg0, arg1)
  if var0 then
    var1.hideclock = exports.settings:getSetting("Hud:hideClock")
    var1.right = exports.settings:getSetting("Hud:right") or false
    var0 = false
  end
  if exports.settings:getSetting("Hud:hold") then
    if arg1 == "down" then
      var1.anims.count = var2()
      var1.anims.from = var1.anims.current
      var1.anims.to = 2
      showCursor(true)
      var1.state = true
    else
      var1.anims.count = var2()
      var1.anims.from = var1.anims.current
      var1.anims.to = -var3 / 2 - 2
      showCursor(false, false)
      var1.state = false
    end
  elseif arg1 == "down" then
    if var1.state then
      var1.anims.count = var2()
      var1.anims.from = var1.anims.current
      var1.anims.to = -var3 / 2 - 2
      var1.state = false
    else
      var1.anims.count = var2()
      var1.anims.from = var1.anims.current
      var1.anims.to = 2
      var1.state = true
    end
  end
end)
addEvent("onClientSettingChange", true)
addEventHandler("onClientSettingChange", localPlayer, function(arg0, arg1, arg2)
  if arg0 == "Hud:hideClock" then
    var0.hideclock = arg2
  elseif arg0 == "Hud:right" then
    var0.right = arg2
  end
end)
function getCurrentTime()
  if #var0(getRealTime().minute) == 1 then
  end
  x = getRealTime().hour <= 0 and "AM" or "PM"
  return getRealTime().hour % 12 .. ":" .. ("0" .. getRealTime().minute) .. " " .. x
end
function drawHUD()
  hoveredVehItem = 0
  var0.anims.current = anim(var0.anims.count, var0.anims.time, var0.anims.from, 0, 0, 0, var0.anims.to, 0, 0, 0, "Linear")
  if var0.anims.current - 1 + 2.5 > -var3 / 2 - 2 then
    hoveredItem = 0
    if var0.right then
    else
    end
    if var0.anims.current > -var3 / 2 - 2 then
      dxDrawRoundedRectangle(var0.right and var1 - ((var2 - 5) * #var4 + 15) - 5 or (var1 - ((var2 - 5) * #var4 + 15)) / 2, var0.anims.current, (var2 - 5) * #var4 + 15, var3 / 2 + 5, var5(15, 15, 15, 250), 8, true)
      for forvar7, forvar8 in ipairs(var4) do
        var6(var7((var1 - (var2 - 5) * #var4) / 2), var7(var0.anims.current - 1 + 2.5), 32, 32, var8["icons/" .. forvar8[3] .. ".png"], 0, 0, 0, var9[forvar8[2] or "on"], true)
        if not forvar8[4] or forvar8[4] ~= "" then
        end
        if isMouseInPosition((var1 - (var2 - 5) * #var4) / 2, (var1 - (var2 - 5) * #var4) / 2 + var2 - 10, var0.anims.current - 1 + 2.5, var0.anims.current - 1 + 2.5 + var3 / 2) then
          if hoveredItem ~= forvar7 then
            playSound(":assets/sounds/select.wav")
          end
          hoveredItem = forvar7
        end
      end
      if hoveredItem ~= 0 and var4[hoveredItem][4] and var4[hoveredItem][4] ~= "" then
        var10(var4[hoveredItem][4], 9, var0.anims.current + var3 / 2 + 5 - 1, var1 - 10, var0.anims.current + var3 / 2 + 5 + 40, var5(0, 0, 0, 255), 1, "default-bold", var0.right and "right" or "center", "top", false, false, true, false, false)
        var10(var4[hoveredItem][4], 11, var0.anims.current + var3 / 2 + 5 - 1, var1 - 10, var0.anims.current + var3 / 2 + 5 + 40, var5(0, 0, 0, 255), 1, "default-bold", var0.right and "right" or "center", "top", false, false, true, false, false)
        var10(var4[hoveredItem][4], 9, var0.anims.current + var3 / 2 + 5 + 1, var1 - 10, var0.anims.current + var3 / 2 + 5 + 40, var5(0, 0, 0, 255), 1, "default-bold", var0.right and "right" or "center", "top", false, false, true, false, false)
        var10(var4[hoveredItem][4], 11, var0.anims.current + var3 / 2 + 5 + 1, var1 - 10, var0.anims.current + var3 / 2 + 5 + 40, var5(0, 0, 0, 255), 1, "default-bold", var0.right and "right" or "center", "top", false, false, true, false, false)
        var10(var4[hoveredItem][4], 10, var0.anims.current + var3 / 2 + 5, var1 - 10, var0.anims.current + var3 / 2 + 5 + 40, var5(255, 255, 255, 230), 1, "default-bold", var0.right and "right" or "center", "top", false, false, true, false, false)
      end
    end
  end
  if not var11 then
    return
  end
  if var12(localPlayer) then
    for forvar8 = 1, #(var14[getVehicleType(getElementModel((var12(localPlayer))))] or {}) do
      if (var14[getVehicleType(getElementModel((var12(localPlayer))))] or {})[forvar8] == "vehicle_engine" and getVehicleEngineState((var12(localPlayer))) then
      elseif (var14[getVehicleType(getElementModel((var12(localPlayer))))] or {})[forvar8] == "vehicle_handbrake" and var15(var12(localPlayer), "vehicle:handbrake") then
      elseif (var14[getVehicleType(getElementModel((var12(localPlayer))))] or {})[forvar8] == "vehicle_seatbelt" and getHudSetting("seatbelt") then
      elseif (var14[getVehicleType(getElementModel((var12(localPlayer))))] or {})[forvar8] == "vehicle_lights" and getVehicleOverrideLights((var12(localPlayer))) ~= 1 then
      else
      end
      var6(var13, var16, var17, var17, var8["icons/" .. (var14[getVehicleType(getElementModel((var12(localPlayer))))] or {})[forvar8] .. ".png"], 0, 0, 0, var18[isVehicleLocked((var12(localPlayer))) and "on"])
      if isMouseInPosition(var13, var13 + var17, var16, var16 + var17) then
        hoveredVehItem = forvar8
      end
    end
  end
end
addEventHandler("onClientResourceStart", resourceRoot, function()
  updateHudItemsList()
  var0 = {}
  if newValue then
    for forvar3, forvar4 in ipairs(var1) do
      var0[forvar4[1]] = forvar4[2] == "on"
    end
  end
end)
function isMouseInPosition(arg0, arg1, arg2, arg3)
  if isCursorShowing() and arg0 <= getCursorPosition() * var0 and arg1 >= getCursorPosition() * var0 and arg2 <= getCursorPosition() * var1 and arg3 >= getCursorPosition() * var1 then
    return true
  end
  return false
end
function getNextWalkingStyle()
  for forvar3, forvar4 in ipairs(var0) do
    if getPedWalkingStyle(localPlayer) == forvar4 then
      return var0[forvar3 + 1] or var0[1]
    end
  end
end
function addHudItem(arg0, arg1, arg2, arg3, arg4, arg5)
  table.insert(var0(localPlayer, "hud:items") or {}, {
    arg0,
    arg1,
    arg4 or arg0,
    arg2,
    arg3,
    arg5
  })
  var1(localPlayer, "hud:items", var0(localPlayer, "hud:items") or {})
end
function removeHudItem(arg0)
  for forvar5, forvar6 in ipairs(var0(localPlayer, "hud:items") or {}) do
    if forvar6[1] == arg0 then
      table.remove(var0(localPlayer, "hud:items") or {}, forvar5)
      triggerEvent("hud:onClientPlayerHudItemRemove", localPlayer, arg0)
      break
    end
  end
  var1(localPlayer, "hud:items", var0(localPlayer, "hud:items") or {})
end
function getHudItemsByCategory(arg0)
  for forvar6, forvar7 in ipairs(var0(localPlayer, "hud:items") or {}) do
    if forvar7[6] == arg0 then
      table.insert({}, forvar7)
    end
  end
  return {}
end
function isHudItemExists(arg0)
  for forvar5, forvar6 in ipairs(var0(localPlayer, "hud:items") or {}) do
    if forvar6[1] == arg0 then
      return true
    end
  end
  return false
end
function isHudItemOfCategoryExists(arg0)
  for forvar5, forvar6 in ipairs(var0(localPlayer, "hud:items") or {}) do
    if forvar6[6] == arg0 then
      return true
    end
  end
  return false
end
addEventHandler("onClientElementDataChange", localPlayer, function(arg0, arg1, arg2)
  if arg0 == "hud:items" then
    updateHudItemsList(arg2)
    var0 = {}
    if arg2 then
      for forvar6, forvar7 in ipairs(var1) do
        var0[forvar7[1]] = forvar7[2] == "on"
      end
    end
  end
end)
function getHudSetting(arg0)
  return var0[arg0] or false
end
function isPlayerHudItemExists(arg0, arg1)
  for forvar6, forvar7 in ipairs(var0(arg0, "hud:items") or {}) do
    if forvar7[1] == arg1 then
      return true
    end
  end
  return false
end
function isPlayerHudItemOfCategoryExists(arg0, arg1)
  for forvar6, forvar7 in ipairs(var0(arg0, "hud:items") or {}) do
    if forvar7[6] == arg1 then
      return true
    end
  end
  return false
end
function getPlayerHudItemsByCategory(arg0, arg1)
  for forvar7, forvar8 in ipairs(var0(arg0, "hud:items") or {}) do
    if forvar8[6] == arg1 then
      table.insert({}, forvar8)
    end
  end
  return {}
end
function getPlayerHudSetting(arg0, arg1)
  for forvar6, forvar7 in ipairs(var0(arg0, "hud:items") or {}) do
    if forvar7[1] == arg1 then
      return forvar7[2] == "on" and true or false
    end
  end
  return false
end
function setHudSetting(arg0, arg1)
  for forvar5, forvar6 in ipairs(var0) do
    if forvar6[1] == arg0 then
      var0[forvar5][2] = arg1 and "on" or "off"
      break
    end
  end
end
function getHudItemData(arg0, arg1)
  for forvar6, forvar7 in ipairs(var0(localPlayer, "hud:items") or {}) do
    if forvar7[1] == arg0 then
      return (var0(localPlayer, "hud:items") or {})[forvar6][5]
    end
  end
  return false
end
function getPlayerHudItemData(arg0, arg1, arg2)
  for forvar7, forvar8 in ipairs(var0(arg0, "hud:items") or {}) do
    if forvar8[1] == arg1 then
      return (var0(arg0, "hud:items") or {})[forvar7][5]
    end
  end
  return false
end
addEvent("onClientHudVisibilityChange", false)
function dxGUIClick(arg0, arg1, arg2, arg3)
  if not isCursorShowing() then
    return
  end
  if arg1 ~= "down" then
    return
  end
  if hoveredHud then
    iconsVisible = not iconsVisible
  end
  if hoveredItem ~= 0 then
    if var0() - var1 < 1000 then
      return
    end
    var1 = var0()
    if var2[hoveredItem][1] == "showhud" then
      setHudSetting("showhud", not var3)
      var3 = not var3
      triggerEvent("onClientHudVisibilityChange", localPlayer, not var3)
    elseif var2[hoveredItem][6] ~= "disable-click" then
      triggerServerEvent("hud:onHudItemClick", localPlayer, var2[hoveredItem][1])
    end
    triggerEvent("hud:onClientHudItemClick", localPlayer, var2[hoveredItem][1], getHudSetting(var2[hoveredItem][1]))
  end
  if hoveredVehItem ~= 0 then
    if not isElement((var4(localPlayer))) then
      return
    end
    if getVehicleController((var4(localPlayer))) ~= localPlayer then
      return
    end
    if string.gsub(var5[getVehicleType((var4(localPlayer)))][hoveredVehItem], "vehicle_", "") == "engine" then
      triggerServerEvent("hud:engine", localPlayer)
    elseif string.gsub(var5[getVehicleType((var4(localPlayer)))][hoveredVehItem], "vehicle_", "") == "handbrake" then
      triggerServerEvent("hud:handbrake", localPlayer)
    elseif string.gsub(var5[getVehicleType((var4(localPlayer)))][hoveredVehItem], "vehicle_", "") == "seatbelt" then
      triggerServerEvent("hud:onHudItemClick", localPlayer, (string.gsub(var5[getVehicleType((var4(localPlayer)))][hoveredVehItem], "vehicle_", "")))
      triggerEvent("hud:onClientHudItemClick", localPlayer, string.gsub(var5[getVehicleType((var4(localPlayer)))][hoveredVehItem], "vehicle_", ""), getHudSetting((string.gsub(var5[getVehicleType((var4(localPlayer)))][hoveredVehItem], "vehicle_", ""))))
    elseif string.gsub(var5[getVehicleType((var4(localPlayer)))][hoveredVehItem], "vehicle_", "") == "car_lock" then
      triggerServerEvent("hud:lockvehicle", localPlayer)
    elseif string.gsub(var5[getVehicleType((var4(localPlayer)))][hoveredVehItem], "vehicle_", "") == "car_lights" then
      triggerServerEvent("hud:vehiclelights", localPlayer)
    end
  end
end
addEventHandler("onClientClick", getRootElement(), dxGUIClick)
addEventHandler("onClientResourceStart", resourceRoot, function()
  setHudSetting("showhud", true)
  for forvar3, forvar4 in ipairs(var0) do
    setPlayerHudComponentVisible(forvar4, false)
  end
end)
addEvent("onClientPlayerQuitFromCharacter", true)
addEventHandler("onClientPlayerQuitFromCharacter", localPlayer, function()
  for forvar3, forvar4 in ipairs(var0) do
    setPlayerHudComponentVisible(forvar4, false)
  end
end)
function UIKitReady()
  eui = exports.UIKit
  dxFontDefault = eui:getUIFont("ui-default")
  var0 = eui:getUIFont("default-large")
  var1 = eui:getUIFont("hud-large")
  var2 = 0.35
  dxFontHud = eui:getUIFont("hud")
  dxFontHudSize = 0.7
end
addEventHandler("onClientUIReady", resourceRoot, UIKitReady)
addEventHandler("onClientUIKitReady", root, UIKitReady)
function updatePlayersHud()
  var0 = {}
  for forvar4, forvar5 in ipairs((getElementsByType("player", root, true))) do
    for forvar14, forvar15 in ipairs(var2(forvar5, "hud:items") or {}) do
      if forvar15[2] == "on" and (var3[forvar15[1]] or var3[forvar15[6]]) then
        if forvar15[1] == "admintag" then
          if var2(forvar5, "admin:hideadmin") then
          else
            table.insert({}, forvar15)
          end
        else
          table.insert({}, forvar15)
        end
      end
    end
    if var2(forvar5, "temp:AFK") then
      table.insert({}, {
        "AFK",
        "on",
        "AFK",
        "",
        {}
      })
    end
    for forvar16, forvar17 in ipairs({}) do
      if forvar17[1] == "mask" then
      elseif forvar17[6] == "factionbadge" then
        if -100 > -1 then
        end
      elseif forvar17[6] == "special_membership" and -1 > forvar17[5].priority then
      end
    end
    var0[forvar5] = {
      name = "Unknown Person",
      icons = {},
      badge = {
        var1(forvar17[5][1]),
        forvar17[5][2] or {
          255,
          255,
          255
        }
      },
      totalWidth = #{} * (var5 - var6 - 5),
      color = var4((forvar17[5].color or {
        255,
        255,
        255
      })[1], (forvar17[5].color or {
        255,
        255,
        255
      })[2], (forvar17[5].color or {
        255,
        255,
        255
      })[3]),
      friend = forvar5 == localPlayer or exports["friend-system"]:isFriend(forvar5)
    }
  end
end
addEventHandler("onClientFriendsUpdate", localPlayer, function()
  updatePlayersHud()
end)
addEventHandler("onClientElementStreamIn", root, function()
  if getElementType(source) == "player" then
    updatePlayersHud()
  end
end)
addEventHandler("onClientElementDataChange", root, function(arg0, arg1, arg2)
  if arg0 == "hud:items" or arg0 == "UnknownPerson" or arg0 == "character:name" or arg0 == "temp:AFK" or arg0 == "admin:hideadmin" then
    if isElementStreamedIn(source) then
      updatePlayersHud()
    end
    if source == localPlayer and arg0 == "temp:AFK" and arg2 == true and arg1 ~= arg2 then
      addEventHandler("onClientKey", root, checkAFK)
    end
  end
end)
function checkAFK()
  var0(localPlayer, "temp:AFK", nil)
  removeEventHandler("onClientKey", root, checkAFK)
end
if getElementData(localPlayer, "temp:AFK") then
  addEventHandler("onClientKey", root, checkAFK)
end
addEvent("typing:sync", true)
addEventHandler("typing:sync", root, function(arg0, arg1)
  var0[arg0] = arg1 or nil
end)
addEventHandler("onClientElementStreamOut", root, function()
  if var0[source] then
    var0[source] = nil
  end
end)
addEventHandler("onClientPlayerQuit", root, function()
  if var0[source] then
    var0[source] = nil
  end
end)
function drawPlayersName()
  if var0() then
    return
  end
  if var1() then
    if var2 == false then
      triggerLatentServerEvent("typing:sync", 20000, localPlayer, true)
      var2 = true
    end
  elseif var2 == true then
    triggerLatentServerEvent("typing:sync", 20000, localPlayer, false)
    var2 = false
  end
  if not var3 then
    return
  end
  for forvar10 = 1, #var6(getCameraMatrix()) do
    if var7[var6(getCameraMatrix())[forvar10]] and var9(getCameraMatrix()) and var10(var8(var6(getCameraMatrix())[forvar10], 8)) and var10(var8(var6(getCameraMatrix())[forvar10], 8)) then
      if var7[var6(getCameraMatrix())[forvar10]].friend then
        if var15 or var13(localPlayer, "describtion:show") then
          if not var13(var6(getCameraMatrix())[forvar10], "disappear") or getHudSetting("admintag") then
          end
        else
        end
      else
      end
      if getHudSetting("admintag") then
        if var13(var6(getCameraMatrix())[forvar10], "disappear") then
          if var15 or var13(localPlayer, "describtion:show") then
          else
          end
        end
      elseif var13(var6(getCameraMatrix())[forvar10], "disappear") then
      end
      if not var13(var6(getCameraMatrix())[forvar10], "disappear") then
        if var7[var6(getCameraMatrix())[forvar10]].badge then
          var16(var7[var6(getCameraMatrix())[forvar10]].badge[1], var10(var8(var6(getCameraMatrix())[forvar10], 8)) + 2, var10(var8(var6(getCameraMatrix())[forvar10], 8)) + 2 - 20, var10(var8(var6(getCameraMatrix())[forvar10], 8)))
          var16(var7[var6(getCameraMatrix())[forvar10]].badge[1], var10(var8(var6(getCameraMatrix())[forvar10], 8)))
        end
        for forvar35, forvar36 in ipairs(var7[var6(getCameraMatrix())[forvar10]].icons) do
          if forvar36[1] ~= "admintag" or not var13(var6(getCameraMatrix())[forvar10], "admin:hideadmin") then
            if forvar36[1] == "heart" then
              if not (var21(var22(getElementHealth(var6(getCameraMatrix())[forvar10]) / (0.232018558500192 * getPedStat(var6(getCameraMatrix())[forvar10], 24) - 32.018558511152), 1), 0) > 0.15) or not 230 then
              end
              if var6(getCameraMatrix())[forvar10] == localPlayer and getElementHealth(var6(getCameraMatrix())[forvar10]) > 40 and var26() - var27 >= 10000 then
                triggerServerEvent("hud:remove_heart", localPlayer)
                var27 = var26()
              end
            end
            if forvar36[3] == "admin_badge" then
            elseif "admin2" == "developer_badge" then
            else
            end
            var28(var18(var10(var8(var6(getCameraMatrix())[forvar10], 8)) - var7[var6(getCameraMatrix())[forvar10]].totalWidth / 2) + var18(var19 - var20 - 5) * (forvar35 - 1), var18(var10(var8(var6(getCameraMatrix())[forvar10], 8)) + 5), var18(var19 / 2), var18(var19 / 2), var29["icons/" .. var30("support_badge_2") .. ".png"], 0, 0, 0, var7[var6(getCameraMatrix())[forvar10]].color or var12(var11(var6(getCameraMatrix())[forvar10])))
          end
        end
        if var31[var6(getCameraMatrix())[forvar10]] then
          if not WaitTyping or not (var26() - WaitTyping < 4000) then
            WaitTyping = var26()
          end
          var16("((TYPING" .. var32(".", var18((var26() - WaitTyping) / 1000)) .. "))", var10(var8(var6(getCameraMatrix())[forvar10], 8)) + 2, var10(var8(var6(getCameraMatrix())[forvar10], 8)) - 40 + 2, var10(var8(var6(getCameraMatrix())[forvar10], 8)))
          var16("((TYPING" .. var32(".", var18((var26() - WaitTyping) / 1000)) .. "))", var10(var8(var6(getCameraMatrix())[forvar10], 8)))
        end
      end
      var16("", var10(var8(var6(getCameraMatrix())[forvar10], 8)) + 2, var10(var8(var6(getCameraMatrix())[forvar10], 8)) + 2, var10(var8(var6(getCameraMatrix())[forvar10], 8)))
      var16("", var10(var8(var6(getCameraMatrix())[forvar10], 8)))
    end
  end
end
bindKey("lalt", "both", function(arg0, arg1)
  if not var0 then
    var1(localPlayer, "describtion:show", arg1 == "down", false)
  end
end)
bindKey("ralt", "down", function(arg0, arg1)
  var0 = not var1(localPlayer, "describtion:show")
  var2(localPlayer, "describtion:show", var0, false)
end)
addEventHandler("onClientPlayerSpawn", localPlayer, function()
  var0 = false
  var1(localPlayer, "describtion:show", false, false)
end)
statusHud = {visible = false}
function createSVGProgress(arg0, arg1, arg2)
end
addEventHandler("onClientResourceStart", resourceRoot, function()
  nextSVG()
  if getResourceFromName("life-system") and getResourceState((getResourceFromName("life-system"))) == "running" then
    setProgress("thirsty", exports["life-system"]:getCharacterStatus("thirsty"))
    setProgress("hungry", exports["life-system"]:getCharacterStatus("hungry"))
    setProgress("urine", exports["life-system"]:getCharacterStatus("urine"))
    setProgress("sleepy", exports["life-system"]:getCharacterStatus("sleepy"))
    setProgress("cleanness", exports["life-system"]:getCharacterStatus("cleanness"))
  end
end)
function nextSVG()
  var0 = var0 + 1
  if var0 == 1 then
    createSVGProgress("health", var1, "#00ff85")
  elseif var0 == 2 then
    createSVGProgress("sleepy", var1, "#7dffea")
  elseif var0 == 3 then
    createSVGProgress("thirsty", var1, "#4de4ff")
  elseif var0 == 4 then
    createSVGProgress("hungry", var1, "#caff00")
  elseif var0 == 5 then
    createSVGProgress("urine", var1, "#f3ffb5")
  elseif var0 == 6 then
    createSVGProgress("fatigue", var1, "#71ffdd")
  elseif var0 == 7 then
    createSVGProgress("cleanness", var1, "#ffffff")
  elseif var0 == 8 then
    createSVGProgress("shield", var1, "#ffffff")
  end
end
function setProgress(arg0, arg1)
  if var0[arg0] and var0[arg0].progress and var0[arg0].svg and var0[arg0].svgXML then
    arg1 = var1(0, var2(arg1, 100))
    var0[arg0].value = arg1
    xmlNodeSetAttribute(var0[arg0].progress, "stroke-dashoffset", 315 - arg1 / 100 * 315)
    svgSetDocumentXML(var0[arg0].svg, var0[arg0].svgXML)
  else
    var3[arg0] = arg1
  end
end
function showStatusHud(arg0)
  if arg0 == statusHud.visible then
    return
  end
  if arg0 then
    addEventHandler("onClientRender", root, statusHud.draw, false, "high-5")
    setProgress("health", var0(var1(getElementHealth(localPlayer) / (0.232018558500192 * getPedStat(localPlayer, 24) - 32.018558511152), 1), 0) * 100)
    setProgress("shield", var2(localPlayer, "temp:armor") or 0)
  else
    removeEventHandler("onClientRender", root, statusHud.draw)
  end
  statusHud.visible = arg0
end
addEvent("onClientCharacterStatusChange", true)
addEventHandler("onClientCharacterStatusChange", localPlayer, function(arg0)
  setProgress("thirsty", arg0.thirsty or 0)
  setProgress("hungry", arg0.hungry or 0)
  setProgress("urine", arg0.urine or 0)
  setProgress("sleepy", arg0.sleepy or 0)
  setProgress("cleanness", arg0.cleanness or 0)
end)
setTimer(function()
  if not statusHud.visible then
    return
  end
  var0 = "#bfbfbf" .. getZoneName(getElementPosition(localPlayer)) .. " #ffffff| " .. getZoneName(getElementPosition(localPlayer))
  if var1(localPlayer) == 0 then
    if var2[getZoneName(getElementPosition(localPlayer))] or var2[getZoneName(getElementPosition(localPlayer))] or var2[getZoneName(getElementPosition(localPlayer)) .. "." .. getZoneName(getElementPosition(localPlayer))] then
      var3 = "SAFE ZONE"
      var4 = var5(153, 255, 0)
    else
      if var3 ~= "DANGER ZONE" then
        exports.notifications:output({
          en = "#ff3030You are now in an unsafe area, you must be careful",
          ar = "#ff3030\216\163\217\134\216\170 \216\167\217\132\216\162\217\134 \217\129\217\138 \217\133\217\134\216\183\217\130\216\169 \216\186\217\138\216\177 \216\162\217\133\217\134\216\169\216\140 \217\138\216\172\216\168 \216\185\217\132\217\138\217\131 \216\167\217\132\216\173\216\176\216\177"
        }, 6000, "danger")
      end
      var3 = "DANGER ZONE"
      var4 = var5(255, 0, 0)
    end
  else
    var3 = "NORMAL ZONE"
    var4 = var5(255, 255, 255)
  end
  if getRealTime().hour >= 12 then
  end
  var6 = "WnashTime   " .. var7("%04d-%02d-%02d   %02d:%02d:%02d", getRealTime().year + 1900, getRealTime().month + 1, getRealTime().monthday, 12, getRealTime().minute, getRealTime().second)
  var8 = var7("%02d:%02d", 12, getRealTime().minute) .. " " .. "PM"
  var9 = var7("%02d-%02d-%04d", getRealTime().monthday, getRealTime().month + 1, getRealTime().year + 1900)
  if var10(var11) ~= var10((getElementHealth(localPlayer))) then
    var11 = getElementHealth(localPlayer)
    setProgress("health", var12(var13(getElementHealth(localPlayer) / (0.232018558500192 * getPedStat(localPlayer, 24) - 32.018558511152), 1), 0) * 100)
  end
  if var10(var15) ~= var10(var14(localPlayer, "temp:armor") or 0) then
    var15 = var14(localPlayer, "temp:armor") or 0
    setProgress("shield", var14(localPlayer, "temp:armor") or 0)
  end
  if exports["life-system"]:getCharacterDamages() then
    if exports["life-system"]:getCharacterDamages()[7] and exports["life-system"]:getCharacterDamages()[7].broke then
    end
    if exports["life-system"]:getCharacterDamages()[8] and exports["life-system"]:getCharacterDamages()[8].broke then
    end
    if exports["life-system"]:getCharacterDamages()[7] and exports["life-system"]:getCharacterDamages()[7].bullet then
    end
    if exports["life-system"]:getCharacterDamages()[8] and exports["life-system"]:getCharacterDamages()[8].bullet then
    end
  end
  if var17 then
    var16 = var13(var12(var16 - 10, 0), 100)
  elseif isElementInWater(localPlayer) then
    if not isPedInVehicle(localPlayer) then
      if getPedControlState(localPlayer, "sprint") then
        var16 = var13(var12(var16 + (3 + ((var14(localPlayer, "temp:drugEffect") or 1) + 4 + 4 + 1 + 1)) * ((1 - getPedStat(localPlayer, 22) / 1000) * 0.8), 0), 100)
      elseif getPedControlState(localPlayer, "forwards") then
        var16 = var13(var12(var16 + (2 + ((var14(localPlayer, "temp:drugEffect") or 1) + 4 + 4 + 1 + 1)) * ((1 - getPedStat(localPlayer, 22) / 1000) * 0.8), 0), 100)
      else
        var16 = var13(var12(var16 + (1 + ((var14(localPlayer, "temp:drugEffect") or 1) + 4 + 4 + 1 + 1)) * ((1 - getPedStat(localPlayer, 22) / 1000) * 0.8), 0), 100)
      end
    end
  elseif not getPedMoveState(localPlayer) or getPedMoveState(localPlayer) == "stand" then
    var16 = var13(var12(var16 - 4, 0), 100)
  elseif getPedMoveState(localPlayer) == "walk" then
    var16 = var13(var12(var16 - 2, 0), 100)
  elseif getPedMoveState(localPlayer) == "powerwalk" then
    var16 = var13(var12(var16 + (3 + ((var14(localPlayer, "temp:drugEffect") or 1) + 4 + 4 + 1 + 1)) * ((1 - getPedStat(localPlayer, 22) / 1000) * 0.8), 0), 100)
  elseif getPedMoveState(localPlayer) == "jog" then
    var16 = var13(var12(var16 + (2 + ((var14(localPlayer, "temp:drugEffect") or 1) + 4 + 4 + 1 + 1)) * ((1 - getPedStat(localPlayer, 22) / 1000) * 0.8), 0), 100)
  elseif getPedMoveState(localPlayer) == "sprint" then
    if getPedWalkingStyle(localPlayer) == 54 then
      var16 = var13(var12(var16 + (3 + ((var14(localPlayer, "temp:drugEffect") or 1) + 4 + 4 + 1 + 1)) * ((1 - getPedStat(localPlayer, 22) / 1000) * 0.8), 0), 100)
    else
      var16 = var13(var12(var16 + (2 + ((var14(localPlayer, "temp:drugEffect") or 1) + 4 + 4 + 1 + 1)) * ((1 - getPedStat(localPlayer, 22) / 1000) * 0.8), 0), 100)
    end
  elseif getPedMoveState(localPlayer) == "jump" then
    var16 = var13(var12(var16 + (4 + ((var14(localPlayer, "temp:drugEffect") or 1) + 4 + 4 + 1 + 1)) * ((1 - getPedStat(localPlayer, 22) / 1000) * 0.8), 0), 100)
  elseif getPedMoveState(localPlayer) == "climb" then
    var16 = var13(var12(var16 + (5 + ((var14(localPlayer, "temp:drugEffect") or 1) + 4 + 4 + 1 + 1)) * ((1 - getPedStat(localPlayer, 22) / 1000) * 0.8), 0), 100)
  end
  if var16 ~= var16 then
    setProgress("fatigue", var16)
  end
  if var16 >= 95 and not var17 then
    var18(localPlayer, "temp:block.anims", true)
    if isElementInWater(localPlayer) then
      fadeCamera(false, 0.5, 255, 0, 0)
      setTimer(fadeCamera, 200, 1, true, 0.3, 255, 0, 0)
      setElementHealth(localPlayer, getElementHealth(localPlayer) - 1)
    else
      var17 = true
      setPedControlState(localPlayer, "forwards", false)
      setPedControlState(localPlayer, "jump", false)
      setPedControlState(localPlayer, "sprint", false)
      setPedControlState(localPlayer, "walk", false)
      triggerServerEvent("life:setAnimation", localPlayer, "FAT", "idle_tired", -1, true, false, false, false)
    end
  elseif var16 <= 50 and var17 then
    var17 = false
    triggerServerEvent("life:setAnimation", localPlayer)
    var18(localPlayer, "temp:block.anims", nil)
  end
end, 1000, 0)
function statusHud.draw()
  if not var0 then
    return
  end
  var1 = var2.health
  p_shield = var2.shield
  var3 = var2.sleepy
  var4 = var2.thirsty
  var5 = var2.hungry
  var6 = var2.urine
  var7 = var2.fatigue
  var8 = var2.cleanness
  if var1 and var3 and var4 and var5 and var6 and var7 and var8 then
    var9.anims.current = anim(var9.anims.count, var9.anims.time, var9.anims.from, 0, 0, 0, var9.anims.to, 0, 0, 0, "Linear")
    var15(var10 - var16, var12 + (var9.anims.current + 25) - 20 * var13, var16, var17, var18["hud_bg.png"], 0, 0, 0, var19, var20)
    var15(var10 - var16, var12 + (var9.anims.current + 25) - 20 * var13, var16, 1, var18["hud_bg.png"], 0, 0, 0, var21(255, 255, 255, 150), var20)
    var15(var10 - var16 / 1.5, var12 + (var9.anims.current + 25) - 20 * var13 + var17, var16, 1, var18["hud_bg.png"], 0, 0, 0, var21(255, 255, 255, 150), var20)
    var15(var23, var12 + (var9.anims.current + 25) - 20 * var13 + var22 - 6 * var13, var24, 1 * var13, var18["hud_bg.png"], 0, 0, 0, var21(255, 255, 255, 255), var20)
    var25(var10 - 9 * var13, var12 + (var9.anims.current + 25) - 20 * var13 + var22 - 8 * var13, 5 * var13, 5 * var13, var26, var20)
    var15(var23, var12 + (var9.anims.current + 25) - 20 * var13 + var22, var24, var27, var18["hud_bg.png"], 0, 0, 0, var21(0, 8, 20, 180), var20)
    var28(var29, var30, var12 + (var9.anims.current + 25) - 20 * var13 + var22 + 3 * var13, var31, var32, var26, 0.38, var33, "right", "top", false, false, var20)
    var28(var34, var30, var12 + (var9.anims.current + 25) - 20 * var13 + var22 + 3 * var13 + 25 * var13, var31, var32, var21(255, 255, 255, 200), 0.3, var33, "right", "top", false, false, var20)
    var25(var35, var36, var37, var37, var26, var20)
    var25(var38, var36, 1, var39 + 5 * var13, var26, var20)
    var15(var40, var41, var42, var39, var18["hud_bg.png"], 180, 0, 0, var21(0, 8, 20, 180), var20)
    var28(var43, var44, var45, var42, var46, var26, 1, dxFontDefault, "left", "top", false, false, var20, true, false)
    var25(var44, var47, var48, var49, var50, var20)
    var28(var51, var52, var45, var42, var46, var50, 0.8, dxFontHud, "left", "bottom", false, false, var20, true, false)
    var53 = var54(var55(var56() / 300)) * 230
    var15(var10 - (var57 + var58) * 7 - var58 * 2, var12 + (var9.anims.current + 25) - 11.5 * var13 + (var57 + var58) * 0, var57, var57, var1.svg, 0, 0, 0, var26, var20)
    var15(var10 - (var57 + var58) * 7 - var58 * 2, var12 + (var9.anims.current + 25) - 11.5 * var13 + (var57 + var58) * 0, var57, var57, var18["health.png"], 0, 0, 0, var21(0, 255, 132, var1.value > 10 and 220 or var53), var20)
    var15(var10 - (var57 + var58) * 7 - var58 * 2 + (var57 + var58) * (0 + 1), var12 + (var9.anims.current + 25) - 11.5 * var13 + (var57 + var58) * 0, var57, var57, var3.svg, 0, 0, 0, var26, var20)
    var15(var10 - (var57 + var58) * 7 - var58 * 2 + (var57 + var58) * (0 + 1), var12 + (var9.anims.current + 25) - 11.5 * var13 + (var57 + var58) * 0, var57, var57, var18["sleep.png"], 0, 0, 0, var21(255, 255, 255, var3.value < 90 and 220 or var53), var20)
    var15(var10 - (var57 + var58) * 7 - var58 * 2 + (var57 + var58) * (0 + 1 + 1), var12 + (var9.anims.current + 25) - 11.5 * var13 + (var57 + var58) * 0, var57, var57, var4.svg, 0, 0, 0, var26, var20)
    var15(var10 - (var57 + var58) * 7 - var58 * 2 + (var57 + var58) * (0 + 1 + 1), var12 + (var9.anims.current + 25) - 11.5 * var13 + (var57 + var58) * 0, var57, var57, var18["thirsty.png"], 0, 0, 0, var21(77, 228, 255, 5 < var4.value and 220 or var53), var20)
    var15(var10 - (var57 + var58) * 7 - var58 * 2 + (var57 + var58) * (0 + 1 + 1 + 1), var12 + (var9.anims.current + 25) - 11.5 * var13 + (var57 + var58) * 0, var57, var57, var5.svg, 0, 0, 0, var26, var20)
    var15(var10 - (var57 + var58) * 7 - var58 * 2 + (var57 + var58) * (0 + 1 + 1 + 1), var12 + (var9.anims.current + 25) - 11.5 * var13 + (var57 + var58) * 0, var57, var57, var18["hungry.png"], 0, 0, 0, var21(202, 255, 0, 5 < var5.value and 220 or var53), var20)
    var15(var10 - (var57 + var58) * 7 - var58 * 2 + (var57 + var58) * (0 + 1 + 1 + 1 + 1), var12 + (var9.anims.current + 25) - 11.5 * var13 + (var57 + var58) * 0, var57, var57, var6.svg, 0, 0, 0, var26, var20)
    var15(var10 - (var57 + var58) * 7 - var58 * 2 + (var57 + var58) * (0 + 1 + 1 + 1 + 1), var12 + (var9.anims.current + 25) - 11.5 * var13 + (var57 + var58) * 0, var57, var57, var18["toilet.png"], 0, 0, 0, var21(255, 255, 255, var6.value < 90 and 220 or var53), var20)
    var15(var10 - (var57 + var58) * 7 - var58 * 2 + (var57 + var58) * (0 + 1 + 1 + 1 + 1 + 1), var12 + (var9.anims.current + 25) - 11.5 * var13 + (var57 + var58) * 0, var57, var57, var7.svg, 0, 0, 0, var26, var20)
    var15(var10 - (var57 + var58) * 7 - var58 * 2 + (var57 + var58) * (0 + 1 + 1 + 1 + 1 + 1), var12 + (var9.anims.current + 25) - 11.5 * var13 + (var57 + var58) * 0, var57, var57, var18["fatigue.png"], 0, 0, 0, var21(113, 255, 221, var7.value < 90 and 220 or var53), var20)
    var15(var10 - (var57 + var58) * 7 - var58 * 2 + (var57 + var58) * (0 + 1 + 1 + 1 + 1 + 1 + 1), var12 + (var9.anims.current + 25) - 11.5 * var13 + (var57 + var58) * 0, var57, var57, var8.svg, 0, 0, 0, var26, var20)
    var15(var10 - (var57 + var58) * 7 - var58 * 2 + (var57 + var58) * (0 + 1 + 1 + 1 + 1 + 1 + 1), var12 + (var9.anims.current + 25) - 11.5 * var13 + (var57 + var58) * 0, var57, var57, var18["shower.png"], 0, 0, 0, var21(255, 255, 255, 5 < var8.value and 220 or var53), var20)
    if p_shield and 0 < p_shield.value then
      var15(var10 - (var57 + var58) * 7 - var58 * 2 + (var57 + var58) * (0 + 1 + 1 + 1 + 1 + 1 + 1), var12 + (var9.anims.current + 25) - 11.5 * var13 + (var57 + var58) * 0 + 150 * var13, var57, var57, p_shield.svg, 0, 0, 0, var26, var20)
      var15(var10 - (var57 + var58) * 7 - var58 * 2 + (var57 + var58) * (0 + 1 + 1 + 1 + 1 + 1 + 1), var12 + (var9.anims.current + 25) - 11.5 * var13 + (var57 + var58) * 0 + 150 * var13, var57, var57, var18["shield.png"], 0, 0, 0, var21(255, 255, 255, 5 < p_shield.value and 220 or var53), var20)
    end
  end
  var28(fpscheck() .. " FPS", 5, var59 - 15, 100, var59, var21(255, 255, 255, 100), 1, "default-bold")
end
addCommandHandler("fps", function()
  outputChatBox(fpscheck() .. " FPS", 255, 55, 95)
end)
function fpscheck()
  var1 = var1 + 1
  if var0() - 1000 > var2 then
    var2 = var0()
    fps = var1 / ((var0() - var2) / 1000)
    var1 = fps * ((var0() - var2 - 1000) / 1000)
    var3 = var4(var5(fps))
  end
  return var3
end
