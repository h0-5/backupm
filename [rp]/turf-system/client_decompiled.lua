-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

function UIKitReady()
  eui = exports.UIKit
  var0 = eui:getUIFont("hud-large")
  var1 = 0.45
end
addEventHandler("onClientUIReady", resourceRoot, UIKitReady)
addEventHandler("onClientUIKitReady", root, UIKitReady)
function init()
  var0 = svgCreate(var1, var1, var2, function(arg0)
    if not arg0 then
      return
    end
    var0 = svgGetDocumentXML(var1)
    var2 = xmlFindChild(var0, "circle", 1)
  end)
end
addEventHandler("onClientResourceStart", resourceRoot, init)
function setProgress(arg0)
  arg0 = math.max(0, math.min(arg0, 100))
  xmlNodeSetAttribute(var0, "stroke-dashoffset", 315 - arg0 / 100 * 315)
  svgSetDocumentXML(var1, var2)
end
function TurfArea()
  if not isElement(var0) then
    return
  end
  if not var1 then
    return
  end
  if var2 then
    dxDrawImage(var3, var4, var5, var5, var2, 0, 0, 0, tocolor(255, 255, 255), false)
    dxDrawText(var1.ID, var3 + 2, var4 + 2, var3 + var5, var4 + var5, var6, var7, var8, "center", "center", false, false, false, false, false)
    dxDrawText(var1.ID, var3, var4, var3 + var5, var4 + var5, tocolor(255, 55, 95), var7, var8, "center", "center", false, false, false, false, false)
    dxDrawText((tostring(math.floor(var1.Turf / var1.MaxTurf * 100)) .. "%") .. "\n" .. var1.Group, 1, var4 + var5 + 11 * var9, var10, 270 * var9, var6, var7 * 0.7, var8, "center", "top", false, false, false, false, false)
    dxDrawText((tostring(math.floor(var1.Turf / var1.MaxTurf * 100)) .. "%") .. "\n" .. var1.Group, 0, var4 + var5 + 10 * var9, var10, 270 * var9, var11, var7 * 0.7, var8, "center", "top", false, false, false, false, false)
  end
end
function dxDrawEmptyRec(arg0, arg1, arg2, arg3, arg4, arg5)
  dxDrawRectangle(arg0, arg1, arg2, arg5, arg4)
  dxDrawRectangle(arg0, arg1 + arg5, arg5, arg3 - arg5, arg4)
  dxDrawRectangle(arg0 + arg5, arg1 + arg3 - arg5, arg2 - arg5, arg5, arg4)
  dxDrawRectangle(arg0 + arg2 - arg5, arg1 + arg5, arg5, arg3 - arg5 * 2, arg4)
end
addEvent("OS:AREA.ShowProgress", true)
addEventHandler("OS:AREA.ShowProgress", root, function(arg0, arg1)
  var0 = arg0
  var1 = arg1
  if arg1 then
    setProgress(arg1.Turf / arg1.MaxTurf * 100)
  end
  addEventHandler("onClientRender", root, TurfArea)
end)
addEvent("OS:AREA.UpdateAreaDB", true)
addEventHandler("OS:AREA.UpdateAreaDB", root, function(arg0, arg1, arg2, arg3, arg4, arg5)
  var0 = {
    ID = arg5,
    Turf = arg0,
    MaxTurf = arg1,
    Group = arg2,
    TurfGroup = arg3,
    OldTurf = arg4
  }
  setProgress(arg0 / arg1 * 100)
end)
addEvent("OS:AREA.HideProgress", true)
addEventHandler("OS:AREA.HideProgress", root, function()
  removeEventHandler("onClientRender", root, TurfArea)
  var0 = false
end)
function getGroupTurfAreas(arg0)
  for forvar5, forvar6 in ipairs(getElementsByType("colshape", resourceRoot)) do
    if getElementData(forvar6, "OS:AREA.DB") and getElementData(forvar6, "OS:AREA.DB").Group == arg0 then
      table.insert({}, {
        forvar6,
        (getElementData(forvar6, "OS:AREA.DB"))
      })
    end
  end
  return {}
end
