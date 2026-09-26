-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

addEvent("onClientColshapeCheckerHit", false)
addEvent("onClientColshapeCheckerLeave", false)
function addColshapeChecker(arg0, arg1)
  if #var0 == 0 then
    addEventHandler("onClientRender", root, renderColCheck)
  end
  table.insert(var0, {
    col = arg0,
    z = arg1,
    resource = sourceResource
  })
  addEventHandler("onClientElementDestroy", arg0, destroyColCheck)
end
function destroyColCheck()
  removeColshapeChecker(source)
end
function removeColshapeChecker(arg0)
  for forvar4, forvar5 in ipairs(var0) do
    if forvar5.col == arg0 then
      table.remove(var0, forvar4)
      break
    end
  end
  if #var0 == 0 then
    removeEventHandler("onClientRender", root, renderColCheck)
  end
end
addEventHandler("onClientResourceStop", root, function(arg0)
  for forvar5, forvar6 in ipairs(var0) do
    if forvar6.resource ~= arg0 then
      table.insert({}, forvar6)
    end
  end
  var0 = {}
end)
function renderColCheck()
  for forvar3, forvar4 in ipairs(var0) do
    if #getElementsWithinColShape(forvar4.col, "vehicle") > 0 then
      if isInsideColShape(forvar4.col, getElementPosition(getElementsWithinColShape(forvar4.col, "vehicle")[1])) then
        for forvar18 = 1, #getColPolygonPoints(forvar4.col) do
          if forvar18 == #getColPolygonPoints(forvar4.col) then
          else
          end
          if not isLineOfSightClear(getColPolygonPoints(forvar4.col)[forvar18][1], getColPolygonPoints(forvar4.col)[forvar18][2], getGroundPosition(getColPolygonPoints(forvar4.col)[1][1], getColPolygonPoints(forvar4.col)[1][2], forvar4.z or 0) + 2, getColPolygonPoints(forvar4.col)[forvar18 + 1][1], getColPolygonPoints(forvar4.col)[forvar18 + 1][2], getGroundPosition(getColPolygonPoints(forvar4.col)[1][1], getColPolygonPoints(forvar4.col)[1][2], forvar4.z or 0) + 2, false, true, false, false, false, true) then
          end
        end
      end
      if false then
        if not forvar4.hit then
          var0[forvar3].hit = true
          triggerEvent("onClientColshapeCheckerHit", forvar4.col)
        end
      elseif forvar4.hit then
        var0[forvar3].hit = false
        triggerEvent("onClientColshapeCheckerLeave", forvar4.col)
      end
    end
    for forvar14 = 1, #getColPolygonPoints(forvar4.col) do
      if forvar14 == #getColPolygonPoints(forvar4.col) then
      else
      end
      dxDrawLine3D(getColPolygonPoints(forvar4.col)[forvar14][1], getColPolygonPoints(forvar4.col)[forvar14][2], getGroundPosition(getColPolygonPoints(forvar4.col)[1][1], getColPolygonPoints(forvar4.col)[1][2], forvar4.z or 0), getColPolygonPoints(forvar4.col)[forvar14 + 1][1], getColPolygonPoints(forvar4.col)[forvar14 + 1][2], getGroundPosition(getColPolygonPoints(forvar4.col)[1][1], getColPolygonPoints(forvar4.col)[1][2], forvar4.z or 0), tocolor(0, 255, 0), 10)
    end
  end
end
