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
  checklist = {},
  edit = {},
  rect = {},
  combobox = {},
  rectangle = {},
  container = {}
}
isKey = {}
function UIKitReady()
  eui = exports.UIKit
  UI.window[1] = eui:uiCreateWindow(false, false, 261, 324, "Select your account")
  eui:uiSetVisible(UI.window[1], false)
  eui:uiWindowSetMovable(UI.window[1], false)
  UI.label[1] = eui:uiCreateLabel(15, 40, 231, 15, {
    en = "Account ID:",
    ar = "\217\133\216\185\216\177\217\129 \216\167\217\132\216\173\216\179\216\167\216\168:"
  }, tocolor(255, 255, 255, 255), "left", "top", UI.window[1])
  UI.edit[1] = eui:uiCreateEdit(15, 60, 231, 25, "", "", _, UI.window[1])
  UI.label[2] = eui:uiCreateLabel(15, 100, 231, 15, {
    en = "PIN:",
    ar = "\216\167\217\132\216\177\217\133\216\178:"
  }, tocolor(255, 255, 255, 255), "left", "top", UI.window[1])
  UI.edit[2] = eui:uiCreateEdit(15, 120, 231, 25, "", "", _, UI.window[1])
  eui:uiEditSetMasked(UI.edit[2], true)
  UI.label[3] = eui:uiCreateLabel(15, 160, 231, 15, {
    en = "Your accounts",
    ar = "\216\173\216\179\216\167\216\168\216\167\216\170\217\131"
  }, tocolor(255, 255, 255, 255), "left", "top", UI.window[1])
  UI.combobox[1] = eui:uiCreateComboBox(15, 180, 231, 20, "", tocolor(255, 255, 255, 255), UI.window[1])
  UI.button[1] = eui:uiCreateButton(15, 236, 231, 33, {
    en = "Open Account",
    ar = "\217\129\216\170\216\173 \216\167\217\132\216\173\216\179\216\167\216\168"
  }, _, UI.window[1])
  UI.button[2] = eui:uiCreateButton(15, 275, 231, 33, {en = "Cancel", ar = "\216\165\217\132\216\186\216\167\216\161"}, _, UI.window[1])
  UI.window.Bank = eui:uiCreateRectangle(false, false, 450, 300, tocolor(15, 15, 15, 240), true, true, true, true)
  eui:uiSetVisible(UI.window.Bank, false)
  UI.label.Title = eui:uiCreateLabel(10, 10, 232, 20, "Bank", tocolor(255, 255, 255, 255), "left", "top", UI.window.Bank)
  eui:uiSetFont(UI.label.Title, "default-large")
  UI.label.Close = eui:uiCreateLabel(415, 10, 20, 20, "X", tocolor(255, 255, 255, 255), "right", "top", UI.window.Bank)
  eui:uiSetFont(UI.label.Close, "default-large")
  UI.label["Section:1"] = eui:uiCreateLabel(0, 30, 450, 270, "", tocolor(255, 255, 255, 255), "left", "top", UI.window.Bank)
  UI.label.Info = eui:uiCreateLabel(10, 10, 350, 40, "${color.primary}\226\128\162 Account Owner \194\187  #FFFFFF" .. "N/A" .. "\n${color.primary}\226\128\162 Balance  \194\187  #00FF00$" .. "0", tocolor(255, 255, 255, 255), "left", "top", UI.label["Section:1"])
  UI.label.AccountID = eui:uiCreateLabel(0, -20, 400, 20, "-", tocolor(255, 255, 255, 150), "right", "top", UI.label["Section:1"])
  eui:uiSetFont(UI.label.AccountID, "default-large")
  UI.label.Amount = eui:uiCreateLabel(20, 60, 42 + 42 + 40, 20, "$0", tocolor(255, 255, 255, 255), "center", "center", UI.label["Section:1"])
  eui:uiSetFont(UI.label.Amount, "default-large")
  isKey[eui:uiCreateButton(20, 90, 40, 40, "1", tocolor(10, 10, 10, 255), UI.label["Section:1"])] = true
  isKey[eui:uiCreateButton(20 + 42, 90, 40, 40, "2", tocolor(10, 10, 10, 255), UI.label["Section:1"])] = true
  isKey[eui:uiCreateButton(20 + 42 * 2, 90, 40, 40, "3", tocolor(10, 10, 10, 255), UI.label["Section:1"])] = true
  isKey[eui:uiCreateButton(20, 90 + 42, 40, 40, "4", tocolor(10, 10, 10, 255), UI.label["Section:1"])] = true
  isKey[eui:uiCreateButton(20 + 42, 90 + 42, 40, 40, "5", tocolor(10, 10, 10, 255), UI.label["Section:1"])] = true
  isKey[eui:uiCreateButton(20 + 42 * 2, 90 + 42, 40, 40, "6", tocolor(10, 10, 10, 255), UI.label["Section:1"])] = true
  isKey[eui:uiCreateButton(20, 90 + 42 * 2, 40, 40, "7", tocolor(10, 10, 10, 255), UI.label["Section:1"])] = true
  isKey[eui:uiCreateButton(20 + 42, 90 + 42 * 2, 40, 40, "8", tocolor(10, 10, 10, 255), UI.label["Section:1"])] = true
  isKey[eui:uiCreateButton(20 + 42 * 2, 90 + 42 * 2, 40, 40, "9", tocolor(10, 10, 10, 255), UI.label["Section:1"])] = true
  isKey[eui:uiCreateButton(20, 90 + 42 * 3, 40, 40, "\194\171", tocolor(10, 10, 10, 255), UI.label["Section:1"])] = true
  isKey[eui:uiCreateButton(20 + 42, 90 + 42 * 3, 40, 40, "0", tocolor(10, 10, 10, 255), UI.label["Section:1"])] = true
  isKey[eui:uiCreateButton(20 + 42 * 2, 90 + 42 * 3, 40, 40, "C", tocolor(10, 10, 10, 255), UI.label["Section:1"])] = true
  UI.button.Deposit = eui:uiCreateButton(170, 100, 200, 30, {
    en = "\194\171  Deposit",
    ar = "\194\171  \216\165\217\138\216\175\216\167\216\185"
  }, tocolor(10, 10, 10, 240), UI.label["Section:1"])
  UI.button.Withdraw = eui:uiCreateButton(170, 135, 200, 30, {
    en = "Withdraw  \194\187",
    ar = "\216\179\216\173\216\168  \194\187"
  }, tocolor(10, 10, 10, 240), UI.label["Section:1"])
  UI.edit.TransferAccount = eui:uiCreateEdit(170, 190, 200, 25, "", {
    en = "To Account",
    ar = "\216\165\217\132\217\137 \216\167\217\132\216\173\216\179\216\167\216\168"
  }, _, UI.label["Section:1"])
  UI.button.Transfer = eui:uiCreateButton(170, 225, 200, 30, {
    en = "Transfer  \194\187\194\187",
    ar = "\216\170\216\173\217\136\217\138\217\132  \194\187\194\187"
  }, tocolor(10, 10, 10, 240), UI.label["Section:1"])
  UI.window.CreateAccount = eui:uiCreateWindow(false, false, 420, 290, {
    en = "Create Bank Account",
    ar = "\216\165\217\134\216\180\216\167\216\161 \216\173\216\179\216\167\216\168 \216\168\217\134\217\131\217\138"
  })
  eui:uiSetVisible(UI.window.CreateAccount, false)
  eui:uiWindowSetMovable(UI.window.CreateAccount, false)
  eui:uiCreateLabel(15, 50, 200, 15, {
    en = "Enter your name:",
    ar = "\216\163\216\175\216\174\217\132 \216\167\216\179\217\133\217\131:"
  }, tocolor(255, 255, 255, 255), "left", "top", UI.window.CreateAccount)
  UI.edit["CA:Name"] = eui:uiCreateEdit(15, 70, 280, 25, "", {
    en = "your character name",
    ar = "\216\167\216\179\217\133 \216\180\216\174\216\181\217\138\216\170\217\131"
  }, _, UI.window.CreateAccount)
  eui:uiCreateLabel(15, 105, 200, 15, {
    en = "Enter your personal ID number:",
    ar = "\216\163\216\175\216\174\217\132 \216\177\217\130\217\133\217\131 \216\167\217\132\216\180\216\174\216\181\217\138:"
  }, tocolor(255, 255, 255, 255), "left", "top", UI.window.CreateAccount)
  UI.edit["CA:CID"] = eui:uiCreateEdit(15, 125, 280, 25, "", {
    en = "your character personal ID (/myid)",
    ar = "\216\167\217\132\216\177\217\130\217\133 \216\167\217\132\216\180\216\174\216\181\217\138 \217\132\216\180\216\174\216\181\217\138\216\170\217\131 (/myid)"
  }, _, UI.window.CreateAccount)
  eui:uiCreateLabel(15, 160, 200, 15, {
    en = "PIN (4 digits):",
    ar = "\216\167\217\132\216\177\217\133\216\178 (4 \216\163\216\177\217\130\216\167\217\133):"
  }, tocolor(255, 255, 255, 255), "left", "top", UI.window.CreateAccount)
  UI.edit["CA:Pin"] = eui:uiCreateEdit(15, 180, 100, 25, "", {en = "PIN", ar = "\216\167\217\132\216\177\217\133\216\178"}, _, UI.window.CreateAccount)
  eui:uiCreateLabel(15, 220, 200, 15, {
    en = "Note: You must deposit $1000 to set up the account.",
    ar = "\217\133\217\132\216\167\216\173\216\184\216\169: \217\138\216\172\216\168 \216\165\217\138\216\175\216\167\216\185 1000$ \217\132\216\165\217\134\216\180\216\167\216\161 \216\167\217\132\216\173\216\179\216\167\216\168"
  }, tocolor(255, 255, 255, 220), "left", "top", UI.window.CreateAccount)
  UI.button.CreateAccount = eui:uiCreateButton(15, 250, 150, 30, {
    en = "Create Account",
    ar = "\216\165\217\134\216\180\216\167\216\161 \216\167\217\132\216\173\216\179\216\167\216\168"
  }, _, UI.window.CreateAccount)
  UI.button.CancelCreateAccount = eui:uiCreateButton(170, 250, 100, 30, {en = "Cancel", ar = "\216\165\217\132\216\186\216\167\216\161"}, _, UI.window.CreateAccount)
  UI.window.ChangePIN = eui:uiCreateWindow(false, false, 261, 324, "Change Account PIN")
  eui:uiSetVisible(UI.window.ChangePIN, false)
  eui:uiWindowSetMovable(UI.window.ChangePIN, false)
  eui:uiCreateLabel(15, 40, 231, 15, {
    en = "Your Account",
    ar = "\216\173\216\179\216\167\216\168\217\131"
  }, tocolor(255, 255, 255, 255), "left", "top", UI.window.ChangePIN)
  UI.combobox.AccountToChangePIN = eui:uiCreateComboBox(15, 60, 231, 20, "", tocolor(255, 255, 255, 255), UI.window.ChangePIN)
  eui:uiCreateLabel(15, 110, 231, 15, {
    en = "PIN:",
    ar = "\216\167\217\132\216\177\217\133\216\178:"
  }, tocolor(255, 255, 255, 255), "left", "top", UI.window.ChangePIN)
  UI.edit.NewPIN = eui:uiCreateEdit(15, 130, 231, 20, "", "", _, UI.window.ChangePIN)
  eui:uiEditSetMasked(UI.edit.NewPIN, true)
  eui:uiCreateLabel(15, 160, 231, 15, {
    en = "Confirm PIN:",
    ar = "\216\170\216\163\217\131\217\138\216\175 \216\167\217\132\216\177\217\133\216\178:"
  }, tocolor(255, 255, 255, 255), "left", "top", UI.window.ChangePIN)
  UI.edit.NewPIN_Confirm = eui:uiCreateEdit(15, 180, 231, 20, "", "", _, UI.window.ChangePIN)
  eui:uiEditSetMasked(UI.edit.NewPIN_Confirm, true)
  UI.button.ChangePIN = eui:uiCreateButton(15, 236, 231, 33, {
    en = "Change Now",
    ar = "\216\170\216\186\217\138\217\138\216\177 \216\167\217\132\216\177\217\133\216\178 \216\167\217\132\216\162\217\134"
  }, _, UI.window.ChangePIN)
  UI.button.CancelChangePIN = eui:uiCreateButton(15, 275, 231, 33, {en = "Cancel", ar = "\216\165\217\132\216\186\216\167\216\161"}, _, UI.window.ChangePIN)
end
addEventHandler("onClientUIReady", resourceRoot, UIKitReady)
addEventHandler("onClientUIKitReady", root, UIKitReady)
function closeUIWindows(arg0)
  eui:uiSetVisible(UI.window[1], false)
  eui:uiSetVisible(UI.window.Bank, false)
  eui:uiSetVisible(UI.window.CreateAccount, false)
  eui:uiSetVisible(UI.window.ChangePIN, false)
end
addEvent("onClientPlayerQuitFromCharacter", true)
addEventHandler("onClientPlayerQuitFromCharacter", localPlayer, closeUIWindows)
addEventHandler("onClientPlayerWasted", localPlayer, closeUIWindows)
addEvent("phone:app:request", true)
addEventHandler("phone:app:request", localPlayer, function(arg0, arg1, arg2, arg3, arg4, arg5)
  if arg0 == "bank" then
    if not isElement(UI.rectangle["app:top"]) then
      UI.label["wallet:screen:main"] = eui:uiCreateContainer(arg2, arg3, arg4, arg5, arg1)
      UI.label.Title = eui:uiCreateLabel(30, 30, 200, 20, {en = "Wallet", ar = "Wallet"}, tocolor(255, 255, 255, 255), "left", "top", UI.label["wallet:screen:main"])
      eui:uiSetFont(UI.label.Title, "default-large")
      eui:uiCreateRectangle(0, 70, arg4, 1, tocolor(255, 255, 255, 25), false, false, false, false, UI.label["wallet:screen:main"])
      eui:uiCreateLabel(30, 100, arg4 - 60, 20, {
        en = "Your Bank Accounts",
        ar = "\216\173\216\179\216\167\216\168\216\167\216\170\217\131 \216\167\217\132\216\168\217\134\217\131\217\138\216\169"
      }, tocolor(255, 255, 255, 255), "center", "top", UI.label["wallet:screen:main"])
      UI.gridlist.bank_accounts = eui:uiCreateGridList(5, 130, arg4 - 10, 300, tocolor(10, 10, 10, 0), UI.label["wallet:screen:main"])
      eui:uiGridListAddColumn(UI.gridlist.bank_accounts, "", 1)
      eui:uiSetAlign(UI.gridlist.bank_accounts, "left", "center")
      eui:uiSetProperty(UI.gridlist.bank_accounts, "row_height", 40)
      eui:uiSetProperty(UI.gridlist.bank_accounts, "columns_names_visible", "False")
      eui:uiSetProperty(UI.gridlist.bank_accounts, "column_height", 0)
      UI.label["wallet:screen:account"] = eui:uiCreateContainer(arg2, arg3, arg4, arg5, arg1)
      eui:uiSetVisible(UI.label["wallet:screen:account"], false)
      UI.button["wallet:account:return"] = eui:uiCreateImage(25, 58, 16, 16, ":phone-system/IMG/icons/left-arrow.png", UI.label["wallet:screen:account"])
      eui:uiSetProperty(UI.button["wallet:account:return"], "HoverOpacityEffect", true)
      eui:uiCreateLabel(30, 100, arg4 - 60, 20, {
        en = "Account Balance",
        ar = "\216\177\216\181\217\138\216\175 \216\167\217\132\216\173\216\179\216\167\216\168"
      }, tocolor(255, 255, 255, 255), "center", "top", UI.label["wallet:screen:account"])
      UI.label["wallet:balance"] = eui:uiCreateLabel(30, 130, arg4 - 60, 30, "$0", tocolor(0, 255, 0, 255), "center", "center", UI.label["wallet:screen:account"])
      eui:uiSetFont(UI.label["wallet:balance"], "default-large")
      eui:uiCreateLabel(30, 200, arg4 - 60, 20, {
        en = "Transfer Amount",
        ar = "\216\170\216\173\217\136\217\138\217\132 \217\133\216\168\217\132\216\186"
      }, tocolor(255, 255, 255, 255), "center", "top", UI.label["wallet:screen:account"])
      UI.edit["wallet:transfer:account"] = eui:uiCreateEdit(25, 230, arg4 - 50, 30, "", {
        en = "Account ID",
        ar = "\217\133\216\185\216\177\217\129 \216\167\217\132\216\173\216\179\216\167\216\168"
      }, _, UI.label["wallet:screen:account"])
      UI.edit["wallet:transfer:amount"] = eui:uiCreateEdit(25, 270, arg4 - 50, 30, "", {
        en = "Amount",
        ar = "\216\167\217\132\217\133\216\168\217\132\216\186"
      }, _, UI.label["wallet:screen:account"])
      eui:uiCreateLabel(30, 300, arg4 - 60, 100, {
        en = [[
				You can transfer limited amounts
				To transfer larger amounts you
				must go to the bank
			]],
        ar = "\t\t\t\t\216\170\216\179\216\170\216\183\217\138\216\185 \216\170\216\173\217\136\217\138\217\132 \217\133\216\168\216\167\217\132\216\186 \217\133\216\173\216\175\217\136\216\175\216\169\n\t\t\t\t\217\132\216\170\216\173\217\136\217\138\217\132 \217\133\216\168\216\167\217\132\216\186 \216\163\217\131\216\168\216\177 \217\138\216\172\216\168 \216\185\217\132\217\138\217\131\n\t\t\t\t\216\167\217\132\216\176\217\135\216\167\216\168 \217\132\217\132\216\168\217\134\217\131\n\t\t\t"
      }, tocolor(255, 255, 255, 255), "center", "center", UI.label["wallet:screen:account"])
      UI.button["wallet:tranfser"] = eui:uiCreateButton(25, 400, arg4 - 50, 35, {en = "Transfer", ar = "\216\170\216\173\217\136\217\138\217\132"}, tocolor(0, 122, 255, 240), UI.label["wallet:screen:account"])
      UI.container["app:bank_account"] = eui:uiCreateContainer(arg2, arg3, arg4, arg5, arg1)
      eui:uiSetVisible(UI.container["app:bank_account"], false)
      UI.rectangle["app:top"] = eui:uiCreateRectangle(0, 20, arg4, 120, tocolor(0, 0, 0, 180), true, true, true, true, UI.container["app:bank_account"])
      UI.label["app:title"] = eui:uiCreateLabel(0, 20, arg4, 20, "Wnash Bank", tocolor(255, 255, 255, 255), "center", "center", UI.rectangle["app:top"])
      eui:uiSetFont(UI.label["app:title"], "default-large")
      UI.button["app:account:return"] = eui:uiCreateImage(20, 22, 16, 16, ":phone-system/IMG/icons/left-arrow.png", UI.rectangle["app:top"])
      eui:uiSetProperty(UI.button["app:account:return"], "HoverOpacityEffect", true)
      UI.label["app:account_id"] = eui:uiCreateLabel(0, 60, arg4, 20, "xxxxxxxxxxxxxxxxxxxxxxx", tocolor(255, 255, 255, 150), "center", "center", UI.rectangle["app:top"])
      UI.rectangle["app:balance"] = eui:uiCreateRectangle(15, 90, arg4 - 30, 65, tocolor(20, 20, 20, 255), true, true, true, true, UI.rectangle["app:top"])
      eui:uiSetProperty(UI.rectangle["app:balance"], "border_radius", 8)
      eui:uiCreateLabel(15, 10, 100, 15, {
        en = "Balance",
        ar = "\216\167\217\132\216\177\216\181\217\138\216\175"
      }, tocolor(255, 255, 255, 200), "left", "top", UI.rectangle["app:balance"])
      UI.label["app:balance"] = eui:uiCreateLabel(15, 30, 100, 20, "$0,000,000", tocolor(0, 255, 0, 255), "left", "top", UI.rectangle["app:balance"])
      eui:uiSetFont(UI.label["app:balance"], "default-large")
      UI.button["app:transfer"] = eui:uiCreateButton(15, 215, arg4 - 30, 35, {
        en = "",
        ar = "\216\170\216\173\217\136\217\138\217\132 \217\133\216\168\217\132\216\186"
      }, _, UI.container["app:bank_account"])
      UI.gridlist["app:transactions"] = eui:uiCreateGridList(10, 280, arg4 - 20, arg5 - 300, tocolor(0, 0, 0, 0), UI.container["app:bank_account"])
      eui:uiGridListAddColumn(UI.gridlist["app:transactions"], "Transactions", 0.7)
      eui:uiGridListAddColumn(UI.gridlist["app:transactions"], "", 0.3)
    end
    triggerServerEvent("bank:get_accounts", localPlayer)
  end
end)
addEvent("bank:get_accounts:callback", true)
addEventHandler("bank:get_accounts:callback", root, function(arg0)
  eui:uiGridListClear(UI.gridlist.bank_accounts)
  for forvar4, forvar5 in ipairs(arg0) do
    eui:uiGridListSetItemText(UI.gridlist.bank_accounts, eui:uiGridListAddRow(UI.gridlist.bank_accounts), 1, forvar5.code)
  end
end)
addEvent("bank:get_account_details:callback", true)
addEventHandler("bank:get_account_details:callback", root, function(arg0, arg1)
  currentWalletAppAccount = arg0.code
  eui:uiSetText(UI.label["app:account_id"], tostring(arg0.code))
  eui:uiSetText(UI.label["app:balance"], "$" .. convertNumber(arg0.balance))
  eui:uiSetText(UI.label["wallet:balance"], "$" .. convertNumber(arg0.balance))
  eui:uiGridListClear(UI.gridlist["app:transactions"])
  for forvar5, forvar6 in ipairs(arg1) do
    eui:uiGridListSetItemText(UI.gridlist["app:transactions"], eui:uiGridListAddRow(UI.gridlist["app:transactions"]), 1, forvar6.added_date)
    eui:uiGridListSetItemText(UI.gridlist["app:transactions"], eui:uiGridListAddRow(UI.gridlist["app:transactions"]), 2, forvar6.log)
    if string.find(forvar6.log, "+", 1, true) then
      eui:uiGridListSetItemColor(UI.gridlist["app:transactions"], eui:uiGridListAddRow(UI.gridlist["app:transactions"]), 2, tocolor(0, 255, 0))
    else
      eui:uiGridListSetItemColor(UI.gridlist["app:transactions"], eui:uiGridListAddRow(UI.gridlist["app:transactions"]), 2, tocolor(255, 0, 0))
    end
  end
end)
addEventHandler("onClientUIDoubleClick", root, function()
  if source == UI.gridlist.bank_accounts and eui:uiGridListGetSelectedItem(source) ~= -1 then
    eui:uiSetVisible(UI.label["wallet:screen:main"], false)
    eui:uiSetVisible(UI.container["app:bank_account"], true)
    triggerServerEvent("bank:get_account_details", localPlayer, (eui:uiGridListGetItemText(source, eui:uiGridListGetSelectedItem(source), 1)))
  end
end)
function changeAlpha()
  if source == UI.label.Close then
    if eventName == "onClientUIMouseEnter" then
    end
    eui:uiSetColor(source, 255, 0, 0, 200)
  end
end
addEventHandler("onClientUIMouseEnter", root, changeAlpha)
addEventHandler("onClientUIMouseLeave", root, changeAlpha)
function convertNumber(arg0)
  while true do
    k = string.gsub(arg0, "^(-?%d+)(%d%d%d)", "%1,%2")
    if k == 0 then
      break
    end
  end
  return string.gsub(arg0, "^(-?%d+)(%d%d%d)", "%1,%2")
end
addEventHandler("onClientUIClick", root, function()
  if isKey[source] then
    if var0 == "0" then
      var0 = ""
    end
    if eui:uiGetText(source) == "\194\171" then
      var0 = utfSub(var0, 0, utfLen(var0) - 1)
      if var0 == "" then
        var0 = 0
      end
      eui:uiSetText(UI.label.Amount, "$" .. convertNumber(var0))
    elseif eui:uiGetText(source) == "C" then
      var0 = "0"
      eui:uiSetText(UI.label.Amount, "$0")
    elseif utfLen(var0) < 7 then
      var0 = var0 .. eui:uiGetText(source)
      eui:uiSetText(UI.label.Amount, "$" .. convertNumber(var0))
    else
      eui:uiLabelApplyShakeAnimation(UI.label.Amount)
    end
  elseif source == UI.button.Deposit then
    if tonumber(var0) then
      if 0 >= tonumber((tonumber(var0))) then
        return
      end
      eui:uiSetProperty(source, "Disabled", "True")
      triggerServerEvent("ATM:depositAmount", localPlayer, var1, (tonumber(var0)))
    end
  elseif source == UI.button.Withdraw then
    if tonumber(var0) then
      if 0 >= tonumber((tonumber(var0))) then
        return
      end
      eui:uiSetProperty(source, "Disabled", "True")
      triggerServerEvent("ATM:withdrawAmount", localPlayer, var1, tonumber(var0), "bank")
    end
  elseif source == UI.button.Transfer then
    if tonumber(var0) then
      if 0 >= tonumber((tonumber(var0))) then
        return
      end
      eui:uiSetProperty(source, "Disabled", "True")
      if utfLen((eui:uiGetText(UI.edit.TransferAccount))) > 2 then
        triggerServerEvent("ATM:transferAmount", localPlayer, var1, eui:uiGetText(UI.edit.TransferAccount), (tonumber(var0)))
      end
    end
  elseif source == UI.label.Close then
    showBankAccount(false)
  elseif source == UI.button[2] then
    eui:uiSetVisible(UI.window[1], false)
    showCursor(false)
  elseif source == UI.button[1] then
    if #eui:uiGetText(UI.edit[1]) ~= 0 and #eui:uiGetText(UI.edit[2]) ~= 0 then
      eui:uiSetText(UI.edit[2], "")
      triggerServerEvent("ATM:checkPassword", localPlayer, eui:uiGetText(UI.edit[1]), eui:uiGetText(UI.edit[2]), "bank")
    end
  elseif source == UI.button.CancelCreateAccount then
    eui:uiSetVisible(UI.window.CreateAccount, false)
    showCursor(false)
  elseif source == UI.button.CreateAccount then
    if eui:uiGetText(UI.edit["CA:Name"]):lower() == getElementData(localPlayer, "character:name"):lower() then
      if eui:uiGetText(UI.edit["CA:CID"]) == getElementData(localPlayer, "character:id") then
        if tonumber((eui:uiGetText(UI.edit["CA:Pin"]))) and 0 < tonumber((eui:uiGetText(UI.edit["CA:Pin"]))) and utfLen((eui:uiGetText(UI.edit["CA:Pin"]))) == 4 then
          triggerServerEvent("ATM:createAccount", localPlayer, (eui:uiGetText(UI.edit["CA:Pin"])))
          eui:uiSetVisible(UI.window.CreateAccount, false)
          showCursor(false)
        else
          outputChatBox("Error: check your PIN and try again (must be 4 digits only).", 255, 0, 0)
        end
      else
        outputChatBox("Error: Your presonal ID is incorrect.", 255, 0, 0)
      end
    else
      outputChatBox("Error: Your name is incorrect.", 255, 0, 0)
    end
  elseif source == UI.button.CancelChangePIN then
    eui:uiSetVisible(UI.window.ChangePIN, false)
    showCursor(false)
  elseif source == UI.button.ChangePIN then
    if eui:uiComboBoxGetSelected(UI.combobox.AccountToChangePIN) ~= -1 then
      if tonumber((eui:uiGetText(UI.edit.NewPIN))) then
        if #tostring((eui:uiGetText(UI.edit.NewPIN))) == 4 then
          if eui:uiGetText(UI.edit.NewPIN) == eui:uiGetText(UI.edit.NewPIN_Confirm) then
            triggerServerEvent("bank:changePIN", localPlayer, eui:uiComboBoxGetItemText(UI.combobox.AccountToChangePIN, (eui:uiComboBoxGetSelected(UI.combobox.AccountToChangePIN))), (eui:uiGetText(UI.edit.NewPIN)))
            eui:uiSetText(UI.edit.NewPIN, "")
            eui:uiSetText(UI.edit.NewPIN_Confirm, "")
          else
            outputChatBox("ERROR: The PIN does not match.", 255, 0, 0)
          end
        else
          outputChatBox("ERROR: The PIN must consist of 4 digits only.", 255, 0, 0)
        end
      else
        outputChatBox("ERROR: The PIN must consist of numbers only.", 255, 0, 0)
      end
    else
      outputChatBox("ERROR: Select your account.", 255, 0, 0)
    end
  elseif source == UI.label["app:account_id"] then
    setClipboard((eui:uiGetText(source)))
    exports.notifications:output({
      en = "Code copied",
      ar = "\216\170\217\133 \217\134\216\179\216\174 \216\167\217\132\217\131\217\136\216\175"
    }, 3000, "success")
    eui:uiLabelApplyShakeAnimation(source, tocolor(0, 255, 0, 255))
  elseif source == UI.button["app:account:return"] then
    eui:uiSetVisible(UI.container["app:bank_account"], false)
    eui:uiSetVisible(UI.label["wallet:screen:main"], true)
  elseif source == UI.button["wallet:account:return"] then
    eui:uiSetVisible(UI.label["wallet:screen:account"], false)
    eui:uiSetVisible(UI.container["app:bank_account"], true)
  elseif source == UI.button["app:transfer"] then
    eui:uiSetVisible(UI.container["app:bank_account"], false)
    eui:uiSetVisible(UI.label["wallet:screen:account"], true)
  elseif source == UI.button["wallet:tranfser"] then
    if not currentWalletAppAccount then
      return
    end
    if eui:uiGetText(UI.edit["wallet:transfer:account"]) ~= "" and tonumber((eui:uiGetText(UI.edit["wallet:transfer:amount"]))) and 0 < tonumber((eui:uiGetText(UI.edit["wallet:transfer:amount"]))) then
      if tonumber((eui:uiGetText(UI.edit["wallet:transfer:amount"]))) > 20000 then
        exports.notifications:output({
          en = "You can't transfer that much amount",
          ar = "\217\132\216\167\217\138\217\133\217\131\217\134\217\131 \216\170\216\173\217\136\217\138\217\132 \217\135\216\176\216\167 \216\167\217\132\217\133\216\168\217\132\216\186 \216\167\217\132\217\131\216\168\217\138\216\177"
        }, 3500, "error")
        return
      end
      if currentWalletAppAccount == eui:uiGetText(UI.edit["wallet:transfer:account"]) then
        return
      end
      eui:uiSetText(UI.edit["wallet:transfer:amount"], "")
      triggerServerEvent("phone:wallet:transfer", localPlayer, currentWalletAppAccount, eui:uiGetText(UI.edit["wallet:transfer:account"]), (tonumber((eui:uiGetText(UI.edit["wallet:transfer:amount"])))))
    end
  end
end)
addEventHandler("onClientUIComboBoxAccepted", root, function()
  if source == UI.combobox[1] then
    eui:uiSetText(UI.edit[1], tostring(eui:uiComboBoxGetItemText(source, (eui:uiComboBoxGetSelected(source)))))
  end
end)
function showBankAccount(arg0, arg1, arg2, arg3)
  eui:uiSetVisible(UI.window.Bank, arg0)
  showCursor(arg0)
  if arg0 then
    var0 = "0"
    eui:uiSetText(UI.label.Amount, "$0")
    eui:uiSetProperty(UI.button.Deposit, "Disabled", "False")
    eui:uiSetProperty(UI.button.Withdraw, "Disabled", "False")
    eui:uiSetProperty(UI.button.Transfer, "Disabled", "False")
    eui:uiSetText(UI.label.AccountID, arg1)
    var1 = arg2
    eui:uiSetText(UI.label.Info, "${color.primary}\226\128\162 Account Owner \194\187  #FFFFFF" .. arg2 .. "\n${color.primary}\226\128\162 Balance  \194\187  #00FF00$" .. convertNumber(arg3))
  end
end
addEvent("ATM:updateBalance", true)
addEventHandler("ATM:updateBalance", localPlayer, function(arg0, arg1)
  eui:uiSetProperty(UI.button.Deposit, "Disabled", "False")
  eui:uiSetProperty(UI.button.Withdraw, "Disabled", "False")
  eui:uiSetProperty(UI.button.Transfer, "Disabled", "False")
  var0 = "0"
  eui:uiSetText(UI.label.Amount, "$0")
  if arg0 then
    eui:uiSetText(UI.label.Info, "${color.primary}\226\128\162 Account Owner \194\187  #FFFFFF" .. var1 .. "\n${color.primary}\226\128\162 Balance  \194\187  #00FF00$" .. convertNumber(arg0))
  end
end)
EATM = {
  button = {},
  window = {},
  label = {},
  edit = {}
}
WATM = {
  button = {},
  window = {},
  radiobutton = {},
  label = {}
}
RCard = {
  edit = {},
  button = {},
  window = {},
  label = {},
  combobox = {}
}
addEventHandler("onClientResourceStart", resourceRoot, function()
  EATM.window[1] = guiCreateWindow((guiGetScreenSize() - 277) / 2, (guiGetScreenSize() - 153) / 2, 277, 153, "ATM", false)
  guiWindowSetSizable(EATM.window[1], false)
  guiWindowSetMovable(EATM.window[1], false)
  guiSetAlpha(EATM.window[1], 0.9)
  guiSetVisible(EATM.window[1], false)
  EATM.edit[1] = guiCreateEdit(10, 78, 257, 30, "", false, EATM.window[1])
  guiSetAlpha(EATM.edit[1], 0.8)
  guiEditSetMasked(EATM.edit[1], true)
  guiEditSetMaxLength(EATM.edit[1], 4)
  EATM.button[1] = guiCreateButton(10, 114, 108, 30, "Enter Account", false, EATM.window[1])
  EATM.button[2] = guiCreateButton(122, 114, 70, 30, "Cancel", false, EATM.window[1])
  EATM.label[1] = guiCreateLabel(12, 55, 180, 17, "Please enter the password:", false, EATM.window[1])
  EATM.label[2] = guiCreateLabel(12, 28, 180, 17, "Card ID: 0000000", false, EATM.window[1])
  WATM.window[1] = guiCreateWindow((guiGetScreenSize() - 288) / 2, (guiGetScreenSize() - 203) / 2, 288, 203, "ATM: Automated Teller Machine", false)
  guiWindowSetSizable(WATM.window[1], false)
  guiWindowSetMovable(WATM.window[1], false)
  guiSetAlpha(WATM.window[1], 0.9)
  guiSetVisible(WATM.window[1], false)
  WATM.label[1] = guiCreateLabel(10, 34, 268, 15, "Note: you can only withdraw from ATM", false, WATM.window[1])
  WATM.label[2] = guiCreateLabel(10, 59, 268, 15, "Balance: $0", false, WATM.window[1])
  guiSetFont(WATM.label[2], "default-bold-small")
  guiLabelSetColor(WATM.label[2], 16, 238, 32)
  WATM.label[3] = guiCreateLabel(10, 84, 268, 15, "Select amount:", false, WATM.window[1])
  WATM.radiobutton[1] = guiCreateRadioButton(10, 106, 134, 15, "$100", false, WATM.window[1])
  guiRadioButtonSetSelected(WATM.radiobutton[1], true)
  WATM.radiobutton[2] = guiCreateRadioButton(10, 126, 134, 15, "$1000", false, WATM.window[1])
  WATM.radiobutton[3] = guiCreateRadioButton(144, 106, 134, 15, "$2000", false, WATM.window[1])
  WATM.radiobutton[4] = guiCreateRadioButton(144, 126, 134, 15, "$5000", false, WATM.window[1])
  WATM.button[1] = guiCreateButton(10, 161, 173, 31, "Withdraw", false, WATM.window[1])
  WATM.button[2] = guiCreateButton(188, 161, 90, 32, "Cancel", false, WATM.window[1])
  RCard.window[1] = guiCreateWindow((guiGetScreenSize() - 320) / 2, (guiGetScreenSize() - 164) / 2, 320, 164, "Request Bank Card", false)
  guiWindowSetSizable(RCard.window[1], false)
  guiSetVisible(RCard.window[1], false)
  RCard.label[1] = guiCreateLabel(10, 33, 72, 17, "Account ID:", false, RCard.window[1])
  guiLabelSetVerticalAlign(RCard.label[1], "center")
  RCard.combobox[1] = guiCreateComboBox(10, 54, 183, 88, "", false, RCard.window[1])
  RCard.label[2] = guiCreateLabel(10, 84, 183, 14, "PIN:", false, RCard.window[1])
  guiLabelSetVerticalAlign(RCard.label[2], "center")
  RCard.edit[1] = guiCreateEdit(10, 103, 183, 29, "", false, RCard.window[1])
  guiEditSetMaxLength(RCard.edit[1], 4)
  RCard.button[1] = guiCreateButton(215, 69, 95, 29, "Get card", false, RCard.window[1])
  RCard.button[2] = guiCreateButton(214, 103, 96, 29, "Cancel", false, RCard.window[1])
  RCard.label[3] = guiCreateLabel(10, 142, 300, 15, "You must pay $10 to get new card", false, RCard.window[1])
  guiSetFont(RCard.label[3], "default-small")
end)
function closeAllWindows(arg0)
  guiSetVisible(EATM.window[1], false)
  guiSetVisible(WATM.window[1], false)
  guiSetVisible(RCard.window[1], false)
  showCursor(false)
end
addEvent("onClientPlayerQuitFromCharacter", true)
addEventHandler("onClientPlayerQuitFromCharacter", localPlayer, closeAllWindows)
addEventHandler("onClientPlayerWasted", localPlayer, closeAllWindows)
addEventHandler("onClientGUIClick", resourceRoot, function()
  if source == EATM.button[2] then
    guiSetVisible(EATM.window[1], false)
    showCursor(false)
  elseif source == EATM.button[1] then
    if guiGetText(EATM.edit[1]) ~= "" then
      triggerServerEvent("ATM:checkPassword", localPlayer, var0, (guiGetText(EATM.edit[1])))
    end
  elseif source == WATM.button[2] then
    guiSetVisible(WATM.window[1], false)
    showCursor(false)
  elseif source == WATM.button[1] then
    triggerServerEvent("ATM:withdrawAmount", localPlayer, var0, (getSelectedAmount()))
  elseif source == RCard.button[2] then
    guiSetVisible(RCard.window[1], false)
    showCursor(false)
  elseif source == RCard.button[1] then
    guiSetEnabled(RCard.window[1], false)
    guiSetVisible(RCard.window[1], false)
    showCursor(false)
    triggerServerEvent("ATM:requestCard", localPlayer, guiComboBoxGetItemText(RCard.combobox[1], (guiComboBoxGetSelected(RCard.combobox[1]))), (guiGetText(RCard.edit[1])))
  end
end)
function getSelectedAmount()
  for forvar3, forvar4 in pairs(WATM.radiobutton) do
    if guiRadioButtonGetSelected(forvar4) then
      return tonumber((guiGetText(forvar4):sub(2)))
    end
  end
end
addEvent("onClientUseItemForElement", true)
addEventHandler("onClientUseItemForElement", localPlayer, function(arg0, arg1, arg2, arg3)
  if getElementType(arg0) ~= "object" then
    return
  end
  if getElementModel(arg0) ~= 2942 then
    return
  end
  if arg3.Name == "Bank Card" then
    var0 = arg3.SpecialProperties.AccID
    triggerServerEvent("life:setAnimation", localPlayer, "ped", "ATM", -1, false, false, false, false)
    guiSetText(EATM.label[2], "Card ID: " .. tostring(arg3.SpecialProperties.AccID))
    guiSetText(EATM.edit[1], "")
    guiSetVisible(EATM.window[1], true)
    showCursor(true)
  end
end)
addEvent("ATM:openAccount", true)
addEventHandler("ATM:openAccount", localPlayer, function(arg0, arg1, arg2)
  var0 = arg0
  if arg2 == "bank" then
    showBankAccount(true, arg0, "", arg1)
    eui:uiSetVisible(UI.window[1], false)
    showCursor(true)
  else
    guiSetVisible(EATM.window[1], false)
    guiSetVisible(WATM.window[1], true)
    showCursor(true)
    guiSetText(WATM.label[2], "Balance: $" .. tostring(arg1))
  end
end)
addEvent("ATM:closeATM", true)
addEventHandler("ATM:closeATM", localPlayer, function(arg0, arg1)
  guiSetVisible(EATM.window[1], false)
  guiSetVisible(WATM.window[1], false)
  showCursor(false)
end)
addEvent("onClientUseItem", true)
addEventHandler("onClientUseItem", root, function(arg0, arg1, arg2)
  if arg2.Name == "Bank Card" then
    exports.notifications:sendNotification("#ff375fBank Card", "#FFFFFF- Card ID: " .. tostring(arg2.SpecialProperties.AccID), 5000)
  end
end)
addEvent("onClientElementMenuShow", true)
addEventHandler("onClientElementMenuShow", root, function(arg0, arg1, arg2)
  if arg2 == "ped" and arg1 <= 5 then
    if not isElement(arg0) then
      return
    end
    if getElementData(arg0, "ped:interact") == "bank" then
      exports.interaction:addInteractOption(arg0, {
        text = "Create Account"
      })
      exports.interaction:addInteractOption(arg0, {
        text = "Request Card"
      })
      exports.interaction:addInteractOption(arg0, {text = "Change PIN"})
    end
  end
end)
addEvent("onClientElementMenuClick", true)
addEventHandler("onClientElementMenuClick", root, function(arg0, arg1, arg2)
  if not isElement(arg0) then
    return
  end
  if getElementType(arg0) == "ped" and getElementData(arg0, "ped:interact") == "bank" then
    if arg1 == "Talk" then
      eui:uiSetVisible(UI.window[1], true)
      showCursor(true)
      triggerServerEvent("ATM:getCharacterBankAccounts", localPlayer)
    elseif arg1 == "Create Account" then
      eui:uiSetText(UI.edit["CA:Name"], getElementData(localPlayer, "character:name"))
      eui:uiSetText(UI.edit["CA:CID"], getElementData(localPlayer, "character:id"))
      eui:uiSetText(UI.edit["CA:Pin"], "")
      eui:uiSetVisible(UI.window.CreateAccount, true)
      showCursor(true)
    elseif arg1 == "Request Card" then
      guiSetText(RCard.edit[1], "")
      guiSetVisible(RCard.window[1], true)
      showCursor(true)
      guiSetEnabled(RCard.window[1], true)
      triggerServerEvent("ATM:getCharacterBankAccounts", localPlayer)
    elseif arg1 == "Change PIN" then
      eui:uiSetText(UI.edit.NewPIN, "")
      eui:uiSetText(UI.edit.NewPIN_Confirm, "")
      eui:uiSetVisible(UI.window.ChangePIN, true)
      showCursor(true)
      triggerServerEvent("ATM:getCharacterBankAccounts", localPlayer)
    end
  end
end)
addEvent("ATM:sendCharacterBankAccounts", true)
addEventHandler("ATM:sendCharacterBankAccounts", root, function(arg0)
  eui:uiComboBoxClear(UI.combobox[1])
  eui:uiComboBoxClear(UI.combobox.AccountToChangePIN)
  guiComboBoxClear(RCard.combobox[1])
  for forvar4, forvar5 in ipairs(arg0) do
    eui:uiComboBoxAddItem(UI.combobox[1], forvar5.code)
    guiComboBoxAddItem(RCard.combobox[1], forvar5.code)
    eui:uiComboBoxAddItem(UI.combobox.AccountToChangePIN, forvar5.code)
  end
end)
