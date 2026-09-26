-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

addEventHandler("onClientResourceStart", resourceRoot, function()
  engineImportTXD(engineLoadTXD("models/lifts.txd", 1913), 1913)
  engineImportTXD(engineLoadTXD("models/lifts.txd", 1913), 1914)
  engineReplaceCOL(engineLoadCOL("models/liftposts.col"), 1913)
  engineReplaceModel(engineLoadDFF("models/liftposts.dff"), 1913)
  engineReplaceCOL(engineLoadCOL("models/ramps.col"), 1914)
  engineReplaceModel(engineLoadDFF("models/ramps.dff"), 1914)
  engineImportTXD(engineLoadTXD("models/Helmet1.txd"), 1905)
  engineReplaceModel(engineLoadDFF("models/Helmet1.dff"), 1905)
  for forvar10, forvar11 in pairs(var0) do
    engineImportTXD(engineLoadTXD("models/" .. forvar10 .. ".txd"), forvar11)
    engineReplaceModel(engineLoadDFF("models/" .. forvar10 .. ".dff"), forvar11)
  end
  bindKey("rshift", "down", gatesKey)
end)
function gatesKey()
  if isPedDead(localPlayer) then
    return
  end
  if not getElementData(localPlayer, "character:id") then
    return
  end
  if getTickCount() - var0 > 2000 then
    for forvar10, forvar11 in ipairs((getElementsWithinRange(getElementPosition(localPlayer)))) do
      if getElementData(forvar11, "item:data") and getElementData(forvar11, "item:data").Type == "Gate" then
        table.insert({}, {
          forvar11,
          getDistanceBetweenPoints3D(getElementPosition(localPlayer))
        })
      end
    end
    if #{} > 0 then
      table.sort({}, function(arg0, arg1)
        return tonumber(arg0[2]) < tonumber(arg1[2])
      end)
      triggerServerEvent("gates:control", localPlayer, ({})[1][1])
      var0 = getTickCount()
    end
  end
end
function ClickElements(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7)
  if arg0 == "left" and arg1 == "up" then
    if isPlayerMapVisible() then
      return
    end
    if isElement(arg7) and getDistanceBetweenPoints3D(getElementPosition(localPlayer)) <= 3 then
      if arg7 == localPlayer then
        if isElementAttached(localPlayer) then
          detachElements(localPlayer)
          triggerServerEvent("setAnimation", localPlayer, nil, nil)
        end
      elseif getElementType(arg7) == "object" and (getElementModel(arg7) == 1721 or getElementModel(arg7) == 1722 or getElementModel(arg7) == 1714 or getElementModel(arg7) == 2310) then
        if getElementModel(arg7) == 1721 or getElementModel(arg7) == 1722 then
          attachElements(localPlayer, arg7, 0, 0.2, 1.3)
          setElementRotation(localPlayer, 0, 0, getElementRotation(arg7))
        elseif getElementModel(arg7) == 1714 then
          attachElements(localPlayer, arg7, 0, -0.05, 1.3)
          setElementRotation(localPlayer, 0, 0, getElementRotation(arg7) + 180)
        elseif getElementModel(arg7) == 2310 then
          attachElements(localPlayer, arg7, 0, 0, 0.8)
          setElementRotation(localPlayer, 0, 0, getElementRotation(arg7) + 90)
        end
        triggerServerEvent("setAnimation", localPlayer, "FOOD", "FF_Sit_Loop", -1, true, false, true, true)
      end
    end
  end
end
function ClickElements(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7)
  if arg0 == "right" and arg1 == "up" then
    if isPlayerMapVisible() then
      return
    end
    if isElement(arg7) and getElementType(arg7) == "object" and getDistanceBetweenPoints3D(getElementPosition(localPlayer)) <= 2 and (getElementModel(arg7) == 1808 or getElementModel(arg7) == 1721 or getElementModel(arg7) == 1722 or getElementModel(arg7) == 1714 or getElementModel(arg7) == 2310 or getElementModel(arg7) == 1715 or getElementModel(arg7) == 1671 or getElementModel(arg7) == 1663 or getElementModel(arg7) == 2190) then
      exports.interaction:showInteract(arg7, arg2, arg3)
    end
  end
end
addEventHandler("onClientClick", root, ClickElements)
SheetWindow = guiCreateWindow((guiGetScreenSize() - 396) / 2, (guiGetScreenSize() - 541) / 2, 396, 541, "Sheet", false)
guiWindowSetSizable(SheetWindow, false)
guiSetVisible(SheetWindow, false)
SheetMemo = guiCreateMemo(9, 25, 377, 469, "", false, SheetWindow)
guiSetProperty(SheetMemo, "MaxTextLength", "500")
SaveSheetButton = guiCreateButton(10, 499, 98, 32, "Save Note", false, SheetWindow)
CloseSheetButton = guiCreateButton(113, 499, 98, 32, "Close", false, SheetWindow)
CurrentSheet = {}
addEventHandler("onClientGUIClick", resourceRoot, function()
  if source == SaveSheetButton then
    if unpack(CurrentSheet) then
      triggerServerEvent("objects:save_note_item", localPlayer, unpack(CurrentSheet))
    else
      triggerServerEvent("objects:save_note_item", localPlayer, unpack(CurrentSheet))
    end
  elseif source == CloseSheetButton then
    guiSetVisible(SheetWindow, false)
  end
end)
addEvent("onClientUseItem", true)
addEventHandler("onClientUseItem", root, function(arg0, arg1, arg2, arg3)
  if arg2.Name == "Sheet" then
    guiSetVisible(SheetWindow, true)
    guiSetText(SheetMemo, tostring(arg2.SpecialProperties.Note))
    CurrentSheet = {
      arg1,
      arg2.ID,
      arg3,
      arg2
    }
  end
end)
addEvent("onClientElementMenuClick", true)
addEventHandler("onClientElementMenuClick", root, function(arg0, arg1, arg2)
  if arg1 == "Talk" then
    if not isElement(arg0) then
      return
    end
    if getElementType(arg0) == "ped" and getElementData(arg0, "ped:interact") == "key.duplicator" then
      eui:uiSetVisible(var0.window.keys_duplicator, true)
      showCursor(true)
    end
  end
end)
function dxDrawEmptyLine(arg0, arg1, arg2, arg3, arg4, arg5, arg6)
  dxDrawLine(arg0, arg1, arg0 + arg2, arg1, arg4, arg5, arg6)
  dxDrawLine(arg0, arg1, arg0, arg1 + arg3, arg4, arg5, arg6)
  dxDrawLine(arg0, arg1 + arg3, arg0 + arg2, arg1 + arg3, arg4, arg5, arg6)
  dxDrawLine(arg0 + arg2, arg1, arg0 + arg2, arg1 + arg3, arg4, arg5, arg6)
end
function isMouseInPosition(arg0, arg1, arg2, arg3)
  if isCursorShowing() and arg0 <= getCursorPosition() * var0 and arg1 <= getCursorPosition() * var1 and getCursorPosition() * var0 <= arg0 + arg2 and getCursorPosition() * var1 <= arg1 + arg3 then
    return true
  end
end
;({
  hoverBtn = "",
  text = "",
  screen = "numbers",
  currentContact = "",
  callCount = false,
  callData = false,
  state = false
}).draw = function()
  dxDrawRectangle(unpack({
    (var0 - 150) / 2,
    (var1 - 250) / 2,
    150,
    260
  }))
  dxDrawEmptyLine(unpack({
    (var0 - 150) / 2,
    (var1 - 250) / 2,
    150,
    260
  }))
  dxDrawEmptyLine(unpack({
    (var0 - 150) / 2,
    (var1 - 250) / 2,
    150,
    260
  }) + 5, unpack({
    (var0 - 150) / 2,
    (var1 - 250) / 2,
    150,
    260
  }) + 5, unpack({
    (var0 - 150) / 2,
    (var1 - 250) / 2,
    150,
    260
  }) - 10, 30, tocolor(255, 255, 255, 180), 2, false)
  dxDrawText(tostring(var2.text), unpack({
    (var0 - 150) / 2,
    (var1 - 250) / 2,
    150,
    260
  }) + 5, unpack({
    (var0 - 150) / 2,
    (var1 - 250) / 2,
    150,
    260
  }) + 5, unpack({
    (var0 - 150) / 2,
    (var1 - 250) / 2,
    150,
    260
  }) + 5 + unpack({
    (var0 - 150) / 2,
    (var1 - 250) / 2,
    150,
    260
  }) - 10, unpack({
    (var0 - 150) / 2,
    (var1 - 250) / 2,
    150,
    260
  }) + 5 + 30, tocolor(255, 255, 255, 180), 1.2, "default", "center", "center", false, false, false, false, false)
  var2.hoverBtn = ""
  if var2.screen == "numbers" then
    for forvar9, forvar10 in ipairs({
      "1",
      "2",
      "3",
      "4",
      "5",
      "6",
      "7",
      "8",
      "9",
      "*",
      "0",
      "#"
    }) do
      if not isMouseInPosition(unpack({
        (var0 - 150) / 2,
        (var1 - 250) / 2,
        150,
        260
      }) + 10, unpack({
        (var0 - 150) / 2,
        (var1 - 250) / 2,
        150,
        260
      }) + 45, 40, 40) or not tocolor(255, 55, 95) then
      end
      dxDrawRectangle(unpack({
        (var0 - 150) / 2,
        (var1 - 250) / 2,
        150,
        260
      }) + 10, unpack({
        (var0 - 150) / 2,
        (var1 - 250) / 2,
        150,
        260
      }) + 45, 40, 40, tocolor(150, 150, 150, 240), false)
      dxDrawEmptyLine(unpack({
        (var0 - 150) / 2,
        (var1 - 250) / 2,
        150,
        260
      }) + 10, unpack({
        (var0 - 150) / 2,
        (var1 - 250) / 2,
        150,
        260
      }) + 45, 40, 40, tocolor(150, 150, 150, 240), 2, false)
      dxDrawText(forvar10, unpack({
        (var0 - 150) / 2,
        (var1 - 250) / 2,
        150,
        260
      }) + 10, unpack({
        (var0 - 150) / 2,
        (var1 - 250) / 2,
        150,
        260
      }) + 45, unpack({
        (var0 - 150) / 2,
        (var1 - 250) / 2,
        150,
        260
      }) + 10 + 40, unpack({
        (var0 - 150) / 2,
        (var1 - 250) / 2,
        150,
        260
      }) + 45 + 40, tocolor(0, 0, 0, 250), 1.5, "default", "center", "center", false, false, false, false, false)
      if isMouseInPosition(unpack({
        (var0 - 150) / 2,
        (var1 - 250) / 2,
        150,
        260
      }) + 10, unpack({
        (var0 - 150) / 2,
        (var1 - 250) / 2,
        150,
        260
      }) + 45, 40, 40) then
        var2.hoverBtn = forvar10
      end
      if unpack({
        (var0 - 150) / 2,
        (var1 - 250) / 2,
        150,
        260
      }) + 10 + 40 + 5 > unpack({
        (var0 - 150) / 2,
        (var1 - 250) / 2,
        150,
        260
      }) + 140 then
      end
    end
    if not isMouseInPosition(unpack({
      (var0 - 150) / 2,
      (var1 - 250) / 2,
      150,
      260
    }) + 10, unpack({
      (var0 - 150) / 2,
      (var1 - 250) / 2,
      150,
      260
    }) + 45 + 40 + 5 + 5, 62, 20) or not tocolor(255, 55, 95) then
    end
    dxDrawRectangle(unpack({
      (var0 - 150) / 2,
      (var1 - 250) / 2,
      150,
      260
    }) + 10, unpack({
      (var0 - 150) / 2,
      (var1 - 250) / 2,
      150,
      260
    }) + 45 + 40 + 5 + 5, 62, 20, tocolor(0, 150, 0, 240), false)
    dxDrawEmptyLine(unpack({
      (var0 - 150) / 2,
      (var1 - 250) / 2,
      150,
      260
    }) + 10, unpack({
      (var0 - 150) / 2,
      (var1 - 250) / 2,
      150,
      260
    }) + 45 + 40 + 5 + 5, 62, 20, tocolor(0, 150, 0, 240), 2, false)
    dxDrawText("Call", unpack({
      (var0 - 150) / 2,
      (var1 - 250) / 2,
      150,
      260
    }) + 10, unpack({
      (var0 - 150) / 2,
      (var1 - 250) / 2,
      150,
      260
    }) + 45 + 40 + 5 + 5, unpack({
      (var0 - 150) / 2,
      (var1 - 250) / 2,
      150,
      260
    }) + 10 + 65 - 3, unpack({
      (var0 - 150) / 2,
      (var1 - 250) / 2,
      150,
      260
    }) + 45 + 40 + 5 + 5 + 20, tocolor(0, 0, 0, 250), 1.2, "default", "center", "center", false, false, false, false, false)
    if isMouseInPosition(unpack({
      (var0 - 150) / 2,
      (var1 - 250) / 2,
      150,
      260
    }) + 10, unpack({
      (var0 - 150) / 2,
      (var1 - 250) / 2,
      150,
      260
    }) + 45 + 40 + 5 + 5, 62, 20) then
      var2.hoverBtn = "Call"
    end
    if not isMouseInPosition(unpack({
      (var0 - 150) / 2,
      (var1 - 250) / 2,
      150,
      260
    }) + 10 + 65 + 3, unpack({
      (var0 - 150) / 2,
      (var1 - 250) / 2,
      150,
      260
    }) + 45 + 40 + 5 + 5, 62, 20) or not tocolor(255, 55, 95) then
    end
    dxDrawRectangle(unpack({
      (var0 - 150) / 2,
      (var1 - 250) / 2,
      150,
      260
    }) + 10 + 65 + 3, unpack({
      (var0 - 150) / 2,
      (var1 - 250) / 2,
      150,
      260
    }) + 45 + 40 + 5 + 5, 62, 20, tocolor(150, 0, 0, 240), false)
    dxDrawEmptyLine(unpack({
      (var0 - 150) / 2,
      (var1 - 250) / 2,
      150,
      260
    }) + 10 + 65 + 3, unpack({
      (var0 - 150) / 2,
      (var1 - 250) / 2,
      150,
      260
    }) + 45 + 40 + 5 + 5, 62, 20, tocolor(150, 0, 0, 240), 2, false)
    dxDrawText("Cancel", unpack({
      (var0 - 150) / 2,
      (var1 - 250) / 2,
      150,
      260
    }) + 10 + 65 + 3, unpack({
      (var0 - 150) / 2,
      (var1 - 250) / 2,
      150,
      260
    }) + 45 + 40 + 5 + 5, unpack({
      (var0 - 150) / 2,
      (var1 - 250) / 2,
      150,
      260
    }) + 10 + 65 + 3 + 65 - 3, unpack({
      (var0 - 150) / 2,
      (var1 - 250) / 2,
      150,
      260
    }) + 45 + 40 + 5 + 5 + 20, tocolor(0, 0, 0, 250), 1.2, "default", "center", "center", false, false, false, false, false)
    if isMouseInPosition(unpack({
      (var0 - 150) / 2,
      (var1 - 250) / 2,
      150,
      260
    }) + 10 + 65 + 3, unpack({
      (var0 - 150) / 2,
      (var1 - 250) / 2,
      150,
      260
    }) + 45 + 40 + 5 + 5, 62, 20) then
      var2.hoverBtn = "Cancel"
    end
  elseif var2.screen == "call" then
    if math.floor(math.floor((getTickCount() - var2.callCount) / 1000) * 0.3) > getPlayerMoney(localPlayer) then
      var2.screen = ""
      triggerServerEvent("onPlayerEndCall", localPlayer, var2.callData)
    end
    dxDrawText(tostring(msToTimeStr((math.floor((getTickCount() - var2.callCount) / 1000)))) .. [[

$]] .. tostring((math.floor(math.floor((getTickCount() - var2.callCount) / 1000) * 0.3))), unpack({
      (var0 - 150) / 2,
      (var1 - 250) / 2,
      150,
      260
    }))
    if not isMouseInPosition(unpack({
      (var0 - 150) / 2,
      (var1 - 250) / 2,
      150,
      260
    }) + 10, unpack({
      (var0 - 150) / 2,
      (var1 - 250) / 2,
      150,
      260
    }) + unpack({
      (var0 - 150) / 2,
      (var1 - 250) / 2,
      150,
      260
    }) - 25, unpack({
      (var0 - 150) / 2,
      (var1 - 250) / 2,
      150,
      260
    }) - 20, 20) or not tocolor(255, 55, 95) then
    end
    dxDrawRectangle(unpack({
      (var0 - 150) / 2,
      (var1 - 250) / 2,
      150,
      260
    }) + 10, unpack({
      (var0 - 150) / 2,
      (var1 - 250) / 2,
      150,
      260
    }) + unpack({
      (var0 - 150) / 2,
      (var1 - 250) / 2,
      150,
      260
    }) - 25, unpack({
      (var0 - 150) / 2,
      (var1 - 250) / 2,
      150,
      260
    }) - 20, 20, tocolor(150, 0, 0, 240), false)
    dxDrawEmptyLine(unpack({
      (var0 - 150) / 2,
      (var1 - 250) / 2,
      150,
      260
    }) + 10, unpack({
      (var0 - 150) / 2,
      (var1 - 250) / 2,
      150,
      260
    }) + unpack({
      (var0 - 150) / 2,
      (var1 - 250) / 2,
      150,
      260
    }) - 25, unpack({
      (var0 - 150) / 2,
      (var1 - 250) / 2,
      150,
      260
    }) - 20, 20, tocolor(150, 0, 0, 240), 2, false)
    dxDrawText("End Call", unpack({
      (var0 - 150) / 2,
      (var1 - 250) / 2,
      150,
      260
    }) + 10, unpack({
      (var0 - 150) / 2,
      (var1 - 250) / 2,
      150,
      260
    }) + unpack({
      (var0 - 150) / 2,
      (var1 - 250) / 2,
      150,
      260
    }) - 25, unpack({
      (var0 - 150) / 2,
      (var1 - 250) / 2,
      150,
      260
    }) + 10 + unpack({
      (var0 - 150) / 2,
      (var1 - 250) / 2,
      150,
      260
    }) - 20, unpack({
      (var0 - 150) / 2,
      (var1 - 250) / 2,
      150,
      260
    }) + unpack({
      (var0 - 150) / 2,
      (var1 - 250) / 2,
      150,
      260
    }) - 25 + 20, tocolor(0, 0, 0, 250), 1.2, "default", "center", "center", false, false, false, false, false)
    if isMouseInPosition(unpack({
      (var0 - 150) / 2,
      (var1 - 250) / 2,
      150,
      260
    }) + 10, unpack({
      (var0 - 150) / 2,
      (var1 - 250) / 2,
      150,
      260
    }) + unpack({
      (var0 - 150) / 2,
      (var1 - 250) / 2,
      150,
      260
    }) - 25, unpack({
      (var0 - 150) / 2,
      (var1 - 250) / 2,
      150,
      260
    }) - 20, 20) then
      var2.hoverBtn = "End Call"
    end
  end
end
;({
  hoverBtn = "",
  text = "",
  screen = "numbers",
  currentContact = "",
  callCount = false,
  callData = false,
  state = false
}).click = function(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7)
  if arg0 == "left" and arg1 == "down" and var0.hoverBtn ~= "" then
    if getTickCount() - var1 <= 1000 then
      return
    end
    var1 = getTickCount()
    if var0.hoverBtn == "Call" then
      triggerServerEvent("phone:phoneCall", localPlayer, tostring(var0.text), "11111")
    elseif var0.hoverBtn == "Cancel" then
      var0.close()
    elseif var0.hoverBtn == "End Call" then
      triggerServerEvent("onPlayerEndCall", localPlayer, var0.callData)
    elseif #var0.text < 10 then
      var0.text = tostring(var0.text) .. "" .. tostring(var0.hoverBtn)
    end
  end
end
;({
  hoverBtn = "",
  text = "",
  screen = "numbers",
  currentContact = "",
  callCount = false,
  callData = false,
  state = false
}).open = function()
  addEventHandler("onClientRender", root, var0.draw)
  addEventHandler("onClientClick", root, var0.click)
  var0.text = ""
  var0.state = true
end
;({
  hoverBtn = "",
  text = "",
  screen = "numbers",
  currentContact = "",
  callCount = false,
  callData = false,
  state = false
}).close = function()
  removeEventHandler("onClientRender", root, var0.draw)
  removeEventHandler("onClientClick", root, var0.click)
  var0.text = ""
  var0.state = false
end
;({
  hoverBtn = "",
  text = "",
  screen = "numbers",
  currentContact = "",
  callCount = false,
  callData = false,
  state = false
}).showCallScreen = function(arg0)
  var0.screen = "call"
  var0.currentContact = arg0
end
function phoneclick(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7)
  if arg0 == "left" and arg1 == "down" and isElement(arg7) and getElementType(arg7) == "object" and (getElementModel(arg7) == 1216 or getElementModel(arg7) == 1346) then
    var0.open()
  end
end
addEvent("onClientElementMenuClick", true)
addEventHandler("onClientElementMenuClick", root, function(arg0, arg1, arg2)
  if not isElement(arg0) then
    return
  end
  if arg1 == "Use" then
    if getElementType(arg0) == "object" and (getElementModel(arg0) == 1216 or getElementModel(arg0) == 1346) then
      var0.open()
    end
  elseif arg1 == "Use Lockpick" then
    exports.minigames:startMinigame("lockpick", {}, arg2.id)
  elseif arg1 == "Take Shower" then
    takeShower()
  end
end)
function takeShower()
  if taking_shower then
    return
  end
  if isPedDead(localPlayer) then
    return
  end
  if not exports["inventory-system"]:playerHasItem("Shampoo") then
    exports.notifications:output({
      en = "You should have a shampoo",
      ar = "\217\138\216\172\216\168 \216\163\217\134 \217\138\217\131\217\136\217\134 \217\132\216\175\217\138\217\131 \216\180\216\167\217\133\216\168\217\136"
    }, 3000, "error")
    return
  end
  if not exports["inventory-system"]:playerHasItem("Sponge Bath") then
    exports.notifications:output({
      en = "You should have a Sponge Bath",
      ar = "\217\138\216\172\216\168 \216\163\217\134 \217\138\217\131\217\136\217\134 \217\132\216\175\217\138\217\131 \216\165\216\179\217\129\217\134\216\172 \216\167\216\179\216\170\216\173\217\133\216\167\217\133"
    }, 3000, "error")
    return
  end
  if exports["life-system"]:getCharacterStatus("cleanness") >= 95 then
    exports.notifications:output({
      en = "You don't need to take a shower",
      ar = "\216\163\217\134\216\170 \217\132\216\179\216\170 \216\168\216\173\216\167\216\172\216\169 \217\132\217\132\216\167\216\179\216\170\216\173\217\133\216\167\217\133"
    }, 3000, "warning")
    return
  end
  fadeCamera(false, 1, 0, 0, 0)
  exports.public:loading("take_shower", true)
  triggerServerEvent("take_shower", localPlayer)
  taking_shower = true
end
addEvent("take_shower:callback", true)
addEventHandler("take_shower:callback", localPlayer, function()
  fadeCamera(true, 1, 0, 0, 0)
  exports.public:loading("take_shower", false)
  taking_shower = nil
end)
addEvent("onClientPlayerStartCall", true)
addEventHandler("onClientPlayerStartCall", localPlayer, function(arg0, arg1, arg2)
  if var0.state and var0.screen == "numbers" then
    var0.showCallScreen(arg2)
    var0.callCount = getTickCount()
    var0.callData = arg1
  end
end)
function msToTimeStr(arg0)
  arg0 = tonumber(arg0)
  arg0 = math.floor(arg0)
  if not arg0 then
    return ""
  end
  if arg0 < 0 then
    return "00", "00", "00"
  end
  if #tostring(math.fmod(arg0, 60)) == 1 then
  end
  if #tostring(math.fmod(math.floor(arg0 / 60), 60)) == 1 then
  end
  return ("0" .. tostring(math.fmod(math.floor(arg0 / 60), 60))) .. ":" .. "0" .. tostring(math.fmod(arg0, 60))
end
addEvent("onClientPlayerEndCall", true)
addEventHandler("onClientPlayerEndCall", localPlayer, function()
  if var0.state and var0.screen ~= "numbers" and var0.callCount then
    var0.screen = "numbers"
    triggerServerEvent("streetPhone:payCost", localPlayer, (math.floor((getTickCount() - var0.callCount) / 1000)))
    var0.callCount = false
  end
end)
addEventHandler("onClientPlayerDamage", localPlayer, function(arg0, arg1, arg2)
  if arg1 == 17 and exports.hud:isHudItemExists("gasmask") then
    cancelEvent()
  end
end)
function UIKitReady()
  eui = exports.UIKit
  var0.window[1] = eui:uiCreateWindow(false, false, 250, 130, "Fingerprint Detector")
  eui:uiSetVisible(var0.window[1], false)
  var0.rect.ItemID = eui:uiCreateRectangle(10, 40, 230, 30, tocolor(40, 40, 40, 240), true, true, true, true, var0.window[1])
  var0.edit.ItemID = eui:uiCreateEdit(5, 4, 220, 25, "", "Item ID", _, var0.rect.ItemID)
  eui:uiSetProperty(var0.edit.ItemID, "UnderLineVisible", "False")
  var0.label[1] = eui:uiCreateLabel(5, 75, 240, 15, "...", tocolor(255, 255, 255, 240), "left", "top", var0.window[1])
  eui:uiSetAlign(var0.label[1], "center", "center")
  var0.button[1] = eui:uiCreateButton(5, 95, 119, 30, "Check", "primary", var0.window[1])
  var0.button[2] = eui:uiCreateButton(126, 95, 119, 30, "Close", "primary", var0.window[1])
  var0.window.vending_machine = eui:uiCreateRectangle(false, false, 250, 400, tocolor(15, 15, 15, 240), true, true, true, true)
  eui:uiSetVisible(var0.window.vending_machine, false)
  var0.label.vending_machine = eui:uiCreateLabel(10, 15, 230, 20, "Vending Machine", tocolor(255, 255, 255, 255), "center", "top", var0.window.vending_machine)
  eui:uiSetFont(var0.label.vending_machine, "default-large")
  var0.gridlist.vending_machine = eui:uiCreateGridList(5, 50, 240, 300, tocolor(10, 10, 10), var0.window.vending_machine)
  eui:uiGridListAddColumn(var0.gridlist.vending_machine, "", 0.7)
  eui:uiGridListAddColumn(var0.gridlist.vending_machine, "Price", 0.3)
  eui:uiSetProperty(var0.gridlist.vending_machine, "row_height", 30)
  var0.button["vending_machine:cancel"] = eui:uiCreateButton(5, 360, 240, 35, {en = "Cancel", ar = "\216\165\217\132\216\186\216\167\216\161"}, tocolor(0, 0, 0), var0.window.vending_machine)
  var0.window.keys_duplicator = eui:uiCreateWindow(false, false, 300, 320, {
    en = "Key Duplicator",
    ar = "\217\134\216\167\216\179\216\174 \216\167\217\132\217\133\217\129\216\167\216\170\217\138\216\173"
  })
  eui:uiWindowSetMovable(var0.window.keys_duplicator, false)
  eui:uiSetVisible(var0.window.keys_duplicator, false)
  eui:uiSetProperty(var0.window.keys_duplicator, "close_button", true)
  var0.gridlist.keys_duplicator_types = eui:uiCreateGridList(10, 40, 280, 100, tocolor(10, 10, 10, 0), var0.window.keys_duplicator)
  eui:uiGridListAddColumn(var0.gridlist.keys_duplicator_types, "Key Type", 1)
  eui:uiSetProperty(var0.gridlist.keys_duplicator_types, "row_height", 30)
  eui:uiGridListSetItemText(var0.gridlist.keys_duplicator_types, eui:uiGridListAddRow(var0.gridlist.keys_duplicator_types), 1, "Interior Key")
  eui:uiGridListSetItemText(var0.gridlist.keys_duplicator_types, eui:uiGridListAddRow(var0.gridlist.keys_duplicator_types), 1, "Vehicle Key")
  var0.edit.key_duplicate_id = eui:uiCreateEdit(15, 160, 270, 35, "", "Key ID", _, var0.window.keys_duplicator)
  eui:uiSetFont(var0.edit.key_duplicate_id, "default-large")
  var0.button.key_duplicate = eui:uiCreateButton(15, 270, 270, 35, {en = "Duplicate", ar = "\217\134\216\179\216\174"}, "primary", var0.window.keys_duplicator)
end
addEventHandler("onClientUIReady", resourceRoot, UIKitReady)
addEventHandler("onClientUIKitReady", root, UIKitReady)
addEventHandler("onClientUIVisibilityChange", root, function(arg0)
  if source == var0.window.keys_duplicator and not arg0 then
    showCursor(false)
  end
end)
addEventHandler("onClientUIClick", root, function()
  if source == var0.button[1] then
    if string.gsub(tostring((eui:uiGetText(var0.edit.ItemID))), " ", "") ~= "" then
      if isElement((getElementByID("M.E.O:" .. tostring((eui:uiGetText(var0.edit.ItemID)))))) then
        triggerLatentServerEvent("fingerprint_detector:check", localPlayer, (getElementByID("M.E.O:" .. tostring((eui:uiGetText(var0.edit.ItemID))))))
      else
        eui:uiSetText(var0.label[1], "#FF0000Item not found")
      end
    else
      eui:uiSetText(var0.label[1], "#FF0000Enter item ID")
    end
  elseif source == var0.button[2] then
    eui:uiSetVisible(var0.window[1], false)
  elseif source == var0.button["vending_machine:cancel"] then
    eui:uiSetVisible(var0.window.vending_machine, false)
    showCursor(false)
  elseif source == var0.button.key_duplicate then
    if eui:uiGridListGetSelectedItem(var0.gridlist.keys_duplicator_types) ~= -1 and #eui:uiGetText(var0.edit.key_duplicate_id) > 0 then
      triggerServerEvent("objects:duplicateKey", localPlayer, eui:uiGridListGetItemText(var0.gridlist.keys_duplicator_types, eui:uiGridListGetSelectedItem(var0.gridlist.keys_duplicator_types), 1), (eui:uiGetText(var0.edit.key_duplicate_id)))
      eui:uiSetVisible(var0.window.keys_duplicator, false)
      showCursor(false)
      eui:uiSetText(var0.edit.key_duplicate_id, "")
    end
  elseif source == CloseKeyDuplicator then
    eui:uiSetVisible(var0.window.keys_duplicator, false)
    showCursor(false)
  end
end)
addEvent("fingerprint_detector:check:callback", true)
addEventHandler("fingerprint_detector:check:callback", localPlayer, function(arg0)
  eui:uiSetText(var0.label[1], "Fingerprints: #00FF00" .. tostring(arg0))
  setClipboard(arg0)
  exports.notifications:output({
    en = "The fingerprint has been copied",
    ar = "\216\170\217\133 \217\134\216\179\216\174 \216\167\217\132\216\168\216\181\217\133\216\169"
  }, 4000, "success")
end)
addEventHandler("onClientUIDoubleClick", root, function()
  if source == var0.gridlist.vending_machine and eui:uiGridListGetSelectedItem(source) ~= -1 then
    eui:uiSetVisible(var0.window.vending_machine, false)
    showCursor(false)
    eui:uiGridListSetSelectedItem(source, -1)
    triggerServerEvent("vending_machine:buy", localPlayer, (eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1)))
  end
end)
addEvent("onClientUseItem", true)
addEventHandler("onClientUseItem", root, function(arg0, arg1, arg2)
  if arg2.Name == "Fingerprint Detector" then
    eui:uiSetVisible(var0.window[1], true)
    eui:uiSetText(var0.edit.ItemID, "")
    eui:uiSetText(var0.label[1], "...")
  end
end)
function closeFDWindow(arg0)
  eui:uiSetVisible(var0.window[1], false)
  eui:uiSetVisible(var0.window.vending_machine, false)
  eui:uiSetVisible(var0.window.keys_duplicator, false)
  showCursor(false)
  taking_shower = nil
end
addEvent("onClientPlayerQuitFromCharacter", true)
addEventHandler("onClientPlayerQuitFromCharacter", localPlayer, closeFDWindow)
addEventHandler("onClientPlayerWasted", localPlayer, closeFDWindow)
addEventHandler("onClientElementStreamIn", root, function()
  if not getElementData(source, "item:data") then
    return
  end
  if getElementData(source, "item:data").Type == "Gate" then
    setElementFrozen(source, true)
  elseif getElementData(source, "item:data").Type == "Sound Player" and getElementData(source, "item:data").Properties.Status == "playing" and getElementData(source, "item:data").SpecialProperties.URL ~= "" then
    playObjectSound(source, getElementData(source, "item:data").SpecialProperties.URL)
  end
end)
addEventHandler("onClientElementStreamOut", root, function()
  stopObjectSound(source)
end)
function stopObjectSound(arg0)
  if var0[arg0] then
    if isElement(var0[arg0]) then
      stopSound(var0[arg0])
    end
    var0[arg0] = nil
  end
end
function playObjectSound(arg0, arg1)
  stopObjectSound(arg0)
  var0[arg0] = playSound(arg1, true)
end
addEventHandler("onClientElementDataChange", root, function(arg0, arg1, arg2)
  if arg0 == "item:data" and arg2 then
    if arg2.Type ~= "Sound Player" then
      return
    end
    if arg2.Properties.Status == "playing" then
      playObjectSound(source, arg2.SpecialProperties.URL)
    elseif arg2.Properties.Status == "stop" then
      stopObjectSound(source)
    end
  end
end)
addEvent("objects:iftarSound", true)
addEventHandler("objects:iftarSound", root, function(arg0, arg1, arg2)
  setSoundMaxDistance(playSound3D("https://g.top4top.io/m_2276psq3g1.mp3", arg0, arg1, arg2), 3000)
end)
addEvent("onClientUseItemForElement", true)
addEventHandler("onClientUseItemForElement", root, function(arg0, arg1, arg2, arg3)
  if arg0 == localPlayer then
    return
  end
  if arg3.Name == "Vehicle Repair Kit" then
    if not isElement(arg0) then
      return
    end
    if isPedInVehicle(localPlayer) then
      return
    end
    if getElementType(arg0) == "vehicle" then
      if getDistanceBetweenPoints3D(getElementPosition(localPlayer)) > 5 then
        return
      end
      if getElementHealth(arg0) < 800 then
        triggerServerEvent("vehicle_repair_kit:use", localPlayer, arg0, getElementBoundingBox(arg0))
      else
        exports.notifications:output({
          en = "The vehicle does not need repair",
          ar = "\216\167\217\132\217\133\216\177\217\131\216\168\216\169 \217\132\216\167\216\170\216\173\216\170\216\167\216\172 \216\165\217\132\217\137 \216\165\216\181\217\132\216\167\216\173"
        }, 3000, "error")
      end
    end
  end
end)
addEventHandler("onClientInteractionClick", localPlayer, function(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, arg15, arg16, arg17)
  if arg0 == "left" and arg1 == "down" then
    if arg2 > 1 then
      return
    end
    if arg10 and vending_machines[arg10] then
      if arg3 then
      else
      end
      if true then
        if eui:uiGetVisible(var0.window.vending_machine) then
          return
        end
        eui:uiSetVisible(var0.window.vending_machine, true)
        showCursor(true)
        eui:uiGridListClear(var0.gridlist.vending_machine)
        for forvar22, forvar23 in pairs(vending_machines[arg10].items) do
          eui:uiGridListSetItemData(var0.gridlist.vending_machine, eui:uiGridListAddRow(var0.gridlist.vending_machine), 1, {arg10, forvar22})
          eui:uiGridListSetItemText(var0.gridlist.vending_machine, eui:uiGridListAddRow(var0.gridlist.vending_machine), 1, tostring(forvar23.name))
          eui:uiGridListSetItemText(var0.gridlist.vending_machine, eui:uiGridListAddRow(var0.gridlist.vending_machine), 2, "$" .. tostring(forvar23.price))
          eui:uiGridListSetItemColor(var0.gridlist.vending_machine, eui:uiGridListAddRow(var0.gridlist.vending_machine), 2, tocolor(0, 255, 0))
        end
      end
    end
  end
end)
for forvar17, forvar18 in ipairs({
  {
    217.9306,
    1288.9609,
    1082.14,
    1
  },
  {
    2277.776,
    -1138.506,
    1050.89,
    11
  },
  {
    2192.724,
    -1225.906,
    1049.02,
    6
  },
  {
    2251.865,
    -1216.3,
    1049.02,
    10
  },
  {
    2236.814,
    -1067.382,
    1049.02,
    2
  },
  {
    2317.833,
    -1003.919,
    1054.71,
    9
  },
  {
    250.9707,
    1293.3574,
    1080.25,
    4
  },
  {
    82.33593,
    1345.1162,
    1088.36,
    9
  },
  {
    -298.931,
    1470.5478,
    1088.87,
    15
  },
  {
    -37.3876,
    1408.8974,
    1084.42,
    8
  },
  {
    -63.6923,
    1354.79,
    1080.21,
    6
  },
  {
    285.4091,
    1483.5039,
    1080.25,
    15
  },
  {
    2267.69,
    -1141.279,
    1050.63,
    10
  },
  {
    253.5791,
    1032.621,
    1084.73,
    7
  },
  {
    239.3466,
    1041.4091,
    1088.3,
    7
  }
}) do
  setElementInterior(createColCircle(unpack(forvar18)), unpack(forvar18))
  ;({})[createColCircle(unpack(forvar18))] = true
end
addEventHandler("onClientColShapeHit", resourceRoot, function(arg0)
  if arg0 ~= localPlayer then
    return
  end
  if var0[source] then
    if getElementInterior(source) ~= getElementInterior(localPlayer) then
      return
    end
    exports.notifications:showKeyDescription("take_shower", "E", "Take Shower")
    bindKey("E", "down", take_shower_bind)
  end
end)
addEventHandler("onClientColShapeLeave", resourceRoot, function(arg0)
  if arg0 ~= localPlayer then
    return
  end
  if var0[source] then
    exports.notifications:hideKeyDescription("take_shower")
    unbindKey("E", "down", take_shower_bind)
  end
end)
function take_shower_bind(arg0, arg1)
  takeShower()
end
addEvent("onClientElementMenuShow", true)
addEventHandler("onClientElementMenuShow", localPlayer, function(arg0, arg1, arg2)
  if arg1 <= 5 then
    if arg2 == "object" and isElement(arg0) then
      if getElementModel(arg0) == 1808 and arg1 <= 2 then
        if getElementDimension(source) ~= 0 then
          if not getElementData(arg0, "item:data") or not getElementData(arg0, "item:data").Properties.Moveable then
            exports.interaction:addInteractOption(arg0, {
              text = "Drink Water"
            })
          end
        elseif not getElementData(arg0, "item:data") then
          exports.interaction:addInteractOption(arg0, {
            text = "Drink Water"
          })
        end
      elseif (getElementModel(arg0) == 1721 or getElementModel(arg0) == 1722 or getElementModel(arg0) == 1714 or getElementModel(arg0) == 2310 or getElementModel(arg0) == 1715 or getElementModel(arg0) == 1671 or getElementModel(arg0) == 1663) and arg1 <= 1.5 then
        exports.interaction:addInteractOption(arg0, {text = "Sit"})
      elseif var0[getElementModel(arg0)] and arg1 <= 3 then
        if getElementDimension(source) ~= 0 then
          if not getElementData(arg0, "item:data") or not getElementData(arg0, "item:data").Properties.Moveable then
            exports.interaction:addInteractOption(arg0, {
              text = "Take Shower"
            })
          end
        elseif not getElementData(arg0, "item:data") or not getElementData(arg0, "item:data").Properties.Moveable then
          exports.interaction:addInteractOption(arg0, {
            text = "Take Shower"
          })
        end
      end
      if getElementData(arg0, "item:data") then
        if getElementData(arg0, "item:data").Type == "Gate" then
          if (getElementData(arg0, "item:data").Properties.Status or "close") == "close" then
            exports.interaction:addInteractOption(arg0, {text = "Open"})
            exports.interaction:addInteractOption(arg0, {
              text = "Lock/UnLock"
            })
          elseif (getElementData(arg0, "item:data").Properties.Status or "close") == "open" then
            exports.interaction:addInteractOption(arg0, {text = "Close"})
          end
        elseif getElementData(arg0, "item:data").Type == "Sound Player" then
          if getElementData(arg0, "item:data").Properties.Status == "stop" then
            exports.interaction:addInteractOption(source, arg0, {text = "Play"})
          elseif getElementData(arg0, "item:data").Properties.Status == "playing" then
            exports.interaction:addInteractOption(source, arg0, {text = "Stop"})
          end
        end
      end
    elseif arg2 == "vehicle" and isVehicleLocked(arg0) and getElementID(arg0) and not exports["inventory-system"]:playerHasItem("Vehicle ID#" .. string.gsub(getElementID(arg0), "Vehicle:", "") .. " Key") and exports["inventory-system"]:playerHasItem("Lockpick") then
      exports.interaction:addInteractOption(arg0, {
        text = "Use Lockpick",
        data = {
          label = "#ff0000Use Lockpick",
          id = "unlock_vehicle." .. string.gsub(getElementID(arg0), "Vehicle:", "")
        }
      })
    end
  end
end)
addEvent("minigame:onEnd", true)
addEventHandler("minigame:onEnd", localPlayer, function(arg0, arg1, arg2)
  if arg0 == "lockpick" then
    triggerServerEvent("lockpick:callback", localPlayer, arg1, arg2)
  end
end)
