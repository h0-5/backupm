-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

function isMTAUpToDate(arg0)
  if arg0 > getVersion().sortable:sub(9) then
    return false
  else
    return true
  end
end
function vCardNumRenderTargets()
  return tonumber((tostring(dxGetStatus().VideoCardNumRenderTargets)))
end
function toint(arg0)
  if tostring(arg0):find("%.") then
    return tonumber(tostring(arg0):sub(1, tostring(arg0):find("%.") - 1))
  else
    return arg0
  end
end
function returnMaxValue(arg0)
  for forvar6, forvar7 in pairs(arg0) do
    ({})[forvar6] = math.abs(forvar7)
  end
  repeat
    for forvar7 = 1, #arg0 - 1 do
      if ({})[forvar7] > ({})[forvar7 + 1] then
        ({})[forvar7], ({})[forvar7 + 1] = ({})[forvar7 + 1], ({})[forvar7]
      end
    end
  until true == false
  return ({})[#{}]
end
function createElementMatrix(arg0, arg1)
  return {
    {
      math.cos((math.rad(arg1[3]))) * math.cos((math.rad(arg1[2]))) - math.sin((math.rad(arg1[3]))) * math.sin((math.rad(arg1[1]))) * math.sin((math.rad(arg1[2]))),
      math.cos((math.rad(arg1[2]))) * math.sin((math.rad(arg1[3]))) + math.cos((math.rad(arg1[3]))) * math.sin((math.rad(arg1[1]))) * math.sin((math.rad(arg1[2]))),
      -math.cos((math.rad(arg1[1]))) * math.sin((math.rad(arg1[2]))),
      0
    },
    {
      -math.cos((math.rad(arg1[1]))) * math.sin((math.rad(arg1[3]))),
      math.cos((math.rad(arg1[3]))) * math.cos((math.rad(arg1[1]))),
      math.sin((math.rad(arg1[1]))),
      0
    },
    {
      math.cos((math.rad(arg1[3]))) * math.sin((math.rad(arg1[2]))) + math.cos((math.rad(arg1[2]))) * math.sin((math.rad(arg1[3]))) * math.sin((math.rad(arg1[1]))),
      math.sin((math.rad(arg1[3]))) * math.sin((math.rad(arg1[2]))) - math.cos((math.rad(arg1[3]))) * math.cos((math.rad(arg1[2]))) * math.sin((math.rad(arg1[1]))),
      math.cos((math.rad(arg1[1]))) * math.cos((math.rad(arg1[2]))),
      0
    },
    {
      arg0[1],
      arg0[2],
      arg0[3],
      1
    }
  }
end
function getEulerAnglesFromMatrix(arg0)
  return math.deg(math.asin(arg0[2][3])), -math.deg(math.atan2(-arg0[2][1] * arg0[2][3] / math.sqrt(arg0[2][1] * arg0[2][1] + arg0[2][2] * arg0[2][2]) * arg0[1][1] + -arg0[2][2] * arg0[2][3] / math.sqrt(arg0[2][1] * arg0[2][1] + arg0[2][2] * arg0[2][2]) * arg0[1][2] + math.sqrt(arg0[2][1] * arg0[2][1] + arg0[2][2] * arg0[2][2]) * arg0[1][3], -arg0[2][1] * arg0[2][3] / math.sqrt(arg0[2][1] * arg0[2][1] + arg0[2][2] * arg0[2][2]) * arg0[3][1] + -arg0[2][2] * arg0[2][3] / math.sqrt(arg0[2][1] * arg0[2][1] + arg0[2][2] * arg0[2][2]) * arg0[3][2] + math.sqrt(arg0[2][1] * arg0[2][1] + arg0[2][2] * arg0[2][2]) * arg0[3][3])), -math.deg(math.atan2(arg0[2][1], arg0[2][2]))
end
function getPositionFromMatrixOffset(arg0, arg1)
  return arg1[1] * arg0[1][1] + arg1[2] * arg0[2][1] + arg1[3] * arg0[3][1] + arg0[4][1], arg1[1] * arg0[1][2] + arg1[2] * arg0[2][2] + arg1[3] * arg0[3][2] + arg0[4][2], arg1[1] * arg0[1][3] + arg1[2] * arg0[2][3] + arg1[3] * arg0[3][3] + arg0[4][3]
end
function matrixMultiply(arg0, arg1)
  for forvar6 = 1, #arg0 do
    ({})[forvar6] = {}
    for forvar10 = 1, #arg1[1] do
      for forvar15 = 2, #arg0[1] do
      end
      _FOR_[forvar10] = arg0[forvar6][1] * arg1[1][forvar10] + arg0[forvar6][forvar15] * arg1[forvar15][forvar10]
    end
  end
  return {}
end
function findEmptyEntry(arg0)
  for forvar4, forvar5 in ipairs(arg0) do
    if not forvar5.enabled then
      return forvar4
    end
  end
  return #arg0 + 1
end
