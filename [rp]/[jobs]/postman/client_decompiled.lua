-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

addEvent("onClientPlayerStartJob", true)
addEventHandler("onClientPlayerStartJob", localPlayer, function(arg0)
  if arg0 ~= "Postman" then
    return
  end
  if isElement(StopPointMarker) then
    outputChatBox("You already started the job.", 255, 0, 0)
    return
  end
end)
for forvar12, forvar13 in ipairs(({
  locations = {
    {
      marker_pos = {
        1771.87,
        -2049.135,
        11.5
      },
      boxes_pos = {
        {
          2912,
          1767.185,
          -2046.493,
          13.8023
        },
        {
          2912,
          1765.444,
          -2047.464,
          14.0133
        },
        {
          2912,
          1765.438,
          -2049.565,
          14.0156
        },
        {
          2912,
          1765.108,
          -2051.191,
          14.0566
        },
        {
          2912,
          1766.456,
          -2052.458,
          13.8948
        },
        {
          2912,
          1766.922,
          -2050.82,
          13.8373
        },
        {
          2912,
          1767.146,
          -2048.661,
          13.8087
        },
        {
          2912,
          1767.625,
          -2046.571,
          13.7493
        },
        {
          2912,
          1766.164,
          -2047.689,
          13.9265
        },
        {
          2912,
          1768.08,
          -2048.903,
          13.6961
        }
      }
    },
    {
      marker_pos = {
        1771.87,
        -2031.82,
        11.5
      },
      boxes_pos = {
        {
          2912,
          1765.994,
          -2034.951,
          13.9377
        },
        {
          2912,
          1765.294,
          -2033.163,
          14.0208
        },
        {
          2912,
          1765.375,
          -2031.165,
          14.0096
        },
        {
          2912,
          1765.704,
          -2029.203,
          13.9685
        },
        {
          2912,
          1767.262,
          -2029.081,
          13.7801
        },
        {
          2912,
          1767.236,
          -2030.709,
          13.7845
        },
        {
          2912,
          1768.23,
          -2032.266,
          13.6657
        },
        {
          2912,
          1767.689,
          -2033.971,
          13.7323
        },
        {
          2912,
          1768.484,
          -2035.192,
          13.6371
        },
        {
          2912,
          1765.204,
          -2035.639,
          14.0336
        },
        {
          2912,
          1769.218,
          -2030.839,
          13.5453
        }
      }
    },
    {
      marker_pos = {
        1751.726,
        -2061.259,
        11.5
      },
      boxes_pos = {
        {
          2912,
          1754.314,
          -2058.185,
          13.6102
        },
        {
          2912,
          1752.821,
          -2057.881,
          13.6481
        },
        {
          2912,
          1751.061,
          -2057.993,
          13.6359
        },
        {
          2912,
          1748.778,
          -2057.449,
          13.7033
        },
        {
          2912,
          1748.222,
          -2056.15,
          13.8605
        },
        {
          2912,
          1749.845,
          -2056.171,
          13.8567
        },
        {
          2912,
          1751.803,
          -2055.787,
          13.9031
        },
        {
          2912,
          1753.901,
          -2056.031,
          13.8734
        },
        {
          2912,
          1754.023,
          -2054.577,
          14.0508
        },
        {
          2912,
          1752.1,
          -2054.298,
          14.0847
        }
      }
    }
  }
}).locations) do
  ({})[createMarker(unpack(forvar13.marker_pos))] = forvar12
end
function createBoxes(arg0)
  for forvar4, forvar5 in pairs(var0) do
    if isElement(forvar4) then
      return
    end
  end
  for forvar4, forvar5 in ipairs(var1.locations[arg0].boxes_pos) do
    var0[createObject(unpack(forvar5))] = true
  end
end
addEvent("onClientShowJobHelp", true)
addEventHandler("onClientShowJobHelp", localPlayer, function(arg0)
  if arg0 ~= "Postman" then
    return
  end
end)
addEvent("onClientPlayerTakeJob", true)
addEventHandler("onClientPlayerTakeJob", localPlayer, function(arg0)
  if arg0 ~= "Postman" then
    return
  end
  outputChatBox("Type  /jobhelp  to view job instructions", 252, 132, 3)
  outputChatBox("\217\132\216\185\216\177\216\182 \216\170\216\185\217\132\217\138\217\133\216\167\216\170 \216\167\217\132\216\185\217\133\217\132  /jobhelp  \216\167\217\131\216\170\216\168", 252, 132, 3)
end)
function enterVehicleEvent(arg0)
  if not var0[getElementModel(arg0)] then
    return
  end
  if getElementData(localPlayer, "job") ~= "Postman" then
    return
  end
  if getElementData(arg0, "temp:boxes") then
    if getElementData(arg0, "temp:boxes") > 0 then
      showStopPoint()
    else
      exports.notifications:output({
        en = "There are no boxes in the truck",
        ar = "\217\132\216\167\216\170\217\136\216\172\216\175 \216\181\217\134\216\167\216\175\217\138\217\130 \217\129\217\138 \216\167\217\132\216\180\216\167\216\173\217\134\216\169"
      }, 3500, "info")
    end
    addEventHandler("onClientRender", root, drawJobInfo)
  else
    exports.notifications:output({
      en = "There are no boxes in the truck",
      ar = "\217\132\216\167\216\170\217\136\216\172\216\175 \216\181\217\134\216\167\216\175\217\138\217\130 \217\129\217\138 \216\167\217\132\216\180\216\167\216\173\217\134\216\169"
    }, 3500, "info")
  end
end
addEventHandler("onClientPlayerVehicleEnter", localPlayer, enterVehicleEvent)
function exitVehicleEvent(arg0)
  if not var0[getElementModel(arg0)] then
    return
  end
  removeEventHandler("onClientRender", root, drawJobInfo)
end
addEventHandler("onClientPlayerVehicleExit", localPlayer, exitVehicleEvent)
function drawJobInfo()
  if getPedOccupiedVehicle(localPlayer) then
    dxDrawImage(25 * var0, 650 * var0, 32 * var0, 32 * var0, "box.png", 0, 0, 0)
    dxDrawText(tostring(getElementData(getPedOccupiedVehicle(localPlayer), "temp:boxes") or 0), 70 * var0, 650 * var0, 150 * var0, 682 * var0, _, 2 * var0, "default-bold", "left", "center")
  else
    removeEventHandler("onClientRender", root, drawJobInfo)
  end
end
PointID = 1
StopPoints = {
  {
    {
      2085.237,
      -1926.778,
      13.2781
    },
    {
      2090.37,
      -1927.53,
      13.5401
    }
  },
  {
    {
      1159.517,
      -1855.902,
      13.3974
    },
    {
      1159.447,
      -1861.544,
      13.7729
    }
  },
  {
    {
      910.832,
      -1446.12,
      13.5469
    },
    {
      903.0292,
      -1447.176,
      13.5585
    }
  },
  {
    {
      1030.139,
      -1153.116,
      23.6562
    },
    {
      1034.745,
      -1157.359,
      23.8281
    }
  },
  {
    {
      1158.948,
      -1101.795,
      24.9123
    },
    {
      1145.332,
      -1100.969,
      25.8175
    }
  },
  {
    {
      1721.356,
      -1260.562,
      13.5468
    },
    {
      1730.084,
      -1263.328,
      13.5468
    }
  },
  {
    {
      2078.216,
      -1632.082,
      13.3828
    },
    {
      2069.613,
      -1630.564,
      13.8761
    }
  },
  {
    {
      2479.95,
      -1740.201,
      13.5468
    },
    {
      2476.569,
      -1748.949,
      13.5468
    }
  },
  {
    {
      2763.381,
      -1940.473,
      13.5393
    },
    {
      2754.291,
      -1938.664,
      13.5453
    }
  },
  {
    {
      2871.383,
      -1438.062,
      10.789
    },
    {
      2864.254,
      -1436.875,
      10.9752
    }
  },
  {
    {
      2828.332,
      -1182.926,
      24.9442
    },
    {
      2809.889,
      -1178.439,
      25.3308
    }
  },
  {
    {
      2447.025,
      -1303.126,
      23.8248
    },
    {
      2436.777,
      -1304.776,
      24.6745
    }
  },
  {
    {
      2135.304,
      -1085.638,
      24.1814
    },
    {
      2138.292,
      -1082.719,
      24.3837
    }
  },
  {
    {
      1669.454,
      -1291.884,
      14.3263
    },
    {
      1667.953,
      -1278.643,
      14.7775
    }
  },
  {
    {
      1428.946,
      -1551.972,
      13.3647
    },
    {
      1421.571,
      -1552.025,
      13.5421
    }
  },
  {
    {
      1958.132,
      -1989.625,
      13.3905
    },
    {
      1951.274,
      -1987.719,
      13.5468
    }
  },
  {
    {
      1709.717,
      -2109.31,
      13.3828
    },
    {
      1710.383,
      -2104.042,
      13.5468
    }
  }
}
function shuffle(arg0)
  for forvar6 = #arg0, 2, -1 do
    arg0[forvar6], arg0[math.random(1, forvar6)] = arg0[math.random(1, forvar6)], arg0[forvar6]
  end
  return arg0
end
function showStopPoint()
  if isElement(StopPointMarker) then
    return
  end
  StopPointMarker = createMarker(unpack(StopPoints[PointID][1]))
  StopPointBlip = createBlip(unpack(StopPoints[PointID][1]))
  setElementParent(StopPointBlip, StopPointMarker)
  DeliverBoxMarker = createMarker(unpack(StopPoints[PointID][2]))
  setElementAlpha(DeliverBoxMarker, 0)
  exports.radar:findBestWay(unpack(StopPoints[PointID][1]))
  exports.notifications:output({
    en = "Go to the yellow marker shown on the map",
    ar = "\216\167\216\176\217\135\216\168 \217\132\217\132\216\185\217\132\216\167\217\133\216\169 \216\167\217\132\216\181\217\129\216\177\216\167\216\161 \216\185\217\132\217\137 \216\167\217\132\216\174\216\177\217\138\216\183\216\169"
  }, 10000, "info")
end
addEventHandler("onClientClick", root, function(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7)
  if arg7 and arg1 == "down" then
    if var0[arg7] then
      if var1 then
        return
      end
      if getElementData(localPlayer, "job") ~= "Postman" then
        return
      end
      if getDistanceBetweenPoints3D(getElementPosition(localPlayer)) > 2 then
        return
      end
      var0[arg7] = nil
      destroyElement(arg7)
      var1 = true
      triggerServerEvent("postman:attachBox", localPlayer, true, (getElementModel(arg7)))
    elseif getElementType(arg7) == "vehicle" then
      if not var1 then
        return
      end
      if getElementData(localPlayer, "job") ~= "Postman" then
        return
      end
      if not var2[getElementModel(arg7)] then
        return
      end
      if getDistanceBetweenPoints3D(getElementPosition(localPlayer)) > 5 then
        return
      end
      var1 = false
      triggerServerEvent("postman:putBoxInsideVehicle", localPlayer, arg7)
    end
  end
end, true, "high-1")
addEventHandler("onClientMarkerHit", resourceRoot, function(arg0)
  if arg0 ~= localPlayer then
    return
  end
  if getElementData(localPlayer, "job") ~= "Postman" then
    return
  end
  if var0[source] then
    if getElementAlpha(source) == 0 then
      return
    end
    if not isPedInVehicle(arg0) then
      exports.notifications:output({
        en = "You have to bring a truck for the job",
        ar = "\216\185\217\132\217\138\217\131 \216\165\216\173\216\182\216\167\216\177 \216\180\216\167\216\173\217\134\216\169 \216\174\216\167\216\181\216\169 \216\168\216\167\217\132\217\136\216\184\217\138\217\129\216\169"
      }, 3500, "warning")
      return
    end
    if getVehicleController((getPedOccupiedVehicle(arg0))) ~= arg0 then
      return
    end
    if var1[getElementModel((getPedOccupiedVehicle(arg0)))] then
      if getElementData(getPedOccupiedVehicle(arg0), "temp:boxes") and getElementData(getPedOccupiedVehicle(arg0), "temp:boxes") >= 10 then
        showStopPoint()
        exports.notifications:output({
          en = "The truck is loaded with boxes, take them to the required place",
          ar = "\216\167\217\132\216\180\216\167\216\173\217\134\216\169 \217\133\216\173\217\133\217\132\216\169 \216\168\216\167\217\132\216\181\217\134\216\167\216\175\217\138\217\130\216\140 \217\130\217\133 \216\168\216\170\217\136\216\181\217\138\217\132\217\135\217\133 \217\132\217\132\217\133\217\131\216\167\217\134 \216\167\217\132\217\133\216\183\217\132\217\136\216\168"
        }, 3500, "warning")
        return
      end
      setPedControlState(localPlayer, "handbrake", true)
      setElementFrozen(getPedOccupiedVehicle(arg0), true)
      setTimer(setElementFrozen, 500, 1, getPedOccupiedVehicle(arg0), false)
      setPedExitVehicle(localPlayer)
      setElementAlpha(source, 0)
      triggerServerEvent("postman:openVehicleTrunk", localPlayer, (getPedOccupiedVehicle(arg0)))
      createBoxes(var0[source])
      exports.notifications:output({
        en = "Put the boxes in the truck",
        ar = "\217\130\217\133 \216\168\217\136\216\182\216\185 \216\167\217\132\216\181\217\134\216\167\216\175\217\138\217\130 \217\129\217\138 \216\167\217\132\216\180\216\167\216\173\217\134\216\169"
      }, 8000, "info")
    else
      exports.notifications:output({
        en = "You need a special truck for the job",
        ar = "\216\170\216\173\216\170\216\167\216\172 \216\165\217\132\217\137 \216\180\216\167\216\173\217\134\216\169 \216\174\216\167\216\181\216\169 \216\168\216\167\217\132\217\136\216\184\217\138\217\129\216\169"
      }, 3500, "warning")
    end
  elseif source == StopPointMarker then
    if not isPedInVehicle(arg0) then
      return
    end
    if getVehicleController((getPedOccupiedVehicle(arg0))) ~= arg0 then
      return
    end
    if var1[getElementModel((getPedOccupiedVehicle(arg0)))] then
      if getElementAlpha(source) == 0 then
        return
      end
      setPedControlState(localPlayer, "handbrake", true)
      setElementFrozen(getPedOccupiedVehicle(arg0), true)
      setTimer(setElementFrozen, 500, 1, getPedOccupiedVehicle(arg0), false)
      setPedExitVehicle(localPlayer)
      setElementAlpha(source, 0)
      setElementAlpha(DeliverBoxMarker, 100)
      exports.notifications:output({
        en = "Take a box from the truck",
        ar = "\216\174\216\176 \216\181\217\134\216\175\217\136\217\130 \217\133\217\134 \216\167\217\132\216\180\216\167\216\173\217\134\216\169"
      }, 3500, "info")
    end
  elseif source == DeliverBoxMarker then
    if getElementAlpha(source) == 0 then
      return
    end
    if not var2 then
      exports.notifications:output({
        en = "Take a box from the truck",
        ar = "\216\174\216\176 \216\181\217\134\216\175\217\136\217\130 \217\133\217\134 \216\167\217\132\216\180\216\167\216\173\217\134\216\169"
      }, 3500, "info")
      return
    end
    var2 = false
    triggerServerEvent("postman:attachBox", localPlayer, false)
    exports["job-system"]:givePlayerJobEXP("Postman", 1)
    destroyElement(StopPointMarker)
    StopPointMarker = nil
    destroyElement(source)
    PointID = PointID + 1
    if PointID > #StopPoints then
      StopPoints = shuffle(StopPoints)
      PointID = 1
    end
    showStopPoint()
  end
end)
addEventHandler("onClientMarkerLeave", resourceRoot, function(arg0)
  if arg0 ~= localPlayer then
    return
  end
  if getElementType(arg0) ~= "player" then
    return
  end
  if not isPedInVehicle(arg0) then
    return
  end
  if var0[source] then
    if getElementAlpha(source) ~= 0 then
      return
    end
    setElementAlpha(source, 150)
  end
end)
addEvent("onClientElementMenuShow", true)
addEventHandler("onClientElementMenuShow", localPlayer, function(arg0, arg1, arg2)
  if arg1 <= 5 and arg2 == "vehicle" and isElement(arg0) then
    if var0 then
      return
    end
    if isPedInVehicle(localPlayer) then
      return
    end
    if getElementData(arg0, "temp:boxes") and getElementData(arg0, "temp:boxes") > 0 then
      exports.interaction:addInteractOption(arg0, {text = "Take box"})
    end
  end
end)
addEvent("onClientElementMenuClick", true)
addEventHandler("onClientElementMenuClick", localPlayer, function(arg0, arg1, arg2)
  if arg1 == "Take box" and isElement(arg0) and getElementType(arg0) == "vehicle" then
    if isPedInVehicle(localPlayer) then
      return
    end
    if getElementData(arg0, "temp:boxes") and getElementData(arg0, "temp:boxes") > 0 then
      setElementData(arg0, "temp:boxes", getElementData(arg0, "temp:boxes") - 1)
      var0 = true
      triggerServerEvent("postman:attachBox", localPlayer, true, 2912)
    end
  end
end)
addEvent("onClientPlayerQuitJob", true)
addEventHandler("onClientPlayerQuitJob", localPlayer, function(arg0)
  if arg0 == "Postman" then
    stopJob()
  end
end)
function stopJob()
  if isElement(StopPointBlip) then
    destroyElement(StopPointBlip)
    destroyElement(StopPointMarker)
    if isElement(DeliverBoxMarker) then
      destroyElement(DeliverBoxMarker)
    end
    StopPointBlip = nil
    StopPointMarker = nil
    DeliverBoxMarker = nil
  end
  if var0 then
    var0 = nil
    triggerServerEvent("postman:attachBox", localPlayer, false)
  end
  for forvar3, forvar4 in pairs(var1) do
    if isElement(forvar3) then
      destroyElement(forvar3)
    end
  end
  var1 = {}
end
addEvent("onClientPlayerQuitFromCharacter", true)
addEventHandler("onClientPlayerQuitFromCharacter", localPlayer, function()
  stopJob()
end)
