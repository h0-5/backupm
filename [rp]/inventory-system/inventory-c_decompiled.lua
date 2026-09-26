-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

addEvent("onClientUseItemForElement", false)
addEvent("onClientUseItem", false)
function getItemImageName(arg0)
  return exports.items:getItemImageName(arg0)
end
addEventHandler("onClientResourceStart", resourceRoot, function()
  for forvar4, forvar5 in pairs(var0) do
    engineReplaceCOL(engineLoadCOL("models/" .. forvar4 .. ".col"), forvar5)
    engineImportTXD(exports["files-protection"]:loadTXD("models/" .. forvar4 .. ".txd"), forvar5)
    engineReplaceModel(exports["files-protection"]:loadDFF("models/" .. forvar4 .. ".dff"), forvar5)
  end
  engineImportTXD(engineLoadTXD("models/dufflebag.txd"), 1580)
  engineReplaceModel(engineLoadDFF("models/dufflebag.dff"), 1580)
end)
inventories_ref = {}
p_inventories = {}
function showInventory(arg0, arg1, arg2, arg3)
  var0 = arg3
  if arg0 and not getElementData(localPlayer, "character:id") then
    return false
  end
  if var1.status ~= arg0 then
    setSoundVolume(playSound("inventory_open.wav"), 0.2)
  end
  var1.status = arg0
  showCursor(arg0)
  var1.draggedItem = false
  var1.draggedInventoryItem = false
  var1.clickMoney = false
  if arg0 then
    var1.currentPlayer = arg2
    var1.currentID = "character:" .. tostring(getElementData(localPlayer, "character:id"))
    if (not isElement(arg2) or arg2 == localPlayer) and not arg1 then
      inventories_ref = p_inventories
    end
    addEventHandler("onClientRender", root, var1.render)
    addEventHandler("onClientClick", root, var1.click)
  else
    var1.currentID = false
    removeEventHandler("onClientRender", root, var1.render)
    removeEventHandler("onClientClick", root, var1.click)
  end
end
function UIKitReady()
  eui = exports.UIKit
  var0 = eui:getUIFont("ui-default")
  var1 = dxGetFontHeight(1, var0)
  var2 = eui:getUIFont("hud")
  var3 = 0.8
  GRADIENT_BG = eui:getUIImage("gradient_y")
end
addEventHandler("onClientUIReady", resourceRoot, UIKitReady)
addEventHandler("onClientUIKitReady", root, UIKitReady)
function updateDrawInventoriesFromCache()
  var1.inventories = {}
  for forvar8, forvar9 in ipairs(var0.items["character:" .. getElementData(localPlayer, "character:id")]) do
    if not forvar9.SubInventoryID or forvar9.SubInventoryID == "" then
      ({})[forvar9.slot] = forvar9
    end
  end
  table.insert(var1.inventories, {
    inv = {
      id = var0.inventories["character:" .. getElementData(localPlayer, "character:id")].id,
      capacity = var0.inventories["character:" .. getElementData(localPlayer, "character:id")].capacity,
      size = var0.inventories["character:" .. getElementData(localPlayer, "character:id")].size,
      name = "Inventory",
      items = {}
    },
    pos = {
      var6 - (6 * (var2 + var3) + 2) - 50 * var5,
      150 * var5,
      6 * (var2 + var3) + 2,
      var4 + var2 * 2 + 40 * var5
    }
  })
  for forvar13, forvar14 in ipairs(var0.sub_inventories["character:" .. getElementData(localPlayer, "character:id")]) do
    if forvar14 then
      forvar14 = var0.inventories[forvar14.id]
      for forvar19, forvar20 in ipairs(var0.items["character:" .. getElementData(localPlayer, "character:id")]) do
        if forvar20.SubInventoryID == forvar14.id then
          ({})[forvar20.slot] = forvar20
        end
      end
      forvar14.data.item.ID = forvar14.id
      if forvar14.data.item.Name == "Wallet" or forvar14.data.item.Name == "Keys Wallet" then
        table.insert(var1.inventories, {
          inv = {
            id = forvar14.id,
            capacity = forvar14.capacity,
            size = forvar14.size,
            name = forvar14.data.item.Name,
            item = forvar14.data.item,
            items = {}
          },
          pos = {
            var6 - (6 * (var2 + var3) + 2) - 50 * var5 - (6 * (var2 + var3) + 2) - 10 * var5,
            150 * var5,
            6 * (var2 + var3) + 2,
            var4 + (var2 + var3) * math.ceil(forvar14.capacity / 6) + 10
          }
        })
      else
        table.insert(var1.inventories, {
          inv = {
            id = forvar14.id,
            capacity = forvar14.capacity,
            size = forvar14.size,
            name = forvar14.data.item.Name,
            item = forvar14.data.item,
            items = {}
          },
          pos = {
            var6 - (6 * (var2 + var3) + 2) - 50 * var5,
            150 * var5 + (var4 + var2 * 2 + 40 * var5) + 10 * var5,
            6 * (var2 + var3) + 2,
            var4 + (var2 + var3) * math.ceil(forvar14.capacity / 6) + 10
          }
        })
      end
    end
  end
end
addEvent("inventory:getPlayerInventories:response", true)
addEventHandler("inventory:getPlayerInventories:response", root, function(arg0, arg1, arg2)
  var0.inventories[arg0.id] = arg0
  var0.items[arg0.id] = arg1
  var0.sub_inventories[arg0.id] = arg2
  for forvar6, forvar7 in ipairs(arg2) do
    if forvar7 then
      var0.inventories[forvar7.id] = forvar7
    end
  end
  updateDrawInventoriesFromCache()
end)
addEvent("inventory:updateInventory", true)
addEventHandler("inventory:updateInventory", localPlayer, function(arg0, arg1, arg2)
  var0.inventories[arg0.id] = arg0
  var0.items[arg0.id] = arg1
  var0.sub_inventories[arg0.id] = arg2
  for forvar6, forvar7 in ipairs(arg2) do
    var0.inventories[forvar7.id] = forvar7
  end
  updateDrawInventoriesFromCache()
end)
addEvent("inventory:updateInventory:partial", true)
addEventHandler("inventory:updateInventory:partial", localPlayer, function(arg0, arg1, arg2, arg3)
  var0.inventories[arg1.id] = arg1
  if arg2 == 1 then
    for forvar7, forvar8 in ipairs(var0.items[arg0]) do
      if forvar8.ID == arg3.id then
        table.remove(var0.items[arg0], forvar7)
        inventoryNotification("remove", forvar8.ID, getItemImageName(forvar8), forvar8.Quantity)
        break
      end
    end
  elseif arg2 == 2 then
    for forvar7, forvar8 in ipairs(var0.items[arg0]) do
      if forvar8.ID == arg3.id then
        var0.items[arg0][forvar7].Price = arg3.price
        break
      end
    end
  elseif arg2 == 3 then
    table.insert(var0.items[arg0], arg3)
    inventoryNotification("add", arg3.ID, getItemImageName(arg3), arg3.Quantity)
  elseif arg2 == 4 then
    for forvar7, forvar8 in ipairs(var0.items[arg0]) do
      if forvar8.ID == arg3.id then
        var0.items[arg0][forvar7].SpecialProperties[arg3.property] = arg3.value
        break
      end
    end
  elseif arg2 == 5 then
    for forvar7, forvar8 in ipairs(var0.items[arg0]) do
      if forvar8.ID == arg3.id then
        var0.items[arg0][forvar7].Properties = arg3.properties
        break
      end
    end
  end
  updateDrawInventoriesFromCache()
end)
;({
  inventories = {},
  currentID = false,
  status = false,
  cur_x = false,
  cur_y = false,
  hoverMoney = false,
  clickMoney = false,
  removebutton = {
    (guiGetScreenSize() - 100 * (guiGetScreenSize() / 1080)) / 2,
    (guiGetScreenSize() - 50 * (guiGetScreenSize() / 1080)) / 2,
    100 * (guiGetScreenSize() / 1080),
    20 * (guiGetScreenSize() / 1080)
  },
  currentPlayer = false
}).render = function()
  var0.hoveredItem = false
  var0.hoveredSlot = false
  var0.hoverMoney = false
  var0.hoveredInventoryItem = false
  var0.hoveredDelete = false
  var0.foundDragged = false
  dxDrawImage(0, 0, var1, var2, ":assets/images/bg_gradient.png", 180, 0, 0, tocolor(0, 3, 8, 240), true)
  for forvar6, forvar7 in ipairs(var0.inventories) do
    drawInventory(forvar7.inv, forvar7.pos[1], forvar7.pos[2], forvar7.pos[3], forvar7.pos[4], forvar6 == 1)
    if isCursorShowing() and isMouseInPosition(forvar7.pos[1], forvar7.pos[2], forvar7.pos[3], forvar7.pos[4]) then
      var0.hoveredInventory = forvar7.inv.id
    end
  end
  if not true then
    var0.hoveredInventory = false
  end
  if isCursorShowing() then
    if var0.hoveredItem then
      if var0.hoveredItem.Type == "Weapon" and var0.hoveredItem.SpecialProperties.Ammo then
      else
      end
      if (((var0.hoveredItem.Name .. "\n" .. var0.hoveredItem.SpecialProperties.Label) .. [[

Ammo: ]] .. tostring(var0.hoveredItem.SpecialProperties.Ammo - 1) .. [[

Ammo Type: ]] .. tostring(var0.hoveredItem.Properties.AmmoType)) .. [[

Quantity: ]] .. tostring(var0.hoveredItem.SpecialProperties.Quantity)) .. [[

Duty Item (Faction ID: ]] .. var0.hoveredItem.SpecialProperties.isFactionDuty .. ")" ~= "" then
        dxDrawInfo((((var0.hoveredItem.Name .. "\n" .. var0.hoveredItem.SpecialProperties.Label) .. [[

Ammo: ]] .. tostring(var0.hoveredItem.SpecialProperties.Ammo - 1) .. [[

Ammo Type: ]] .. tostring(var0.hoveredItem.Properties.AmmoType)) .. [[

Quantity: ]] .. tostring(var0.hoveredItem.SpecialProperties.Quantity)) .. [[

Duty Item (Faction ID: ]] .. var0.hoveredItem.SpecialProperties.isFactionDuty .. ")", unpack(var0.hoveredItemPos))
      end
    end
    if not var0.draggedItem and var0.draggedInventoryItem and var0.draggedInventoryItem.item then
      dxDrawRectangle(getCursorPosition() * var1 - var3 / 2, getCursorPosition() * var2 - var3 / 2, var3, var3, tocolor(10, 10, 10, 180), true)
      dxDrawImage(getCursorPosition() * var1 - var3 / 2, getCursorPosition() * var2 - var3 / 2, var3, var3, getItemImageName(not var0.draggedItem and var0.draggedInventoryItem and var0.draggedInventoryItem.item), 0, 0, 0, tocolor(255, 255, 255, 255), true)
    elseif var0.clickMoney then
      dxDrawImage(getCursorPosition() * var1 - 20, getCursorPosition() * var2 - 20, 40, 40, ":items/images/Money.png", 0, 0, 0, tocolor(255, 255, 255, 240), true)
    end
    if isMouseInPosition((var1 - 80) / 2, var2 - 140, 80, 80) then
      var0.hoveredDelete = true
    end
    dxDrawCircle(var1 / 2, var2 - 100, 40 * var4, 0, 360, tocolor(10, 10, 10, 240), _, 32, 1, false)
    dxDrawImage((var1 - 36 * var4) / 2, var2 - 100 - 36 * var4 / 2, 36 * var4, 36 * var4, "icons/delete.png", 0, 0, 0, tocolor(255, 0, 0, 240), false)
  end
  if not var0.foundDragged then
    var0.draggedItem = false
  end
end
function dxDrawInfo(arg0, arg1, arg2)
  arg2 = arg2 - (var1 * #split(arg0, "\n") + 10) - 3
  arg1 = arg1 + (var2 - (dxGetTextWidth(arg0, 1, var0) + 10)) / 2
  dxDrawRectangle(arg1, arg2, dxGetTextWidth(arg0, 1, var0) + 10, var1 * #split(arg0, "\n") + 10, tocolor(40, 40, 40, 230), true)
  dxDrawText(arg0, arg1, arg2, arg1 + (dxGetTextWidth(arg0, 1, var0) + 10), arg2 + (var1 * #split(arg0, "\n") + 10), tocolor(255, 255, 255, 255), 1, var0, "center", "center", false, false, true, false, false)
end
function drawInventory(arg0, arg1, arg2, arg3, arg4, arg5)
  dxDrawRoundedRectangle(arg1 - 1, arg2 - 1, arg3 + 2, arg4 + 2, tocolor(255, 255, 255, 25), 6, true)
  dxDrawRoundedRectangle(arg1, arg2, arg3, arg4, tocolor(0, 8, 20, 225), 6, true)
  dxDrawRectangle(arg1 + (arg3 - arg3 / 2) / 2, arg2 + arg4 - 1, arg3 / 2, 2, tocolor(255, 255, 255, 50), true)
  dxDrawRectangle(arg1 + (arg3 - arg3 / 2) / 2, arg2 + arg4 - 1, arg3 / 4, 2, tocolor(255, 255, 255, 200), true)
  if arg0.item then
    if isMouseInPosition(arg1 + 8, arg2 + 5, var1, var1) then
      var2.hoveredInventoryItem = arg0
    end
    dxDrawImage(arg1 + 8 * var3, arg2 + 5 * var3, var1, var1, getItemImageName(arg0.item), 0, 0, 0, tocolor(255, 255, 255, 150), true)
    dxDrawText(arg0.name or "Inventory", arg1 + 20 * var3 + var1, arg2, arg1 + arg3, arg2 + var0, var4, var5, var6, "left", "center", true, false, true)
  else
    dxDrawText(arg0.name or "Inventory", arg1 + 10 * var3, arg2, arg1 + arg3, arg2 + var0, var4, var5, var6, "left", "center", true, false, true)
  end
  dxDrawText("#ff375f" .. tonumber(arg0.size) .. " #ffffff/ " .. arg0.capacity, arg1, arg2, arg1 + arg3 - 10, arg2 + var0 - 5, tocolor(255, 255, 255, 230), var5 * 0.9, var6, "right", "center", true, false, true, true)
  for forvar15 = 1, math.ceil(arg0.capacity / 6) do
    for forvar20 = 1, 6 do
      if arg0.items[1] then
        if not var2.draggedItem or var2.draggedItem.ID ~= arg0.items[1].ID then
          dxDrawRectangle(arg1 + 2, arg2 + var0 + 2, var7, var7, tocolor(255, 255, 255, isMouseInPosition(arg1 + 2, arg2 + var0 + 2, var7, var7) and 100 or 10), true)
          dxDrawRectangle(arg1 + 2 + 1, arg2 + var0 + 2 + 1, var7 - 2, var7 - 2, tocolor(0, 8, 20, 230), true)
          dxDrawImage(arg1 + 2 + 2, arg2 + var0 + 2 + 2, var7 - 4, var7 - 4, getItemImageName(arg0.items[1]), 0, 0, 0, tocolor(255, 255, 255, 255), true)
          if 1 < tonumber(arg0.items[1].Quantity) then
            dxDrawRectangle(arg1 + 2, arg2 + var0 + 2 + var7 - 15, var7, 15, tocolor(0, 0, 0, 240), true)
            dxDrawText("x" .. tostring(arg0.items[1].Quantity), arg1 + 2, arg2 + var0 + 2, arg1 + 2 + var7 - 1, arg2 + var0 + 2 + var7 - 1, tocolor(255, 255, 255, 230), 1, "default", "right", "bottom", true, false, true)
          end
          if isMouseInPosition(arg1 + 2, arg2 + var0 + 2, var7, var7) then
            var2.hoveredItem = arg0.items[1]
            var2.hoveredItemPos = {
              arg1 + 2,
              arg2 + var0 + 2
            }
            dxDrawRectangle(arg1 + 2 + (var7 - var7 / 2) / 2, arg2 + var0 + 2 + var7 - 4, var7 / 2, 4, tocolor(255, 255, 255, 255), true)
          end
        else
          var2.foundDragged = true
        end
      else
        dxDrawRectangle(arg1 + 2, arg2 + var0 + 2, var7, var7, tocolor(27, 37, 49, 255), true)
        if isMouseInPosition(arg1 + 2, arg2 + var0 + 2, var7, var7) then
          var2.hoveredSlot = 1
        end
      end
    end
  end
  if arg5 then
    dxDrawImage(arg1 + 10 * var3, arg2 + var0 + 2 + _FOR_ + var8 + 5 * var3, 20 * var3, 20 * var3, ":items/images/Money.png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
    dxDrawText("$" .. tostring(convertNumber(getPlayerMoney(localPlayer))), arg1 + 40 * var3, arg2 + var0 + 2 + _FOR_ + var8 + 2, arg1 + arg3 - 2, arg2 + var0 + 2 + _FOR_ + var8 + 27 * var3, tocolor(0, 255, 0, 210), var5, var6, "left", "center", true, false, true)
    if isMouseInPosition(arg1 + 2, arg2 + var0 + 2 + _FOR_ + var8 + 2, arg3 - 2, 25 * var3) then
      var2.hoverMoney = true
    end
  end
end
;({
  inventories = {},
  currentID = false,
  status = false,
  cur_x = false,
  cur_y = false,
  hoverMoney = false,
  clickMoney = false,
  removebutton = {
    (guiGetScreenSize() - 100 * (guiGetScreenSize() / 1080)) / 2,
    (guiGetScreenSize() - 50 * (guiGetScreenSize() / 1080)) / 2,
    100 * (guiGetScreenSize() / 1080),
    20 * (guiGetScreenSize() / 1080)
  },
  currentPlayer = false
}).notifications = {}
function inventoryNotification(arg0, arg1, arg2, arg3)
  table.insert(var0.notifications, {
    id = arg1,
    image = arg2,
    type = arg0,
    quantity = arg3
  })
  if #var0.notifications == 1 then
    addEventHandler("onClientRender", root, var0.notifications_render)
  end
  setTimer(function(arg0)
    for forvar4 = 1, #var0.notifications do
      if var0.notifications[forvar4].id == arg0 then
        table.remove(var0.notifications, forvar4)
        if #var0.notifications == 0 then
          removeEventHandler("onClientRender", root, var0.notifications_render)
        end
        break
      end
    end
  end, 5000, 1, arg1)
end
;({
  inventories = {},
  currentID = false,
  status = false,
  cur_x = false,
  cur_y = false,
  hoverMoney = false,
  clickMoney = false,
  removebutton = {
    (guiGetScreenSize() - 100 * (guiGetScreenSize() / 1080)) / 2,
    (guiGetScreenSize() - 50 * (guiGetScreenSize() / 1080)) / 2,
    100 * (guiGetScreenSize() / 1080),
    20 * (guiGetScreenSize() / 1080)
  },
  currentPlayer = false
}).notifications_render = function()
  if #var0.notifications > 0 then
    for forvar6 = 1, #var0.notifications do
      if var0.notifications[forvar6].type == "add" then
        dxDrawRoundedRectangle((var1 - (#var0.notifications * (var2 + 5 * var3) - 5 * var3)) / 2 - 1, var4 - var2 - 160 * var3 - 1, var2 + 2, var2 + 2, tocolor(0, 255, 0, 100), 6, true)
        dxDrawRoundedRectangle((var1 - (#var0.notifications * (var2 + 5 * var3) - 5 * var3)) / 2, var4 - var2 - 160 * var3, var2, var2, tocolor(0, 8, 20, 230), 6, true)
        dxDrawImage((var1 - (#var0.notifications * (var2 + 5 * var3) - 5 * var3)) / 2 + 4 * var3, var4 - var2 - 160 * var3 + 4 * var3, var2 - 4 * var3 * 2, var2 - 4 * var3 * 2, var0.notifications[forvar6].image, 0, 0, 0, tocolor(255, 255, 255, 255), true)
        dxDrawRectangle((var1 - (#var0.notifications * (var2 + 5 * var3) - 5 * var3)) / 2 + var2 / 4, var4 - var2 - 160 * var3 + var2 - 3 * var3, var2 / 2, 3 * var3, tocolor(0, 255, 0), true)
      else
        dxDrawRoundedRectangle((var1 - (#var0.notifications * (var2 + 5 * var3) - 5 * var3)) / 2 - 1, var4 - var2 - 160 * var3 - 1, var2 + 2, var2 + 2, tocolor(255, 0, 0, 100), 6, true)
        dxDrawRoundedRectangle((var1 - (#var0.notifications * (var2 + 5 * var3) - 5 * var3)) / 2, var4 - var2 - 160 * var3, var2, var2, tocolor(0, 8, 20, 200), 6, true)
        dxDrawImage((var1 - (#var0.notifications * (var2 + 5 * var3) - 5 * var3)) / 2 + 4 * var3, var4 - var2 - 160 * var3 + 4 * var3, var2 - 4 * var3 * 2, var2 - 4 * var3 * 2, var0.notifications[forvar6].image, 0, 0, 0, tocolor(255, 255, 255, 150), true)
        dxDrawRectangle((var1 - (#var0.notifications * (var2 + 5 * var3) - 5 * var3)) / 2 + var2 / 4, var4 - var2 - 160 * var3 + var2 - 3 * var3, var2 / 2, 3 * var3, tocolor(255, 0, 0), true)
      end
    end
  end
end
function dxDrawRoundedRectangle(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7)
-- fail 16
null
8
  arg2, arg3, arg0, arg1 = arg2 - arg5 * 2, arg3 - arg5 * 2, math.floor(arg0 + arg5), math.floor(arg1 + arg5)
  dxDrawRectangle(arg0 - arg5, arg1, arg2 + arg5 * 2, arg3, arg4, arg6)
  dxDrawRectangle(arg0, arg1 - arg5, arg2, arg5, arg4, arg6)
  dxDrawRectangle(arg0, arg1 + arg3, arg2, arg5, arg4, arg6)
  if ({
    up = {right = true, left = true},
    down = {right = true, left = true}
  }).up.left then
    dxDrawCircle(arg0, arg1, arg5, 180, 270, arg4, arg4, 7, _, arg6)
  else
    dxDrawRectangle(arg0 - arg5, arg1 - arg5, arg5, arg5, arg4, arg6)
  end
  if ({
    up = {right = true, left = true},
    down = {right = true, left = true}
  }).up.right then
    dxDrawCircle(arg0 + arg2, arg1, arg5, 270, 360, arg4, arg4, 7, _, arg6)
  else
    dxDrawRectangle(arg0 + arg2, arg1 - arg5, arg5, arg5, arg4, arg6)
  end
  if ({
    up = {right = true, left = true},
    down = {right = true, left = true}
  }).down.left then
    dxDrawCircle(arg0, arg1 + arg3, arg5, 90, 180, arg4, arg4, 7, _, arg6)
  else
    dxDrawRectangle(arg0 - arg5, arg1 + arg3, arg5, arg5, arg4, arg6)
  end
  if ({
    up = {right = true, left = true},
    down = {right = true, left = true}
  }).down.right then
    dxDrawCircle(arg0 + arg2, arg1 + arg3, arg5, 0, 90, arg4, arg4, 7, _, arg6)
  else
    dxDrawRectangle(arg0 + arg2, arg1 + arg3, arg5, arg5, arg4, arg6)
  end
end
RubbishObjects = {
  [1331] = true,
  [1332] = true,
  [1333] = true,
  [1334] = true,
  [1335] = true,
  [1336] = true,
  [1337] = true,
  [1339] = true,
  [1343] = true,
  [1344] = true,
  [1345] = true,
  [1347] = true,
  [1359] = true,
  [1365] = true,
  [1372] = true,
  [1439] = true,
  [1409] = true,
  [1415] = true,
  [1430] = true,
  [1574] = true,
  [933] = true,
  [1235] = true
}
;({
  inventories = {},
  currentID = false,
  status = false,
  cur_x = false,
  cur_y = false,
  hoverMoney = false,
  clickMoney = false,
  removebutton = {
    (guiGetScreenSize() - 100 * (guiGetScreenSize() / 1080)) / 2,
    (guiGetScreenSize() - 50 * (guiGetScreenSize() / 1080)) / 2,
    100 * (guiGetScreenSize() / 1080),
    20 * (guiGetScreenSize() / 1080)
  },
  currentPlayer = false
}).click = function(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7)
  if var0 then
    return
  end
  if isPedDead(localPlayer) then
    return
  end
  if arg0 == "left" then
    if arg1 == "down" then
      if var1.hoveredInventory then
        if var1.hoveredItem then
          var1.draggedItem = var1.hoveredItem
        elseif var1.hoveredInventoryItem then
          var1.draggedInventoryItem = var1.hoveredInventoryItem
        end
      end
      var1.clickMoney = var1.hoverMoney
      var1.hoverMoney = false
    else
      if var1.draggedItem then
        if var1.hoveredInventory then
          if var1.hoveredItem and var1.hoveredItem.ID ~= var1.draggedItem.ID then
            if var1.hoveredItem.Type == "Weapon" then
              triggerEvent("onClientUseItemForWeapon", localPlayer, var1.hoveredInventory, var1.draggedItem, var1.hoveredItem)
              triggerServerEvent("onClientUseItemForWeapon:Server", localPlayer, var1.hoveredInventory, var1.draggedItem.ID, var1.hoveredItem)
            else
              triggerEvent("onClientUseItemForItem", localPlayer, var1.hoveredInventory, var1.draggedItem, var1.hoveredItem)
              triggerServerEvent("onClientUseItemForItem:Server", localPlayer, var1.hoveredInventory, var1.draggedItem.ID, var1.hoveredItem.ID)
            end
          elseif var1.hoveredInventory == var1.draggedItem.SubInventoryID then
            if var1.hoveredSlot and var1.hoveredSlot ~= var1.draggedItem.slot then
              for forvar17, forvar18 in ipairs(var2.items[var1.draggedItem.InventoryID or var1.currentID]) do
                if forvar18.ID == var1.draggedItem.ID then
                  var2.items[var1.draggedItem.InventoryID or var1.currentID][forvar17].slot = var1.hoveredSlot
                  updateDrawInventoriesFromCache()
                  triggerServerEvent("inventory:updateItemSlot", localPlayer, var1.draggedItem.InventoryID or var1.currentID, forvar18.ID, var1.hoveredSlot)
                  break
                end
              end
            end
          elseif var1.hoveredSlot then
            for forvar17, forvar18 in ipairs(var2.items[var1.draggedItem.InventoryID or var1.currentID]) do
              if forvar18.ID == var1.draggedItem.ID then
                if var2.inventories[var1.hoveredInventory].size + forvar18.Size <= tonumber(var2.inventories[var1.hoveredInventory].capacity) then
                  if var2.inventories[var1.hoveredInventory].data.allowedTypes then
                    for forvar24, forvar25 in ipairs(var2.inventories[var1.hoveredInventory].data.allowedTypes) do
                      if string.find(forvar18.Type, forvar25, 1, true) or string.find(forvar18.Name, forvar25, 1, true) then
                        break
                      end
                    end
                  end
                  if true then
                    if var1.hoveredInventory == forvar18.InventoryID then
                      var2.items[var1.draggedItem.InventoryID or var1.currentID][forvar17].SubInventoryID = nil
                    else
                      var2.items[var1.draggedItem.InventoryID or var1.currentID][forvar17].SubInventoryID = var1.hoveredInventory
                    end
                    var2.items[var1.draggedItem.InventoryID or var1.currentID][forvar17].slot = var1.hoveredSlot
                    var2.inventories[forvar18.SubInventoryID or forvar18.InventoryID].size = var2.inventories[forvar18.SubInventoryID or forvar18.InventoryID].size - forvar18.Size
                    var2.inventories[var1.hoveredInventory].size = var2.inventories[var1.hoveredInventory].size + forvar18.Size
                    updateDrawInventoriesFromCache()
                    triggerServerEvent("inventory:updateItemInventory", localPlayer, var1.draggedItem.InventoryID or var1.currentID, forvar18.ID, var1.hoveredInventory, var1.hoveredSlot)
                    break
                  end
                  exports.notifications:output({
                    en = "You can't put this item here",
                    ar = "\217\132\216\167\216\170\216\179\216\170\216\183\217\138\216\185 \217\136\216\182\216\185 \216\167\217\132\216\186\216\177\216\182 \217\135\217\134\216\167"
                  }, 3500, "error")
                  break
                end
                exports.notifications:output({
                  en = "Not enough space",
                  ar = "\217\132\216\167\216\170\217\136\216\172\216\175 \217\133\216\179\216\167\216\173\216\169 \217\131\216\167\217\129\217\138\216\169"
                }, 3500, "error")
                break
              end
            end
          end
        elseif var1.hoveredDelete then
          for forvar16, forvar17 in ipairs(var2.items[var1.draggedItem.InventoryID or var1.currentID]) do
            if forvar17.ID == var1.draggedItem.ID then
              if forvar17.Quantity == 1 then
                table.remove(var2.items[var1.draggedItem.InventoryID or var1.currentID][forvar16], forvar16)
                break
              end
              var2.items[var1.draggedItem.InventoryID or var1.currentID][forvar16].Quantity = forvar17.Quantity - 1
              break
            end
          end
          triggerServerEvent("inventory:deleteItem", localPlayer, var1.draggedItem.InventoryID or var1.currentID, var1.draggedItem.ID, 1)
          triggerEvent("onClientRemoveItem", localPlayer, var1.draggedItem.ID, var1.draggedItem.InventoryID, var1.draggedItem)
          triggerServerEvent("onClientRemoveItem:Server", localPlayer, var1.draggedItem.ID, var1.draggedItem.InventoryID, var1.currentPlayer)
        else
          if isElement(arg7) then
            if getElementType(arg7) == "object" then
              if RubbishObjects[getElementModel(arg7)] or getElementData(arg7, "item:data") or var1.draggedItem.Properties.UseOnObjects then
              end
            else
            end
          end
          if isElement(arg7) and true then
            triggerEvent("onClientUseItemForElement", localPlayer, arg7, var1.draggedItem.ID, var1.draggedItem.InventoryID, var1.draggedItem, exports["attachments-system"]:isTogAttachOpen() and exports["attachments-system"]:isTogAttachOpen() == arg7)
            triggerServerEvent("onClientUseItemForElement:Server", localPlayer, arg7, var1.draggedItem.ID, var1.draggedItem.InventoryID, var1.draggedItem, exports["attachments-system"]:isTogAttachOpen() and exports["attachments-system"]:isTogAttachOpen() == arg7)
          elseif var1.draggedItem.Type == "Texture" then
            if isElement(arg7) then
              triggerEvent("onClientUseItemForElement", localPlayer, arg7, var1.draggedItem.ID, var1.draggedItem.InventoryID, var1.draggedItem)
              if not isElementLocal(arg7) then
                triggerServerEvent("onClientUseItemForElement:Server", localPlayer, arg7, var1.draggedItem.ID, var1.draggedItem.InventoryID, var1.draggedItem)
              end
            elseif processLineOfSight(getCameraMatrix()) then
              triggerEvent("onClientUseTextureForWorld", localPlayer, processLineOfSight(getCameraMatrix()))
            end
          elseif var1.draggedItem.Properties.Model and (not isElement(arg7) or getElementType(arg7) ~= "object" or not var1.draggedItem.Properties.UseOnObjects) and (exports.hud:getHudSetting("admintag") or getDistanceBetweenPoints3D(getElementPosition(localPlayer)) <= 5) then
            setElementAlpha(exports.models:createObject(var1.draggedItem.Properties.Model, arg4, arg5, arg6, 0, 0, math.random(360)), 0)
            Height = math.abs(getElementBoundingBox((exports.models:createObject(var1.draggedItem.Properties.Model, arg4, arg5, arg6, 0, 0, math.random(360)))) - getElementBoundingBox((exports.models:createObject(var1.draggedItem.Properties.Model, arg4, arg5, arg6, 0, 0, math.random(360))))) / 2
            triggerServerEvent("inventory:createObject", localPlayer, var1.draggedItem.InventoryID, var1.draggedItem.ID, var1.draggedItem, arg4, arg5, arg6 + Height)
            destroyElement((exports.models:createObject(var1.draggedItem.Properties.Model, arg4, arg5, arg6, 0, 0, math.random(360))))
          end
        end
      elseif var1.draggedInventoryItem then
        if not var1.hoveredInventory then
          if var1.hoveredDelete then
            triggerServerEvent("inventory:deletePermSubInventory", localPlayer, var1.currentID, var1.draggedInventoryItem.item, var1.currentPlayer)
          elseif (exports.hud:getHudSetting("admintag") or getDistanceBetweenPoints3D(getElementPosition(localPlayer)) <= 5) and var1.draggedInventoryItem.item.Properties.Model then
            destroyElement((exports.models:createObject(var1.draggedInventoryItem.item.Properties.Model, arg4, arg5, arg6, 0, 0, math.floor(math.random(360)))))
            for forvar31, forvar32 in pairs(var2.inventories[var1.currentID].subInventories) do
              if forvar32 == var1.draggedInventoryItem.item.ID then
                var2.inventories[var1.currentID].subInventories[forvar31] = nil
                break
              end
            end
            for forvar34, forvar35 in ipairs(var2.items[var1.currentID]) do
              if forvar35.SubInventoryID ~= var1.draggedInventoryItem.item.ID then
                table.insert({}, forvar35)
              elseif forvar35.SpecialProperties.isFactionDuty then
                exports.notifications:output({
                  en = "Contains duty items",
                  ar = "\216\170\216\173\216\170\217\136\217\138 \216\185\217\132\217\137 \216\163\216\186\216\177\216\167\216\182 \216\185\217\133\217\132"
                }, 4000, "error")
                break
              end
            end
            if false then
              var2.items[var1.currentID] = {}
              if var2.sub_inventories[var1.currentID] then
                for forvar34, forvar35 in ipairs(var2.sub_inventories[var1.currentID]) do
                  if forvar35.id == var1.draggedInventoryItem.item.ID then
                    table.remove(var2.sub_inventories[var1.currentID], forvar34)
                    break
                  end
                end
              end
              updateDrawInventoriesFromCache()
              triggerServerEvent("inventory:createObject", localPlayer, false, var1.draggedInventoryItem.item.ID, var1.draggedInventoryItem.item, arg4, arg5, arg6 + math.abs(getElementBoundingBox((exports.models:createObject(var1.draggedInventoryItem.item.Properties.Model, arg4, arg5, arg6, 0, 0, math.floor(math.random(360))))) - getElementBoundingBox((exports.models:createObject(var1.draggedInventoryItem.item.Properties.Model, arg4, arg5, arg6, 0, 0, math.floor(math.random(360)))))) / 2, true)
            end
          end
        end
      elseif var1.clickMoney and not var1.hoveredInventory and not isElement(arg7) then
        throwMoneyPos = {
          arg4,
          arg5,
          getGroundPosition(arg4, arg5, arg6)
        }
        eui:uiSetVisible(UI.window[2], true)
        eui:uiSetText(UI.label[2], "Enter amount:")
        eui:uiSetText(UI.button[3], "Throw")
        eui:uiSetText(UI.edit[1], "")
      end
      var1.draggedItem = false
      var1.draggedInventoryItem = false
      var1.clickMoney = false
    end
  elseif arg0 == "right" and arg1 == "up" and var1.hoveredInventory and var1.hoveredItem then
    var1.hoveredItem.Capacity = var1.hoveredItem.Size
    if type(var1.hoveredItem.Properties) ~= "table" or not var1.hoveredItem.Properties then
    end
    var1.hoveredItem.Properties = fromJSON(var1.hoveredItem.Properties)
    if type(var1.hoveredItem.SpecialProperties) ~= "table" or not var1.hoveredItem.SpecialProperties then
    end
    var1.hoveredItem.SpecialProperties = fromJSON(var1.hoveredItem.SpecialProperties)
    triggerEvent("onClientUseItem", localPlayer, var1.hoveredItem.ID, var1.hoveredItem.InventoryID, var1.hoveredItem)
    triggerServerEvent("onClientUseItem:Server", localPlayer, var1.hoveredItem.ID, var1.hoveredItem.InventoryID)
    var1.hoveredItem = false
  end
end
function isMouseInPosition(arg0, arg1, arg2, arg3)
  if isCursorShowing() then
    return arg0 <= getCursorPosition() * var0 and arg1 <= getCursorPosition() * var1 and getCursorPosition() * var0 <= arg0 + arg2 and getCursorPosition() * var1 <= arg1 + arg3
  end
end
function convertNumber(arg0)
  while true do
    k = string.gsub(arg0, "^(-?%d+)(%d%d%d)", "%1,%2")
    if k == 0 then
      break
    end
  end
  return string.gsub(arg0, "^(-?%d+)(%d%d%d)", "%1,%2")
end
bindKey("i", "down", function()
  if not var0.status and isPedDead(localPlayer) then
    return
  end
  if getElementHealth(localPlayer) == 0 then
    return
  end
  showInventory(not var0.status)
end)
function hideInv()
  showInventory(false)
  var0.draggedItem = false
  var0.draggedInventoryItem = false
  var0.clickMoney = false
end
addEvent("onClientPlayerQuitFromCharacter", true)
addEventHandler("onClientPlayerQuitFromCharacter", localPlayer, hideInv)
addEventHandler("onClientPlayerWasted", localPlayer, hideInv)
addEventHandler("onClientPlayerQuitFromCharacter", localPlayer, function()
  var0.currentID = false
  var1.inventories = {}
  var1.items = {}
  var1.sub_inventories = {}
  var0.inventories = {}
end)
addEvent("onClientRemoveItem", true)
addEventHandler("onClientRemoveItem", localPlayer, function(arg0)
  if var0.draggedItem and var0.draggedItem.ID == arg0 then
    var0.draggedItem = false
  end
  if var0.hoveredItem and var0.hoveredItem.ID == arg0 then
    var0.hoveredItem = false
  end
end)
function getInventoryItems(arg0)
  return var0.items[arg0] or {}
end
function setItemSpecialProperty(arg0, arg1, arg2)
  triggerServerEvent("inventory:setItemSpecialProperty", localPlayer, arg0, arg1, arg2)
  return true
end
function setItemSpecialPropertyByID(arg0, arg1, arg2, arg3)
  triggerServerEvent("inventory:setItemSpecialPropertyByID", localPlayer, arg1, arg2, arg3)
  return true
end
function getItemSpecialProperty(arg0, arg1, arg2)
  if type(arg1) == "table" then
    for forvar7, forvar8 in ipairs((getInventoryItems(arg0))) do
      if forvar8.Name == arg1[1] and forvar8.Type == arg1[2] then
        return forvar8.SpecialProperties[arg2]
      end
    end
  else
    for forvar7, forvar8 in ipairs((getInventoryItems(arg0))) do
      if tostring(forvar8.ID) == tostring(arg1) then
        return forvar8.SpecialProperties[arg2]
      end
    end
  end
  return false
end
function isItemExistsInInventory(arg0, arg1)
  if type(arg1) == "table" then
    for forvar6, forvar7 in ipairs((getInventoryItems(arg0))) do
      if forvar7.Name == arg1[1] and forvar7.Type == arg1[2] then
        return true
      end
    end
  else
    for forvar6, forvar7 in ipairs((getInventoryItems(arg0))) do
      if tostring(forvar7.ID) == tostring(arg1) then
        return true
      end
    end
  end
  return false
end
function playerHasItem(arg0)
  if not tonumber(arg0) and type(arg0) == "string" then
    for forvar6, forvar7 in ipairs(var0.items["character:" .. getElementData(localPlayer, "character:id")]) do
      if forvar7.Name == arg0 then
        return forvar7.ID, forvar7
      end
    end
  else
    for forvar6, forvar7 in ipairs(var0.items["character:" .. getElementData(localPlayer, "character:id")]) do
      if forvar7.ID == arg0 then
        return forvar7.ID, forvar7
      end
    end
  end
  return false
end
addEvent("onClientUseItem:Client", true)
addEventHandler("onClientUseItem:Client", root, function(arg0, arg1, arg2, arg3)
  triggerEvent("onClientUseItem", localPlayer, arg0, arg1, arg2, arg3)
end)
UI = {
  edit = {},
  window = {},
  label = {},
  button = {},
  rect = {},
  image = {},
  checkbox = {},
  combobox = {},
  gridlist = {}
}
function UIKitReady()
  eui = exports.UIKit
  UI.window[1] = eui:uiCreateRectangle(false, false, 320, 141, "bg_default", true, true, true, true)
  eui:uiSetVisible(UI.window[1], false)
  UI.label[1] = eui:uiCreateLabel(10, 15, 232, 68, "", tocolor(255, 255, 255, 255), "left", "top", UI.window[1])
  UI.button[1] = eui:uiCreateButton(10, 102, 86, 29, "Accept", "primary", UI.window[1])
  UI.button[2] = eui:uiCreateButton(101, 102, 86, 29, "Reject", _, UI.window[1])
  UI.window[2] = eui:uiCreateRectangle(false, false, 250, 100, "bg_default", true, true, true, true)
  eui:uiSetVisible(UI.window[2], false)
  UI.label[2] = eui:uiCreateLabel(10, 10, 240, 15, "", tocolor(255, 255, 255, 240), "left", "top", UI.window[2])
  UI.edit[1] = eui:uiCreateEdit(10, 30, 230, 25, "", "", _, UI.window[2])
  UI.button[3] = eui:uiCreateButton(5, 65, 119, 30, "Check", "primary", UI.window[2])
  UI.button[4] = eui:uiCreateButton(126, 65, 119, 30, "Close", _, UI.window[2])
  UI.window[3] = eui:uiCreateWindow(false, false, 310, 370, "Edit Properties")
  eui:uiSetVisible(UI.window[3], false)
  UI.label[3] = eui:uiCreateLabel(10, 20, 240, 15, "", tocolor(255, 255, 255, 255), "left", "top", UI.window[3])
  UI.label[4] = eui:uiCreateLabel(10, 40, 240, 15, {
    en = "Copy item position",
    ar = "\217\134\216\179\216\174 \216\167\217\132\216\167\216\173\216\175\216\167\216\171\217\138\216\167\216\170"
  }, tocolor(255, 255, 255, 255), "left", "top", UI.window[3])
  UI.checkbox[1] = eui:uiCreateCheckBox(10, 70, 120, 20, "Moveable", true, _, UI.window[3])
  UI.checkbox[2] = eui:uiCreateCheckBox(10, 85, 120, 20, "Pick up", true, _, UI.window[3])
  UI.checkbox[3] = eui:uiCreateCheckBox(140, 70, 120, 20, "Use", true, _, UI.window[3])
  UI.checkbox[4] = eui:uiCreateCheckBox(140, 85, 120, 20, "Carry", true, _, UI.window[3])
  UI.gridlist[1] = eui:uiCreateGridList(5, 120, 300, 170, _, UI.window[3])
  eui:uiGridListAddColumn(UI.gridlist[1], "Properties", 0.6)
  eui:uiGridListAddColumn(UI.gridlist[1], "Value", 0.38)
  eui:uiSetAlign(UI.gridlist[1], "left", "center")
  UI.label[5] = eui:uiCreateLabel(10, 300, 70, 20, "\226\128\162 Value \194\187", tocolor(255, 255, 255, 255), "left", "top", UI.window[3])
  UI.edit[2] = eui:uiCreateEdit(90, 295, 210, 30, "", "", _, UI.window[3])
  UI.button[5] = eui:uiCreateButton(5, 335, 140, 30, {
    en = "Save Changes",
    ar = "\216\173\217\129\216\184 \216\167\217\132\216\170\216\186\217\138\217\138\216\177\216\167\216\170"
  }, "primary", UI.window[3])
  UI.button[6] = eui:uiCreateButton(150, 335, 140, 30, {en = "Close", ar = "\216\165\216\186\217\132\216\167\217\130"}, _, UI.window[3])
  UI.window.Inventory = eui:uiCreateRectangle(false, false, 575, 490, tocolor(20, 20, 20, 240), true, true, true, true)
  eui:uiSetVisible(UI.window.Inventory, false)
  UI.label.Inventory = eui:uiCreateLabel(15, 10, 332, 30, "Inventory", tocolor(255, 255, 255, 255), "left", "top", UI.window.Inventory)
  eui:uiSetFont(UI.label.Inventory, "default-large")
  UI.label.InventorySize = eui:uiCreateLabel(0, 10, 560, 30, "", tocolor(255, 255, 255, 255), "right", "center", UI.window.Inventory)
  UI.gridlist.Inventory1 = eui:uiCreateGridList(5, 50, 280, 400, tocolor(10, 10, 10), UI.window.Inventory)
  eui:uiGridListAddColumn(UI.gridlist.Inventory1, "Item", 0.8)
  eui:uiGridListAddColumn(UI.gridlist.Inventory1, "", 0.2)
  eui:uiSetAlign(UI.gridlist.Inventory1, "left", "center")
  UI.gridlist.Inventory2 = eui:uiCreateGridList(290, 50, 280, 400, tocolor(10, 10, 10), UI.window.Inventory)
  eui:uiGridListAddColumn(UI.gridlist.Inventory2, "Item", 0.8)
  eui:uiGridListAddColumn(UI.gridlist.Inventory2, "", 0.2)
  eui:uiSetAlign(UI.gridlist.Inventory2, "left", "center")
  UI.button.closeInventory = eui:uiCreateButton(5, 455, 565, 30, "Close", tocolor(0, 0, 0), UI.window.Inventory)
  UI.window.password = eui:uiCreateWindow(false, false, 250, 130, "Password")
  eui:uiSetVisible(UI.window.password, false)
  eui:uiWindowSetMovable(UI.window.password, false)
  UI.edit.password = eui:uiCreateEdit(10, 40, 230, 30, "", "Password", _, UI.window.password)
  eui:uiEditSetMasked(UI.edit.password, true)
  UI.button["password:open"] = eui:uiCreateButton(5, 95, 119, 30, "Open", "primary", UI.window.password)
  UI.button["password:close"] = eui:uiCreateButton(126, 95, 119, 30, "Close", "primary", UI.window.password)
  UI.window.reset_password = eui:uiCreateWindow(false, false, 250, 170, "Reset Password")
  eui:uiSetVisible(UI.window.reset_password, false)
  UI.edit["reset_password:current"] = eui:uiCreateEdit(10, 40, 230, 30, "", "Current Password", _, UI.window.reset_password)
  UI.edit["reset_password:new"] = eui:uiCreateEdit(10, 80, 230, 30, "", "New Password", _, UI.window.reset_password)
  UI.button["reset_password:reset"] = eui:uiCreateButton(5, 135, 119, 30, "Reset", "primary", UI.window.reset_password)
  UI.button["reset_password:close"] = eui:uiCreateButton(126, 135, 119, 30, "Close", "primary", UI.window.reset_password)
end
addEventHandler("onClientUIReady", resourceRoot, UIKitReady)
addEventHandler("onClientUIKitReady", root, UIKitReady)
function changeAlpha()
  if source == UI.label[3] or source == UI.label[4] then
    eui:uiSetAlpha(source, eventName == "onClientUIMouseEnter" and 130 or 200)
  end
end
addEventHandler("onClientUIMouseEnter", root, changeAlpha)
addEventHandler("onClientUIMouseLeave", root, changeAlpha)
function closeFDWindow(arg0)
  eui:uiSetVisible(UI.window[1], false)
  eui:uiSetVisible(UI.window[2], false)
  eui:uiSetVisible(UI.window[3], false)
  eui:uiSetVisible(UI.window.Inventory, false)
  eui:uiSetVisible(UI.window.reset_password, false)
end
addEvent("onClientPlayerQuitFromCharacter", true)
addEventHandler("onClientPlayerQuitFromCharacter", localPlayer, closeFDWindow)
addEventHandler("onClientPlayerWasted", localPlayer, closeFDWindow)
addEvent("onClientUseItemForElement", true)
addEventHandler("onClientUseItemForElement", root, function(arg0, arg1, arg2, arg3)
  if not isElement(arg0) then
    return
  end
  if arg0 == localPlayer then
    return
  end
  if getElementType(arg0) == "player" then
    eui:uiSetVisible(UI.window[2], true)
    eui:uiSetText(UI.label[2], "Enter quantity:")
    eui:uiSetText(UI.button[3], "Share")
    eui:uiSetText(UI.edit[1], "1")
    shareItemInfo = {
      arg0,
      arg1,
      arg2,
      arg3,
      1
    }
  end
end)
EditPropertiesItem = {}
addEvent("onClientElementMenuClick", true)
addEventHandler("onClientElementMenuClick", root, function(arg0, arg1, arg2)
  if isElement(arg0) and getElementType(arg0) == "object" then
    if arg1 == "Edit Properties" then
      if getElementData(arg0, "item:data") then
        EditPropertiesItem = {
          arg0,
          (getElementData(arg0, "item:data"))
        }
        eui:uiSetVisible(UI.window[3], true)
        eui:uiSetText(UI.label[3], "ID# ${color.primary}" .. tostring(getElementID(arg0):gsub("M.E.O:", "")) .. "   #FFFFFF(click to copy)")
        eui:uiCheckBoxSetSelected(UI.checkbox[1], getElementData(arg0, "item:data").Properties.Moveable or false)
        eui:uiCheckBoxSetSelected(UI.checkbox[2], getElementData(arg0, "item:data").Properties.Pickup or false)
        eui:uiCheckBoxSetSelected(UI.checkbox[3], getElementData(arg0, "item:data").Properties.Use or false)
        eui:uiCheckBoxSetSelected(UI.checkbox[4], getElementData(arg0, "item:data").Properties.Carry or false)
        eui:uiGridListClear(UI.gridlist[1])
        for forvar7, forvar8 in pairs(getElementData(arg0, "item:data").SpecialProperties or {}) do
          eui:uiGridListSetItemText(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 1, tostring(forvar7))
          eui:uiGridListSetItemText(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 2, tostring(forvar8))
        end
        eui:uiSetText(UI.edit[2], "")
      end
    elseif arg1 == "Reset Password" and getElementData(arg0, "item:data") and getElementData(arg0, "item:data").Properties.Capacity and getElementData(arg0, "item:data").Type ~= "SubInventory" then
      temp_reset_pass_element = arg0
      eui:uiSetVisible(UI.window.reset_password, true)
    end
  end
end)
addEventHandler("onClientUIClick", root, function()
  if source == UI.button[1] then
    eui:uiSetVisible(UI.window[1], false)
    triggerServerEvent("inventory:AcceptOrRejectItem", localPlayer, unpack(var0))
  elseif source == UI.button[2] then
    eui:uiSetVisible(UI.window[1], false)
  elseif source == UI.button[3] then
    eui:uiSetVisible(UI.window[2], false)
    if eui:uiGetText(source) == "Throw" then
      if tonumber(eui:uiGetText(UI.edit[1])) and math.floor((tonumber(eui:uiGetText(UI.edit[1])))) > 0 then
        eui:uiSetVisible(UI.window[2], false)
        triggerServerEvent("inventory:throwMoney", localPlayer, tonumber((math.floor((tonumber(eui:uiGetText(UI.edit[1])))))), unpack(throwMoneyPos))
      end
    elseif eui:uiGetText(source) == "Share" and tonumber(eui:uiGetText(UI.edit[1])) and math.floor((tonumber(eui:uiGetText(UI.edit[1])))) > 0 and shareItemInfo[4].Quantity >= tonumber((math.floor((tonumber(eui:uiGetText(UI.edit[1])))))) then
      eui:uiSetVisible(UI.window[2], false)
      shareItemInfo[5] = tonumber((math.floor((tonumber(eui:uiGetText(UI.edit[1]))))))
      triggerServerEvent("inventory:shareItem", localPlayer, shareItemInfo)
    end
  elseif source == UI.button[4] then
    eui:uiSetVisible(UI.window[2], false)
  elseif source == UI.button[6] then
    eui:uiSetVisible(UI.window[3], false)
  elseif source == UI.gridlist[1] then
    if eui:uiGridListGetSelectedItem(UI.gridlist[1]) ~= -1 then
      eui:uiSetText(UI.edit[2], tostring(EditPropertiesItem[2].SpecialProperties[eui:uiGridListGetItemText(UI.gridlist[1], eui:uiGridListGetSelectedItem(UI.gridlist[1]), 1)]))
    else
      eui:uiSetText(UI.edit[2], "")
    end
  elseif source == UI.button[5] then
    if unpack(EditPropertiesItem).Type == "Gate" and eui:uiGridListGetSelectedItem(UI.gridlist[1]) ~= -1 then
      eui:uiGridListSetItemText(UI.gridlist[1], eui:uiGridListGetSelectedItem(UI.gridlist[1]), 2, tostring((eui:uiGetText(UI.edit[2]))))
    end
    triggerServerEvent("update_item_data", localPlayer, unpack(EditPropertiesItem))
  elseif source == UI.label[3] then
    if isElement(EditPropertiesItem[1]) then
      setClipboard(tostring(getElementID(EditPropertiesItem[1]):gsub("M.E.O:", "")))
      exports.notifications:output({
        en = "Item ID cpoied",
        ar = "\216\170\217\133 \217\134\216\179\216\174 \216\167\217\132\217\133\216\185\216\177\217\129"
      }, 3500, "success")
    end
  elseif source == UI.label[4] then
    setClipboard(getElementPosition(unpack(EditPropertiesItem)) .. ", " .. getElementPosition(unpack(EditPropertiesItem)) .. ", " .. getElementPosition(unpack(EditPropertiesItem)))
    exports.notifications:output({
      en = "Item position cpoied",
      ar = "\216\170\217\133 \217\134\216\179\216\174 \216\167\217\132\216\167\216\173\216\175\216\167\216\171\217\138\216\167\216\170"
    }, 3500, "success")
  elseif source == UI.button.closeInventory then
    eui:uiSetVisible(UI.window.Inventory, false)
    showCursor(false)
    openedInventory = false
    var1 = false
  elseif source == UI.button["password:open"] then
    if temp_openInventory_parameters then
      if 5 < getDistanceBetweenPoints3D(getElementPosition(localPlayer)) then
        eui:uiSetVisible(UI.window.password, false)
        exports.notifications:output({
          en = "You are far",
          ar = "\216\163\217\134\216\170 \216\168\216\185\217\138\216\175"
        }, 3500, "error")
      elseif md5((eui:uiGetText(UI.edit.password))) == unpack(temp_openInventory_parameters) then
        eui:uiSetVisible(UI.window.password, false)
        openInventory(unpack(temp_openInventory_parameters))
        temp_openInventory_parameters = nil
      else
        exports.notifications:output({
          en = "Invalid password",
          ar = "\216\167\217\132\216\177\217\133\216\178 \216\174\216\167\216\183\216\166"
        }, 3500, "error")
      end
    end
  elseif source == UI.button["password:close"] then
    eui:uiSetVisible(UI.window.password, false)
    temp_openInventory_parameters = nil
  elseif source == UI.button["reset_password:reset"] then
    if temp_reset_pass_element and getElementData(temp_reset_pass_element, "item:data") then
      if ((getElementData(temp_reset_pass_element, "item:data").Properties.password or "") ~= "" or eui:uiGetText(UI.edit["reset_password:current"]) ~= (getElementData(temp_reset_pass_element, "item:data").Properties.password or "")) and md5((eui:uiGetText(UI.edit["reset_password:current"]))) ~= (getElementData(temp_reset_pass_element, "item:data").Properties.password or "") then
        exports.notifications:output({
          en = "The current password is incorrect",
          ar = "\217\131\217\132\217\133\216\169 \216\167\217\132\216\179\216\177 \216\167\217\132\216\173\216\167\217\132\217\138\216\169 \216\186\217\138\216\177 \216\181\216\173\217\138\216\173\216\169"
        }, 3500, "error")
        return
      end
      triggerServerEvent("inventory:change_password", localPlayer, temp_reset_pass_element, eui:uiGetText(UI.edit["reset_password:current"]), (eui:uiGetText(UI.edit["reset_password:new"])))
      eui:uiSetVisible(UI.window.reset_password, false)
      temp_reset_pass_element = nil
    end
  elseif source == UI.button["reset_password:close"] then
    eui:uiSetVisible(UI.window.reset_password, false)
    temp_reset_pass_element = nil
  end
end)
addEventHandler("onClientUIChanged", root, function()
  if source == UI.edit[1] then
    if tonumber((eui:uiGetText(source))) then
      if eui:uiGetText(UI.button[3]) == "Throw" then
        if not (tonumber((eui:uiGetText(source))) > 0) or not (tonumber((eui:uiGetText(source))) <= getPlayerMoney()) then
          eui:uiSetText(source, "")
        end
      elseif eui:uiGetText(UI.button[3]) == "Share" and not (tonumber((eui:uiGetText(source))) > 0) then
        eui:uiSetText(source, "")
      end
    else
      eui:uiSetText(source, "")
    end
  end
end)
addEvent("inventory:showShareAcceptance", true)
addEventHandler("inventory:showShareAcceptance", root, function(arg0, arg1)
  eui:uiSetVisible(UI.window[1], true)
  var0 = {arg0, arg1}
  if isElement(UI.image[1]) then
    destroyElement(UI.image[1])
  end
  UI.image[1] = eui:uiCreateImage(230, 30, 60, 60, getItemImageName(unpack(arg0)), UI.window[1])
  eui:uiSetText(UI.label[1], "Player ( ${color.primary}" .. tostring(getElementData(arg1, "character:name")) .. "" .. "#FFFFFF ) wants to\ngive you item\n${color.primary}\226\128\162 Item name \194\187 #FFFFFF" .. tostring(unpack(arg0).Name) .. "\n${color.primary}\226\128\162 Quantity \194\187 #FFFFFF" .. tostring(unpack(arg0)) .. "")
end)
addEventHandler("onClientUIDoubleClick", root, function()
  if not var0 then
    outputChatBox("Wait for response...", 255, 0, 0)
    return
  end
  if var1 then
    return
  end
  if not openedInventory then
    return
  end
  if string.find(openedInventory, "Vehicle:", 1, true) and isElement((getElementByID(openedInventory))) then
    if getVehicleType((getElementByID(openedInventory))) == "Automobile" or getVehicleType((getElementByID(openedInventory))) == "Plane" or getVehicleType((getElementByID(openedInventory))) == "Helicopter" or getVehicleType((getElementByID(openedInventory))) == "Trailer" or getVehicleType((getElementByID(openedInventory))) == "Monster Truck" then
      if isPedInVehicle(localPlayer) then
        if getPedOccupiedVehicle(localPlayer) ~= getElementByID(openedInventory) then
          return
        end
      elseif isVehicleLocked((getElementByID(openedInventory))) then
        exports.notifications:output({
          en = "The vehicle is locked",
          ar = "\216\167\217\132\217\133\216\177\217\131\216\168\216\169 \217\133\217\130\217\129\217\132\216\169"
        }, 3500, "error")
        return
      end
    elseif getVehicleType((getElementByID(openedInventory))) == "Bike" then
      if not isPedInVehicle(localPlayer) or getPedOccupiedVehicle(localPlayer) ~= getElementByID(openedInventory) then
        return
      end
      if not getVehicleEngineState((getElementByID(openedInventory))) then
        exports.notifications:output({
          en = "Vehicle engine not working",
          ar = "\217\133\216\173\216\177\217\131 \216\167\217\132\217\133\216\177\217\131\216\168\216\169 \217\132\216\167\217\138\216\185\217\133\217\132"
        }, 3500, "error")
        return
      end
    end
  end
  if source == UI.gridlist.Inventory1 then
    if eui:uiGridListGetSelectedItem(source) ~= -1 and eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1) then
      if eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1).ID == openedInventory then
        outputChatBox("You can't put the item inside itself.", 255, 0, 0)
        return
      end
      var0 = false
      exports.public:loading("inventory:transferItem", true)
      setTimer(triggerServerEvent, math.random(150, 500), 1, "inventory:transferItem", localPlayer, eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1).InventoryID, openedInventory, eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1), 1, openedInventory)
    end
  elseif source == UI.gridlist.Inventory2 and eui:uiGridListGetSelectedItem(source) ~= -1 and eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1) then
    if eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1).Type == "Hidden" and not exports.hud:getHudSetting("admintag") then
      return
    end
    var0 = false
    exports.public:loading("inventory:transferItem", true)
    setTimer(triggerServerEvent, math.random(150, 500), 1, "inventory:transferItem", localPlayer, openedInventory, "character:" .. getElementData(localPlayer, "character:id"), eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1), 1, openedInventory)
  end
end)
addEvent("inventory:transferItem:response", true)
addEventHandler("inventory:transferItem:response", localPlayer, function()
  var0 = true
  exports.public:loading("inventory:transferItem", false)
end)
function openInventory(arg0, arg1, arg2, arg3, arg4, arg5, arg6)
  if arg5 and not isElement(arg5) then
    return
  end
  if arg6 then
    eui:uiSetVisible(UI.window.password, true)
    temp_openInventory_parameters = {
      arg0,
      arg1,
      arg2,
      arg3,
      arg4,
      arg5,
      arg6
    }
    return
  end
  var0 = arg3
  var1 = arg5
  eui:uiSetVisible(UI.window.Inventory, arg1)
  showCursor(arg1)
  if arg1 then
    if not openedInventory then
      openedInventory = arg0
    end
  else
    openedInventory = false
    var2 = false
  end
  if arg1 then
    if arg4 then
      var2 = arg4
    end
    if var2 then
      eui:uiSetText(UI.label.InventorySize, tostring(var2.size) .. " / " .. tostring(var2.capacity))
    end
    eui:uiGridListClear(UI.gridlist.Inventory1)
    eui:uiGridListClear(UI.gridlist.Inventory2)
    if arg2 then
      triggerEvent("inventory:getInventoryItems:response", localPlayer, arg2)
    else
      triggerServerEvent("inventory:getInventoryItems", localPlayer, arg0)
    end
  end
end
addEvent("inventory:openInventory", true)
addEventHandler("inventory:openInventory", localPlayer, openInventory)
addEventHandler("onClientElementDestroy", root, function()
  if source == var0 then
    openInventory(openedInventory, false)
  end
end)
addEvent("inventory:getInventoryItems:response", true)
addEventHandler("inventory:getInventoryItems:response", root, function(arg0, arg1)
  if arg1 then
    var0 = arg1
  end
  eui:uiGridListClear(UI.gridlist.Inventory1)
  if getInventoryItems("character:" .. tostring(getElementData(localPlayer, "character:id"))) then
    for forvar7, forvar8 in ipairs((getInventoryItems("character:" .. tostring(getElementData(localPlayer, "character:id"))))) do
      if forvar8.SpecialProperties.isFactionDuty then
      end
      eui:uiGridListSetItemText(UI.gridlist.Inventory1, eui:uiGridListAddRow(UI.gridlist.Inventory1), 1, tostring(split(tostring(forvar8.Name), "\n")[1] .. " (D#" .. tostring(forvar8.SpecialProperties.isFactionDuty) .. ")"))
      eui:uiGridListSetItemText(UI.gridlist.Inventory1, eui:uiGridListAddRow(UI.gridlist.Inventory1), 2, tostring(forvar8.Quantity))
      eui:uiGridListSetItemData(UI.gridlist.Inventory1, eui:uiGridListAddRow(UI.gridlist.Inventory1), 1, forvar8)
    end
  end
  eui:uiGridListClear(UI.gridlist.Inventory2)
  for forvar7, forvar8 in ipairs(arg0) do
    if forvar8.SpecialProperties.isFactionDuty then
    end
    eui:uiGridListSetItemText(UI.gridlist.Inventory2, eui:uiGridListAddRow(UI.gridlist.Inventory2), 1, split(tostring(forvar8.Name), "\n")[1] .. " (D#" .. tostring(forvar8.SpecialProperties.isFactionDuty) .. ")")
    eui:uiGridListSetItemText(UI.gridlist.Inventory2, eui:uiGridListAddRow(UI.gridlist.Inventory2), 2, tostring(forvar8.Quantity))
    eui:uiGridListSetItemData(UI.gridlist.Inventory2, eui:uiGridListAddRow(UI.gridlist.Inventory2), 1, forvar8)
  end
  if var0 then
    eui:uiSetText(UI.label.InventorySize, tostring(#arg0) .. " / " .. tostring(var0.capacity))
  else
    eui:uiSetText(UI.label.InventorySize, tostring(#arg0))
  end
  var1 = true
end)
addEvent("onClientElementMenuShow", true)
addEventHandler("onClientElementMenuShow", root, function(arg0, arg1, arg2)
  if arg2 == "object" and arg1 <= 5 then
    if not isElement(arg0) then
      return
    end
    if getElementData(arg0, "item:data") and getElementData(arg0, "item:data").Properties.Capacity and getElementData(arg0, "item:data").Type ~= "SubInventory" and getElementData(arg0, "item:data").Name == "Safe" then
      exports.interaction:addInteractOption(arg0, {
        text = "Reset Password"
      })
    end
  end
end)
