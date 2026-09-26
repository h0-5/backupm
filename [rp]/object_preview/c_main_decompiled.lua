-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

objectPreview = {}
objectPreview_mt = {__index = objectPreview}
refOPTable = {}
function objectPreview.create(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11)
  if arg9 == false then
    arg5, arg6, arg7, arg8 = arg5 / var0, arg6 / var1, arg7 / var0, arg8 / var1
  end
  setElementAlpha(({
    element = arg1,
    elementType = "ped",
    alpha = 255,
    elementRadius = 0,
    elementPosition = {
      getCameraMatrix()
    },
    elementRotation = {
      arg2,
      arg3,
      arg4
    },
    elementRotationOffsets = {
      0,
      0,
      0
    },
    elementPositionOffsets = {
      0,
      0,
      0
    },
    zDistanceSpread = 0,
    projection = {
      arg5,
      arg6,
      arg7,
      arg8,
      arg10,
      arg9
    },
    shader = nil,
    isSecondRT = arg11,
    isUpdate = false,
    renID = findEmptyEntry(refOPTable)
  }).element, 254)
  setElementStreamable(({
    element = arg1,
    elementType = "ped",
    alpha = 255,
    elementRadius = 0,
    elementPosition = {
      getCameraMatrix()
    },
    elementRotation = {
      arg2,
      arg3,
      arg4
    },
    elementRotationOffsets = {
      0,
      0,
      0
    },
    elementPositionOffsets = {
      0,
      0,
      0
    },
    zDistanceSpread = 0,
    projection = {
      arg5,
      arg6,
      arg7,
      arg8,
      arg10,
      arg9
    },
    shader = nil,
    isSecondRT = arg11,
    isUpdate = false,
    renID = findEmptyEntry(refOPTable)
  }).element, false)
  setElementFrozen(({
    element = arg1,
    elementType = "ped",
    alpha = 255,
    elementRadius = 0,
    elementPosition = {
      getCameraMatrix()
    },
    elementRotation = {
      arg2,
      arg3,
      arg4
    },
    elementRotationOffsets = {
      0,
      0,
      0
    },
    elementPositionOffsets = {
      0,
      0,
      0
    },
    zDistanceSpread = 0,
    projection = {
      arg5,
      arg6,
      arg7,
      arg8,
      arg10,
      arg9
    },
    shader = nil,
    isSecondRT = arg11,
    isUpdate = false,
    renID = findEmptyEntry(refOPTable)
  }).element, true)
  setElementCollisionsEnabled(({
    element = arg1,
    elementType = "ped",
    alpha = 255,
    elementRadius = 0,
    elementPosition = {
      getCameraMatrix()
    },
    elementRotation = {
      arg2,
      arg3,
      arg4
    },
    elementRotationOffsets = {
      0,
      0,
      0
    },
    elementPositionOffsets = {
      0,
      0,
      0
    },
    zDistanceSpread = 0,
    projection = {
      arg5,
      arg6,
      arg7,
      arg8,
      arg10,
      arg9
    },
    shader = nil,
    isSecondRT = arg11,
    isUpdate = false,
    renID = findEmptyEntry(refOPTable)
  }).element, false)
  if "ped" == "vehicle" then
    ({
      element = arg1,
      elementType = "ped",
      alpha = 255,
      elementRadius = 0,
      elementPosition = {
        getCameraMatrix()
      },
      elementRotation = {
        arg2,
        arg3,
        arg4
      },
      elementRotationOffsets = {
        0,
        0,
        0
      },
      elementPositionOffsets = {
        0,
        0,
        0
      },
      zDistanceSpread = 0,
      projection = {
        arg5,
        arg6,
        arg7,
        arg8,
        arg10,
        arg9
      },
      shader = nil,
      isSecondRT = arg11,
      isUpdate = false,
      renID = findEmptyEntry(refOPTable)
    }).zDistanceSpread = -3.9
    for forvar20 = 0, 5 do
      setVehicleDoorState(({
        element = arg1,
        elementType = "ped",
        alpha = 255,
        elementRadius = 0,
        elementPosition = {
          getCameraMatrix()
        },
        elementRotation = {
          arg2,
          arg3,
          arg4
        },
        elementRotationOffsets = {
          0,
          0,
          0
        },
        elementPositionOffsets = {
          0,
          0,
          0
        },
        zDistanceSpread = 0,
        projection = {
          arg5,
          arg6,
          arg7,
          arg8,
          arg10,
          arg9
        },
        shader = nil,
        isSecondRT = arg11,
        isUpdate = false,
        renID = findEmptyEntry(refOPTable)
      }).element, forvar20, 0)
    end
  elseif "ped" == "ped" then
    ({
      element = arg1,
      elementType = "ped",
      alpha = 255,
      elementRadius = 0,
      elementPosition = {
        getCameraMatrix()
      },
      elementRotation = {
        arg2,
        arg3,
        arg4
      },
      elementRotationOffsets = {
        0,
        0,
        0
      },
      elementPositionOffsets = {
        0,
        0,
        0
      },
      zDistanceSpread = 0,
      projection = {
        arg5,
        arg6,
        arg7,
        arg8,
        arg10,
        arg9
      },
      shader = nil,
      isSecondRT = arg11,
      isUpdate = false,
      renID = findEmptyEntry(refOPTable)
    }).zDistanceSpread = -1
  else
    ({
      element = arg1,
      elementType = "ped",
      alpha = 255,
      elementRadius = 0,
      elementPosition = {
        getCameraMatrix()
      },
      elementRotation = {
        arg2,
        arg3,
        arg4
      },
      elementRotationOffsets = {
        0,
        0,
        0
      },
      elementPositionOffsets = {
        0,
        0,
        0
      },
      zDistanceSpread = 0,
      projection = {
        arg5,
        arg6,
        arg7,
        arg8,
        arg10,
        arg9
      },
      shader = nil,
      isSecondRT = arg11,
      isUpdate = false,
      renID = findEmptyEntry(refOPTable)
    }).zDistanceSpread = 3
  end
  ;({
    element = arg1,
    elementType = "ped",
    alpha = 255,
    elementRadius = 0,
    elementPosition = {
      getCameraMatrix()
    },
    elementRotation = {
      arg2,
      arg3,
      arg4
    },
    elementRotationOffsets = {
      0,
      0,
      0
    },
    elementPositionOffsets = {
      0,
      0,
      0
    },
    zDistanceSpread = 0,
    projection = {
      arg5,
      arg6,
      arg7,
      arg8,
      arg10,
      arg9
    },
    shader = nil,
    isSecondRT = arg11,
    isUpdate = false,
    renID = findEmptyEntry(refOPTable)
  }).elementRadius = math.max(returnMaxValue({
    getElementBoundingBox(({
      element = arg1,
      elementType = "ped",
      alpha = 255,
      elementRadius = 0,
      elementPosition = {
        getCameraMatrix()
      },
      elementRotation = {
        arg2,
        arg3,
        arg4
      },
      elementRotationOffsets = {
        0,
        0,
        0
      },
      elementPositionOffsets = {
        0,
        0,
        0
      },
      zDistanceSpread = 0,
      projection = {
        arg5,
        arg6,
        arg7,
        arg8,
        arg10,
        arg9
      },
      shader = nil,
      isSecondRT = arg11,
      isUpdate = false,
      renID = findEmptyEntry(refOPTable)
    }).element)
  }), 1)
  if getElementRadius(({
    element = arg1,
    elementType = "ped",
    alpha = 255,
    elementRadius = 0,
    elementPosition = {
      getCameraMatrix()
    },
    elementRotation = {
      arg2,
      arg3,
      arg4
    },
    elementRotationOffsets = {
      0,
      0,
      0
    },
    elementPositionOffsets = {
      0,
      0,
      0
    },
    zDistanceSpread = 0,
    projection = {
      arg5,
      arg6,
      arg7,
      arg8,
      arg10,
      arg9
    },
    shader = nil,
    isSecondRT = arg11,
    isUpdate = false,
    renID = findEmptyEntry(refOPTable)
  }).element) > ({
    element = arg1,
    elementType = "ped",
    alpha = 255,
    elementRadius = 0,
    elementPosition = {
      getCameraMatrix()
    },
    elementRotation = {
      arg2,
      arg3,
      arg4
    },
    elementRotationOffsets = {
      0,
      0,
      0
    },
    elementPositionOffsets = {
      0,
      0,
      0
    },
    zDistanceSpread = 0,
    projection = {
      arg5,
      arg6,
      arg7,
      arg8,
      arg10,
      arg9
    },
    shader = nil,
    isSecondRT = arg11,
    isUpdate = false,
    renID = findEmptyEntry(refOPTable)
  }).elementRadius then
    ({
      element = arg1,
      elementType = "ped",
      alpha = 255,
      elementRadius = 0,
      elementPosition = {
        getCameraMatrix()
      },
      elementRotation = {
        arg2,
        arg3,
        arg4
      },
      elementRotationOffsets = {
        0,
        0,
        0
      },
      elementPositionOffsets = {
        0,
        0,
        0
      },
      zDistanceSpread = 0,
      projection = {
        arg5,
        arg6,
        arg7,
        arg8,
        arg10,
        arg9
      },
      shader = nil,
      isSecondRT = arg11,
      isUpdate = false,
      renID = findEmptyEntry(refOPTable)
    }).elementRadius = getElementRadius(({
      element = arg1,
      elementType = "ped",
      alpha = 255,
      elementRadius = 0,
      elementPosition = {
        getCameraMatrix()
      },
      elementRotation = {
        arg2,
        arg3,
        arg4
      },
      elementRotationOffsets = {
        0,
        0,
        0
      },
      elementPositionOffsets = {
        0,
        0,
        0
      },
      zDistanceSpread = 0,
      projection = {
        arg5,
        arg6,
        arg7,
        arg8,
        arg10,
        arg9
      },
      shader = nil,
      isSecondRT = arg11,
      isUpdate = false,
      renID = findEmptyEntry(refOPTable)
    }).element)
  end
  if ({
    element = arg1,
    elementType = "ped",
    alpha = 255,
    elementRadius = 0,
    elementPosition = {
      getCameraMatrix()
    },
    elementRotation = {
      arg2,
      arg3,
      arg4
    },
    elementRotationOffsets = {
      0,
      0,
      0
    },
    elementPositionOffsets = {
      0,
      0,
      0
    },
    zDistanceSpread = 0,
    projection = {
      arg5,
      arg6,
      arg7,
      arg8,
      arg10,
      arg9
    },
    shader = nil,
    isSecondRT = arg11,
    isUpdate = false,
    renID = findEmptyEntry(refOPTable)
  }).isSecondRT then
    if not var2 then
      return false
    end
    ;({
      element = arg1,
      elementType = "ped",
      alpha = 255,
      elementRadius = 0,
      elementPosition = {
        getCameraMatrix()
      },
      elementRotation = {
        arg2,
        arg3,
        arg4
      },
      elementRotationOffsets = {
        0,
        0,
        0
      },
      elementPositionOffsets = {
        0,
        0,
        0
      },
      zDistanceSpread = 0,
      projection = {
        arg5,
        arg6,
        arg7,
        arg8,
        arg10,
        arg9
      },
      shader = nil,
      isSecondRT = arg11,
      isUpdate = false,
      renID = findEmptyEntry(refOPTable)
    }).shader = dxCreateShader("fx/fx_pre_" .. "ped" .. ".fx", 0, 0, false, "all")
    if not var3 then
      var3 = dxCreateRenderTarget(var0, var1, true)
    end
  else
    ({
      element = arg1,
      elementType = "ped",
      alpha = 255,
      elementRadius = 0,
      elementPosition = {
        getCameraMatrix()
      },
      elementRotation = {
        arg2,
        arg3,
        arg4
      },
      elementRotationOffsets = {
        0,
        0,
        0
      },
      elementPositionOffsets = {
        0,
        0,
        0
      },
      zDistanceSpread = 0,
      projection = {
        arg5,
        arg6,
        arg7,
        arg8,
        arg10,
        arg9
      },
      shader = nil,
      isSecondRT = arg11,
      isUpdate = false,
      renID = findEmptyEntry(refOPTable)
    }).shader = dxCreateShader("fx/fx_pre_" .. "ped" .. "_noMRT.fx", 0, 0, false, "all")
  end
  if not ({
    element = arg1,
    elementType = "ped",
    alpha = 255,
    elementRadius = 0,
    elementPosition = {
      getCameraMatrix()
    },
    elementRotation = {
      arg2,
      arg3,
      arg4
    },
    elementRotationOffsets = {
      0,
      0,
      0
    },
    elementPositionOffsets = {
      0,
      0,
      0
    },
    zDistanceSpread = 0,
    projection = {
      arg5,
      arg6,
      arg7,
      arg8,
      arg10,
      arg9
    },
    shader = nil,
    isSecondRT = arg11,
    isUpdate = false,
    renID = findEmptyEntry(refOPTable)
  }).shader then
    return false
  end
  if var2 and var3 and ({
    element = arg1,
    elementType = "ped",
    alpha = 255,
    elementRadius = 0,
    elementPosition = {
      getCameraMatrix()
    },
    elementRotation = {
      arg2,
      arg3,
      arg4
    },
    elementRotationOffsets = {
      0,
      0,
      0
    },
    elementPositionOffsets = {
      0,
      0,
      0
    },
    zDistanceSpread = 0,
    projection = {
      arg5,
      arg6,
      arg7,
      arg8,
      arg10,
      arg9
    },
    shader = nil,
    isSecondRT = arg11,
    isUpdate = false,
    renID = findEmptyEntry(refOPTable)
  }).isSecondRT then
    dxSetShaderValue(({
      element = arg1,
      elementType = "ped",
      alpha = 255,
      elementRadius = 0,
      elementPosition = {
        getCameraMatrix()
      },
      elementRotation = {
        arg2,
        arg3,
        arg4
      },
      elementRotationOffsets = {
        0,
        0,
        0
      },
      elementPositionOffsets = {
        0,
        0,
        0
      },
      zDistanceSpread = 0,
      projection = {
        arg5,
        arg6,
        arg7,
        arg8,
        arg10,
        arg9
      },
      shader = nil,
      isSecondRT = arg11,
      isUpdate = false,
      renID = findEmptyEntry(refOPTable)
    }).shader, "secondRT", var3)
  end
  dxSetShaderValue(({
    element = arg1,
    elementType = "ped",
    alpha = 255,
    elementRadius = 0,
    elementPosition = {
      getCameraMatrix()
    },
    elementRotation = {
      arg2,
      arg3,
      arg4
    },
    elementRotationOffsets = {
      0,
      0,
      0
    },
    elementPositionOffsets = {
      0,
      0,
      0
    },
    zDistanceSpread = 0,
    projection = {
      arg5,
      arg6,
      arg7,
      arg8,
      arg10,
      arg9
    },
    shader = nil,
    isSecondRT = arg11,
    isUpdate = false,
    renID = findEmptyEntry(refOPTable)
  }).shader, "sFov", math.rad(var4))
  dxSetShaderValue(({
    element = arg1,
    elementType = "ped",
    alpha = 255,
    elementRadius = 0,
    elementPosition = {
      getCameraMatrix()
    },
    elementRotation = {
      arg2,
      arg3,
      arg4
    },
    elementRotationOffsets = {
      0,
      0,
      0
    },
    elementPositionOffsets = {
      0,
      0,
      0
    },
    zDistanceSpread = 0,
    projection = {
      arg5,
      arg6,
      arg7,
      arg8,
      arg10,
      arg9
    },
    shader = nil,
    isSecondRT = arg11,
    isUpdate = false,
    renID = findEmptyEntry(refOPTable)
  }).shader, "sAspect", var1 / var0)
  engineApplyShaderToWorldTexture(({
    element = arg1,
    elementType = "ped",
    alpha = 255,
    elementRadius = 0,
    elementPosition = {
      getCameraMatrix()
    },
    elementRotation = {
      arg2,
      arg3,
      arg4
    },
    elementRotationOffsets = {
      0,
      0,
      0
    },
    elementPositionOffsets = {
      0,
      0,
      0
    },
    zDistanceSpread = 0,
    projection = {
      arg5,
      arg6,
      arg7,
      arg8,
      arg10,
      arg9
    },
    shader = nil,
    isSecondRT = arg11,
    isUpdate = false,
    renID = findEmptyEntry(refOPTable)
  }).shader, "*", ({
    element = arg1,
    elementType = "ped",
    alpha = 255,
    elementRadius = 0,
    elementPosition = {
      getCameraMatrix()
    },
    elementRotation = {
      arg2,
      arg3,
      arg4
    },
    elementRotationOffsets = {
      0,
      0,
      0
    },
    elementPositionOffsets = {
      0,
      0,
      0
    },
    zDistanceSpread = 0,
    projection = {
      arg5,
      arg6,
      arg7,
      arg8,
      arg10,
      arg9
    },
    shader = nil,
    isSecondRT = arg11,
    isUpdate = false,
    renID = findEmptyEntry(refOPTable)
  }).element)
  refOPTable[({
    element = arg1,
    elementType = "ped",
    alpha = 255,
    elementRadius = 0,
    elementPosition = {
      getCameraMatrix()
    },
    elementRotation = {
      arg2,
      arg3,
      arg4
    },
    elementRotationOffsets = {
      0,
      0,
      0
    },
    elementPositionOffsets = {
      0,
      0,
      0
    },
    zDistanceSpread = 0,
    projection = {
      arg5,
      arg6,
      arg7,
      arg8,
      arg10,
      arg9
    },
    shader = nil,
    isSecondRT = arg11,
    isUpdate = false,
    renID = findEmptyEntry(refOPTable)
  }).renID] = {}
  refOPTable[({
    element = arg1,
    elementType = "ped",
    alpha = 255,
    elementRadius = 0,
    elementPosition = {
      getCameraMatrix()
    },
    elementRotation = {
      arg2,
      arg3,
      arg4
    },
    elementRotationOffsets = {
      0,
      0,
      0
    },
    elementPositionOffsets = {
      0,
      0,
      0
    },
    zDistanceSpread = 0,
    projection = {
      arg5,
      arg6,
      arg7,
      arg8,
      arg10,
      arg9
    },
    shader = nil,
    isSecondRT = arg11,
    isUpdate = false,
    renID = findEmptyEntry(refOPTable)
  }).renID].enabled = true
  refOPTable[({
    element = arg1,
    elementType = "ped",
    alpha = 255,
    elementRadius = 0,
    elementPosition = {
      getCameraMatrix()
    },
    elementRotation = {
      arg2,
      arg3,
      arg4
    },
    elementRotationOffsets = {
      0,
      0,
      0
    },
    elementPositionOffsets = {
      0,
      0,
      0
    },
    zDistanceSpread = 0,
    projection = {
      arg5,
      arg6,
      arg7,
      arg8,
      arg10,
      arg9
    },
    shader = nil,
    isSecondRT = arg11,
    isUpdate = false,
    renID = findEmptyEntry(refOPTable)
  }).renID].isSecondRT = arg11
  refOPTable[({
    element = arg1,
    elementType = "ped",
    alpha = 255,
    elementRadius = 0,
    elementPosition = {
      getCameraMatrix()
    },
    elementRotation = {
      arg2,
      arg3,
      arg4
    },
    elementRotationOffsets = {
      0,
      0,
      0
    },
    elementPositionOffsets = {
      0,
      0,
      0
    },
    zDistanceSpread = 0,
    projection = {
      arg5,
      arg6,
      arg7,
      arg8,
      arg10,
      arg9
    },
    shader = nil,
    isSecondRT = arg11,
    isUpdate = false,
    renID = findEmptyEntry(refOPTable)
  }).renID].instance = {
    element = arg1,
    elementType = "ped",
    alpha = 255,
    elementRadius = 0,
    elementPosition = {
      getCameraMatrix()
    },
    elementRotation = {
      arg2,
      arg3,
      arg4
    },
    elementRotationOffsets = {
      0,
      0,
      0
    },
    elementPositionOffsets = {
      0,
      0,
      0
    },
    zDistanceSpread = 0,
    projection = {
      arg5,
      arg6,
      arg7,
      arg8,
      arg10,
      arg9
    },
    shader = nil,
    isSecondRT = arg11,
    isUpdate = false,
    renID = findEmptyEntry(refOPTable)
  }
  ;({
    element = arg1,
    elementType = "ped",
    alpha = 255,
    elementRadius = 0,
    elementPosition = {
      getCameraMatrix()
    },
    elementRotation = {
      arg2,
      arg3,
      arg4
    },
    elementRotationOffsets = {
      0,
      0,
      0
    },
    elementPositionOffsets = {
      0,
      0,
      0
    },
    zDistanceSpread = 0,
    projection = {
      arg5,
      arg6,
      arg7,
      arg8,
      arg10,
      arg9
    },
    shader = nil,
    isSecondRT = arg11,
    isUpdate = false,
    renID = findEmptyEntry(refOPTable)
  }).onPreRender = function()
    var0:update()
  end
  addEventHandler("onClientPreRender", root, ({
    element = arg1,
    elementType = "ped",
    alpha = 255,
    elementRadius = 0,
    elementPosition = {
      getCameraMatrix()
    },
    elementRotation = {
      arg2,
      arg3,
      arg4
    },
    elementRotationOffsets = {
      0,
      0,
      0
    },
    elementPositionOffsets = {
      0,
      0,
      0
    },
    zDistanceSpread = 0,
    projection = {
      arg5,
      arg6,
      arg7,
      arg8,
      arg10,
      arg9
    },
    shader = nil,
    isSecondRT = arg11,
    isUpdate = false,
    renID = findEmptyEntry(refOPTable)
  }).onPreRender, true, "low-5")
  setmetatable({
    element = arg1,
    elementType = "ped",
    alpha = 255,
    elementRadius = 0,
    elementPosition = {
      getCameraMatrix()
    },
    elementRotation = {
      arg2,
      arg3,
      arg4
    },
    elementRotationOffsets = {
      0,
      0,
      0
    },
    elementPositionOffsets = {
      0,
      0,
      0
    },
    zDistanceSpread = 0,
    projection = {
      arg5,
      arg6,
      arg7,
      arg8,
      arg10,
      arg9
    },
    shader = nil,
    isSecondRT = arg11,
    isUpdate = false,
    renID = findEmptyEntry(refOPTable)
  }, objectPreview_mt)
  return {
    element = arg1,
    elementType = "ped",
    alpha = 255,
    elementRadius = 0,
    elementPosition = {
      getCameraMatrix()
    },
    elementRotation = {
      arg2,
      arg3,
      arg4
    },
    elementRotationOffsets = {
      0,
      0,
      0
    },
    elementPositionOffsets = {
      0,
      0,
      0
    },
    zDistanceSpread = 0,
    projection = {
      arg5,
      arg6,
      arg7,
      arg8,
      arg10,
      arg9
    },
    shader = nil,
    isSecondRT = arg11,
    isUpdate = false,
    renID = findEmptyEntry(refOPTable)
  }
end
function objectPreview.setTxd(arg0, arg1)
  if arg1 then
    if not arg0.shader_temp then
      arg0.shader_temp = true
    end
    if isElement(arg0.shader) then
      destroyElement(arg0.shader)
    end
    arg0.shader = dxCreateShader("fx/fx_pre_ped_noMRT_tx.fx", 0, 0, false, "all")
    dxSetShaderValue(arg0.shader, "sFov", math.rad(var0))
    dxSetShaderValue(arg0.shader, "sAspect", var1 / var2)
    dxSetShaderValue(arg0.shader, "gTexture0", arg1)
    engineApplyShaderToWorldTexture(arg0.shader, "*", arg0.element)
  elseif arg0.shader_temp then
    if isElement(arg0.shader) then
      destroyElement(arg0.shader)
    end
    arg0.shader = dxCreateShader("fx/fx_pre_ped_noMRT.fx", 0, 0, false, "all")
    arg0.shader_temp = false
    dxSetShaderValue(arg0.shader, "sFov", math.rad(var0))
    dxSetShaderValue(arg0.shader, "sAspect", var1 / var2)
    engineApplyShaderToWorldTexture(arg0.shader, "*", arg0.element)
  end
end
function objectPreview.getID(arg0)
  return arg0.renID
end
function objectPreview.setAlpha(arg0, arg1)
  arg0.alpha = arg1
  arg0.isUpdate = false
  return setElementAlpha(arg0.element, arg0.alpha)
end
function objectPreview.destroy(arg0)
  if arg0.onPreRender then
    removeEventHandler("onClientPreRender", root, arg0.onPreRender)
  end
  arg0.onPreRender = nil
  refOPTable[arg0.renID].enabled = false
  refOPTable[arg0.renID].isSecondRT = false
  refOPTable[arg0.renID].instance = nil
  if arg0.shader then
    if isElement(arg0.element) then
      setTimer(function()
        if isElement(var0.element) then
          engineRemoveShaderFromWorldTexture(var0.shader, "*", var0.element)
        end
      end, 100, 1)
    end
    setTimer(destroyElement, 150, 1, arg0.shader)
    arg0.shader = nil
  end
  arg0.element = nil
end
function objectPreview.update(arg0)
  if not isElement(arg0.element) then
    return false
  end
  setElementPosition(arg0.element, getPositionFromMatrixOffset(getElementMatrix(getCamera()), {
    arg0.elementPositionOffsets[1],
    1.6 * arg0.elementRadius + arg0.zDistanceSpread + arg0.elementPositionOffsets[2],
    arg0.elementPositionOffsets[3]
  }) + (getCamVelocity() + ({
    getElementMatrix(getCamera())[2][1] * math.sqrt(math.pow(getCamVelocity()) + math.pow(getCamVelocity()) + math.pow(getCamVelocity())),
    getElementMatrix(getCamera())[2][2] * math.sqrt(math.pow(getCamVelocity()) + math.pow(getCamVelocity()) + math.pow(getCamVelocity())),
    getElementMatrix(getCamera())[2][3] * math.sqrt(math.pow(getCamVelocity()) + math.pow(getCamVelocity()) + math.pow(getCamVelocity()))
  })[1]), getPositionFromMatrixOffset(getElementMatrix(getCamera()), {
    arg0.elementPositionOffsets[1],
    1.6 * arg0.elementRadius + arg0.zDistanceSpread + arg0.elementPositionOffsets[2],
    arg0.elementPositionOffsets[3]
  }) + (getCamVelocity() + ({
    getElementMatrix(getCamera())[2][1] * math.sqrt(math.pow(getCamVelocity()) + math.pow(getCamVelocity()) + math.pow(getCamVelocity())),
    getElementMatrix(getCamera())[2][2] * math.sqrt(math.pow(getCamVelocity()) + math.pow(getCamVelocity()) + math.pow(getCamVelocity())),
    getElementMatrix(getCamera())[2][3] * math.sqrt(math.pow(getCamVelocity()) + math.pow(getCamVelocity()) + math.pow(getCamVelocity()))
  })[2]), getPositionFromMatrixOffset(getElementMatrix(getCamera()), {
    arg0.elementPositionOffsets[1],
    1.6 * arg0.elementRadius + arg0.zDistanceSpread + arg0.elementPositionOffsets[2],
    arg0.elementPositionOffsets[3]
  }) + (getCamVelocity() + ({
    getElementMatrix(getCamera())[2][1] * math.sqrt(math.pow(getCamVelocity()) + math.pow(getCamVelocity()) + math.pow(getCamVelocity())),
    getElementMatrix(getCamera())[2][2] * math.sqrt(math.pow(getCamVelocity()) + math.pow(getCamVelocity()) + math.pow(getCamVelocity())),
    getElementMatrix(getCamera())[2][3] * math.sqrt(math.pow(getCamVelocity()) + math.pow(getCamVelocity()) + math.pow(getCamVelocity()))
  })[3]))
  setElementRotation(arg0.element, getEulerAnglesFromMatrix((matrixMultiply(matrixMultiply(createElementMatrix(arg0.elementRotationOffsets, {
    0,
    0,
    0
  }), (createElementMatrix({
    0,
    0,
    0
  }, arg0.elementRotation))), (getElementMatrix(getCamera()))))))
  if arg0.shader then
    dxSetShaderValue(arg0.shader, "sCameraPosition", getElementMatrix(getCamera())[4])
    dxSetShaderValue(arg0.shader, "sCameraForward", getElementMatrix(getCamera())[2])
    dxSetShaderValue(arg0.shader, "sCameraUp", getElementMatrix(getCamera())[3])
    dxSetShaderValue(arg0.shader, "sElementOffset", 0, -arg0.zDistanceSpread, 0)
    dxSetShaderValue(arg0.shader, "sWorldOffset", -(getCamVelocity() + ({
      getElementMatrix(getCamera())[2][1] * math.sqrt(math.pow(getCamVelocity()) + math.pow(getCamVelocity()) + math.pow(getCamVelocity())),
      getElementMatrix(getCamera())[2][2] * math.sqrt(math.pow(getCamVelocity()) + math.pow(getCamVelocity()) + math.pow(getCamVelocity())),
      getElementMatrix(getCamera())[2][3] * math.sqrt(math.pow(getCamVelocity()) + math.pow(getCamVelocity()) + math.pow(getCamVelocity()))
    })[1]), -(getCamVelocity() + ({
      getElementMatrix(getCamera())[2][1] * math.sqrt(math.pow(getCamVelocity()) + math.pow(getCamVelocity()) + math.pow(getCamVelocity())),
      getElementMatrix(getCamera())[2][2] * math.sqrt(math.pow(getCamVelocity()) + math.pow(getCamVelocity()) + math.pow(getCamVelocity())),
      getElementMatrix(getCamera())[2][3] * math.sqrt(math.pow(getCamVelocity()) + math.pow(getCamVelocity()) + math.pow(getCamVelocity()))
    })[2]), -(getCamVelocity() + ({
      getElementMatrix(getCamera())[2][1] * math.sqrt(math.pow(getCamVelocity()) + math.pow(getCamVelocity()) + math.pow(getCamVelocity())),
      getElementMatrix(getCamera())[2][2] * math.sqrt(math.pow(getCamVelocity()) + math.pow(getCamVelocity()) + math.pow(getCamVelocity())),
      getElementMatrix(getCamera())[2][3] * math.sqrt(math.pow(getCamVelocity()) + math.pow(getCamVelocity()) + math.pow(getCamVelocity()))
    })[3]))
    dxSetShaderValue(arg0.shader, "sMoveObject2D", 2 * (unpack(arg0.projection) + unpack(arg0.projection) / 2 - 0.5), 2 * -(unpack(arg0.projection) + unpack(arg0.projection) / 2 - 0.5))
    dxSetShaderValue(arg0.shader, "sScaleObject2D", 2 * math.min(unpack(arg0.projection) / 2, unpack(arg0.projection) / 2), 2 * math.min(unpack(arg0.projection) / 2, unpack(arg0.projection) / 2))
    dxSetShaderValue(arg0.shader, "sProjZMult", 2)
    arg0.isUpdate = true
  end
end
function getCamVelocity()
  if getTickCount() - var0 < 100 then
    return var1[1], var1[2], var1[3]
  end
  var1 = {
    ({
      getElementPosition(getCamera())
    })[1] - var2[1],
    ({
      getElementPosition(getCamera())
    })[2] - var2[2],
    ({
      getElementPosition(getCamera())
    })[3] - var2[3]
  }
  var2 = {
    ({
      getElementPosition(getCamera())
    })[1],
    ({
      getElementPosition(getCamera())
    })[2],
    ({
      getElementPosition(getCamera())
    })[3]
  }
  return var1[1], var1[2], var1[3]
end
function objectPreview.saveToFile(arg0, arg1)
  if not var0 or not arg0.isSecondRT or not isElement(arg0.element) then
    return false
  end
  if var1 then
    if not dxGetTexturePixels(var1, toint(unpack(arg0.projection) * var2), toint(unpack(arg0.projection) * var3), toint(unpack(arg0.projection) * var2) + toint(unpack(arg0.projection) * var2), toint(unpack(arg0.projection) * var3) + toint(unpack(arg0.projection) * var3)) then
      return false
    end
    isValid = dxConvertPixels(dxGetTexturePixels(var1, toint(unpack(arg0.projection) * var2), toint(unpack(arg0.projection) * var3), toint(unpack(arg0.projection) * var2) + toint(unpack(arg0.projection) * var2), toint(unpack(arg0.projection) * var3) + toint(unpack(arg0.projection) * var3)), "png") and true
    isValid = fileWrite(fileCreate(arg1), (dxConvertPixels(dxGetTexturePixels(var1, toint(unpack(arg0.projection) * var2), toint(unpack(arg0.projection) * var3), toint(unpack(arg0.projection) * var2) + toint(unpack(arg0.projection) * var2), toint(unpack(arg0.projection) * var3) + toint(unpack(arg0.projection) * var3)), "png"))) and isValid
    isValid = fileClose((fileCreate(arg1))) and isValid
    if not isValid then
      return false
    end
    return isValid
  else
    return false
  end
  return false
end
function objectPreview.getImage(arg0)
  if not var0 or not arg0.isSecondRT or not isElement(arg0.element) then
    return false
  end
  outputChatBox("getImage   #2")
  if var1 then
    outputChatBox("getImage   #3")
    if not dxGetTexturePixels(var1, toint(unpack(arg0.projection) * var2), toint(unpack(arg0.projection) * var3), toint(unpack(arg0.projection) * var2) + toint(unpack(arg0.projection) * var2), toint(unpack(arg0.projection) * var3) + toint(unpack(arg0.projection) * var3)) then
      return false
    end
    outputChatBox("getImage   #4")
    return (dxConvertPixels(dxGetTexturePixels(var1, toint(unpack(arg0.projection) * var2), toint(unpack(arg0.projection) * var3), toint(unpack(arg0.projection) * var2) + toint(unpack(arg0.projection) * var2), toint(unpack(arg0.projection) * var3) + toint(unpack(arg0.projection) * var3)), "png"))
  else
    return false
  end
  return false
end
function objectPreview.drawRenderTarget(arg0)
  if not var0 or not arg0.isSecondRT then
    return false
  end
  if var1 then
    return dxDrawImageSection(unpack(arg0.projection) * var2, unpack(arg0.projection) * var3, unpack(arg0.projection) * var2, unpack(arg0.projection) * var3, unpack(arg0.projection) * var2, unpack(arg0.projection) * var3, unpack(arg0.projection) * var2, unpack(arg0.projection) * var3, var1, 0, 0, 0, tocolor(255, 255, 255, 255), unpack(arg0.projection))
  end
  return false
end
function objectPreview.setProjection(arg0, arg1, arg2, arg3, arg4, arg5, arg6)
  if arg0.projection then
    if arg6 == false then
      arg1, arg2, arg3, arg4 = arg1 / var0, arg2 / var1, arg3 / var0, arg4 / var1
    end
    arg0.isUpdate = false
    arg0.projection = {
      arg1,
      arg2,
      arg3,
      arg4,
      arg5,
      arg6
    }
  end
end
function objectPreview.setPostGui(arg0, arg1)
  if not arg0.isSecondRT then
    return false
  end
  if arg0.projection then
    arg0.isUpdate = false
    arg0.projection[5] = arg1
  end
end
function objectPreview.setRotation(arg0, arg1, arg2, arg3)
  if arg0.elementRotation then
    arg0.isUpdate = false
    arg0.elementRotation = {
      arg1,
      arg2,
      arg3
    }
  end
end
function objectPreview.setRotationOffsets(arg0, arg1, arg2, arg3)
  if arg0.elementRotationOffsets then
    arg0.isUpdate = false
    arg0.elementRotationOffsets = {
      arg1,
      arg2,
      arg3
    }
  end
end
function objectPreview.setDistanceSpread(arg0, arg1)
  if arg0.zDistanceSpread then
    arg0.isUpdate = false
    arg0.zDistanceSpread = arg1
  end
end
function objectPreview.setPositionOffsets(arg0, arg1, arg2, arg3)
  if arg0.elementPositionOffsets then
    arg0.isUpdate = false
    arg0.elementPositionOffsets = {
      arg1,
      arg2,
      arg3
    }
  end
end
function getRTarget()
  if not var0 then
    return false
  end
  if var1 then
    return var1
  else
    return false
  end
end
addEventHandler("onClientPreRender", root, function()
  if not var0 or #refOPTable == 0 then
    return
  end
  if var1 then
    dxSetRenderTarget(var1, true)
    dxSetRenderTarget()
  end
end, true, "low-5")
addEventHandler("onClientHUDRender", root, function()
  isMRTUsed = false
  if not var0 or #refOPTable == 0 then
    return
  end
  for forvar3, forvar4 in ipairs(refOPTable) do
    if refOPTable[forvar3] then
      if refOPTable[forvar3].isSecondRT then
        isMRTUsed = true
      end
      if refOPTable[forvar3].enabled and forvar4.instance then
        forvar4.instance:drawRenderTarget()
      end
    end
  end
  if isMRTUsed == false and var1 then
    destroyElement(var1)
    var1 = nil
  end
end, true, "low-10")
addEventHandler("onClientResourceStart", getResourceRootElement(getThisResource()), function()
  if not isMTAUpToDate("07331") then
    outputChatBox("Object preview: Update your MTA 1.5 client. Download at nightly.mtasa.com", 255, 0, 0)
    return
  end
  var0 = vCardNumRenderTargets() > 1
  if not var0 then
    outputChatBox("Object preview: Multiple RT in shader not supported", 255, 0, 0)
    return
  end
end)
