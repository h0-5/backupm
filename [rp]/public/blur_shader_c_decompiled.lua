-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

addEventHandler("onClientResourceStart", resourceRoot, function()
  if getVersion().sortable < "1.1.0" then
    outputDebugString("Resource is not compatible with this client.")
    return
  else
    blurShader, blurTec = dxCreateShader("shaders/BlurShader.fx")
    blurShaderblack, blurTec = dxCreateShader("shaders/BlurShaderBlack.fx")
  end
end)
function drawBlurShader()
  if var0.Shader then
    dxUpdateScreenSource(var1)
    dxSetShaderValue(var0.Shader, "ScreenSource", var1)
    var0.Anim[4] = animation(var0.Anim[1], var0.Anim[5], var0.Anim[2], 0, 0, var0.Anim[3], 0, 0, "Linear")
    dxDrawImage(0, 0, var2, var3, var0.Shader, 0, 0, 0, tocolor(255, 255, 255, var0.Anim[4]))
    dxDrawImage(0, 0, var2, var3, var1, 0, 0, 0, tocolor(255, 255, 255, var0.Anim[4]))
    if math.abs(getTickCount() - var0.Anim[1]) >= var0.Anim[5] and var0.Anim[4] == 255 then
      removeEventHandler("onClientHUDRender", root, drawBlurShader)
    end
  end
end
function setBlurShaderVisible(arg0, arg1, arg2, arg3, arg4)
  if arg0 then
    removeEventHandler("onClientHUDRender", root, drawBlurShader)
    addEventHandler("onClientHUDRender", root, drawBlurShader)
    if arg1 then
      var0.Anim[1] = getTickCount()
      var0.Anim[2] = 255
      var0.Anim[3] = 0
      var0.Anim[5] = arg4 or 1000
    end
    var0.Strength = arg2 or 4
    if arg3 == "blurShaderblack" then
      var0.Shader = blurShaderblack
    else
      var0.Shader = arg3 or blurShader
    end
    dxSetShaderValue(var0.Shader, "BlurStrength", var0.Strength)
    dxSetShaderValue(var0.Shader, "UVSize", var1, var2)
  elseif arg1 then
    var0.Anim[1] = getTickCount()
    var0.Anim[2] = 0
    var0.Anim[3] = 255
    var0.Anim[5] = arg4 or 1000
  else
    removeEventHandler("onClientHUDRender", root, drawBlurShader)
  end
end
function animation(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8)
  return interpolateBetween(arg2, arg3, arg4, arg5, arg6, arg7, (getTickCount() - arg0) / (arg0 + arg1 - arg0), arg8)
end
