-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

addEvent("onClientPlayerStartJob", true)
addEventHandler("onClientPlayerStartJob", localPlayer, function(arg0)
  if arg0 ~= var0 then
    return
  end
  if isElement(StopPointMarker) then
    outputChatBox("You already started the job.", 255, 0, 0)
    return
  end
end)
addEventHandler("onClientResourceStart", resourceRoot, function(arg0)
  createTrailerMarkers()
end)
function createTrailerMarkers()
  if var0 ~= 0 then
    return
  end
  for forvar3, forvar4 in ipairs(var1.trailer_markers) do
    var2[createMarker(unpack(forvar4))] = forvar3
  end
  var0 = 1
end
function destroyTrailerMarkers()
  if var0 ~= 1 then
    return
  end
  for forvar3, forvar4 in pairs(var1) do
    destroyElement(forvar3)
  end
  var1 = nil
  var0 = 0
end
function getNextPoint()
  for forvar7, forvar8 in ipairs(var0.locations) do
    if getDistanceBetweenPoints3D(getElementPosition(localPlayer)) > 2000 then
      table.insert({}, forvar7)
    end
  end
  return ({})[math.random(1, #{})]
end
addEvent("trucker:trailer:attach:callback", true)
addEventHandler("trucker:trailer:attach:callback", localPlayer, function(arg0)
  var0 = true
  onAttachTrailer(arg0)
  showStopPoint()
  fadeCamera(true, 1)
  exports.public:loading("trucker:trailer:attach", false)
end)
function onAttachTrailer(arg0)
  var0 = arg0
  addEventHandler("onClientTrailerAttach", arg0, onAttach)
  addEventHandler("onClientTrailerDetach", arg0, onDetach)
  addEventHandler("onClientElementDestroy", arg0, onDestroyTrailer)
  var1 = true
end
function onDestroyTrailer()
  removeEventHandler("onClientTrailerAttach", source, onAttach)
  removeEventHandler("onClientTrailerDetach", source, onDetach)
  var0 = nil
  var1 = false
end
function onAttach(arg0)
  var0 = true
end
function onDetach(arg0)
  var0 = false
end
addEvent("trucker:trailer:delivered:callback", true)
addEventHandler("trucker:trailer:delivered:callback", localPlayer, function(arg0)
  if arg0 then
    destroyElement(StopPointMarker)
    StopPointMarker = nil
  end
  fadeCamera(true, 1)
  exports.public:loading("trucker:trailer:delivered", false)
end)
function enterVehicleEvent(arg0)
  if not var0[getElementModel(arg0)] then
    return
  end
  if getElementData(localPlayer, "job") ~= var1 then
    return
  end
  if not getVehicleTowedByVehicle(arg0) then
    exports.notifications:output({
      en = "No trailer attached",
      ar = "\217\132\216\167\216\170\217\136\216\172\216\175 \217\133\217\130\216\183\217\136\216\177\216\169 \217\133\216\170\216\181\217\132\216\169"
    }, 3500, "info")
    return
  end
end
addEventHandler("onClientPlayerVehicleEnter", localPlayer, enterVehicleEvent)
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
  var0 = getNextPoint()
  StopPointMarker = createColPolygon(unpack(var1.locations[var0].col_points))
  exports.public:addColshapeChecker(StopPointMarker, unpack(var1.locations[var0].position))
  StopPointBlip = createBlip(unpack(var1.locations[var0].position))
  setElementParent(StopPointBlip, StopPointMarker)
  exports.radar:findBestWay(unpack(var1.locations[var0].position))
  exports.notifications:output({
    en = "Go to the yellow marker shown on the map",
    ar = "\216\167\216\176\217\135\216\168 \217\132\217\132\216\185\217\132\216\167\217\133\216\169 \216\167\217\132\216\181\217\129\216\177\216\167\216\161 \216\185\217\132\217\137 \216\167\217\132\216\174\216\177\217\138\216\183\216\169"
  }, 10000, "info")
end
addEventHandler("onClientColshapeCheckerHit", resourceRoot, function()
  if source == StopPointMarker then
    if not var0 or not var1 then
      exports.notifications:output({
        en = "No trailer attached",
        ar = "\217\132\216\167\216\170\217\136\216\172\216\175 \217\133\217\130\216\183\217\136\216\177\216\169 \217\133\216\170\216\181\217\132\216\169"
      }, 3500, "info")
      return
    end
    if isElementWithinColShape(var1, source) then
      setPedControlState(localPlayer, "handbrake", true)
      fadeCamera(false, 2, 0, 0, 0)
      exports.public:loading("trucker:trailer:delivered", true)
      setTimer(triggerServerEvent, 3000, 1, "trucker:trailer:delivered", localPlayer, getPedOccupiedVehicle(localPlayer), var1)
    end
  end
end)
function attachTrailer(arg0, arg1, arg2)
  if isElementWithinMarker(localPlayer, arg2) and getPedOccupiedVehicle(localPlayer) then
    var0 = false
    fadeCamera(false, 1, 0, 0, 0)
    exports.public:loading("trucker:trailer:attach", true)
    setTimer(triggerServerEvent, 1000, 1, "trucker:trailer:attach", localPlayer, (getPedOccupiedVehicle(localPlayer)))
  end
  unbindKey(arg0, arg1, attachTrailer)
  exports.notifications:hideKeyDescription("trucker:attach_trailer")
end
addEventHandler("onClientMarkerHit", resourceRoot, function(arg0)
  if arg0 ~= localPlayer then
    return
  end
  if getElementData(localPlayer, "job") ~= var0 then
    return
  end
  if var1[source] then
    if not var2 then
      return
    end
    if var3 then
      return
    end
    if var4 then
      return
    end
    if not isPedInVehicle(arg0) then
      exports.notifications:output({
        en = "You have to bring a truck for the job",
        ar = "\216\185\217\132\217\138\217\131 \216\165\216\173\216\182\216\167\216\177 \216\180\216\167\216\173\217\134\216\169 \216\174\216\167\216\181\216\169 \216\168\216\167\217\132\217\136\216\184\217\138\217\129\216\169"
      }, 3500, "warning")
      return
    end
    if getVehicleTowedByVehicle((getPedOccupiedVehicle(arg0))) then
      return
    end
    if getVehicleController((getPedOccupiedVehicle(arg0))) ~= arg0 then
      return
    end
    if not var5[getElementModel((getPedOccupiedVehicle(arg0)))] then
      exports.notifications:output({
        en = "You need a special truck for the job",
        ar = "\216\170\216\173\216\170\216\167\216\172 \216\165\217\132\217\137 \216\180\216\167\216\173\217\134\216\169 \216\174\216\167\216\181\216\169 \216\168\216\167\217\132\217\136\216\184\217\138\217\129\216\169"
      }, 3500, "warning")
      return
    end
    bindKey("lshift", "down", attachTrailer, source)
    exports.notifications:showKeyDescription("trucker:attach_trailer", "Left Shift", "Take Trailer")
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
    unbindKey("lshift", "down", attachTrailer, source)
    exports.notifications:hideKeyDescription("trucker:attach_trailer")
  end
end)
addEvent("onClientPlayerQuitJob", true)
addEventHandler("onClientPlayerQuitJob", localPlayer, function(arg0)
  if arg0 == var0 then
    stopJob()
  end
end)
function stopJob()
  if isElement(StopPointBlip) then
    destroyElement(StopPointBlip)
    destroyElement(StopPointMarker)
    StopPointBlip = nil
    StopPointMarker = nil
  end
  var0 = false
  var1 = false
end
addEvent("onClientPlayerQuitFromCharacter", true)
addEventHandler("onClientPlayerQuitFromCharacter", localPlayer, function()
  stopJob()
end)
