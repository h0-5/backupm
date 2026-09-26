-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

UI = {
  window = {},
  label = {},
  image = {},
  edit = {},
  browser = {},
  programscreen = {},
  icon = {}
}
function UIKitReady()
  eui = exports.UIKit
  UI.window.PC = eui:uiCreateRectangle(false, false, var0, var1, tocolor(5, 5, 5, 240), false, false, false, false)
  eui:uiSetVisible(UI.window.PC, false)
  UI.image.Wallpaper = eui:uiCreateImage(5, 5, var0 - 10, var1 - 10, ":computer-system/img/wallpaper.png", UI.window.PC)
  UI.label.Desktop = eui:uiCreateLabel(0, 0, var0 - 10, var1 - 10 - 35, "", tocolor(255, 255, 255, 255), "center", "center", UI.image.Wallpaper)
  UI.label.Taskbar = eui:uiCreateRectangle(0, var1 - 10 - 35, var0 - 10, 35, tocolor(0, 0, 0, 150), false, false, false, false, UI.image.Wallpaper)
  UI.image.Logo = eui:uiCreateImage(5, 5, 35 - 10, 35 - 10, ":computer-system/img/Windows_logo.png", UI.label.Taskbar)
  UI.icon[UI.image.Logo] = true
  UI.image.close = eui:uiCreateImage(var0 - 10 - 35, 5, 35 - 10, 35 - 10, ":computer-system/img/icons/Cancel.png", UI.label.Taskbar)
  UI.icon[UI.image.close] = true
  UI.programscreen["Internet Explorer 11"] = eui:uiCreateRectangle(0, 0, var0 - 10, var1 - 10 - 35, tocolor(0, 0, 0, 150), false, false, false, false, UI.image.Wallpaper)
  eui:uiSetVisible(UI.programscreen["Internet Explorer 11"], false)
  UI.image.left_arrow = eui:uiCreateImage(10, 6, 26, 26, ":computer-system/img/icons/LeftArrow.png", UI.programscreen["Internet Explorer 11"])
  UI.image.right_arrow = eui:uiCreateImage(40, 6, 26, 26, ":computer-system/img/icons/RightArrow.png", UI.programscreen["Internet Explorer 11"])
  UI.image.right_around = eui:uiCreateImage(726, 6, 26, 26, ":computer-system/img/icons/RightRound.png", UI.programscreen["Internet Explorer 11"])
  UI.image.refresh = eui:uiCreateImage(758, 6, 26, 26, ":computer-system/img/icons/Refresh.png", UI.programscreen["Internet Explorer 11"])
  UI.icon[UI.image.left_arrow] = true
  UI.icon[UI.image.right_arrow] = true
  UI.icon[UI.image.right_around] = true
  UI.icon[UI.image.refresh] = true
  UI.edit.url = eui:uiCreateEdit(76, 10, 640, 26, "", "URL", tocolor(255, 255, 255, 255), UI.programscreen["Internet Explorer 11"])
  eui:uiSetProperty(UI.edit.url, "UnderLineVisible", "False")
  UI.browser.InternetExplorer11 = eui:uiCreateBrowser(0, 40, var0 - 10, var1 - 10 - 35 - 40, false, false, UI.programscreen["Internet Explorer 11"])
  theBrowser = eui:uiGetBrowser(UI.browser.InternetExplorer11)
  addEventHandler("onClientBrowserCreated", theBrowser, function()
    loadBrowserURL(source, "https://www.google.com/")
  end)
  addEventHandler("onClientBrowserDocumentReady", theBrowser, function()
    eui:uiSetText(UI.edit.url, getBrowserURL(source))
  end)
  createProgramIcon("Internet Explorer 11", [[
Internet
Explorer 11]], 20, 19)
end
addEventHandler("onClientUIReady", resourceRoot, UIKitReady)
addEventHandler("onClientUIKitReady", root, UIKitReady)
function closeUIWindows(arg0)
  eui:uiSetVisible(UI.window.PC, false)
  showCursor(false)
end
addEvent("onClientPlayerQuitFromCharacter", true)
addEventHandler("onClientPlayerQuitFromCharacter", localPlayer, closeUIWindows)
addEventHandler("onClientPlayerWasted", localPlayer, closeUIWindows)
function createProgramIcon(arg0, arg1, arg2, arg3)
  var0[eui:uiCreateImage(5, 0, 40, 40, ":computer-system/img/internet_explorer.png", (eui:uiCreateLabel(arg2, arg3, 50, 68, "", tocolor(255, 255, 255, 255), "center", "center", UI.label.Desktop)))] = arg0
end
function changeAlpha()
  if var0[source] or UI.icon[source] then
    eui:uiSetAlpha(source, eventName == "onClientUIMouseEnter" and 130 or 240)
  end
end
addEventHandler("onClientUIMouseEnter", root, changeAlpha)
addEventHandler("onClientUIMouseLeave", root, changeAlpha)
addEventHandler("onClientUIClick", root, function()
  if var0[source] then
    openProgram(var0[source])
  elseif source == UI.image.Logo then
    if currentProgram then
      triggerEvent("PC:onClientCloseProgram", localPlayer, currentProgram)
      eui:uiSetVisible(UI.programscreen[currentProgram], false)
      eui:uiSetVisible(UI.label.Desktop, true)
    end
  elseif source == UI.image.close then
    eui:uiSetVisible(UI.window.PC, false)
    showCursor(false)
    if currentProgram then
      triggerEvent("PC:onClientCloseProgram", localPlayer, currentProgram)
      eui:uiSetVisible(UI.programscreen[currentProgram], false)
      eui:uiSetVisible(UI.label.Desktop, true)
    end
  elseif source == UI.image.left_arrow then
    if canBrowserNavigateBack(theBrowser) then
      navigateBrowserBack(theBrowser)
    end
  elseif source == UI.image.right_arrow then
    if canBrowserNavigateForward(theBrowser) then
      navigateBrowserForward(theBrowser)
    end
  elseif source == UI.image.right_around then
    loadBrowserURL(theBrowser, eui:uiGetText(UI.edit.url))
  elseif source == UI.image.refresh then
    reloadBrowserPage(theBrowser)
  end
end)
function openProgram(arg0)
  eui:uiSetVisible(UI.label.Desktop, false)
  eui:uiSetVisible(UI.programscreen[arg0], true)
  currentProgram = arg0
  triggerEvent("PC:onClientOpenProgram", localPlayer, arg0)
end
addEvent("onClientUseItem", true)
addEventHandler("onClientUseItem", root, function(arg0, arg1, arg2)
  if arg2.Name == "Laptop" and not arg1 then
    eui:uiSetVisible(UI.window.PC, true)
    showCursor(true)
    if arg1 then
      exports["inventory-system"]:showInventory(false)
    end
  end
end)
addEvent("onClientElementMenuShow", true)
addEventHandler("onClientElementMenuShow", localPlayer, function(arg0, arg1, arg2)
  if arg2 == "object" and arg1 <= 5 then
    if not isElement(arg0) then
      return
    end
    if getElementModel(arg0) == 2190 and arg1 <= 2 then
      exports.interaction:addInteractOption(arg0, {
        text = "Show Screen"
      })
    end
  end
end)
addEvent("onClientElementMenuClick", true)
addEventHandler("onClientElementMenuClick", localPlayer, function(arg0, arg1, arg2)
  if not isElement(arg0) then
    return
  end
  if getElementType(arg0) == "object" and arg1 == "Show Screen" and getElementModel(arg0) == 2190 then
    eui:uiSetVisible(UI.window.PC, true)
    showCursor(true)
  end
end)
