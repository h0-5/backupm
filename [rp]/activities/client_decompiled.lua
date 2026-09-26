-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

addEvent("onClientActivityStart", false)
addEvent("onClientActivityStop", false)
addEvent("activities:join", true)
addEventHandler("activities:join", localPlayer, function(arg0, arg1, arg2, arg3)
  if not getElementData(localPlayer, "temp:activity") then
    return
  end
  exports.public:showTimer(arg0 .. ":start_count", true, arg2, true, true)
  if arg3.disable_player_damage then
    addEventHandler("onClientPlayerDamage", localPlayer, cancelPlayerDamage)
  end
  if arg3.disable_inventory then
    addEventHandler("onClientKey", root, cancelBinds)
  end
  if arg3.disable_explosions then
    addEventHandler("onClientExplosion", root, onClientExplosion)
  end
  eui:uiInfoListClear(UI.current_activity_info)
  exports["inventory-system"]:showInventory(false)
end)
addEvent("activities:current:sync", true)
addEventHandler("activities:current:sync", root, function(arg0, arg1)
  var0.max_players = arg0
  var0.players_count = arg1
  eui:uiSetVisible(UI.current_activity_info, true)
  refreshInfoList()
end)
addEvent("activities:quit", true)
addEventHandler("activities:quit", localPlayer, function(arg0, arg1)
  exports.public:showTimer(arg0 .. ":start_count", false)
  exports.public:showTimer(arg0 .. ":stop_count", false)
  removeEventHandler("onClientPlayerDamage", localPlayer, cancelPlayerDamage)
  removeEventHandler("onClientKey", root, cancelBinds)
  removeEventHandler("onClientExplosion", root, onClientExplosion)
  eui:uiSetVisible(UI.current_activity_info, false)
end)
addEvent("activities:start", true)
addEventHandler("activities:start", localPlayer, function(arg0, arg1, arg2)
  exports.public:showTimer(arg0 .. ":stop_count", true, arg2, true, true)
  triggerEvent("onClientActivityStart", localPlayer, arg0, arg1)
end)
addEvent("onClientPlayerJoinActivity", true)
addEventHandler("onClientPlayerJoinActivity", localPlayer, function(arg0, arg1)
end)
function cancelPlayerDamage()
  if getElementData(localPlayer, "temp:activity") then
    cancelEvent()
  end
end
function cancelBinds(arg0, arg1)
  if arg1 and var0[string.lower(arg0)] then
    cancelEvent()
  end
end
function onClientExplosion(arg0, arg1, arg2, arg3)
  cancelEvent()
end
activity_status_label = {
  pending = "Pending",
  waiting_players = "Waiting Participants",
  started = "Started",
  stopped = "Stopped"
}
activity_status_color = {
  pending = tocolor(255, 255, 0),
  waiting_players = tocolor(20, 255, 126),
  started = tocolor(0, 217, 255),
  stopped = tocolor(255, 0, 0)
}
UI = {
  window = {},
  label = {},
  button = {},
  gridlist = {},
  staticimage = {},
  image = {},
  memo = {},
  tabpanel = {},
  tab = {},
  edit = {},
  combobox = {},
  container = {},
  radiobutton = {}
}
function UIKitReady()
  eui = exports.UIKit
  var0 = eui:uiGetThemeColor("primary")
  var1 = eui:uiGetThemeColor("bg_default")
  var2 = eui:getUIFont("ui-default")
  var3 = eui:getUIFont("default-large")
  UI.window.activities = eui:uiCreateWindow(false, false, 800, 500, "Activities", _, ":assets/icons/flag.png")
  eui:uiWindowSetMovable(UI.window.activities, false)
  eui:uiSetVisible(UI.window.activities, false)
  eui:uiSetProperty(UI.window.activities, "close_button", true)
  UI.tabpanel.activities = eui:uiCreateTabPanel(10, 80, 800 - 20, 500 - 100, "", tocolor(0, 0, 0, 0), UI.window.activities)
  eui:uiSetProperty(UI.tabpanel.activities, "tabs_bar_color", tocolor(0, 0, 0, 100))
  eui:uiSetProperty(UI.tabpanel.activities, "tab_height", 45)
  UI.tab.current_activities = eui:uiCreateTab({
    en = "Current Activities",
    ar = "\216\167\217\132\216\163\217\134\216\180\216\183\216\169 \216\167\217\132\216\173\216\167\217\132\217\138\216\169"
  }, "", UI.tabpanel.activities)
  UI.gridlist.current_activities = eui:uiCreateGridList(5, 30, 800 - 30, 300, tocolor(15, 15, 15, 0), UI.tab.current_activities)
  eui:uiGridListAddColumn(UI.gridlist.current_activities, "Title", 0.3)
  eui:uiGridListAddColumn(UI.gridlist.current_activities, "Type", 0.15)
  eui:uiGridListAddColumn(UI.gridlist.current_activities, "", 0.1)
  eui:uiGridListAddColumn(UI.gridlist.current_activities, "Status", 0.25)
  eui:uiGridListAddColumn(UI.gridlist.current_activities, "Created By", 0.2)
  eui:uiSetAlign(UI.gridlist.current_activities, "left", "center")
  eui:uiSetProperty(UI.gridlist.current_activities, "row_height", 30)
  UI.button.join_activity = eui:uiCreateButton(800 - 20 - 205, 500 - 80 - 50, 200, 35, {en = "Join", ar = "\216\175\216\174\217\136\217\132"}, "primary", UI.tab.current_activities)
  UI.label.selected_activity_id = eui:uiCreateLabel(10, 500 - 80 - 50, 100, 35, "", tocolor(255, 255, 255, 80), "left", "center", UI.tab.current_activities)
  eui:uiSetFont(UI.label.selected_activity_id, "default-large")
  UI.window.create_activity = eui:uiCreateWindow(false, false, 500, 600, "Create Activity", _, ":assets/icons/flag.png")
  eui:uiWindowSetMovable(UI.window.create_activity, false)
  eui:uiSetVisible(UI.window.create_activity, false)
  eui:uiSetProperty(UI.window.create_activity, "close_button", true)
  UI.tabpanel.create_activity = eui:uiCreateTabPanel(10, 80, 500 - 20, 600 - 150, "", tocolor(0, 0, 0, 0), UI.window.create_activity)
  eui:uiSetProperty(UI.tabpanel.create_activity, "tabs_bar_color", tocolor(0, 0, 0, 100))
  eui:uiSetProperty(UI.tabpanel.create_activity, "tab_height", 45)
  UI.tab["create_activity:config"] = eui:uiCreateTab({en = "General", ar = "\216\185\216\167\217\133"}, "", UI.tabpanel.create_activity)
  UI.tab["create_activity:participate"] = eui:uiCreateTab({
    en = "Participate",
    ar = "\216\167\217\132\217\133\216\180\216\167\216\177\217\131\216\169"
  }, "", UI.tabpanel.create_activity)
  UI.gridlist.activities_select = eui:uiCreateGridList(5, 30, 500 - 35, 200, tocolor(0, 0, 0, 0), UI.tab["create_activity:config"])
  eui:uiGridListAddColumn(UI.gridlist.activities_select, "Select Activity", 0.8)
  eui:uiGridListAddColumn(UI.gridlist.activities_select, "Min. Players", 0.2)
  eui:uiSetAlign(UI.gridlist.activities_select, "left", "center")
  eui:uiSetProperty(UI.gridlist.activities_select, "row_height", 30)
  eui:uiCreateLabel(10, 240, 100, 20, {
    en = "Start Time",
    ar = "\217\136\217\130\216\170 \216\167\217\132\216\168\216\175\216\163"
  }, tocolor(255, 255, 255, 255), "left", "center", UI.tab["create_activity:config"])
  UI.container.start_time = eui:uiCreateContainer(15, 270, 500 - 40, 100, UI.tab["create_activity:config"])
  UI.radiobutton.start_time_1 = eui:uiCreateRadioButton(0, 0, 150, 25, "\216\168\216\185\216\175 5 \216\175\217\130\216\167\216\166\217\130", false, _, UI.container.start_time)
  UI.radiobutton.start_time_2 = eui:uiCreateRadioButton(0, 25, 150, 25, "\216\168\216\185\216\175 10 \216\175\217\130\216\167\216\166\217\130", false, _, UI.container.start_time)
  UI.radiobutton.start_time_3 = eui:uiCreateRadioButton(160, 0, 150, 25, "\216\168\216\185\216\175 20 \216\175\217\130\217\138\217\130\216\169", false, _, UI.container.start_time)
  UI.radiobutton.start_time_4 = eui:uiCreateRadioButton(160, 25, 150, 25, "\216\168\216\185\216\175 30 \216\175\217\130\217\138\217\130\216\169", false, _, UI.container.start_time)
  UI.radiobutton.start_time_5 = eui:uiCreateRadioButton(320, 0, 150, 25, "\216\168\216\185\216\175 \216\179\216\167\216\185\216\169", false, _, UI.container.start_time)
  UI.radiobutton.start_time_6 = eui:uiCreateRadioButton(320, 25, 150, 25, "\216\168\216\185\216\175 \216\179\216\167\216\185\216\170\217\138\217\134", false, _, UI.container.start_time)
  eui:uiCreateLabel(10, 360, 100, 20, {
    en = "Title",
    ar = "\216\167\217\132\216\185\217\134\217\136\216\167\217\134"
  }, tocolor(255, 255, 255, 255), "left", "center", UI.tab["create_activity:config"])
  UI.edit.create_activity_title = eui:uiCreateEdit(10, 390, 350, 30, "", "Activity Title", _, UI.tab["create_activity:config"])
  UI.container.activity_join_type = eui:uiCreateContainer(10, 40, 500 - 20, 100, UI.tab["create_activity:participate"])
  UI.radiobutton.activity_join_type_1 = eui:uiCreateRadioButton(0, 0, 276, 30, "\216\163\217\138 \216\180\216\174\216\181 \217\138\216\179\216\170\216\183\217\138\216\185 \216\167\217\132\216\175\216\174\217\136\217\132", false, _, UI.container.activity_join_type)
  UI.radiobutton.activity_join_type_2 = eui:uiCreateRadioButton(0, 40, 276, 30, "\216\167\217\132\216\175\216\174\217\136\217\132 \216\185\217\134 \216\183\216\177\217\138\217\130 \216\167\217\132\216\177\217\133\216\178 \217\129\217\130\216\183", false, _, UI.container.activity_join_type)
  UI.edit.activity_join_password = eui:uiCreateEdit(30, 110, 250, 35, "", "Join Password", _, UI.tab["create_activity:participate"])
  eui:uiSetFont(UI.edit.activity_join_password, "default-large")
  UI.button.create_activity = eui:uiCreateButton(10, 600 - 10 - 35, 500 - 20, 35, {
    en = "Create Activity",
    ar = "\216\165\217\134\216\180\216\167\216\161 \216\167\217\132\217\134\216\180\216\167\216\183"
  }, "primary", UI.window.create_activity)
  UI.window.activity_password = eui:uiCreateWindow(false, false, 250, 150, {
    en = "Join Activity",
    ar = "\216\175\216\174\217\136\217\132 \216\167\217\132\217\134\216\180\216\167\216\183"
  })
  eui:uiWindowSetMovable(UI.window.activity_password, false)
  eui:uiSetVisible(UI.window.activity_password, false)
  eui:uiSetProperty(UI.window.activity_password, "close_button", true)
  UI.edit.activity_password = eui:uiCreateEdit(10, 50, 230, 30, "", {
    en = "Join Password",
    ar = "\216\177\217\133\216\178 \216\167\217\132\216\175\216\174\217\136\217\132"
  }, _, UI.window.activity_password)
  UI.button.submit_activity_password = eui:uiCreateButton(5, 110, 240, 35, {en = "Join", ar = "\216\175\216\174\217\136\217\132"}, "primary", UI.window.activity_password)
  UI.current_activity_info = eui:uiCreateInfoList(20, eui:uiGetReferenceScreenSize() - 500, 100, 30, tocolor(0, 0, 0, 255))
  eui:uiSetVisible(UI.current_activity_info, false)
end
addEventHandler("onClientUIReady", resourceRoot, UIKitReady)
addEventHandler("onClientUIKitReady", root, UIKitReady)
function setCurrentActivityInfo(arg0, arg1, arg2)
  for forvar8, forvar9 in ipairs((eui:uiInfoListGetRows(UI.current_activity_info))) do
    if forvar9.id == arg0 then
      eui:uiInfoListGetRows(UI.current_activity_info)[forvar8].text = arg1
      eui:uiInfoListGetRows(UI.current_activity_info)[forvar8].icon = arg2
      break
    end
  end
  if not true then
    table.insert(eui:uiInfoListGetRows(UI.current_activity_info), {
      id = arg0,
      text = arg1,
      icon = arg2
    })
  end
  eui:uiInfoListSetRows(UI.current_activity_info, (eui:uiInfoListGetRows(UI.current_activity_info)))
end
function refreshInfoList()
  setCurrentActivityInfo("players", var0.players_count .. " / " .. var0.max_players, ":main-menu/icons/friends.png")
end
function refreshActivitiesList(arg0)
  eui:uiGridListClear(UI.gridlist.activities_select)
  for forvar4, forvar5 in pairs(arg0) do
    eui:uiGridListSetItemData(UI.gridlist.activities_select, eui:uiGridListAddRow(UI.gridlist.activities_select), 1, forvar4)
    eui:uiGridListSetItemText(UI.gridlist.activities_select, eui:uiGridListAddRow(UI.gridlist.activities_select), 1, tostring(forvar5.label))
    eui:uiGridListSetItemText(UI.gridlist.activities_select, eui:uiGridListAddRow(UI.gridlist.activities_select), 2, tostring(forvar5.min_players))
  end
end
function refreshCurrentActivitiesList(arg0)
  eui:uiSetText(UI.label.selected_activity_id, "")
  eui:uiGridListClear(UI.gridlist.current_activities)
  for forvar4, forvar5 in ipairs(arg0) do
    eui:uiGridListSetItemData(UI.gridlist.current_activities, eui:uiGridListAddRow(UI.gridlist.current_activities), 1, forvar5.code)
    eui:uiGridListSetItemData(UI.gridlist.current_activities, eui:uiGridListAddRow(UI.gridlist.current_activities), 2, forvar5.join_type)
    eui:uiGridListSetItemData(UI.gridlist.current_activities, eui:uiGridListAddRow(UI.gridlist.current_activities), 3, forvar5.status)
    eui:uiGridListSetItemText(UI.gridlist.current_activities, eui:uiGridListAddRow(UI.gridlist.current_activities), 1, tostring(forvar5.title))
    eui:uiGridListSetItemText(UI.gridlist.current_activities, eui:uiGridListAddRow(UI.gridlist.current_activities), 2, tostring(forvar5.name))
    eui:uiGridListSetItemText(UI.gridlist.current_activities, eui:uiGridListAddRow(UI.gridlist.current_activities), 3, tostring(forvar5.current_players_count) .. " / " .. tostring(forvar5.max_players))
    if forvar5.status == "pending" then
      eui:uiGridListSetItemText(UI.gridlist.current_activities, eui:uiGridListAddRow(UI.gridlist.current_activities), 4, tostring(activity_status_label[forvar5.status]) .. " - " .. tostring(forvar5.start_after))
    else
      eui:uiGridListSetItemText(UI.gridlist.current_activities, eui:uiGridListAddRow(UI.gridlist.current_activities), 4, tostring(activity_status_label[forvar5.status]))
    end
    if activity_status_color[forvar5.status] then
      eui:uiGridListSetItemColor(UI.gridlist.current_activities, eui:uiGridListAddRow(UI.gridlist.current_activities), 4, activity_status_color[forvar5.status])
    end
    eui:uiGridListSetItemText(UI.gridlist.current_activities, eui:uiGridListAddRow(UI.gridlist.current_activities), 5, tostring(forvar5.creator))
  end
end
addEvent("activities:get_list:response", true)
addEventHandler("activities:get_list:response", root, function(arg0, arg1)
  refreshCurrentActivitiesList(arg0)
  appRefreshCurrentActivitiesList(arg0)
  exports.public:loading("activities:get_list", false)
end)
addEvent("activities:create:open_window", true)
addEventHandler("activities:create:open_window", root, function(arg0)
  eui:uiSetVisible(UI.window.create_activity, true)
  showCursor(true)
  refreshActivitiesList(arg0)
end)
addEventHandler("onClientUIVisibilityChange", root, function(arg0)
  if (source == UI.window.activities or source == UI.window.create_activity) and not arg0 then
    showCursor(false)
  end
end)
function closeUIWindows(arg0)
  eui:uiSetVisible(UI.window.activities, false)
  showCursor(false)
end
addEvent("onClientPlayerQuitFromCharacter", true)
addEventHandler("onClientPlayerQuitFromCharacter", localPlayer, closeUIWindows)
addEventHandler("onClientPlayerWasted", localPlayer, closeUIWindows)
addEventHandler("onClientUIClick", root, function()
  if source == UI.button.join_activity then
    if eui:uiGridListGetSelectedItem(UI.gridlist.current_activities) ~= -1 then
      if eui:uiGridListGetItemData(UI.gridlist.current_activities, eui:uiGridListGetSelectedItem(UI.gridlist.current_activities), 2) == 2 then
        activity_id_to_join = eui:uiGridListGetItemData(UI.gridlist.current_activities, eui:uiGridListGetSelectedItem(UI.gridlist.current_activities), 1)
        eui:uiSetVisible(UI.window.activity_password, true)
        return
      end
      triggerServerEvent("activities:join_activity", localPlayer, (eui:uiGridListGetItemData(UI.gridlist.current_activities, eui:uiGridListGetSelectedItem(UI.gridlist.current_activities), 1)))
      eui:uiSetVisible(UI.window.activities, false)
      showCursor(false)
    end
  elseif source == UI.button.submit_activity_password then
    if not activity_id_to_join then
      return
    end
    eui:uiSetVisible(UI.window.activity_password, false)
    triggerServerEvent("activities:join_activity", localPlayer, activity_id_to_join, (eui:uiGetText(UI.edit.activity_password)))
    eui:uiSetVisible(UI.window.activities, false)
    showCursor(false)
    activity_id_to_join = nil
    eui:uiSetText(UI.edit.activity_password, "")
  elseif source == UI.gridlist.current_activities then
    if eui:uiGridListGetSelectedItem(UI.gridlist.current_activities) ~= -1 then
      eui:uiSetText(UI.label.selected_activity_id, "#" .. tostring((eui:uiGridListGetItemData(UI.gridlist.current_activities, eui:uiGridListGetSelectedItem(UI.gridlist.current_activities), 1))))
    else
      eui:uiSetText(UI.label.selected_activity_id, "")
    end
  elseif source == UI.button.create_activity then
    if eui:uiGridListGetSelectedItem(UI.gridlist.activities_select) ~= -1 then
      if var0 then
        return
      end
      for forvar6 = 1, 6 do
        if eui:uiRadioButtonGetSelected(UI.radiobutton["start_time_" .. forvar6]) then
        end
      end
      if not forvar6 then
        exports.notifications:output({
          en = "Please select start time",
          ar = "\217\138\216\177\216\172\217\137 \216\167\216\174\216\170\217\138\216\167\216\177 \217\136\217\130\216\170 \216\167\217\132\216\168\216\175\216\163"
        }, 4000, "error")
        return
      end
      for forvar7 = 1, 2 do
        if eui:uiRadioButtonGetSelected(UI.radiobutton["activity_join_type_" .. forvar7]) then
        end
      end
      if not forvar7 then
        exports.notifications:output({
          en = "Please select join type",
          ar = "\217\138\216\177\216\172\217\137 \216\167\216\174\216\170\217\138\216\167\216\177 \217\134\217\136\216\185 \216\167\217\132\217\133\216\180\216\167\216\177\217\131\216\169"
        }, 4000, "error")
        return
      end
      if utf8.len((eui:uiGetText(UI.edit.create_activity_title))) > 50 then
        exports.notifications:output({
          en = "Title too long",
          ar = "\216\167\217\132\216\185\217\134\217\136\216\167\217\134 \216\183\217\136\217\138\217\132"
        }, 4000, "error")
        return
      end
      var0 = true
      exports.public:loading("activities:create", true)
      triggerServerEvent("activities:create", localPlayer, eui:uiGridListGetItemData(UI.gridlist.activities_select, eui:uiGridListGetSelectedItem(UI.gridlist.activities_select), 1), eui:uiGetText(UI.edit.create_activity_title), forvar6, forvar7, (eui:uiGetText(UI.edit.activity_join_password)))
    else
      exports.notifications:output({
        en = "Please select activity type",
        ar = "\217\138\216\177\216\172\217\137 \216\167\216\174\216\170\217\138\216\167\216\177 \217\134\217\136\216\185 \216\167\217\132\217\134\216\180\216\167\216\183"
      }, 4000, "error")
    end
  end
end)
addEvent("activities:create:callback", true)
addEventHandler("activities:create:callback", root, function(arg0)
  var0 = false
  exports.public:loading("activities:create", false)
  if arg0 then
    eui:uiSetVisible(UI.window.create_activity, false)
  end
end)
addEvent("onClientElementMenuShow", true)
addEventHandler("onClientElementMenuShow", root, function(arg0, arg1, arg2)
  if arg2 == "ped" and arg1 <= 5 then
    if not isElement(arg0) then
      return
    end
    if getElementData(arg0, "ped:interact") == "activities" then
      exports.interaction:addInteractOption(arg0, {
        text = "Create Activity"
      })
    end
  end
end)
addEvent("onClientElementMenuClick", true)
addEventHandler("onClientElementMenuClick", root, function(arg0, arg1, arg2)
  if not isElement(arg0) then
    return
  end
  if getElementType(arg0) == "ped" and getElementData(arg0, "ped:interact") == "activities" and arg1 == "Talk" then
    eui:uiSetVisible(UI.window.activities, true)
    showCursor(true)
    triggerServerEvent("activities:get_list", localPlayer)
    exports.public:loading("activities:get_list", true)
  end
end)
function render_winners()
  dxDrawRoundedRectangle(15 * var0, 400 * var0, 250 * var0, (80 + #var1.winners * 50 + 20) * var0, var2, 15, true)
  dxDrawText("ACTIVITY WINNERS", 15 * var0 + 15 * var0, 400 * var0 + 10 * var0, 15 * var0 + 250 * var0, 400 * var0 + 35 * var0, tocolor(255, 255, 255, 200), 1, var3, "left", "top", true, true, true, true, false)
  dxDrawText(tostring(var1.title), 15 * var0 + 15 * var0, 400 * var0 + 35 * var0, 15 * var0 + 250 * var0, 400 * var0 + 55 * var0, var4, 1, var5, "left", "top", true, true, true, true, false)
  for forvar9 = 1, #var1.winners do
    dxDrawImage(15 * var0 + 15 * var0, 400 * var0 + 80 * var0, 40 * var0, 40 * var0, "images/rank_" .. forvar9 .. ".png", 0, 0, 0, tocolor(255, 255, 255, 200), true)
    dxDrawText(tostring(var1.winners[forvar9].name), 15 * var0 + 65 * var0, 400 * var0 + 80 * var0, 15 * var0 + 250 * var0, 400 * var0 + 80 * var0 + 40 * var0, tocolor(255, 255, 255), 1, var5, "left", "center", true, true, true, true, false)
  end
end
addEvent("activities:show_winners", true)
addEventHandler("activities:show_winners", localPlayer, function(arg0, arg1)
  var0.title = arg0
  var0.winners = arg1
  if not var0.status then
    addEventHandler("onClientRender", root, render_winners, true, "low-1")
  end
  var0.status = true
  setTimer(function()
    var0.status = false
    removeEventHandler("onClientRender", root, render_winners)
  end, 30000, 1)
  playSound(":assets/sounds/winner.mp3")
end)
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
