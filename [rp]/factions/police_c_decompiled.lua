-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

({
  state = false,
  x = guiGetScreenSize() - 200,
  y = 0,
  w = 60 * 2 + 15,
  h = (60 + 5) * 6 + 5,
  dragged = false
}).y = (guiGetScreenSize() - ({
  state = false,
  x = guiGetScreenSize() - 200,
  y = 0,
  w = 60 * 2 + 15,
  h = (60 + 5) * 6 + 5,
  dragged = false
}).h) / 2
function showRBS(arg0)
  if var0.state == arg0 then
    return
  end
  var0.state = arg0
  if arg0 then
    addEventHandler("onClientRender", root, var0.draw)
    addEventHandler("onClientClick", root, var0.click)
  else
    removeEventHandler("onClientRender", root, var0.draw)
    removeEventHandler("onClientClick", root, var0.click)
  end
end
addEvent("rbs:show", true)
addEventHandler("rbs:show", localPlayer, function()
  showRBS(not var0.state)
  if var0.state then
    outputChatBox("Type /rbs again to hide the menu.", 200, 200, 200)
  end
end)
function hideRBS()
  showRBS(false)
end
addEvent("onClientPlayerQuitFromCharacter", true)
addEventHandler("onClientPlayerQuitFromCharacter", localPlayer, hideRBS)
addEventHandler("onClientPlayerWasted", localPlayer, hideRBS)
;({
  state = false,
  x = guiGetScreenSize() - 200,
  y = 0,
  w = 60 * 2 + 15,
  h = (60 + 5) * 6 + 5,
  dragged = false
}).draw = function()
  dxDrawRoundedRectangle(var0.x, var0.y, var0.w, var0.h, tocolor(20, 20, 20, 240), 6, true)
  var0.hoverMenu = isMouseInPosition(var0.x, var0.y, var0.w, var0.h)
  var0.hovered = false
  for forvar10 = 1, 2 do
    for forvar15 = 1, 6 do
      if var1[1] then
        if isMouseInPosition(var0.x + 5, var0.y + 5, var2, var2) and var0.dragged ~= 1 then
          var0.hovered = 1
        end
        dxDrawRoundedRectangle(var0.x + 5, var0.y + 5, var2, var2, tocolor(10, 10, 10, 240), 6, true)
        dxDrawImage(var0.x + 5, var0.y + 5, var2, var2, "images/rbs/" .. tostring(var1[1].model) .. ".png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
      end
    end
  end
  if var0.dragged then
    dxDrawRoundedRectangle(getCursorPosition() * var3 - var2 / 2, getCursorPosition() * var4 - var2 / 2, var2, var2, tocolor(0, 0, 0, 230), 6, true)
    dxDrawImage(getCursorPosition() * var3 - var2 / 2, getCursorPosition() * var4 - var2 / 2, var2, var2, "images/rbs/" .. tostring(var1[var0.dragged].model) .. ".png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
  end
end
;({
  state = false,
  x = guiGetScreenSize() - 200,
  y = 0,
  w = 60 * 2 + 15,
  h = (60 + 5) * 6 + 5,
  dragged = false
}).click = function(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7)
  if arg0 == "left" then
    if arg1 == "down" then
      var0.dragged = var0.hovered
      var0.hovered = false
    else
      if var0.dragged and not var0.hoverMenu and not isElement(arg7) and (exports.hud:getHudSetting("admintag") or getDistanceBetweenPoints3D(getElementPosition(localPlayer)) <= 5) then
        if getElementDimension(localPlayer) == 0 and getElementInterior(localPlayer) == 0 then
          setElementAlpha(exports.models:createObject(var1[var0.dragged].model, arg4, arg5, arg6, 0, 0, 0), 0)
          Height = math.abs(getElementBoundingBox((exports.models:createObject(var1[var0.dragged].model, arg4, arg5, arg6, 0, 0, 0))) - getElementBoundingBox((exports.models:createObject(var1[var0.dragged].model, arg4, arg5, arg6, 0, 0, 0)))) / 2
          triggerServerEvent("rbs:create", localPlayer, var1[var0.dragged].name, var1[var0.dragged].model, arg4, arg5, arg6 + Height)
          destroyElement((exports.models:createObject(var1[var0.dragged].model, arg4, arg5, arg6, 0, 0, 0)))
        else
          exports.notifications:output({
            en = "No RBS can be placed here",
            ar = "\217\132\216\167\217\138\217\133\217\131\217\134 \217\136\216\182\216\185 \216\167\217\132\216\173\217\136\216\167\216\172\216\178 \217\135\217\134\216\167"
          }, 3500, "error")
        end
      end
      var0.dragged = false
      var0.hovered = false
    end
  end
end
function isMouseInPosition(arg0, arg1, arg2, arg3)
  if isCursorShowing() then
    return arg0 <= getCursorPosition() * var0 and arg1 <= getCursorPosition() * var1 and getCursorPosition() * var0 <= arg0 + arg2 and getCursorPosition() * var1 <= arg1 + arg3
  end
end
function dxDrawRoundedRectangle(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7)
-- fail 16
null
8
  arg2, arg3, arg0, arg1 = arg2 - arg5 * 2, arg3 - arg5 * 2, math.floor(arg0 + arg5), math.floor(arg1 + arg5)
  dxDrawRectangle(arg0 - arg5, arg1, arg2 + arg5 * 2, arg3, arg4, arg6)
  dxDrawRectangle(arg0, arg1 - arg5, arg2, arg5, arg4, arg6)
  dxDrawRectangle(arg0, arg1 + arg3, arg2, arg5, arg4, arg6)
  if ({
    up = {right = true, left = true},
    down = {right = true, left = true}
  }).up.left then
    dxDrawCircle(arg0, arg1, arg5, 180, 270, arg4, arg4, 7, _, arg6)
  else
    dxDrawRectangle(arg0 - arg5, arg1 - arg5, arg5, arg5, arg4, arg6)
  end
  if ({
    up = {right = true, left = true},
    down = {right = true, left = true}
  }).up.right then
    dxDrawCircle(arg0 + arg2, arg1, arg5, 270, 360, arg4, arg4, 7, _, arg6)
  else
    dxDrawRectangle(arg0 + arg2, arg1 - arg5, arg5, arg5, arg4, arg6)
  end
  if ({
    up = {right = true, left = true},
    down = {right = true, left = true}
  }).down.left then
    dxDrawCircle(arg0, arg1 + arg3, arg5, 90, 180, arg4, arg4, 7, _, arg6)
  else
    dxDrawRectangle(arg0 - arg5, arg1 + arg3, arg5, arg5, arg4, arg6)
  end
  if ({
    up = {right = true, left = true},
    down = {right = true, left = true}
  }).down.right then
    dxDrawCircle(arg0 + arg2, arg1 + arg3, arg5, 0, 90, arg4, arg4, 7, _, arg6)
  else
    dxDrawRectangle(arg0 + arg2, arg1 + arg3, arg5, arg5, arg4, arg6)
  end
end
function cancelKeys(arg0, arg1)
  if arg1 then
    if arg0 == "F11" then
      if exports.hud:isHudItemExists("blindfold") then
        cancelEvent()
      end
    elseif var0[arg0] and (exports.hud:isHudItemExists("handcuffs") or exports.hud:isHudItemExists("rope")) then
      cancelEvent()
    end
  end
end
addEventHandler("onClientKey", root, cancelKeys)
