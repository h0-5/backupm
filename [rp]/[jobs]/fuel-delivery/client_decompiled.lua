-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

for forvar10, forvar11 in ipairs(({
  trailer_markers = {
    {
      272.249,
      1354.1943,
      9
    }
  },
  filling_markers = {
    {
      260.5302,
      1384.0273,
      9
    }
  },
  locations = {
    {
      position = {
        -1454.29,
        1865.1289,
        31.132800000000003
      }
    },
    {
      position = {
        -1307.59,
        2705.9423,
        48.5625
      }
    },
    {
      position = {
        2126.692,
        2747.7753,
        9.3203
      }
    },
    {
      position = {
        2202.407,
        2487.3017,
        9.3203
      }
    },
    {
      position = {
        1594.982,
        2211.9384,
        9.3203
      }
    },
    {
      position = {
        2129.343,
        920.24707,
        9.3203
      }
    },
    {
      position = {
        1395.3,
        454.27832,
        18.5443
      }
    },
    {
      position = {
        650.2373,
        -564.6337,
        14.789000000000001
      }
    },
    {
      position = {
        989.874,
        -926.1289,
        40.6796
      }
    },
    {
      position = {
        1941.671,
        -1787.006,
        11.8828
      }
    },
    {
      position = {
        -98.4365,
        -1186.132,
        0.55274
      }
    },
    {
      position = {
        -1540,
        -2747.023,
        47.0351
      }
    },
    {
      position = {
        -2252.22,
        -2556.828,
        30.3851
      }
    },
    {
      position = {
        -2037.38,
        174.66406,
        26.4208
      }
    },
    {
      position = {
        -1703.15,
        392.40527,
        5.67968
      }
    },
    {
      position = {
        -2424.37,
        983.48535,
        43.8
      }
    }
  },
  trailer_model = 584
}).trailer_markers) do
  ({})[createMarker(unpack(forvar11))] = forvar10
end
for forvar11, forvar12 in ipairs(({
  trailer_markers = {
    {
      272.249,
      1354.1943,
      9
    }
  },
  filling_markers = {
    {
      260.5302,
      1384.0273,
      9
    }
  },
  locations = {
    {
      position = {
        -1454.29,
        1865.1289,
        31.132800000000003
      }
    },
    {
      position = {
        -1307.59,
        2705.9423,
        48.5625
      }
    },
    {
      position = {
        2126.692,
        2747.7753,
        9.3203
      }
    },
    {
      position = {
        2202.407,
        2487.3017,
        9.3203
      }
    },
    {
      position = {
        1594.982,
        2211.9384,
        9.3203
      }
    },
    {
      position = {
        2129.343,
        920.24707,
        9.3203
      }
    },
    {
      position = {
        1395.3,
        454.27832,
        18.5443
      }
    },
    {
      position = {
        650.2373,
        -564.6337,
        14.789000000000001
      }
    },
    {
      position = {
        989.874,
        -926.1289,
        40.6796
      }
    },
    {
      position = {
        1941.671,
        -1787.006,
        11.8828
      }
    },
    {
      position = {
        -98.4365,
        -1186.132,
        0.55274
      }
    },
    {
      position = {
        -1540,
        -2747.023,
        47.0351
      }
    },
    {
      position = {
        -2252.22,
        -2556.828,
        30.3851
      }
    },
    {
      position = {
        -2037.38,
        174.66406,
        26.4208
      }
    },
    {
      position = {
        -1703.15,
        392.40527,
        5.67968
      }
    },
    {
      position = {
        -2424.37,
        983.48535,
        43.8
      }
    }
  },
  trailer_model = 584
}).filling_markers) do
  ({})[createMarker(unpack(forvar12))] = forvar11
end
function showStopPoint()
  if isElement(StopPointMarker) then
    return
  end
  StopPointMarker = createMarker(unpack(var0.locations[var1].position))
  StopPointBlip = createBlip(unpack(var0.locations[var1].position))
  setElementParent(StopPointBlip, StopPointMarker)
  exports.radar:findBestWay(unpack(var0.locations[var1].position))
  exports.notifications:output({
    en = "Go to the yellow marker shown on the map",
    ar = "\216\167\216\176\217\135\216\168 \217\132\217\132\216\185\217\132\216\167\217\133\216\169 \216\167\217\132\216\181\217\129\216\177\216\167\216\161 \216\185\217\132\217\137 \216\167\217\132\216\174\216\177\217\138\216\183\216\169"
  }, 10000, "info")
end
addEventHandler("onClientMarkerHit", resourceRoot, function(arg0)
  if arg0 ~= localPlayer then
    return
  end
  if getElementData(localPlayer, "job") ~= var0 then
    return
  end
  if var1[source] then
    if not isPedInVehicle(arg0) then
      exports.notifications:output({
        en = "You have to bring a truck for the job",
        ar = "\216\185\217\132\217\138\217\131 \216\165\216\173\216\182\216\167\216\177 \216\180\216\167\216\173\217\134\216\169 \216\174\216\167\216\181\216\169 \216\168\216\167\217\132\217\136\216\184\217\138\217\129\216\169"
      }, 3500, "warning")
      return
    end
    if getVehicleTowedByVehicle((getPedOccupiedVehicle(localPlayer))) then
      return
    end
    bindKey("lshift", "down", attachTrailer, source)
    exports.notifications:showKeyDescription(var2 .. ":attach_trailer", "Left Shift", "Take Trailer")
  elseif var3[source] then
    if not isPedInVehicle(arg0) then
      exports.notifications:output({
        en = "You have to bring a truck for the job",
        ar = "\216\185\217\132\217\138\217\131 \216\165\216\173\216\182\216\167\216\177 \216\180\216\167\216\173\217\134\216\169 \216\174\216\167\216\181\216\169 \216\168\216\167\217\132\217\136\216\184\217\138\217\129\216\169"
      }, 3500, "warning")
      return
    end
    if not getVehicleTowedByVehicle((getPedOccupiedVehicle(localPlayer))) or getElementModel((getVehicleTowedByVehicle((getPedOccupiedVehicle(localPlayer))))) ~= var4.trailer_model then
      exports.notifications:output({
        en = "No trailer attached",
        ar = "\217\132\216\167\216\170\217\136\216\172\216\175 \217\133\217\130\216\183\217\136\216\177\216\169 \217\133\216\170\216\181\217\132\216\169"
      }, 3500, "warning")
      return
    end
    bindKey("lshift", "down", fillTank, source, (getVehicleTowedByVehicle((getPedOccupiedVehicle(localPlayer)))))
    exports.notifications:showKeyDescription(var2 .. ":fill_tank", "Left Shift", "Fill the tank")
  elseif StopPointMarker then
    if not isPedInVehicle(arg0) then
      return
    end
    if not getVehicleTowedByVehicle((getPedOccupiedVehicle(localPlayer))) or getElementModel((getVehicleTowedByVehicle((getPedOccupiedVehicle(localPlayer))))) ~= var4.trailer_model then
      exports.notifications:output({
        en = "No trailer attached",
        ar = "\217\132\216\167\216\170\217\136\216\172\216\175 \217\133\217\130\216\183\217\136\216\177\216\169 \217\133\216\170\216\181\217\132\216\169"
      }, 3500, "warning")
      return
    end
    if not getElementData(getVehicleTowedByVehicle((getPedOccupiedVehicle(localPlayer))), "oil") or getElementData(getVehicleTowedByVehicle((getPedOccupiedVehicle(localPlayer))), "oil") < 5000 then
      exports.notifications:output({
        en = "There is not enough petrol in the tank (5000 Liters)",
        ar = "(5000 Liters) \217\132\216\167 \217\138\217\136\216\172\216\175 \217\136\217\130\217\136\216\175 \217\131\216\167\217\129\217\138 \217\129\217\138 \216\167\217\132\216\174\216\178\216\167\217\134"
      }, 3500, "warning")
      return
    end
    setElementData(getVehicleTowedByVehicle((getPedOccupiedVehicle(localPlayer))), "oil", getElementData(getVehicleTowedByVehicle((getPedOccupiedVehicle(localPlayer))), "oil") - 5000)
    exports["job-system"]:givePlayerJobEXP(var0, 1)
    destroyElement(StopPointMarker)
    StopPointMarker = nil
    var5 = var5 + 1
    if var5 > #var4.locations then
      var4.locations = shuffle(var4.locations)
      var5 = 1
    end
    showStopPoint()
    if getElementData(getVehicleTowedByVehicle((getPedOccupiedVehicle(localPlayer))), "oil") == 5000 then
      exports.notifications:output({
        en = "The tank is out of petrol, you have to fill it up",
        ar = "\217\134\217\129\216\176 \216\167\217\132\217\136\217\130\217\136\216\175 \217\133\217\134 \216\167\217\132\216\174\216\178\216\167\217\134\216\140 \216\185\217\132\217\138\217\131 \216\170\216\185\216\168\216\166\216\170\217\135"
      }, 5000, "warning")
    end
  end
end)
addEventHandler("onClientMarkerLeave", resourceRoot, function(arg0)
  if arg0 ~= localPlayer then
    return
  end
  if var0[source] then
    unbindKey("lshift", "down", attachTrailer)
    exports.notifications:hideKeyDescription(var1 .. ":attach_trailer")
  elseif var2[source] then
    unbindKey("lshift", "down", fillTank)
    exports.notifications:hideKeyDescription(var1 .. ":fill_tank")
  end
end)
function attachTrailer(arg0, arg1, arg2)
  if isElementWithinMarker(localPlayer, arg2) and getPedOccupiedVehicle(localPlayer) then
    var0 = false
    fadeCamera(false, 1, 0, 0, 0)
    exports.public:loading(var1 .. ":trailer:attach", true)
    setTimer(triggerServerEvent, 1000, 1, var1 .. ":trailer:attach", localPlayer, (getPedOccupiedVehicle(localPlayer)))
  end
  unbindKey(arg0, arg1, attachTrailer)
  exports.notifications:hideKeyDescription(var1 .. ":attach_trailer")
end
addEvent("fuel-delivery" .. ":trailer:attach:callback", true)
addEventHandler("fuel-delivery" .. ":trailer:attach:callback", localPlayer, function(arg0)
  showStopPoint()
  fadeCamera(true, 1)
  exports.public:loading(var0 .. ":trailer:attach", false)
end)
function fillTank(arg0, arg1, arg2, arg3)
  if isElementWithinMarker(localPlayer, arg2) and getPedOccupiedVehicle(localPlayer) then
    startFillingTank(arg3)
  end
  unbindKey(arg0, arg1, fillTank)
  exports.notifications:hideKeyDescription(var0 .. ":fill_tank")
end
function startFillingTank(arg0)
  toggleAllControls(false, true, false)
  exports.public:loading(var0 .. ":tank:fill", true)
  exports.notifications:output({
    en = "The tank is being filled with petrol",
    ar = "\216\172\216\167\216\177\217\138 \216\170\216\185\216\168\216\166\216\169 \216\167\217\132\216\174\216\178\216\167\217\134 \216\168\216\167\217\132\216\168\217\134\216\178\217\138\217\134"
  }, 5000, "info")
  setTimer(function(arg0)
    toggleAllControls(true, true, false)
    setElementData(arg0, "oil", 30000)
    exports.public:loading(var0 .. ":tank:fill", false)
    exports.notifications:output({
      en = "The tank was filled with petrol",
      ar = "\216\170\217\133 \216\170\216\185\216\168\216\166\216\169 \216\167\217\132\216\174\216\178\216\167\217\134 \216\168\216\167\217\132\216\168\217\134\216\178\217\138\217\134"
    }, 3500, "info")
  end, 5000, 1, arg0)
end
function shuffle(arg0)
  for forvar6 = #arg0, 2, -1 do
    arg0[forvar6], arg0[math.random(1, forvar6)] = arg0[math.random(1, forvar6)], arg0[forvar6]
  end
  return arg0
end
function enterVehicleEvent(arg0)
  if not var0[getElementModel(arg0)] then
    return
  end
  if getElementData(localPlayer, "job") ~= var1 then
    return
  end
  if getVehicleTowedByVehicle(arg0) then
    if getElementData(getVehicleTowedByVehicle(arg0), "oil") then
      if getElementData(getVehicleTowedByVehicle(arg0), "oil") > 0 then
        showStopPoint()
      else
        exports.notifications:output({
          en = "There is no fuel in the tank",
          ar = "\217\132\216\167\217\138\217\136\216\172\216\175 \217\136\217\130\217\136\216\175 \217\129\217\138 \216\167\217\132\216\174\216\178\216\167\217\134"
        }, 3500, "info")
      end
    else
      exports.notifications:output({
        en = "There is no fuel in the tank",
        ar = "\217\132\216\167\217\138\217\136\216\172\216\175 \217\136\217\130\217\136\216\175 \217\129\217\138 \216\167\217\132\216\174\216\178\216\167\217\134"
      }, 3500, "info")
    end
  end
  addEventHandler("onClientRender", root, drawJobInfo)
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
    if getVehicleTowedByVehicle((getPedOccupiedVehicle(localPlayer))) then
      dxDrawImage(25 * var0, 800 * var0, 32 * var0, 32 * var0, "oil-barrel.png", 0, 0, 0)
      dxDrawText(tostring(getElementData(getVehicleTowedByVehicle((getPedOccupiedVehicle(localPlayer))), "oil") or 0) .. " Liter", 70 * var0, 800 * var0, 150 * var0, 832 * var0, _, 2 * var0, "default-bold", "left", "center")
    end
  else
    removeEventHandler("onClientRender", root, drawJobInfo)
  end
end
