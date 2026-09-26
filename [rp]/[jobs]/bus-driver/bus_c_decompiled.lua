-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

addEvent("onClientPlayerStartJob", true)
addEventHandler("onClientPlayerStartJob", localPlayer, function(arg0)
  if arg0 ~= "Bus Driver" then
    return
  end
  if isElement(StopPointMarker) then
    outputChatBox("You already started the job.", 255, 0, 0)
    return
  end
  if isPedInVehicle(localPlayer) and var0[getElementModel((getPedOccupiedVehicle(localPlayer)))] then
    StopPoints = shuffle(StopPoints)
    showStopPoint()
    outputChatBox("Go to the marker shown on the map.", 255, 255, 0)
  end
end)
addEvent("onClientShowJobHelp", true)
addEventHandler("onClientShowJobHelp", localPlayer, function(arg0)
  if arg0 ~= "Bus Driver" then
    return
  end
  outputChatBox("Follow These steps:", 255, 255, 0)
  outputChatBox("   1- Take a bus.", 255, 255, 0)
  outputChatBox("   2- Open your GPS.", 255, 255, 0)
  outputChatBox("   3- Type /startjob.", 255, 255, 0)
  outputChatBox("   4- Go to the marker shown on the map.", 255, 255, 0)
  outputChatBox("   5- Stop on the marker and press 'space'.", 255, 255, 0)
end)
PointID = 1
StopPoints = {
  {
    1823.71,
    -1853.14,
    12.5,
    {
      {
        1828.9608154297,
        -1852.88671875,
        13.578125
      },
      {
        1828.7816162109,
        -1850.4633789063,
        13.578125
      },
      {
        1828.9012451172,
        -1856.626953125,
        13.578125
      }
    }
  },
  {
    2087.92,
    -1776.44,
    12.5,
    {
      {
        2092.583984375,
        -1777.8129882813,
        13.546875
      },
      {
        2092.7624511719,
        -1775.8077392578,
        13.546875
      },
      {
        2091.9462890625,
        -1779.8798828125,
        13.546875
      }
    }
  },
  {
    2259.52,
    -1661.46,
    14.5,
    {
      {
        2259.4309082031,
        -1665.3950195313,
        15.444325447083
      },
      {
        2261.5402832031,
        -1665.6363525391,
        15.428695678711
      }
    }
  },
  {
    2513.87,
    -1289.8,
    33.5,
    {
      {
        2518.3562011719,
        -1289.9761962891,
        34.8515625
      },
      {
        2518.0520019531,
        -1288.4815673828,
        34.8515625
      }
    }
  },
  {
    1970.84,
    -1458.92,
    12.5,
    {
      {
        1970.6401367188,
        -1454.0592041016,
        13.552314758301
      },
      {
        1972.1387939453,
        -1454.2248535156,
        13.55365562439
      }
    }
  },
  {
    1527.46,
    -1676.12,
    12.5,
    {
      {
        1523.1110839844,
        -1677.4431152344,
        13.546875
      },
      {
        1522.6812744141,
        -1679.2592773438,
        13.546875
      }
    }
  },
  {
    1315.28,
    -1702.4,
    13,
    {
      {
        1318.8361816406,
        -1702.1793212891,
        13.546875
      },
      {
        1319.0723876953,
        -1700.4946289063,
        13.546875
      }
    }
  },
  {
    1427.85,
    -1031.87,
    22.5,
    {
      {
        1427.5700683594,
        -1027.5958251953,
        23.828125
      },
      {
        1426.1805419922,
        -1026.5930175781,
        23.828125
      }
    }
  },
  {
    1020.08,
    -1037.43,
    30.5,
    {
      {
        1020.2698364258,
        -1033.0958251953,
        31.791244506836
      },
      {
        1018.6152954102,
        -1032.8804931641,
        31.800228118896
      }
    }
  },
  {
    1207.28,
    -1328.65,
    12.5,
    {
      {
        1212.1417236328,
        -1328.4129638672,
        13.560200691223
      },
      {
        1212.0718994141,
        -1330.205078125,
        13.560638427734
      }
    }
  },
  {
    541.62,
    -1256.58,
    15.5,
    {
      {
        544.54144287109,
        -1259.5384521484,
        16.760377883911
      },
      {
        546.16186523438,
        -1258.8076171875,
        16.802213668823
      }
    }
  },
  {
    518.29,
    -1731.46,
    10.8,
    {
      {
        517.91125488281,
        -1735.6462402344,
        11.946187973022
      },
      {
        519.88879394531,
        -1735.8493652344,
        11.989227294922
      }
    }
  },
  {
    1032.79,
    -2071.82,
    12.2,
    {
      {
        1028.3774414063,
        -2070.2666015625,
        13.132044792175
      },
      {
        1027.7727050781,
        -2072.4108886719,
        13.124306678772
      }
    }
  },
  {
    1974.36,
    -2169.26,
    12.5,
    {
      {
        1974.7344970703,
        -2172.5432128906,
        13.540592193604
      },
      {
        1976.0931396484,
        -2172.787109375,
        13.540592193604
      },
      {
        1973.7144775391,
        -2172.2092285156,
        13.540592193604
      }
    }
  }
}
function showStopPoint()
  if isElement(StopPointMarker) then
    return
  end
  StopPointMarker = createMarker(unpack(StopPoints[PointID]))
  StopPointBlip = createBlip(unpack(StopPoints[PointID]))
  setElementParent(StopPointBlip, StopPointMarker)
  exports.radar:findBestWay(unpack(StopPoints[PointID]))
end
addEventHandler("onClientMarkerHit", resourceRoot, function(arg0)
  if arg0 ~= localPlayer then
    return
  end
  if getElementType(arg0) ~= "player" then
    return
  end
  if not isPedInVehicle(arg0) then
    return
  end
  if getVehicleController((getPedOccupiedVehicle(arg0))) ~= arg0 then
    return
  end
  if var0[getElementModel((getPedOccupiedVehicle(arg0)))] then
    setPedControlState(arg0, "handbrake", true)
    bindKey("space", "down", PressALT, source)
    exports.notifications:output({
      en = "Press 'Space'",
      ar = "'\216\167\216\182\216\186\216\183 '\217\133\216\179\216\167\217\129\216\169"
    }, 3000, "info")
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
  unbindKey("space", "down", PressALT, source)
end)
function PressALT(arg0, arg1, arg2)
  if isPedInVehicle(localPlayer) then
    if getVehicleController((getPedOccupiedVehicle(localPlayer))) ~= localPlayer then
      return
    end
    if var0[getElementModel((getPedOccupiedVehicle(localPlayer)))] then
      if getElementVelocity((getPedOccupiedVehicle(localPlayer))) ~= 0 then
        return exports.notifications:output({
          en = "Stop the Bus first",
          ar = "\216\163\217\136\217\130\217\129 \216\167\217\132\216\173\216\167\217\129\217\132\216\169 \216\163\217\136\217\132\216\167\217\139"
        }, 4000, "warning")
      end
      if getElementHealth((getPedOccupiedVehicle(localPlayer))) < 500 then
        return exports.notifications:output({
          en = "Your Bus is very damaged, repair it to complete work",
          ar = "\216\173\216\167\217\129\217\132\216\170\217\131 \217\133\216\170\216\182\216\177\216\177\216\169 \216\172\216\175\216\167\217\139\216\140 \216\163\216\181\217\132\216\173\217\135\216\167 \217\132\216\170\217\131\217\133\217\132 \216\167\217\132\216\185\217\133\217\132"
        }, 5000, "warning")
      end
      unbindKey("space", "down", PressALT, arg2)
      exports["job-system"]:givePlayerJobEXP("Bus Driver", 1)
      destroyElement(getElementChild(arg2, 0))
      destroyElement(arg2)
      PointID = PointID + 1
      if PointID > #StopPoints then
        PointID = 1
      end
      showStopPoint()
    end
  end
end
addEvent("onClientPlayerQuitJob", true)
addEventHandler("onClientPlayerQuitJob", localPlayer, function(arg0)
  if arg0 == "Bus Driver" then
    stopJob()
  end
end)
function stopJob()
  unbindKey("space", "down", PressALT)
  if isElement(StopPointBlip) then
    destroyElement(StopPointBlip)
    destroyElement(StopPointMarker)
    StopPointBlip = nil
    StopPointMarker = nil
  end
end
addEventHandler("onClientPlayerSpawn", localPlayer, function()
  stopJob()
end)
function shuffle(arg0)
  for forvar6 = #arg0, 2, -1 do
    arg0[forvar6], arg0[math.random(1, forvar6)] = arg0[math.random(1, forvar6)], arg0[forvar6]
  end
  return arg0
end
