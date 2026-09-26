-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

UI = {
  window = {},
  label = {},
  button = {},
  gridlist = {},
  box = {},
  drag_point = {},
  gun_structure = {},
  gun_part = {},
  gun_part_drag = {},
  container = {},
  rectangle = {},
  image = {}
}
function UIKitReady()
  eui = exports.UIKit
  UI.window[1] = eui:uiCreateWindow(false, false, 350, 450, {
    en = "Factory",
    ar = "\216\167\217\132\217\133\216\181\217\134\216\185"
  })
  eui:uiSetVisible(UI.window[1], false)
  eui:uiWindowSetMovable(UI.window[1], false)
  UI.button[1] = eui:uiCreateButton(5, 410, 340, 35, {en = "Cancel", ar = "\216\165\217\132\216\186\216\167\216\161"}, _, UI.window[1])
  eui:uiSetProperty(UI.button[1], "HoverTextColor", tocolor(255, 48, 48))
  UI.gridlist[1] = eui:uiCreateGridList(5, 50, 340, 300, tocolor(10, 10, 10, 0), UI.window[1])
  eui:uiGridListAddColumn(UI.gridlist[1], "", 1)
  eui:uiSetAlign(UI.gridlist[1], "left", "center")
  eui:uiSetProperty(UI.gridlist[1], "row_height", 30)
  UI.window[2] = eui:uiCreateWindow(false, false, 900, 500, "Gun Factory / Assembling")
  eui:uiSetVisible(UI.window[2], false)
  eui:uiWindowSetMovable(UI.window[2], false)
  UI.button.cancel_craft = eui:uiCreateButton(480, 450, 200, 40, {en = "Cancel", ar = "\216\165\217\132\216\186\216\167\216\161"}, _, UI.window[2])
  eui:uiSetClickAction(UI.button.cancel_craft, "hide_ui", UI.window[2])
  UI.button.craft = eui:uiCreateButton(690, 450, 200, 40, {en = "Craft", ar = "\216\181\217\134\216\185"}, "primary", UI.window[2])
  eui:uiSetProperty(UI.button.craft, "HoverGlow", true)
  UI.container.gun = eui:uiCreateContainer(var0 + 30, 50, 704, 353, UI.window[2])
  UI.image.gun_structure = eui:uiCreateImage(0, 0, 704, 353, "images/ak-47.png", UI.container.gun)
  UI.rectangle.gun_parts_list = eui:uiCreateRectangle(10, 40, var0 + 10, 450, tocolor(0, 0, 0, 200), true, true, true, true, UI.window[2])
end
addEventHandler("onClientUIReady", resourceRoot, UIKitReady)
addEvent("onClientUIKitReady", true)
addEventHandler("onClientUIKitReady", root, UIKitReady)
addEventHandler("onClientUIVisibilityChange", root, function(arg0)
  if source == UI.window[2] and not arg0 then
    showCursor(false)
  end
end)
addEventHandler("onClientUIClick", root, function()
  if source == UI.button[1] then
    eui:uiSetVisible(UI.window[1], false)
    showCursor(false)
  elseif source == UI.button.craft and current_assembling_details_index then
    if waiting_assembling_callback then
      return
    end
    for forvar4, forvar5 in pairs(UI.gun_part) do
      if not eui:uiGetVisible(forvar5) then
        exports.notifications:output({
          en = "Weapon assembly is incomplete",
          ar = "\216\170\216\172\217\133\217\138\216\185 \216\167\217\132\216\179\217\132\216\167\216\173 \216\186\217\138\216\177 \217\133\217\131\216\170\217\133\217\132"
        }, 5000, "error")
        return
      end
    end
    waiting_assembling_callback = true
    exports.public:loading("factory:assembling", true)
    triggerServerEvent("factory:assembling", localPlayer, current_assembling_details_index)
  end
end)
addEvent("factory:assembling:callback", true)
addEventHandler("factory:assembling:callback", localPlayer, function(arg0)
  if arg0 then
    eui:uiSetVisible(UI.window[2], false)
    showCursor(false)
  end
  exports.public:loading("factory:assembling", false)
  waiting_assembling_callback = nil
end)
addEventHandler("onClientUIStartClick", root, function()
  if var0[source] then
    eui:uiDragElement(var0[source])
  end
end)
addEventHandler("onClientUIDragEnd", root, function(arg0)
  if var0[source] and var1[arg0] and var1[arg0] == UI.gun_part[var0[source]] then
    eui:uiSetVisible(source, false)
    eui:uiSetVisible(UI.gun_part[var0[source]], true)
  end
end)
addEventHandler("onClientUIDoubleClick", root, function()
  if source == UI.gridlist[1] and eui:uiGridListGetSelectedItem(UI.gridlist[1]) ~= -1 then
    eui:uiSetVisible(UI.window[1], false)
    showCursor(false)
    if eui:uiGridListGetItemData(UI.gridlist[1], eui:uiGridListGetSelectedItem(UI.gridlist[1]), 1) == "crafting" then
      triggerServerEvent("factory:crafting", localPlayer, eui:uiGridListGetSelectedItem(UI.gridlist[1]) + 1, factory.currentMarker)
    else
      showAssembling(factory.assembly_items[eui:uiGridListGetSelectedItem(UI.gridlist[1]) + 1], eui:uiGridListGetSelectedItem(UI.gridlist[1]) + 1)
    end
    eui:uiGridListSetSelectedItem(UI.gridlist[1], -1)
  end
end)
function showAssembling(arg0, arg1)
  current_assembling_details = arg0
  current_assembling_details_index = arg1
  eui:uiSetText(UI.window[2], "Gun Factory / Assembling / " .. tostring(arg0.title))
  eui:uiStaticImageLoadImage(UI.image.gun_structure, "images/" .. arg0.item.Name .. "/" .. arg0.item.Name .. ".png")
  for forvar5, forvar6 in pairs(UI.gun_part) do
    destroyElement(forvar6)
  end
  for forvar5, forvar6 in ipairs(getElementChildren(UI.rectangle.gun_parts_list)) do
    destroyElement(forvar6)
  end
  for forvar5, forvar6 in pairs(UI.drag_point) do
    destroyElement(forvar6)
  end
  UI.gun_part = {}
  UI.gun_part_drag = {}
  var0 = {}
  UI.drag_point = {}
  var1 = {}
  for forvar5, forvar6 in ipairs(arg0.parts) do
    UI.gun_part[forvar6.code] = eui:uiCreateImage(0, 0, 704, 353, "images/" .. arg0.item.Name .. "/" .. forvar6.code .. ".png", UI.container.gun)
    eui:uiSetVisible(UI.gun_part[forvar6.code], false)
  end
  for forvar6, forvar7 in ipairs(arg0.parts) do
    eui:uiCreateRectangle(5, 5, var2, var3, "bg_default", true, true, true, true, UI.rectangle.gun_parts_list)
    UI.gun_part_drag[forvar7.code] = eui:uiCreateImage(5, 5, var2, var3, "images/" .. arg0.item.Name .. "/" .. forvar7.code .. ".png", UI.rectangle.gun_parts_list)
    if exports["inventory-system"]:playerHasItem(forvar7.item_name) then
      eui:uiSetProperty(UI.gun_part_drag[forvar7.code], "draggable", true)
      var0[UI.gun_part_drag[forvar7.code]] = forvar7.code
    else
      eui:uiSetColor(UI.gun_part_drag[forvar7.code], 255, 0, 0, 180)
    end
  end
  for forvar6, forvar7 in ipairs(arg0.parts) do
    UI.drag_point[forvar7.code] = eui:uiCreateRectangle(unpack(forvar7.offset))
    var1[UI.drag_point[forvar7.code]] = UI.gun_part[forvar7.code]
  end
  eui:uiSetVisible(UI.window[2], true)
  showCursor(true)
end
addEventHandler("onClientMarkerLeave", resourceRoot, function(arg0, arg1)
  if arg0 ~= localPlayer then
    return
  end
  if getElementData(source, "factory:crafting") then
    exports["inventory-system"]:hideCrafting()
    eui:uiSetVisible(UI.window[1], false)
    showCursor(false)
    factory.currentMarker = nil
  end
end)
addEvent("factory:showSelection", true)
addEventHandler("factory:showSelection", root, function(arg0, arg1)
  eui:uiSetVisible(UI.window[1], true)
  showCursor(true)
  factory.currentMarker = arg0
  eui:uiGridListClear(UI.gridlist[1])
  if arg1 == "crafting" then
    for forvar5, forvar6 in ipairs(factory.craft_items) do
      eui:uiGridListSetItemText(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 1, forvar6.title)
      eui:uiGridListSetItemData(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 1, arg1)
    end
  elseif arg1 == "assembling" then
    for forvar5, forvar6 in ipairs(factory.assembly_items) do
      eui:uiGridListSetItemText(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 1, forvar6.title)
      eui:uiGridListSetItemData(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 1, arg1)
    end
  end
end)
addEvent("onClientElementMenuClick", true)
addEventHandler("onClientElementMenuClick", root, function(arg0, arg1, arg2)
  if not isElement(arg0) then
    return
  end
  if getElementType(arg0) == "ped" and getElementData(arg0, "ped:interact") == "job.gunsmith" and arg1 == "Talk" then
    exports["job-system"]:showTakeJob("Gunsmith", {
      en = "Gunsmith",
      ar = "\216\181\216\167\217\134\216\185 \216\163\216\179\217\132\216\173\216\169"
    }, {
      en = [[
You can not take this job if you are on duty

You will be able to craft guns and bombs inside the factory]],
      ar = "\n\217\132\216\167\216\170\216\179\216\170\216\183\217\138\216\185 \216\163\216\174\216\176 \216\167\217\132\217\136\216\184\217\138\217\129\216\169 \216\165\216\176\216\167 \217\131\217\134\216\170 \216\175\216\167\216\174\217\132 \216\167\217\132\216\174\216\175\217\133\216\169\n\n\216\179\217\136\217\129 \216\170\216\170\217\133\217\131\217\134 \217\133\217\134 \216\181\217\134\216\185 \216\167\217\132\216\163\216\179\217\132\216\173\216\169 \217\136\216\167\217\132\217\133\216\170\217\129\216\172\216\177\216\167\216\170 \216\168\216\175\216\167\216\174\217\132 \216\167\217\132\217\133\216\181\217\134\216\185"
    })
  end
end)
addEvent("onClientRequestTakeJob", true)
addEventHandler("onClientRequestTakeJob", localPlayer, function(arg0)
  if arg0 == "Gunsmith" then
    if getElementData(localPlayer, "duty:data") and getElementData(localPlayer, "duty:data").Status then
      outputChatBox("(( You must be off duty to take this job. ))", 255, 46, 46)
      return
    end
    exports["job-system"]:takeJob(arg0)
  end
end)
