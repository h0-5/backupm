-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

bindKey("b", "down", "chatbox", "LocalOOC")
bindKey("u", "down", "chatbox", "quickreply")
addCommandHandler("clearchat", function()
  clearChatBox()
end, false, false)
function outputMe(arg0, arg1, arg2, arg3)
  triggerServerEvent("chat:outputMe", arg0, arg1, arg2, arg3)
end
addEvent("chat:playPMSound", true)
addEventHandler("chat:playPMSound", root, function(arg0)
  if playSound("notification_sound.mp3") then
    setSoundVolume(playSound("notification_sound.mp3"), 1)
  end
  if arg0 then
    setClipboard(arg0)
  end
end)
function addBubble(arg0, arg1, arg2, arg3, arg4, arg5, arg6)
-- fail 71
null
12
-- fail 80
null
12
-- fail 89
null
12
  if not var0[arg1] then
    var0[arg1] = {}
  end
  if arg5 == "status" then
    for forvar12, forvar13 in pairs(var0) do
      for forvar17, forvar18 in ipairs(forvar13) do
        if forvar18.type == "status" then
          if arg0 == "" then
            table.remove(var0[forvar18.player], forvar17)
          else
            var0[forvar18.player][forvar17].text = arg0
          end
          return
        end
      end
    end
  end
  table.insert(var0[arg1], {
    text = arg0,
    player = arg1,
    type = arg5 or "0",
    tick = arg2,
    endTime = arg2 + 2000 + 1500,
    alpha = 0,
    texture = false,
    Color = {
      0,
      0,
      0,
      255
    },
    LineColor = {
      255,
      55,
      95,
      230
    },
    FontColor = {
      255,
      255,
      255,
      255
    }
  })
end
function removeBubble()
  table.remove(var0)
end
addEvent("onChatIncome", true)
addEventHandler("onChatIncome", root, function(arg0, arg1)
  if getElementInterior(source) == getElementInterior(localPlayer) and getElementDimension(source) == getElementDimension(localPlayer) then
    if arg1 == 0 then
      addBubble(arg0, source, getTickCount())
    elseif arg1 == 1 then
      addBubble(arg0, source, getTickCount(), {
        208,
        132,
        249,
        255
      }, {
        208,
        132,
        249,
        255
      }, "me", {
        0,
        0,
        0,
        255
      })
    elseif arg1 == 2 then
      addBubble(arg0, source, getTickCount(), {
        157,
        95,
        243
      }, {
        157,
        95,
        243
      }, "status")
    end
  end
end)
function UIKitReady()
  eui = exports.UIKit
  var0 = eui:getUIFont("ui-default")
end
addEventHandler("onClientUIReady", resourceRoot, UIKitReady)
addEventHandler("onClientUIKitReady", root, UIKitReady)
addEventHandler("onClientRender", root, function()
  for forvar7, forvar8 in pairs(var0) do
    for forvar12, forvar13 in ipairs(forvar8) do
      if isElement(forvar13.player) and (forvar13.type ~= "0" or forvar13.type == "0" and not isPedInVehicle(localPlayer)) then
        if getTickCount() - forvar13.tick < var1[forvar13.type] then
          if getDistanceBetweenPoints3D(getElementPosition(localPlayer)) < var2 and isLineOfSightClear(getElementPosition(localPlayer)) and getScreenFromWorldPosition(getPedBonePosition(forvar13.player, 8)) and getScreenFromWorldPosition(getPedBonePosition(forvar13.player, 8)) then
            if not forvar13.yPos then
              forvar13.yPos = getScreenFromWorldPosition(getPedBonePosition(forvar13.player, 8))
            end
            dxDrawRectangle(var4(getScreenFromWorldPosition(getPedBonePosition(forvar13.player, 8)) - dxGetTextWidth(forvar13.text:gsub("#%x%x%x%x%x%x", ""), 1, var3) / 2 - 10), var4(getScreenFromWorldPosition(getPedBonePosition(forvar13.player, 8)) - 19 * forvar12 - 5), var4(dxGetTextWidth(forvar13.text:gsub("#%x%x%x%x%x%x", ""), 1, var3) + 16), var4(17 * #split(forvar13.text, "\n")), tocolor(forvar13.Color[1], forvar13.Color[2], forvar13.Color[3], forvar13.Color[4] or 210))
            dxDrawText(forvar13.text, var4(getScreenFromWorldPosition(getPedBonePosition(forvar13.player, 8)) - dxGetTextWidth(forvar13.text:gsub("#%x%x%x%x%x%x", ""), 1, var3) / 2 - 10), var4(getScreenFromWorldPosition(getPedBonePosition(forvar13.player, 8)) - 19 * forvar12 - 6), var4(getScreenFromWorldPosition(getPedBonePosition(forvar13.player, 8)) - dxGetTextWidth(forvar13.text:gsub("#%x%x%x%x%x%x", ""), 1, var3) / 2 - 10 + dxGetTextWidth(forvar13.text:gsub("#%x%x%x%x%x%x", ""), 1, var3) + 16), var4(getScreenFromWorldPosition(getPedBonePosition(forvar13.player, 8)) - 19 * forvar12 - 6 + 17 * #split(forvar13.text, "\n")), tocolor(forvar13.FontColor[1], forvar13.FontColor[2], forvar13.FontColor[3], forvar13.FontColor[4]), 1, var3, "center", "center", false, false, false, true)
          end
        else
          table.remove(var0[forvar13.player], forvar12)
        end
      else
        table.remove(var0[forvar13.player], forvar12)
      end
    end
  end
  for forvar10 = 1, #getElementsWithinRange(getElementPosition(localPlayer)) do
    if getElementData(getElementsWithinRange(getElementPosition(localPlayer))[forvar10], "character:status") and isElementOnScreen(getElementsWithinRange(getElementPosition(localPlayer))[forvar10]) and getScreenFromWorldPosition(getPedBonePosition(getElementsWithinRange(getElementPosition(localPlayer))[forvar10], 2)) and getScreenFromWorldPosition(getPedBonePosition(getElementsWithinRange(getElementPosition(localPlayer))[forvar10], 2)) then
      dxDrawText(tostring((getElementData(getElementsWithinRange(getElementPosition(localPlayer))[forvar10], "character:status"))), var4(getScreenFromWorldPosition(getPedBonePosition(getElementsWithinRange(getElementPosition(localPlayer))[forvar10], 2)) - 250 / 2) + 1, getScreenFromWorldPosition(getPedBonePosition(getElementsWithinRange(getElementPosition(localPlayer))[forvar10], 2)) + 1, var4(getScreenFromWorldPosition(getPedBonePosition(getElementsWithinRange(getElementPosition(localPlayer))[forvar10], 2)) - 250 / 2) + 250 + 1, getScreenFromWorldPosition(getPedBonePosition(getElementsWithinRange(getElementPosition(localPlayer))[forvar10], 2)) + 1, tocolor(0, 0, 0, 200), 1, "default-bold", "center", "center", false, true, false, false)
      dxDrawText(tostring((getElementData(getElementsWithinRange(getElementPosition(localPlayer))[forvar10], "character:status"))), var4(getScreenFromWorldPosition(getPedBonePosition(getElementsWithinRange(getElementPosition(localPlayer))[forvar10], 2)) - 250 / 2), getScreenFromWorldPosition(getPedBonePosition(getElementsWithinRange(getElementPosition(localPlayer))[forvar10], 2)))
    end
  end
end)
