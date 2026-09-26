-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

function UIKitReady()
  eui = exports.UIKit
  var0.window[1] = eui:uiCreateWindow(50, false, 250, 360, {en = "Barber", ar = "\216\173\217\132\216\167\217\130"}, _, "icons/scissors.png")
  eui:uiWindowSetMovable(var0.window[1], false)
  eui:uiSetVisible(var0.window[1], false)
  var0.gridlist.hairstyles = eui:uiCreateGridList(0, 30, 250, 255, tocolor(10, 10, 10, 0), var0.window[1])
  eui:uiGridListAddColumn(var0.gridlist.hairstyles, "Hair Styles", 0.7)
  eui:uiGridListAddColumn(var0.gridlist.hairstyles, "", 0.3)
  var0.button.close = eui:uiCreateButton(5, 325, 240, 30, {en = "Close", ar = "\216\165\216\186\217\132\216\167\217\130"}, tocolor(0, 0, 0), var0.window[1])
  var0.button.confirm = eui:uiCreateButton(5, 290, 240, 30, {en = "Confirm", ar = "\216\170\216\163\217\131\217\138\216\175"}, tocolor(0, 0, 0), var0.window[1])
  for forvar3, forvar4 in ipairs(hairstylesList) do
    eui:uiGridListSetItemText(var0.gridlist.hairstyles, eui:uiGridListAddRow(var0.gridlist.hairstyles), 1, forvar4[1])
    eui:uiGridListSetItemText(var0.gridlist.hairstyles, eui:uiGridListAddRow(var0.gridlist.hairstyles), 2, "$" .. forvar4[3])
    eui:uiGridListSetItemColor(var0.gridlist.hairstyles, eui:uiGridListAddRow(var0.gridlist.hairstyles), 2, tocolor(0, 255, 0))
    eui:uiGridListSetItemData(var0.gridlist.hairstyles, eui:uiGridListAddRow(var0.gridlist.hairstyles), 1, forvar3)
  end
end
addEventHandler("onClientUIReady", resourceRoot, UIKitReady)
addEventHandler("onClientUIKitReady", root, UIKitReady)
function closeUIWindows(arg0)
  cancelBarber()
end
addEventHandler("onClientPlayerQuitFromCharacter", localPlayer, closeUIWindows)
addEventHandler("onClientPlayerWasted", localPlayer, closeUIWindows)
function openBarberMenu()
  cTexture, cModel = getPedClothes(localPlayer, 1)
  eui:uiSetVisible(var0.window[1], true)
  showCursor(true)
end
function cancelBarber()
  eui:uiSetVisible(var0.window[1], false)
  showCursor(false)
  if current_chair and current_ped then
    if isElement(sound) then
      destroyElement(sound)
    end
    if isTimer(timer) then
      killTimer(timer)
    end
    setCameraTarget(localPlayer)
    setPedAnimation(localPlayer, "HAIRCUTS", "BRB_Sit_Out", _, false, false)
    if not confirm then
      triggerServerEvent("barber:set_hairstyle", localPlayer, cTexture, cModel)
    end
    setTimer(function()
      setElementCollisionsEnabled(current_chair, true)
      setPedAnimation(current_ped, nil)
      setPedAnimation(localPlayer, nil)
      confirm = false
    end, 3000, 1)
  end
end
addEventHandler("onClientUIDoubleClick", root, function()
  if source == var0.gridlist.hairstyles and eui:uiGridListGetSelectedItem(var0.gridlist.hairstyles) ~= -1 then
    if isTimer(timer) then
      return
    end
    hairstyle = hairstylesList[eui:uiGridListGetItemData(var0.gridlist.hairstyles, eui:uiGridListGetSelectedItem(var0.gridlist.hairstyles), 1)][1]
    model = hairstylesList[eui:uiGridListGetItemData(var0.gridlist.hairstyles, eui:uiGridListGetSelectedItem(var0.gridlist.hairstyles), 1)][2]
    price = hairstylesList[eui:uiGridListGetItemData(var0.gridlist.hairstyles, eui:uiGridListGetSelectedItem(var0.gridlist.hairstyles), 1)][3]
    if getPedClothes(localPlayer, 1) == hairstyle then
      exports.notifications:output({
        en = "This is your hairstyle already",
        ar = "\217\135\216\176\217\135 \217\130\216\181\216\169 \216\180\216\185\216\177\217\131 \216\167\217\132\216\173\216\167\217\132\217\138\216\169"
      }, 3000, "warning")
      hairstyle, model, price = nil, nil, nil
      return
    end
    setPedAnimation(current_ped, "HAIRCUTS", "BRB_Cut", _, false, false)
    sound = playSound("cut.wav", true)
    timer = setTimer(function()
      addPedClothes(localPlayer, hairstyle, model, 1)
      setPedAnimation(current_ped, "HAIRCUTS", "BRB_Cut_Out", _, false, false)
      if isElement(sound) then
        destroyElement(sound)
      end
    end, 1000, 1)
  end
end)
addEventHandler("onClientUIClick", root, function()
  if source == var0.button.close then
    cancelBarber()
  elseif source == var0.button.confirm and eui:uiGridListGetSelectedItem(var0.gridlist.hairstyles) ~= -1 then
    if hairstyle and model and price then
      if hairstyle ~= hairstylesList[eui:uiGridListGetItemData(var0.gridlist.hairstyles, eui:uiGridListGetSelectedItem(var0.gridlist.hairstyles), 1)][1] then
        exports.notifications:output({
          en = "You must try this hairstyle before confirm it",
          ar = "\217\138\216\172\216\168 \216\185\217\132\217\138\217\131 \216\170\216\172\216\177\216\168\216\169 \217\130\216\181\216\169 \216\167\217\132\216\180\216\185\216\177 \217\130\216\168\217\132 \216\167\217\132\216\170\216\163\217\131\217\138\216\175"
        }, 3000, "warning")
        return
      end
      if getPlayerMoney() < tonumber(price) then
        exports.notifications:output({
          en = "You do not have enough money",
          ar = "\217\132\217\138\216\179 \217\132\216\175\217\138\217\131 \217\133\216\167\217\132 \217\131\216\167\217\129\217\138"
        }, 3500, "error")
        return
      end
      triggerServerEvent("barber:set_hairstyle", localPlayer, hairstyle, model, (eui:uiGridListGetItemData(var0.gridlist.hairstyles, eui:uiGridListGetSelectedItem(var0.gridlist.hairstyles), 1)))
      confirm = true
      hairstyle, model, price = nil, nil, nil
    else
      exports.notifications:output({
        en = "You must try this hairstyle before confirm it",
        ar = "\217\138\216\172\216\168 \216\185\217\132\217\138\217\131 \216\170\216\172\216\177\216\168\216\169 \217\130\216\181\216\169 \216\167\217\132\216\180\216\185\216\177 \217\130\216\168\217\132 \216\167\217\132\216\170\216\163\217\131\217\138\216\175"
      }, 3000, "warning")
    end
  end
end)
for forvar7, forvar8 in ipairs(barber_shops) do
  setElementFrozen(createPed(unpack(forvar8.ped)), true)
  setElementInterior(createPed(unpack(forvar8.ped)), forvar8.interior)
  setElementInterior(createObject(unpack(forvar8.chair)), forvar8.interior)
  removeWorldModel(unpack(forvar8.chair_worldmodel))
  ;({})[createPed(unpack(forvar8.ped))] = {
    object = createObject(unpack(forvar8.chair))
  }
  ;({})[forvar8.interior] = {
    createPed(unpack(forvar8.ped)),
    (createObject(unpack(forvar8.chair)))
  }
end
addEvent("onClientPlayerInteriorChange", true)
addEventHandler("onClientPlayerInteriorChange", localPlayer, function(arg0, arg1)
  if var0[arg0] then
    for forvar6 = 1, #var0[arg0] do
      setElementDimension(var0[arg0][forvar6], arg1)
    end
  end
end)
addEvent("onClientElementMenuClick", true)
addEventHandler("onClientElementMenuClick", root, function(arg0, arg1, arg2)
  if arg1 == "Talk" then
    if not var0[arg0] then
      return
    end
    if not isElement(arg0) then
      return
    end
    if getElementType(arg0) == "ped" then
      if getElementModel(localPlayer) ~= 0 then
        exports.notifications:output("Sorry, this feature only for CJ skin", 3000, "error")
        return
      end
      openBarberMenu()
      current_ped = arg0
      current_chair = var0[arg0].object
      setElementCollisionsEnabled(var0[arg0].object, false)
      setElementPosition(localPlayer, 414.241, -19.926, 1001.805)
      setElementRotation(localPlayer, 0, 0, 90)
      setPedAnimation(localPlayer, "HAIRCUTS", "BRB_Sit_In", _, false, false)
      setCameraMatrix(414.713, -18.469, 1001.805, 413.411, -18.969, 1001.805)
    end
  end
end)
addEventHandler("onClientPedDamage", resourceRoot, function()
  cancelEvent()
end)
