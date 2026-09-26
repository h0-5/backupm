-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

notifications = {
  list = {}
}
directive = {
  state = false,
  text = "",
  color = tocolor(255, 255, 255, 255),
  font = "default-bold"
}
function UIKitReady()
  eui = exports.UIKit
  directive.font = eui:getUIFont("default-large")
  var0 = eui:getUIFont("ui-default")
  GRADIENT_BG = eui:getUIImage("gradient_x")
  var1 = eui:uiGetThemeColor("primary")
end
addEventHandler("onClientUIReady", resourceRoot, UIKitReady)
addEventHandler("onClientUIKitReady", root, UIKitReady)
language = "ar"
function updateTexturesSettings()
  if exports.settings:getSetting("language") then
    language = "ar"
  else
    language = "en"
  end
end
addEvent("onClientSettingsReady", true)
addEventHandler("onClientSettingsReady", resourceRoot, updateTexturesSettings)
addEvent("onClientSettingChange", false)
addEventHandler("onClientSettingChange", localPlayer, function(arg0, arg1, arg2)
  if arg0 == "language" then
    if arg2 then
      language = "ar"
    else
      language = "en"
    end
  end
end)
drawRenderState2 = false
function notifications.render()
  for forvar4, forvar5 in ipairs(notifications.list) do
    table.sort(split(forvar5.Text, "\n"), function(arg0, arg1)
      return #arg0 > #arg1
    end)
    if forvar5.HorizontalAlign == "center" then
    elseif forvar5.HorizontalAlign == "right" and forvar5.VerticalAlign == "top" then
    end
    dxDrawRoundedRectangle(math.floor(var2 - math.max(350, dxGetTextWidth(split(forvar5.Text, "\n")[1], 1, var1) + 20, dxGetTextWidth(split(forvar5.Title, "\n")[1], 1, var1) + 20) - 10), math.floor(120), math.max(350, dxGetTextWidth(split(forvar5.Text, "\n")[1], 1, var1) + 20, dxGetTextWidth(split(forvar5.Title, "\n")[1], 1, var1) + 20), 25 * #split(forvar5.Title, "\n") + 20 * #split(forvar5.Text, "\n") + 20, tocolor(5, 5, 5, 230), 6, true, {
      up = {right = true, left = true},
      down = {right = true, left = true}
    })
    dxDrawText(tostring(forvar5.Title), math.floor(var2 - math.max(350, dxGetTextWidth(split(forvar5.Text, "\n")[1], 1, var1) + 20, dxGetTextWidth(split(forvar5.Title, "\n")[1], 1, var1) + 20) - 10) + 15, math.floor(120) + 10, math.floor(var2 - math.max(350, dxGetTextWidth(split(forvar5.Text, "\n")[1], 1, var1) + 20, dxGetTextWidth(split(forvar5.Title, "\n")[1], 1, var1) + 20) - 10) + math.max(350, dxGetTextWidth(split(forvar5.Text, "\n")[1], 1, var1) + 20, dxGetTextWidth(split(forvar5.Title, "\n")[1], 1, var1) + 20), math.floor(120) + 25, tocolor(255, 255, 255, 255), 1, var1, "left", "top", true, true, true, true, false)
    dxDrawText(tostring(forvar5.Text), math.floor(var2 - math.max(350, dxGetTextWidth(split(forvar5.Text, "\n")[1], 1, var1) + 20, dxGetTextWidth(split(forvar5.Title, "\n")[1], 1, var1) + 20) - 10) + 15, math.floor(120) + 25 + 3, math.floor(var2 - math.max(350, dxGetTextWidth(split(forvar5.Text, "\n")[1], 1, var1) + 20, dxGetTextWidth(split(forvar5.Title, "\n")[1], 1, var1) + 20) - 10) + math.max(350, dxGetTextWidth(split(forvar5.Text, "\n")[1], 1, var1) + 20, dxGetTextWidth(split(forvar5.Title, "\n")[1], 1, var1) + 20), math.floor(120) + (25 * #split(forvar5.Title, "\n") + 20 * #split(forvar5.Text, "\n") + 20), tocolor(255, 255, 255, 255), 1, var1, "left", "top", true, true, true, true, false)
    if forvar5.VerticalAlign == "bottom" then
    end
  end
  if directive.state then
    dxDrawText(string.gsub(directive.text, "#%x%x%x%x%x%x", ""), 0 + 2, var0 / 2 + 250 * var3, 0 + var2, var0 / 2 + 250 * var3 + 20 * var3, tocolor(0, 0, 0, 255), 1, directive.font, "center", "center", true, true, false, true, false)
    dxDrawText(string.gsub(directive.text, "#%x%x%x%x%x%x", ""), 0 - 2, var0 / 2 + 250 * var3, 0 + var2, var0 / 2 + 250 * var3 + 20 * var3, tocolor(0, 0, 0, 255), 1, directive.font, "center", "center", true, true, false, true, false)
    dxDrawText(string.gsub(directive.text, "#%x%x%x%x%x%x", ""), 0, var0 / 2 + 250 * var3 + 2, 0 + var2, var0 / 2 + 250 * var3 + 20 * var3, tocolor(0, 0, 0, 255), 1, directive.font, "center", "center", true, true, false, true, false)
    dxDrawText(string.gsub(directive.text, "#%x%x%x%x%x%x", ""), 0, var0 / 2 + 250 * var3 - 2, 0 + var2, var0 / 2 + 250 * var3 + 20 * var3, tocolor(0, 0, 0, 255), 1, directive.font, "center", "center", true, true, false, true, false)
    dxDrawText(directive.text, 0, var0 / 2 + 250 * var3, 0 + var2, var0 / 2 + 250 * var3 + 20 * var3, directive.color, 1, directive.font, "center", "center", true, true, false, true, false)
  end
end
addEventHandler("onClientRender", root, notifications.render)
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
function dxDrawEmptyLine(arg0, arg1, arg2, arg3, arg4, arg5)
  dxDrawLine(arg0, arg1, arg0 + arg2, arg1, arg4, arg5, true)
  dxDrawLine(arg0, arg1, arg0, arg1 + arg3, arg4, arg5, true)
  dxDrawLine(arg0, arg1 + arg3, arg0 + arg2, arg1 + arg3, arg4, arg5, true)
  dxDrawLine(arg0 + arg2, arg1, arg0 + arg2, arg1 + arg3, arg4, arg5, true)
end
function sendNotification(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8)
  if type(arg1) == "table" then
    arg1 = arg1[language]
  end
  if type(arg0) == "table" then
    arg0 = arg0[language]
  end
  if not arg3 then
    for forvar12, forvar13 in ipairs(notifications.list) do
      if forvar13.Title == arg0 and forvar13.Text == arg1 then
        return false
      end
    end
  end
  table.insert(notifications.list, {
    ID = arg6 or math.random(9999999),
    Title = arg0,
    Text = arg1,
    Time = arg2 or 5000,
    TickCount = getTickCount(),
    StartY = 540,
    EndY = 540,
    AlphaStart = 0,
    AlphaEnd = 255,
    HorizontalAlign = arg4 or "left",
    VerticalAlign = arg5 or "bottom",
    Width = arg7,
    NormalFont = arg8
  })
  playSound("notification.wav")
  if isTimer(var0[tostring(arg6 or math.random(9999999))]) then
    killTimer(var0[tostring(arg6 or math.random(9999999))])
  end
  if arg2 ~= -1 then
    var0[tostring(arg6 or math.random(9999999))] = setTimer(function(arg0)
      for forvar4, forvar5 in ipairs(notifications.list) do
        if forvar5.ID == arg0 then
          table.remove(notifications.list, forvar4)
          break
        end
      end
    end, arg2 or 5000, 1, arg6 or math.random(9999999))
  end
  return arg6 or math.random(9999999)
end
addEvent("notifications:sendNotification", true)
addEventHandler("notifications:sendNotification", root, sendNotification)
function hideNotification(arg0, arg1, arg2)
  for forvar6, forvar7 in ipairs(notifications.list) do
    if arg2 and arg2 == forvar7.ID then
      table.remove(notifications.list, forvar6)
      if isTimer(var0[tostring(arg2)]) then
        killTimer(var0[tostring(arg2)])
      end
      return
    end
    if forvar7.Title == arg0 then
      if type(arg1) == "string" then
        if forvar7.Text == arg1 then
          table.remove(notifications.list, forvar6)
          break
        end
      else
        table.remove(notifications.list, forvar6)
        break
      end
    end
  end
  return true
end
addEvent("notifications:hideNotification", true)
addEventHandler("notifications:hideNotification", root, hideNotification)
function showDirective(arg0, arg1, arg2, arg3)
  if arg0 == "" then
    directive.state = false
    return
  end
  if type(arg0) == "table" then
    arg0 = arg0[language] or ""
  end
  if type(arg1) == "table" then
    arg1 = tocolor(arg1[1], arg1[2], arg1[3], arg1[4])
  end
  directive.state = true
  directive.text = tostring(arg0)
  directive.color = arg1 or tocolor(255, 255, 255, 255)
  directive.font = arg3 or directive.font
  if isTimer(directive.hideTimer) then
    killTimer(directive.hideTimer)
  end
  if arg2 then
    directive.hideTimer = setTimer(function()
      directive.state = false
    end, arg2 or 5000, 1)
  end
end
addEvent("notifications:showDirective", true)
addEventHandler("notifications:showDirective", root, showDirective)
function hideDirective()
  directive.state = false
end
addEvent("notifications:hideDirective", true)
addEventHandler("notifications:hideDirective", root, hideDirective)
function output(arg0, arg1, arg2, arg3, arg4)
  if #var0 == 0 then
    addEventHandler("onClientRender", root, draw_notifications)
  end
  arg3 = arg3 or "bottom"
  arg1 = math.max(arg1, 1000)
  arg4 = arg4 or {}
  if type(arg0) == "table" then
    arg0 = arg0[language]
  end
  if arg3 == "bottom" then
    var1.bottom = var1.bottom - var2 - 5
  elseif arg3 == "top" then
    var1.top = var1.top + 5
  elseif arg3 == "right" then
    var1.right = var1.right + 5
  end
  var3 = var3 + 1
  table.insert(var0, {
    id = var3,
    text = arg0,
    duration = arg1,
    type = arg2,
    width = dxGetTextWidth(arg0, 1, var4, true) + 20 + 30,
    x_i = var5 + 20,
    x = var5 - (dxGetTextWidth(arg0, 1, var4, true) + 20 + 30) - 30,
    y_i = arg3 == "bottom" and var6 or arg3 == "top" and -var2 or var1[arg3],
    y = var1[arg3],
    tick = getTickCount(),
    color = arg4.color or tocolor(0, 0, 0, 200),
    color_2 = arg4.color_2 or var7[arg2] or tocolor(255, 255, 255),
    align = arg3
  })
  if arg3 == "top" then
    var1.top = var1.top + var2
  elseif arg3 == "right" then
    var1.right = var1.right + var2
  end
  playSound(var8[arg2] or "sounds/notification.wav")
  var9[var3] = setTimer(function(arg0, arg1)
    if arg1 == "bottom" then
      var0.bottom = var0.bottom + var1 + 5
      for forvar5, forvar6 in ipairs(var2) do
        if arg0 <= forvar6.id and forvar6.align == arg1 then
          var2[forvar5].y_i = forvar6.y
          var2[forvar5].y = forvar6.y + var1 + 5
          if forvar6.id == arg0 then
            var2[forvar5].y = var3
          end
          var2[forvar5].tick = getTickCount()
        end
      end
    elseif arg1 == "top" then
      var0.top = var0.top - var1 - 5
      for forvar5, forvar6 in ipairs(var2) do
        if arg0 <= forvar6.id and forvar6.align == arg1 then
          var2[forvar5].y_i = forvar6.y
          var2[forvar5].y = forvar6.y - var1 - 5
          if forvar6.id == arg0 then
            var2[forvar5].y = -var1
          end
          var2[forvar5].tick = getTickCount()
        end
      end
    elseif arg1 == "right" then
      var0.right = var0.right - var1 - 5
      for forvar5, forvar6 in ipairs(var2) do
        if arg0 <= forvar6.id and forvar6.align == arg1 then
          if forvar6.id == arg0 then
            var2[forvar5].y_i = var2[forvar5].y
            var2[forvar5].x = var4 + 20
            var2[forvar5].x_i = var2[forvar5].x
          else
            var2[forvar5].y_i = forvar6.y
            var2[forvar5].y = forvar6.y - var1 - 5
            var2[forvar5].x_i = var2[forvar5].x
          end
          var2[forvar5].tick = getTickCount()
        end
      end
    end
    var5[arg0] = setTimer(function(arg0)
      for forvar4, forvar5 in ipairs(var0) do
        if forvar5.id == arg0 then
          table.remove(var0, forvar4)
          if #var0 == 0 then
            removeEventHandler("onClientRender", root, draw_notifications)
          end
          break
        end
      end
    end, 500, 1, arg0)
  end, arg1, 1, var3, arg3)
end
addEvent("notifications:output", true)
addEventHandler("notifications:output", root, output)
function anim(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8)
  if arg1 < getTickCount() - arg0 then
    return arg5, arg6, arg7
  end
  return interpolateBetween(arg2, arg3, arg4, arg5, arg6, arg7, (getTickCount() - arg0) / arg1, arg8)
end
function draw_notifications()
  for forvar3, forvar4 in ipairs(var0) do
    if forvar4.align == "right" then
      dxDrawRectangle(anim(forvar4.tick, 500, forvar4.y_i, forvar4.x_i, 0, forvar4.y, forvar4.x, 0, "OutBack"))
      dxDrawCircle(anim(forvar4.tick, 500, forvar4.y_i, forvar4.x_i, 0, forvar4.y, forvar4.x, 0, "OutBack"))
      dxDrawCircle(anim(forvar4.tick, 500, forvar4.y_i, forvar4.x_i, 0, forvar4.y, forvar4.x, 0, "OutBack") + forvar4.width, anim(forvar4.tick, 500, forvar4.y_i, forvar4.x_i, 0, forvar4.y, forvar4.x, 0, "OutBack") + var1 / 2, var1 / 2, 270, 450, forvar4.color, forvar4.color, 20, _, var2)
      if forvar4.type then
        dxDrawImage(anim(forvar4.tick, 500, forvar4.y_i, forvar4.x_i, 0, forvar4.y, forvar4.x, 0, "OutBack") - 10, anim(forvar4.tick, 500, forvar4.y_i, forvar4.x_i, 0, forvar4.y, forvar4.x, 0, "OutBack") + 5, 25, 25, "icons/" .. forvar4.type .. ".png", 0, 0, 0, tocolor(255, 255, 255, 200), var2)
        if forvar4.type == "police" then
          dxDrawRectangle((var3 - forvar4.width / 2) / 2, anim(forvar4.tick, 500, forvar4.y_i, forvar4.x_i, 0, forvar4.y, forvar4.x, 0, "OutBack") - 2, forvar4.width / 2 / 3, 4, var4[math.random(1, #var4)], var2)
          dxDrawRectangle((var3 - forvar4.width / 2) / 2 + forvar4.width / 2 / 3, anim(forvar4.tick, 500, forvar4.y_i, forvar4.x_i, 0, forvar4.y, forvar4.x, 0, "OutBack") - 2, forvar4.width / 2 / 3, 4, var4[math.random(1, #var4)], var2)
          dxDrawRectangle((var3 - forvar4.width / 2) / 2 + forvar4.width / 2 / 3 * 2, anim(forvar4.tick, 500, forvar4.y_i, forvar4.x_i, 0, forvar4.y, forvar4.x, 0, "OutBack") - 2, forvar4.width / 2 / 3, 4, var4[math.random(1, #var4)], var2)
        end
      end
      dxDrawText(forvar4.text, anim(forvar4.tick, 500, forvar4.y_i, forvar4.x_i, 0, forvar4.y, forvar4.x, 0, "OutBack") + 15, anim(forvar4.tick, 500, forvar4.y_i, forvar4.x_i, 0, forvar4.y, forvar4.x, 0, "OutBack"))
    else
      dxDrawRectangle((var3 - forvar4.width) / 2, anim(forvar4.tick, 500, forvar4.y_i, 0, 0, forvar4.y, 0, 0, "OutBack"), forvar4.width, var1, forvar4.color, var2)
      dxDrawCircle((var3 - forvar4.width) / 2, anim(forvar4.tick, 500, forvar4.y_i, 0, 0, forvar4.y, 0, 0, "OutBack") + var1 / 2, var1 / 2, 90, 270, forvar4.color, forvar4.color, 20, _, var2)
      dxDrawCircle((var3 - forvar4.width) / 2 + forvar4.width, anim(forvar4.tick, 500, forvar4.y_i, 0, 0, forvar4.y, 0, 0, "OutBack") + var1 / 2, var1 / 2, 270, 450, forvar4.color, forvar4.color, 20, _, var2)
      if forvar4.type then
        dxDrawImage((var3 - forvar4.width) / 2 - 10, anim(forvar4.tick, 500, forvar4.y_i, 0, 0, forvar4.y, 0, 0, "OutBack") + 5, 25, 25, "icons/" .. forvar4.type .. ".png", 0, 0, 0, forvar4.color_2 or tocolor(255, 255, 255, 200), var2)
        if forvar4.type == "police" then
          dxDrawRectangle((var3 - forvar4.width / 2) / 2, anim(forvar4.tick, 500, forvar4.y_i, 0, 0, forvar4.y, 0, 0, "OutBack") - 2, forvar4.width / 2 / 3, 4, var4[math.random(1, #var4)], var2)
          dxDrawRectangle((var3 - forvar4.width / 2) / 2 + forvar4.width / 2 / 3, anim(forvar4.tick, 500, forvar4.y_i, 0, 0, forvar4.y, 0, 0, "OutBack") - 2, forvar4.width / 2 / 3, 4, var4[math.random(1, #var4)], var2)
          dxDrawRectangle((var3 - forvar4.width / 2) / 2 + forvar4.width / 2 / 3 * 2, anim(forvar4.tick, 500, forvar4.y_i, 0, 0, forvar4.y, 0, 0, "OutBack") - 2, forvar4.width / 2 / 3, 4, var4[math.random(1, #var4)], var2)
        elseif forvar4.type == "danger" then
          dxDrawRectangle((var3 - forvar4.width / 2) / 2, anim(forvar4.tick, 500, forvar4.y_i, 0, 0, forvar4.y, 0, 0, "OutBack") + var1 - 2, forvar4.width / 2, 2, var6[math.random(1, #var6)], var2)
        end
      end
      dxDrawText(forvar4.text, (var3 - forvar4.width) / 2 + 15, anim(forvar4.tick, 500, forvar4.y_i, 0, 0, forvar4.y, 0, 0, "OutBack"), (var3 - forvar4.width) / 2 + 15 + forvar4.width, anim(forvar4.tick, 500, forvar4.y_i, 0, 0, forvar4.y, 0, 0, "OutBack") + var1, tocolor(255, 255, 255, 255), 1, var5, "center", "center", true, true, var2, true, false)
    end
  end
end
function showKeyDescription(arg0, arg1, arg2, arg3)
  for forvar7, forvar8 in ipairs(var0.list) do
    if forvar8.code == arg0 then
      return
    end
  end
  if type(arg2) == "table" then
    arg2 = arg2[language] or ""
  end
  if type(arg3) == "table" then
    arg3 = tocolor(arg3[1], arg3[2], arg3[3], arg3[4])
  end
  if #var0.list == 0 then
    addEventHandler("onClientRender", root, var0.draw)
  end
  table.insert(var0.list, {
    state = true,
    code = arg0,
    key = arg1,
    text = tostring(arg2),
    color = arg3 or tocolor(255, 255, 255, 255),
    key_w = math.max(40 * var1, dxGetTextWidth(arg1, 1, var2) + 25 * var1)
  })
end
function hideKeyDescription(arg0)
  for forvar4, forvar5 in ipairs(var0.list) do
    if forvar5.code == arg0 then
      table.remove(var0.list, forvar4)
      break
    end
  end
  if #var0.list == 0 then
    removeEventHandler("onClientRender", root, var0.draw)
  end
end
addEvent("notifications:showKeyDescription", true)
addEventHandler("notifications:showKeyDescription", root, showKeyDescription)
addEvent("notifications:hideKeyDescription", true)
addEventHandler("notifications:hideKeyDescription", root, hideKeyDescription)
;({
  list = {}
}).draw = function()
  for forvar6, forvar7 in ipairs(var1.list) do
    dxDrawRoundedRectangle(30 * var0, 450 * var0, forvar7.key_w, 35 * var0, tocolor(0, 8, 20, 200), 6, var2)
    dxDrawRectangle(30 * var0, 450 * var0 + 35 * var0 / 4, 2, 35 * var0 / 2, tocolor(255, 255, 255, 255), var2)
    dxDrawText(forvar7.key, 30 * var0, 450 * var0, 30 * var0 + forvar7.key_w + 2, 450 * var0 + 35 * var0 + 2, tocolor(255, 255, 255, 255), 1, var3, "center", "center", true, true, var2, true, false)
    dxDrawText(forvar7.text, 30 * var0 + forvar7.key_w + 10 * var0, 450 * var0, 30 * var0 + 200 * var0, 450 * var0 + 35 * var0, tocolor(255, 255, 255, 255), 1, var3, "left", "center", true, true, var2, true, false)
  end
end
addEvent("notifications:cache", true)
addEventHandler("notifications:cache", localPlayer, function(arg0, arg1)
  var0.savedNotifications = arg0
  for forvar5, forvar6 in ipairs(var0.savedNotifications) do
    if forvar6.read == 0 and forvar6.type == "announcement" then
      openNotification(forvar6.id)
    end
  end
  if arg1 then
    for forvar6, forvar7 in ipairs(var0.savedNotifications) do
    end
    if 0 < 0 + 1 then
      output({
        en = "You have " .. tostring(0 + 1) .. " unread notifications",
        ar = "\217\132\216\175\217\138\217\131 " .. tostring(0 + 1) .. " \216\165\216\180\216\185\216\167\216\177\216\167\216\170 \216\186\217\138\216\177 \217\133\217\130\216\177\217\136\216\161\216\169"
      }, 10000, "info", "top")
    end
  end
end)
bindKey("F6", "down", function()
  if getElementData(localPlayer, "character:id") then
    showNotificationCenter(not var0.state)
  end
end)
UI = {
  window = {},
  label = {},
  button = {}
}
function UIKitReady()
  eui = exports.UIKit
  UI.window.notification = eui:uiCreateWindow(false, false, 400, 250, {
    en = "Notification",
    ar = "\216\165\216\180\216\185\216\167\216\177"
  }, _, "icons/notification.png")
  eui:uiSetVisible(UI.window.notification, false)
  eui:uiWindowSetMovable(UI.window.notification, false)
  UI.label.details = eui:uiCreateLabel(15, 60, 370, 150, "", tocolor(255, 255, 255, 255), "left", "top", UI.window.notification)
  eui:uiSetProperty(UI.label.details, "color_coded", false)
  eui:uiSetProperty(UI.label.details, "word_break", true)
  UI.button.close = eui:uiCreateButton(5, 210, 390, 35, {en = "Close", ar = "\216\165\216\186\217\132\216\167\217\130"}, _, UI.window.notification)
  UI.window.notification_ann = eui:uiCreateRectangle(false, false, 650, 450, tocolor(15, 15, 15, 240), true, true, true, true)
  eui:uiSetVisible(UI.window.notification_ann, false)
  eui:uiSetProperty(UI.window.notification_ann, "border_radius", 20)
  eui:uiCreateImage((650 - 80) / 2, 30, 80, 80, "icons/megaphone.png", UI.window.notification_ann)
  UI.label.notification_ann_details = eui:uiCreateLabel(0, 150, 650, 150, "", tocolor(255, 255, 255, 255), "center", "top", UI.window.notification_ann)
  eui:uiSetFont(UI.label.notification_ann_details, "default-large")
  UI.button.notification_ann_close = eui:uiCreateButton((650 - 200) / 2, 450 - 45, 200, 35, {en = "Ok", ar = "\216\173\216\179\217\134\217\139\216\167"}, "primary", UI.window.notification_ann)
  eui:uiSetProperty(UI.button.notification_ann_close, "HoverGlow", true)
end
addEventHandler("onClientUIReady", resourceRoot, UIKitReady)
addEventHandler("onClientUIKitReady", root, UIKitReady)
addEventHandler("onClientUIClick", root, function(arg0)
  if source == UI.button.close then
    eui:uiSetVisible(UI.window.notification, false)
    showCursor(false)
  elseif source == UI.button.notification_ann_close then
    eui:uiSetVisible(UI.window.notification_ann, false)
    showCursor(false)
  end
end)
addEvent("onClientPlayerQuitFromCharacter", true)
addEventHandler("onClientPlayerQuitFromCharacter", localPlayer, function(arg0)
  if var0.state then
    showNotificationCenter(false)
  end
  eui:uiSetVisible(UI.window.notification, false)
  var0.savedNotifications = {}
end)
function showNotificationCenter(arg0)
  var0.state = arg0
  showCursor(arg0)
  if arg0 then
    var0.anim = {
      getTickCount(),
      var0.alpha,
      var0.y,
      100,
      0,
      true
    }
    removeEventHandler("onClientRender", root, var0.draw)
    addEventHandler("onClientRender", root, var0.draw)
    addEventHandler("onClientClick", root, var0.click)
    addEventHandler("onClientKey", root, var0.key)
  else
    var0.anim = {
      getTickCount(),
      var0.alpha,
      var0.y,
      0,
      -var0.height,
      false
    }
    removeEventHandler("onClientClick", root, var0.click)
    removeEventHandler("onClientKey", root, var0.key)
  end
end
;({
  state = false,
  width = 500 * (guiGetScreenSize() / 1080),
  height = 500 * (guiGetScreenSize() / 1080),
  anim = {
    getTickCount(),
    0,
    -500,
    200,
    0,
    true
  },
  alpha = 0,
  x = (guiGetScreenSize() - 500 * (guiGetScreenSize() / 1080)) / 2,
  y = -500 * (guiGetScreenSize() / 1080),
  hoveredButton = false,
  hoveredNoti = false,
  hoveredRemoveButton = false,
  savedNotifications = {},
  index_i = 1,
  index_f = 7
}).key = function(arg0, arg1)
  if arg0 == "mouse_wheel_up" or arg0 == "mouse_wheel_down" then
    if var0.state then
      if arg0 == "mouse_wheel_down" then
        var0.index_i = math.min(var0.index_i + 1, #var0.savedNotifications)
        var0.index_f = var0.index_i + 6
      else
        var0.index_i = math.max(var0.index_i - 1, 1)
        var0.index_f = var0.index_i + 6
      end
    end
    cancelEvent()
  end
end
;({
  state = false,
  width = 500 * (guiGetScreenSize() / 1080),
  height = 500 * (guiGetScreenSize() / 1080),
  anim = {
    getTickCount(),
    0,
    -500,
    200,
    0,
    true
  },
  alpha = 0,
  x = (guiGetScreenSize() - 500 * (guiGetScreenSize() / 1080)) / 2,
  y = -500 * (guiGetScreenSize() / 1080),
  hoveredButton = false,
  hoveredNoti = false,
  hoveredRemoveButton = false,
  savedNotifications = {},
  index_i = 1,
  index_f = 7
}).click = function(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7)
  if arg0 == "left" and arg1 == "up" then
    if isMouseInPosition(var0.x, var0.y, var0.width, var0.height) then
      if var0.hoveredNoti then
        if var0.hoveredRemoveButton then
          for forvar12, forvar13 in ipairs(var0.savedNotifications) do
            if forvar13.id == var0.hoveredNoti then
              table.remove(var0.savedNotifications, forvar12)
              break
            end
          end
          triggerServerEvent("notifications:remove", localPlayer, var0.hoveredNoti)
        else
          openNotification(var0.hoveredNoti)
        end
      end
    else
      showNotificationCenter(false)
    end
  end
end
function openNotification(arg0)
  for forvar4, forvar5 in ipairs(var0.savedNotifications) do
    if forvar5.id == arg0 then
      showNotificationCenter(false)
      if forvar5.read == 0 then
        triggerServerEvent("notifications:read", localPlayer, arg0)
        var0.savedNotifications[forvar4].read = 1
      end
      if forvar5.type == "announcement" then
        eui:uiSetText(UI.label.notification_ann_details, forvar5.details)
        eui:uiSetVisible(UI.window.notification_ann, true)
        showCursor(true)
        break
      end
      eui:uiSetText(UI.label.details, forvar5.title .. [[


]] .. forvar5.details)
      eui:uiSetVisible(UI.window.notification, true)
      showCursor(true)
      break
    end
  end
end
;({
  state = false,
  width = 500 * (guiGetScreenSize() / 1080),
  height = 500 * (guiGetScreenSize() / 1080),
  anim = {
    getTickCount(),
    0,
    -500,
    200,
    0,
    true
  },
  alpha = 0,
  x = (guiGetScreenSize() - 500 * (guiGetScreenSize() / 1080)) / 2,
  y = -500 * (guiGetScreenSize() / 1080),
  hoveredButton = false,
  hoveredNoti = false,
  hoveredRemoveButton = false,
  savedNotifications = {},
  index_i = 1,
  index_f = 7
}).draw = function()
  if not unpack(var0.anim) and (getTickCount() - unpack(var0.anim)) / 1000 >= 1 then
    removeEventHandler("onClientRender", root, var0.draw)
  end
  var0.alpha, var0.y = animation(unpack(var0.anim))
  dxDrawRoundedRectangle(var0.x, var0.y, var0.width, var0.height, tocolor(6, 9, 14, 245), 8, true, {
    up = {right = false, left = false},
    down = {right = true, left = true}
  })
  dxDrawRectangle(var0.x + (var0.width - var0.width / 2) / 2, var0.y + var0.height - 2, var0.width / 2, 3, var1, true)
  dxDrawImage(var0.x + 165 * var2, var0.y + 10 * var2, 25 * var2, 25 * var2, "icons/notification.png", 0, 0, 0, tocolor(255, 255, 255, 200), true)
  dxDrawText("Notifications (" .. tostring(#var0.savedNotifications) .. ")", var0.x + 200 * var2, var0.y, var0.x + var0.width, var0.y + 50 * var2, tocolor(255, 255, 255), 1, directive.font, "left", "center", false, false, true, false, false)
  if 6 < #var0.savedNotifications then
    dxDrawRoundedRectangle(var0.x + var0.width - 15 * var2, var0.y + 70 * var2 + 2 + (var0.index_i - 1) / #var0.savedNotifications * (var0.height - 70 * var2), 5 * var2, 20 * var2, tocolor(255, 255, 255, 100), 2, true)
  end
  for forvar15 = var0.index_i, var0.index_f do
    if var0.savedNotifications[forvar15] then
      if isMouseInPosition(var0.x + 10 * var2, var0.y + 70 * var2, var0.width - 30 * var2, 55 * var2) then
        var0.hoveredNoti = var0.savedNotifications[forvar15].id
      end
      dxDrawRoundedRectangle(var0.x + 10 * var2, var0.y + 70 * var2, var0.width - 30 * var2, 55 * var2, tocolor(0, 0, 0, 255), 10, true)
      dxDrawImage(var0.x + 10 * var2 + 10 * var2, var0.y + 70 * var2 + 10 * var2, 25, 25, "icons/" .. var0.savedNotifications[forvar15].type .. ".png", 0, 0, 0, tocolor(255, 255, 255, 200 - (var0.savedNotifications[forvar15].read == 1 and 100 or 0)), true)
      dxDrawText("#6e6e6e" .. var0.savedNotifications[forvar15].createdAt .. [[

#ffffff]] .. var0.savedNotifications[forvar15].title, var0.x + 60 * var2, var0.y + 70 * var2, var0.x + 10 * var2 + (var0.width - 20 * var2), var0.y + 70 * var2 + 55 * var2, tocolor(255, 255, 255, 255 - (var0.savedNotifications[forvar15].read == 1 and 100 or 0)), 1, var3, "left", "center", false, false, true, true, false)
      if var0.hoveredNoti == var0.savedNotifications[forvar15].id then
        var0.hoveredRemoveButton = isMouseInPosition(var0.x + 10 * var2 + (var0.width - 30 * var2) - 30 * var2, var0.y + 70 * var2 + 10 * var2, 18 * var2, 18 * var2)
        if not isMouseInPosition(var0.x + 10 * var2 + (var0.width - 30 * var2) - 30 * var2, var0.y + 70 * var2 + 10 * var2, 18 * var2, 18 * var2) or not tocolor(255, 0, 0, 255) then
        end
        dxDrawImage(var0.x + 10 * var2 + (var0.width - 30 * var2) - 30 * var2, var0.y + 70 * var2 + 10 * var2, 18 * var2, 18 * var2, "icons/remove.png", 0, 0, 0, tocolor(255, 255, 255, 100), true)
      end
      if var0.savedNotifications[forvar15].read == 0 then
        dxDrawCircle(var0.x + 10 * var2 + 10 * var2, var0.y + 70 * var2 + 10 * var2, 5 * var2, 0, 360, tocolor(255, 0, 0), _, 20, _, true)
      end
    end
  end
  if not true then
    var0.hoveredNoti = false
    var0.hoveredRemoveButton = false
  end
end
function isMouseInPosition(arg0, arg1, arg2, arg3)
  if isCursorShowing() and arg0 <= getCursorPosition() * var0 and arg1 <= getCursorPosition() * var1 and getCursorPosition() * var0 <= arg0 + arg2 and getCursorPosition() * var1 <= arg1 + arg3 then
    return true
  end
  return false
end
function animation(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8)
  return interpolateBetween(arg2, arg3, arg4, arg5, arg6, arg7, (getTickCount() - arg0) / (arg0 + arg1 - arg0), arg8)
end
