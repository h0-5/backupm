-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

addEvent("Customs:Show_X-ray", true)
addEventHandler("Customs:Show_X-ray", root, function(arg0, arg1, arg2, arg3, arg4)
  ob, ob2, cX, check = arg0, arg1, -0.5, true
  addEventHandler("onClientRender", root, render)
  if isTimer(t) then
    killTimer(t)
  end
  t = setTimer(function()
    if cX < 0.5 and check then
      cX = cX + 0.2
      if cX >= 0.5 then
        check = false
        cX = 0.5
      end
    else
      cX = cX - 0.1
      if cX <= 0 then
        cX = 0
        killTimer(t)
        triggerServerEvent("Customs:Inspection", localPlayer, var0, var1, var2)
      end
    end
  end, 1000, 0)
end)
addEvent("Customs:Hide_X-ray", true)
addEventHandler("Customs:Hide_X-ray", root, function()
  ob, ob2, cX, check = nil, nil, nil, nil
  removeEventHandler("onClientRender", root, render)
  if isTimer(t) then
    killTimer(t)
  end
end)
function render()
  if ob and ob2 and cX then
    dxDrawLine3D(getElementPosition(ob) - cX, getElementPosition(ob))
    dxDrawLine3D(getElementPosition(ob) - cX, getElementPosition(ob))
    dxDrawLine3D(getElementPosition(ob) - cX, getElementPosition(ob))
  end
end
function applyBreakableState()
  for forvar4 = 1, #getElementsByType("object", resourceRoot) do
    if getElementData(getElementsByType("object", resourceRoot)[forvar4], "breakable") then
      setObjectBreakable(getElementsByType("object", resourceRoot)[forvar4], getElementData(getElementsByType("object", resourceRoot)[forvar4], "breakable") == "true")
    end
  end
end
addEventHandler("onClientResourceStart", resourceRoot, applyBreakableState)
