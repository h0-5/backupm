-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

function getFreecamVelocity()
  return var0, var1, var2
end
function setFreecamEnabled(arg0, arg1, arg2)
  if isFreecamEnabled() then
    return false
  end
  if arg0 and arg1 and arg2 then
    setCameraMatrix(arg0, arg1, arg2)
  end
  addEventHandler("onClientRender", root, var0)
  addEventHandler("onClientCursorMove", root, var1)
  var2 = true
  return true
end
function setFreecamDisabled()
  if not isFreecamEnabled() then
    return false
  end
  var0, var1, var2 = 0, 0, 0
  var3 = 0
  var4 = 0
  removeEventHandler("onClientRender", root, var5)
  removeEventHandler("onClientCursorMove", root, var6)
  var7 = false
  return true
end
function isFreecamEnabled()
  return var0
end
function getFreecamOption(arg0, arg1)
  return var0[arg0]
end
function setFreecamOption(arg0, arg1)
  if var0[arg0] ~= nil then
    var0[arg0] = arg1
    return true
  else
    return false
  end
end
addEvent("doSetFreecamEnabled", true)
addEventHandler("doSetFreecamEnabled", root, setFreecamEnabled)
addEvent("doSetFreecamDisabled", true)
addEventHandler("doSetFreecamDisabled", root, setFreecamDisabled)
addEvent("doSetFreecamOption")
addEventHandler("doSetFreecamOption", root, setFreecamOption)
