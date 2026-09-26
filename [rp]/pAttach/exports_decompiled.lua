-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

if isElement(localPlayer) then
  function attach(...)
    return pAttach:attach(...)
  end
  addEvent("pAttach:attach", true)
  addEventHandler("pAttach:attach", resourceRoot, attach)
  function detach(...)
    return pAttach:detach(...)
  end
  addEvent("pAttach:detach", true)
  addEventHandler("pAttach:detach", resourceRoot, detach)
  function detachAll(...)
    return pAttach:detachAll(...)
  end
  addEvent("pAttach:detachAll", true)
  addEventHandler("pAttach:detachAll", resourceRoot, detachAll)
  function setPositionOffset(...)
    return pAttach:setPositionOffset(...)
  end
  addEvent("pAttach:setPositionOffset", true)
  addEventHandler("pAttach:setPositionOffset", resourceRoot, setPositionOffset)
  function setRotationOffset(...)
    return pAttach:setRotationOffset(...)
  end
  addEvent("pAttach:setRotationOffset", true)
  addEventHandler("pAttach:setRotationOffset", resourceRoot, setRotationOffset)
  function setPed(...)
    return pAttach:setPed(...)
  end
  addEvent("pAttach:setPed", true)
  addEventHandler("pAttach:setPed", resourceRoot, setPed)
  function setBone(...)
    return pAttach:setBone(...)
  end
  addEvent("pAttach:setBone", true)
  addEventHandler("pAttach:setBone", resourceRoot, setBone)
  function setVisible(...)
    return pAttach:setVisible(...)
  end
  function setVisibleAll(...)
    return pAttach:setVisibleAll(...)
  end
  function invisibleAll(...)
    return pAttach:invisibleAll(...)
  end
  function isAttached(...)
    return pAttach:isAttached(...)
  end
  function setDetails(...)
    return pAttach:setDetails(...)
  end
  function getDetails(...)
    return pAttach:getDetails(...)
  end
  function getAttacheds(...)
    return pAttach:getAttacheds(...)
  end
else
  function attach(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8)
    assert(isElement(arg0), "Expected element at argument 1, got " .. type(arg0))
    var0[arg0] = {
      arg0,
      arg1,
      arg2,
      arg3 or 0,
      arg4 or 0,
      arg5 or 0,
      arg6 or 0,
      arg7 or 0,
      arg8 or 0
    }
    return triggerClientEvent("pAttach:attach", resourceRoot, arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8)
  end
  function detach(arg0)
    assert(isElement(arg0), "Expected element at argument 1, got " .. type(arg0))
    var0[arg0] = nil
    return triggerClientEvent("pAttach:detach", resourceRoot, arg0)
  end
  function detachAll(arg0)
    assert(isElement(arg0), "Expected element at argument 1, got " .. type(arg0))
    for forvar4, forvar5 in pairs(var0) do
      if forvar5[2] == arg0 then
        var0[forvar4] = nil
      end
    end
    return triggerClientEvent("pAttach:detachAll", resourceRoot, arg0)
  end
  function setPositionOffset(arg0, arg1, arg2, arg3)
    assert(isElement(arg0), "Expected element at argument 1, got " .. type(arg0))
    var0[arg0][4] = arg1 or 0
    var0[arg0][5] = arg2 or 0
    var0[arg0][6] = arg3 or 0
    return triggerClientEvent("pAttach:setPositionOffset", resourceRoot, arg0, arg1, arg2, arg3)
  end
  function setRotationOffset(arg0, arg1, arg2, arg3)
    assert(isElement(arg0), "Expected element at argument 1, got " .. type(arg0))
    var0[arg0][7] = arg1 or 0
    var0[arg0][8] = arg2 or 0
    var0[arg0][9] = arg3 or 0
    return triggerClientEvent("pAttach:setRotationOffset", resourceRoot, arg0, arg1, arg2, arg3)
  end
  function setPed(arg0, arg1)
    assert(isElement(arg0), "Expected element at argument 1, got " .. type(arg0))
    assert(isElement(arg1), "Expected element at argument 2, got " .. type(arg1))
    var0[arg0][2] = arg1
    return triggerClientEvent("pAttach:setPed", resourceRoot, arg0, arg1)
  end
  function setBone(arg0, arg1)
    assert(isElement(arg0), "Expected element at argument 1, got " .. type(arg0))
    var0[arg0][3] = arg1
    return triggerClientEvent("pAttach:setBone", resourceRoot, arg0, arg1)
  end
  function setVisible(arg0, arg1)
    assert(isElement(arg0), "Expected element at argument 1, got " .. type(arg0))
    return setElementAlpha(arg0, arg1 and 255 or 0)
  end
  function setVisibleAll(arg0, arg1)
    assert(isElement(arg0), "Expected element at argument 1, got " .. type(arg0))
    for forvar5, forvar6 in pairs(var0) do
      if forvar6[2] == arg0 then
        setVisible(forvar5, arg1)
      end
    end
    return true
  end
  function invisibleAll(arg0, arg1)
    assert(isElement(arg0), "Expected element at argument 1, got " .. type(arg0))
    return setVisibleAll(arg0, not arg1)
  end
  function isAttached(arg0)
    assert(isElement(arg0), "Expected element at argument 1, got " .. type(arg0))
    return var0[arg0] and true or false
  end
  function setDetails(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8)
    assert(isElement(arg0), "Expected element at argument 1, got " .. type(arg0))
    var0[arg0] = {
      arg0,
      arg1 or getDetails(arg0)[2],
      arg2 or getDetails(arg0)[3],
      arg3 or getDetails(arg0)[4],
      arg4 or getDetails(arg0)[5],
      arg5 or getDetails(arg0)[6],
      arg6 or getDetails(arg0)[7],
      arg7 or getDetails(arg0)[8],
      arg8 or getDetails(arg0)[9]
    }
    return triggerClientEvent("pAttach:setDetails", resourceRoot, arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8)
  end
  function getDetails(arg0)
    assert(isElement(arg0), "Expected element at argument 1, got " .. type(arg0))
    return var0[arg0] or false
  end
  function getAttacheds(arg0)
    assert(isElement(arg0), "Expected element at argument 1, got " .. type(element))
    for forvar5, forvar6 in pairs(var0) do
      if forvar6[2] == arg0 then
        ({})[#{} + 1] = forvar5
      end
    end
    return {}
  end
  addEventHandler("onPlayerResourceStart", root, function(arg0)
    if arg0 ~= resource then
      return
    end
    triggerClientEvent(source, "pAttach:receiveCache", resourceRoot, var0)
  end)
  addEventHandler("onPlayerQuit", root, function()
    detachAll(source)
  end)
  addEventHandler("onElementDestroy", root, function()
    if var0[source] then
      detach(source)
    elseif getElementType(source) == "ped" then
      for forvar3, forvar4 in pairs(var0) do
        if forvar4[2] == source then
          var0[forvar3] = nil
        end
      end
    end
  end)
end
