-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

function UIKitReady()
  eui = exports.UIKit
  var0.window[1] = eui:uiCreateWindow(false, false, 350, 130, "TV")
  eui:uiSetVisible(var0.window[1], false)
  var0.rect.URL = eui:uiCreateRectangle(10, 40, 330, 30, tocolor(40, 40, 40, 240), true, true, true, true, var0.window[1])
  var0.edit.URL = eui:uiCreateEdit(5, 4, 320, 25, "", "URL", _, var0.rect.URL)
  eui:uiSetProperty(var0.edit.URL, "UnderLineVisible", "False")
  var0.label[1] = eui:uiCreateLabel(5, 75, 340, 15, "...", tocolor(255, 255, 255, 240), "left", "top", var0.window[1])
  eui:uiSetAlign(var0.label[1], "center", "center")
  var0.button[1] = eui:uiCreateButton(5, 95, 119, 30, "Change", "primary", var0.window[1])
  var0.button[2] = eui:uiCreateButton(130, 95, 119, 30, "Close", "primary", var0.window[1])
end
addEventHandler("onClientUIReady", resourceRoot, UIKitReady)
addEventHandler("onClientUIKitReady", root, UIKitReady)
function isValidURL(arg0)
  return string.match(arg0, "https://[^ >,;]*") or string.match(arg0, "http://[^ >,;]*")
end
addEventHandler("onClientUIClick", root, function()
  if source == var0.button[1] then
    if eui:uiGetText(var0.edit.URL) ~= "" then
      if not isValidURL((eui:uiGetText(var0.edit.URL))) then
        outputChatBox("Invalid URL", 255, 0, 0)
        return
      end
      getElementData(var1, "tv").url = "https://www.youtube.com/embed/" .. tostring(split(eui:uiGetText(var0.edit.URL), "?v=")[2]) .. "?autoplay=1"
      setElementData(var1, "tv", (getElementData(var1, "tv")))
      eui:uiSetVisible(var0.window[1], false)
    end
  elseif source == var0.button[2] then
    eui:uiSetVisible(var0.window[1], false)
  end
end)
function closeFDWindow(arg0)
  eui:uiSetVisible(var0.window[1], false)
end
addEvent("onClientPlayerQuitFromCharacter", true)
addEventHandler("onClientPlayerQuitFromCharacter", localPlayer, closeFDWindow)
addEventHandler("onClientPlayerWasted", localPlayer, closeFDWindow)
addEvent("onClientElementMenuShow", true)
addEventHandler("onClientElementMenuShow", localPlayer, function(arg0, arg1, arg2)
  if arg2 == "object" and arg1 <= 5 then
    if not isElement(arg0) then
      return
    end
    if getElementData(arg0, "item:data") and string.find(getElementData(arg0, "item:data").Name:lower(), "tv", 1, true) then
      if getElementData(arg0, "tv") then
        exports.interaction:addInteractOption(arg0, {
          text = getElementData(arg0, "tv").status == 0 and "Turn on" or "Turn off"
        })
        if getElementData(arg0, "tv").status == 1 then
          exports.interaction:addInteractOption(arg0, {
            text = "Change TV channel"
          })
        end
      else
        exports.interaction:addInteractOption(arg0, {text = "Turn on"})
      end
    end
  end
end)
addEvent("onClientElementMenuClick", true)
addEventHandler("onClientElementMenuClick", localPlayer, function(arg0, arg1, arg2)
  if not isElement(arg0) then
    return
  end
  if getElementType(arg0) == "object" and getElementData(arg0, "item:data") and string.find(getElementData(arg0, "item:data").Name:lower(), "tv", 1, true) then
    if arg1 == "Turn on" then
      if getElementData(arg0, "item:data").Properties.Pickup or getElementData(arg0, "item:data").Properties.Move then
        exports.notifications:output({
          en = "TV must be installed in a house",
          ar = "\217\138\216\172\216\168 \216\170\216\171\216\168\217\138\216\170 \216\167\217\132\216\170\217\132\217\129\216\167\216\178 \217\129\217\138 \217\133\217\134\216\178\217\132"
        }, 3500, "warning")
        return
      end
      ;(getElementData(arg0, "tv") or {}).status = 1
      ;(getElementData(arg0, "tv") or {}).url = (getElementData(arg0, "tv") or {}).url or "https://www.youtube.com/embed/6utfhlqpzkQ?autoplay=1"
      exports["chat-system"]:outputMe(localPlayer, "@charactername turns on the TV", true, true)
    elseif arg1 == "Turn off" then
      (getElementData(arg0, "tv") or {}).status = 0
      exports["chat-system"]:outputMe(localPlayer, "@charactername turns off the TV", true, true)
    elseif arg1 == "Change TV channel" then
      eui:uiSetVisible(var0.window[1], true)
      var1 = arg0
    end
    setElementData(arg0, "tv", getElementData(arg0, "tv") or {})
  end
end)
addEventHandler("onClientElementDataChange", root, function(arg0, arg1, arg2)
  if arg0 == "tv" then
    if arg2 then
      if arg2.status == 1 then
        if isElementStreamedIn(source) then
          startTV(source, arg2.url or "https://www.youtube.com/embed/6utfhlqpzkQ?autoplay=1")
        end
      else
        stopTV(source)
      end
    else
      stopTV(source)
    end
  end
end)
addEventHandler("onClientElementStreamIn", root, function()
  if getElementData(source, "tv") and getElementData(source, "tv").status == 1 then
    startTV(source, getElementData(source, "tv").url)
  end
end)
function onStreamOut()
  stopTV(source)
end
function startTV(arg0, arg1)
  if isElement(var0[arg0]) then
    playVideo(arg0, arg1)
  else
    for forvar6, forvar7 in ipairs(engineGetModelTextureNames(tostring(getElementModel(arg0)))) do
      if string.find(string.lower(forvar7), "screen", 1, true) then
        break
      end
    end
    if forvar7 then
      var0[arg0] = dxCreateShader(var1, 0, 100, true, "object")
      engineApplyShaderToWorldTexture(var0[arg0], forvar7, arg0)
      playVideo(arg0, arg1)
      addEventHandler("onClientElementStreamOut", arg0, onStreamOut)
      addEventHandler("onClientElementDestroy", arg0, onStreamOut)
    end
  end
end
function stopTV(arg0)
  if isElement(var0[arg0]) then
    destroyElement(var0[arg0])
    var0[arg0] = nil
    removeEventHandler("onClientElementStreamOut", arg0, onStreamOut)
    removeEventHandler("onClientElementDestroy", arg0, onStreamOut)
  end
  if isElement(var1[arg0]) then
    destroyElement(var1[arg0])
    var1[arg0] = nil
    for forvar5, forvar6 in pairs(var1) do
    end
    if 0 + 1 == 0 and var2 then
      removeEventHandler("onClientRender", root, renderVolume)
      var2 = false
    end
  end
end
function playVideo(arg0, arg1)
  if not isElement(var0[arg0]) then
    var0[arg0] = createBrowser(var1, var2, false, false)
    if not var3 then
      addEventHandler("onClientRender", root, renderVolume)
      var3 = true
    end
    var4[var0[arg0]] = arg1
    dxSetShaderValue(var5[arg0], "gTexture", var0[arg0])
  elseif var4[var0[arg0]] ~= arg1 then
    var4[var0[arg0]] = arg1
    loadBrowserURL(var0[arg0], arg1)
    requestBrowserDomains({arg1}, true, function(arg0)
      if arg0 then
        loadBrowserURL(var0[var1], var2)
      end
    end)
  end
end
addEventHandler("onClientBrowserCreated", resourceRoot, function()
  if not var0[source] then
    return
  end
  setBrowserVolume(source, 0)
  requestBrowserDomains({
    var0[source]
  }, true, function(arg0)
    if arg0 and source then
      loadBrowserURL(source, var0[source])
    end
  end)
end)
function renderVolume()
  for forvar6, forvar7 in pairs(var0) do
    setBrowserVolume(forvar7, math.max(20 - getDistanceBetweenPoints3D(getElementPosition(localPlayer)), 0) / 20)
  end
end
addEventHandler("onClientResourceStart", resourceRoot, function()
  engineImportTXD(exports["files-protection"]:loadTXD("models/SAMPLCDTVs1.txd"), 1933)
  engineReplaceModel(exports["files-protection"]:loadDFF("models/LCDTV1.dff"), 1933)
  engineReplaceCOL(exports["files-protection"]:loadCOL("models/tv.col"), 1933)
end)
