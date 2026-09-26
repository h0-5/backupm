-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

addEvent("onClientPlayerStartJob", true)
addEventHandler("onClientPlayerStartJob", localPlayer, function(arg0)
end)
addEvent("onClientPlayerQuitJob", true)
addEventHandler("onClientPlayerQuitJob", localPlayer, function(arg0)
  if isPedInVehicle(localPlayer) and getElementData(getPedOccupiedVehicle(localPlayer), "vehicle:owner.name") and string.find(getElementData(getPedOccupiedVehicle(localPlayer), "vehicle:owner.name"), "job:", 1, true) and isVehicleLocked((getPedOccupiedVehicle(localPlayer))) then
    setPedExitVehicle(localPlayer)
  end
  if isElement(UI.label.job_current) then
    eui:uiSetText(UI.label.job_current, {
      en = "Not currently employed",
      ar = "\216\186\217\138\216\177 \217\133\217\136\216\184\217\129 \216\173\216\167\217\132\217\138\216\167\217\139"
    })
    eui:uiSetVisible(UI.button.start_job, false)
    eui:uiSetVisible(UI.button.quit_job, false)
  end
end)
addCommandHandler("jobhelp", function(arg0)
  if getElementData(localPlayer, "job") then
    triggerEvent("onClientShowJobHelp", localPlayer, (getElementData(localPlayer, "job")))
  end
end, false, false)
addEvent("onClientShowJobHelp", true)
addEventHandler("onClientShowJobHelp", localPlayer, function(arg0)
end)
function giveJobSalary(arg0, arg1)
  if arg0 and arg1 then
    exports.security:triggerServerEvent("jobs:giveJobSalary", localPlayer, localPlayer, arg0, arg1)
  end
end
function givePlayerJobEXP(arg0, arg1)
  if arg0 and arg1 then
    exports.security:triggerServerEvent("jobs:givePlayerJobEXP", localPlayer, arg0, arg1)
  end
end
UIM = {
  window = {},
  label = {},
  button = {},
  gridlist = {}
}
function UIKitReady()
  eui = exports.UIKit
  UIM.window[1] = eui:uiCreateWindow(false, false, 500, 450, {
    en = "Jobs",
    ar = "\216\167\217\132\217\136\216\184\216\167\216\166\217\129"
  }, _, ":assets/icons/suitcase.png")
  eui:uiSetVisible(UIM.window[1], false)
  eui:uiWindowSetMovable(UIM.window[1], false)
  UIM.button[1] = eui:uiCreateButton(10, 360, 480, 35, {
    en = "Take Job",
    ar = "\216\163\216\174\216\176 \216\167\217\132\217\136\216\184\217\138\217\129\216\169"
  }, "primary", UIM.window[1])
  UIM.button[2] = eui:uiCreateButton(10, 405, 480, 35, {en = "Cancel", ar = "\216\165\217\132\216\186\216\167\216\161"}, _, UIM.window[1])
  UIM.gridlist[1] = eui:uiCreateGridList(5, 50, 490, 300, tocolor(10, 10, 10, 0), UIM.window[1])
  eui:uiGridListAddColumn(UIM.gridlist[1], "Job name", 0.7)
  eui:uiGridListAddColumn(UIM.gridlist[1], "Required Level", 0.3)
  eui:uiSetProperty(UIM.gridlist[1], "row_height", 25)
  UIM.window[2] = eui:uiCreateWindow(false, false, 450, 400, {
    en = "Job Name",
    ar = "\216\167\216\179\217\133 \216\167\217\132\217\136\216\184\217\138\217\129\216\169"
  })
  eui:uiSetVisible(UIM.window[2], false)
  eui:uiWindowSetMovable(UIM.window[2], false)
  UIM.label.job_requirements = eui:uiCreateLabel(15, 40, 420, 60, {
    en = "\226\128\162${color.primary}  Minimum Required Level:  #ffffff10\n\226\128\162${color.primary}  Require vehicles license #ffffff\n\226\128\162${color.primary}  Minimum Salary:  #00ff00$100\n\t",
    ar = "\226\128\162${color.primary}  \216\163\216\175\217\134\217\137 \217\133\216\179\216\170\217\136\217\137 \217\133\216\183\217\132\217\136\216\168:  #ffffff10\n\226\128\162${color.primary}  \217\138\216\170\216\183\217\132\216\168 \216\177\216\174\216\181\216\169 \217\130\217\138\216\167\216\175\216\169 #ffffff\n\226\128\162${color.primary}  \216\163\216\175\217\134\217\137 \216\177\216\167\216\170\216\168:  #00ff00$100\n\t"
  }, tocolor(255, 255, 255, 255), "left", "top", UIM.window[2])
  eui:uiCreateRectangle(15, 110, 420, 1, tocolor(255, 255, 255, 20), false, false, false, false, UIM.window[2])
  eui:uiCreateRectangle(15, 290, 420, 1, tocolor(255, 255, 255, 20), false, false, false, false, UIM.window[2])
  UIM.label.job_description = eui:uiCreateLabel(0, 110, 450, 170, {
    en = "Job Description",
    ar = "\217\136\216\181\217\129 \216\167\217\132\217\136\216\184\217\138\217\129\216\169"
  }, tocolor(255, 255, 255, 255), "center", "center", UIM.window[2])
  UIM.button[3] = eui:uiCreateButton(10, 310, 430, 35, {
    en = "Take Job",
    ar = "\216\163\216\174\216\176 \216\167\217\132\217\136\216\184\217\138\217\129\216\169"
  }, "primary", UIM.window[2])
  UIM.button[4] = eui:uiCreateButton(10, 355, 430, 35, {en = "Cancel", ar = "\216\165\217\132\216\186\216\167\216\161"}, _, UIM.window[2])
  eui:uiSetProperty(UIM.button[4], "HoverTextColor", tocolor(255, 48, 48))
end
addEventHandler("onClientUIReady", resourceRoot, UIKitReady)
addEvent("onClientUIKitReady", true)
addEventHandler("onClientUIKitReady", root, UIKitReady)
addEvent("onClientElementMenuClick", true)
addEventHandler("onClientElementMenuClick", root, function(arg0, arg1, arg2)
  if not isElement(arg0) then
    return
  end
  if getElementType(arg0) == "ped" and getElementData(arg0, "ped:interact") == "jobs" and arg1 == "Talk" then
    eui:uiSetVisible(UIM.window[1], true)
    showCursor(true)
    requestJobs()
    exports.public:loading("jobs:get", true)
  end
end)
function requestJobs()
  triggerServerEvent("jobs:get", localPlayer, md5(toJSON(var0.jobs_list)))
end
addEvent("jobs:get:response", true)
addEventHandler("jobs:get:response", localPlayer, function(arg0, arg1)
  if not arg0 then
    arg0 = var0.jobs_list
    arg1 = var0.jobs_data
  else
    var0.jobs_list = arg0
    var0.jobs_data = arg1
  end
  exports.public:loading("jobs:get", false)
  table.sort(arg0, function(arg0, arg1)
    return var0[arg0] and var0[arg1] and var0[arg0].requirements.min_level < var0[arg1].requirements.min_level
  end)
  eui:uiGridListClear(UIM.gridlist[1])
  for forvar6, forvar7 in ipairs(arg0) do
    if arg1[forvar7].jobs_center then
      eui:uiGridListSetItemData(UIM.gridlist[1], eui:uiGridListAddRow(UIM.gridlist[1]), 1, tostring(arg1[forvar7].name))
      eui:uiGridListSetItemText(UIM.gridlist[1], eui:uiGridListAddRow(UIM.gridlist[1]), 1, arg1[forvar7].label and tostring(arg1[forvar7].label) or tostring(arg1[forvar7].label))
      eui:uiGridListSetItemText(UIM.gridlist[1], eui:uiGridListAddRow(UIM.gridlist[1]), 2, tostring(arg1[forvar7].requirements.min_level))
      eui:uiGridListSetItemData(UIM.gridlist[1], eui:uiGridListAddRow(UIM.gridlist[1]), 2, arg1[forvar7])
      if exports["level-system"]:getPlayerLevel() >= tonumber(arg1[forvar7].requirements.min_level) then
        eui:uiGridListSetItemColor(UIM.gridlist[1], eui:uiGridListAddRow(UIM.gridlist[1]), 1, tocolor(0, 255, 0))
        eui:uiGridListSetItemColor(UIM.gridlist[1], eui:uiGridListAddRow(UIM.gridlist[1]), 2, tocolor(0, 255, 0))
      else
        eui:uiGridListSetItemColor(UIM.gridlist[1], eui:uiGridListAddRow(UIM.gridlist[1]), 1, tocolor(255, 0, 0))
        eui:uiGridListSetItemColor(UIM.gridlist[1], eui:uiGridListAddRow(UIM.gridlist[1]), 2, tocolor(255, 0, 0))
      end
    end
  end
end)
function showTakeJob(arg0, arg1, arg2)
  eui:uiSetText(UIM.window[2], arg1)
  eui:uiSetText(UIM.label.job_description, arg2)
  eui:uiSetVisible(UIM.window[2], true)
  showCursor(true)
  var0.name = arg0
  for forvar7, forvar8 in pairs(var1.jobs_data) do
    if arg0 == forvar8.name then
      forvar8.job_code = forvar7
      break
    end
  end
  if forvar8 then
    var0.data = forvar8
    eui:uiSetText(UIM.label.job_requirements, {
      en = ("" .. "\226\128\162${color.primary}  Minimum Required Level:  #ffffff" .. forvar8.requirements.min_level .. "\n") .. "\226\128\162${color.primary}  Require vehicles license #ffffff\n",
      ar = ("" .. "\226\128\162${color.primary}  \216\163\216\175\217\134\217\137 \217\133\216\179\216\170\217\136\217\137 \217\133\216\183\217\132\217\136\216\168:  #ffffff" .. forvar8.requirements.min_level .. "\n") .. "\226\128\162${color.primary}  \217\138\216\170\216\183\217\132\216\168 \216\177\216\174\216\181\216\169 \217\130\217\138\216\167\216\175\216\169 #ffffff\n"
    })
  end
end
function takeJob(arg0)
  triggerServerEvent("jobs:take_job", localPlayer, arg0)
end
addEventHandler("onClientUIClick", root, function()
  if source == UIM.button[1] then
    if eui:uiGridListGetSelectedItem(UIM.gridlist[1]) ~= -1 then
      if exports["level-system"]:getPlayerLevel() < tonumber((eui:uiGridListGetItemText(UIM.gridlist[1], eui:uiGridListGetSelectedItem(UIM.gridlist[1]), 2))) then
        exports.notifications:output({
          en = "Your level must be " .. tostring((eui:uiGridListGetItemText(UIM.gridlist[1], eui:uiGridListGetSelectedItem(UIM.gridlist[1]), 2))) .. " or above",
          ar = "\217\133\216\179\216\170\217\136\216\167\217\131 \217\138\216\172\216\168 \216\163\217\134 \217\138\217\131\217\136\217\134 " .. tostring((eui:uiGridListGetItemText(UIM.gridlist[1], eui:uiGridListGetSelectedItem(UIM.gridlist[1]), 2))) .. " \216\163\217\136 \216\163\216\185\217\132\217\137"
        }, 5000, "error")
        return
      end
      if not getElementData(localPlayer, "job") then
        if eui:uiGridListGetItemData(UIM.gridlist[1], eui:uiGridListGetSelectedItem(UIM.gridlist[1]), 2).requirements.driving_license then
          if not exports["driving-license"]:isPlayerHaveLicense(localPlayer, eui:uiGridListGetItemData(UIM.gridlist[1], eui:uiGridListGetSelectedItem(UIM.gridlist[1]), 2).requirements.driving_license_type or "Vehicles") then
            exports.notifications:output({
              en = "You must have a driving license to take this job",
              ar = "\217\138\216\172\216\168 \216\163\217\134 \217\138\217\131\217\136\217\134 \217\132\216\175\217\138\217\131 \216\177\216\174\216\181\216\169 \217\130\217\138\216\167\216\175\216\169 \217\132\216\163\216\174\216\176 \217\135\216\176\217\135 \216\167\217\132\217\136\216\184\217\138\217\129\216\169"
            }, 5000, "error")
            return
          end
        end
        eui:uiSetVisible(UIM.window[1], false)
        showCursor(false)
        triggerServerEvent("jobs:take_job", localPlayer, (eui:uiGridListGetItemData(UIM.gridlist[1], eui:uiGridListGetSelectedItem(UIM.gridlist[1]), 1)))
      elseif getElementData(localPlayer, "job") == eui:uiGridListGetItemData(UIM.gridlist[1], eui:uiGridListGetSelectedItem(UIM.gridlist[1]), 1) then
        exports.notifications:output({
          en = "You are already working in this job",
          ar = "\216\163\217\134\216\170 \216\170\216\185\217\133\217\132 \216\168\216\167\217\132\217\129\216\185\217\132 \217\129\217\138 \217\135\216\176\217\135 \216\167\217\132\217\136\216\184\217\138\217\129\216\169"
        }, 5000, "error")
      else
        exports.notifications:output({
          en = "You must quit your job first",
          ar = "\217\138\216\172\216\168 \216\185\217\132\217\138\217\131 \216\170\216\177\217\131 \217\136\216\184\217\138\217\129\216\170\217\131 \216\163\217\136\217\132\216\167"
        }, 5000, "error")
      end
    end
  elseif source == UIM.button[2] then
    eui:uiSetVisible(UIM.window[1], false)
    showCursor(false)
  elseif source == UIM.button[3] then
    if not getElementData(localPlayer, "job") then
      if not checkJobRequirements(var0.data.code, true) then
        return
      end
      eui:uiSetVisible(UIM.window[2], false)
      showCursor(false)
      triggerEvent("onClientRequestTakeJob", localPlayer, var0.name)
    elseif getElementData(localPlayer, "job") == var0.name then
      exports.notifications:output({
        en = "You are already working in this job",
        ar = "\216\163\217\134\216\170 \216\170\216\185\217\133\217\132 \216\168\216\167\217\132\217\129\216\185\217\132 \217\129\217\138 \217\135\216\176\217\135 \216\167\217\132\217\136\216\184\217\138\217\129\216\169"
      }, 5000, "info")
    else
      exports.notifications:output({
        en = "You must quit your job first",
        ar = "\217\138\216\172\216\168 \216\185\217\132\217\138\217\131 \216\170\216\177\217\131 \217\136\216\184\217\138\217\129\216\170\217\131 \216\163\217\136\217\132\216\167"
      }, 5000, "error")
    end
  elseif source == UIM.button[4] then
    eui:uiSetVisible(UIM.window[2], false)
    showCursor(false)
  end
end)
UI = {
  tab = {},
  progressbar = {},
  edit = {},
  window = {},
  label = {},
  checkbox = {},
  switch = {},
  button = {},
  tabpanel = {},
  radiobutton = {},
  gridlist = {},
  memo = {},
  scrollbar = {},
  combobox = {},
  rectangle = {},
  container = {}
}
function UIKitReady()
  eui = exports.UIKit
  UI.window[1] = eui:uiCreateWindow(false, false, 420, 260, {
    en = "Your Current Job",
    ar = "\217\136\216\184\217\138\217\129\216\170\217\131 \216\167\217\132\216\173\216\167\217\132\217\138\216\169"
  })
  eui:uiSetVisible(UI.window[1], false)
  eui:uiWindowSetMovable(UI.window[1], false)
  UI.label.Info = eui:uiCreateLabel(10, 40, 232, 20, "", tocolor(255, 255, 255, 255), "left", "top", UI.window[1])
  UI.button[1] = eui:uiCreateButton(315, 225, 100, 30, {en = "Close", ar = "\216\165\216\186\217\132\216\167\217\130"}, tocolor(0, 0, 0, 255), UI.window[1])
  UI.button[2] = eui:uiCreateButton(5, 225, 100, 30, {
    en = "Start Job",
    ar = "\216\168\216\175\216\163 \216\167\217\132\216\185\217\133\217\132"
  }, tocolor(0, 0, 0, 255), UI.window[1])
  UI.button[3] = eui:uiCreateButton(110, 225, 150, 30, {
    en = "Quit Job",
    ar = "\216\167\217\132\216\174\216\177\217\136\216\172 \217\133\217\134 \216\167\217\132\217\136\216\184\217\138\217\129\216\169"
  }, tocolor(0, 0, 0, 255), UI.window[1])
end
addEventHandler("onClientUIReady", resourceRoot, UIKitReady)
addEventHandler("onClientUIKitReady", root, UIKitReady)
function closeUIWindows(arg0)
  eui:uiSetVisible(UIM.window[1], false)
  eui:uiSetVisible(UI.window[1], false)
  showCursor(false)
end
addEvent("onClientPlayerQuitFromCharacter", true)
addEventHandler("onClientPlayerQuitFromCharacter", localPlayer, closeUIWindows)
addEventHandler("onClientPlayerWasted", localPlayer, closeUIWindows)
addCommandHandler("job", function()
  if not getElementData(localPlayer, "character:id") then
    return
  end
  if not getElementData(localPlayer, "job") then
    return
  end
  eui:uiSetVisible(UI.window[1], true)
  showCursor(true)
  eui:uiSetText(UI.label.Info, {
    en = "${color.primary}\226\128\162 Job Name  \194\187  #FFFFFF" .. getElementData(localPlayer, "job") .. "\n${color.primary}\226\128\162 In job since  \194\187  #FFFFFF" .. ((getElementData(localPlayer, "job:data") or {})[getElementData(localPlayer, "job")] or {}.tDate or "-") .. "\n${color.primary}\226\128\162 Total taken salary  \194\187  #00FF00$" .. ((getElementData(localPlayer, "job:data") or {})[getElementData(localPlayer, "job")] or {}.total_salary or "-") .. "\n" .. "\n${color.primary}\226\128\162 Commands:" .. "\n#FFFFFF   \194\187\194\187   /startjob   to    #FFFF00Start Job" .. "\n#FFFFFF   \194\187\194\187   /quitjob    to    #FF0000Quit Job" .. "\n#FFFFFF   \194\187\194\187   /jobhelp     to    ${color.primary}Show Job Help" .. "",
    ar = "${color.primary}\226\128\162 \216\167\216\179\217\133 \216\167\217\132\217\136\216\184\217\138\217\129\216\169  \194\187  #FFFFFF" .. getElementData(localPlayer, "job") .. "\n${color.primary}\226\128\162 \217\129\217\138 \216\167\217\132\217\136\216\184\217\138\217\129\216\169 \217\133\217\134\216\176  \194\187  #FFFFFF" .. ((getElementData(localPlayer, "job:data") or {})[getElementData(localPlayer, "job")] or {}.tDate or "-") .. "\n${color.primary}\226\128\162 \217\133\216\172\217\133\217\136\216\185 \216\167\217\132\216\177\216\167\216\170\216\168 \216\167\217\132\217\133\216\163\216\174\217\136\216\176  \194\187  #00FF00$" .. ((getElementData(localPlayer, "job:data") or {})[getElementData(localPlayer, "job")] or {}.total_salary or "-") .. "\n" .. "\n${color.primary}\226\128\162 \216\163\217\136\216\167\217\133\216\177:" .. "\n#FFFFFF   \194\187\194\187   /startjob   \217\132\217\128    #FFFF00\216\168\216\175\216\163 \216\167\217\132\216\185\217\133\217\132" .. "\n#FFFFFF   \194\187\194\187   /quitjob    \217\132\217\128    #FF0000\216\167\217\132\216\174\216\177\217\136\216\172 \217\133\217\134 \216\167\217\132\217\136\216\184\217\138\217\129\216\169" .. "\n#FFFFFF   \194\187\194\187   /jobhelp     \217\132\217\128    ${color.primary}\216\165\216\184\217\135\216\167\216\177 \216\167\217\132\217\133\216\179\216\167\216\185\216\175\216\169 \217\132\217\132\217\136\216\184\217\138\217\129\216\169" .. ""
  })
end, false, false)
addEventHandler("onClientUIClick", root, function()
  if source == UI.button[1] then
    eui:uiSetVisible(UI.window[1], false)
    showCursor(false)
  elseif source == UI.button[2] or source == UI.button.start_job then
    triggerServerEvent("jobs:start_job", localPlayer)
    eui:uiSetVisible(UI.window[1], false)
    showCursor(false)
  elseif source == UI.button[3] or source == UI.button.quit_job then
    triggerServerEvent("jobs:quit_job", localPlayer)
    eui:uiSetVisible(UI.window[1], false)
    showCursor(false)
  elseif source == UI.gridlist.jobs then
    if eui:uiGridListGetSelectedItem(UI.gridlist.jobs) ~= -1 then
      showJobDetails((eui:uiGridListGetItemData(UI.gridlist.jobs, eui:uiGridListGetSelectedItem(UI.gridlist.jobs), 1)))
    else
      eui:uiSetText(UI.label.job_details, "")
    end
  end
end)
function showJobDetails(arg0)
  if var0.jobs_data[arg0.job_code] then
    eui:uiSetText(UI.label.job_details, {
      en = "" .. "\n" .. "${color.primary}\226\128\162 " .. "EXP \194\187  #FFFFFF" .. tostring(arg0.exp) .. "" .. "\n" .. "${color.primary}\226\128\162 " .. "Rank \194\187  #FFFFFF" .. tostring(getJobRankByEXP(arg0.job_code, arg0.exp).name or getJobRankByEXP(arg0.job_code, arg0.exp)) .. "\n" .. "${color.primary}\226\128\162 " .. "Salary \194\187  #FFFFFF$" .. tostring(getJobRankByEXP(arg0.job_code, arg0.exp).salary) .. "" .. "\n" .. "\n" .. "${color.primary}\226\128\162 " .. "Next rank \194\187  #FFFFFF" .. tostring((getJobRankByEXP(arg0.job_code, arg0.exp) or {}).name or getJobRankByEXP(arg0.job_code, arg0.exp) + 1) .. "" .. "\n" .. "${color.primary}\226\128\162 " .. "Next rank salary \194\187  #FFFFFF$" .. tostring((getJobRankByEXP(arg0.job_code, arg0.exp) or {}).salary or "-") .. "" .. "\n" .. "${color.primary}\226\128\162 " .. "Required points for next rank \194\187  #FFFFFF" .. tostring((getJobRankByEXP(arg0.job_code, arg0.exp) or {}).required_exp or "-") .. "" .. "\n" .. "\n" .. "${color.primary}\226\128\162 " .. "First work date \194\187  #FFFFFF" .. tostring(arg0.first_work or "Unknown") .. "" .. "\n" .. "${color.primary}\226\128\162 " .. "Last work date \194\187  #FFFFFF" .. tostring(arg0.last_work or "Unknown") .. "" .. "",
      ar = "" .. "\n" .. "${color.primary}\226\128\162 " .. "\216\167\217\132\217\134\217\130\216\167\216\183 \194\187  #FFFFFF" .. tostring(arg0.exp) .. "" .. "\n" .. "${color.primary}\226\128\162 " .. "\216\167\217\132\216\177\216\170\216\168\216\169 \194\187  #FFFFFF" .. tostring(getJobRankByEXP(arg0.job_code, arg0.exp).name or getJobRankByEXP(arg0.job_code, arg0.exp)) .. "\n" .. "${color.primary}\226\128\162 " .. "\216\167\217\132\216\177\216\167\216\170\216\168 \194\187  #FFFFFF$" .. tostring(getJobRankByEXP(arg0.job_code, arg0.exp).salary) .. "" .. "\n" .. "\n" .. "${color.primary}\226\128\162 " .. "\216\167\217\132\216\177\216\170\216\168\216\169 \216\167\217\132\216\170\216\167\217\132\217\138\216\169 \194\187  #FFFFFF" .. tostring((getJobRankByEXP(arg0.job_code, arg0.exp) or {}).name or getJobRankByEXP(arg0.job_code, arg0.exp) + 1) .. "" .. "\n" .. "${color.primary}\226\128\162 " .. "\216\177\216\167\216\170\216\168 \216\167\217\132\216\177\216\170\216\168\216\169 \216\167\217\132\216\170\216\167\217\132\217\138\216\169 \194\187  #FFFFFF$" .. tostring((getJobRankByEXP(arg0.job_code, arg0.exp) or {}).salary or "-") .. "" .. "\n" .. "${color.primary}\226\128\162 " .. "\216\167\217\132\217\134\217\130\216\167\216\183 \216\167\217\132\217\133\216\183\217\132\217\136\216\168\216\169 \217\132\217\132\216\177\216\170\216\168\216\169 \216\167\217\132\216\170\216\167\217\132\217\138\216\169 \194\187  #FFFFFF" .. tostring((getJobRankByEXP(arg0.job_code, arg0.exp) or {}).required_exp or "-") .. "" .. "\n" .. "\n" .. "${color.primary}\226\128\162 " .. "\216\170\216\167\216\177\217\138\216\174 \216\163\217\136\217\132 \216\185\217\133\217\132 \194\187  #FFFFFF" .. tostring(arg0.first_work or "\216\186\217\138\216\177 \217\133\216\185\216\177\217\136\217\129") .. "" .. "\n" .. "${color.primary}\226\128\162 " .. "\216\170\216\167\216\177\217\138\216\174 \216\162\216\174\216\177 \216\185\217\133\217\132 \194\187  #FFFFFF" .. tostring(arg0.last_work or "\216\186\217\138\216\177 \217\133\216\185\216\177\217\136\217\129") .. "" .. ""
    })
  end
end
function getJobRankByEXP(arg0, arg1)
  if var0.jobs_data[arg0] then
    for forvar7, forvar8 in ipairs(var0.jobs_data[arg0].ranks) do
      if arg1 >= forvar8.required_exp then
      else
        break
      end
    end
    if var0.jobs_data[arg0].ranks[forvar7] then
      return var0.jobs_data[arg0].ranks[forvar7], forvar7, var0.jobs_data[arg0].ranks[forvar7 + 1]
    end
  end
  return false
end
addEventHandler("onClientUIMenuSelectChange", root, function(arg0, arg1)
  if arg1 and getElementID(source) == "main-menu" and eui:uiMenuGetItemID(source, arg0) == "jobs" then
    if not isElement(UI.rectangle.job_current) then
      UI.rectangle.job_current = eui:uiCreateRectangle(15, 60, eui:uiGetSize(arg1) - 30, eui:uiGetSize(arg1) * 0.3, tocolor(9, 12, 17, 180), true, true, true, true, arg1)
      eui:uiCreateRectangle((eui:uiGetSize(arg1) - eui:uiGetSize(arg1) / 2) / 2, eui:uiGetSize(arg1) * 0.3, eui:uiGetSize(arg1) / 2, 1, "primary", false, false, false, false, UI.rectangle.job_current)
      UI.label.job_current = eui:uiCreateLabel(30, 25, 300, 20, "- #a3a3a3/ -\n" .. "\n" .. "${color.primary}\226\128\162 " .. "\216\167\217\132\216\177\216\170\216\168\216\169 \194\187  #FFFFFF" .. tostring("1") .. "\n" .. "${color.primary}\226\128\162 " .. "\216\167\217\132\217\134\217\130\216\167\216\183 \194\187  #FFFFFF" .. tostring("0") .. "" .. "\n" .. "${color.primary}\226\128\162 " .. "\216\167\217\132\216\177\216\167\216\170\216\168 \194\187  #FFFFFF" .. tostring("$0") .. "" .. "", tocolor(255, 255, 255, 255), "left", "top", UI.rectangle.job_current)
      eui:uiSetFont(UI.label.job_current, "default-large")
      UI.button.start_job = eui:uiCreateButton(eui:uiGetSize(arg1) - 30 - 150 - 20, 20, 150, 35, {
        en = "Start Job",
        ar = "\216\168\216\175\216\163 \216\167\217\132\216\185\217\133\217\132"
      }, tocolor(0, 0, 0, 255), UI.rectangle.job_current)
      UI.button.quit_job = eui:uiCreateButton(eui:uiGetSize(arg1) - 30 - 150 - 20, 65, 150, 35, {
        en = "Quit Job",
        ar = "\216\167\217\132\216\174\216\177\217\136\216\172 \217\133\217\134 \216\167\217\132\217\136\216\184\217\138\217\129\216\169"
      }, tocolor(252, 40, 25, 255), UI.rectangle.job_current)
      eui:uiSetProperty(UI.button.quit_job, "HoverGlow", true)
      UI.container.jobs = eui:uiCreateRectangle(15, 60 + eui:uiGetSize(arg1) * 0.3 + 20, eui:uiGetSize(arg1) - 30, eui:uiGetSize(arg1) * 0.7 - 110, tocolor(9, 12, 17, 180), true, true, true, true, arg1)
      UI.gridlist.jobs = eui:uiCreateGridList(10, 10, 200, eui:uiGetSize(arg1) * 0.7 - 110 - 20, tocolor(0, 0, 0, 0), UI.container.jobs)
      eui:uiGridListAddColumn(UI.gridlist.jobs, "Job name", 1)
      eui:uiSetProperty(UI.gridlist.jobs, "row_height", 25)
      UI.label.job_details = eui:uiCreateLabel(240, 20, 300, 20, "", tocolor(255, 255, 255, 255), "left", "top", UI.container.jobs)
      eui:uiCreateImage(eui:uiGetSize(arg1) - 30 - 240, 50, 200, 200, "briefcase.png", UI.container.jobs)
    end
    if getElementData(localPlayer, "job") then
      eui:uiSetVisible(UI.button.start_job, true)
      eui:uiSetVisible(UI.button.quit_job, true)
    else
      eui:uiSetVisible(UI.button.start_job, false)
      eui:uiSetVisible(UI.button.quit_job, false)
    end
    requestJobs()
    triggerServerEvent("jobs:get_character_data", localPlayer)
  end
end)
addEvent("jobs:get_character_data:response", true)
addEventHandler("jobs:get_character_data:response", localPlayer, function(arg0)
  eui:uiGridListClear(UI.gridlist.jobs)
  for forvar6, forvar7 in ipairs(arg0) do
    if var0.jobs_data[forvar7.job_code] then
      eui:uiGridListSetItemText(UI.gridlist.jobs, eui:uiGridListAddRow(UI.gridlist.jobs), 1, tostring(var0.jobs_data[forvar7.job_code].name))
      eui:uiGridListSetItemData(UI.gridlist.jobs, eui:uiGridListAddRow(UI.gridlist.jobs), 1, forvar7)
      if getElementData(localPlayer, "job") == var0.jobs_data[forvar7.job_code].name then
        eui:uiGridListSetSelectedItem(UI.gridlist.jobs, (eui:uiGridListAddRow(UI.gridlist.jobs)))
        showJobDetails(forvar7)
      end
    end
  end
  for forvar7, forvar8 in pairs(var0.jobs_data) do
    if getElementData(localPlayer, "job") == forvar8.name then
      forvar8.job_code = forvar7
    end
  end
  if forvar8 then
    eui:uiSetText(UI.label.job_current, {
      en = forvar8.name .. " #a3a3a3 \n" .. "\n" .. "${color.primary}\226\128\162 " .. "Points \194\187  #FFFFFF" .. tostring(forvar7.exp or 0) .. "" .. "\n" .. "${color.primary}\226\128\162 " .. "Rank \194\187  #FFFFFF" .. tostring(getJobRankByEXP(forvar8.job_code, forvar7.exp or 0).name or getJobRankByEXP(forvar8.job_code, forvar7.exp or 0)) .. "\n" .. "${color.primary}\226\128\162 " .. "Salary \194\187  #FFFFFF" .. tostring("$" .. getJobRankByEXP(forvar8.job_code, forvar7.exp or 0).salary) .. "" .. "",
      ar = forvar8.name .. " #a3a3a3 \n" .. "\n" .. "${color.primary}\226\128\162 " .. "\216\167\217\132\217\134\217\130\216\167\216\183 \194\187  #FFFFFF" .. tostring(forvar7.exp or 0) .. "" .. "\n" .. "${color.primary}\226\128\162 " .. "\216\167\217\132\216\177\216\170\216\168\216\169 \194\187  #FFFFFF" .. tostring(getJobRankByEXP(forvar8.job_code, forvar7.exp or 0).name or getJobRankByEXP(forvar8.job_code, forvar7.exp or 0)) .. "\n" .. "${color.primary}\226\128\162 " .. "\216\167\217\132\216\177\216\167\216\170\216\168 \194\187  #FFFFFF" .. tostring("$" .. getJobRankByEXP(forvar8.job_code, forvar7.exp or 0).salary) .. "" .. ""
    })
  else
    eui:uiSetText(UI.label.job_current, {
      en = "Not currently employed",
      ar = "\216\186\217\138\216\177 \217\133\217\136\216\184\217\129 \216\173\216\167\217\132\217\138\216\167\217\139"
    })
  end
end)
addEventHandler("onClientResourceStart", root, function(arg0)
  if getElementData(localPlayer, "job") then
    triggerEvent("onClientPlayerJobResourceReady", getResourceRootElement(arg0), (getElementData(localPlayer, "job")))
  end
end)
addEvent("onClientPlayerJobReady", false)
addEvent("onClientPlayerJobResourceReady", false)
addEvent("onClientPrepareJob", false)
function isPlayerInJob(arg0, arg1)
  if getElementData(arg0, "job") and getElementData(arg0, "job") == arg1 then
    return true
  end
  return false
end
function getJobRequirements(arg0)
  return var0.jobs_data[arg0] and var0.jobs_data[arg0].requirements or false
end
function checkJobRequirements(arg0, arg1)
  if getJobRequirements(arg0).min_level and exports["level-system"]:getPlayerLevel() < getJobRequirements(arg0).min_level then
    if arg1 then
      exports.notifications:output({
        en = "Your level must be " .. tostring(getJobRequirements(arg0).min_level) .. " or above",
        ar = "\216\163\217\136 \216\163\216\185\217\132\217\137 " .. tostring(getJobRequirements(arg0).min_level) .. " \217\138\216\172\216\168 \216\163\217\134 \217\138\217\131\217\136\217\134 \217\133\216\179\216\170\217\136\216\167\217\131"
      }, 5000, "error")
    end
    return false
  end
  if getJobRequirements(arg0).driving_license then
    if not exports["driving-license"]:isPlayerHaveLicense(localPlayer, getJobRequirements(arg0).driving_license_type or "Vehicles") then
      if arg1 then
        exports.notifications:output({
          en = "You must have a driving license",
          ar = "\217\138\216\172\216\168 \216\163\217\134 \217\138\217\131\217\136\217\134 \217\132\216\175\217\138\217\131 \216\177\216\174\216\181\216\169 \217\130\217\138\216\167\216\175\216\169"
        }, 5000, "error")
      end
      return false
    end
  end
  if getJobRequirements(arg0).off_duty and getElementData(localPlayer, "duty:data") and getElementData(localPlayer, "duty:data").Status then
    exports.notifications:output({
      en = "You must be off duty",
      ar = "\217\138\216\172\216\168 \216\163\217\134 \216\170\217\131\217\136\217\134 \216\174\216\167\216\177\216\172 \216\167\217\132\216\174\216\175\217\133\216\169"
    }, 5000, "error")
    return false
  end
  return true
end
