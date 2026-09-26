-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

function RenderWindow()
  dxDrawRectangle((var1 - 660 * var0) / 2, (var2 - 425 * var0) / 2 + 20 * var0, 660 * var0, 425 * var0 - 20 * var0, tocolor(0, 0, 0, 240), var3)
  dxDrawRectangle((var1 - 660 * var0) / 2, (var2 - 425 * var0) / 2, 660 * var0, 20 * var0, tocolor(0, 50, 220, 255), var3)
  dxDrawEmptyLine((var1 - 660 * var0) / 2, (var2 - 425 * var0) / 2, 660 * var0, 425 * var0, tocolor(0, 50, 220, 255), 2, var3)
  if var4 == "Choose" then
    dxDrawText([[
Choose The Red Characters
By Pressing 'Enter']], (var1 - 660 * var0) / 2 + 20 * var0, 34.3 * var0, (var1 - 660 * var0) / 2 + 100 * var0, 34.3 * var0 + 425 * var0, tocolor(255, 0, 0, 200), 1, "default-bold", "center", "center", true, false, var3, false, false)
    dxDrawText("Time Left:\n" .. msToTimeStr(hackTime) .. [[

Remaining Attempts: ]] .. tostring(var5), (var1 - 660 * var0) / 2, (var2 - 425 * var0) / 2, (var1 - 660 * var0) / 2 + 660 * var0, (var2 - 425 * var0) / 2 + 100 * var0, tocolor(255, 0, 0, 200), 1, "default-bold", "center", "center", true, false, var3, false, false)
    dxSetRenderTarget(var6, true)
    for forvar12 = 0, #var7 - 1 do
      if var8 - 1 == forvar12 then
        var9[forvar12 + 1].ScrollY = anim(var9[forvar12 + 1].Count, var10, 110, 0, 0, 0, 30 * var0 * #var9[forvar12 + 1].Chars - var11, 0, 0, 0, "Linear")
        if getTickCount() - var9[forvar12 + 1].Count >= 15000 and getTickCount() - var9[forvar12 + 1].Count <= 15500 then
          var9[forvar12 + 1].Count = getTickCount()
        end
      end
      for forvar17 = 0, #var9[forvar12 + 1].Chars - 1 do
        if var9[forvar12 + 1].Chars[forvar17 + 1] == var7[forvar12 + 1] then
          if var8 - 1 == forvar12 then
            if (var2 - 425 * var0) / 2 + (425 * var0 - 250 * var0) / 2 + 30 * var0 + var9[forvar12 + 1].ScrollY + 120 * var0 >= (var2 - 425 * var0) / 2 + 425 * var0 / 2 + 15 * var0 + 30 * var0 * forvar17 and (var2 - 425 * var0) / 2 + (425 * var0 - 250 * var0) / 2 + 30 * var0 + var9[forvar12 + 1].ScrollY + 100 * var0 <= (var2 - 425 * var0) / 2 + 425 * var0 / 2 + 15 * var0 + 30 * var0 * forvar17 then
              var9[forvar12 + 1].isTargetChar = true
            elseif (var2 - 425 * var0) / 2 + (425 * var0 - 250 * var0) / 2 + 30 * var0 + var9[forvar12 + 1].ScrollY + 120 * var0 >= (var2 - 425 * var0) / 2 + 425 * var0 / 2 + 15 * var0 + 30 * var0 * forvar17 and (var2 - 425 * var0) / 2 + (425 * var0 - 250 * var0) / 2 + 30 * var0 + var9[forvar12 + 1].ScrollY + 100 * var0 > (var2 - 425 * var0) / 2 + 425 * var0 / 2 + 15 * var0 + 30 * var0 * forvar17 then
              var9[forvar12 + 1].isTargetChar = false
            end
          end
          dxDrawText("" .. var9[forvar12 + 1].Chars[forvar17 + 1], (var1 - 660 * var0) / 2 + (660 * var0 - 500 * var0) / 2 + (50 * var0 + 10 * var0) * forvar12, (var2 - 425 * var0) / 2 + 425 * var0 / 2 + 15 * var0 + 30 * var0 * forvar17 - var9[forvar12 + 1].ScrollY, (var1 - 660 * var0) / 2 + (660 * var0 - 500 * var0) / 2 + (50 * var0 + 10 * var0) * forvar12 + 50 * var0, (var2 - 425 * var0) / 2 + 425 * var0 / 2 + 15 * var0 + 30 * var0 * forvar17 + 30 * var0 - var9[forvar12 + 1].ScrollY, tocolor(255, 0, 0, 200), 2.5, "default", "center", "center", true, false, var3, false, false)
        else
          dxDrawText("" .. var9[forvar12 + 1].Chars[forvar17 + 1], (var1 - 660 * var0) / 2 + (660 * var0 - 500 * var0) / 2 + (50 * var0 + 10 * var0) * forvar12, (var2 - 425 * var0) / 2 + 425 * var0 / 2 + 15 * var0 + 30 * var0 * forvar17 - var9[forvar12 + 1].ScrollY, (var1 - 660 * var0) / 2 + (660 * var0 - 500 * var0) / 2 + (50 * var0 + 10 * var0) * forvar12 + 50 * var0, (var2 - 425 * var0) / 2 + 425 * var0 / 2 + 15 * var0 + 30 * var0 * forvar17 + 30 * var0 - var9[forvar12 + 1].ScrollY, tocolor(255, 255, 255, 200), 2.5, "default", "center", "center", true, false, var3, false, false)
        end
      end
    end
    _FOR_()
    dxDrawImageSection((var1 - 660 * var0) / 2 + (660 * var0 - 500 * var0) / 2, (var2 - 425 * var0) / 2 + (425 * var0 - 250 * var0) / 2 + 30 * var0, 500 * var0, 250 * var0, (var1 - 660 * var0) / 2 + (660 * var0 - 500 * var0) / 2, (var2 - 425 * var0) / 2 + (425 * var0 - 250 * var0) / 2 + 30 * var0, 500 * var12, 250 * var0, var6, 0, 0, 0, tocolor(255, 255, 255, 255), true)
    dxDrawRectangle((var1 - 660 * var0) / 2 + (660 * var0 - 500 * var0) / 2, (var2 - 425 * var0) / 2 + 425 * var0 / 2 + 15 * var0, 500 * var0, 30 * var0, tocolor(0, 0, 255, 20), var3)
    dxDrawLine((var1 - 660 * var0) / 2 + (660 * var0 - 500 * var0) / 2, (var2 - 425 * var0) / 2 + 425 * var0 / 2 + 15 * var0, (var1 - 660 * var0) / 2 + (660 * var0 - 500 * var0) / 2 + 500 * var0, (var2 - 425 * var0) / 2 + 425 * var0 / 2 + 15 * var0, tocolor(0, 0, 255, 90), 2, var3)
    dxDrawLine((var1 - 660 * var0) / 2 + (660 * var0 - 500 * var0) / 2, (var2 - 425 * var0) / 2 + 425 * var0 / 2 + 45 * var0, (var1 - 660 * var0) / 2 + (660 * var0 - 500 * var0) / 2 + 500 * var0, (var2 - 425 * var0) / 2 + 425 * var0 / 2 + 45 * var0, tocolor(0, 0, 255, 90), 2, var3)
    dxDrawRectangle((var1 - 660 * var0) / 2 + (660 * var0 - 500 * var0) / 2 + (35 * var0 + 10 * var0) * (var8 - 1), (var2 - 425 * var0) / 2 + (425 * var0 - 250 * var0) / 2 + 30 * var0, 35 * var0, 250 * var0, tocolor(0, 255, 0, 20), var3)
    dxDrawLine((var1 - 660 * var0) / 2 + (660 * var0 - 500 * var0) / 2 + (35 * var0 + 10 * var0) * (var8 - 1), (var2 - 425 * var0) / 2 + (425 * var0 - 250 * var0) / 2 + 30 * var0, (var1 - 660 * var0) / 2 + (660 * var0 - 500 * var0) / 2 + (35 * var0 + 10 * var0) * (var8 - 1), (var2 - 425 * var0) / 2 + (425 * var0 - 250 * var0) / 2 + 30 * var0 + 250 * var0, tocolor(0, 255, 0, 90), 2, var3)
    dxDrawLine((var1 - 660 * var0) / 2 + (660 * var0 - 500 * var0) / 2 + (35 * var0 + 10 * var0) * (var8 - 1) + 35 * var0, (var2 - 425 * var0) / 2 + (425 * var0 - 250 * var0) / 2 + 30 * var0, (var1 - 660 * var0) / 2 + (660 * var0 - 500 * var0) / 2 + (35 * var0 + 10 * var0) * (var8 - 1) + 35 * var0, (var2 - 425 * var0) / 2 + (425 * var0 - 250 * var0) / 2 + 30 * var0 + 250 * var0, tocolor(0, 255, 0, 90), 2, var3)
  elseif var4 == "Loss" then
    dxDrawText("You Loss", (var1 - 660 * var0) / 2, (var2 - 425 * var0) / 2, (var1 - 660 * var0) / 2 + 660 * var0, (var2 - 425 * var0) / 2 + 425 * var0, tocolor(255, 0, 0, 200), 2, "default-bold", "center", "center", true, false, var3, false, false)
  elseif var4 == "Win" then
    dxDrawText("Done!", (var1 - 660 * var0) / 2, (var2 - 425 * var0) / 2, (var1 - 660 * var0) / 2 + 660 * var0, (var2 - 425 * var0) / 2 + 425 * var0, tocolor(255, 0, 0, 200), 2, "default-bold", "center", "center", true, false, var3, false, false)
  end
end
function showWindow(arg0)
  if arg0 then
    for forvar4 = 1, #var0 do
      var0[forvar4].ScrollY = var1 + math.random(100, 250)
    end
    var2 = _FOR_
    var0[var2].Count = getTickCount()
    resetHackWindow()
    var3 = 3
    var4 = "Choose"
    if isElement(var5) then
      destroyElement(var5)
    end
    var5 = dxCreateRenderTarget(var6, var7 + var7, true)
    addEventHandler("onClientRender", root, RenderWindow)
    bindKey("enter", "down", ChooseChar)
  else
    removeEventHandler("onClientRender", root, RenderWindow)
    if isElement(var5) then
      destroyElement(var5)
    end
    unbindKey("enter", "down", ChooseChar)
  end
  showCursor(arg0)
  var8 = arg0
end
function startHack(arg0)
  var0 = var1
  if arg0.speed then
    var0 = arg0.speed
  end
  showWindow(true)
end
function stopHack()
  showWindow(false)
end
function dxDrawEmptyLine(arg0, arg1, arg2, arg3, arg4, arg5, arg6)
  dxDrawLine(arg0, arg1, arg0 + arg2, arg1, arg4, arg5, arg6)
  dxDrawLine(arg0, arg1, arg0, arg1 + arg3, arg4, arg5, arg6)
  dxDrawLine(arg0, arg1 + arg3, arg0 + arg2, arg1 + arg3, arg4, arg5, arg6)
  dxDrawLine(arg0 + arg2, arg1, arg0 + arg2, arg1 + arg3, arg4, arg5, arg6)
end
function anim(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10)
  return interpolateBetween(arg2, arg3, arg4, arg6, arg7, arg8, (getTickCount() - arg0) / (arg0 + arg1 - arg0), arg10)
end
function ChooseChar()
  if var0[var1].isTargetChar then
    if var1 == #var2 then
      var3 = "Win"
      if isTimer(hackTimer) then
        killTimer(hackTimer)
      end
      onMinigameEnd(true)
      setTimer(showWindow, 3000, 1, false)
    else
      var1 = var1 + 1
      var0[var1].Count = getTickCount()
    end
  else
    var4 = var4 - 1
    if var4 <= 0 then
      var3 = "Loss"
      onMinigameEnd(false)
      setTimer(showWindow, 3000, 1, false)
    end
    resetHackWindow()
  end
end
function resetHackWindow()
  var0 = 1
  var1 = {
    [1] = {
      Count = getTickCount(),
      isTargetChar = false,
      ScrollY = var2,
      Chars = var3
    },
    [2] = {
      Count = getTickCount(),
      isTargetChar = false,
      ScrollY = var2,
      Chars = var3
    },
    [3] = {
      Count = getTickCount(),
      isTargetChar = false,
      ScrollY = var2,
      Chars = var3
    },
    [4] = {
      Count = getTickCount(),
      isTargetChar = false,
      ScrollY = var2,
      Chars = var3
    },
    [5] = {
      Count = getTickCount(),
      isTargetChar = false,
      ScrollY = var2,
      Chars = var3
    },
    [6] = {
      Count = getTickCount(),
      isTargetChar = false,
      ScrollY = var2,
      Chars = var3
    },
    [7] = {
      Count = getTickCount(),
      isTargetChar = false,
      ScrollY = var2,
      Chars = var3
    },
    [8] = {
      Count = getTickCount(),
      isTargetChar = false,
      ScrollY = var2,
      Chars = var3
    },
    [9] = {
      Count = getTickCount(),
      isTargetChar = false,
      ScrollY = var2,
      Chars = var3
    },
    [10] = {
      Count = getTickCount(),
      isTargetChar = false,
      ScrollY = var2,
      Chars = var3
    },
    [11] = {
      Count = getTickCount(),
      isTargetChar = false,
      ScrollY = var2,
      Chars = var3
    }
  }
end
function msToTimeStr(arg0)
  if tonumber(arg0) and arg0 >= 0 then
    arg0 = tonumber(arg0)
    arg0 = math.floor(arg0)
    if not arg0 then
      return ""
    end
    if arg0 < 0 then
      return "00", "00", "00"
    end
    if #tostring(math.fmod(arg0, 60)) == 1 then
    end
    if #tostring(math.fmod(math.floor(arg0 / 60), 60)) == 1 then
    end
    if #tostring(math.floor(arg0 / 3600)) == 1 then
    end
    return ("0" .. tostring(math.floor(arg0 / 3600))) .. ":" .. ("0" .. tostring(math.fmod(math.floor(arg0 / 60), 60))) .. ":" .. "0" .. tostring(math.fmod(arg0, 60))
  else
    return "00:00:00"
  end
end
