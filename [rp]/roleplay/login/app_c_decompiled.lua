-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

function UIKitReady()
  eui = exports.UIKit
  var0.window.Welcome = eui:uiCreateRectangle((eui:uiGetReferenceScreenSize() - 600) / 2, (eui:uiGetReferenceScreenSize() - 400) / 2, 600, 400, tocolor(5, 5, 5, 240), true, true, true, true)
  eui:uiSetVisible(var0.window.Welcome, false)
  var0.image.Logo = eui:uiCreateImage((600 - 240) / 2, 20, 240, 135, ":assets/images/logo.png", var0.window.Welcome)
  var0.label.Welcome = eui:uiCreateLabel(5, 20 + 135 + 20, 590, 40, [[
H25,
Welcome to ${color.primary}Wnash Roleplay]], tocolor(255, 255, 255, 255), "center", "center", var0.window.Welcome)
  eui:uiSetFont(var0.label.Welcome, "default-large")
  eui:uiCreateLabel(10, 80 + 135 + 20, 580, 100, [[
In order to be qualified to play in this server you must skip the test
the correct writing must be taken into account when writing in the application

After submitting the application, it will be subject to management review]], tocolor(255, 255, 255, 255), "center", "center", var0.window.Welcome)
  var0.label.Start = eui:uiCreateLabel(5, 350, 590, 30, "Let's Start \194\187", tocolor(255, 255, 255, 100), "center", "center", var0.window.Welcome)
  eui:uiSetFont(var0.label.Start, "default-large")
  var0.window.Application = eui:uiCreateRectangle((eui:uiGetReferenceScreenSize() - 600) / 2, (eui:uiGetReferenceScreenSize() - 400) / 2, 600, 400, tocolor(5, 5, 5, 240), true, true, true, true)
  eui:uiSetVisible(var0.window.Application, false)
  var0.label.Result = eui:uiCreateLabel(15, 20, 580, 150, [[
Your Result in Multi-Choice Questions
#FF0000(Doesn't include the write questions)#FFFFFF]], tocolor(255, 255, 255, 255), "center", "center", var0.window.Application)
  eui:uiSetFont(var0.label.Result, "default-large")
  eui:uiSetVisible(var0.label.Result, false)
  var0.progressbar.Result = eui:uiCreateProgressBar(300, 210, 50, 50, _, var0.window.Application)
  eui:uiSetVisible(var0.progressbar.Result, false)
  eui:uiSetProperty(var0.progressbar.Result, "progress_type", "circular")
  var0.label.Notes = eui:uiCreateLabel(5, 300, 590, 60, {
    en = [[
The application was submitted to the administration
to be reviewed by them#FFFFFF
Wait until you are accepted or rejected]],
    ar = "\t\t\216\170\217\133 \216\170\217\130\216\175\217\138\217\133 \216\167\217\132\216\183\217\132\216\168 \216\165\217\132\217\137 \216\167\217\132\216\165\216\175\216\167\216\177\216\169\n\t\t\217\132\217\138\216\170\217\133 \217\133\216\177\216\167\216\172\216\185\216\170\217\135 \217\133\217\134 \217\130\216\168\217\132\217\135\217\133\n\t\t\216\167\217\134\216\170\216\184\216\177 \216\173\216\170\217\137 \217\138\216\170\217\133 \217\130\216\168\217\136\217\132\217\131 \216\163\217\136 \216\177\217\129\216\182\217\131\n\t"
  }, tocolor(255, 255, 255, 100), "center", "center", var0.window.Application)
  eui:uiSetFont(var0.label.Notes, "default-large")
  eui:uiSetVisible(var0.label.Notes, false)
  var0.label.QuestionNumber = eui:uiCreateLabel(15, 20, 580, 30, "Question #0", tocolor(255, 255, 255, 255), "left", "top", var0.window.Application)
  eui:uiSetFont(var0.label.QuestionNumber, "default-large")
  var0.label.QuestionTimer = eui:uiCreateLabel(15, 20, 565, 30, "00:00:00", tocolor(255, 255, 255, 255), "right", "top", var0.window.Application)
  eui:uiSetFont(var0.label.QuestionTimer, "default-large")
  var0.label.Question = eui:uiCreateLabel(20, 60, 560, 50, "...", tocolor(255, 255, 255, 255), "center", "center", var0.window.Application)
  eui:uiSetFont(var0.label.Question, "default-large")
  eui:uiSetProperty(var0.label.Question, "color_coded", false)
  eui:uiSetProperty(var0.label.Question, "clip", false)
  eui:uiSetProperty(var0.label.Question, "word_break", true)
  var0.checkbox.C1 = eui:uiCreateCheckBox(30, 140, 540, 30, "...", false, _, var0.window.Application)
  var0.checkbox.C2 = eui:uiCreateCheckBox(30, 180, 540, 30, "...", false, _, var0.window.Application)
  var0.checkbox.C3 = eui:uiCreateCheckBox(30, 220, 540, 30, "...", false, _, var0.window.Application)
  var0.memo.Answer = eui:uiCreateMemo(30, 140, 540, 170, "", tocolor(20, 20, 20, 240), var0.window.Application)
  eui:uiSetProperty(var0.memo.Answer, "TextColor", tocolor(255, 255, 255, 255))
  eui:uiSetVisible(var0.memo.Answer, false)
  var0.label.NextQuestion = eui:uiCreateLabel(5, 340, 590, 30, {
    en = "Next Question \194\187",
    ar = "\216\167\217\132\216\179\216\164\216\167\217\132 \216\167\217\132\216\170\216\167\217\132\217\138 \194\187"
  }, tocolor(255, 255, 255, 100), "center", "center", var0.window.Application)
  eui:uiSetFont(var0.label.NextQuestion, "default-large")
  var0.progressbar.Application = eui:uiCreateProgressBar(5, 390, 590, 5, _, var0.window.Application)
  eui:uiSetProperty(var0.progressbar.Application, "background_color", tocolor(20, 20, 20, 240))
  eui:uiSetProperty(var0.progressbar.Application, "progress_animation", true)
  eui:uiSetProperty(var0.progressbar.Application, "show_progress", false)
  var0.window.RejectMessage = eui:uiCreateRectangle((eui:uiGetReferenceScreenSize() - 600) / 2, (eui:uiGetReferenceScreenSize() - 250) / 2, 600, 250, tocolor(5, 5, 5, 240), true, true, true, true)
  eui:uiSetVisible(var0.window.RejectMessage, false)
  var0.label.RejectMessage = eui:uiCreateLabel(5, 10, 590, 150, {
    en = [[
#FF0000Sorry#FFFFFF
Your application has been declined
please try again in 5 minutes.]],
    ar = "\t\t#FF0000\216\167\217\132\217\133\216\185\216\176\216\177\216\169#FFFFFF\n\t\t\216\170\217\133 \216\177\217\129\216\182 \216\170\217\130\216\175\217\138\217\133\217\131\n\t\t\216\173\216\167\217\136\217\132 \217\133\216\177\216\169 \216\163\216\174\216\177\217\137 \216\168\216\185\216\175 5 \216\175\217\130\216\167\216\166\217\130\n\t"
  }, tocolor(255, 255, 255, 255), "center", "center", var0.window.RejectMessage)
  eui:uiSetFont(var0.label.RejectMessage, "default-large")
  var0.label.RejectReason = eui:uiCreateLabel(5, 165, 590, 20, "", tocolor(255, 255, 255, 255), "center", "center", var0.window.RejectMessage)
  eui:uiSetFont(var0.label.RejectReason, "default-bold")
  eui:uiSetFontSize(var0.label.RejectReason, 1.2)
  var0.label.TryAgain = eui:uiCreateLabel(5, 200, 590, 30, {
    en = "\194\171 Try Again",
    ar = "\194\171 \217\133\216\173\216\167\217\136\217\132\216\169 \217\133\216\177\216\169 \216\163\216\174\216\177\217\137"
  }, tocolor(255, 255, 255, 100), "center", "center", var0.window.RejectMessage)
  eui:uiSetFont(var0.label.TryAgain, "default-large")
end
addEventHandler("onClientUIReady", resourceRoot, UIKitReady)
addEventHandler("onClientUIKitReady", root, UIKitReady)
function changeAlpha()
  if source == var0.label.Start or source == var0.label.NextQuestion or source == var0.label.TryAgain then
    eui:uiSetAlpha(source, eventName == "onClientUIMouseEnter" and 240 or 100)
  end
end
addEventHandler("onClientUIMouseEnter", root, changeAlpha)
addEventHandler("onClientUIMouseLeave", root, changeAlpha)
addEventHandler("onClientUIClick", root, function()
  if source == var0.label.Start then
    eui:uiSetVisible(var0.window.Welcome, false)
    eui:uiSetVisible(var0.window.Application, true)
    var1.currentID = 1
    triggerServerEvent("application:callSQLInformations", localPlayer)
  elseif source == var0.label.NextQuestion then
    if var1.chosenQuestions[var1.currentID][2] == "MC" then
      for forvar7 = 1, 3 do
        if eui:uiCheckBoxGetSelected(var0.checkbox["C" .. tostring(forvar7)]) then
          if false then
            eui:uiLabelApplyShakeAnimation(source)
            return
          else
          end
        end
      end
      if not forvar7 then
        eui:uiLabelApplyShakeAnimation(source)
        return
      end
      if eui:uiCheckBoxGetSelected(var0.checkbox["C" .. tostring(var1.questions[var1.chosenQuestions[var1.currentID][1]].CorrectChoice)]) then
        var1.currentAnswersCount = var1.currentAnswersCount + 1
        table.insert(var1.allAnswers, {
          var1.chosenQuestions[var1.currentID][2],
          eui:uiGetText(var0.label.Question),
          eui:uiGetText(var0.checkbox["C" .. tostring(var1.questions[var1.chosenQuestions[var1.currentID][1]].CorrectChoice)]),
          QuestionTimerCount,
          true
        })
      elseif eui:uiCheckBoxGetSelected(var0.checkbox.C1) then
        table.insert(var1.allAnswers, {
          var1.chosenQuestions[var1.currentID][2],
          eui:uiGetText(var0.label.Question),
          eui:uiGetText(var0.checkbox.C1),
          QuestionTimerCount,
          false
        })
      elseif eui:uiCheckBoxGetSelected(var0.checkbox.C2) then
        table.insert(var1.allAnswers, {
          var1.chosenQuestions[var1.currentID][2],
          eui:uiGetText(var0.label.Question),
          eui:uiGetText(var0.checkbox.C2),
          QuestionTimerCount,
          false
        })
      elseif eui:uiCheckBoxGetSelected(var0.checkbox.C3) then
        table.insert(var1.allAnswers, {
          var1.chosenQuestions[var1.currentID][2],
          eui:uiGetText(var0.label.Question),
          eui:uiGetText(var0.checkbox.C3),
          QuestionTimerCount,
          false
        })
      end
    elseif var1.chosenQuestions[var1.currentID][2] == "W" then
      if #eui:uiGetText(var0.memo.Answer) < 10 then
        eui:uiLabelApplyShakeAnimation(source)
        return
      end
      table.insert(var1.answers, {
        eui:uiGetText(var0.label.Question),
        (eui:uiGetText(var0.memo.Answer))
      })
      table.insert(var1.allAnswers, {
        var1.chosenQuestions[var1.currentID][2],
        eui:uiGetText(var0.label.Question),
        eui:uiGetText(var0.memo.Answer),
        QuestionTimerCount
      })
    end
    if var1.currentID < var1.questionsNumber then
      changeQuestion(var1.currentID + 1)
    else
      triggerServerEvent("application:submitApplication", localPlayer, var1.allAnswers, var1.answers)
      showQuestions(false)
      if var1.questionsNumber - var1.w_questionsNumber == 0 then
        eui:uiSetVisible(var0.window.Welcome, false)
        eui:uiSetVisible(var0.window.Application, false)
        addEventHandler("onClientRender", root, MessageRender)
      else
        eui:uiSetVisible(var0.label.Result, true)
        eui:uiSetVisible(var0.progressbar.Result, true)
        eui:uiSetVisible(var0.label.Notes, true)
        eui:uiProgressBarSetProgress(var0.progressbar.Result, var1.currentAnswersCount / (var1.questionsNumber - var1.w_questionsNumber) * 100)
        if isTimer(WaitingMessageTimer) then
          killTimer(WaitingMessageTimer)
        end
        WaitingMessageTimer = setTimer(function()
          eui:uiSetVisible(var0.window.Welcome, false)
          eui:uiSetVisible(var0.window.Application, false)
          addEventHandler("onClientRender", root, MessageRender)
        end, 10000, 1)
      end
    end
  elseif source == var0.checkbox.C1 or source == var0.checkbox.C2 or source == var0.checkbox.C3 then
    if eui:uiCheckBoxGetSelected(source) then
      for forvar3 = 1, 3 do
        if var0.checkbox["C" .. tostring(forvar3)] ~= source then
          eui:uiCheckBoxSetSelected(var0.checkbox["C" .. tostring(forvar3)], false)
        end
      end
    end
  elseif source == var0.label.TryAgain then
    if (getTickCount() - var2) / 1000 < 5 then
      return
    end
    var2 = getTickCount()
    showLoading(true)
    triggerServerEvent("application:requestApplication", localPlayer)
  end
end)
addEvent("application:requestApplication.response", true)
addEventHandler("application:requestApplication.response", localPlayer, function(arg0, arg1)
  if arg0 then
    eui:uiSetVisible(var0.window.RejectMessage, false)
  else
    exports.notifications:output("Please wait (Remaining Time " .. msToTimeStr(arg1) .. ")", 3000, "info")
  end
  showLoading(false)
end)
function showQuestions(arg0)
  eui:uiSetVisible(var0.label.QuestionNumber, arg0)
  eui:uiSetVisible(var0.label.QuestionTimer, arg0)
  eui:uiSetVisible(var0.label.Question, arg0)
  eui:uiSetVisible(var0.label.NextQuestion, arg0)
  eui:uiSetVisible(var0.progressbar.Application, arg0)
  if not arg0 then
    eui:uiSetVisible(var0.checkbox.C1, false)
    eui:uiSetVisible(var0.checkbox.C2, false)
    eui:uiSetVisible(var0.checkbox.C3, false)
    eui:uiSetVisible(var0.memo.Answer, false)
  else
    eui:uiSetVisible(var0.label.Result, false)
    eui:uiSetVisible(var0.progressbar.Result, false)
    eui:uiSetVisible(var0.label.Notes, false)
  end
end
QuestionTimer = false
QuestionTimerCount = 0
function changeQuestion(arg0)
  var0.currentID = arg0
  eui:uiSetText(var1.label.QuestionNumber, "Question #" .. tostring(arg0))
  eui:uiSetText(var1.label.Question, tostring(var0.questions[var0.chosenQuestions[var0.currentID][1]].Question))
  for forvar6 = 1, 3 do
    if var0.chosenQuestions[var0.currentID][2] == "MC" then
      eui:uiSetText(var1.checkbox["C" .. tostring(forvar6)], tostring(var0.questions[var0.chosenQuestions[var0.currentID][1]]["Choice" .. tostring(forvar6)]))
      eui:uiCheckBoxSetSelected(var1.checkbox["C" .. tostring(forvar6)], false)
      eui:uiSetVisible(var1.checkbox["C" .. tostring(forvar6)], true)
    else
      eui:uiSetVisible(var1.checkbox["C" .. tostring(forvar6)], false)
    end
  end
  if var0.chosenQuestions[var0.currentID][2] == "W" then
    eui:uiSetVisible(var1.memo.Answer, true)
    eui:uiSetText(var1.memo.Answer, "")
  else
    eui:uiSetVisible(var1.memo.Answer, false)
  end
  eui:uiProgressBarSetProgress(var1.progressbar.Application, (arg0 - 1) / var0.questionsNumber * 100)
  QuestionTimerCount = 0
  if isTimer(QuestionTimer) then
    killTimer(QuestionTimer)
  end
  eui:uiSetText(var1.label.QuestionTimer, "00:00:00")
  QuestionTimer = setTimer(function()
    QuestionTimerCount = QuestionTimerCount + 1
    eui:uiSetText(var0.label.QuestionTimer, msToTimeStr(QuestionTimerCount))
  end, 1000, 0)
end
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
addEvent("application:sendSQLInformations", true)
addEventHandler("application:sendSQLInformations", localPlayer, function(arg0, arg1, arg2, arg3, arg4)
  arg3 = tonumber(arg3)
  arg4 = tonumber(arg4)
  if arg3 and arg4 then
    var0.questionsNumber = arg3 + arg4
    var0.w_questionsNumber = arg4
  end
  AccountStatus = arg2
  var1 = {}
  var0.chosenQuestions = {}
  var0.questions = arg0
  for forvar9 = 1, var0.questionsNumber - var0.w_questionsNumber do
    while true do
    end
    ;({})[math.random(#arg0)] = true
    table.insert(var0.chosenQuestions, {
      math.random(#arg0),
      "MC"
    })
  end
  for forvar10, forvar11 in ipairs(arg1) do
    table.insert(var0.questions, forvar11)
  end
  for forvar10 = 1, var0.w_questionsNumber do
    while true do
    end
    ;({})[math.random(#arg1)] = true
    table.insert(var0.chosenQuestions, {
      #_FOR_.questions + math.random(#arg1),
      "W"
    })
  end
  while #var0.chosenQuestions ~= 0 do
    table.insert({}, var0.chosenQuestions[math.random(1, #var0.chosenQuestions)])
    table.remove(var0.chosenQuestions, (math.random(1, #var0.chosenQuestions)))
  end
  var0.currentAnswersCount = 0
  var0.answers = {}
  var0.allAnswers = {}
  var0.chosenQuestions = {}
  showQuestions(true)
  changeQuestion(1)
end)
addEvent("application:showApp", true)
addEventHandler("application:showApp", localPlayer, function(arg0, arg1)
  if arg0 == "waiting" then
    addEventHandler("onClientRender", root, MessageRender)
    setElementData(localPlayer, "loading:status", "Waiting for acceptance ...")
  elseif arg0 == "rejected" then
    triggerEvent("application:onAdminRejectApplication", localPlayer, arg1)
  else
    showCursor(true)
    showChat(false)
    eui:uiSetVisible(var0.window.Welcome, true)
    eui:uiSetVisible(var0.window.Application, false)
    eui:uiSetText(var0.label.Welcome, tostring(getElementData(localPlayer, "account")) .. [[
,
Welcome to ${color.primary}Wnash Roleplay]])
    setElementData(localPlayer, "loading:status", "Submitting application ...")
  end
  AccountStatus = arg0
end)
addEvent("application:hideApp", true)
addEventHandler("application:hideApp", localPlayer, function()
  showCursor(false)
  showChat(true)
  eui:uiSetVisible(var0.window.Welcome, false)
  eui:uiSetVisible(var0.window.Application, false)
  eui:uiSetVisible(var0.window.RejectMessage, false)
end)
function MessageRender()
  dxDrawText([[
The application was submitted to the administration
Wait until you are accepted]], var0 * 0 + 1, var1 * 0.3333 + 1, var0 * 1 + 1, var1 * 0.668 + 1, tocolor(0, 0, 0, 255), 1.2, "default", "center", "center", false, false, false, true, false)
  dxDrawText([[
The application was submitted to the administration
Wait until you are accepted]], var0 * 0, var1 * 0.3333, var0 * 1, var1 * 0.668, tocolor(255, 55, 95, 255), 1.2, "default", "center", "center", false, false, false, true, false)
  var2 = var2 + 25
  if var2 >= 360 then
    var2 = 0
  end
  dxDrawImage((var0 - 50) / 2, var1 - 100, 50, 50, "images/Loading.png", var2, 0, 0, tocolor(255, 255, 255, 190), false)
end
addEvent("application:onAdminAcceptApplication", true)
addEventHandler("application:onAdminAcceptApplication", localPlayer, function()
  if isTimer(WaitingMessageTimer) then
    killTimer(WaitingMessageTimer)
  end
  eui:uiSetVisible(var0.window.Welcome, false)
  eui:uiSetVisible(var0.window.Application, false)
  removeEventHandler("onClientRender", root, MessageRender)
end)
addEvent("application:onAdminRejectApplication", true)
addEventHandler("application:onAdminRejectApplication", localPlayer, function(arg0)
  if isTimer(WaitingMessageTimer) then
    killTimer(WaitingMessageTimer)
  end
  eui:uiSetVisible(var0.window.Welcome, false)
  eui:uiSetVisible(var0.window.Application, false)
  removeEventHandler("onClientRender", root, MessageRender)
  eui:uiSetVisible(var0.window.RejectMessage, true)
  eui:uiSetText(var0.label.RejectReason, tostring(arg0))
  setElementData(localPlayer, "loading:status", "Rejected ...")
  showCursor(true)
end)
AppM = {
  tab = {},
  edit = {},
  window = {},
  label = {},
  checkbox = {},
  tabpanel = {},
  radiobutton = {},
  gridlist = {},
  combobox = {},
  button = {},
  memo = {},
  wqmemo = {},
  wqbutton = {},
  scrollpane = {}
}
addEventHandler("onClientResourceStart", resourceRoot, function()
  AppM.window[1] = guiCreateWindow((guiGetScreenSize() - 669) / 2, (guiGetScreenSize() - 440) / 2, 669, 440, "Application Manager", false)
  guiWindowSetSizable(AppM.window[1], false)
  guiSetVisible(AppM.window[1], false)
  AppM.tabpanel[1] = guiCreateTabPanel(9, 26, 650, 374, false, AppM.window[1])
  AppM.tab[1] = guiCreateTab("Multiple Choice Questions", AppM.tabpanel[1])
  var0[AppM.tab[1]] = "questions1"
  AppM.label[1] = guiCreateLabel(20, 21, 93, 15, "Select Question:", false, AppM.tab[1])
  guiSetFont(AppM.label[1], "default-bold-small")
  AppM.combobox[1] = guiCreateComboBox(123, 16, 219, 224, "", false, AppM.tab[1])
  AppM.button[1] = guiCreateButton(352, 16, 77, 23, "Add", false, AppM.tab[1])
  AppM.button[2] = guiCreateButton(427, 304, 100, 31, "Save Changes", false, AppM.tab[1])
  AppM.radiobutton[1] = guiCreateRadioButton(20, 150, 503, 37, "", false, AppM.tab[1])
  AppM.edit[1] = guiCreateEdit(33, 3, 460, 30, "", false, AppM.radiobutton[1])
  AppM.radiobutton[2] = guiCreateRadioButton(20, 197, 503, 37, "", false, AppM.tab[1])
  AppM.edit[2] = guiCreateEdit(33, 3, 460, 30, "", false, AppM.radiobutton[2])
  AppM.radiobutton[3] = guiCreateRadioButton(20, 244, 503, 37, "", false, AppM.tab[1])
  AppM.edit[3] = guiCreateEdit(33, 3, 460, 30, "", false, AppM.radiobutton[3])
  AppM.label[2] = guiCreateLabel(20, 68, 63, 15, "Question:", false, AppM.tab[1])
  guiSetFont(AppM.label[2], "default-bold-small")
  AppM.memo[1] = guiCreateMemo(89, 61, 424, 39, "", false, AppM.tab[1])
  AppM.label[3] = guiCreateLabel(20, 125, 63, 15, "Answers:", false, AppM.tab[1])
  guiSetFont(AppM.label[3], "default-bold-small")
  AppM.button[3] = guiCreateButton(533, 304, 100, 31, "Remove", false, AppM.tab[1])
  AppM.tab[2] = guiCreateTab("Written Questions", AppM.tabpanel[1])
  var0[AppM.tab[2]] = "questions2"
  AppM.scrollpane[1] = guiCreateScrollPane(0, 0, 650, 300, false, AppM.tab[2])
  AppM.button.AddWQ = guiCreateButton(533, 304, 100, 31, "Add", false, AppM.tab[2])
  AppM.button[4] = guiCreateButton(427, 304, 100, 31, "Save Changes", false, AppM.tab[2])
  AppM.tab[3] = guiCreateTab("Applications", AppM.tabpanel[1])
  var0[AppM.tab[3]] = "applications"
  AppM.gridlist[1] = guiCreateGridList(10, 10, 630, 297, false, AppM.tab[3])
  guiGridListAddColumn(AppM.gridlist[1], "Account", 0.5)
  guiGridListAddColumn(AppM.gridlist[1], "Submit Date", 0.4)
  AppM.button[5] = guiCreateButton(10, 312, 105, 28, "-", false, AppM.tab[3])
  AppM.tab[4] = guiCreateTab("Settings", AppM.tabpanel[1])
  var0[AppM.tab[4]] = ""
  AppM.checkbox[1] = guiCreateCheckBox(20, 23, 238, 15, "Enable Application", true, false, AppM.tab[4])
  AppM.button[6] = guiCreateButton(519, 302, 114, 31, "Save Changes", false, AppM.tab[4])
  AppM.button[7] = guiCreateButton(10, 405, 649, 25, "Close", false, AppM.window[1])
  AppM.tab[5] = guiCreateTab("History", AppM.tabpanel[1])
  var0[AppM.tab[5]] = "history"
  AppM.gridlist[2] = guiCreateGridList(10, 10, 630, 297, false, AppM.tab[5])
  guiGridListAddColumn(AppM.gridlist[2], "Account", 0.2)
  guiGridListAddColumn(AppM.gridlist[2], "Status", 0.15)
  guiGridListAddColumn(AppM.gridlist[2], "SubmitDate", 0.25)
  guiGridListAddColumn(AppM.gridlist[2], "Action", 0.1)
  guiGridListAddColumn(AppM.gridlist[2], "By", 0.15)
  guiGridListAddColumn(AppM.gridlist[2], "ActionDate", 0.2)
  AppM.tab[6] = guiCreateTab("Stories", AppM.tabpanel[1])
  var0[AppM.tab[6]] = "stories"
  AppM.gridlist[3] = guiCreateGridList(10, 10, 630, 297, false, AppM.tab[6])
  guiGridListAddColumn(AppM.gridlist[3], "Character ID", 0.45)
  guiGridListAddColumn(AppM.gridlist[3], "Character Name", 0.5)
end)
AcceptApp = {
  label = {},
  button = {},
  window = {},
  gridlist = {},
  memo = {},
  edit = {}
}
addEventHandler("onClientResourceStart", resourceRoot, function()
  AcceptApp.window[1] = guiCreateWindow((guiGetScreenSize() - 705) / 2, (guiGetScreenSize() - 455) / 2, 705, 455, "", false)
  guiWindowSetSizable(AcceptApp.window[1], false)
  guiSetVisible(AcceptApp.window[1], false)
  AcceptApp.gridlist[1] = guiCreateGridList(10, 26, 685, 233, false, AcceptApp.window[1])
  guiGridListAddColumn(AcceptApp.gridlist[1], "#", 0.3)
  guiGridListAddColumn(AcceptApp.gridlist[1], "Question Type", 0.3)
  guiGridListAddColumn(AcceptApp.gridlist[1], "Time", 0.3)
  AcceptApp.label[1] = guiCreateLabel(10, 269, 685, 38, "Question", false, AcceptApp.window[1])
  guiLabelSetHorizontalAlign(AcceptApp.label[1], "center", true)
  AcceptApp.memo[1] = guiCreateMemo(10, 312, 685, 91, "", false, AcceptApp.window[1])
  AcceptApp.button[1] = guiCreateButton(10, 413, 100, 32, "Accept", false, AcceptApp.window[1])
  AcceptApp.button[2] = guiCreateButton(115, 413, 100, 32, "Reject", false, AcceptApp.window[1])
  AcceptApp.button[3] = guiCreateButton(220, 413, 100, 32, "Close", false, AcceptApp.window[1])
  AcceptApp.edit[1] = guiCreateEdit(325, 413, 300, 32, "", false, AcceptApp.window[1])
  AcceptApp.window[2] = guiCreateWindow((guiGetScreenSize() - 705) / 2, (guiGetScreenSize() - 455) / 2, 705, 455, "", false)
  guiWindowSetSizable(AcceptApp.window[2], false)
  guiSetVisible(AcceptApp.window[2], false)
  AcceptApp.memo[2] = guiCreateMemo(10, 26, 685, 300, "", false, AcceptApp.window[2])
  AcceptApp.button[4] = guiCreateButton(10, 413, 100, 32, "Accept", false, AcceptApp.window[2])
  AcceptApp.button[5] = guiCreateButton(115, 413, 100, 32, "Reject", false, AcceptApp.window[2])
  AcceptApp.button[6] = guiCreateButton(220, 413, 100, 32, "Close", false, AcceptApp.window[2])
  AcceptApp.edit[2] = guiCreateEdit(325, 413, 300, 32, "", false, AcceptApp.window[2])
end)
currentCheckAppCharacter = false
addEventHandler("onClientGUIClick", resourceRoot, function()
  if source == AppM.button[7] then
    guiSetVisible(AppM.window[1], false)
    showCursor(false)
  elseif source == AppM.button[2] then
    if guiComboBoxGetSelected(AppM.combobox[1]) ~= -1 then
      for forvar7 = 1, 3 do
        table.insert({}, {
          guiGetText(AppM.edit[forvar7]),
          guiRadioButtonGetSelected(AppM.radiobutton[forvar7])
        })
      end
      triggerServerEvent("application:updateQuestionData", localPlayer, guiComboBoxGetItemText(AppM.combobox[1], (guiComboBoxGetSelected(AppM.combobox[1]))):gsub("Question #", ""), guiGetText(AppM.memo[1]), {})
    end
  elseif source == AppM.button[4] then
    for forvar4, forvar5 in ipairs(AppM.wqmemo) do
      ({})[forvar4] = guiGetText(forvar5)
    end
    triggerServerEvent("application:changeWQuestions", localPlayer, {})
  elseif source == AppM.button[1] then
    triggerServerEvent("application:addMCQuestion", localPlayer)
  elseif source == AppM.button.AddWQ then
    triggerServerEvent("application:addWQuestion", localPlayer)
  elseif source == AppM.button[3] then
    if guiComboBoxGetSelected(AppM.combobox[1]) ~= -1 then
      triggerServerEvent("application:removeMCQuestion", localPlayer, (guiComboBoxGetItemText(AppM.combobox[1], (guiComboBoxGetSelected(AppM.combobox[1]))):gsub("Question #", "")))
    end
  elseif source == AcceptApp.button[3] then
    guiSetEnabled(AppM.window[1], true)
    guiSetVisible(AcceptApp.window[1], false)
  elseif source == AcceptApp.button[1] then
    guiSetEnabled(AppM.window[1], true)
    guiSetVisible(AcceptApp.window[1], false)
    triggerServerEvent("application:acceptAccount", localPlayer, currentCheckAppAccount)
  elseif source == AcceptApp.button[2] then
    guiSetEnabled(AppM.window[1], true)
    guiSetVisible(AcceptApp.window[1], false)
    triggerServerEvent("application:rejectAccount", localPlayer, currentCheckAppAccount, (guiGetText(AcceptApp.edit[1])))
  elseif source == AppM.button[6] then
    triggerServerEvent("application:updateSettings", localPlayer, guiCheckBoxGetSelected(AppM.checkbox[1]))
  elseif source == AcceptApp.button[4] then
    guiSetVisible(AcceptApp.window[2], false)
    triggerServerEvent("application:acceptStory", localPlayer, currentCheckAppCharacter)
  elseif source == AcceptApp.button[5] then
    guiSetVisible(AcceptApp.window[2], false)
    triggerServerEvent("application:rejectStory", localPlayer, currentCheckAppCharacter, (guiGetText(AcceptApp.edit[2])))
  elseif source == AcceptApp.button[6] then
    guiSetVisible(AcceptApp.window[2], false)
  elseif var0[source] then
    triggerServerEvent("application:removeWQuestion", localPlayer, var0[source])
  elseif source == AcceptApp.gridlist[1] and guiGridListGetSelectedItem(source) ~= -1 then
    guiSetText(AcceptApp.label[1], tostring(guiGridListGetItemData(source, guiGridListGetSelectedItem(source), 1)[2]))
    guiSetText(AcceptApp.memo[1], tostring(guiGridListGetItemData(source, guiGridListGetSelectedItem(source), 1)[3]))
  end
end)
addEventHandler("onClientGUIDoubleClick", resourceRoot, function()
  if source == AppM.gridlist[1] or source == AppM.gridlist[2] then
    if guiGridListGetSelectedItem(source) ~= -1 then
      triggerServerEvent("application:request.applicationDetails", localPlayer, guiGridListGetItemData(source, guiGridListGetSelectedItem(source), 1), source == AppM.gridlist[2])
      guiSetEnabled(source, false)
    end
  elseif source == AppM.gridlist[3] and guiGridListGetSelectedItem(source) ~= -1 then
    guiSetVisible(AcceptApp.window[2], true)
    guiBringToFront(AcceptApp.window[2])
    guiSetText(AcceptApp.memo[2], tostring(guiGridListGetItemData(source, guiGridListGetSelectedItem(source), 1).Story))
    currentCheckAppCharacter = guiGridListGetItemData(source, guiGridListGetSelectedItem(source), 1).ID
    guiSetText(AcceptApp.edit[2], "")
  end
end)
addEvent("application:response.applicationDetails", true)
addEventHandler("application:response.applicationDetails", localPlayer, function(arg0, arg1)
  if arg1 then
    guiSetEnabled(AcceptApp.button[1], false)
    guiSetEnabled(AcceptApp.button[2], false)
  else
    guiSetEnabled(AcceptApp.button[1], true)
    guiSetEnabled(AcceptApp.button[2], true)
  end
  guiSetEnabled(AppM.window[1], false)
  guiSetVisible(AcceptApp.window[1], true)
  guiBringToFront(AcceptApp.window[1])
  guiGridListClear(AcceptApp.gridlist[1])
  for forvar7, forvar8 in ipairs(arg0 or {}) do
    guiGridListSetItemText(AcceptApp.gridlist[1], guiGridListAddRow(AcceptApp.gridlist[1]), 1, tostring(forvar7), false, true)
    guiGridListSetItemText(AcceptApp.gridlist[1], guiGridListAddRow(AcceptApp.gridlist[1]), 2, tostring(forvar8[1]), false, true)
    guiGridListSetItemText(AcceptApp.gridlist[1], guiGridListAddRow(AcceptApp.gridlist[1]), 3, tostring(msToTimeStr(forvar8[4])), false, true)
    guiGridListSetItemData(AcceptApp.gridlist[1], guiGridListAddRow(AcceptApp.gridlist[1]), 1, forvar8)
    if forvar8[1] == "MC" then
      if forvar8[5] then
        guiGridListSetItemColor(AcceptApp.gridlist[1], guiGridListAddRow(AcceptApp.gridlist[1]), 1, 0, 255, 0)
        guiGridListSetItemColor(AcceptApp.gridlist[1], guiGridListAddRow(AcceptApp.gridlist[1]), 2, 0, 255, 0)
        guiGridListSetItemColor(AcceptApp.gridlist[1], guiGridListAddRow(AcceptApp.gridlist[1]), 3, 0, 255, 0)
      else
        guiGridListSetItemColor(AcceptApp.gridlist[1], guiGridListAddRow(AcceptApp.gridlist[1]), 1, 255, 0, 0)
        guiGridListSetItemColor(AcceptApp.gridlist[1], guiGridListAddRow(AcceptApp.gridlist[1]), 2, 255, 0, 0)
        guiGridListSetItemColor(AcceptApp.gridlist[1], guiGridListAddRow(AcceptApp.gridlist[1]), 3, 255, 0, 0)
      end
    end
  end
  guiSetEnabled(arg1 and AppM.gridlist[2] or AppM.gridlist[1], true)
  guiSetText(AcceptApp.window[1], "Application (" .. tostring(guiGridListGetItemText(arg1 and AppM.gridlist[2] or AppM.gridlist[1], guiGridListGetSelectedItem(arg1 and AppM.gridlist[2] or AppM.gridlist[1]), 1)) .. ") - Total Time: " .. msToTimeStr(0 + tonumber(forvar8[4])))
  currentCheckAppAccount = guiGridListGetItemText(arg1 and AppM.gridlist[2] or AppM.gridlist[1], guiGridListGetSelectedItem(arg1 and AppM.gridlist[2] or AppM.gridlist[1]), 1)
  guiSetText(AcceptApp.edit[1], "")
  guiSetText(AcceptApp.label[1], "")
  guiSetText(AcceptApp.memo[1], "")
end)
addEventHandler("onClientGUIComboBoxAccepted", resourceRoot, function()
  if source == AppM.combobox[1] then
    for forvar5, forvar6 in ipairs(var0) do
      if forvar6.ID == tonumber((guiComboBoxGetItemText(source, guiComboBoxGetSelected(source)):gsub("Question #", ""))) then
        break
      end
    end
    guiSetText(AppM.memo[1], var0[forvar5].Question)
    guiSetText(AppM.edit[1], var0[forvar5].Choice1)
    guiSetText(AppM.edit[2], var0[forvar5].Choice2)
    guiSetText(AppM.edit[3], var0[forvar5].Choice3)
    guiRadioButtonSetSelected(AppM.radiobutton[tonumber(var0[forvar5].CorrectChoice)], true)
  end
end)
addEvent("application:showApplicationManager", true)
addEventHandler("application:showApplicationManager", localPlayer, function(arg0, arg1)
  guiSetVisible(AppM.window[1], true)
  showCursor(true)
  guiSetEnabled(AppM.tab[1], arg0)
  guiSetEnabled(AppM.tab[2], arg0)
  guiSetEnabled(AppM.tab[4], arg0)
  guiSetEnabled(AppM.tab[3], arg1)
end)
addEvent("application:sendSQLInformations:2", true)
addEventHandler("application:sendSQLInformations:2", localPlayer, function(arg0, arg1, arg2)
  if arg1 == "questions1" then
    var0 = arg0
    guiComboBoxClear(AppM.combobox[1])
    for forvar6, forvar7 in ipairs(arg0) do
      guiComboBoxAddItem(AppM.combobox[1], "Question #" .. tostring(forvar7.ID))
    end
    guiSetText(AppM.memo[1], "")
    guiSetText(AppM.edit[1], "")
    guiSetText(AppM.edit[2], "")
    guiSetText(AppM.edit[3], "")
    guiRadioButtonSetSelected(AppM.radiobutton[1], false)
    guiRadioButtonSetSelected(AppM.radiobutton[2], false)
    guiRadioButtonSetSelected(AppM.radiobutton[3], false)
  elseif arg1 == "questions2" then
    if #AppM.wqmemo == #arg0 then
      for forvar6, forvar7 in ipairs(arg0) do
        guiSetText(AppM.wqmemo[forvar6], tostring(forvar7.Question))
      end
    else
      for forvar6, forvar7 in ipairs(AppM.wqmemo) do
        destroyElement(forvar7)
      end
      for forvar6, forvar7 in ipairs(AppM.wqbutton) do
        destroyElement(forvar7)
      end
      AppM.wqmemo = {}
      AppM.wqbutton = {}
      var1 = {}
      for forvar6, forvar7 in ipairs(arg0) do
        AppM.wqmemo[forvar6] = guiCreateMemo(10, 15 + 85 * (forvar6 - 1), 630, 60, tostring(forvar7.Question), false, AppM.scrollpane[1])
        AppM.wqbutton[forvar6] = guiCreateButton(20, 15 + 85 * (forvar6 - 1) + 60, 610, 20, "Remove", false, AppM.scrollpane[1])
        var1[AppM.wqbutton[forvar6]] = forvar7.ID
      end
    end
  elseif arg1 == "applications" then
    guiGridListClear(AppM.gridlist[1])
    for forvar6, forvar7 in ipairs(arg0) do
      guiGridListSetItemText(AppM.gridlist[1], guiGridListAddRow(AppM.gridlist[1]), 1, tostring(forvar7.Account), false, false)
      guiGridListSetItemData(AppM.gridlist[1], guiGridListAddRow(AppM.gridlist[1]), 1, forvar7.ID)
      guiGridListSetItemData(AppM.gridlist[1], guiGridListAddRow(AppM.gridlist[1]), 2, tostring(forvar7.SubmitDate))
    end
  elseif arg1 == "history" then
    guiGridListClear(AppM.gridlist[1])
    guiGridListClear(AppM.gridlist[2])
    for forvar6, forvar7 in ipairs(arg0) do
      guiGridListSetItemText(AppM.gridlist[2], guiGridListAddRow(AppM.gridlist[2]), 1, tostring(forvar7.Account), false, false)
      guiGridListSetItemData(AppM.gridlist[2], guiGridListAddRow(AppM.gridlist[2]), 1, forvar7.ID)
      guiGridListSetItemText(AppM.gridlist[2], guiGridListAddRow(AppM.gridlist[2]), 2, tostring(forvar7.AppStatus), false, false)
      guiGridListSetItemText(AppM.gridlist[2], guiGridListAddRow(AppM.gridlist[2]), 3, tostring(forvar7.SubmitDate), false, false)
      guiGridListSetItemText(AppM.gridlist[2], guiGridListAddRow(AppM.gridlist[2]), 4, tostring(forvar7.Action), false, false)
      guiGridListSetItemText(AppM.gridlist[2], guiGridListAddRow(AppM.gridlist[2]), 5, tostring(forvar7.ActionBy), false, false)
      guiGridListSetItemText(AppM.gridlist[2], guiGridListAddRow(AppM.gridlist[2]), 6, tostring(forvar7.ActionDate), false, false)
    end
  elseif arg1 == "stories" then
    guiGridListClear(AppM.gridlist[3])
    for forvar6, forvar7 in ipairs(arg0) do
      guiGridListSetItemText(AppM.gridlist[3], guiGridListAddRow(AppM.gridlist[3]), 1, tostring(forvar7.ID), false, false)
      guiGridListSetItemText(AppM.gridlist[3], guiGridListAddRow(AppM.gridlist[3]), 2, tostring(forvar7.Name), false, false)
      guiGridListSetItemData(AppM.gridlist[3], guiGridListAddRow(AppM.gridlist[3]), 1, forvar7)
    end
  end
  guiCheckBoxSetSelected(AppM.checkbox[1], arg2 == "true")
end)
bindKey("F10", "down", function()
  if guiGetVisible(AppM.window[1]) then
    guiSetVisible(AppM.window[1], false)
    showCursor(false)
  else
    triggerServerEvent("application:RequestSowApplicationManager", localPlayer)
  end
end)
addEventHandler("onClientGUITabSwitched", resourceRoot, function()
  if not var0[source] then
    return
  end
  triggerServerEvent("application:callSQLInformations:2", localPlayer, var0[source])
end)
