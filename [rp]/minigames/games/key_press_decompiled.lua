-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

function startKeyPressGame(arg0)
  var0 = ""
  var1.press_progress = {
    count = getTickCount(),
    from = 0,
    to = 0,
    duration = 500,
    current = 0
  }
  var1.time_progress = {
    count = getTickCount(),
    from = 100,
    to = 0,
    duration = arg0.time or 5000,
    current = 100
  }
  if not var2 then
    var2 = true
    bindKey(var3, "down", var4)
    addEventHandler("onClientRender", root, var5)
  end
end
function stopKeyPressGame()
  if var0 then
    var0 = false
    unbindKey(var1, "down", var2)
    removeEventHandler("onClientRender", root, var3)
  end
end
