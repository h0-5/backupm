-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

function goodWindowTint()
  for forvar3, forvar4 in ipairs(getElementsByType("vehicle", root, true)) do
    if getElementData(forvar4, "tinted") then
      tintWindow(forvar4, true)
    end
  end
end
function startTheRes()
  if getElementData(localPlayer, "character:id") then
    goodWindowTint()
  end
end
addEventHandler("onClientResourceStart", resourceRoot, startTheRes)
function tintWindow(arg0, arg1)
  if arg1 then
    if not var0[arg0] then
      engineApplyShaderToWorldTexture(var1, "vehiclegeneric256", arg0)
      engineApplyShaderToWorldTexture(var1, "hotdog92glass128", arg0)
      engineApplyShaderToWorldTexture(var1, "okoshko", arg0)
      engineApplyShaderToWorldTexture(var1, "@hite", arg0)
      var0[arg0] = true
      addEventHandler("onClientElementStreamOut", arg0, onStreamOut)
      addEventHandler("onClientElementDestroy", arg0, onStreamOut)
    end
  elseif var0[arg0] then
    engineRemoveShaderFromWorldTexture(var1, "vehiclegeneric256", arg0)
    engineRemoveShaderFromWorldTexture(var1, "hotdog92glass128", arg0)
    engineRemoveShaderFromWorldTexture(var1, "okoshko", arg0)
    engineRemoveShaderFromWorldTexture(var1, "@hite", arg0)
    var0[arg0] = false
    removeEventHandler("onClientElementStreamOut", arg0, onStreamOut)
    removeEventHandler("onClientElementDestroy", arg0, onStreamOut)
  end
end
addEventHandler("onClientElementStreamIn", root, function()
  if getElementType(source) == "vehicle" then
    if getElementData(source, "tinted") then
      tintWindow(source, true)
    else
      tintWindow(source, false)
    end
  end
end)
function onStreamOut()
  tintWindow(source, false)
end
addEventHandler("onClientElementDataChange", root, function(arg0, arg1, arg2)
  if arg0 == "tinted" then
    if not isElementStreamedIn(source) then
      return
    end
    tintWindow(source, arg2)
  end
end)
