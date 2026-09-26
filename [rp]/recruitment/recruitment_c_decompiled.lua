-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

function UIKitReady()
  eui = exports.UIKit
  var0.window.recruitment_list = eui:uiCreateWindow(false, false, 500, 450, {
    en = "Recruitments",
    ar = "\216\167\217\132\216\170\217\136\216\184\217\138\217\129"
  }, _, ":assets/icons/suitcase.png")
  eui:uiSetVisible(var0.window.recruitment_list, false)
  eui:uiWindowSetMovable(var0.window.recruitment_list, false)
  var0.button["recruitment_list:apply"] = eui:uiCreateButton(10, 360, 480, 35, {en = "Apply", ar = "\216\170\217\130\216\175\217\138\217\133"}, "primary", var0.window.recruitment_list)
  var0.button["recruitment_list:cancel"] = eui:uiCreateButton(10, 405, 480, 35, {en = "Cancel", ar = "\216\165\217\132\216\186\216\167\216\161"}, _, var0.window.recruitment_list)
  var0.gridlist.recruitment_list = eui:uiCreateGridList(5, 50, 490, 300, tocolor(10, 10, 10, 0), var0.window.recruitment_list)
  eui:uiGridListAddColumn(var0.gridlist.recruitment_list, "Employer / \216\172\217\135\216\169 \216\167\217\132\216\185\217\133\217\132", 0.7)
  eui:uiGridListAddColumn(var0.gridlist.recruitment_list, "", 0.3)
  eui:uiSetProperty(var0.gridlist.recruitment_list, "row_height", 25)
  var0.window.application_view = eui:uiCreateWindow(false, false, 500, 650, {
    en = "View Application",
    ar = "\216\185\216\177\216\182 \216\167\217\132\216\170\217\130\216\175\217\138\217\133"
  })
  eui:uiSetVisible(var0.window.application_view, false)
  eui:uiWindowSetMovable(var0.window.application_view, false)
  var0.label["application_view:applicant"] = eui:uiCreateLabel(10, 30, 480, 40, [[
Name: -
Date: -]], tocolor(255, 255, 255, 255), "left", "top", var0.window.application_view)
  var0.gridlist.application_view = eui:uiCreateGridList(5, 80, 490, 200, tocolor(0, 0, 0, 0), var0.window.application_view)
  eui:uiGridListAddColumn(var0.gridlist.application_view, "#", 0.1)
  eui:uiGridListAddColumn(var0.gridlist.application_view, "Question", 0.7)
  eui:uiGridListAddColumn(var0.gridlist.application_view, "Duration", 0.3)
  eui:uiSetProperty(var0.gridlist.application_view, "row_height", 20)
  var0.label["application_view:question"] = eui:uiCreateLabel(10, 290, 480, 30, "...", tocolor(255, 255, 255, 255), "center", "center", var0.window.application_view)
  var0.memo["application_view:answer"] = eui:uiCreateMemo(10, 330, 480, 130, "", tocolor(255, 255, 255, 240), var0.window.application_view)
  eui:uiMemoSetReadOnly(var0.memo["application_view:answer"], true)
  var0.gridlist["application_view:applicant_factions"] = eui:uiCreateGridList(10, 475, 480, 120, tocolor(0, 0, 0, 0), var0.window.application_view)
  eui:uiGridListAddColumn(var0.gridlist["application_view:applicant_factions"], "Applicant Factions", 1)
  var0.button["application_view:accept"] = eui:uiCreateButton(10, 605, 150, 35, {en = "Accept", ar = "\217\130\216\168\217\136\217\132"}, _, var0.window.application_view)
  var0.button["application_view:reject"] = eui:uiCreateButton(170, 605, 150, 35, {en = "Reject", ar = "\216\177\217\129\216\182"}, _, var0.window.application_view)
  var0.button["application_view:cancel"] = eui:uiCreateButton(390, 605, 100, 35, {en = "Cancel", ar = "\216\165\217\132\216\186\216\167\216\161"}, _, var0.window.application_view)
  var0.window.recruitment_from = eui:uiCreateRectangle(false, false, 600, 450, "bg_default", true, true, true, true)
  eui:uiSetVisible(var0.window.recruitment_from, false)
  var0.container.intro = eui:uiCreateContainer(0, 0, 600, 450, var0.window.recruitment_from)
  eui:uiSetVisible(var0.container.intro, false)
  var0.image.Logo = eui:uiCreateImage((600 - 100) / 2, 30, 100, 100, ":assets/images/logo.png", var0.container.intro)
  var0.label.Employer = eui:uiCreateLabel(5, 30 + 100 + 20, 590, 40, "", tocolor(255, 255, 255, 255), "center", "center", var0.container.intro)
  eui:uiSetFont(var0.label.Employer, "default-large")
  eui:uiCreateLabel(10, 80 + 100 + 20, 580, 100, "\216\167\217\132\216\170\217\130\216\175\217\138\217\133 \217\133\217\131\217\136\217\134 \217\133\217\134 \217\133\216\172\217\133\217\136\216\185\216\169 \216\163\216\179\216\166\217\132\216\169 \217\138\216\172\216\168 \216\185\217\132\217\138\217\131 \216\167\217\132\216\165\216\172\216\167\216\168\216\169 \216\185\217\132\217\138\217\135\216\167\n\217\130\216\175 \217\138\216\170\217\133 \216\167\217\131\216\170\216\180\216\167\217\129\217\131 \216\185\217\134\216\175 \217\133\216\173\216\167\217\136\217\132\216\169 \216\167\217\132\216\186\216\180 \217\136\216\177\217\129\216\182 \216\170\217\130\216\175\217\138\217\133\217\131\n\216\173\216\167\217\136\217\132 \216\167\217\132\216\165\216\172\216\167\216\168\216\169 \216\185\217\132\217\137 \216\167\217\132\216\163\216\179\216\166\217\132\216\169 \216\168\216\179\216\177\216\185\216\169 \216\173\217\138\216\171 \217\130\216\175 \217\138\216\164\216\171\216\177 \216\178\217\133\217\134 \216\167\217\132\216\165\216\172\216\167\216\168\216\169 \216\185\217\132\217\137 \217\130\216\168\217\136\217\132\217\131 \216\163\217\136 \216\177\217\129\216\182\217\131\n\n\216\179\217\138\216\184\217\135\216\177 \216\179\216\164\216\167\217\132 \217\136\216\167\216\173\216\175 \217\129\217\130\216\183 \217\129\217\138 \216\167\217\132\217\136\217\130\216\170 \217\134\217\129\216\179\217\135 \217\132\217\132\216\165\216\172\216\167\216\168\216\169 \216\185\217\132\217\138\217\135 \217\130\216\168\217\132 \216\167\217\132\216\167\217\134\216\170\217\130\216\167\217\132 \217\132\217\132\216\179\216\164\216\167\217\132 \216\167\217\132\216\170\216\167\217\132\217\138\n\216\185\217\134\216\175 \216\167\217\132\216\167\217\134\216\170\217\130\216\167\217\132 \217\132\217\132\216\179\216\164\216\167\217\132 \216\167\217\132\216\170\216\167\217\132\217\138 \217\132\217\134 \216\170\216\170\217\133\217\131\217\134 \217\133\217\134 \216\167\217\132\216\177\216\172\217\136\216\185 \217\132\217\132\216\179\216\164\216\167\217\132 \216\167\217\132\216\179\216\167\216\168\217\130\n${color.primary}\n\216\179\217\138\216\181\217\132\217\131 \216\165\216\180\216\185\216\167\216\177 \216\168\216\167\217\132\217\130\216\168\217\136\217\132 \216\163\217\136 \216\167\217\132\216\177\217\129\216\182\216\140 \217\132\216\176\217\132\217\131 \217\138\216\177\216\172\217\137 \216\185\216\175\217\133 \216\165\216\178\216\185\216\167\216\172 \216\167\217\132\217\133\216\179\216\164\217\136\217\132\217\138\217\134 \216\168\216\167\217\132\216\179\216\164\216\167\217\132 \216\185\217\134 \216\173\216\167\217\132\216\169 \216\170\217\130\216\175\217\138\217\133\217\131\n\t", tocolor(255, 255, 255, 255), "center", "top", var0.container.intro)
  var0.label.Start = eui:uiCreateLabel(5, 450 - 80, 590, 30, {
    en = "Start Application  \194\187",
    ar = "\216\168\216\175\216\163 \216\167\217\132\216\170\217\130\216\175\217\138\217\133  \194\187"
  }, tocolor(255, 255, 255, 100), "center", "center", var0.container.intro)
  eui:uiSetFont(var0.label.Start, "default-large")
  var0.label.CancelApplication = eui:uiCreateLabel(5, 450 - 40, 590, 30, {en = "Cancel", ar = "\216\165\217\132\216\186\216\167\216\161"}, tocolor(255, 255, 255, 100), "center", "center", var0.container.intro)
  var0.container.question = eui:uiCreateContainer(0, 0, 600, 450, var0.window.recruitment_from)
  eui:uiSetVisible(var0.container.question, false)
  var0.label.QuestionNumber = eui:uiCreateLabel(15, 20, 580, 30, "Question #0", tocolor(255, 255, 255, 255), "left", "top", var0.container.question)
  eui:uiSetFont(var0.label.QuestionNumber, "default-large")
  var0.label.QuestionTimer = eui:uiCreateLabel(15, 20, 565, 30, "00:00:00", tocolor(255, 255, 255, 255), "right", "top", var0.container.question)
  eui:uiSetFont(var0.label.QuestionTimer, "default-large")
  var0.label.Question = eui:uiCreateLabel(20, 60, 560, 50, "...", tocolor(255, 255, 255, 255), "center", "center", var0.container.question)
  eui:uiSetFont(var0.label.Question, "default-large")
  eui:uiSetProperty(var0.label.Question, "color_coded", false)
  eui:uiSetProperty(var0.label.Question, "clip", false)
  eui:uiSetProperty(var0.label.Question, "word_break", true)
  var0.memo.Answer = eui:uiCreateMemo(20, 140, 560, 170, "", tocolor(20, 20, 20, 240), var0.container.question)
  eui:uiSetProperty(var0.memo.Answer, "TextColor", tocolor(255, 255, 255, 255))
  var0.label.NextQuestion = eui:uiCreateLabel(5, 450 - 95, 590, 30, {
    en = "Next Question \194\187",
    ar = "\216\167\217\132\216\179\216\164\216\167\217\132 \216\167\217\132\216\170\216\167\217\132\217\138 \194\187"
  }, tocolor(255, 255, 255, 100), "center", "center", var0.container.question)
  eui:uiSetFont(var0.label.NextQuestion, "default-large")
  eui:uiCreateLabel(5, 450 - 60, 590, 20, {
    en = "You cannot go back to the previous question",
    ar = "\217\132\216\167\216\170\216\179\216\170\216\183\217\138\216\185 \216\167\217\132\216\185\217\136\216\175\216\169 \217\132\217\132\216\179\216\164\216\167\217\132 \216\167\217\132\216\179\216\167\216\168\217\130"
  }, tocolor(255, 255, 255, 50), "center", "center", var0.container.question)
  var0.progressbar.Application = eui:uiCreateProgressBar(20, 450 - 20, 560, 4, _, var0.container.question)
  eui:uiSetProperty(var0.progressbar.Application, "background_color", tocolor(20, 20, 20, 240))
  eui:uiSetProperty(var0.progressbar.Application, "progress_animation", true)
  eui:uiSetProperty(var0.progressbar.Application, "show_progress", false)
end
addEventHandler("onClientUIReady", resourceRoot, UIKitReady)
addEventHandler("onClientUIKitReady", root, UIKitReady)
function closeUIWindows(arg0)
  eui:uiSetVisible(var0.window.recruitment_list, false)
  eui:uiSetVisible(var0.window.application_view, false)
  closeRecruitmentApp()
end
addEvent("onClientPlayerQuitFromCharacter", true)
addEventHandler("onClientPlayerQuitFromCharacter", localPlayer, closeUIWindows)
addEventHandler("onClientPlayerWasted", localPlayer, closeUIWindows)
function changeAlpha()
  if source == var0.label.Start or source == var0.label.NextQuestion or source == var0.label.CancelApplication then
    eui:uiSetAlpha(source, eventName == "onClientUIMouseEnter" and 240 or 100)
  end
end
addEventHandler("onClientUIMouseEnter", root, changeAlpha)
addEventHandler("onClientUIMouseLeave", root, changeAlpha)
addEventHandler("onClientUIDoubleClick", root, function()
  if source == var0.gridlist.SelectFaction and eui:uiGridListGetSelectedItem(var0.gridlist.SelectFaction) ~= -1 then
    triggerServerEvent("factions:recruitment:form:get", localPlayer, (eui:uiGridListGetItemData(var0.gridlist.SelectFaction, eui:uiGridListGetSelectedItem(var0.gridlist.SelectFaction), 1)))
  end
end)
addEventHandler("onClientUIClick", root, function()
  if source == var0.button["recruitment_list:cancel"] then
    eui:uiSetVisible(var0.window.recruitment_list, false)
    showCursor(false)
  elseif source == var0.button["recruitment_list:apply"] then
    if eui:uiGridListGetSelectedItem(var0.gridlist.recruitment_list) ~= -1 then
      eui:uiSetVisible(var0.window.recruitment_list, false)
      showCursor(false)
      triggerServerEvent("factions:recruitment:form:get", localPlayer, (eui:uiGridListGetItemData(var0.gridlist.recruitment_list, eui:uiGridListGetSelectedItem(var0.gridlist.recruitment_list), 1)))
    end
  elseif source == var0.gridlist.application_view then
    if eui:uiGridListGetSelectedItem(var0.gridlist.application_view) ~= -1 then
      eui:uiSetText(var0.label["application_view:question"], tostring(eui:uiGridListGetItemData(var0.gridlist.application_view, eui:uiGridListGetSelectedItem(var0.gridlist.application_view), 1).name))
      eui:uiSetText(var0.memo["application_view:answer"], tostring(eui:uiGridListGetItemData(var0.gridlist.application_view, eui:uiGridListGetSelectedItem(var0.gridlist.application_view), 1).value))
    end
  elseif source == var0.button["application_view:cancel"] then
    eui:uiSetVisible(var0.window.application_view, false)
    showCursor(false)
    current_view_application = nil
  elseif source == var0.button["application_view:accept"] then
    eui:uiSetVisible(var0.window.application_view, false)
    showCursor(false)
    triggerServerEvent("from:application:action", localPlayer, current_view_application.id, "accept")
    current_view_application = nil
  elseif source == var0.button["application_view:reject"] then
    eui:uiSetVisible(var0.window.application_view, false)
    showCursor(false)
    triggerServerEvent("from:application:action", localPlayer, current_view_application.id, "reject")
    current_view_application = nil
  elseif source == var0.label.Start then
    eui:uiSetVisible(var0.container.intro, false)
    eui:uiSetVisible(var0.container.question, true)
    nextQuestion()
  elseif source == var0.label.CancelApplication then
    closeRecruitmentApp()
  elseif source == var0.label.NextQuestion then
    if var1.current_form[var1.current_form_index].field_type == "text" then
    end
    if eui:uiGetText(var0.memo.Answer) == "" then
      exports.notifications:output({
        en = "Please answer the question",
        ar = "\216\167\217\132\216\177\216\172\216\167\216\161 \216\167\217\132\216\165\216\172\216\167\216\168\216\169 \216\185\217\132\217\137 \216\167\217\132\216\179\216\164\216\167\217\132"
      }, 4000, "warning")
      return
    end
    var1.current_form_values[var1.current_form_index] = {
      name = var1.current_form[var1.current_form_index].field_name,
      value = eui:uiGetText(var0.memo.Answer),
      time = var1.current_timer_count
    }
    nextQuestion()
  end
end)
addEvent("factions:recruitment:show_available", true)
addEventHandler("factions:recruitment:show_available", localPlayer, function(arg0)
  eui:uiSetVisible(var0.window.recruitment_list, true)
  showCursor(true)
  eui:uiGridListClear(var0.gridlist.recruitment_list)
  for forvar4, forvar5 in ipairs(arg0) do
    eui:uiGridListSetItemText(var0.gridlist.recruitment_list, eui:uiGridListAddRow(var0.gridlist.recruitment_list), 1, tostring(forvar5.Name))
    eui:uiGridListSetItemData(var0.gridlist.recruitment_list, eui:uiGridListAddRow(var0.gridlist.recruitment_list), 1, forvar5.ID)
  end
end)
addEvent("factions:recruitment:form:get:callback", true)
addEventHandler("factions:recruitment:form:get:callback", localPlayer, function(arg0, arg1)
  openRecruitmentApp(arg0, arg1)
end)
;({}).current_faction_details = false
;({}).current_form = false
;({}).current_form_index = false
;({}).current_form_values = false
function openRecruitmentApp(arg0, arg1)
  if not eui:uiGetVisible(var0.window.recruitment_from) then
    var1.current_faction_details = arg0
    var1.current_form = arg1
    var1.current_form_index = 0
    var1.current_form_values = {}
    eui:uiStaticImageLoadImage(var0.image.Logo, arg0.logo and ":factions-logos/logos/" .. tostring(arg0.ID) .. ".png" or ":assets/images/logo.png")
    eui:uiSetText(var0.label.Employer, tostring(arg0.Name))
    arg0.color = arg0.color or {
      255,
      255,
      255
    }
    eui:uiSetColor(var0.label.Employer, arg0.color[1], arg0.color[2], arg0.color[3])
    eui:uiSetVisible(var0.container.question, false)
    eui:uiSetVisible(var0.container.intro, true)
    eui:uiSetVisible(var0.window.recruitment_from, true)
    showCursor(true)
    addEventHandler("onClientMinimize", root, clearForm)
    addEventHandler("onClientPaste", root, clearForm)
    showChat(false, true)
  end
end
function clearForm()
  eui:uiSetText(var0.memo.Answer, "")
end
function closeRecruitmentApp()
  if eui:uiGetVisible(var0.window.recruitment_from) then
    eui:uiSetVisible(var0.window.recruitment_from, false)
    showCursor(false)
    if isTimer(var1.current_timer) then
      killTimer(var1.current_timer)
      var1.current_timer = nil
    end
    removeEventHandler("onClientMinimize", root, clearForm)
    removeEventHandler("onClientPaste", root, clearForm)
    showChat(true, false)
  end
end
function nextQuestion()
  var0.current_form_index = var0.current_form_index + 1
  if var0.current_form_index + 1 > #var0.current_form then
    triggerServerEvent("factions:recruitment:form:submit", localPlayer, var0.current_faction_details.ID, var0.current_form_values)
    closeRecruitmentApp()
    return
  end
  showQuestion(var0.current_form_index + 1)
end
function showQuestion(arg0)
  if not var0.current_form[arg0] then
    return
  end
  eui:uiSetText(var1.label.Question, var0.current_form[arg0].field_name)
  eui:uiSetText(var1.label.QuestionNumber, "Question #" .. tostring(arg0) .. " / " .. tostring(#var0.current_form))
  eui:uiSetText(var1.memo.Answer, "")
  if arg0 == #var0.current_form then
    eui:uiSetText(var1.label.NextQuestion, {
      en = "Submit Application",
      ar = "\216\165\216\177\216\179\216\167\217\132 \216\167\217\132\216\170\217\130\216\175\217\138\217\133"
    })
  else
    eui:uiSetText(var1.label.NextQuestion, {
      en = "Next Question \194\187",
      ar = "\216\167\217\132\216\179\216\164\216\167\217\132 \216\167\217\132\216\170\216\167\217\132\217\138 \194\187"
    })
  end
  eui:uiProgressBarSetProgress(var1.progressbar.Application, (arg0 - 1) / #var0.current_form * 100)
  eui:uiSetText(var1.label.QuestionTimer, "00:00:00")
  var0.current_timer_count = 0
  if isTimer(var0.current_timer) then
    killTimer(var0.current_timer)
  end
  var0.current_timer = setTimer(function()
    var0.current_timer_count = var0.current_timer_count + 1
    eui:uiSetText(var1.label.QuestionTimer, msToTimeStr(var0.current_timer_count))
    if isChatVisible() then
      showChat(false, true)
    end
    if isConsoleActive() then
      clearForm()
    end
  end, 1000, 0)
end
addEvent("form:application:show_details", true)
addEventHandler("form:application:show_details", localPlayer, function(arg0, arg1)
  current_view_application = arg0
  eui:uiSetVisible(var0.window.application_view, true)
  showCursor(true)
  eui:uiBringToFront(var0.window.application_view)
  eui:uiSetText(var0.label["application_view:applicant"], "Name:  ${color.primary}" .. tostring(arg0.character_name) .. [[

#ffffffDate:  ${color.primary}]] .. tostring(arg0.created_at))
  eui:uiSetText(var0.label["application_view:question"], "")
  eui:uiSetText(var0.memo["application_view:answer"], "")
  eui:uiGridListClear(var0.gridlist.application_view)
  if arg0.form then
    for forvar5, forvar6 in ipairs(arg0.form) do
      eui:uiGridListSetItemText(var0.gridlist.application_view, eui:uiGridListAddRow(var0.gridlist.application_view), 1, tostring(forvar5))
      eui:uiGridListSetItemText(var0.gridlist.application_view, eui:uiGridListAddRow(var0.gridlist.application_view), 2, tostring(forvar6.name))
      eui:uiGridListSetItemText(var0.gridlist.application_view, eui:uiGridListAddRow(var0.gridlist.application_view), 3, tostring(msToTimeStr(forvar6.time or 0)))
      eui:uiGridListSetItemData(var0.gridlist.application_view, eui:uiGridListAddRow(var0.gridlist.application_view), 1, forvar6)
    end
  end
  eui:uiGridListClear(var0.gridlist["application_view:applicant_factions"])
  if arg1 then
    for forvar5, forvar6 in ipairs(arg1) do
      eui:uiGridListSetItemText(var0.gridlist["application_view:applicant_factions"], eui:uiGridListAddRow(var0.gridlist["application_view:applicant_factions"]), 1, tostring(forvar6.Name))
    end
  end
  eui:uiSetVisible(var0.button["application_view:accept"], arg0.status == "pending")
  eui:uiSetVisible(var0.button["application_view:reject"], arg0.status == "pending")
end)
function msToTimeStr(arg0)
  arg0 = tonumber(arg0)
  arg0 = math.floor(arg0)
  if not arg0 then
    return "00:00:00"
  end
  if arg0 < 0 then
    return "00:00:00"
  end
  if #tostring(math.fmod(arg0, 60)) == 1 then
  end
  if #tostring(math.fmod(math.floor(arg0 / 60), 60)) == 1 then
  end
  if #tostring(math.floor(arg0 / 3600)) == 1 then
  end
  return ("0" .. tostring(math.floor(arg0 / 3600))) .. ":" .. ("0" .. tostring(math.fmod(math.floor(arg0 / 60), 60))) .. ":" .. "0" .. tostring(math.fmod(arg0, 60))
end
