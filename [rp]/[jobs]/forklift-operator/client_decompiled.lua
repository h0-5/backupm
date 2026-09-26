-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

function getNextPoint()
  for forvar7, forvar8 in ipairs(var0) do
    if getDistanceBetweenPoints3D(getElementPosition(localPlayer)) > 30 then
      table.insert({}, forvar7)
    end
  end
  return ({})[math.random(1, #{})]
end
function createBox()
  var1[createObject(2900, unpack(var0[getNextPoint()]))] = createBlipAttachedTo(createObject(2900, unpack(var0[getNextPoint()])), 0, 1, 255, 100, 0)
end
function attachLiftMarker(arg0)
  if isElement(lift_marker) then
    return
  end
  lift_marker = createMarker(-1471.5, 277.97167, 7.1875, "cylinder", 1.9, 255, 255, 255, 0)
  current_lift_colshape = getElementColShape(lift_marker)
  addEventHandler("onClientColShapeHit", current_lift_colshape, hitLiftColshape)
  addEventHandler("onClientColShapeLeave", current_lift_colshape, leaveLiftColshape)
  attachElements(lift_marker, arg0, 0, 1.3, -0.5)
  addEventHandler("onClientVehicleExit", arg0, exitCurrentVehicle)
  addEventHandler("onClientElementDestroy", arg0, destroyCurrentVehicle)
  current_vehicle = arg0
end
function detachLiftMarker()
  if not isElement(lift_marker) then
    return
  end
  if isElement(current_lift_colshape) then
    removeEventHandler("onClientColShapeHit", current_lift_colshape, hitLiftColshape)
    removeEventHandler("onClientColShapeLeave", current_lift_colshape, leaveLiftColshape)
  end
  destroyElement(lift_marker)
  lift_marker = nil
  current_lift_colshape = nil
  removeEventHandler("onClientVehicleExit", current_vehicle, exitCurrentVehicle)
  removeEventHandler("onClientElementDestroy", current_vehicle, destroyCurrentVehicle)
  current_vehicle = nil
end
function exitCurrentVehicle(arg0, arg1)
  if arg0 ~= localPlayer then
    return
  end
  detachLiftMarker()
end
function enterVehicleEvent(arg0, arg1)
  if arg0 ~= localPlayer then
    return
  end
  if not var0 then
    return
  end
  if var1[getElementModel(source)] then
    attachLiftMarker(source)
  end
end
function destroyCurrentVehicle()
  detachLiftMarker()
end
function createDestination()
  if isElement(current_destination_marker) then
    return
  end
  current_destination_marker = createMarker(unpack(var0[getNextPoint()]))
  current_destination_blip = createBlipAttachedTo(current_destination_marker, 0, 1, 255, 255, 0)
  addEventHandler("onClientColShapeHit", getElementColShape(current_destination_marker), hitDestination)
end
function destroyDestination()
  if not isElement(current_destination_marker) then
    return
  end
  removeEventHandler("onClientColShapeHit", getElementColShape(current_destination_marker), hitDestination)
  destroyElement(current_destination_blip)
  destroyElement(current_destination_marker)
  current_destination_blip = nil
  current_destination_marker = nil
end
function stopJob()
  detachLiftMarker()
  destroyDestination()
  for forvar3, forvar4 in pairs(var0) do
    if isElement(forvar3) then
      destroyElement(forvar3)
      destroyElement(forvar4)
    end
  end
  var0 = {}
  current_box = false
  var1 = false
  removeEventHandler("onClientVehicleEnter", root, enterVehicleEvent)
end
function hitDestination(arg0, arg1)
  if var0[arg0] then
    if not isElementAttached(arg0) then
      return
    end
    destroyDestination()
    destroyElement(var0[arg0])
    destroyElement(arg0)
    var0[arg0] = nil
    current_box = false
    exports["job-system"]:givePlayerJobEXP(var1, 1)
    createBox()
  end
end
function leaveLiftColshape(arg0, arg1)
  if var0[arg0] then
    if not isElementAttached(arg0) then
      return
    end
    detachElements(arg0)
    current_box = false
  end
end
function hitLiftColshape(arg0, arg1)
  if var0[arg0] then
    if isElementAttached(arg0) then
      return
    end
    if not isPedInVehicle(localPlayer) then
      return
    end
    if current_box then
      return
    end
    if tostring(getVehicleComponentPosition(getPedOccupiedVehicle(localPlayer), "misc_a")) == "-0.38061952590942" then
      attachElements(arg0, getPedOccupiedVehicle(localPlayer), 0, 0.55, -0.05)
      current_box = arg0
      if getTickCount() - var1 > 2000 then
        exports.notifications:output({
          en = "Deliver the box to the specified location",
          ar = "\217\130\217\133 \216\168\216\170\217\136\216\181\217\138\217\132 \216\167\217\132\216\181\217\134\216\175\217\136\217\130 \216\165\217\132\217\137 \216\167\217\132\217\133\217\136\217\130\216\185 \216\167\217\132\217\133\216\173\216\175\216\175"
        }, 4000, "info")
        var1 = getTickCount()
      end
      createDestination()
    else
      exports.notifications:output({
        en = "The lift should be at the bottom",
        ar = "\216\167\217\132\216\177\216\167\217\129\216\185\216\169 \217\138\216\172\216\168 \216\163\217\134 \216\170\217\131\217\136\217\134 \217\129\217\138 \216\167\217\132\216\163\216\179\217\129\217\132"
      }, 3000, "warning")
    end
  end
end
addEvent("onClientPlayerStartJob", true)
addEventHandler("onClientPlayerStartJob", localPlayer, function(arg0)
  if arg0 ~= var0 then
    return
  end
  if isElement(lift_marker) then
    exports.notifications:output({
      en = "You already started the job",
      ar = "\217\132\217\130\216\175 \216\168\216\175\216\163\216\170 \216\167\217\132\216\185\217\133\217\132 \216\168\216\167\217\132\217\129\216\185\217\132"
    }, 3000, "warning")
    return
  end
  if isPedInVehicle(localPlayer) and var1[getElementModel((getPedOccupiedVehicle(localPlayer)))] then
    var2 = shuffle(var2)
    var3 = true
    attachLiftMarker((getPedOccupiedVehicle(localPlayer)))
    createBox()
    addEventHandler("onClientVehicleEnter", root, enterVehicleEvent)
    exports.notifications:output({
      en = "Go to the box location to take it",
      ar = "\216\167\216\176\217\135\216\168 \216\165\217\132\217\137 \217\133\217\136\217\130\216\185 \216\167\217\132\216\181\217\134\216\175\217\136\217\130 \217\132\216\163\216\174\216\176\217\135"
    }, 10000, "info")
    return
  end
  exports.notifications:output({
    en = "You should enter the job vehicle first",
    ar = "\217\138\216\172\216\168 \216\185\217\132\217\138\217\131 \216\175\216\174\217\136\217\132 \217\133\216\177\217\131\216\168\216\169 \216\167\217\132\216\185\217\133\217\132 \216\163\217\136\217\132\216\167\217\139"
  }, 4000, "warning")
end)
addEvent("onClientShowJobHelp", true)
addEventHandler("onClientShowJobHelp", localPlayer, function(arg0)
  if arg0 ~= var0 then
    return
  end
  outputChatBox("Follow These steps:", 255, 255, 0)
  outputChatBox("   1- \216\167\216\176\217\135\216\168 \217\132\217\132\217\133\217\138\217\134\216\167\216\161", 255, 255, 0)
  outputChatBox("   2- \216\167\216\177\217\131\216\168 \216\167\216\173\216\175\217\137 \216\167\217\132\217\133\216\177\217\131\216\168\216\167\216\170 \216\167\217\132\217\133\216\174\216\181\216\181\216\169 \217\132\217\132\217\136\216\184\217\138\217\129\216\169", 255, 255, 0)
  outputChatBox("   3- \216\167\217\131\216\170\216\168 /startjob", 255, 255, 0)
  outputChatBox("   4- \216\167\216\176\217\135\216\168 \217\132\217\132\217\133\217\136\217\130\216\185 \216\167\217\132\217\133\216\173\216\175\216\175 \217\132\217\131 \216\185\217\132\217\137 \216\167\217\132\216\174\216\177\217\138\216\183\216\169", 255, 255, 0)
  outputChatBox("   5- \216\167\216\173\217\133\217\132 \216\167\217\132\216\181\217\134\216\175\217\136\217\130 \216\185\217\132\217\137 \216\177\216\167\217\129\216\185\216\169 \216\167\217\132\217\133\216\177\217\131\216\168\216\169", 255, 255, 0)
  outputChatBox("   6- \217\130\217\133 \216\168\216\170\217\136\216\181\217\138\217\132 \216\167\217\132\216\181\217\134\216\175\217\136\217\130 \217\132\217\132\217\133\217\136\217\130\216\185 \216\167\217\132\217\133\216\183\217\132\217\136\216\168", 255, 255, 0)
end)
addEvent("onClientPlayerTakeJob", true)
addEventHandler("onClientPlayerTakeJob", localPlayer, function(arg0)
  if arg0 ~= var0 then
    return
  end
  outputChatBox("Type  /jobhelp  to view job instructions", 252, 132, 3)
  outputChatBox("\217\132\216\185\216\177\216\182 \216\170\216\185\217\132\217\138\217\133\216\167\216\170 \216\167\217\132\216\185\217\133\217\132  /jobhelp  \216\167\217\131\216\170\216\168", 252, 132, 3)
end)
addEvent("onClientPlayerQuitJob", true)
addEventHandler("onClientPlayerQuitJob", localPlayer, function(arg0)
  if arg0 == var0 then
    stopJob()
  end
end)
addEvent("onClientPlayerQuitFromCharacter", true)
addEventHandler("onClientPlayerQuitFromCharacter", localPlayer, function()
  stopJob()
end)
function shuffle(arg0)
  for forvar6 = #arg0, 2, -1 do
    arg0[forvar6], arg0[math.random(1, forvar6)] = arg0[math.random(1, forvar6)], arg0[forvar6]
  end
  return arg0
end
