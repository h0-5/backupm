-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

addEventHandler("onClientMarkerLeave", resourceRoot, function(arg0, arg1)
  if arg0 ~= localPlayer then
    return
  end
  if getElementData(source, "drug:crafting") then
    exports["inventory-system"]:hideCrafting()
  end
end)
addEvent("onClientElementMenuClick", true)
addEventHandler("onClientElementMenuClick", root, function(arg0, arg1, arg2)
  if not isElement(arg0) then
    return
  end
  if getElementType(arg0) == "ped" and getElementData(arg0, "ped:interact") == "job.drug_dealer" and arg1 == "Talk" then
    exports["job-system"]:showTakeJob("Drug Dealer", {
      en = "Drug Dealer Job",
      ar = "\217\136\216\184\217\138\217\129\216\169 \216\170\216\167\216\172\216\177 \217\133\217\133\217\134\217\136\216\185\216\167\216\170"
    }, {
      en = [[
You can not take this job if you are on duty

You will be able to grow cannabis and pack it in bags to be ready for use or sale]],
      ar = "\n\217\132\216\167\216\170\216\179\216\170\216\183\217\138\216\185 \216\163\216\174\216\176 \216\167\217\132\217\136\216\184\217\138\217\129\216\169 \216\165\216\176\216\167 \217\131\217\134\216\170 \216\175\216\167\216\174\217\132 \216\167\217\132\216\174\216\175\217\133\216\169\n\n\216\179\217\136\217\129 \216\170\216\170\217\133\217\131\217\134 \217\133\217\134 \216\178\216\177\216\167\216\185\216\169 \216\167\217\132\216\173\216\180\217\138\216\180 \217\136\216\170\216\186\217\132\217\138\217\129\217\135\n\217\132\217\138\217\131\217\136\217\134 \216\172\216\167\217\135\216\178 \217\132\217\132\216\167\216\179\216\170\216\174\216\175\216\167\217\133 \216\163\217\136 \216\167\217\132\216\168\217\138\216\185"
    })
  end
end)
addEvent("onClientRequestTakeJob", true)
addEventHandler("onClientRequestTakeJob", localPlayer, function(arg0)
  if arg0 == "Drug Dealer" then
    if getElementData(localPlayer, "duty:data") and getElementData(localPlayer, "duty:data").Status then
      outputChatBox("(( You must be off duty to take this job. ))", 255, 46, 46)
      return
    end
    triggerServerEvent("drug_dealer:takeJob", localPlayer)
  end
end)
addEvent("onClientPlayerQuitFromCharacter", true)
addEventHandler("onClientPlayerQuitFromCharacter", localPlayer, function()
  for forvar3, forvar4 in pairs(var0) do
    destroyElement(forvar3)
  end
  var0 = {}
end)
addEvent("drug_dealer:startFarming", true)
addEventHandler("drug_dealer:startFarming", root, function(arg0)
  if not getElementData(localPlayer, "character:id") then
    return
  end
  if isPedDead(localPlayer) then
    return
  end
  if isPedInVehicle(localPlayer) then
    return
  end
  if isPedOnGround(localPlayer) then
    if getElementData(localPlayer, "job") == "Drug Dealer" then
      if var0 and isElement(var0) and isElementWithinMarker(localPlayer, var0) then
        outputChatBox("You cannot plant over another plant.", 255, 60, 0)
        return
      end
      for forvar10, forvar11 in ipairs(getElementsByType("object", resourceRoot)) do
        if getElementInterior(forvar11) == getElementInterior(localPlayer) and getElementDimension(forvar11) == getElementDimension(localPlayer) and getDistanceBetweenPoints2D(getElementPosition(localPlayer)) <= 1 and getElementID(forvar11) and string.find(getElementID(forvar11), "plant:", 1, true) then
          outputChatBox("You cannot plant over another plant.", 255, 60, 0)
          return
        end
      end
      triggerServerEvent("drug_dealer:plant", localPlayer, plant_types[arg0].name, plant_types[arg0].model, getElementPosition(localPlayer))
      destroyElement((createObject(plant_types[arg0].model, getElementPosition(localPlayer))))
    else
      outputChatBox("You must be a drug dealer to be able to plant this seeds.", 255, 68, 0)
    end
  end
end)
addEvent("drug_dealer:createPlantMarker", true)
addEventHandler("drug_dealer:createPlantMarker", root, function(arg0, arg1, arg2, arg3)
  if isElementWithinMarker(localPlayer, (createMarker(arg0, arg1, arg2 - 0.7, "cylinder", 1, 7, 181, 54, 100))) then
    var0 = createMarker(arg0, arg1, arg2 - 0.7, "cylinder", 1, 7, 181, 54, 100)
  end
  var1[createMarker(arg0, arg1, arg2 - 0.7, "cylinder", 1, 7, 181, 54, 100)] = arg3
end)
addEvent("drug_dealer:syncPlantsMarkers", true)
addEventHandler("drug_dealer:syncPlantsMarkers", root, function(arg0)
  for forvar4, forvar5 in ipairs(arg0) do
    if isElementWithinMarker(localPlayer, (createMarker(unpack(forvar5[2])))) then
      var0 = createMarker(unpack(forvar5[2]))
    end
    var1[createMarker(unpack(forvar5[2]))] = forvar5[1]
  end
end)
addEventHandler("onClientMarkerHit", resourceRoot, function(arg0, arg1)
  if not arg1 then
    return
  end
  if arg0 ~= localPlayer then
    return
  end
  if var0[source] and isElement(var0[source]) then
    var1 = source
    if isPedOnGround(localPlayer) and not isObjectMoving(var0[source]) then
      if isPedInVehicle(localPlayer) then
        return
      end
      bindKey("H", "down", harvestKey, source)
      exports.notifications:showKeyDescription("drug:harvest", "H", "Harvest")
    end
  end
end)
addEventHandler("onClientMarkerLeave", resourceRoot, function(arg0, arg1)
  if arg0 ~= localPlayer then
    return
  end
  if var0[source] then
    var1 = false
    if isElement(var0[source]) and isObjectMoving(var0[source]) then
    else
      unbindKey("H", "down", harvestKey, source)
      exports.notifications:hideKeyDescription("drug:harvest")
    end
  end
end)
function harvestKey(arg0, arg1, arg2)
  if isElement(arg2) then
    if var0 then
      return
    end
    if isPedDead(localPlayer) then
      return
    end
    if isPedInVehicle(localPlayer) then
      return
    end
    if not isPedOnGround(localPlayer) then
      return
    end
    if var1[arg2] and getElementID(var1[arg2]) then
      var0 = true
      var2 = arg2
      triggerServerEvent("drug_dealer:harvest", localPlayer, split(getElementID(var1[arg2]), ":")[2])
      unbindKey("H", "down", harvestKey, source)
      exports.notifications:hideKeyDescription("drug:harvest")
    end
  end
end
addEvent("drug_dealer:harvest:callback", true)
addEventHandler("drug_dealer:harvest:callback", localPlayer, function(arg0)
  if arg0 and isElement(var0) then
    destroyElement(var0)
    var1[var0] = nil
  end
  var0 = false
  var2 = false
end)
addEventHandler("onClientElementDestroy", resourceRoot, function()
  if getElementType(source) == "object" then
    for forvar3, forvar4 in pairs(var0) do
      if forvar4 == source then
        if forvar3 ~= var1 and isElement(forvar3) then
          var0[forvar3] = nil
          destroyElement(forvar3)
        end
        break
      end
    end
  end
end)
