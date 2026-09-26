-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

pAttach = {
  instances = {},
  pedInstances = {},
  inStreamPeds = {},
  preparedToRenderInstances = {},
  pedsProcessedAdded = false,
  attach = function(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9)
    assert(var0(arg2), "Expected element at argument 2, got " .. type(arg2))
    assert((boneIDNames[arg3] or tonumber(arg3) or false) and boneIDs[boneIDNames[arg3] or tonumber(arg3) or false], "Expected valid bone-id or bone-name at argument 3, got " .. tostring(arg3) .. ". Check available bones in README.md")
    if arg0:isAttached(arg1) then
      return false
    end
    if arg1 ~= localPlayer then
      var2(arg1, 0, 0, 10000)
    end
    var3(arg1, var4(arg2))
    var5(arg1, var6(arg2))
    var7(arg1, false)
    if not arg0.pedInstances[arg2] then
      arg0.pedInstances[arg2] = {
        count = 1,
        pedType = var1(arg2),
        list = {}
      }
      if arg2 ~= localPlayer then
        addEventHandler("onClientElementStreamIn", arg2, arg0.onStreamIn)
        addEventHandler("onClientElementStreamOut", arg2, arg0.onStreamOut)
        if var1(arg2) == "ped" then
          addEventHandler("onClientElementDestroy", arg2, arg0.onPedDestroy)
        end
      end
      addEventHandler("onClientElementDimensionChange", arg2, arg0.onDimensionChange)
      addEventHandler("onClientElementInteriorChange", arg2, arg0.onInteriorChange)
    else
      ({
        count = 1,
        pedType = var1(arg2),
        list = {}
      }).count = ({
        count = 1,
        pedType = var1(arg2),
        list = {}
      }).count + 1
    end
    ;({
      count = 1,
      pedType = var1(arg2),
      list = {}
    }).list[arg1] = {
      element = arg1,
      elementType = var1(arg1),
      ped = arg2,
      boneid = boneIDNames[arg3] or tonumber(arg3) or false,
      _boneid = arg3,
      ox = arg4 or 0,
      oy = arg5 or 0,
      oz = arg6 or 0,
      rx = arg7 or 0,
      ry = arg8 or 0,
      rz = arg9 or 0,
      rotMat = arg0:calculateRotMat(arg7 or 0, arg8 or 0, arg9 or 0)
    }
    arg0.instances[arg1] = arg2
    if arg2 == localPlayer or var8(arg2) then
      if arg0.inStreamPeds[arg2] then
        arg0:refreshRender()
      else
        arg0:addToStream(arg2)
      end
    end
    addEventHandler("onClientElementDestroy", arg1, arg0.onElementDestroy)
    if var1(arg1) == "player" then
      addEventHandler("onClientPlayerQuit", arg1, arg0.onElementDestroy)
    end
    return true
  end,
  detach = function(arg0, arg1)
    if not arg0:isAttached(arg1) then
      return false
    end
    arg0.pedInstances[arg0.instances[arg1]].count = arg0.pedInstances[arg0.instances[arg1]].count - 1
    if arg0.pedInstances[arg0.instances[arg1]].count == 0 then
      if var0(arg0.instances[arg1]) then
        removeEventHandler("onClientElementStreamIn", arg0.instances[arg1], arg0.onStreamIn)
        removeEventHandler("onClientElementStreamOut", arg0.instances[arg1], arg0.onStreamOut)
        removeEventHandler("onClientElementDimensionChange", arg0.instances[arg1], arg0.onDimensionChange)
        removeEventHandler("onClientElementInteriorChange", arg0.instances[arg1], arg0.onInteriorChange)
        if arg0.pedInstances[arg0.instances[arg1]].pedType == "ped" then
          removeEventHandler("onClientElementDestroy", arg0.instances[arg1], arg0.onPedDestroy)
        end
      end
      arg0.pedInstances[arg0.instances[arg1]] = nil
      arg0:removeFromStream(arg0.instances[arg1])
    else
      arg0.pedInstances[arg0.instances[arg1]].list[arg1] = nil
      arg0:refreshRender()
    end
    removeEventHandler("onClientElementDestroy", arg1, arg0.onElementDestroy)
    if getElementType(arg1) == "player" then
      removeEventHandler("onClientPlayerQuit", arg1, arg0.onElementDestroy)
    end
    arg0.instances[arg1] = nil
    var1(arg1, true)
    return true
  end,
  detachAll = function(arg0, arg1)
    assert(var0(arg1), "Expected element at argument 1, got " .. type(arg1))
    if arg0.pedInstances[arg1] then
      for forvar5 in pairs(arg0.pedInstances[arg1].list) do
        arg0:detach(forvar5)
      end
    end
    return true
  end,
  isAttached = function(arg0, arg1)
    return arg1 and arg0.instances[arg1] and true or false
  end,
  setDetails = function(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9)
    assert(var0(arg1), "Expected element at argument 1, got " .. type(arg1))
    if not arg0:isAttached(arg1) then
      return false
    end
    if arg2 then
      arg0:setPed(arg1, arg2)
    end
    if arg3 then
      arg0:setBone(arg1, arg3)
    end
    arg0:setPositionOffset(arg1, arg4 or arg0:getDetails(arg1)[4], arg5 or arg0:getDetails(arg1)[5], arg6 or arg0:getDetails(arg1)[6])
    arg0:setRotationOffset(arg1, arg7 or arg0:getDetails(arg1)[7], arg8 or arg0:getDetails(arg1)[8], arg9 or arg0:getDetails(arg1)[9])
    return true
  end,
  getDetails = function(arg0, arg1)
    assert(var0(arg1), "Expected element at argument 1, got " .. type(arg1))
    if not arg0:isAttached(arg1) then
      return false
    end
    return arg0.pedInstances[arg0.instances[arg1]].list[arg1] and {
      arg0.pedInstances[arg0.instances[arg1]].list[arg1].element,
      arg0.pedInstances[arg0.instances[arg1]].list[arg1].ped,
      arg0.pedInstances[arg0.instances[arg1]].list[arg1]._boneid,
      arg0.pedInstances[arg0.instances[arg1]].list[arg1].ox,
      arg0.pedInstances[arg0.instances[arg1]].list[arg1].oy,
      arg0.pedInstances[arg0.instances[arg1]].list[arg1].oz,
      arg0.pedInstances[arg0.instances[arg1]].list[arg1].rx,
      arg0.pedInstances[arg0.instances[arg1]].list[arg1].ry,
      arg0.pedInstances[arg0.instances[arg1]].list[arg1].rz
    } or false
  end,
  getAttacheds = function(arg0, arg1)
    assert(var0(arg1), "Expected element at argument 1, got " .. type(arg1))
    if arg0.pedInstances[arg1] then
      for forvar6 in pairs(arg0.pedInstances[arg1].list) do
        ({})[#{} + 1] = forvar6
      end
    end
    return {}
  end,
  setPositionOffset = function(arg0, arg1, arg2, arg3, arg4)
    assert(var0(arg1), "Expected element at argument 1, got " .. type(arg1))
    if not arg0:isAttached(arg1) then
      return false
    end
    arg0.pedInstances[arg0.instances[arg1]].list[arg1].ox = arg2 or 0
    arg0.pedInstances[arg0.instances[arg1]].list[arg1].oy = arg3 or 0
    arg0.pedInstances[arg0.instances[arg1]].list[arg1].oz = arg4 or 0
    return true
  end,
  setRotationOffset = function(arg0, arg1, arg2, arg3, arg4)
    assert(var0(arg1), "Expected element at argument 1, got " .. type(arg1))
    if not arg0:isAttached(arg1) then
      return false
    end
    arg0.pedInstances[arg0.instances[arg1]].list[arg1].rx = arg2 or 0
    arg0.pedInstances[arg0.instances[arg1]].list[arg1].ry = arg3 or 0
    arg0.pedInstances[arg0.instances[arg1]].list[arg1].rz = arg4 or 0
    arg0.pedInstances[arg0.instances[arg1]].list[arg1].rotMat = arg0:calculateRotMat(arg2 or 0, arg3 or 0, arg4 or 0)
    return true
  end,
  setBone = function(arg0, arg1, arg2)
    assert(var0(arg1), "Expected element at argument 1, got " .. type(arg1))
    assert((boneIDNames[arg2] or tonumber(arg2) or false) and boneIDs[boneIDNames[arg2] or tonumber(arg2) or false], "Expected valid bone-id or bone-name at argument 2, got " .. tostring(arg2) .. ". Check available bones in README.md")
    if not arg0:isAttached(arg1) then
      return false
    end
    arg0.pedInstances[arg0.instances[arg1]].list[arg1].boneid, arg0.pedInstances[arg0.instances[arg1]].list[arg1]._boneid = boneIDNames[arg2] or tonumber(arg2) or false, arg2
    return true
  end,
  setPed = function(arg0, arg1, arg2)
    assert(var0(arg1), "Expected element at argument 1, got " .. type(arg1))
    assert(var0(arg2), "Expected element at argument 2, got " .. type(arg2))
    if not arg0:isAttached(arg1) then
      return false
    end
    arg0:detach(arg1)
    arg0:attach(arg1, arg2, arg0:getDetails(arg1)[3], arg0:getDetails(arg1)[4], arg0:getDetails(arg1)[5], arg0:getDetails(arg1)[6], arg0:getDetails(arg1)[7], arg0:getDetails(arg1)[8], arg0:getDetails(arg1)[9])
    return true
  end,
  setVisible = function(arg0, arg1, arg2)
    assert(var0(arg1), "Expected element at argument 1, got " .. type(ped))
    if not arg0:isAttached(arg1) then
      return false
    end
    return var1(arg1, arg2 and 255 or 0)
  end,
  setVisibleAll = function(arg0, arg1, arg2)
    assert(var0(arg1), "Expected element at argument 1, got " .. type(arg1))
    if arg0.pedInstances[arg1] then
      for forvar6 in pairs(arg0.pedInstances[arg1].list) do
        arg0:setVisible(forvar6, arg2)
      end
    end
    return true
  end,
  invisibleAll = function(arg0, arg1, arg2)
    arg0:setVisibleAll(arg1, not arg2)
  end,
  addToStream = function(arg0, arg1)
    if not arg0.inStreamPeds[arg1] then
      arg0.inStreamPeds[arg1] = true
      if arg0.pedInstances[arg1] then
        arg0:refreshRender()
      end
      return true
    end
    return false
  end,
  removeFromStream = function(arg0, arg1)
    if arg0.inStreamPeds[arg1] then
      if arg0.pedInstances[arg1] then
        for forvar5, forvar6 in pairs(arg0.pedInstances[arg1].list) do
          if forvar6.elementType ~= "player" then
            var0(forvar5, 0, 0, 10000)
          end
        end
      end
      arg0.inStreamPeds[arg1] = nil
      arg0:refreshRender()
      return true
    end
    return false
  end,
  onStreamIn = function()
    pAttach:addToStream(source)
  end,
  onStreamOut = function()
    pAttach:removeFromStream(source)
  end,
  onDimensionChange = function(arg0, arg1)
    if pAttach.pedInstances[source] then
      for forvar5 in pairs(pAttach.pedInstances[source].list) do
        var0(forvar5, arg1)
      end
    end
  end,
  onInteriorChange = function(arg0, arg1)
    if pAttach.pedInstances[source] then
      for forvar5 in pairs(pAttach.pedInstances[source].list) do
        var0(forvar5, arg1)
      end
    end
  end,
  onElementDestroy = function()
    pAttach:detach(source)
  end,
  onPedDestroy = function()
    pAttach:detachAll(source)
  end,
  refreshRender = function(arg0)
    for forvar6 in pairs(arg0.inStreamPeds) do
      for forvar10, forvar11 in pairs(arg0.pedInstances[forvar6].list) do
        ({})[0 + 1] = forvar11
      end
    end
    arg0.preparedToRenderInstances = {}
    if 0 < 0 + 1 and not arg0.pedsProcessedAdded then
      addEventHandler("onClientPedsProcessed", root, arg0.onPedsProcessed)
      arg0.pedsProcessedAdded = true
    elseif 0 + 1 == 0 and arg0.pedsProcessedAdded then
      removeEventHandler("onClientPedsProcessed", root, arg0.onPedsProcessed)
      arg0.pedsProcessedAdded = false
    end
    return true
  end,
  calculateRotMat = function(arg0, arg1, arg2, arg3)
    return {
      {
        var1((var0(arg3))) * var1((var0(arg2))) * var1((var0(arg1))) + var2((var0(arg3))) * var2((var0(arg1))),
        var1((var0(arg3))) * var2((var0(arg2))),
        var1((var0(arg3))) * var1((var0(arg2))) * var2((var0(arg1))) - var2((var0(arg3))) * var1((var0(arg1)))
      },
      {
        var2((var0(arg3))) * var1((var0(arg2))) * var1((var0(arg1))) - var1((var0(arg3))) * var2((var0(arg1))),
        var2((var0(arg3))) * var2((var0(arg2))),
        var2((var0(arg3))) * var1((var0(arg2))) * var2((var0(arg1))) + var1((var0(arg3))) * var1((var0(arg1)))
      },
      {
        var2((var0(arg2))) * var1((var0(arg1))),
        -var1((var0(arg2))),
        var2((var0(arg2))) * var2((var0(arg1)))
      }
    }
  end,
  onPedsProcessed = function()
    for forvar4 = 1, #pAttach.preparedToRenderInstances do
      if var0(pAttach.preparedToRenderInstances[forvar4].ped) then
        if not ({})[pAttach.preparedToRenderInstances[forvar4].ped] then
          ({})[pAttach.preparedToRenderInstances[forvar4].ped] = {}
        end
        if not ({})[pAttach.preparedToRenderInstances[forvar4].boneid] then
          ({})[pAttach.preparedToRenderInstances[forvar4].boneid] = var1(pAttach.preparedToRenderInstances[forvar4].ped, pAttach.preparedToRenderInstances[forvar4].boneid)
        else
        end
        if ({})[pAttach.preparedToRenderInstances[forvar4].boneid] then
          var2(pAttach.preparedToRenderInstances[forvar4].element, {
            {
              ({})[pAttach.preparedToRenderInstances[forvar4].boneid][2][1] * pAttach.preparedToRenderInstances[forvar4].rotMat[1][2] + ({})[pAttach.preparedToRenderInstances[forvar4].boneid][1][1] * pAttach.preparedToRenderInstances[forvar4].rotMat[1][1] + pAttach.preparedToRenderInstances[forvar4].rotMat[1][3] * ({})[pAttach.preparedToRenderInstances[forvar4].boneid][3][1],
              ({})[pAttach.preparedToRenderInstances[forvar4].boneid][3][2] * pAttach.preparedToRenderInstances[forvar4].rotMat[1][3] + ({})[pAttach.preparedToRenderInstances[forvar4].boneid][1][2] * pAttach.preparedToRenderInstances[forvar4].rotMat[1][1] + ({})[pAttach.preparedToRenderInstances[forvar4].boneid][2][2] * pAttach.preparedToRenderInstances[forvar4].rotMat[1][2],
              ({})[pAttach.preparedToRenderInstances[forvar4].boneid][2][3] * pAttach.preparedToRenderInstances[forvar4].rotMat[1][2] + ({})[pAttach.preparedToRenderInstances[forvar4].boneid][3][3] * pAttach.preparedToRenderInstances[forvar4].rotMat[1][3] + pAttach.preparedToRenderInstances[forvar4].rotMat[1][1] * ({})[pAttach.preparedToRenderInstances[forvar4].boneid][1][3],
              0
            },
            {
              pAttach.preparedToRenderInstances[forvar4].rotMat[2][3] * ({})[pAttach.preparedToRenderInstances[forvar4].boneid][3][1] + ({})[pAttach.preparedToRenderInstances[forvar4].boneid][2][1] * pAttach.preparedToRenderInstances[forvar4].rotMat[2][2] + pAttach.preparedToRenderInstances[forvar4].rotMat[2][1] * ({})[pAttach.preparedToRenderInstances[forvar4].boneid][1][1],
              ({})[pAttach.preparedToRenderInstances[forvar4].boneid][3][2] * pAttach.preparedToRenderInstances[forvar4].rotMat[2][3] + ({})[pAttach.preparedToRenderInstances[forvar4].boneid][2][2] * pAttach.preparedToRenderInstances[forvar4].rotMat[2][2] + ({})[pAttach.preparedToRenderInstances[forvar4].boneid][1][2] * pAttach.preparedToRenderInstances[forvar4].rotMat[2][1],
              pAttach.preparedToRenderInstances[forvar4].rotMat[2][1] * ({})[pAttach.preparedToRenderInstances[forvar4].boneid][1][3] + ({})[pAttach.preparedToRenderInstances[forvar4].boneid][3][3] * pAttach.preparedToRenderInstances[forvar4].rotMat[2][3] + ({})[pAttach.preparedToRenderInstances[forvar4].boneid][2][3] * pAttach.preparedToRenderInstances[forvar4].rotMat[2][2],
              0
            },
            {
              ({})[pAttach.preparedToRenderInstances[forvar4].boneid][2][1] * pAttach.preparedToRenderInstances[forvar4].rotMat[3][2] + pAttach.preparedToRenderInstances[forvar4].rotMat[3][3] * ({})[pAttach.preparedToRenderInstances[forvar4].boneid][3][1] + pAttach.preparedToRenderInstances[forvar4].rotMat[3][1] * ({})[pAttach.preparedToRenderInstances[forvar4].boneid][1][1],
              ({})[pAttach.preparedToRenderInstances[forvar4].boneid][3][2] * pAttach.preparedToRenderInstances[forvar4].rotMat[3][3] + ({})[pAttach.preparedToRenderInstances[forvar4].boneid][2][2] * pAttach.preparedToRenderInstances[forvar4].rotMat[3][2] + pAttach.preparedToRenderInstances[forvar4].rotMat[3][1] * ({})[pAttach.preparedToRenderInstances[forvar4].boneid][1][2],
              pAttach.preparedToRenderInstances[forvar4].rotMat[3][1] * ({})[pAttach.preparedToRenderInstances[forvar4].boneid][1][3] + ({})[pAttach.preparedToRenderInstances[forvar4].boneid][3][3] * pAttach.preparedToRenderInstances[forvar4].rotMat[3][3] + ({})[pAttach.preparedToRenderInstances[forvar4].boneid][2][3] * pAttach.preparedToRenderInstances[forvar4].rotMat[3][2],
              0
            },
            {
              pAttach.preparedToRenderInstances[forvar4].oz * ({})[pAttach.preparedToRenderInstances[forvar4].boneid][1][1] + pAttach.preparedToRenderInstances[forvar4].oy * ({})[pAttach.preparedToRenderInstances[forvar4].boneid][2][1] - pAttach.preparedToRenderInstances[forvar4].ox * ({})[pAttach.preparedToRenderInstances[forvar4].boneid][3][1] + ({})[pAttach.preparedToRenderInstances[forvar4].boneid][4][1],
              pAttach.preparedToRenderInstances[forvar4].oz * ({})[pAttach.preparedToRenderInstances[forvar4].boneid][1][2] + pAttach.preparedToRenderInstances[forvar4].oy * ({})[pAttach.preparedToRenderInstances[forvar4].boneid][2][2] - pAttach.preparedToRenderInstances[forvar4].ox * ({})[pAttach.preparedToRenderInstances[forvar4].boneid][3][2] + ({})[pAttach.preparedToRenderInstances[forvar4].boneid][4][2],
              pAttach.preparedToRenderInstances[forvar4].oz * ({})[pAttach.preparedToRenderInstances[forvar4].boneid][1][3] + pAttach.preparedToRenderInstances[forvar4].oy * ({})[pAttach.preparedToRenderInstances[forvar4].boneid][2][3] - pAttach.preparedToRenderInstances[forvar4].ox * ({})[pAttach.preparedToRenderInstances[forvar4].boneid][3][3] + ({})[pAttach.preparedToRenderInstances[forvar4].boneid][4][3],
              1
            }
          })
          pAttach.preparedToRenderInstances[forvar4].prevOutOfScreen = false
        end
      elseif not pAttach.preparedToRenderInstances[forvar4].prevOutOfScreen then
        var3(pAttach.preparedToRenderInstances[forvar4].element, 0, 0, 10000)
        pAttach.preparedToRenderInstances[forvar4].prevOutOfScreen = true
      end
    end
  end
}
boneIDs = {
  [1] = true,
  [2] = true,
  [3] = true,
  [4] = true,
  [5] = true,
  [6] = true,
  [7] = true,
  [8] = true,
  [21] = true,
  [22] = true,
  [23] = true,
  [24] = true,
  [25] = true,
  [26] = true,
  [31] = true,
  [32] = true,
  [33] = true,
  [34] = true,
  [35] = true,
  [36] = true,
  [41] = true,
  [42] = true,
  [43] = true,
  [44] = true,
  [51] = true,
  [52] = true,
  [53] = true,
  [54] = true
}
boneIDNames = {
  ["pelvis"] = 1,
  ["pelvis2"] = 2,
  ["spine"] = 3,
  ["neck"] = 4,
  ["head"] = 5,
  ["head2"] = 6,
  ["head3"] = 7,
  ["jaw"] = 8,
  ["right-upper-torso"] = 21,
  ["right-shoulder"] = 22,
  ["right-elbow"] = 23,
  ["right-wrist"] = 24,
  ["right-hand"] = 25,
  ["right-thumb"] = 26,
  ["left-upper-torso"] = 31,
  ["left-shoulder"] = 32,
  ["left-elbow"] = 33,
  ["left-wrist"] = 34,
  ["left-hand"] = 35,
  ["left-thumb"] = 36,
  ["left-hip"] = 41,
  ["left-knee"] = 42,
  ["left-tankle"] = 43,
  ["left-foot"] = 44,
  ["right-hip"] = 51,
  ["right-knee"] = 52,
  ["right-tankle"] = 53,
  ["right-foot"] = 54,
  ["backpack"] = 3,
  ["weapon"] = 24
}
addEvent("pAttach:receiveCache", true)
addEventHandler("pAttach:receiveCache", resourceRoot, function(arg0)
  for forvar4, forvar5 in pairs(arg0) do
    pAttach:attach(unpack(forvar5))
  end
end)
