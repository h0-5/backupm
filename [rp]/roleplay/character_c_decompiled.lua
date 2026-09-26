-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

addEvent("onClientPlayerQuitFromCharacter", false)
lobby = {
  character = false,
  section = 1,
  selectAnim = {
    getTickCount(),
    30,
    0,
    30,
    0,
    30,
    0
  },
  selectCharAnim = {
    getTickCount(),
    100 * (guiGetScreenSize() / 1080),
    0,
    100 * (guiGetScreenSize() / 1080),
    0,
    100 * (guiGetScreenSize() / 1080),
    0
  },
  selectedCharacter = 1,
  blur = false,
  characterInfo = {
    state = false,
    name = "",
    details = ""
  },
  fonts = {
    [2] = {font = false, size = 1}
  },
  cam = {
    main = ({
      {
        706.1298,
        -1690.823,
        3.4375,
        180
      },
      {
        1096.57,
        -2238.263,
        49.3593,
        226.21467590332
      },
      {
        1025.306,
        -2195.153,
        39.1406,
        112.47149658203
      },
      {
        2531.5,
        -1666.171,
        15.1677,
        117.15173339844
      }
    })[math.random(1, #{
      {
        706.1298,
        -1690.823,
        3.4375,
        180
      },
      {
        1096.57,
        -2238.263,
        49.3593,
        226.21467590332
      },
      {
        1025.306,
        -2195.153,
        39.1406,
        112.47149658203
      },
      {
        2531.5,
        -1666.171,
        15.1677,
        117.15173339844
      }
    })],
    count = getTickCount(),
    currentDim = {
      0,
      0,
      0,
      0,
      0,
      0
    },
    fromDim = {
      0,
      0,
      0,
      0,
      0,
      0
    },
    toDim = {
      0,
      0,
      0,
      0,
      0,
      0
    }
  },
  profilePic = false,
  account = "None",
  tabs = {
    "Characters",
    "Create Character",
    "Latest news",
    "History"
  },
  tab_width = {},
  topBarHeight = 50
}
for forvar18, forvar19 in ipairs({
  {
    id = "select_character",
    text = "CHARACTERS"
  },
  {
    id = "create_character",
    text = "CREATE CHARACTER"
  },
  {
    id = "latest_news",
    text = "LATEST NEWS"
  },
  {id = "history", text = "HISTORY"},
  {
    id = "reset_password",
    text = "RESET PASSWORD"
  }
}) do
  ({
    {
      id = "select_character",
      text = "CHARACTERS"
    },
    {
      id = "create_character",
      text = "CREATE CHARACTER"
    },
    {
      id = "latest_news",
      text = "LATEST NEWS"
    },
    {id = "history", text = "HISTORY"},
    {
      id = "reset_password",
      text = "RESET PASSWORD"
    }
  })[forvar18].width = dxGetTextWidth(forvar19.text, 1.2 * (guiGetScreenSize() / 1080), false or "default-bold") + 50
end
CurHeight, CurWeight, CurAge = 130, 40, 10
function UIKitReady()
  eui = exports.UIKit
  uiFont = eui:getUIFont("default-large")
  var0 = eui:getUIFont("hud-large")
  var1 = 0.38
  var2 = dxGetFontHeight(var1, var0) * 1.5
  for forvar4, forvar5 in ipairs(var3) do
    var3[forvar4].width = dxGetTextWidth(forvar5.text, var1, var0) + 50
  end
  var4.window.create_character = eui:uiCreateRectangle(eui:uiGetReferenceScreenSize() - 450, false, 300, 630, "bg_default", true, true, true, true)
  eui:uiSetVisible(var4.window.create_character, false)
  eui:uiCreateRectangle((300 - 300 / 2) / 2, 0, 300 / 2, 5, "primary", false, false, false, false, var4.window.create_character)
  eui:uiCreateRectangle((300 - 300 / 2) / 2, 630 - 5, 300 / 2, 5, "primary", false, false, false, false, var4.window.create_character)
  var4.edit.Name = eui:uiCreateEdit(20, 30, 300 - 40, 30, "", {
    en = "Character name",
    ar = "\216\167\216\179\217\133 \216\167\217\132\216\180\216\174\216\181\217\138\216\169"
  }, _, var4.window.create_character)
  eui:uiCreateLabel(20, 70, 300 - 40, 50, [[
Do not use unrealistic names or those
based on famous people and characters.]], tocolor(255, 255, 255, 160), "left", "top", var4.window.create_character)
  eui:uiCreateRectangle(0, 120, 300, 1, tocolor(255, 255, 255, 10), false, false, false, false, var4.window.create_character)
  var4.label.Birthday = eui:uiCreateLabel(20, 130, 230, 20, {
    en = "Your Character Birthday:",
    ar = "\216\170\216\167\216\177\217\138\216\174 \216\167\217\132\217\133\217\138\217\132\216\167\216\175:"
  }, "primary", "left", "top", var4.window.create_character)
  var4.edit.Day = eui:uiCreateEdit(20, 160, 50, 20, "", {en = "dd", ar = "\216\167\217\132\217\138\217\136\217\133"}, _, var4.window.create_character)
  var4.edit.Month = eui:uiCreateEdit(75, 160, 50, 20, "", {en = "mm", ar = "\216\167\217\132\216\180\217\135\216\177"}, _, var4.window.create_character)
  var4.edit.Year = eui:uiCreateEdit(130, 160, 80, 20, "", {en = "yyyy", ar = "\216\167\217\132\216\179\217\134\216\169"}, _, var4.window.create_character)
  var4.label.Birthplace = eui:uiCreateLabel(20, 200, 230, 20, {
    en = "Birthplace:",
    ar = "\217\133\217\131\216\167\217\134 \216\167\217\132\217\136\217\132\216\167\216\175\216\169:"
  }, "primary", "left", "top", var4.window.create_character)
  var4.edit.Birthplace = eui:uiCreateEdit(20, 230, 300 - 40, 20, "", "EX: Los Santos, Metro Los Santos...", _, var4.window.create_character)
  var4.label.Language = eui:uiCreateLabel(20, 270, 230, 20, {
    en = "Language:",
    ar = "\216\167\217\132\217\132\216\186\216\169:"
  }, "primary", "left", "top", var4.window.create_character)
  var4.combobox.Language = eui:uiCreateComboBox(20, 300, 300 - 40, 20, "Language", tocolor(255, 255, 255), var4.window.create_character)
  for forvar8, forvar9 in ipairs(Languages) do
    eui:uiComboBoxAddItem(var4.combobox.Language, forvar9)
  end
  eui:uiCreateRectangle(0, 340, 300, 1, tocolor(255, 255, 255, 10), false, false, false, false, var4.window.create_character)
  var4.label.Height = eui:uiCreateLabel(20, 360, 300 - 40, 20, {
    en = "Height:",
    ar = "\216\167\217\132\216\183\217\136\217\132:"
  }, "primary", "left", "top", var4.window.create_character)
  var4.scrollbar.Height = eui:uiCreateScrollBar(20, 360 + 25, 300 - 40, 10, tocolor(204, 199, 199), tocolor(56, 49, 49), true, var4.window.create_character)
  var4.label.Weight = eui:uiCreateLabel(20, 360 + 45, 300 - 40, 20, {
    en = "Weight:",
    ar = "\216\167\217\132\217\136\216\178\217\134:"
  }, "primary", "left", "top", var4.window.create_character)
  var4.scrollbar.Weight = eui:uiCreateScrollBar(20, 360 + 70, 300 - 40, 10, tocolor(204, 199, 199), tocolor(56, 49, 49), true, var4.window.create_character)
  var4.label.Heritage = eui:uiCreateLabel(20, 360 + 100, 230, 20, {
    en = "Heritage:",
    ar = "\216\167\217\132\216\185\216\177\217\130:"
  }, "primary", "left", "top", var4.window.create_character)
  var4.checkbox.Heritage = eui:uiCreateSwitch((300 - 40) / 2, 360 + 130, 40, 15, "", false, tocolor(120, 120, 120), var4.window.create_character)
  eui:uiCreateLabel(10, 360 + 130, (300 - 40) / 2 - 10, 20, {en = "White", ar = "\216\163\216\168\217\138\216\182"}, tocolor(255, 255, 255, 160), "center", "top", var4.window.create_character)
  eui:uiCreateLabel((300 - 40) / 2 + 55, 360 + 130, (300 - 40) / 2 - 20, 20, {en = "Black", ar = "\216\163\216\179\217\136\216\175"}, tocolor(255, 255, 255, 160), "center", "top", var4.window.create_character)
  var4.checkbox.Gender = eui:uiCreateSwitch((300 - 40) / 2, 360 + 160, 40, 15, "", false, tocolor(120, 120, 120), var4.window.create_character)
  eui:uiCreateLabel(10, 360 + 160, (300 - 40) / 2 - 10, 20, {en = "Male", ar = "\216\176\217\131\216\177"}, tocolor(255, 255, 255, 160), "center", "top", var4.window.create_character)
  eui:uiCreateLabel((300 - 40) / 2 + 55, 360 + 160, (300 - 40) / 2 - 20, 20, {en = "Female", ar = "\216\163\217\134\216\171\217\137"}, tocolor(255, 255, 255, 160), "center", "top", var4.window.create_character)
  var4.button.CreateCharacter = eui:uiCreateButton(15, 630 - 55, 300 - 30, 35, {
    en = "Create Character",
    ar = "\216\181\217\134\216\185 \216\167\217\132\216\180\216\174\216\181\217\138\216\169"
  }, _, var4.window.create_character)
  var4.window.CharacterInfo = eui:uiCreateRectangle(eui:uiGetReferenceScreenSize() - 300, false, 250, 500, "bg_default", true, true, true, true)
  eui:uiSetVisible(var4.window.CharacterInfo, false)
  var4.label.CharacterInfo_1 = eui:uiCreateLabel(10, 15, 230, 60, "", tocolor(255, 255, 255, 240), "left", "top", var4.window.CharacterInfo)
  eui:uiSetFont(var4.label.CharacterInfo_1, "default-large")
  var4.label.CharacterInfo_2 = eui:uiCreateLabel(10, 85, 230, 340, "", tocolor(255, 255, 255, 240), "left", "top", var4.window.CharacterInfo)
  eui:uiSetProperty(var4.label.CharacterInfo_2, "word_break", true)
  var4.button.RemoveCharacter = eui:uiCreateButton(10, 450, 230, 35, {
    en = "Remove Character",
    ar = "\216\173\216\176\217\129 \216\167\217\132\216\180\216\174\216\181\217\138\216\169"
  }, _, var4.window.CharacterInfo)
  eui:uiCreateRectangle(62.5, 0, 125, 5, "primary", false, false, false, false, var4.window.CharacterInfo)
  eui:uiCreateRectangle(62.5, 495, 125, 5, "primary", false, false, false, false, var4.window.CharacterInfo)
  var4.button.Play = eui:uiCreateButton((eui:uiGetReferenceScreenSize() - 200) / 2, eui:uiGetReferenceScreenSize() - 60, 200, 50, "Play", var5)
  eui:uiSetFont(var4.button.Play, var0)
  eui:uiSetFontSize(var4.button.Play, var1)
  eui:uiSetProperty(var4.button.Play, "HoverTextColor", (eui:uiGetThemeColor("primary")))
  eui:uiSetVisible(var4.button.Play, false)
  var4.button.Story = eui:uiCreateButton(20, 480, 250, 30, "Character Story", "primary")
  eui:uiSetVisible(var4.button.Story, false)
  var4.window.Story = eui:uiCreateRectangle((eui:uiGetReferenceScreenSize() - 500) / 2, (eui:uiGetReferenceScreenSize() - 360) / 2, 500, 360, tocolor(20, 20, 20, 230), true, true, true, true)
  eui:uiSetVisible(var4.window.Story, false)
  var4.label.Story = eui:uiCreateLabel(15, 10, 232, 30, "Character Story", tocolor(255, 255, 255, 255), "left", "top", var4.window.Story)
  eui:uiSetFont(var4.label.Story, "default-large")
  var4.memo.Story = eui:uiCreateMemo(10, 45, 480, 260, "", tocolor(5, 5, 5, 240), var4.window.Story)
  eui:uiSetProperty(var4.memo.Story, "TextColor", tocolor(255, 255, 255, 255))
  var4.button.CloseStory = eui:uiCreateButton(10, 320, 480, 30, "Hide", tocolor(0, 0, 0, 255), var4.window.Story)
  var4.label.RespawnScreen = eui:uiCreateLabel(0, eui:uiGetReferenceScreenSize() - 100, eui:uiGetReferenceScreenSize())
  eui:uiSetVisible(var4.label.RespawnScreen, false)
  var4.button.Respawn = eui:uiCreateButton((eui:uiGetReferenceScreenSize() - 100) / 2, 0, 100, 30, "Respawn", "primary", var4.label.RespawnScreen)
  if getElementData(localPlayer, "character:id") and isPedDead(localPlayer) then
    showRespawnScreen()
  end
end
addEventHandler("onClientUIReady", resourceRoot, UIKitReady)
addEventHandler("onClientUIKitReady", root, UIKitReady)
;({
  creation_status = false,
  selection_status = false,
  elements = {},
  selectedID = false,
  currentCharacters = {},
  showPed = false,
  maxCharacters = 3
}).creation = function(arg0)
  if arg0 then
    setElementData(localPlayer, "loading:status", "Creating character ...")
    eui:uiSetVisible(var0.window.create_character, true)
    eui:uiSetText(var0.edit.Name, "")
    eui:uiSetText(var0.edit.Day, "")
    eui:uiSetText(var0.edit.Month, "")
    eui:uiSetText(var0.edit.Year, "")
    eui:uiSetText(var0.edit.Birthplace, "")
    eui:uiScrollBarSetScrollPosition(var0.scrollbar.Height, 0)
    eui:uiScrollBarSetScrollPosition(var0.scrollbar.Weight, 0)
    eui:uiSetText(var0.label.Height, "Height:")
    eui:uiSetText(var0.label.Weight, "Weight:")
    eui:uiSetText(var0.memo.Story, "")
    if not isElement(var1.showPed) then
      var1.showPed = createPed(0, unpack(lobby.cam.main))
      setElementDimension(var1.showPed, 65499)
      setPedAnimation(var1.showPed, getRandomAnim()[1], getRandomAnim()[2], -1, true, false, false, false)
    else
      exports["skin-system"]:removeSkinFromPlayer(var1.showPed)
    end
    setElementModel(var1.showPed, var2[1].White[1])
    currentSelectedSkin = 1
    exports.notifications:showDirective("Press left or right to change skin", tocolor(255, 255, 255, 255))
    bindKey("arrow_r", "down", var1.changeModel)
    bindKey("arrow_l", "down", var1.changeModel)
  else
    exports.notifications:hideDirective()
    eui:uiSetVisible(var0.window.create_character, false)
    unbindKey("arrow_r", "down", var1.changeModel)
    unbindKey("arrow_l", "down", var1.changeModel)
  end
end
CurHeight, CurWeight, CurAge = 130, 40, 10
addEventHandler("onClientUIScroll", root, function()
  if source == var0.scrollbar.Height then
    CurHeight = 130 + math.floor(eui:uiScrollBarGetScrollPosition(source) / 1.5)
    eui:uiSetText(var0.label.Height, "Height: " .. tostring(CurHeight) .. " cm")
  elseif source == var0.scrollbar.Weight then
    CurWeight = 40 + math.floor(eui:uiScrollBarGetScrollPosition(source) / 1.5)
    eui:uiSetText(var0.label.Weight, "Weight: " .. tostring(CurWeight) .. " kg")
  end
end)
addEventHandler("onClientUIClick", root, function()
  if source == var0.checkbox.Heritage then
    setElementModel(var1.showPed, var2[eui:uiSwitchGetSelected(var0.checkbox.Gender) and 2 or 1][eui:uiSwitchGetSelected(source) and "Black" or "White"][1])
    currentSelectedSkin = 1
  elseif source == var0.checkbox.Gender then
    setElementModel(var1.showPed, var2[eui:uiSwitchGetSelected(source) and 2 or 1][eui:uiSwitchGetSelected(var0.checkbox.Heritage) and "Black" or "White"][1])
    currentSelectedSkin = 1
  elseif source == var0.button.Story then
    eui:uiSetVisible(var0.window.Story, not eui:uiGetVisible(var0.window.Story))
  elseif source == var0.button.CloseStory then
    eui:uiSetVisible(var0.window.Story, false)
  elseif source == var0.button.RemoveCharacter then
    if (getTickCount() - var3) / 1000 < 5 then
      return
    end
    var3 = getTickCount()
    if var1.selectedID then
      if var4[var1.selectedID] then
        if string.find(var4[var1.selectedID], "rejected", 1, true) then
          triggerServerEvent("character:remove", localPlayer, var1.selectedID)
        else
          exports.notifications:output({
            en = "You can only remove rejected characters",
            ar = "\217\138\217\133\217\131\217\134\217\131 \216\173\216\176\217\129 \216\167\217\132\216\180\216\174\216\181\217\138\216\167\216\170 \216\167\217\132\217\133\216\177\217\129\217\136\216\182\216\169 \217\129\217\130\216\183"
          }, 5000, "error", "right")
        end
      else
        triggerServerEvent("character:remove", localPlayer, var1.selectedID)
      end
    end
  end
end)
;({
  creation_status = false,
  selection_status = false,
  elements = {},
  selectedID = false,
  currentCharacters = {},
  showPed = false,
  maxCharacters = 3
}).changeModel = function(arg0, arg1)
  if not eui:uiGetVisible(var0.window.Story) then
    if arg0 ~= "arrow_l" or not math.max(currentSelectedSkin - 1, 1) then
    end
    currentSelectedSkin = math.min(currentSelectedSkin + 1, #var1[eui:uiSwitchGetSelected(var0.checkbox.Gender) and 2 or 1][eui:uiSwitchGetSelected(var0.checkbox.Heritage) and "Black" or "White"])
    setElementModel(var2.showPed, var1[eui:uiSwitchGetSelected(var0.checkbox.Gender) and 2 or 1][eui:uiSwitchGetSelected(var0.checkbox.Heritage) and "Black" or "White"][currentSelectedSkin])
  end
end
function checkBirthDate(arg0, arg1, arg2)
  if not tonumber(arg2) or not tonumber(arg0) or not tonumber(arg1) then
    return false
  end
  if #arg2 ~= 4 or not (#arg1 >= 1) or not (#arg0 >= 1) then
    return false
  end
  if tonumber(arg0) < 1 or tonumber(arg0) > 31 then
    return false
  end
  if tonumber(arg1) < 1 or tonumber(arg1) > 12 then
    return false
  end
  if tonumber(arg2) < 1920 then
    return false
  end
  return true
end
;({
  creation_status = false,
  selection_status = false,
  elements = {},
  selectedID = false,
  currentCharacters = {},
  showPed = false,
  maxCharacters = 3
}).clickCreate = function()
  if var0 then
    exports.notifications:output({
      en = "Wait please",
      ar = "\216\167\217\134\216\170\216\184\216\177 \217\133\217\134 \217\129\216\182\217\132\217\131"
    }, 3000, "info")
    return
  end
  for forvar10, forvar11 in ipairs((split(eui:uiGetText(var1.edit.Name), " "))) do
    if not isASCII(forvar11) then
      break
    end
  end
  if utfLen((eui:uiGetText(var1.edit.Name))) == 0 then
    exports.notifications:output({
      en = "Enter character name",
      ar = "\216\163\216\175\216\174\217\132 \216\167\216\179\217\133 \216\167\217\132\216\180\216\174\216\181\217\138\216\169"
    }, 8000, "error")
    return
  end
  if utfSub(eui:uiGetText(var1.edit.Name), 1, 1) == " " then
    exports.notifications:output({
      en = "There is a space at the beginning of the name",
      ar = "\217\138\217\136\216\172\216\175 \217\133\216\179\216\167\217\129\216\169 \217\129\217\138 \216\168\216\175\216\167\217\138\216\169 \216\167\216\179\217\133 \216\167\217\132\216\180\216\174\216\181\217\138\216\169"
    }, 8000, "error")
    return
  end
  if utfSub(eui:uiGetText(var1.edit.Name), utfLen((eui:uiGetText(var1.edit.Name))), (utfLen((eui:uiGetText(var1.edit.Name))))) == " " then
    exports.notifications:output({
      en = "There is a space at the end of the name",
      ar = "\217\138\217\136\216\172\216\175 \217\133\216\179\216\167\217\129\216\169 \217\129\217\138 \217\134\217\135\216\167\217\138\216\169 \216\167\216\179\217\133 \216\167\217\132\216\180\216\174\216\181\217\138\216\169"
    }, 8000, "error")
    return
  end
  if string.match(eui:uiGetText(var1.edit.Name), "%d+") then
    exports.notifications:output({
      en = "The character name must not contain numbers",
      ar = "\217\138\216\172\216\168 \216\163\217\134 \217\132\216\167 \217\138\216\173\216\170\217\136\217\138 \216\167\216\179\217\133 \216\167\217\132\216\180\216\174\216\181\217\138\216\169 \216\185\217\132\217\137 \216\163\216\177\217\130\216\167\217\133"
    }, 8000, "error")
    return
  end
  if not string.match(eui:uiGetText(var1.edit.Name), "^[+-]?%a+%s[%a+'?.?]+%a$") then
    exports.notifications:output({
      en = "Invalid character name",
      ar = "\216\167\216\179\217\133 \216\167\217\132\216\180\216\174\216\181\217\138\216\169 \216\186\217\138\216\177 \216\181\216\167\217\132\216\173"
    }, 6000, "error")
    return
  end
  if not checkBirthDate(eui:uiGetText(var1.edit.Day), eui:uiGetText(var1.edit.Month), (eui:uiGetText(var1.edit.Year))) then
    exports.notifications:output({
      en = "Error in birthday",
      ar = "\216\174\216\183\216\163 \217\129\217\138 \216\170\216\167\216\177\217\138\216\174 \216\167\217\132\217\133\217\138\217\132\216\167\216\175"
    }, 3000, "error")
    return
  end
  if eui:uiGetText(var1.edit.Birthplace) == "" then
    exports.notifications:output({
      en = "Enter birth place",
      ar = "\216\167\217\131\216\170\216\168 \217\133\217\131\216\167\217\134 \216\167\217\132\217\136\217\132\216\167\216\175\216\169"
    }, 3000, "error")
    return
  end
  if eui:uiComboBoxGetSelected(var1.combobox.Language) == -1 then
    exports.notifications:output({
      en = "Select the language please",
      ar = "\216\167\217\132\216\177\216\172\216\167\216\161 \216\167\216\174\216\170\217\138\216\167\216\177 \216\167\217\132\217\132\216\186\216\169"
    }, 3000, "error")
    return
  end
  if false and utfLen((eui:uiGetText(var1.edit.Name))) >= 5 and utfLen((eui:uiGetText(var1.edit.Name))) <= 22 then
    var0 = true
    triggerServerEvent("character:createCharacter", localPlayer, eui:uiGetText(var1.edit.Name), CurHeight, CurWeight, eui:uiGetText(var1.edit.Year), eui:uiSwitchGetSelected(var1.checkbox.Gender) and 2 or 1, {
      eui:uiGetText(var1.edit.Day),
      (eui:uiGetText(var1.edit.Month))
    }, {
      Race = eui:uiSwitchGetSelected(var1.checkbox.Heritage) and 1 or 0
    }, getElementModel(var2.showPed), eui:uiComboBoxGetItemText(var1.combobox.Language, (eui:uiComboBoxGetSelected(var1.combobox.Language))), eui:uiGetText(var1.edit.Birthplace), (eui:uiGetText(var1.memo.Story)))
  else
    exports.notifications:output("The name must be in the form (FirstName SecondName)", 8000, "error")
  end
end
addEventHandler("onClientUIChanged", root, function()
  if source == var0.edit.Name and eui:uiGetText(source) ~= "" then
    eui:uiSetText(var0.edit.Name, (eui:uiGetText(source):gsub("_", " "):gsub("%s+", " "):gsub("(%a)([%w_]*)", var1)))
  end
end)
addEvent("character:createCharacter.callback", true)
addEventHandler("character:createCharacter.callback", root, function(arg0)
  var0 = false
  if arg0 then
    selectTab(1)
  end
end)
addEvent("character:spawn.callback", true)
addEventHandler("character:spawn.callback", root, function(arg0, arg1)
  if arg0 then
    var0.showSelection(false)
    setCameraMatrix(getPointFromDistanceRotation(unpack(lobby.cam.main)))
  else
    exports.public:loading("character:spawn", false)
    exports.notifications:sendNotification("#FF0000ERROR", arg1, 4000, false, "center")
  end
  if var0.selectedID then
    var1[var0.selectedID] = arg1
  end
  var2 = false
end)
addEvent("onClientCharacterRespawn", true)
addEventHandler("onClientCharacterRespawn", root, function(arg0)
  clearChatBox()
end)
Languages = {
  "English",
  "Arabic",
  "Russian",
  "Spanish",
  "French"
}
function isASCII(arg0)
  for forvar4 = 1, #arg0 do
    if arg0:byte(forvar4) < 33 or arg0:byte(forvar4) > 126 then
      return false
    end
  end
  return _FOR_
end
addEvent("onClientCharacterSpawn", false)
addEvent("character:spawn", true)
addEventHandler("character:spawn", root, function(arg0)
  exports.public:loading("character:spawn", false)
  stopLoginMusic()
  clearChatBox()
  for forvar4 = 1, 2 do
    outputChatBox(" ")
  end
  _FOR_.notifications:showDirective("You're currently playing with #ff375f" .. tostring(getElementData(localPlayer, "character:name")) .. [[
#FFFFFF
type #FF0000/cinfo#FFFFFF for more information about your character]], tocolor(255, 255, 255, 255), 10000)
  triggerEvent("onClientCharacterSpawn", localPlayer, arg0)
end)
current_character = false
addEvent("rp:character:cache", true)
addEventHandler("rp:character:cache", root, function(arg0)
  arg0.Info = fromJSON(arg0.Info)
  arg0.Data = fromJSON(arg0.Data)
  current_character_stats = fromJSON(arg0.stats)
  current_character = arg0
end)
function getCharacter()
  return current_character
end
function getPointFromDistanceRotation(arg0, arg1, arg2, arg3)
  return arg0 + math.cos((math.rad(90 - arg3))) * arg2, arg1 + math.sin((math.rad(90 - arg3))) * arg2
end
addEvent("rp:getProfile.callback", true)
addEventHandler("rp:getProfile.callback", localPlayer, function(arg0, arg1)
  if arg1 then
    if lobby.profilePic then
      destroyElement(lobby.profilePic)
    end
    lobby.profilePic = dxCreateTexture(tostring(arg1))
  end
  lobby.account = arg0
end)
addEvent("character:onAdminRejectStory", true)
addEventHandler("character:onAdminRejectStory", localPlayer, function(arg0, arg1, arg2)
  if var0.selection_status and var0.currentCharacters[lobby.selectedCharacter].Name == arg1 then
    exports.notifications:sendNotification("#FF0000Character Story", "Your character story (" .. tostring(arg1) .. [[
)
rejected by admin
Reason: ]] .. tostring(arg2), 15000, false, "center")
  end
end)
;({
  creation_status = false,
  selection_status = false,
  elements = {},
  selectedID = false,
  currentCharacters = {},
  showPed = false,
  maxCharacters = 3
}).showSelection = function(arg0, arg1)
  var0.selection_status = arg0
  showCursor(arg0)
  showChat(not arg0)
  for forvar5, forvar6 in ipairs(var0.elements) do
    exports["skin-system"]:removeSkinFromPlayer(forvar6)
    destroyElement(forvar6)
  end
  var0.elements = {}
  if arg0 then
    var1 = {}
    clearChatBox()
    if arg1 ~= var0.currentCharacters then
      var2 = {}
    end
    var0.currentCharacters = arg1 or var0.currentCharacters
    if not var0.currentCharacters[lobby.selectedCharacter] and #var0.currentCharacters ~= 0 then
      lobby.selectedCharacter = 1
      lobby.selectCharAnim[1] = getTickCount()
      lobby.selectCharAnim[2] = lobby.selectCharAnim[6]
      lobby.selectCharAnim[3] = lobby.selectCharAnim[7]
      lobby.selectCharAnim[4] = 100 * var3
      lobby.selectCharAnim[5] = dxGetTextWidth(var0.currentCharacters[lobby.selectedCharacter].Name, var4, var5)
    end
    setElementData(localPlayer, "loading:status", "Selecting character ...")
    lobby.cam.count = getTickCount()
    lobby.cam.fromDim = {
      getPointFromDistanceRotation(unpack(lobby.cam.main))
    }
    setCameraMatrix(getPointFromDistanceRotation(unpack(lobby.cam.main)))
    lobby.cam.toDim = {
      getPointFromDistanceRotation(unpack(lobby.cam.main))
    }
    var0.lastskin = 0
    if var0.currentCharacters[lobby.selectedCharacter] then
      if isElement(var0.showPed) then
        destroyElement(var0.showPed)
      end
      var0.showPed = createPed(fromJSON(var0.currentCharacters[lobby.selectedCharacter].Data or toJSON({})).Model or 0, unpack(lobby.cam.main))
      if not var2[var0.currentCharacters[lobby.selectedCharacter].ID] then
        exports["skin-system"]:removeSkinFromPlayer(var0.showPed)
        triggerServerEvent("character:getCustomSkin", localPlayer, var0.currentCharacters[lobby.selectedCharacter].ID)
      else
        exports["skin-system"]:applySkinToPlayer(var0.showPed, var2[var0.currentCharacters[lobby.selectedCharacter].ID])
      end
      var0.lastskin = fromJSON(var0.currentCharacters[lobby.selectedCharacter].Data or toJSON({})).Model or 0
      setElementDimension(var0.showPed, 65499)
      setPedAnimation(var0.showPed, getRandomAnim()[1], getRandomAnim()[2], -1, true, false, false, false)
      table.insert(var0.elements, var0.showPed)
      lobby.selectCharAnim[5] = dxGetTextWidth(var0.currentCharacters[lobby.selectedCharacter].Name, var4, var5)
      var0.selectedID = var0.currentCharacters[lobby.selectedCharacter].ID
      var0.selectedDatabase = var0.currentCharacters[lobby.selectedCharacter]
      lobby.showCharacterDetails(true, tostring(var0.currentCharacters[lobby.selectedCharacter].Name), var0.currentCharacters[lobby.selectedCharacter])
    else
      lobby.showCharacterDetails(false)
    end
    setElementDimension(localPlayer, 65499)
    setElementAlpha(localPlayer, 0)
    setElementInterior(localPlayer, 0)
    setCameraInterior(0)
    setTime(0, 0)
    if not isElement(var6) then
      var6 = dxCreateTexture("images/gradient_transparent_bg.png", "dxt5", true, "clamp")
    end
    removeEventHandler("onClientRender", root, lobby.draw)
    addEventHandler("onClientRender", root, lobby.draw)
    removeEventHandler("onClientKey", root, cancelBinds)
    addEventHandler("onClientKey", root, cancelBinds)
    unbindKey("enter", "down", bindPlay)
    bindKey("enter", "down", bindPlay)
    lobby.account = getElementData(localPlayer, "account") or getElementData(localPlayer, "character:account")
    if fileExists("ProfilePics/" .. tostring(lobby.account) .. ".png") then
      lobby.profilePic = "ProfilePics/" .. tostring(lobby.account) .. ".png"
    else
      lobby.profilePic = false
    end
    removeEventHandler("onClientClick", root, lobby.click)
    addEventHandler("onClientClick", root, lobby.click)
    if #var0.currentCharacters == 0 then
      selectTab(2)
    end
  else
    setElementAlpha(localPlayer, 255)
    lobby.showCharacterDetails(false)
    setCameraTarget(localPlayer)
    removeEventHandler("onClientRender", root, lobby.draw)
    removeEventHandler("onClientKey", root, cancelBinds)
    unbindKey("enter", "down", bindPlay)
    removeEventHandler("onClientClick", root, lobby.click)
    if isElement(var6) then
      destroyElement(var6)
      var6 = "images/gradient_transparent_bg.png"
    end
  end
end
addEvent("character:getCustomSkin:callback", true)
addEventHandler("character:getCustomSkin:callback", localPlayer, function(arg0, arg1)
  var0[arg0] = arg1
  if isElement(var1.showPed) then
    exports["skin-system"]:applySkinToPlayer(var1.showPed, arg1)
  end
end)
function bindPlay(arg0, arg1)
  if var0 == 1 and #var1.currentCharacters > 0 then
    if var2 then
      exports.notifications:output({
        en = "Wait please",
        ar = "\216\167\217\134\216\170\216\184\216\177 \217\133\217\134 \217\129\216\182\217\132\217\131"
      }, 3000, "info")
      return
    end
    if (fromJSON(var1.selectedDatabase.Data).Status or "Alive") == "Alive" then
      var2 = true
      triggerServerEvent("character:spawn", localPlayer, var1.selectedID)
    else
      fadeCamera(true)
      exports.notifications:sendNotification("#FF0000Error", [[
This character is dead, you can not play with.
Reason: ]] .. tostring(fromJSON(var1.selectedDatabase.Data).CK_Reason), 6000, true, "center")
    end
  end
end
addEventHandler("onClientUIClick", root, function()
  if source == var0.button.Play then
    if #var1.currentCharacters > 0 then
      if var2 then
        exports.notifications:sendNotification("#FF0000ERROR", "Wait please.", 3000, false, "center")
        return
      end
      if (fromJSON(var1.selectedDatabase.Data).Status or "Alive") == "Alive" then
        if var3[var1.selectedID] and string.find(var3[var1.selectedID], "rejected", 1, true) then
          exports.notifications:sendNotification("#FF0000ERROR", var3[var1.selectedID], 4000, false, "center")
          return
        end
        var2 = true
        exports.public:loading("character:spawn", true)
        triggerServerEvent("character:spawn", localPlayer, var1.selectedID)
      else
        fadeCamera(true)
        exports.notifications:sendNotification("#FF0000Error", [[
This character is dead, you can not play with.
Reason: ]] .. tostring(fromJSON(var1.selectedDatabase.Data).CK_Reason), 6000, true, "center")
      end
    end
  elseif source == var0.button.CreateCharacter then
    var1.clickCreate()
  end
end)
function getRandomAnim()
  return var0[math.random(1, #var0)]
end
addEvent("character:remove:response", true)
addEventHandler("character:remove:response", root, function(arg0)
  var0.showSelection(true, arg0)
end)
addEvent("character:showSelection", true)
addEventHandler("character:showSelection", localPlayer, function(arg0, arg1)
  startLoginMusic()
  eui:uiSetVisible(var0.label.RespawnScreen, false)
  if isTimer(RespawnTimer) then
    killTimer(RespawnTimer)
  end
  var1.showSelection(true, arg0)
  var1.maxCharacters = arg1
end)
addEvent("character:hideSelection", true)
addEventHandler("character:hideSelection", localPlayer, function()
  if var0.selection_status then
    selectTab(false)
  end
end)
addEventHandler("onClientPlayerSpawn", localPlayer, function()
  eui:uiSetVisible(var0.label.RespawnScreen, false)
  if isTimer(RespawnTimer) then
    killTimer(RespawnTimer)
  end
  if not spawn_cam.enabled then
    return
  end
  spawn_cam.enabled = false
  if getElementInterior(localPlayer) ~= 0 then
    return
  end
  setElementFrozen(localPlayer, true)
  showCursor(true)
  setCursorAlpha(0)
  setCameraTarget(localPlayer)
  spawn_cam.timers[1] = setTimer(function()
    setCameraMatrix(getCameraMatrix())
    setCameraDrunkLevel(20)
    spawn_cam.timers[2] = setTimer(function()
      exports.public:setBlurShaderVisible(true, true, 10, blurShaderblack)
      spawn_cam.timers[3] = setTimer(function()
        exports.public:setBlurShaderVisible(false, true, 10, blurShaderblack)
      end, 200, 1)
      spawn_cam.move({
        var0,
        var1,
        var2 + 500,
        var3,
        var4,
        var5,
        var6,
        var7
      }, {
        var0,
        var1,
        var2 + 150,
        var3,
        var4,
        var5,
        var6,
        var7
      }, 300, "OutInBack")
      spawn_cam.timers[4] = setTimer(function()
        exports.public:setBlurShaderVisible(true, true, 10, blurShaderblack)
        spawn_cam.timers[5] = setTimer(function()
          exports.public:setBlurShaderVisible(false, true, 10, blurShaderblack)
        end, 200, 1)
        spawn_cam.move({
          var0,
          var1,
          var2 + 150,
          var3,
          var4,
          var5,
          var6,
          var7
        }, {
          var0,
          var1,
          var2 + 25,
          var3,
          var4,
          var5,
          var6,
          var7
        }, 300, "OutInBack")
        spawn_cam.timers[6] = setTimer(function()
          exports.public:setBlurShaderVisible(true, true, 5, blurShaderblack)
          spawn_cam.timers[7] = setTimer(function()
            exports.public:setBlurShaderVisible(false, true, 5, blurShaderblack)
          end, 200, 1)
          spawn_cam.move({
            var0,
            var1,
            var2 + 25,
            var3,
            var4,
            var5,
            var6,
            var7
          }, {
            var0,
            var1,
            var8,
            var3,
            var4,
            var5,
            var6,
            var7
          }, 2000, "InOutQuad")
          setCameraDrunkLevel(0)
          setElementDimension(localPlayer, getElementDimension(localPlayer) + 1)
          setElementDimension(localPlayer, (getElementDimension(localPlayer)))
          spawn_cam.timers[8] = setTimer(function()
            resetFarClipDistance()
            resetFogDistance()
            setCloudsEnabled(true)
            showCursor(false)
            setCursorAlpha(255)
            setElementFrozen(localPlayer, false)
            setCameraTarget(localPlayer)
          end, 2000, 1)
        end, 1500, 1)
      end, 1500, 1)
    end, 2000, 1)
  end, 1000, 1)
end)
function switchOutPlayer()
  setElementFrozen(localPlayer, true)
  showCursor(true)
  setCursorAlpha(0)
  setCameraTarget(localPlayer)
  spawn_cam.timers[1] = setTimer(function()
    setCameraMatrix(getCameraMatrix())
    setCameraDrunkLevel(20)
    spawn_cam.move({
      getCameraMatrix()
    }, {
      getCameraMatrix()
    }, 500, "InOutQuad")
    spawn_cam.timers[2] = setTimer(function()
      exports.public:setBlurShaderVisible(true, true, 10, blurShaderblack)
      spawn_cam.timers[3] = setTimer(function()
        exports.public:setBlurShaderVisible(false, true, 10, blurShaderblack)
      end, 200, 1)
      spawn_cam.move({
        var0,
        var1,
        var2 + 25,
        var3,
        var4,
        var5,
        var6,
        var7
      }, {
        var0,
        var1,
        var2 + 150,
        var3,
        var4,
        var5,
        var6,
        var7
      }, 300, "OutInBack")
      spawn_cam.timers[4] = setTimer(function()
        exports.public:setBlurShaderVisible(true, true, 10, blurShaderblack)
        spawn_cam.timers[5] = setTimer(function()
          exports.public:setBlurShaderVisible(false, true, 10, blurShaderblack)
        end, 200, 1)
        spawn_cam.move({
          var0,
          var1,
          var2 + 150,
          var3,
          var4,
          var5,
          var6,
          var7
        }, {
          var0,
          var1,
          var2 + 500,
          var3,
          var4,
          var5,
          var6,
          var7
        }, 300, "OutInBack")
        spawn_cam.timers[6] = setTimer(function()
          showCursor(false)
          setCursorAlpha(255)
          setElementFrozen(localPlayer, false)
          setCameraDrunkLevel(0)
        end, 1000, 1)
      end, 2000, 1)
    end, 1800, 1)
  end, 800, 1)
end
function copyID(arg0)
  if not getElementData(localPlayer, "character:id") then
    return
  end
  outputChatBox("Your ID: #FFFFFF" .. tostring((getElementData(localPlayer, "character:id"))), 255, 55, 95, true)
  setClipboard(tostring((getElementData(localPlayer, "character:id"))))
end
addCommandHandler("copymyid", copyID)
addEventHandler("onClientPlayerWasted", localPlayer, function(arg0, arg1)
  var0 = 120
  eui:uiSetVisible(var1.label.RespawnScreen, true)
  eui:uiSetText(var1.button.Respawn, "Respawn (" .. tostring(var0) .. ")")
  if isTimer(RespawnTimer) then
    killTimer(RespawnTimer)
  end
  if isElement(arg0) then
    if getElementType(arg0) == "player" then
      outputChatBox("You were killed by ( #ff375f" .. tostring(getElementData(arg0, "character:name")) .. " (" .. tostring(getPlayerID(arg0)) .. ") #b5b5b5).", 181, 181, 181, true)
    end
  else
    outputChatBox("", 181, 181, 181)
  end
  outputChatBox("", 181, 181, 181)
  outputChatBox("If you were killed by someone breaking the rules,", 181, 181, 181)
  outputChatBox("report to get an admin to revive you.", 181, 181, 181)
  outputChatBox("", 181, 181, 181)
  outputChatBox("The respawn button will appear after " .. tostring(var0) .. " seconds.", 255, 55, 95)
  RespawnTimer = setTimer(function()
    var0 = var0 - 1
    eui:uiSetText(var1.button.Respawn, "Respawn (" .. tostring(var0) .. ")")
    if var0 == 0 then
      outputChatBox("", 181, 181, 181)
      outputChatBox("", 2181, 181, 181)
      outputChatBox("Please note that some items may be taken away from you upon respawning.", 181, 181, 181)
      outputChatBox("You can respawn now.", 255, 55, 95)
      eui:uiSetText(var1.button.Respawn, "Respawn Now")
    else
      eui:uiSetText(var1.button.Respawn, "Respawn (" .. tostring(var0) .. ")")
    end
  end, 1000, var0)
end)
function showRespawnScreen()
  var0 = 120
  eui:uiSetVisible(var1.label.RespawnScreen, true)
  eui:uiSetText(var1.button.Respawn, "Respawn (" .. tostring(var0) .. ")")
  if isTimer(RespawnTimer) then
    killTimer(RespawnTimer)
  end
  RespawnTimer = setTimer(function()
    var0 = var0 - 1
    eui:uiSetText(var1.button.Respawn, "Respawn (" .. tostring(var0) .. ")")
    if var0 == 0 then
      outputChatBox("", 181, 181, 181)
      outputChatBox("", 2181, 181, 181)
      outputChatBox("Please note that some items may be taken away from you upon respawning.", 181, 181, 181)
      outputChatBox("You can respawn now.", 255, 55, 95)
      eui:uiSetText(var1.button.Respawn, "Respawn Now")
    else
      eui:uiSetText(var1.button.Respawn, "Respawn (" .. tostring(var0) .. ")")
    end
  end, 1000, var0)
end
addEventHandler("onClientUIClick", root, function()
  if source == var0.button.Respawn and var1 == 0 then
    eui:uiSetVisible(var0.label.RespawnScreen, false)
    if isTimer(RespawnTimer) then
      killTimer(RespawnTimer)
    end
    triggerServerEvent("character:spawn", localPlayer, getElementData(localPlayer, "character:id"), true)
  end
end)
function getPlayerFromCharacterID(arg0)
  for forvar4, forvar5 in ipairs(getElementsByType("player")) do
    if getElementData(forvar5, "character:id") == arg0 then
      return forvar5
    end
  end
  return false
end
addEvent("onClientPlayerQuitFromCharacter", true)
addEventHandler("onClientPlayerQuitFromCharacter", root, function(arg0)
  current_character = false
  exports.notifications:hideDirective()
  eui:uiSetVisible(var0.label.RespawnScreen, false)
  if isTimer(RespawnTimer) then
    killTimer(RespawnTimer)
  end
  spawn_cam.enabled = true
  for forvar4, forvar5 in ipairs(spawn_cam.timers) do
    if isTimer(forvar5) then
      killTimer(forvar5)
    end
  end
  spawn_cam.timers = {}
end)
spawn_cam = {
  currentPos = {
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    70
  },
  startPos = {
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    70
  },
  endPos = {
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    70
  },
  tick = 0,
  duration = 1500,
  easing = "InOutQuad",
  timers = {},
  enabled = true
}
if getElementData(localPlayer, "character:id") then
  spawn_cam.enabled = false
end
function spawn_cam.render()
  spawn_cam.currentPos[1], spawn_cam.currentPos[2], spawn_cam.currentPos[3] = anim(spawn_cam.tick, spawn_cam.duration, spawn_cam.startPos[1], spawn_cam.startPos[2], spawn_cam.startPos[3], spawn_cam.endPos[1], spawn_cam.endPos[2], spawn_cam.endPos[3], spawn_cam.easing)
  spawn_cam.currentPos[4], spawn_cam.currentPos[5], spawn_cam.currentPos[6] = anim(spawn_cam.tick, spawn_cam.duration, spawn_cam.startPos[4], spawn_cam.startPos[5], spawn_cam.startPos[6], spawn_cam.endPos[4], spawn_cam.endPos[5], spawn_cam.endPos[6], spawn_cam.easing)
  setCameraMatrix(spawn_cam.currentPos[1], spawn_cam.currentPos[2], spawn_cam.currentPos[3], spawn_cam.currentPos[4], spawn_cam.currentPos[5], spawn_cam.currentPos[6], spawn_cam.endPos[7], spawn_cam.endPos[8])
end
function spawn_cam.move(arg0, arg1, arg2, arg3)
  spawn_cam.tick = getTickCount()
  spawn_cam.duration = arg2
  spawn_cam.startPos = arg0
  spawn_cam.endPos = arg1
  spawn_cam.easing = arg3
  addEventHandler("onClientRender", root, spawn_cam.render)
  setTimer(function()
    removeEventHandler("onClientRender", root, spawn_cam.render)
  end, arg2, 1)
end
function lobby.draw()
  lobby.cam.currentDim[1], lobby.cam.currentDim[2], lobby.cam.currentDim[3] = anim(lobby.cam.count, 1500, lobby.cam.fromDim[1], lobby.cam.fromDim[2], lobby.cam.fromDim[3], lobby.cam.toDim[1], lobby.cam.toDim[2], lobby.cam.toDim[3], "Linear")
  lobby.cam.currentDim[4], lobby.cam.currentDim[5], lobby.cam.currentDim[6] = anim(lobby.cam.count, 1500, lobby.cam.fromDim[4], lobby.cam.fromDim[5], lobby.cam.fromDim[6], lobby.cam.toDim[4], lobby.cam.toDim[5], lobby.cam.toDim[6], "Linear")
  setCameraMatrix(lobby.cam.currentDim[1], lobby.cam.currentDim[2], lobby.cam.currentDim[3], lobby.cam.currentDim[4], lobby.cam.currentDim[5], lobby.cam.currentDim[6])
  dxDrawRectangle(0, var0, var1, var2, var3)
  dxDrawImage(0, 0, var1, var4, ":assets/images/bg_gradient.png", 0, 0, 0, tocolor(0, 3, 8, 255), false)
  dxDrawImage(70 * var5, (var6 - var7) / 2, var7, var7, ":assets/images/logo.png", 0, 0, 0, tocolor(255, 255, 255, 200), POST_GUI)
  dxDrawText(tostring(lobby.account), 0, 10 * var5, var1 - 80 * var5, 60 * var5, tocolor(255, 255, 255, 180), var8, var9, "right", "center")
  dxDrawImage(var1 - 60 * var5, 10 * var5, 45 * var5, 45 * var5, lobby.profilePic or ":roleplay/user.png")
  for forvar7 = 1, #var11 do
    if var12 == forvar7 then
      dxDrawCircle(50 * var5, var6 + 100 * var5 + var10 / 2, anim(var13, 250, 0, 80, 0, 3 * var5, 255, 0, "Linear"))
    elseif isMouseInPosition(50 * var5, var6 + 100 * var5, var11[forvar7].width, var10) then
      if var14 ~= forvar7 then
        var14 = forvar7
        playSound(":assets/sounds/select.wav")
      end
    end
    dxDrawText(var11[forvar7].text, 50 * var5, var6 + 100 * var5, 50 * var5 + var11[forvar7].width, var6 + 100 * var5 + var10, tocolor(255, 255, 255, 120), var8, var9, "center", "center")
  end
  if not true then
    var14 = false
  end
  if var12 == 1 then
    dxDrawText(tostring(#var15.currentCharacters) .. "/" .. tostring(var15.maxCharacters), 0, var0, var1 - 50 * var5, var4, tocolor(255, 255, 255, 255), var8, var9, "right", "center", true, false, true)
    for forvar9, forvar10 in ipairs(var15.currentCharacters) do
      dxDrawText(forvar10.Name, 100 * var5, var0 - 54, 100 * var5 + dxGetTextWidth(forvar10.Name, var8, var9), var0 - 54 + 30, tocolor(255, 255, 255, lobby.selectedCharacter == forvar9 and 255 or isMouseInPosition(100 * var5, var0 - 54, dxGetTextWidth(forvar10.Name, var8, var9), 30) and 200 or 150), var8, var9, "center", "center", true, false, true)
      if lobby.selectedCharacter == forvar9 then
        lobby.selectCharAnim[6], lobby.selectCharAnim[7] = anim(lobby.selectCharAnim[1], 400, lobby.selectCharAnim[2], lobby.selectCharAnim[3], 0, lobby.selectCharAnim[4], lobby.selectCharAnim[5], 0, "Linear")
        dxDrawLine(lobby.selectCharAnim[6], var0 - 54 + 30, lobby.selectCharAnim[6] + lobby.selectCharAnim[7], var0 - 54 + 30, tocolor(255, 255, 255, 255), 2, true)
      elseif isMouseInPosition(100 * var5, var0 - 54, dxGetTextWidth(forvar10.Name, var8, var9), 30) and getKeyState("mouse1") then
        lobby.selectedCharacter = forvar9
        lobby.selectCharAnim[1] = getTickCount()
        lobby.selectCharAnim[2] = lobby.selectCharAnim[6]
        lobby.selectCharAnim[3] = lobby.selectCharAnim[7]
        lobby.selectCharAnim[4] = 100 * var5
        lobby.selectCharAnim[5] = dxGetTextWidth(forvar10.Name, var8, var9)
        setElementModel(var15.showPed, fromJSON(var15.currentCharacters[lobby.selectedCharacter].Data or {}).Model or 0)
        var15.lastskin = fromJSON(var15.currentCharacters[lobby.selectedCharacter].Data or {}).Model or 0
        var15.selectedID = var15.currentCharacters[lobby.selectedCharacter].ID
        if not var16[var15.selectedID] then
          exports["skin-system"]:removeSkinFromPlayer(var15.showPed)
          triggerServerEvent("character:getCustomSkin", localPlayer, var15.selectedID)
        else
          exports["skin-system"]:applySkinToPlayer(var15.showPed, var16[var15.selectedID])
        end
        var15.selectedDatabase = var15.currentCharacters[lobby.selectedCharacter]
        lobby.showCharacterDetails(true, tostring(var15.currentCharacters[lobby.selectedCharacter].Name), var15.currentCharacters[lobby.selectedCharacter])
        setPedAnimation(var15.showPed, getRandomAnim()[1], getRandomAnim()[2], -1, true, false, false, false)
      end
    end
  end
end
function lobby.click(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7)
  if arg1 == "down" and var0 and var1 ~= var0 then
    selectTab(var0)
    var0 = false
  end
end
function selectTab(arg0)
  if var0 then
    if var0 == 1 then
      lobby.showCharacterDetails(false)
    elseif var0 == 2 then
      var1.creation(false)
      if isElement(var1.showPed) then
        setElementModel(var1.showPed, var1.lastskin or 0)
        if not var2[var1.selectedID] then
          exports["skin-system"]:removeSkinFromPlayer(var1.showPed)
          triggerServerEvent("character:getCustomSkin", localPlayer, var1.selectedID)
        else
          exports["skin-system"]:applySkinToPlayer(var1.showPed, var2[var1.selectedID])
        end
      end
    elseif var0 == 3 then
      exports["help-system"]:closeLatestNews()
    elseif var0 == 4 then
      exports["rp-admin"]:closeHistory()
    elseif var0 == 5 then
      showChangePasswordPanel(false)
    end
  end
  var0 = arg0
  if not arg0 then
    return
  end
  var3 = getTickCount()
  playSound(":UIKit/sounds/click2.wav")
  if arg0 == 1 then
    if #var1.currentCharacters == 0 and isElement(var1.showPed) then
      destroyElement(var1.showPed)
    end
    lobby.cam.count = getTickCount()
    lobby.cam.fromDim = lobby.cam.currentDim
    lobby.cam.toDim = {
      getPointFromDistanceRotation(unpack(lobby.cam.main))
    }
    setElementData(localPlayer, "loading:status", "Selecting character ...")
    lobby.showCharacterDetails(true)
  elseif arg0 == 2 then
    lobby.cam.count = getTickCount()
    lobby.cam.fromDim = lobby.cam.currentDim
    lobby.cam.toDim = {
      getPointFromDistanceRotation(unpack(lobby.cam.main))
    }
    var1.creation(true)
  elseif arg0 == 3 then
    lobby.cam.count = getTickCount()
    lobby.cam.fromDim = lobby.cam.currentDim
    lobby.cam.toDim = {
      getPointFromDistanceRotation(unpack(lobby.cam.main))
    }
    exports["help-system"]:openLatestNews()
  elseif arg0 == 4 then
    lobby.cam.count = getTickCount()
    lobby.cam.fromDim = lobby.cam.currentDim
    lobby.cam.toDim = {
      getPointFromDistanceRotation(unpack(lobby.cam.main))
    }
    exports["rp-admin"]:openHistory(localPlayer)
  elseif arg0 == 5 then
    lobby.cam.count = getTickCount()
    lobby.cam.fromDim = lobby.cam.currentDim
    lobby.cam.toDim = {
      getPointFromDistanceRotation(unpack(lobby.cam.main))
    }
    showChangePasswordPanel(true)
  end
end
function isMouseInPosition(arg0, arg1, arg2, arg3)
  if not isCursorShowing() then
    return false
  end
  return arg0 <= getCursorPosition() * var0 and arg1 <= getCursorPosition() * var1 and getCursorPosition() * var0 <= arg0 + arg2 and getCursorPosition() * var1 <= arg1 + arg3
end
function anim(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8)
  if arg1 < getTickCount() - arg0 then
    return arg5, arg6, arg7
  end
  return interpolateBetween(arg2, arg3, arg4, arg5, arg6, arg7, (getTickCount() - arg0) / arg1, arg8)
end
function dxDrawEmptyLine(arg0, arg1, arg2, arg3, arg4, arg5, arg6)
  dxDrawRectangle(arg0, arg1, arg2, arg5, arg4, arg6)
  dxDrawRectangle(arg0, arg1 + arg3 - arg5, arg2, arg5, arg4, arg6)
  dxDrawRectangle(arg0, arg1, arg5, arg3, arg4, arg6)
  dxDrawRectangle(arg0 + arg2 - arg5, arg1, arg5, arg3, arg4, arg6)
end
function lobby.showCharacterDetails(arg0, arg1, arg2)
  lobby.characterInfo.state = arg0
  eui:uiSetVisible(var0.window.CharacterInfo, arg0)
  eui:uiSetVisible(var0.button.Play, arg0)
  if arg0 and arg1 and arg2 then
    lobby.characterInfo.name = arg1
    lobby.characterInfo.details = {
      en = "" .. "${color.primary}\226\128\162 Gender \194\187  #FFFFFF" .. tostring(({"Male", "Female"})[tonumber(fromJSON(arg2.Info).Gender)]) .. "\n" .. "${color.primary}\226\128\162 Age \194\187  #FFFFFF" .. tostring(fromJSON(arg2.Info).Age) .. "\n" .. "${color.primary}\226\128\162 Date of birth \194\187  #FFFFFF" .. (fromJSON(arg2.Info).BirthDate or {
        0,
        0,
        0
      })[1] .. "/" .. (fromJSON(arg2.Info).BirthDate or {
        0,
        0,
        0
      })[2] .. "/" .. (fromJSON(arg2.Info).BirthDate or {
        0,
        0,
        0
      })[3] .. "\n" .. "${color.primary}\226\128\162 Birth place \194\187  #FFFFFF" .. tostring(fromJSON(arg2.Info).BirthPlace) .. "\n" .. "" .. "\n" .. "${color.primary}\226\128\162 Weight \194\187  #FFFFFF" .. tostring(fromJSON(arg2.Info).Weight) .. " kg\n" .. "${color.primary}\226\128\162 Height \194\187  #FFFFFF" .. tostring(fromJSON(arg2.Info).Height) .. " cm\n" .. "" .. "\n" .. "${color.primary}\226\128\162 Language \194\187  #FFFFFF" .. tostring(fromJSON(arg2.Info).Languages[1]) .. "\n" .. "" .. "\n" .. "${color.primary}\226\128\162 Status \194\187  #FFFFFF" .. tostring(fromJSON(arg2.Data).Status == "Dead" and "#FF0000Dead" or "#00FF00Alive") .. "\n" .. "${color.primary}\226\128\162 Last seen at #FFFFFF\n     " .. tostring(getZoneName(unpack(fromJSON(arg2.Data).Pos or {
        0,
        0,
        0
      }))) .. [[
,
     ]] .. tostring(getZoneName(unpack(fromJSON(arg2.Data).Pos or {
        0,
        0,
        0
      }))) .. "\n" .. "",
      ar = "" .. "${color.primary}\226\128\162 \216\167\217\132\216\172\217\134\216\179 \194\187  #FFFFFF" .. tostring(({"Male", "Female"})[tonumber(fromJSON(arg2.Info).Gender)]) .. "\n" .. "${color.primary}\226\128\162 \216\167\217\132\216\185\217\133\216\177 \194\187  #FFFFFF" .. tostring(fromJSON(arg2.Info).Age) .. "\n" .. "${color.primary}\226\128\162 \216\170\216\167\216\177\217\138\216\174 \216\167\217\132\217\136\217\132\216\167\216\175\216\169 \194\187  #FFFFFF" .. (fromJSON(arg2.Info).BirthDate or {
        0,
        0,
        0
      })[1] .. "/" .. (fromJSON(arg2.Info).BirthDate or {
        0,
        0,
        0
      })[2] .. "/" .. (fromJSON(arg2.Info).BirthDate or {
        0,
        0,
        0
      })[3] .. "\n" .. "${color.primary}\226\128\162 \217\133\217\131\216\167\217\134 \216\167\217\132\217\136\217\132\216\167\216\175\216\169 \194\187  #FFFFFF" .. tostring(fromJSON(arg2.Info).BirthPlace) .. "\n" .. "" .. "\n" .. "${color.primary}\226\128\162 \216\167\217\132\217\136\216\178\217\134 \194\187  #FFFFFF" .. tostring(fromJSON(arg2.Info).Weight) .. " kg\n" .. "${color.primary}\226\128\162 \216\167\217\132\216\183\217\136\217\132 \194\187  #FFFFFF" .. tostring(fromJSON(arg2.Info).Height) .. " cm\n" .. "" .. "\n" .. "${color.primary}\226\128\162 \216\167\217\132\217\132\216\186\216\169 \194\187  #FFFFFF" .. tostring(fromJSON(arg2.Info).Languages[1]) .. "\n" .. "" .. "\n" .. "${color.primary}\226\128\162 \216\167\217\132\216\173\216\167\217\132\216\169 \194\187  #FFFFFF" .. tostring(fromJSON(arg2.Data).Status == "Dead" and "#FF0000Dead" or "#00FF00Alive") .. "\n" .. "${color.primary}\226\128\162 \216\162\216\174\216\177 \216\170\217\136\216\167\216\172\216\175 \217\129\217\138 #FFFFFF\n     " .. tostring(getZoneName(unpack(fromJSON(arg2.Data).Pos or {
        0,
        0,
        0
      }))) .. [[
,
     ]] .. tostring(getZoneName(unpack(fromJSON(arg2.Data).Pos or {
        0,
        0,
        0
      }))) .. "\n" .. ""
    }
    eui:uiSetText(var0.label.CharacterInfo_1, "#" .. tostring(arg2.ID) .. "\n" .. tostring(arg2.Name))
    eui:uiSetText(var0.label.CharacterInfo_2, {
      en = "" .. "${color.primary}\226\128\162 Gender \194\187  #FFFFFF" .. tostring(({"Male", "Female"})[tonumber(fromJSON(arg2.Info).Gender)]) .. "\n" .. "${color.primary}\226\128\162 Age \194\187  #FFFFFF" .. tostring(fromJSON(arg2.Info).Age) .. "\n" .. "${color.primary}\226\128\162 Date of birth \194\187  #FFFFFF" .. (fromJSON(arg2.Info).BirthDate or {
        0,
        0,
        0
      })[1] .. "/" .. (fromJSON(arg2.Info).BirthDate or {
        0,
        0,
        0
      })[2] .. "/" .. (fromJSON(arg2.Info).BirthDate or {
        0,
        0,
        0
      })[3] .. "\n" .. "${color.primary}\226\128\162 Birth place \194\187  #FFFFFF" .. tostring(fromJSON(arg2.Info).BirthPlace) .. "\n" .. "" .. "\n" .. "${color.primary}\226\128\162 Weight \194\187  #FFFFFF" .. tostring(fromJSON(arg2.Info).Weight) .. " kg\n" .. "${color.primary}\226\128\162 Height \194\187  #FFFFFF" .. tostring(fromJSON(arg2.Info).Height) .. " cm\n" .. "" .. "\n" .. "${color.primary}\226\128\162 Language \194\187  #FFFFFF" .. tostring(fromJSON(arg2.Info).Languages[1]) .. "\n" .. "" .. "\n" .. "${color.primary}\226\128\162 Status \194\187  #FFFFFF" .. tostring(fromJSON(arg2.Data).Status == "Dead" and "#FF0000Dead" or "#00FF00Alive") .. "\n" .. "${color.primary}\226\128\162 Last seen at #FFFFFF\n     " .. tostring(getZoneName(unpack(fromJSON(arg2.Data).Pos or {
        0,
        0,
        0
      }))) .. [[
,
     ]] .. tostring(getZoneName(unpack(fromJSON(arg2.Data).Pos or {
        0,
        0,
        0
      }))) .. "\n" .. "",
      ar = "" .. "${color.primary}\226\128\162 \216\167\217\132\216\172\217\134\216\179 \194\187  #FFFFFF" .. tostring(({"Male", "Female"})[tonumber(fromJSON(arg2.Info).Gender)]) .. "\n" .. "${color.primary}\226\128\162 \216\167\217\132\216\185\217\133\216\177 \194\187  #FFFFFF" .. tostring(fromJSON(arg2.Info).Age) .. "\n" .. "${color.primary}\226\128\162 \216\170\216\167\216\177\217\138\216\174 \216\167\217\132\217\136\217\132\216\167\216\175\216\169 \194\187  #FFFFFF" .. (fromJSON(arg2.Info).BirthDate or {
        0,
        0,
        0
      })[1] .. "/" .. (fromJSON(arg2.Info).BirthDate or {
        0,
        0,
        0
      })[2] .. "/" .. (fromJSON(arg2.Info).BirthDate or {
        0,
        0,
        0
      })[3] .. "\n" .. "${color.primary}\226\128\162 \217\133\217\131\216\167\217\134 \216\167\217\132\217\136\217\132\216\167\216\175\216\169 \194\187  #FFFFFF" .. tostring(fromJSON(arg2.Info).BirthPlace) .. "\n" .. "" .. "\n" .. "${color.primary}\226\128\162 \216\167\217\132\217\136\216\178\217\134 \194\187  #FFFFFF" .. tostring(fromJSON(arg2.Info).Weight) .. " kg\n" .. "${color.primary}\226\128\162 \216\167\217\132\216\183\217\136\217\132 \194\187  #FFFFFF" .. tostring(fromJSON(arg2.Info).Height) .. " cm\n" .. "" .. "\n" .. "${color.primary}\226\128\162 \216\167\217\132\217\132\216\186\216\169 \194\187  #FFFFFF" .. tostring(fromJSON(arg2.Info).Languages[1]) .. "\n" .. "" .. "\n" .. "${color.primary}\226\128\162 \216\167\217\132\216\173\216\167\217\132\216\169 \194\187  #FFFFFF" .. tostring(fromJSON(arg2.Data).Status == "Dead" and "#FF0000Dead" or "#00FF00Alive") .. "\n" .. "${color.primary}\226\128\162 \216\162\216\174\216\177 \216\170\217\136\216\167\216\172\216\175 \217\129\217\138 #FFFFFF\n     " .. tostring(getZoneName(unpack(fromJSON(arg2.Data).Pos or {
        0,
        0,
        0
      }))) .. [[
,
     ]] .. tostring(getZoneName(unpack(fromJSON(arg2.Data).Pos or {
        0,
        0,
        0
      }))) .. "\n" .. ""
    })
  end
end
function UIKitReady2()
  eui = exports.UIKit
  var0.window[1] = eui:uiCreateWindow(false, false, 550, 440, {
    en = "Character Information",
    ar = "\217\133\216\185\217\132\217\136\217\133\216\167\216\170 \216\167\217\132\216\180\216\174\216\181\217\138\216\169"
  })
  eui:uiSetVisible(var0.window[1], false)
  eui:uiWindowSetMovable(var0.window[1], false)
  var0.tabpanel[1] = eui:uiCreateTabPanel(10, 80, 530, 320, "", tocolor(30, 30, 30, 0), var0.window[1])
  eui:uiSetProperty(var0.tabpanel[1], "title_shown", false)
  var0.tab[1] = eui:uiCreateTab("Info", "Information", var0.tabpanel[1])
  eui:uiSetSelectedTab(var0.tabpanel[1], var0.tab[1])
  var0.label[1] = eui:uiCreateLabel(10, 25, 265, 300, "", tocolor(255, 255, 255, 255), "left", "top", var0.tab[1])
  var0.label[4] = eui:uiCreateLabel(275, 25, 265, 300, "", tocolor(255, 255, 255, 255), "left", "top", var0.tab[1])
  var0.tab[4] = eui:uiCreateTab("Story", "Character Story", var0.tabpanel[1])
  var0.memo[1] = eui:uiCreateMemo(0, 10, 530, 300, "", tocolor(5, 5, 5, 240), var0.tab[4])
  eui:uiSetProperty(var0.memo[1], "TextColor", tocolor(255, 255, 255, 255))
  eui:uiMemoSetReadOnly(var0.memo[1], true)
  var0.tab[2] = eui:uiCreateTab("Vehicles", "Vehicles", var0.tabpanel[1])
  var0.label[2] = eui:uiCreateLabel(10, 10, 340, 20, "", tocolor(255, 255, 255, 255), "left", "top", var0.tab[2])
  var1.gridlist.vehicles = eui:uiCreateGridList(0, 40, 530, 250, tocolor(10, 10, 10, 0), var0.tab[2])
  eui:uiGridListAddColumn(var1.gridlist.vehicles, "ID", 0.2)
  eui:uiGridListAddColumn(var1.gridlist.vehicles, "Name", 0.8)
  eui:uiSetAlign(var1.gridlist.vehicles, "left", "center")
  eui:uiSetProperty(var1.gridlist.vehicles, "color_coded", true)
  var0.tab[3] = eui:uiCreateTab("Interiors", "Interiors", var0.tabpanel[1])
  var0.label[3] = eui:uiCreateLabel(10, 10, 340, 20, "", tocolor(255, 255, 255, 255), "left", "top", var0.tab[3])
  var1.gridlist.interiors = eui:uiCreateGridList(0, 40, 530, 250, tocolor(10, 10, 10, 0), var0.tab[3])
  eui:uiGridListAddColumn(var1.gridlist.interiors, "ID", 0.2)
  eui:uiGridListAddColumn(var1.gridlist.interiors, "Name", 0.8)
  eui:uiSetAlign(var1.gridlist.interiors, "left", "center")
  eui:uiSetProperty(var1.gridlist.interiors, "color_coded", true)
  var0.button[1] = eui:uiCreateButton(10, 395, 530, 35, {en = "Close", ar = "\216\165\216\186\217\132\216\167\217\130"}, _, var0.window[1])
end
addEventHandler("onClientUIReady", resourceRoot, UIKitReady2)
addEvent("onClientUIKitReady", true)
addEventHandler("onClientUIKitReady", root, UIKitReady2)
function closeAllWindows(arg0)
  eui:uiSetVisible(var0.window[1], false)
  showCursor(false)
end
addEvent("onClientPlayerQuitFromCharacter", true)
addEventHandler("onClientPlayerQuitFromCharacter", localPlayer, closeAllWindows)
addEventHandler("onClientPlayerWasted", localPlayer, closeAllWindows)
addEventHandler("onClientUIClick", root, function()
  if source == var0.button[1] then
    eui:uiSetVisible(var0.window[1], false)
    showCursor(false)
  end
end)
addEvent("character:showInformation", true)
addEventHandler("character:showInformation", localPlayer, function(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, arg15, arg16)
  eui:uiSetVisible(var0.window[1], true)
  showCursor(true)
  eui:uiSetText(var0.label[1], {
    en = "${color.primary}\226\128\162 Personal ID \194\187 #FFFFFF" .. tostring(arg0) .. "" .. "\n" .. "${color.primary}\226\128\162 " .. "Name \194\187 #FFFFFF" .. tostring(arg1.Name) .. "\n" .. "${color.primary}\226\128\162 " .. "Gender \194\187 #FFFFFF" .. tostring(arg7) .. "" .. "\n" .. "${color.primary}\226\128\162 " .. "Date of birth \194\187 #FFFFFF" .. arg4[1] .. "/" .. arg4[2] .. "/" .. arg4[3] .. "\n" .. "${color.primary}\226\128\162 " .. "Age \194\187 #FFFFFF" .. tostring(arg3.Age) .. " years old" .. "\n" .. "${color.primary}\226\128\162 " .. "Fingerprints \194\187 #FFFFFF" .. tostring(arg3.FingerPrint) .. "" .. "\n" .. "${color.primary}\226\128\162 " .. "Time spent on this character \194\187 #FFFFFF" .. tostring(convertTimeToString(arg2 or 0)) .. "\n" .. "${color.primary}\226\128\162 " .. "Career \194\187 #FFFFFF" .. (arg14.job or "Unemployed") .. [[

 ]] .. "\n" .. "${color.primary}\226\128\162 " .. "Money \194\187 #00FF00" .. "$" .. tostring(convertNumber(arg13)) .. "\n" .. "${color.primary}\226\128\162 " .. "Main Bank Account \194\187 #FFFFFF" .. tostring(arg3.BankAccount) .. "\n" .. "${color.primary}\226\128\162 " .. "Bank Account Balance \194\187 #00FF00$" .. tostring(arg15 and convertNumber(arg15) or "-") .. "\n" .. "${color.primary}\226\128\162 " .. "Coins \194\187 #FFFFFF" .. tostring(convertNumber(arg14.BiosCoins or 0)) .. " bc" .. "",
    ar = "${color.primary}\226\128\162 \216\167\217\132\216\177\217\130\217\133 \216\167\217\132\216\180\216\174\216\181\217\138 \194\187 #FFFFFF" .. tostring(arg0) .. "" .. "\n" .. "${color.primary}\226\128\162 " .. "\216\167\217\132\216\167\216\179\217\133 \194\187 #FFFFFF" .. tostring(arg1.Name) .. "\n" .. "${color.primary}\226\128\162 " .. "\216\167\217\132\216\172\217\134\216\179 \194\187 #FFFFFF" .. tostring(arg7) .. "" .. "\n" .. "${color.primary}\226\128\162 " .. "\216\170\216\167\216\177\217\138\216\174 \216\167\217\132\217\133\217\138\217\132\216\167\216\175 \194\187 #FFFFFF" .. arg4[1] .. "/" .. arg4[2] .. "/" .. arg4[3] .. "\n" .. "${color.primary}\226\128\162 " .. "\216\167\217\132\216\185\217\133\216\177 \194\187 #FFFFFF" .. tostring(arg3.Age) .. " \216\179\217\134\216\169" .. "\n" .. "${color.primary}\226\128\162 " .. "\216\168\216\181\217\133\216\169 \216\167\217\132\216\163\216\181\216\168\216\185 \194\187 #FFFFFF" .. tostring(arg3.FingerPrint) .. "" .. "\n" .. "${color.primary}\226\128\162 " .. "\217\136\217\130\216\170 \216\167\217\132\217\132\216\185\216\168 \217\129\217\138 \217\135\216\176\217\135 \216\167\217\132\216\180\216\174\216\181\217\138\216\169 \194\187 #FFFFFF" .. tostring(convertTimeToString(arg2 or 0)) .. "\n" .. "${color.primary}\226\128\162 " .. "\216\167\217\132\217\133\217\135\217\134\216\169 \194\187 #FFFFFF" .. (arg14.job or "Unemployed") .. [[

 ]] .. "\n" .. "${color.primary}\226\128\162 " .. "\216\167\217\132\217\133\216\167\217\132 \194\187 #00FF00" .. "$" .. tostring(convertNumber(arg13)) .. "\n" .. "${color.primary}\226\128\162 " .. "\216\167\217\132\216\173\216\179\216\167\216\168 \216\167\217\132\216\168\217\134\217\131\217\138 \216\167\217\132\216\177\216\166\217\138\216\179\217\138 \194\187 #FFFFFF" .. tostring(arg3.BankAccount) .. "\n" .. "${color.primary}\226\128\162 " .. "\216\177\216\181\217\138\216\175 \216\173\216\179\216\167\216\168 \216\167\217\132\216\168\217\134\217\131 \194\187 #00FF00$" .. tostring(arg15 and convertNumber(arg15) or "-") .. "\n" .. "${color.primary}\226\128\162 " .. "Coins \194\187 #FFFFFF" .. tostring(convertNumber(arg14.BiosCoins or 0)) .. " bc" .. ""
  })
  for forvar23, forvar24 in ipairs(arg5) do
  end
  eui:uiSetText(var0.label[4], {
    en = "${color.primary}\226\128\162 " .. "Languages:" .. "#FFFFFF" .. "\n" .. ("" .. "${color.primary}  \194\187 #FFFFFF" .. tostring(forvar24) .. " " .. "(100%)" .. "\n") .. "\n" .. "${color.primary}\226\128\162 " .. "Vehicles License: #FFFFFF" .. (arg14["license.Vehicles"] and "Yes" or "#FF0000No") .. "\n" .. "${color.primary}\226\128\162 " .. "Boating License: #FFFFFF" .. (arg14["license.Boats"] and "Yes" or "#FF0000No") .. "\n" .. "${color.primary}\226\128\162 " .. "Pilots License: #FFFFFF" .. (#arg8 == 0 and "#FF0000No" or "Yes") .. [[


]] .. "${color.primary}\226\128\162 " .. "Level \194\187 #FFFFFF" .. tostring(unpack(arg16)) .. "  (" .. tostring(unpack(arg16)) .. "/" .. tostring(unpack(arg16)) .. ")",
    ar = "${color.primary}\226\128\162 " .. "\216\167\217\132\217\132\216\186\216\167\216\170:" .. "#FFFFFF" .. "\n" .. ("" .. "${color.primary}  \194\187 #FFFFFF" .. tostring(forvar24) .. " " .. "(100%)" .. "\n") .. "\n" .. "${color.primary}\226\128\162 " .. "\216\177\216\174\216\181\216\169 \216\167\217\132\217\133\216\177\217\131\216\168\216\167\216\170: #FFFFFF" .. (arg14["license.Vehicles"] and "Yes" or "#FF0000No") .. "\n" .. "${color.primary}\226\128\162 " .. "\216\177\216\174\216\181\216\169 \216\167\217\132\217\130\217\136\216\167\216\177\216\168: #FFFFFF" .. (arg14["license.Boats"] and "Yes" or "#FF0000No") .. "\n" .. "${color.primary}\226\128\162 " .. "\216\177\216\174\216\181\216\169 \216\167\217\132\216\183\217\138\216\177\216\167\217\134: #FFFFFF" .. (#arg8 == 0 and "#FF0000No" or "Yes") .. [[


]] .. "${color.primary}\226\128\162 " .. "\216\167\217\132\217\133\216\179\216\170\217\136\217\137 \194\187 #FFFFFF" .. tostring(unpack(arg16)) .. "  (" .. tostring(unpack(arg16)) .. "/" .. tostring(unpack(arg16)) .. ")"
  })
  eui:uiGridListClear(var1.gridlist.vehicles)
  eui:uiGridListClear(var1.gridlist.interiors)
  eui:uiSetText(var0.label[2], "Vehicles  #FFFFFF" .. "( ${color.primary}" .. tostring(#arg6) .. "#ffffff / " .. tostring(arg9) .. " )")
  for forvar28, forvar29 in ipairs(arg6) do
    if isElement((getElementByID("Vehicle:" .. tostring(forvar29.ID)))) then
      if getElementData(getElementByID("Vehicle:" .. tostring(forvar29.ID)), "vehicle:impounded") then
      end
    elseif forvar29.hidden == 1 then
      eui:uiGridListSetItemColor(var1.gridlist.vehicles, eui:uiGridListAddRow(var1.gridlist.vehicles), 2, tocolor(180, 180, 180, 255))
    end
    eui:uiGridListSetItemText(var1.gridlist.vehicles, eui:uiGridListAddRow(var1.gridlist.vehicles), 1, tostring(forvar29.ID))
    eui:uiGridListSetItemColor(var1.gridlist.vehicles, eui:uiGridListAddRow(var1.gridlist.vehicles), 1, tocolor(255, 55, 95, 255))
    eui:uiGridListSetItemText(var1.gridlist.vehicles, eui:uiGridListAddRow(var1.gridlist.vehicles), 2, ((tostring(unpack(fromJSON(forvar29.vData).Vehlib or {})) .. " " .. tostring(unpack(fromJSON(forvar29.vData).Vehlib or {})) .. " " .. tostring(unpack(fromJSON(forvar29.vData).Vehlib or {}))) .. "  |  #FF0000(Impounded)#FFFFFF") .. "  |  (Hidden)")
  end
  for forvar29, forvar30 in ipairs(arg10) do
    eui:uiGridListSetItemText(var1.gridlist.interiors, eui:uiGridListAddRow(var1.gridlist.interiors), 1, tostring(forvar30.id))
    eui:uiGridListSetItemColor(var1.gridlist.interiors, eui:uiGridListAddRow(var1.gridlist.interiors), 1, tocolor(255, 55, 95, 255))
    eui:uiGridListSetItemText(var1.gridlist.interiors, eui:uiGridListAddRow(var1.gridlist.interiors), 2, tostring(forvar30.name))
  end
  eui:uiSetText(var0.label[3], "Interiors  #FFFFFF" .. "( ${color.primary}" .. tostring(#arg10) .. "#ffffff / " .. tostring(arg11) .. " )")
  eui:uiSetText(var0.memo[1], arg12)
end)
function convertNumber(arg0)
  while true do
    k = string.gsub(arg0, "^(-?%d+)(%d%d%d)", "%1,%2")
    if k == 0 then
      break
    end
  end
  return string.gsub(arg0, "^(-?%d+)(%d%d%d)", "%1,%2")
end
function convertTimeToString(arg0)
  arg0 = tonumber(arg0) or 0
  if math.floor(arg0 / (24 * (60 * 60))) == 0 then
    if math.floor(arg0 % (24 * (60 * 60)) / (60 * 60)) == 0 then
      return math.floor(arg0 % (24 * (60 * 60)) % (60 * 60) / 60) .. "m " .. math.ceil(arg0 % (24 * (60 * 60)) % (60 * 60) % 60) .. "s"
    else
      return math.floor(arg0 % (24 * (60 * 60)) / (60 * 60)) .. "h " .. math.floor(arg0 % (24 * (60 * 60)) % (60 * 60) / 60) .. "m"
    end
  else
    return math.floor(arg0 / (24 * (60 * 60))) .. "d " .. math.floor(arg0 % (24 * (60 * 60)) / (60 * 60)) .. "h"
  end
end
function UIKitReady()
  eui = exports.UIKit
  var0.window[1] = eui:uiCreateWindow(false, false, 350, 140, "Change Profile Picture")
  eui:uiWindowSetMovable(var0.window[1], false)
  eui:uiSetVisible(var0.window[1], false)
  var0.rect.URL = eui:uiCreateRectangle(10, 40, 330, 30, tocolor(40, 40, 40, 240), true, true, true, true, var0.window[1])
  var0.edit.URL = eui:uiCreateEdit(5, 4, 320, 25, "", "Picture URL", _, var0.rect.URL)
  eui:uiSetProperty(var0.edit.URL, "UnderLineVisible", "False")
  var0.label[1] = eui:uiCreateLabel(5, 75, 340, 15, "", tocolor(255, 255, 255, 240), "left", "top", var0.window[1])
  eui:uiSetAlign(var0.label[1], "center", "center")
  var0.button[1] = eui:uiCreateButton(5, 105, 119, 30, "Change", _, var0.window[1])
  var0.button[2] = eui:uiCreateButton(126, 105, 119, 30, "Cancel", _, var0.window[1])
end
addEventHandler("onClientUIReady", resourceRoot, UIKitReady)
addEventHandler("onClientUIKitReady", root, UIKitReady)
addEvent("rp:showChangeProfilePicWindow", true)
addEventHandler("rp:showChangeProfilePicWindow", root, function()
  eui:uiSetVisible(var0.window[1], true)
  showCursor(true)
  eui:uiSetText(var0.edit.URL, "")
  eui:uiSetText(var0.label[1], "")
  eui:uiBringToFront(var0.window[1])
end)
addEventHandler("onClientUIClick", root, function()
  if source == var0.button[1] then
    if string.gsub(eui:uiGetText(var0.edit.URL), " ", "") ~= "" then
      if string.find(string.lower((eui:uiGetText(var0.edit.URL))), ".png", 1, true) or string.find(string.lower((eui:uiGetText(var0.edit.URL))), ".jpg", 1, true) or string.find(string.lower((eui:uiGetText(var0.edit.URL))), ".jpeg", 1, true) then
        eui:uiSetText(var0.label[1], "Loading ...")
        triggerServerEvent("rp:loadNewProfilePic", localPlayer, (eui:uiGetText(var0.edit.URL)))
      else
        eui:uiSetText(var0.label[1], "#FF0000Invalid URL")
      end
    else
      eui:uiSetText(var0.label[1], "Please enter picture URL")
    end
  elseif source == var0.button[2] then
    eui:uiSetVisible(var0.window[1], false)
    showCursor(false)
  end
end)
addEvent("rp:onLoadNewProfilePic", true)
addEventHandler("rp:onLoadNewProfilePic", root, function(arg0, arg1, arg2)
  eui:uiSetText(var0.label[1], tostring(arg0))
  if fileExists("ProfilePics/" .. tostring(arg2) .. ".png") then
    fileWrite(fileOpen("ProfilePics/" .. tostring(arg2) .. ".png"), arg1)
    fileClose((fileOpen("ProfilePics/" .. tostring(arg2) .. ".png")))
  else
    fileWrite(fileCreate("ProfilePics/" .. tostring(arg2) .. ".png"), arg1)
    fileClose((fileCreate("ProfilePics/" .. tostring(arg2) .. ".png")))
  end
end)
addEvent("rp:un/load:profilePic", true)
addEventHandler("rp:un/load:profilePic", root, function(arg0, arg1, arg2)
  if arg0 == 1 then
    if fileExists("ProfilePics/" .. tostring(arg2) .. ".png") then
      fileWrite(fileOpen("ProfilePics/" .. tostring(arg2) .. ".png"), arg1)
      fileClose((fileOpen("ProfilePics/" .. tostring(arg2) .. ".png")))
    else
      fileWrite(fileCreate("ProfilePics/" .. tostring(arg2) .. ".png"), arg1)
      fileClose((fileCreate("ProfilePics/" .. tostring(arg2) .. ".png")))
    end
  elseif arg0 == 0 and fileExists("ProfilePics/" .. tostring(arg2) .. ".png") then
    fileDelete("ProfilePics/" .. tostring(arg2) .. ".png")
  end
end)
current_character_stats = {}
function getCharacterStat(arg0)
  if current_character_stats then
    return current_character_stats[tostring(arg0)] or current_character_stats[arg0] or 0
  end
  return getPedStat(localPlayer, arg0)
end
addEvent("rp:character:stats:sync", true)
addEventHandler("rp:character:stats:sync", root, function(arg0, arg1)
  current_character_stats[tostring(arg0)] = arg1
end)
