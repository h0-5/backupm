-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

function drawNotes()
  if isPlayerMapVisible() then
    return
  end
  for forvar9, forvar10 in ipairs((getElementsWithinRange(getCameraMatrix()))) do
    if getElementData(forvar10, "item:data") and getElementData(forvar10, "item:data").Type == "Note" and isLineOfSightClear(getCameraMatrix()) and getScreenFromWorldPosition(getElementPosition(forvar10)) and getScreenFromWorldPosition(getElementPosition(forvar10)) then
      table.sort(split(tostring(getElementData(forvar10, "item:data").SpecialProperties.Note), 10), function(arg0, arg1)
        return #arg0 > #arg1
      end)
      dxDrawRectangle(getScreenFromWorldPosition(getElementPosition(forvar10)) - math.max(dxGetTextWidth(split(tostring(getElementData(forvar10, "item:data").SpecialProperties.Note), 10)[1], 1, var0) + 15, 100) / 2, getScreenFromWorldPosition(getElementPosition(forvar10)) - (15 * #split(tostring(getElementData(forvar10, "item:data").SpecialProperties.Note), 10) + 9) / 2, math.max(dxGetTextWidth(split(tostring(getElementData(forvar10, "item:data").SpecialProperties.Note), 10)[1], 1, var0) + 15, 100), 15 * #split(tostring(getElementData(forvar10, "item:data").SpecialProperties.Note), 10) + 9, tocolor(0, 0, 0, 120))
      dxDrawEmptyLine(getScreenFromWorldPosition(getElementPosition(forvar10)) - math.max(dxGetTextWidth(split(tostring(getElementData(forvar10, "item:data").SpecialProperties.Note), 10)[1], 1, var0) + 15, 100) / 2, getScreenFromWorldPosition(getElementPosition(forvar10)) - (15 * #split(tostring(getElementData(forvar10, "item:data").SpecialProperties.Note), 10) + 9) / 2, math.max(dxGetTextWidth(split(tostring(getElementData(forvar10, "item:data").SpecialProperties.Note), 10)[1], 1, var0) + 15, 100), 15 * #split(tostring(getElementData(forvar10, "item:data").SpecialProperties.Note), 10) + 9, tocolor(255, 255, 255, 100), 1, false)
      dxDrawText(tostring(getElementData(forvar10, "item:data").SpecialProperties.Note:gsub("#%x%x%x%x%x%x", "")), getScreenFromWorldPosition(getElementPosition(forvar10)) + 2, getScreenFromWorldPosition(getElementPosition(forvar10)) + 2, getScreenFromWorldPosition(getElementPosition(forvar10)))
      dxDrawText(tostring(getElementData(forvar10, "item:data").SpecialProperties.Note), getScreenFromWorldPosition(getElementPosition(forvar10)))
    end
  end
end
function dxDrawEmptyLine(arg0, arg1, arg2, arg3, arg4, arg5, arg6)
  dxDrawLine(arg0, arg1, arg0 + arg2, arg1, arg4, arg5, arg6)
  dxDrawLine(arg0, arg1, arg0, arg1 + arg3, arg4, arg5, arg6)
  dxDrawLine(arg0, arg1 + arg3, arg0 + arg2, arg1 + arg3, arg4, arg5, arg6)
  dxDrawLine(arg0 + arg2, arg1, arg0 + arg2, arg1 + arg3, arg4, arg5, arg6)
end
addEventHandler("onClientResourceStart", resourceRoot, function()
  if getElementData(localPlayer, "describtion:show") then
    addEventHandler("onClientRender", root, drawNotes)
  end
end)
addEventHandler("onClientElementDataChange", localPlayer, function(arg0, arg1)
  if arg0 == "describtion:show" then
    if getElementData(localPlayer, "describtion:show") then
      removeEventHandler("onClientRender", root, drawNotes)
      addEventHandler("onClientRender", root, drawNotes)
    else
      removeEventHandler("onClientRender", root, drawNotes)
    end
  end
end)
