-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

function UIKitReady()
  var0.font = exports.UIKit:getUIFont("ui-default")
  var0.font_large = exports.UIKit:getUIFont("default-large")
  var1 = exports.UIKit:uiGetThemeColor("primary")
end
addEventHandler("onClientUIReady", resourceRoot, UIKitReady)
addEventHandler("onClientUIKitReady", root, UIKitReady)
function showRadar(arg0, arg1)
  if arg0 then
    if not var0.visible then
      var1 = dxCreateRenderTarget(var0.w, var0.h)
      addEventHandler("onClientRender", root, var0.draw)
      if not var1 then
        setPlayerHudComponentVisible("radar", true)
      end
    end
  else
    forcePlayerMap(false)
    var0.mapVisible = false
    if var0.visible then
      removeEventHandler("onClientRender", root, var0.draw)
      if var1 then
        destroyElement(var1)
      else
        setPlayerHudComponentVisible("radar", false)
      end
    end
  end
  var0.visible = arg0
  var0.dispatchElements = arg1 or var0.dispatchElements
end
function setRadarDispatchElements(arg0)
  var0.dispatchElements = arg0 or var0.dispatchElements
end
;({
  x = 15,
  y = guiGetScreenSize() - 175 * (guiGetScreenSize() / 1080) - 25,
  w = 290,
  h = 175,
  visible = false,
  dispatchElements = {},
  mapVisible = false,
  map_opacity = 230,
  fx = 6000 / 3072,
  fy = 6000 / 3072,
  wayColor = tocolor(174, 0, 255, 255),
  hovered_blip = false,
  font = "default",
  zoom = 3,
  clickedCursorPosition = {0, 0},
  sidebar_w = 300 * (guiGetScreenSize() / 1080),
  sidebar_blip_y = 50 * (guiGetScreenSize() / 1080),
  sidebar_blip_size = 50 * (guiGetScreenSize() / 1080),
  list_row_start = 1,
  list_hovered = false
}).sidebar_x = 60 * (guiGetScreenSize() / 1080) + 5 * (guiGetScreenSize() / 1080)
;({
  x = 15,
  y = guiGetScreenSize() - 175 * (guiGetScreenSize() / 1080) - 25,
  w = 290,
  h = 175,
  visible = false,
  dispatchElements = {},
  mapVisible = false,
  map_opacity = 230,
  fx = 6000 / 3072,
  fy = 6000 / 3072,
  wayColor = tocolor(174, 0, 255, 255),
  hovered_blip = false,
  font = "default",
  zoom = 3,
  clickedCursorPosition = {0, 0},
  sidebar_w = 300 * (guiGetScreenSize() / 1080),
  sidebar_blip_y = 50 * (guiGetScreenSize() / 1080),
  sidebar_blip_size = 50 * (guiGetScreenSize() / 1080),
  list_row_start = 1,
  list_hovered = false
}).sidebar_y = 60 * (guiGetScreenSize() / 1080) + 5 * (guiGetScreenSize() / 1080)
;({
  x = 15,
  y = guiGetScreenSize() - 175 * (guiGetScreenSize() / 1080) - 25,
  w = 290,
  h = 175,
  visible = false,
  dispatchElements = {},
  mapVisible = false,
  map_opacity = 230,
  fx = 6000 / 3072,
  fy = 6000 / 3072,
  wayColor = tocolor(174, 0, 255, 255),
  hovered_blip = false,
  font = "default",
  zoom = 3,
  clickedCursorPosition = {0, 0},
  sidebar_w = 300 * (guiGetScreenSize() / 1080),
  sidebar_blip_y = 50 * (guiGetScreenSize() / 1080),
  sidebar_blip_size = 50 * (guiGetScreenSize() / 1080),
  list_row_start = 1,
  list_hovered = false
}).sidebar_h = guiGetScreenSize() - 60 * (guiGetScreenSize() / 1080) * 2 - 10 * (guiGetScreenSize() / 1080)
;({
  x = 15,
  y = guiGetScreenSize() - 175 * (guiGetScreenSize() / 1080) - 25,
  w = 290,
  h = 175,
  visible = false,
  dispatchElements = {},
  mapVisible = false,
  map_opacity = 230,
  fx = 6000 / 3072,
  fy = 6000 / 3072,
  wayColor = tocolor(174, 0, 255, 255),
  hovered_blip = false,
  font = "default",
  zoom = 3,
  clickedCursorPosition = {0, 0},
  sidebar_w = 300 * (guiGetScreenSize() / 1080),
  sidebar_blip_y = 50 * (guiGetScreenSize() / 1080),
  sidebar_blip_size = 50 * (guiGetScreenSize() / 1080),
  list_row_start = 1,
  list_hovered = false
}).draw = function()
  if not var0.mapVisible then
    if var0.visible then
      if not var1 then
        return
      end
      var8(var1, true)
      if var6(localPlayer) == 0 then
        var9(0, 0, var0.w, var0.h, var10(24, 212, 212, 100))
        var11(var0.w / 2 - var3(localPlayer) / (6000 / var4) - var4 / 2, var0.h / 5 + (var0.h / 2 + var3(localPlayer) / (6000 / var5) - var5 / 2), var4, var5, var12, var2(getCamera()))
        var11(var0.w / 2 - var3(localPlayer) / (6000 / var4) - var4 / 2 + var4 / 2 + getPointFromDistanceRotation(var3(localPlayer)) / var0.fx - 1049.6 / 2, var0.h / 5 + (var0.h / 2 + var3(localPlayer) / (6000 / var5) - var5 / 2) + var5 / 2 + -(getPointFromDistanceRotation(var3(localPlayer)) / var0.fy) - 1009.6249999999999 / 2, 1049.6, 1009.6249999999999, "images/island.png", var2(getCamera()) + 90, 0, 0)
        for forvar28, forvar29 in ipairs((var15("radararea"))) do
          if getDistanceBetweenPoints2D(var3(localPlayer)) <= 600 then
            var16(var0.w / 2 - var3(localPlayer) / (6000 / var4) - var4 / 2 + var4 / 2 + getPointFromDistanceRotation(var3(localPlayer)) / var0.fx, var0.h / 5 + (var0.h / 2 + var3(localPlayer) / (6000 / var5) - var5 / 2) + var5 / 2 + -(getPointFromDistanceRotation(var3(localPlayer)) / var0.fy), var0.w / 2 - var3(localPlayer) / (6000 / var4) - var4 / 2 + var4 / 2 + getPointFromDistanceRotation(var3(localPlayer)) / var0.fx, var0.h / 5 + (var0.h / 2 + var3(localPlayer) / (6000 / var5) - var5 / 2) + var5 / 2 + -(getPointFromDistanceRotation(var3(localPlayer)) / var0.fy), var10(getRadarAreaColor(forvar29)), 4)
            var16(var0.w / 2 - var3(localPlayer) / (6000 / var4) - var4 / 2 + var4 / 2 + getPointFromDistanceRotation(var3(localPlayer)) / var0.fx, var0.h / 5 + (var0.h / 2 + var3(localPlayer) / (6000 / var5) - var5 / 2) + var5 / 2 + -(getPointFromDistanceRotation(var3(localPlayer)) / var0.fy), var0.w / 2 - var3(localPlayer) / (6000 / var4) - var4 / 2 + var4 / 2 + getPointFromDistanceRotation(var3(localPlayer)) / var0.fx, var0.h / 5 + (var0.h / 2 + var3(localPlayer) / (6000 / var5) - var5 / 2) + var5 / 2 + -(getPointFromDistanceRotation(var3(localPlayer)) / var0.fy), var10(getRadarAreaColor(forvar29)), 4)
            var16(var0.w / 2 - var3(localPlayer) / (6000 / var4) - var4 / 2 + var4 / 2 + getPointFromDistanceRotation(var3(localPlayer)) / var0.fx, var0.h / 5 + (var0.h / 2 + var3(localPlayer) / (6000 / var5) - var5 / 2) + var5 / 2 + -(getPointFromDistanceRotation(var3(localPlayer)) / var0.fy), var0.w / 2 - var3(localPlayer) / (6000 / var4) - var4 / 2 + var4 / 2 + getPointFromDistanceRotation(var3(localPlayer)) / var0.fx, var0.h / 5 + (var0.h / 2 + var3(localPlayer) / (6000 / var5) - var5 / 2) + var5 / 2 + -(getPointFromDistanceRotation(var3(localPlayer)) / var0.fy), var10(getRadarAreaColor(forvar29)), 4)
            var16(var0.w / 2 - var3(localPlayer) / (6000 / var4) - var4 / 2 + var4 / 2 + getPointFromDistanceRotation(var3(localPlayer)) / var0.fx, var0.h / 5 + (var0.h / 2 + var3(localPlayer) / (6000 / var5) - var5 / 2) + var5 / 2 + -(getPointFromDistanceRotation(var3(localPlayer)) / var0.fy), var0.w / 2 - var3(localPlayer) / (6000 / var4) - var4 / 2 + var4 / 2 + getPointFromDistanceRotation(var3(localPlayer)) / var0.fx, var0.h / 5 + (var0.h / 2 + var3(localPlayer) / (6000 / var5) - var5 / 2) + var5 / 2 + -(getPointFromDistanceRotation(var3(localPlayer)) / var0.fy), var10(getRadarAreaColor(forvar29)), 4)
          end
        end
        if var17 and #var17 > 0 then
          for forvar28, forvar29 in ipairs(var17) do
            if var17[forvar28 + 1] then
              var16(var0.w / 2 - var3(localPlayer) / (6000 / var4) - var4 / 2 + var4 / 2 + getPointFromDistanceRotation(var3(localPlayer)) / var0.fx, var0.h / 5 + (var0.h / 2 + var3(localPlayer) / (6000 / var5) - var5 / 2) + var5 / 2 + -(getPointFromDistanceRotation(var3(localPlayer)) / var0.fy), var0.w / 2 - var3(localPlayer) / (6000 / var4) - var4 / 2 + var4 / 2 + getPointFromDistanceRotation(var3(localPlayer)) / var0.fx, var0.h / 5 + (var0.h / 2 + var3(localPlayer) / (6000 / var5) - var5 / 2) + var5 / 2 + -(getPointFromDistanceRotation(var3(localPlayer)) / var0.fy), var0.wayColor, 8)
            end
          end
        end
      end
      var8()
      var9(var0.x * var18, var0.y, var0.w * var18, 1, (var10(255, 255, 255, 40)))
      var9(var0.x * var18, var0.y + var0.h * var19 - 1, var0.w * var18, 1, (var10(255, 255, 255, 40)))
      var9(var0.x * var18, var0.y, 1, var0.h * var19, (var10(255, 255, 255, 40)))
      var9(var0.x * var18 + var0.w * var18 - 1, var0.y, 1, var0.h * var19, (var10(255, 255, 255, 40)))
      var11(var0.x * var18 + 5 * var18, var0.y + 5 * var19, var0.w * var18 - 10 * var18, var0.h * var19 - 10 * var19, var1, 0, 0, 0, var10(255, 255, 255, 150))
      for forvar20 = 1, #var15("blip") do
        if var7(var15("blip")[forvar20]) == var7(localPlayer) and var6(var15("blip")[forvar20]) == var6(localPlayer) and getDistanceBetweenPoints2D(var3(localPlayer)) <= var20(var15("blip")[forvar20]) then
          if var29(var15("blip")[forvar20]) ~= 0 then
          end
          var11(var23(var24, var25(var26, getPointFromDistanceRotation(var21, var22, getDistanceBetweenPoints2D(var3(localPlayer)) / (6000 / ((var4 * var18 + var5 * var19) / 2)), findRotation(var3(var15("blip")[forvar20])) - var2(getCamera())))) - var32 * var31(var15("blip")[forvar20]) / 2, var23(var27, var25(var28, getPointFromDistanceRotation(var21, var22, getDistanceBetweenPoints2D(var3(localPlayer)) / (6000 / ((var4 * var18 + var5 * var19) / 2)), findRotation(var3(var15("blip")[forvar20])) - var2(getCamera())))) - var32 * var31(var15("blip")[forvar20]) * var19 / 2, var32 * var31(var15("blip")[forvar20]) * var18, var32 * var31(var15("blip")[forvar20]) * var19, "images/blip/" .. (getElementData(var15("blip")[forvar20], "icon") or var29(var15("blip")[forvar20])) .. ".png", 0, 0, 0, var10(255, 255, 255, var30(var15("blip")[forvar20])))
        end
      end
      var11(var21 - var32 * 2 * var18 / 2, var22 - var32 * 2 * var19 / 2, var32 * 2 * var18, var32 * 2 * var19, "images/player.png", var2(getCamera()) - var2(localPlayer), 0, 0)
      if var6(localPlayer) == 0 then
        for forvar20, forvar21 in pairs(var0.dispatchElements or {}) do
          if getElementData(forvar20, "dispatch") and getDistanceBetweenPoints2D(var3(localPlayer)) <= 500 then
            if isPedInVehicle(forvar20) and isElement((getPedOccupiedVehicle(forvar20))) and getElementData(getPedOccupiedVehicle(forvar20), "siren:sound") then
            end
            var9(var34(var23(var24, var25(var26, getPointFromDistanceRotation(var21, var22, getDistanceBetweenPoints2D(var3(localPlayer)) / (6000 / ((var4 * var18 + var5 * var19) / 2)), findRotation(var3(forvar20)) - var2(getCamera())))) - var32 * 2 / 2) + 20, var34(var23(var27, var25(var28, getPointFromDistanceRotation(var21, var22, getDistanceBetweenPoints2D(var3(localPlayer)) / (6000 / ((var4 * var18 + var5 * var19) / 2)), findRotation(var3(forvar20)) - var2(getCamera())))) - var32 * 2 * var19 / 2) + 3, var35(var36(unpack((getElementData(forvar20, "dispatch")))), 1, "default-bold") + 5, 12, var10(0, 0, 0, 200))
            var37(var36(unpack((getElementData(forvar20, "dispatch")))), var34(var23(var24, var25(var26, getPointFromDistanceRotation(var21, var22, getDistanceBetweenPoints2D(var3(localPlayer)) / (6000 / ((var4 * var18 + var5 * var19) / 2)), findRotation(var3(forvar20)) - var2(getCamera())))) - var32 * 2 / 2) + 20, var34(var23(var27, var25(var28, getPointFromDistanceRotation(var21, var22, getDistanceBetweenPoints2D(var3(localPlayer)) / (6000 / ((var4 * var18 + var5 * var19) / 2)), findRotation(var3(forvar20)) - var2(getCamera())))) - var32 * 2 * var19 / 2) + 1, var34(var23(var24, var25(var26, getPointFromDistanceRotation(var21, var22, getDistanceBetweenPoints2D(var3(localPlayer)) / (6000 / ((var4 * var18 + var5 * var19) / 2)), findRotation(var3(forvar20)) - var2(getCamera())))) - var32 * 2 / 2) + 20 + (var35(var36(unpack((getElementData(forvar20, "dispatch")))), 1, "default-bold") + 5), var34(var23(var27, var25(var28, getPointFromDistanceRotation(var21, var22, getDistanceBetweenPoints2D(var3(localPlayer)) / (6000 / ((var4 * var18 + var5 * var19) / 2)), findRotation(var3(forvar20)) - var2(getCamera())))) - var32 * 2 * var19 / 2) + var32 * 2 * var19 + 1, var10(255, 255, 255), 1, "default-bold", "center", "center")
            var11(var34(var23(var24, var25(var26, getPointFromDistanceRotation(var21, var22, getDistanceBetweenPoints2D(var3(localPlayer)) / (6000 / ((var4 * var18 + var5 * var19) / 2)), findRotation(var3(forvar20)) - var2(getCamera())))) - var32 * 2 / 2), var34(var23(var27, var25(var28, getPointFromDistanceRotation(var21, var22, getDistanceBetweenPoints2D(var3(localPlayer)) / (6000 / ((var4 * var18 + var5 * var19) / 2)), findRotation(var3(forvar20)) - var2(getCamera())))) - var32 * 2 * var19 / 2), var32 * 2 * var18, var32 * 2 * var19, "images/blip/0.png", 0, 0, 0, var33[math.random(#var33)])
          end
        end
      end
      if var38 and getPointFromDistanceRotation(var21, var22, getDistanceBetweenPoints2D(var21, var22, var23(var24, var25(var26, getPointFromDistanceRotation(var21, var22, math.sqrt(var39 ^ 2 + var40 ^ 2), -var2(getCamera()) + 180))), (var23(var27, var25(var28, getPointFromDistanceRotation(var21, var22, math.sqrt(var39 ^ 2 + var40 ^ 2), -var2(getCamera()) + 180))))), -var2(getCamera()) + 180) and getPointFromDistanceRotation(var21, var22, getDistanceBetweenPoints2D(var21, var22, var23(var24, var25(var26, getPointFromDistanceRotation(var21, var22, math.sqrt(var39 ^ 2 + var40 ^ 2), -var2(getCamera()) + 180))), (var23(var27, var25(var28, getPointFromDistanceRotation(var21, var22, math.sqrt(var39 ^ 2 + var40 ^ 2), -var2(getCamera()) + 180))))), -var2(getCamera()) + 180) then
        var11(var23(var24, var25(var26, getPointFromDistanceRotation(var21, var22, getDistanceBetweenPoints2D(var21, var22, var23(var24, var25(var26, getPointFromDistanceRotation(var21, var22, math.sqrt(var39 ^ 2 + var40 ^ 2), -var2(getCamera()) + 180))), (var23(var27, var25(var28, getPointFromDistanceRotation(var21, var22, math.sqrt(var39 ^ 2 + var40 ^ 2), -var2(getCamera()) + 180))))), -var2(getCamera()) + 180))) - var32 * 2 / 2, var23(var27, var25(var28, getPointFromDistanceRotation(var21, var22, getDistanceBetweenPoints2D(var21, var22, var23(var24, var25(var26, getPointFromDistanceRotation(var21, var22, math.sqrt(var39 ^ 2 + var40 ^ 2), -var2(getCamera()) + 180))), (var23(var27, var25(var28, getPointFromDistanceRotation(var21, var22, math.sqrt(var39 ^ 2 + var40 ^ 2), -var2(getCamera()) + 180))))), -var2(getCamera()) + 180))) - var32 * 2 / 2, var32 * 2, var32 * 2, "images/blip/4.png", 0, 0, 0)
      end
    end
  else
    var41, var42 = var43 * var0.zoom, var43 * var0.zoom
    if isCursorShowing() then
      if getKeyState("mouse1") and isHoverMap() then
        var45 = unpack(var0.clickedCursorPosition) + (getCursorPosition() * var44 - unpack(var0.clickedCursorPosition))
        var45 = math.min(math.max(var45, var44 / 2 - var41), var44 / 2 + 500 * var0.zoom)
        var46 = unpack(var0.clickedCursorPosition) + (getCursorPosition() * var43 - unpack(var0.clickedCursorPosition))
        var46 = math.min(math.max(var46, var43 / 2 - var42 * 2), var43 / 2)
      end
    end
    var8(var47, true)
    var9(0, 0, var44, var43, var10(2, 20, 48, 120), false)
    var11(var45, var46, var41, var42, var12, 0, 0, 0, var10(255, 255, 255, 255), false)
    var11(var34((var13 + 3000) * var41 / 6000) - 358.4 * var19 * var0.zoom / 2 + var45, var34((3000 - var14) * var42 / 6000) - 344.75 * var19 * var0.zoom / 2 + var46, 358.4 * var19 * var0.zoom, 344.75 * var19 * var0.zoom, "images/island.png", 90, 0, 0)
    for forvar15 = 1, 20 - 1 do
      var16(var45, var46 + var42 / 20 * forvar15, var45 + var41, var46 + var42 / 20 * forvar15, var10(0, 0, 0, 50), 1)
      var37(var36(forvar15), var45 + 5, var46 + var42 / 20 * forvar15, var45 + var41 / 20, var46 + var42 / 20 * forvar15 + 20, var10(0, 0, 0, 255), 1, "default-bold", "left", "center")
      var16(var45 + var41 / 20 * forvar15, var46, var45 + var41 / 20 * forvar15, var46 + var42, var10(0, 0, 0, 50), 1)
      var37(var36(20 + forvar15), var45 + var41 / 20 * forvar15 + 5, var46, var45 + var41 / 20 * (forvar15 + 1), var46 + 20, var10(0, 0, 0, 255), 1, "default-bold", "left", "center")
    end
    for forvar15, forvar16 in ipairs((var15("radararea"))) do
      var9(var45 + var34((var3(forvar16) + 3000) * var41 / 6000), var46 + var34((3000 - var3(forvar16)) * var42 / 6000) - getRadarAreaSize(forvar16) / (6000 / var42), getRadarAreaSize(forvar16) / (6000 / var41), getRadarAreaSize(forvar16) / (6000 / var42), var10(getRadarAreaColor(forvar16)), false)
      if getElementData(forvar16, "text") then
        var37(getElementData(forvar16, "text"), var45 + var34((var3(forvar16) + 3000) * var41 / 6000), var46 + var34((3000 - var3(forvar16)) * var42 / 6000) - getRadarAreaSize(forvar16) / (6000 / var42), var45 + var34((var3(forvar16) + 3000) * var41 / 6000) + getRadarAreaSize(forvar16) / (6000 / var41), var46 + var34((3000 - var3(forvar16)) * var42 / 6000) - getRadarAreaSize(forvar16) / (6000 / var42) + getRadarAreaSize(forvar16) / (6000 / var42), var10(0, 0, 0, 255), 1 * var23(var0.zoom / 2, 1), "default-bold", "center", "center", false, false, false, false, true, -20)
      end
    end
    if var17 and var6(localPlayer) == 0 and #var17 > 0 then
      for forvar15, forvar16 in ipairs(var17) do
        if var17[forvar15 + 1] then
          var16(var45 + var34((var17[forvar15].posX + 3000) * (var41 / 6000)), var46 + var34((3000 - var17[forvar15].posY) * (var42 / 6000)), var45 + var34((var17[forvar15 + 1].posX + 3000) * (var41 / 6000)), var46 + var34((3000 - var17[forvar15 + 1].posY) * (var42 / 6000)), var0.wayColor, 6, false)
        end
      end
    end
    for forvar19, forvar20 in ipairs(var15("blip")) do
      if var7(forvar20) == 0 and var6(forvar20) == 0 then
        if var29(forvar20) == 0 then
        end
        if not false and isMouseInPosition(var34((var3(forvar20) + 3000) * var41 / 6000) - var32 * (var31(forvar20) * var23(var0.zoom / 2, 1) * 1.3 - 0.5) / 2 + var45, var34((3000 - var3(forvar20)) * var42 / 6000) - var32 * (var31(forvar20) * var23(var0.zoom / 2, 1) * 1.3 - 0.5) / 2 + var46, var32 * (var31(forvar20) * var23(var0.zoom / 2, 1) * 1.3 - 0.5), var32 * (var31(forvar20) * var23(var0.zoom / 2, 1) * 1.3 - 0.5)) then
          if var0.hovered_blip ~= forvar20 then
            var0.hovered_blip = forvar20
            playSound(":assets/sounds/plastic-bubble-click.wav")
          end
          if getElementData(forvar20, "blip:name") and getElementData(forvar20, "blip:name") ~= "" then
            var9(var34((var3(forvar20) + 3000) * var41 / 6000) - var32 * (var31(forvar20) * var23(var0.zoom / 2, 1) * 1.3 - 0.5) / 2 + var45 + (var32 * (var31(forvar20) * var23(var0.zoom / 2, 1) * 1.3 - 0.5) - (var35(getElementData(forvar20, "blip:name"), 1, var0.font) + 10)) / 2, var34((3000 - var3(forvar20)) * var42 / 6000) - var32 * (var31(forvar20) * var23(var0.zoom / 2, 1) * 1.3 - 0.5) / 2 + var46 - (dxGetFontHeight(1, var0.font) * #split(getElementData(forvar20, "blip:name"), "\n") + 10) - 3, var35(getElementData(forvar20, "blip:name"), 1, var0.font) + 10, dxGetFontHeight(1, var0.font) * #split(getElementData(forvar20, "blip:name"), "\n") + 10, var10(0, 0, 0, 230), true)
            var37(getElementData(forvar20, "blip:name"), var34((var3(forvar20) + 3000) * var41 / 6000) - var32 * (var31(forvar20) * var23(var0.zoom / 2, 1) * 1.3 - 0.5) / 2 + var45 + (var32 * (var31(forvar20) * var23(var0.zoom / 2, 1) * 1.3 - 0.5) - (var35(getElementData(forvar20, "blip:name"), 1, var0.font) + 10)) / 2, var34((3000 - var3(forvar20)) * var42 / 6000) - var32 * (var31(forvar20) * var23(var0.zoom / 2, 1) * 1.3 - 0.5) / 2 + var46 - (dxGetFontHeight(1, var0.font) * #split(getElementData(forvar20, "blip:name"), "\n") + 10) - 3, var34((var3(forvar20) + 3000) * var41 / 6000) - var32 * (var31(forvar20) * var23(var0.zoom / 2, 1) * 1.3 - 0.5) / 2 + var45 + (var32 * (var31(forvar20) * var23(var0.zoom / 2, 1) * 1.3 - 0.5) - (var35(getElementData(forvar20, "blip:name"), 1, var0.font) + 10)) / 2 + (var35(getElementData(forvar20, "blip:name"), 1, var0.font) + 10), var34((3000 - var3(forvar20)) * var42 / 6000) - var32 * (var31(forvar20) * var23(var0.zoom / 2, 1) * 1.3 - 0.5) / 2 + var46 - (dxGetFontHeight(1, var0.font) * #split(getElementData(forvar20, "blip:name"), "\n") + 10) - 3 + (dxGetFontHeight(1, var0.font) * #split(getElementData(forvar20, "blip:name"), "\n") + 10), var10(255, 255, 255, 210), 1, var0.font, "center", "center", false, false, true, false, false)
          end
        end
        if getElementData(forvar20, "blip:name") ~= "" and not ({})[getElementData(forvar20, "blip:name")] then
          table.insert({}, {
            getElementData(forvar20, "icon") or var29(forvar20),
            getElementData(forvar20, "blip:name"),
            (var10(var30(forvar20)))
          })
          ;({})[getElementData(forvar20, "blip:name")] = true
        end
        var11(var34((var3(forvar20) + 3000) * var41 / 6000) - var32 * (var31(forvar20) * var23(var0.zoom / 2, 1) * 1.3 - 0.5) / 2 + var45, var34((3000 - var3(forvar20)) * var42 / 6000) - var32 * (var31(forvar20) * var23(var0.zoom / 2, 1) * 1.3 - 0.5) / 2 + var46, var32 * (var31(forvar20) * var23(var0.zoom / 2, 1) * 1.3 - 0.5), var32 * (var31(forvar20) * var23(var0.zoom / 2, 1) * 1.3 - 0.5), "images/blip/" .. (getElementData(forvar20, "icon") or var29(forvar20)) .. ".png", 0, 0, 0, var10(var30(forvar20)), true)
      end
    end
    if not true then
      var0.hovered_blip = false
    end
    var11(var45 + (var34((var3(localPlayer) + 3000) * var41 / 6000) - var32 * 1.5 / 2), var46 + (var34((3000 - var3(localPlayer)) * var42 / 6000) - var32 * 1.5 / 2), var32 * 1.5, var32 * 1.5, "images/player.png", -var2(localPlayer), 0, 0, var10(255, 55, 95, 255), true)
    for forvar25, forvar26 in pairs(var0.dispatchElements or {}) do
      if getElementData(forvar25, "dispatch") then
        if isPedInVehicle(forvar25) and isElement((getPedOccupiedVehicle(forvar25))) and getElementData(getPedOccupiedVehicle(forvar25), "siren:sound") then
        end
        var9(var45 + (var34((var3(forvar25) + 3000) * var41 / 6000) - var32 * 1.5 / 2) + 20, var46 + (var34((3000 - var3(forvar25)) * var42 / 6000) - var32 * 1.5 / 2) + 3, var35(var36(unpack((getElementData(forvar25, "dispatch")))), 1, "default-bold") + 5, 12, var10(0, 0, 0, 200), true)
        var37(var36(unpack((getElementData(forvar25, "dispatch")))), var45 + (var34((var3(forvar25) + 3000) * var41 / 6000) - var32 * 1.5 / 2) + 20, var46 + (var34((3000 - var3(forvar25)) * var42 / 6000) - var32 * 1.5 / 2) + 1, var45 + (var34((var3(forvar25) + 3000) * var41 / 6000) - var32 * 1.5 / 2) + 20 + (var35(var36(unpack((getElementData(forvar25, "dispatch")))), 1, "default-bold") + 5), var46 + (var34((3000 - var3(forvar25)) * var42 / 6000) - var32 * 1.5 / 2) + var32 * (2 - 0.5) + 1, var10(255, 255, 255), 1, "default-bold", "center", "center", _, _, true)
        var11(var45 + (var34((var3(forvar25) + 3000) * var41 / 6000) - var32 * 1.5 / 2), var46 + (var34((3000 - var3(forvar25)) * var42 / 6000) - var32 * 1.5 / 2), var32 * (2 - 0.5), var32 * (2 - 0.5), "images/blip/0.png", 0, 0, 0, var33[math.random(#var33)], true)
      end
    end
    var8()
    dxDrawRoundedRectangle(var0.sidebar_x, var0.sidebar_y, var0.sidebar_w, var0.sidebar_h, var10(1, 6, 13, 230), 8, true)
    var9(var0.sidebar_x + var0.sidebar_w, var0.sidebar_y + (var0.sidebar_h - var0.sidebar_h / 1.5) / 2, 1, var0.sidebar_h / 1.5, var48, true)
    if {
      icon = getElementData(forvar20, "icon") or var29(forvar20),
      name = getElementData(forvar20, "blip:name"),
      color = var10(var30(forvar20))
    } then
      var11(var0.sidebar_x + (var0.sidebar_w - var0.sidebar_blip_size) / 2, var0.sidebar_y + var0.sidebar_blip_y, var0.sidebar_blip_size, var0.sidebar_blip_size, "images/blip/" .. ({
        icon = getElementData(forvar20, "icon") or var29(forvar20),
        name = getElementData(forvar20, "blip:name"),
        color = var10(var30(forvar20))
      }).icon .. ".png", 0, 0, 0, ({
        icon = getElementData(forvar20, "icon") or var29(forvar20),
        name = getElementData(forvar20, "blip:name"),
        color = var10(var30(forvar20))
      }).color, true)
      if ({
        icon = getElementData(forvar20, "icon") or var29(forvar20),
        name = getElementData(forvar20, "blip:name"),
        color = var10(var30(forvar20))
      }).name then
        var37(({
          icon = getElementData(forvar20, "icon") or var29(forvar20),
          name = getElementData(forvar20, "blip:name"),
          color = var10(var30(forvar20))
        }).name, var0.sidebar_x, var0.sidebar_y + var0.sidebar_blip_y + var0.sidebar_blip_size + 10, var0.sidebar_x + var0.sidebar_w, var0.sidebar_y + var0.sidebar_blip_y + var0.sidebar_blip_size + 40, ({
          icon = getElementData(forvar20, "icon") or var29(forvar20),
          name = getElementData(forvar20, "blip:name"),
          color = var10(var30(forvar20))
        }).color, 1, var0.font_large, "center", "center", _, _, true)
      end
    else
      var11(var0.sidebar_x + (var0.sidebar_w - var0.sidebar_blip_size * 1.5) / 2, var0.sidebar_y + var0.sidebar_blip_y, var0.sidebar_blip_size * 1.5, var0.sidebar_blip_size * 1.5, ":assets/images/logo.png", 0, 0, 0, var10(255, 255, 255), true)
    end
    var0.list_hovered = false
    for forvar29 = var0.list_row_start, #{} do
      if var0.sidebar_y + var0.sidebar_blip_y + var0.sidebar_blip_size + 80 < var0.sidebar_y + var0.sidebar_h then
        if isMouseInPosition(var0.sidebar_x + 20, var0.sidebar_y + var0.sidebar_blip_y + var0.sidebar_blip_size + 80, var0.sidebar_w - 20, 30) then
          var0.list_hovered = ({})[forvar29][2]
        end
        var11(var0.sidebar_x + 20 + 5, var0.sidebar_y + var0.sidebar_blip_y + var0.sidebar_blip_size + 80, 30, 30, "images/blip/" .. ({})[forvar29][1] .. ".png", 0, 0, 0, var10(bitExtract(({})[forvar29][3], 16, 8), bitExtract(({})[forvar29][3], 8, 8), bitExtract(({})[forvar29][3], 0, 8), 255), true)
        var37(var36(({})[forvar29][2]), var0.sidebar_x + 20 + 5 + 30 + 20, var0.sidebar_y + var0.sidebar_blip_y + var0.sidebar_blip_size + 80, var0.sidebar_w, var0.sidebar_y + var0.sidebar_blip_y + var0.sidebar_blip_size + 80 + 30, var10(bitExtract(({})[forvar29][3], 16, 8), bitExtract(({})[forvar29][3], 8, 8), bitExtract(({})[forvar29][3], 0, 8), 255), 1, var0.font, "left", "center", _, _, true)
      end
    end
    if getZoneName((getCursorPosition() * var44 - var45) * 6000 / var41 - 3000, 3000 - (getCursorPosition() * var43 - var46) * 6000 / var42, var3(localPlayer)) .. " | " .. getZoneName((getCursorPosition() * var44 - var45) * 6000 / var41 - 3000, 3000 - (getCursorPosition() * var43 - var46) * 6000 / var42, var3(localPlayer)) ~= "" then
      var49 = var35(getZoneName((getCursorPosition() * var44 - var45) * 6000 / var41 - 3000, 3000 - (getCursorPosition() * var43 - var46) * 6000 / var42, var3(localPlayer)) .. " | " .. getZoneName((getCursorPosition() * var44 - var45) * 6000 / var41 - 3000, 3000 - (getCursorPosition() * var43 - var46) * 6000 / var42, var3(localPlayer)), 1, var0.font) + 20 * var19
      var50 = var51 + var52 - var49 - 10 * var19
      dxDrawRoundedRectangle(var50, var53, var49, var54, var10(0, 3, 8, 220), 8, true)
      var37(getZoneName((getCursorPosition() * var44 - var45) * 6000 / var41 - 3000, 3000 - (getCursorPosition() * var43 - var46) * 6000 / var42, var3(localPlayer)) .. " | " .. getZoneName((getCursorPosition() * var44 - var45) * 6000 / var41 - 3000, 3000 - (getCursorPosition() * var43 - var46) * 6000 / var42, var3(localPlayer)), var50, var53, var50 + var49, var53 + var54, var10(255, 255, 255), 1, var0.font, "center", "center", _, _, true)
    end
    var9(0, 0, var44, var43, var10(0, 3, 8, 150), false)
    dxDrawImageSection(var51, var55, var52, var56, var51, var55, var52, var56, var47, 0, 0, 0, var10(255, 255, 255, 220), false)
    var9(var51 - 5, var55 - 5, 20, 1, var10(255, 255, 255), false)
    var9(var51 - 5, var55 - 5, 1, 20, var10(255, 255, 255), false)
    var9(var51 + var52 - 15, var55 - 5, 20, 1, var10(255, 255, 255), false)
    var9(var51 + var52 + 5, var55 - 5, 1, 20, var10(255, 255, 255), false)
    var9(var51 - 5, var55 + var56 + 5, 20, 1, var10(255, 255, 255), false)
    var9(var51 - 5, var55 + var56 - 15, 1, 20, var10(255, 255, 255), false)
    var9(var51 + var52 - 15, var55 + var56 + 5, 20, 1, var10(255, 255, 255), false)
    var9(var51 + var52 + 5, var55 + var56 - 15, 1, 20, var10(255, 255, 255), false)
  end
end
function isMouseInPosition(arg0, arg1, arg2, arg3)
  if isCursorShowing() and arg0 <= getCursorPosition() * var0 and arg1 <= getCursorPosition() * var1 and getCursorPosition() * var0 <= arg0 + arg2 and getCursorPosition() * var1 <= arg1 + arg3 then
    return true
  end
end
function findRotation(arg0, arg1, arg2, arg3)
  return -math.deg(math.atan2(arg2 - arg0, arg3 - arg1)) + 360
end
function getPointFromDistanceRotation(arg0, arg1, arg2, arg3)
  return arg0 + math.cos((math.rad(90 - arg3))) * arg2, arg1 + math.sin((math.rad(90 - arg3))) * arg2
end
addEvent("onClientUseItem", true)
addEventHandler("onClientUseItem", root, function(arg0, arg1, arg2)
  if arg1 and arg2.Name == "GPS" then
    showRadar(not var0.visible)
  end
end)
addEvent("onClientRemoveItem", true)
addEventHandler("onClientRemoveItem", root, function(arg0, arg1, arg2)
  if arg1 and arg2.Name == "GPS" then
    showRadar(false)
  end
end)
function cancelRadar(arg0, arg1)
  if arg1 and arg0 == "F11" and var0.visible then
    var0.mapVisible = not var0.mapVisible
    if var0.mapVisible then
      bindKey("mouse2", "down", var0.cursor_visible)
      addEventHandler("onClientClick", root, var0.click)
      addEventHandler("onClientDoubleClick", root, ChosePoint)
      addEventHandler("onClientKey", root, var0.key)
      forcePlayerMap(false)
      showChat(false)
    else
      unbindKey("mouse2", "down", var0.cursor_visible)
      removeEventHandler("onClientClick", root, var0.click)
      removeEventHandler("onClientDoubleClick", root, ChosePoint)
      removeEventHandler("onClientKey", root, var0.key)
      showCursor(false)
      showChat(true)
    end
    cancelEvent()
  end
end
addEventHandler("onClientKey", root, cancelRadar)
;({
  x = 15,
  y = guiGetScreenSize() - 175 * (guiGetScreenSize() / 1080) - 25,
  w = 290,
  h = 175,
  visible = false,
  dispatchElements = {},
  mapVisible = false,
  map_opacity = 230,
  fx = 6000 / 3072,
  fy = 6000 / 3072,
  wayColor = tocolor(174, 0, 255, 255),
  hovered_blip = false,
  font = "default",
  zoom = 3,
  clickedCursorPosition = {0, 0},
  sidebar_w = 300 * (guiGetScreenSize() / 1080),
  sidebar_blip_y = 50 * (guiGetScreenSize() / 1080),
  sidebar_blip_size = 50 * (guiGetScreenSize() / 1080),
  list_row_start = 1,
  list_hovered = false
}).cursor_visible = function(arg0, arg1)
end
;({
  x = 15,
  y = guiGetScreenSize() - 175 * (guiGetScreenSize() / 1080) - 25,
  w = 290,
  h = 175,
  visible = false,
  dispatchElements = {},
  mapVisible = false,
  map_opacity = 230,
  fx = 6000 / 3072,
  fy = 6000 / 3072,
  wayColor = tocolor(174, 0, 255, 255),
  hovered_blip = false,
  font = "default",
  zoom = 3,
  clickedCursorPosition = {0, 0},
  sidebar_w = 300 * (guiGetScreenSize() / 1080),
  sidebar_blip_y = 50 * (guiGetScreenSize() / 1080),
  sidebar_blip_size = 50 * (guiGetScreenSize() / 1080),
  list_row_start = 1,
  list_hovered = false
}).key = function(arg0, arg1)
  if arg0 == "mouse_wheel_up" or arg0 == "mouse_wheel_down" or arg0 == "mouse2" then
    if var0.mapVisible and arg1 then
      if arg0 == "mouse_wheel_down" then
        if isHoverMap() then
          var0.zoom = math.max(0.9, var0.zoom - 0.1)
          var4 = var4 - (var3 * var0.zoom - var1) / 2
          var5 = var5 - (var3 * var0.zoom - var2) / 2
        else
          var0.list_row_start = var0.list_row_start + 1
        end
      elseif arg0 == "mouse_wheel_up" then
        if isHoverMap() then
          var0.zoom = math.min(3, var0.zoom + 0.1)
          var4 = var4 - (var3 * var0.zoom - var1) / 2
          var5 = var5 - (var3 * var0.zoom - var2) / 2
        else
          var0.list_row_start = math.max(1, var0.list_row_start - 1)
        end
      elseif arg0 == "mouse2" then
        showCursor(not isCursorShowing())
      end
    end
    cancelEvent()
  end
end
function isHoverMap()
  return isMouseInPosition(var0.sidebar_x + var0.sidebar_w, 0, var1 - var0.sidebar_w, var2)
end
addEvent("onClientPlayerQuitFromCharacter", true)
addEventHandler("onClientPlayerQuitFromCharacter", localPlayer, function()
  showRadar(false)
end)
addEventHandler("onClientResourceStart", resourceRoot, function()
  if not getElementData(localPlayer, "character:id") then
    return
  end
  if exports["inventory-system"]:playerHasItem("GPS") then
    showRadar(true)
  end
end)
addEvent("radar:showRadar", true)
addEventHandler("radar:showRadar", localPlayer, function()
  showRadar(true)
end)
function centerRadarWithPlayerLocation()
  var1, var2 = var3 * var4.zoom, var3 * var4.zoom
  var4.clickedCursorPosition = {
    var7 + (var5((var0(localPlayer) + 3000) * var1 / 6000) - var6 * 1.5 / 2) - var4.sidebar_w / 2,
    var8 + (var5((3000 - var0(localPlayer)) * var2 / 6000) - var6 * 1.5 / 2),
    var7,
    var8
  }
  var7 = unpack(var4.clickedCursorPosition) + (var9 / 2 - unpack(var4.clickedCursorPosition))
  var7 = math.min(math.max(var7, var9 / 2 - var1), var9 / 2)
  var8 = unpack(var4.clickedCursorPosition) + (var3 / 2 - unpack(var4.clickedCursorPosition))
  var8 = math.min(math.max(var8, var3 / 2 - var2), var3 / 2)
end
centerRadarWithPlayerLocation()
addEvent("onClientCharacterSpawn", true)
addEventHandler("onClientCharacterSpawn", localPlayer, function()
  centerRadarWithPlayerLocation()
end)
;({
  x = 15,
  y = guiGetScreenSize() - 175 * (guiGetScreenSize() / 1080) - 25,
  w = 290,
  h = 175,
  visible = false,
  dispatchElements = {},
  mapVisible = false,
  map_opacity = 230,
  fx = 6000 / 3072,
  fy = 6000 / 3072,
  wayColor = tocolor(174, 0, 255, 255),
  hovered_blip = false,
  font = "default",
  zoom = 3,
  clickedCursorPosition = {0, 0},
  sidebar_w = 300 * (guiGetScreenSize() / 1080),
  sidebar_blip_y = 50 * (guiGetScreenSize() / 1080),
  sidebar_blip_size = 50 * (guiGetScreenSize() / 1080),
  list_row_start = 1,
  list_hovered = false
}).click = function(arg0, arg1, arg2, arg3)
  if arg0 == "left" and arg1 == "down" and var0.mapVisible and isHoverMap() then
    var0.clickedCursorPosition = {
      arg2,
      arg3,
      var1,
      var2
    }
  end
end
function ChosePoint(arg0, arg1, arg2)
  if arg0 == "left" and var0.mapVisible then
    if isHoverMap() then
      screenX = arg1 - var1
      screenY = arg2 - var2
      findBestWay(screenX * 6000 / var3 - 3000, 3000 - screenY * 6000 / var4)
      if isPedInVehicle(localPlayer) then
        for forvar10, forvar11 in pairs(getVehicleOccupants((getPedOccupiedVehicle(localPlayer))) or {}) do
        end
        if 0 < 0 + 1 then
          triggerServerEvent("radar:onFindBestWay", localPlayer, screenX * 6000 / var3 - 3000, 3000 - screenY * 6000 / var4)
        end
      end
    elseif var0.list_hovered then
      for forvar9, forvar10 in ipairs(var6("blip")) do
        if var7(forvar10) == 0 and var8(forvar10) == 0 and getElementData(forvar10, "blip:name") == var0.list_hovered then
          table.insert({}, {
            forvar10,
            (getDistanceBetweenPoints2D(var5(localPlayer)))
          })
        end
      end
      table.sort({}, function(arg0, arg1)
        return tonumber(arg0[2]) < tonumber(arg1[2])
      end)
      if #{} > 0 then
        findBestWay(var5(({})[1][1]))
        if isPedInVehicle(localPlayer) then
          for forvar13, forvar14 in pairs(getVehicleOccupants((getPedOccupiedVehicle(localPlayer))) or {}) do
          end
          if 0 < 0 + 1 then
            triggerServerEvent("radar:onFindBestWay", localPlayer, var5(({})[1][1]))
          end
        end
      end
    end
  end
end
addEvent("radar:findBestWay:sync", true)
addEventHandler("radar:findBestWay:sync", root, function(arg0, arg1)
  findBestWay(arg0, arg1)
end)
function getAreaID(arg0, arg1)
  return var0((arg1 + 3000) / 750) * 8 + var0((arg0 + 3000) / 750)
end
function getNodeByID(arg0, arg1)
  if var0(arg1 / 65536) <= 63 and var0(arg1 / 65536) >= 0 then
    return arg0[var0(arg1 / 65536)][arg1]
  end
end
function findNodePosition(arg0, arg1)
  for forvar8, forvar9 in pairs(vehicleNodes[getAreaID(arg0, arg1)] or {}) do
    if 10000 > getDistanceBetweenPoints2D(arg0, arg1, forvar9.x, forvar9.y) then
    end
  end
  return forvar9
end
function getPath(arg0, arg1)
  ({})[arg0.id] = true
  for forvar8, forvar9 in pairs(arg0.neighbours) do
    ({})[forvar8] = true
    ;({})[forvar8] = forvar9
    ;({})[forvar8] = {
      arg0.id
    }
  end
  while true do
    for forvar10, forvar11 in pairs({}) do
      if forvar11 < 10000 then
      end
    end
    if forvar10 == -1 then
      return {}
    end
    if arg1.id == forvar10 then
      while tonumber(forvar10) ~= nil do
        ({})[1] = getNodeByID(vehicleNodes, forvar10)
      end
      return {}
    end
    for forvar10, forvar11 in pairs(getNodeByID(vehicleNodes, forvar10).neighbours) do
      if not ({})[forvar10] then
        ({})[forvar10] = forvar10
        ;({})[forvar10] = forvar11 + forvar11
        ;({})[forvar10] = true
      end
    end
    ;({})[forvar10] = nil
  end
end
function findBestWay(arg0, arg1, arg2, arg3, arg4)
  if arg2 and arg3 and arg4 then
    var0.wayColor = var1(arg2, arg3, arg4, 255)
  else
    var0.wayColor = var1(174, 0, 255, 255)
  end
  wegSavex, wegSavey = arg0, arg1
  lastMarkerPositionX, lastMarkerPositionY, lastMarkerPositionZ = var2(getLocalPlayer())
  lastMarkerPositionZ = lastMarkerPositionZ - 1
  if not findNodePosition(arg0, arg1) then
    return
  end
  var3 = getPath(findNodePosition(lastMarkerPositionX, lastMarkerPositionY), (findNodePosition(arg0, arg1)))
  for forvar10, forvar11 in ipairs(var4) do
    destroyElement(var4[forvar10].marker)
  end
  var4 = {}
  for forvar10, forvar11 in ipairs(var3) do
    if forvar10 == 1 then
      var4[forvar10] = {}
      var4[forvar10].marker = createMarker(forvar11.x, forvar11.y, forvar11.z, "cylinder", 3, 255, 0, 0, 0)
      var4[forvar10].posX = forvar11.x
      var4[forvar10].posY = forvar11.y
      var4[forvar10].posZ = forvar11.z
      var4[forvar10].ID = forvar10
      addEventHandler("onClientMarkerHit", var4[forvar10].marker, function(arg0, arg1)
        if getLocalPlayer() == arg0 and arg1 then
          for forvar6, forvar7 in ipairs(var1) do
            if var0 <= forvar7.ID then
              destroyElement(var1[forvar6].marker)
              lastMarkerPositionX, lastMarkerPositionY, lastMarkerPositionZ = var1[forvar6].posX, var1[forvar6].posY, var1[forvar6].posZ
              var1[forvar6] = nil
            end
          end
        end
      end)
      var4[forvar10].lastmarker = createColSphere(forvar11.x, forvar11.y, forvar11.z, 8)
      setMarkerColor(var4[1].marker, 125, 0, 0, 0)
      setMarkerSize(var4[1].marker, 3)
    else
      var4[forvar10] = {}
      var4[forvar10].marker = createColSphere(forvar11.x, forvar11.y, forvar11.z, 8)
      var4[forvar10].posX = forvar11.x
      var4[forvar10].posY = forvar11.y
      var4[forvar10].posZ = forvar11.z
      var4[forvar10].ID = forvar10
      addEventHandler("onClientColShapeHit", var4[forvar10].marker, function(arg0, arg1)
        if getLocalPlayer() == arg0 and arg1 then
          for forvar6, forvar7 in ipairs(var1) do
            if var0 <= forvar7.ID then
              destroyElement(var1[forvar6].marker)
              lastMarkerPositionX, lastMarkerPositionY, lastMarkerPositionZ = var1[forvar6].posX, var1[forvar6].posY, var1[forvar6].posZ
              var1[forvar6] = nil
            end
          end
        end
      end)
    end
  end
end
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
