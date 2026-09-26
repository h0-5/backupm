-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

addEvent("phone:app:request", true)
addEventHandler("phone:app:request", localPlayer, function(arg0, arg1, arg2, arg3, arg4, arg5)
  if arg0 == "activities" then
    if not isElement(UI.gridlist["app:activities"]) then
      eui:uiSetFont(eui:uiCreateLabel(arg2 + 15, arg3 + 10, 200, 20, {
        en = "Activities",
        ar = "\216\167\217\132\216\163\217\134\216\180\216\183\216\169"
      }, tocolor(255, 255, 255, 255), "left", "top", arg1), "default-large")
      UI.gridlist["app:activities"] = eui:uiCreateGridList(arg2, arg3 + 50, arg4, arg5 - 100, tocolor(0, 0, 0, 0), arg1)
      eui:uiGridListAddColumn(UI.gridlist["app:activities"], "Name", 0.8)
      eui:uiGridListAddColumn(UI.gridlist["app:activities"], "", 0.2)
      eui:uiSetProperty(UI.gridlist["app:activities"], "row_height", 50)
      eui:uiSetProperty(UI.gridlist["app:activities"], "color_coded", true)
      UI["app:loading"] = eui:uiCreateLoading(arg2 + (arg4 - 32) / 2, arg3 + (arg5 - 32) / 2, 32, 32, tocolor(255, 255, 255), arg1)
      eui:uiSetVisible(UI["app:loading"], false)
    end
    eui:uiSetVisible(UI["app:loading"], true)
    triggerServerEvent("activities:get_list", localPlayer)
  end
end)
function appRefreshCurrentActivitiesList(arg0)
  if not isElement(UI.gridlist["app:activities"]) then
    return
  end
  eui:uiGridListClear(UI.gridlist["app:activities"])
  for forvar4, forvar5 in ipairs(arg0) do
    if forvar5.status == "pending" then
      eui:uiGridListSetItemText(UI.gridlist["app:activities"], eui:uiGridListAddRow(UI.gridlist["app:activities"]), 1, tostring(forvar5.title) .. [[

#a3a3a3]] .. tostring(activity_status_label[forvar5.status]) .. " - " .. tostring(forvar5.start_after))
    else
      eui:uiGridListSetItemText(UI.gridlist["app:activities"], eui:uiGridListAddRow(UI.gridlist["app:activities"]), 1, tostring(forvar5.title) .. [[

#a3a3a3]] .. tostring(activity_status_label[forvar5.status]))
    end
    eui:uiGridListSetItemText(UI.gridlist["app:activities"], eui:uiGridListAddRow(UI.gridlist["app:activities"]), 2, tostring(forvar5.current_players_count) .. " / " .. tostring(forvar5.max_players))
  end
  eui:uiSetVisible(UI["app:loading"], false)
end
