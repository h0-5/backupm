-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

function glue()
  if not getPedOccupiedVehicle((getLocalPlayer())) then
    if not isElement((getPedContactElement((getLocalPlayer())))) then
      return
    end
    if getElementType((getPedContactElement((getLocalPlayer())))) == "vehicle" then
      triggerServerEvent("gluePlayer", getLocalPlayer(), getPedWeaponSlot((getLocalPlayer())), getPedContactElement((getLocalPlayer())), -math.cos((math.rad(getElementRotation((getPedContactElement((getLocalPlayer()))))))) * math.sin((math.rad(getElementRotation((getPedContactElement((getLocalPlayer()))))))) * (getElementPosition((getLocalPlayer())) - getElementPosition((getPedContactElement((getLocalPlayer()))))) + (-math.sin((math.rad(getElementRotation((getPedContactElement((getLocalPlayer()))))))) * math.sin((math.rad(getElementRotation((getPedContactElement((getLocalPlayer()))))))) * math.sin((math.rad(getElementRotation((getPedContactElement((getLocalPlayer()))))))) + math.cos((math.rad(getElementRotation((getPedContactElement((getLocalPlayer()))))))) * math.cos((math.rad(getElementRotation((getPedContactElement((getLocalPlayer())))))))) * (getElementPosition((getLocalPlayer())) - getElementPosition((getPedContactElement((getLocalPlayer()))))) + (math.cos((math.rad(getElementRotation((getPedContactElement((getLocalPlayer()))))))) * math.sin((math.rad(getElementRotation((getPedContactElement((getLocalPlayer()))))))) * math.sin((math.rad(getElementRotation((getPedContactElement((getLocalPlayer()))))))) + math.sin((math.rad(getElementRotation((getPedContactElement((getLocalPlayer()))))))) * math.cos((math.rad(getElementRotation((getPedContactElement((getLocalPlayer())))))))) * (getElementPosition((getLocalPlayer())) - getElementPosition((getPedContactElement((getLocalPlayer()))))), math.sin((math.rad(getElementRotation((getPedContactElement((getLocalPlayer()))))))) * (getElementPosition((getLocalPlayer())) - getElementPosition((getPedContactElement((getLocalPlayer()))))) - math.sin((math.rad(getElementRotation((getPedContactElement((getLocalPlayer()))))))) * math.cos((math.rad(getElementRotation((getPedContactElement((getLocalPlayer()))))))) * (getElementPosition((getLocalPlayer())) - getElementPosition((getPedContactElement((getLocalPlayer()))))) + math.cos((math.rad(getElementRotation((getPedContactElement((getLocalPlayer()))))))) * math.cos((math.rad(getElementRotation((getPedContactElement((getLocalPlayer()))))))) * (getElementPosition((getLocalPlayer())) - getElementPosition((getPedContactElement((getLocalPlayer()))))), math.cos((math.rad(getElementRotation((getPedContactElement((getLocalPlayer()))))))) * math.cos((math.rad(getElementRotation((getPedContactElement((getLocalPlayer()))))))) * (getElementPosition((getLocalPlayer())) - getElementPosition((getPedContactElement((getLocalPlayer()))))) + (math.sin((math.rad(getElementRotation((getPedContactElement((getLocalPlayer()))))))) * math.sin((math.rad(getElementRotation((getPedContactElement((getLocalPlayer()))))))) * math.cos((math.rad(getElementRotation((getPedContactElement((getLocalPlayer()))))))) + math.cos((math.rad(getElementRotation((getPedContactElement((getLocalPlayer()))))))) * math.sin((math.rad(getElementRotation((getPedContactElement((getLocalPlayer())))))))) * (getElementPosition((getLocalPlayer())) - getElementPosition((getPedContactElement((getLocalPlayer()))))) + (-math.cos((math.rad(getElementRotation((getPedContactElement((getLocalPlayer()))))))) * math.sin((math.rad(getElementRotation((getPedContactElement((getLocalPlayer()))))))) * math.cos((math.rad(getElementRotation((getPedContactElement((getLocalPlayer()))))))) + math.sin((math.rad(getElementRotation((getPedContactElement((getLocalPlayer()))))))) * math.sin((math.rad(getElementRotation((getPedContactElement((getLocalPlayer())))))))) * (getElementPosition((getLocalPlayer())) - getElementPosition((getPedContactElement((getLocalPlayer()))))), 0 - getElementRotation((getPedContactElement((getLocalPlayer())))), 0 - getElementRotation((getPedContactElement((getLocalPlayer())))), getPedRotation((getLocalPlayer())) - getElementRotation((getPedContactElement((getLocalPlayer())))))
      unbindKey("x", "down", glue)
      bindKey("x", "down", unglue)
      bindKey("jump", "down", unglue)
      addEventHandler("onClientElementDestroy", getPedContactElement((getLocalPlayer())), elementDestroyEvent)
    end
  end
end
addCommandHandler("glue", glue)
function unglue()
  triggerServerEvent("ungluePlayer", (getLocalPlayer()))
  unbindKey("jump", "down", unglue)
  unbindKey("x", "down", unglue)
  bindKey("x", "down", glue)
  removeEventHandler("onClientElementDestroy", vehicle, elementDestroyEvent)
end
addCommandHandler("unglue", unglue)
bindKey("x", "down", glue)
function elementDestroyEvent()
  unglue()
end
