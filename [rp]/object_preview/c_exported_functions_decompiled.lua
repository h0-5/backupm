-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

function createObjectPreview(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, ...)
  if not isElement(arg0) then
    return false
  end
  if not getElementType(arg0) == "vehicle" and not getElementType(arg0) == "object" and not getElementType(arg0) == "ped" then
    return false
  end
  for forvar16, forvar17 in ipairs({
    arg1,
    arg2,
    arg3,
    arg4,
    arg5,
    arg6,
    arg7
  }) do
  end
  if not (true and forvar17 ~= nil and type(forvar17) == "number") or #{
    ...
  } > 3 or #{
    arg1,
    arg2,
    arg3,
    arg4,
    arg5,
    arg6,
    arg7
  } ~= 7 or 0 + 1 ~= 7 then
    return false
  end
  if objectPreview:create(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, ({
    ...
  })[1], ({
    ...
  })[2], ({
    ...
  })[3]) then
    return createElement("SOVelement", tostring(objectPreview:create(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, ({
      ...
    })[1], ({
      ...
    })[2], ({
      ...
    })[3]):getID()))
  else
    return false
  end
end
function destroyObjectPreview(arg0)
  if not isElement(arg0) then
    return false
  end
  if type((tonumber(getElementID(arg0)))) == "number" and true then
    if refOPTable[tonumber(getElementID(arg0))] and refOPTable[tonumber(getElementID(arg0))].enabled and refOPTable[tonumber(getElementID(arg0))].instance then
      return refOPTable[tonumber(getElementID(arg0))].instance:destroy()
    end
    return false
  else
    return false
  end
end
function getRTTAsImage(arg0)
  if not isElement(arg0) then
    return false
  end
  if not dxGetStatus().AllowScreenUpload then
    return false
  end
  if refOPTable[tonumber(getElementID(arg0))] then
    if refOPTable[tonumber(getElementID(arg0))].enabled and refOPTable[tonumber(getElementID(arg0))].instance then
      return refOPTable[tonumber(getElementID(arg0))].instance:getImage()
    end
    return false
  else
    return false
  end
end
function saveRTToFile(arg0, arg1)
  if not isElement(arg0) then
    return false
  end
  if not dxGetStatus().AllowScreenUpload then
    return false
  end
  if type(arg1) ~= "string" then
    return false
  end
  if string.sub(arg1, string.len(arg1) - 3, (string.len(arg1))) ~= ".png" then
    return false
  end
  if 1 > string.len((string.sub(arg1, string.len(1, string.len(arg1) - 4)))) then
    return false
  end
  if refOPTable[tonumber(getElementID(arg0))] then
    if refOPTable[tonumber(getElementID(arg0))].enabled and refOPTable[tonumber(getElementID(arg0))].instance then
      return refOPTable[tonumber(getElementID(arg0))].instance:saveToFile(":" .. getResourceName(sourceResource) .. "/" .. arg1)
    end
    return false
  else
    return false
  end
end
function setRotation(arg0, arg1, arg2, arg3)
  if not isElement(arg0) then
    return false
  end
  for forvar11, forvar12 in ipairs({
    tonumber(getElementID(arg0)),
    arg1,
    arg2,
    arg3
  }) do
  end
  if true and forvar12 and type(forvar12) == "number" and 0 + 1 == 4 then
    if refOPTable[tonumber(getElementID(arg0))] then
      if refOPTable[tonumber(getElementID(arg0))].enabled and refOPTable[tonumber(getElementID(arg0))].instance then
        return refOPTable[tonumber(getElementID(arg0))].instance:setRotation(arg1, arg2, arg3)
      end
      return false
    end
    return false
  else
    return false
  end
end
function setProjection(arg0, arg1, arg2, arg3, arg4, ...)
  if not isElement(arg0) then
    return false
  end
  for forvar13, forvar14 in ipairs({
    tonumber(getElementID(arg0)),
    arg1,
    arg2,
    arg3,
    arg4
  }) do
  end
  if not (true and forvar14 and type(forvar14) == "number") or #{
    ...
  } > 2 or #{
    tonumber(getElementID(arg0)),
    arg1,
    arg2,
    arg3,
    arg4
  } ~= 5 or 0 + 1 ~= 5 then
    return false
  end
  if refOPTable[tonumber(getElementID(arg0))] then
    if refOPTable[tonumber(getElementID(arg0))].enabled and refOPTable[tonumber(getElementID(arg0))].instance then
      return refOPTable[tonumber(getElementID(arg0))].instance:setProjection(arg1, arg2, arg3, arg4, ({
        ...
      })[2], ({
        ...
      })[1])
    end
    return false
  else
    return false
  end
end
function setDistanceSpread(arg0, arg1)
  if not isElement(arg0) then
    return false
  end
  for forvar9, forvar10 in ipairs({
    tonumber(getElementID(arg0)),
    arg1
  }) do
  end
  if true and forvar10 and type(forvar10) == "number" and 0 + 1 == 2 then
    if refOPTable[tonumber(getElementID(arg0))] then
      if refOPTable[tonumber(getElementID(arg0))].enabled and refOPTable[tonumber(getElementID(arg0))].instance then
        return refOPTable[tonumber(getElementID(arg0))].instance:setDistanceSpread(arg1)
      end
      return false
    else
      return false
    end
  else
    return false
  end
end
function setPositionOffsets(arg0, arg1, arg2, arg3)
  if not isElement(arg0) then
    return false
  end
  for forvar11, forvar12 in ipairs({
    tonumber(getElementID(arg0)),
    arg1,
    arg2,
    arg3
  }) do
  end
  if true and forvar12 and type(forvar12) == "number" and 0 + 1 == 4 then
    if refOPTable[tonumber(getElementID(arg0))] then
      if refOPTable[tonumber(getElementID(arg0))].enabled and refOPTable[tonumber(getElementID(arg0))].instance then
        return refOPTable[tonumber(getElementID(arg0))].instance:setPositionOffsets(arg1, arg2, arg3)
      end
      return false
    else
      return false
    end
  else
    return false
  end
end
function setRotationOffsets(arg0, arg1, arg2, arg3)
  if not isElement(arg0) then
    return false
  end
  for forvar11, forvar12 in ipairs({
    tonumber(getElementID(arg0)),
    arg1,
    arg2,
    arg3
  }) do
  end
  if true and forvar12 and type(forvar12) == "number" and 0 + 1 == 4 then
    if refOPTable[tonumber(getElementID(arg0))] then
      if refOPTable[tonumber(getElementID(arg0))].enabled and refOPTable[tonumber(getElementID(arg0))].instance then
        return refOPTable[tonumber(getElementID(arg0))].instance:setRotationOffsets(arg1, arg2, arg3)
      end
      return false
    else
      return false
    end
  else
    return false
  end
end
function setAlpha(arg0, arg1)
  if not isElement(arg0) then
    return false
  end
  if type((tonumber(getElementID(arg0)))) == "number" and type(arg1) == "number" and true then
    if refOPTable[tonumber(getElementID(arg0))] then
      if refOPTable[tonumber(getElementID(arg0))].enabled and refOPTable[tonumber(getElementID(arg0))].instance then
        return refOPTable[tonumber(getElementID(arg0))].instance:setAlpha(arg1)
      end
      return false
    else
      return false
    end
  else
    return false
  end
end
function getRenderTarget()
  if getRTarget() then
    return (getRTarget())
  else
    return false
  end
end
function setTexture(arg0, arg1)
  if not isElement(arg0) then
    return false
  end
  if refOPTable[tonumber(getElementID(arg0))] then
    if refOPTable[tonumber(getElementID(arg0))].enabled and refOPTable[tonumber(getElementID(arg0))].instance then
      return refOPTable[tonumber(getElementID(arg0))].instance:setTxd(arg1)
    end
    return false
  else
    return false
  end
end
