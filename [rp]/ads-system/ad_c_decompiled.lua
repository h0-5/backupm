-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

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
  combobox = {}
}
function UIKitReady()
  eui = exports.UIKit
  UI.window.Ads = eui:uiCreateWindow(false, false, 700, 470, {
    en = "ADVERTISEMENTS",
    ar = "\216\167\217\132\216\165\216\185\217\132\216\167\217\134\216\167\216\170"
  })
  eui:uiSetVisible(UI.window.Ads, false)
  eui:uiWindowSetMovable(UI.window.Ads, false)
  UI.tabpanel.Sections = eui:uiCreateTabPanel(2, 80, 696, 40, "", tocolor(30, 30, 30, 0), UI.window.Ads)
  eui:uiSetProperty(UI.tabpanel.Sections, "title_shown", false)
  eui:uiSetProperty(UI.tabpanel.Sections, "title_height", 0)
  for forvar3, forvar4 in ipairs(var0) do
    UI.tab[forvar4] = eui:uiCreateTab(forvar4, forvar4, UI.tabpanel.Sections)
  end
  UI.gridlist[1] = eui:uiCreateGridList(4, 80, 692, 340, tocolor(15, 15, 15, 0), UI.window.Ads)
  eui:uiGridListAddColumn(UI.gridlist[1], "Phone", 0.2)
  eui:uiGridListAddColumn(UI.gridlist[1], "Name", 0.2)
  eui:uiGridListAddColumn(UI.gridlist[1], "Advertisement", 0.6)
  eui:uiSetAlign(UI.gridlist[1], "left", "center")
  UI.button.CreateAd = eui:uiCreateButton(10, 430, 150, 30, {
    en = "Create Advertisement",
    ar = "\216\165\217\134\216\180\216\167\216\161 \216\165\216\185\217\132\216\167\217\134"
  }, "primary", UI.window.Ads)
  UI.button.Close = eui:uiCreateButton(170, 430, 100, 30, {en = "Close", ar = "\216\165\216\186\217\132\216\167\217\130"}, _, UI.window.Ads)
  UI.window.AddAdv = eui:uiCreateWindow(false, false, 330, 355, {
    en = "Create Advertisement",
    ar = "\216\165\217\134\216\180\216\167\216\161 \216\165\216\185\217\132\216\167\217\134"
  })
  eui:uiSetVisible(UI.window.AddAdv, false)
  eui:uiWindowSetMovable(UI.window.AddAdv, false)
  UI.label.Phone = eui:uiCreateLabel(15, 50, 80, 20, {
    en = "\194\187 Phone:",
    ar = "\194\187 \216\167\217\132\217\135\216\167\216\170\217\129:"
  }, "primary", "left", "top", UI.window.AddAdv)
  UI.edit.Phone = eui:uiCreateEdit(100, 50, 215, 20, "", "Phone", _, UI.window.AddAdv)
  UI.label.Name = eui:uiCreateLabel(15, 75, 80, 20, {
    en = "\194\187 Name:",
    ar = "\194\187 \216\167\217\132\216\167\216\179\217\133:"
  }, "primary", "left", "top", UI.window.AddAdv)
  UI.edit.Name = eui:uiCreateEdit(100, 75, 215, 20, "", "Name", _, UI.window.AddAdv)
  UI.label.Address = eui:uiCreateLabel(15, 100, 80, 20, {
    en = "\194\187 Address:",
    ar = "\194\187 \216\167\217\132\216\185\217\134\217\136\216\167\217\134:"
  }, "primary", "left", "top", UI.window.AddAdv)
  UI.edit.Address = eui:uiCreateEdit(100, 100, 215, 20, "", "Address", _, UI.window.AddAdv)
  UI.memo.Ad_content = eui:uiCreateMemo(10, 200, 310, 100, "", tocolor(255, 255, 255, 240), UI.window.AddAdv)
  UI.button.Post = eui:uiCreateButton(10, 315, 100, 30, {
    en = "Post",
    ar = "\217\134\216\181 \216\167\217\132\216\165\216\185\217\132\216\167\217\134"
  }, _, UI.window.AddAdv)
  UI.button.Close_AddAdv = eui:uiCreateButton(120, 315, 100, 30, {en = "Close", ar = "\216\165\216\186\217\132\216\167\217\130"}, _, UI.window.AddAdv)
  UI.label.Expires = eui:uiCreateLabel(15, 135, 80, 20, {
    en = "\194\187 Expires:",
    ar = "\194\187 \217\138\217\134\216\170\217\135\217\138:"
  }, "primary", "left", "top", UI.window.AddAdv)
  UI.combobox.Expires = eui:uiCreateComboBox(100, 135, 215, 20, "Expires", tocolor(255, 255, 255), UI.window.AddAdv)
  UI.label.Types = eui:uiCreateLabel(15, 160, 80, 20, {
    en = "\194\187 Type:",
    ar = "\194\187 \216\167\217\132\217\134\217\136\216\185:"
  }, "primary", "left", "top", UI.window.AddAdv)
  UI.combobox.Types = eui:uiCreateComboBox(100, 160, 215, 20, "Type", tocolor(255, 255, 255), UI.window.AddAdv)
  for forvar3, forvar4 in ipairs(var1) do
    eui:uiComboBoxAddItem(UI.combobox.Expires, forvar4)
  end
  for forvar3, forvar4 in ipairs(var0) do
    eui:uiComboBoxAddItem(UI.combobox.Types, forvar4)
  end
  UI.window.ReviewAd = eui:uiCreateWindow(false, false, 335, 355, {
    en = "Advertisement",
    ar = "\216\165\216\185\217\132\216\167\217\134"
  })
  eui:uiSetVisible(UI.window.ReviewAd, false)
  eui:uiWindowSetMovable(UI.window.ReviewAd, false)
  UI.label.AdDetails = eui:uiCreateLabel(10, 50, 310, 190, "", tocolor(255, 255, 255, 255), "left", "top", UI.window.ReviewAd)
  UI.label.AdDetailsText = eui:uiCreateLabel(10, 240, 310, 60, "", tocolor(255, 255, 255, 255), "left", "top", UI.window.ReviewAd)
  eui:uiSetProperty(UI.label.AdDetailsText, "color_coded", false)
  eui:uiSetProperty(UI.label.AdDetailsText, "word_break", true)
  UI.button.Push = eui:uiCreateButton(10, 315, 100, 30, {
    en = "Push ($100)",
    ar = "\216\165\216\177\216\179\216\167\217\132 ($100)"
  }, _, UI.window.ReviewAd)
  UI.button.Remove = eui:uiCreateButton(118, 315, 100, 30, {en = "Remove", ar = "\216\173\216\176\217\129"}, _, UI.window.ReviewAd)
  UI.button.Close_ReviewAd = eui:uiCreateButton(225, 315, 100, 30, {en = "Close", ar = "\216\165\216\186\217\132\216\167\217\130"}, _, UI.window.ReviewAd)
end
addEventHandler("onClientUIReady", resourceRoot, UIKitReady)
addEventHandler("onClientUIKitReady", root, UIKitReady)
function closeUIWindows(arg0)
  eui:uiSetVisible(UI.window.Ads, false)
  eui:uiSetVisible(UI.window.AddAdv, false)
  eui:uiSetVisible(UI.window.ReviewAd, false)
  showCursor(false)
end
addEvent("onClientPlayerQuitFromCharacter", true)
addEventHandler("onClientPlayerQuitFromCharacter", localPlayer, closeUIWindows)
addEventHandler("onClientPlayerWasted", localPlayer, closeUIWindows)
addCommandHandler("ads", function()
  if not getElementData(localPlayer, "character:id") then
    return
  end
  eui:uiSetVisible(UI.window.AddAdv, false)
  eui:uiSetVisible(UI.window.ReviewAd, false)
  eui:uiSetVisible(UI.window.Ads, true)
  showCursor(true)
  eui:uiSetSelectedTab(UI.tabpanel.Sections, UI.tab[var0[1]])
end, false, false)
addEventHandler("onClientUIClick", root, function()
  if source == UI.button.Close then
    eui:uiSetVisible(UI.window.Ads, false)
    showCursor(false)
  elseif source == UI.button.CreateAd then
    eui:uiSetVisible(UI.window.Ads, false)
    eui:uiSetVisible(UI.window.AddAdv, true)
    eui:uiSetText(UI.edit.Phone, "")
    eui:uiSetText(UI.edit.Name, "")
    eui:uiSetText(UI.edit.Address, "")
    eui:uiSetText(UI.memo.Ad_content, "")
  elseif source == UI.button.Close_AddAdv then
    eui:uiSetVisible(UI.window.AddAdv, false)
    eui:uiSetVisible(UI.window.Ads, true)
  elseif source == UI.button.Close_ReviewAd then
    eui:uiSetVisible(UI.window.ReviewAd, false)
    eui:uiSetVisible(UI.window.Ads, true)
  elseif source == UI.button.Post then
    if not tonumber((eui:uiGetText(UI.edit.Phone))) then
      eui:uiLabelApplyShakeAnimation(UI.label.Phone)
      return
    end
    if not (#eui:uiGetText(UI.edit.Name) >= 3) then
      eui:uiLabelApplyShakeAnimation(UI.label.Name)
      return
    end
    if eui:uiComboBoxGetSelected(UI.combobox.Expires) == -1 then
      eui:uiLabelApplyShakeAnimation(UI.label.Expires)
      return
    end
    if eui:uiComboBoxGetSelected(UI.combobox.Types) == -1 then
      eui:uiLabelApplyShakeAnimation(UI.label.Types)
      return
    end
    if #eui:uiGetText(UI.memo.Ad_content) > 10 then
      triggerServerEvent("ads:addAdvertisement", localPlayer, eui:uiGetText(UI.edit.Phone), eui:uiGetText(UI.edit.Name), eui:uiGetText(UI.edit.Address), eui:uiComboBoxGetItemText(UI.combobox.Expires, (eui:uiComboBoxGetSelected(UI.combobox.Expires))), eui:uiComboBoxGetItemText(UI.combobox.Types, (eui:uiComboBoxGetSelected(UI.combobox.Types))), (eui:uiGetText(UI.memo.Ad_content)))
      eui:uiSetVisible(UI.window.AddAdv, false)
      eui:uiSetVisible(UI.window.Ads, true)
    end
  elseif source == UI.button.Push then
    triggerServerEvent("ads:pushAdvertisement", localPlayer, viewedAdID)
  elseif source == UI.button.Remove then
    eui:uiSetVisible(UI.window.ReviewAd, false)
    eui:uiSetVisible(UI.window.Ads, true)
    triggerServerEvent("ads:removeAdvertisement", localPlayer, viewedAdID)
  end
end)
addEventHandler("onClientUITabSwitched", root, function(arg0, arg1)
  if not arg1 then
    return
  end
  if source == UI.tabpanel.Sections then
    openSection((eui:uiGetText(arg1)))
  end
end)
addEventHandler("onClientUIDoubleClick", root, function()
  if source == UI.gridlist[1] and eui:uiGridListGetSelectedItem(source) ~= -1 then
    eui:uiSetVisible(UI.window.Ads, false)
    eui:uiSetVisible(UI.window.ReviewAd, true)
    viewedAdID = eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1).ID
    if eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1).Creator == getElementData(localPlayer, "character:name") then
      eui:uiSetVisible(UI.button.Push, true)
      eui:uiSetVisible(UI.button.Remove, true)
    else
      eui:uiSetVisible(UI.button.Push, false)
      if exports.hud:getHudSetting("admintag") then
        eui:uiSetVisible(UI.button.Remove, true)
      else
        eui:uiSetVisible(UI.button.Remove, false)
      end
    end
    eui:uiSetText(UI.label.AdDetails, "${color.primary}\226\128\162 Phone  \194\187  #FFFFFF" .. eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1).Phone .. "\n" .. "${color.primary}\226\128\162 Name  \194\187  #FFFFFF" .. eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1).Name .. "\n" .. "${color.primary}\226\128\162 Address  \194\187  #FFFFFF" .. eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1).Address .. [[


]] .. "${color.primary}\226\128\162 Start  \194\187  #FFFFFF" .. (var0[getRealTime(eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1).CreateTimestamp).weekday] .. ", " .. var1.monthName[getRealTime(eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1).CreateTimestamp).month][1] .. " " .. getRealTime(eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1).CreateTimestamp).monthday .. " " .. getRealTime(eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1).CreateTimestamp).year + 1900 .. ", " .. getRealTime(eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1).CreateTimestamp).hour .. ":" .. getRealTime(eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1).CreateTimestamp).minute .. ":" .. getRealTime(eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1).CreateTimestamp).second) .. "\n" .. "${color.primary}\226\128\162 Expires  \194\187  #FFFFFF" .. (var0[getRealTime(eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1).CreateTimestamp + eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1).Expires).weekday] .. ", " .. var1.monthName[getRealTime(eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1).CreateTimestamp + eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1).Expires).month][1] .. " " .. getRealTime(eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1).CreateTimestamp + eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1).Expires).monthday .. " " .. getRealTime(eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1).CreateTimestamp + eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1).Expires).year + 1900 .. ", " .. getRealTime(eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1).CreateTimestamp + eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1).Expires).hour .. ":" .. getRealTime(eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1).CreateTimestamp + eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1).Expires).minute .. ":" .. getRealTime(eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1).CreateTimestamp + eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1).Expires).second) .. "\n" .. "${color.primary}\226\128\162 Type  \194\187  #FFFFFF" .. eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1).AdType .. "\n" .. "${color.primary}\226\128\162 Creator  \194\187  #FFFFFF" .. eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1).Creator .. [[


]] .. "${color.primary}\226\128\162 Advertisement space  \194\187  \n#FFFFFF")
    eui:uiSetText(UI.label.AdDetailsText, eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1).Ad)
  end
end)
function openSection(arg0)
  eui:uiSetProperty(UI.window.Ads, "Disabled", "True")
  eui:uiGridListClear(UI.gridlist[1])
  eui:uiGridListSetItemText(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 1, "Loading...")
  triggerServerEvent("ads:onCallSectionData", localPlayer, arg0)
end
addEvent("ads:onSendSectionData", true)
addEventHandler("ads:onSendSectionData", root, function(arg0, arg1)
  eui:uiSetProperty(UI.window.Ads, "Disabled", "False")
  eui:uiGridListClear(UI.gridlist[1])
  for forvar5, forvar6 in ipairs(arg1) do
    if forvar6 then
      eui:uiGridListSetItemText(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 1, forvar6.Phone)
      eui:uiGridListSetItemData(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 1, forvar6)
      eui:uiGridListSetItemText(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 2, forvar6.Name)
      if 1 < #split(forvar6.Ad, "\n") then
        eui:uiGridListSetItemText(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 3, split(forvar6.Ad, "\n")[1] .. "...")
      else
        eui:uiGridListSetItemText(UI.gridlist[1], eui:uiGridListAddRow(UI.gridlist[1]), 3, split(forvar6.Ad, "\n")[1])
      end
    end
  end
end)
