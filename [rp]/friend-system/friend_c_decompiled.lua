-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

function UIKitReady()
  eui = exports.UIKit
  uiFontSmall = eui:getUIFont("ui-default")
  var0.window[1] = eui:uiCreateWindow(false, eui:uiGetReferenceScreenSize() - 150, 350, 105, {
    en = "New Friend",
    ar = "\216\181\216\175\217\138\217\130 \216\172\216\175\217\138\216\175"
  })
  eui:uiWindowSetMovable(var0.window[1], false)
  eui:uiSetVisible(var0.window[1], false)
  var0.label[1] = eui:uiCreateLabel(10, 20, 290, 40, [[
Request a new friendship
From: ${color.primary}]], tocolor(255, 255, 255, 255), "left", "top", var0.window[1])
  var0.button[1] = eui:uiCreateButton(72.5, 70, 100, 30, {en = "Accept", ar = "\217\130\216\168\217\136\217\132"}, _, var0.window[1])
  var0.button[2] = eui:uiCreateButton(177.5, 70, 100, 30, {en = "Reject", ar = "\216\177\217\129\216\182"}, _, var0.window[1])
  var0.window.friends = eui:uiCreateWindow(false, false, 590, 640, {
    en = "Friends List",
    ar = "\217\130\216\167\216\166\217\133\216\169 \216\167\217\132\216\163\216\181\216\175\217\130\216\167\216\161"
  }, _, "friends_icon.png")
  eui:uiSetVisible(var0.window.friends, false)
  var0.rect.friends = var0.window.friends
  var0.label.count = eui:uiCreateLabel(0, 15, 570, 30, {
    en = [[
10
(#00ff005 Online#ffffff)]],
    ar = [[
10
#00ff005 Online]]
  }, tocolor(255, 255, 255, 255), "right", "center", var0.rect.friends)
end
addEventHandler("onClientUIReady", resourceRoot, UIKitReady)
addEventHandler("onClientUIKitReady", root, UIKitReady)
addEventHandler("onClientUIMenuSelectChange", root, function(arg0, arg1)
  if arg1 and getElementID(source) == "main-menu" and eui:uiMenuGetItemID(source, arg0) == "friends" then
    if not isElement(var0.gridlist.friends) then
      var0.gridlist.friends = eui:uiCreateGridList(10, 70, eui:uiGetSize(arg1) * 0.7, eui:uiGetSize(arg1) - 150, tocolor(0, 0, 0, 0), arg1)
      eui:uiGridListAddColumn(var0.gridlist.friends, "ID", 0.15)
      eui:uiGridListAddColumn(var0.gridlist.friends, "Name", 0.45)
      eui:uiGridListAddColumn(var0.gridlist.friends, "Status", 0.15)
      eui:uiGridListAddColumn(var0.gridlist.friends, "Last Online", 0.25)
      eui:uiSetAlign(var0.gridlist.friends, "left", "center")
      eui:uiSetProperty(var0.gridlist.friends, "row_height", 30)
      var0.checkbox.allow_dm_for_friends = eui:uiCreateSwitch(20, eui:uiGetSize(arg1) - 40, 300, 20, {
        en = "Allow direct messages from friends while DM is locked",
        ar = "\216\167\217\132\216\179\217\133\216\167\216\173 \216\168\216\167\217\132\216\177\216\179\216\167\216\166\217\132 \216\167\217\132\216\174\216\167\216\181\216\169 \217\133\217\134 \216\167\217\132\216\163\216\181\216\175\217\130\216\167\216\161 \216\163\216\171\217\134\216\167\216\161 \217\130\217\129\217\132 \216\167\217\132\216\174\216\167\216\181"
      }, false, _, arg1)
      eui:uiCreateRectangle(5, 590, 590, 1, tocolor(255, 255, 255, 20), false, false, false, false, var0.window.friends)
      var0.button.remove_friend = eui:uiCreateButton(10 + eui:uiGetSize(arg1) * 0.7 + 10, eui:uiGetSize(arg1) - 55, eui:uiGetSize(arg1) - eui:uiGetSize(arg1) * 0.7 - 30, 40, {
        en = "Cancel Friendship",
        ar = "\216\165\217\132\216\186\216\167\216\161 \216\167\217\132\216\181\216\175\216\167\217\130\216\169"
      }, tocolor(0, 0, 0), arg1)
      eui:uiSetProperty(var0.button.remove_friend, "HoverTextColor", tocolor(255, 0, 0))
      var0.container.friend_info = eui:uiCreateContainer(0, 0, eui:uiGetSize(arg1) - eui:uiGetSize(arg1) * 0.7 - 30, eui:uiGetSize(arg1) - 150, (eui:uiCreateRectangle(10 + eui:uiGetSize(arg1) * 0.7 + 10, 70, eui:uiGetSize(arg1) - eui:uiGetSize(arg1) * 0.7 - 30, eui:uiGetSize(arg1) - 150, tocolor(9, 12, 17, 200), true, true, true, true, arg1)))
      eui:uiSetVisible(var0.container.friend_info, false)
      var0.image.avatar = eui:uiCreateImage((eui:uiGetSize(arg1) - eui:uiGetSize(arg1) * 0.7 - 30 - (eui:uiGetSize(arg1) - eui:uiGetSize(arg1) * 0.7 - 30) / 2) / 2, 50, (eui:uiGetSize(arg1) - eui:uiGetSize(arg1) * 0.7 - 30) / 2, (eui:uiGetSize(arg1) - eui:uiGetSize(arg1) * 0.7 - 30) / 2, ":roleplay/user.png", var0.container.friend_info)
      var0.image.info = eui:uiCreateLabel(10, 50 + (eui:uiGetSize(arg1) - eui:uiGetSize(arg1) * 0.7 - 30) / 2 + 20, eui:uiGetSize(arg1) - eui:uiGetSize(arg1) * 0.7 - 30 - 20, 40, "", tocolor(255, 255, 255, 255), "center", "center", var0.container.friend_info)
    end
    resetFriendList()
    eui:uiSwitchSetSelected(var0.checkbox.allow_dm_for_friends, exports.settings:getUserSetting("dm.allow_for_friends") == "1")
  end
end)
addEventHandler("onClientUIClick", root, function()
  if source == var0.button[1] then
    eui:uiSetVisible(var0.window[1], false)
    triggerServerEvent("friends:acceptRequest", localPlayer, currentRequestPlayer)
  elseif source == var0.button[2] then
    eui:uiSetVisible(var0.window[1], false)
    triggerServerEvent("friends:rejectRequest", localPlayer, currentRequestPlayer)
  elseif source == var0.gridlist.friends then
    if eui:uiGridListGetSelectedItem(source) ~= -1 then
      eui:uiSetText(var0.image.info, {
        en = "" .. tostring(eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1).friend_account) .. [[


]] .. "Friends since ${color.primary}" .. tostring(eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1).createdAt),
        ar = "" .. tostring(eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1).friend_account) .. [[


]] .. "\216\163\216\181\216\175\217\130\216\167\216\161 \217\133\217\134\216\176 ${color.primary}" .. tostring(eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1).createdAt)
      })
      eui:uiStaticImageLoadImage(var0.image.avatar, eui:uiGridListGetItemData(source, eui:uiGridListGetSelectedItem(source), 1).Pic)
      eui:uiSetVisible(var0.container.friend_info, true)
    else
      eui:uiSetVisible(var0.container.friend_info, false)
    end
  elseif source == var0.button.remove_friend then
    if eui:uiGridListGetSelectedItem(var0.gridlist.friends) ~= -1 then
      if var1 then
        return
      end
      var1 = true
      eui:uiGridListSetSelectedItem(var0.gridlist.friends, -1)
      eui:uiGridListRemoveRow(var0.gridlist.friends, (eui:uiGridListGetSelectedItem(var0.gridlist.friends)))
      eui:uiSetVisible(var0.container.friend_info, false)
      triggerServerEvent("friends:removeFriend", localPlayer, eui:uiGridListGetItemData(var0.gridlist.friends, eui:uiGridListGetSelectedItem(var0.gridlist.friends), 1).friend_account)
      for forvar5, forvar6 in ipairs(friends.list) do
        if forvar6.friend_account == eui:uiGridListGetItemData(var0.gridlist.friends, eui:uiGridListGetSelectedItem(var0.gridlist.friends), 1).friend_account then
          table.remove(friends.list, forvar5)
          is_friend[forvar6.friend_account] = nil
          break
        end
      end
    end
  elseif source == var0.checkbox.allow_dm_for_friends then
    triggerLatentServerEvent("friends:allow_dm_for_friends", localPlayer, eui:uiSwitchGetSelected(source) and 1 or 0)
  end
end)
addEvent("friends:removeFriend:callback", true)
addEventHandler("friends:removeFriend:callback", localPlayer, function()
  var0 = false
  exports.notifications:output({
    en = "Friendship canceled",
    ar = "\216\170\217\133 \216\165\217\132\216\186\216\167\216\161 \216\167\217\132\216\181\216\175\216\167\217\130\216\169"
  }, 5000, "success")
end)
addEvent("friends:receiptRequest", true)
addEventHandler("friends:receiptRequest", root, function(arg0)
  currentRequestPlayer = arg0
  eui:uiSetText(var0.label[1], [[
Request a new friendship
From: ${color.primary}]] .. tostring((getElementData(arg0, "character:name"))) .. " (" .. tostring((getElementData(arg0, "character:account"))) .. ")")
  eui:uiSetVisible(var0.window[1], true)
end)
friends = {
  currentID = false,
  pos_size = {
    20,
    (guiGetScreenSize() - 480) / 2,
    280,
    405,
    55
  },
  status = false,
  hoverItem = 0,
  clickedItem = 0,
  startIndex = 1,
  hoverCancel = false,
  clickCancel = false,
  list = {}
}
addEvent("friends:sendFriendsListToClient", true)
addEventHandler("friends:sendFriendsListToClient", root, function(arg0)
  friends.list = arg0
  for forvar4, forvar5 in ipairs(arg0) do
    friends.list[forvar4].Pic = ":roleplay/ProfilePics/" .. tostring(forvar5.Name) .. ".png"
  end
  eui:uiGridListClear(var0.gridlist.friends)
  for forvar4, forvar5 in ipairs(friends.list) do
    eui:uiGridListSetItemData(var0.gridlist.friends, eui:uiGridListAddRow(var0.gridlist.friends), 1, forvar5)
    eui:uiGridListSetItemText(var0.gridlist.friends, eui:uiGridListAddRow(var0.gridlist.friends), 1, forvar5.ID or "-")
    if forvar5.CharacterName then
      eui:uiGridListSetItemText(var0.gridlist.friends, eui:uiGridListAddRow(var0.gridlist.friends), 2, tostring(forvar5.Name) .. " (" .. tostring(forvar5.CharacterName) .. ")")
    else
      eui:uiGridListSetItemText(var0.gridlist.friends, eui:uiGridListAddRow(var0.gridlist.friends), 2, tostring(forvar5.Name))
    end
    eui:uiGridListSetItemText(var0.gridlist.friends, eui:uiGridListAddRow(var0.gridlist.friends), 3, tostring(getElementData(forvar5.player, "temp:AFK") and "AFK"))
    eui:uiGridListSetItemText(var0.gridlist.friends, eui:uiGridListAddRow(var0.gridlist.friends), 4, tostring(forvar5.LastLogin))
    if (getElementData(forvar5.player, "temp:AFK") and "AFK") == "online" then
      eui:uiGridListSetItemColor(var0.gridlist.friends, eui:uiGridListAddRow(var0.gridlist.friends), 1, tocolor(0, 255, 0))
      eui:uiGridListSetItemColor(var0.gridlist.friends, eui:uiGridListAddRow(var0.gridlist.friends), 2, tocolor(0, 255, 0))
      eui:uiGridListSetItemColor(var0.gridlist.friends, eui:uiGridListAddRow(var0.gridlist.friends), 3, tocolor(0, 255, 0))
      eui:uiGridListSetItemColor(var0.gridlist.friends, eui:uiGridListAddRow(var0.gridlist.friends), 4, tocolor(0, 255, 0))
    elseif (getElementData(forvar5.player, "temp:AFK") and "AFK") == "AFK" then
      eui:uiGridListSetItemColor(var0.gridlist.friends, eui:uiGridListAddRow(var0.gridlist.friends), 1, tocolor(255, 255, 0))
      eui:uiGridListSetItemColor(var0.gridlist.friends, eui:uiGridListAddRow(var0.gridlist.friends), 2, tocolor(255, 255, 0))
      eui:uiGridListSetItemColor(var0.gridlist.friends, eui:uiGridListAddRow(var0.gridlist.friends), 3, tocolor(255, 255, 0))
      eui:uiGridListSetItemColor(var0.gridlist.friends, eui:uiGridListAddRow(var0.gridlist.friends), 4, tocolor(255, 255, 0))
    end
  end
end)
function resetFriendList()
  eui:uiGridListClear(var0.gridlist.friends)
  for forvar3, forvar4 in ipairs(friends.list) do
    if (isCharacterOnline(forvar4.friend_account) and "online" or "offline") == "online" then
      if getElementData(isCharacterOnline(forvar4.friend_account)) then
      else
      end
    end
    friends.list[forvar3].status = "AFK"
    friends.list[forvar3].order = 1
    friends.list[forvar3].player = isCharacterOnline(forvar4.friend_account)
  end
  table.sort(friends.list, function(arg0, arg1)
    return arg0.order < arg1.order
  end)
  for forvar3, forvar4 in ipairs(friends.list) do
    eui:uiGridListSetItemData(var0.gridlist.friends, eui:uiGridListAddRow(var0.gridlist.friends), 1, forvar4)
    if forvar4.player then
    end
    eui:uiGridListSetItemText(var0.gridlist.friends, eui:uiGridListAddRow(var0.gridlist.friends), 1, exports.roleplay:getPlayerID(forvar4.player) and tostring((exports.roleplay:getPlayerID(forvar4.player))) or "-")
    if getElementData(forvar4.player, "character:name") then
      eui:uiGridListSetItemText(var0.gridlist.friends, eui:uiGridListAddRow(var0.gridlist.friends), 2, tostring(forvar4.friend_account) .. " (" .. tostring((getElementData(forvar4.player, "character:name"))) .. ")")
    else
      eui:uiGridListSetItemText(var0.gridlist.friends, eui:uiGridListAddRow(var0.gridlist.friends), 2, tostring(forvar4.friend_account))
    end
    eui:uiGridListSetItemText(var0.gridlist.friends, eui:uiGridListAddRow(var0.gridlist.friends), 3, tostring(forvar4.status))
    if forvar4.status == "offline" then
      eui:uiGridListSetItemText(var0.gridlist.friends, eui:uiGridListAddRow(var0.gridlist.friends), 4, tostring(forvar4.last_online))
    end
    if forvar4.status == "online" then
      eui:uiGridListSetItemColor(var0.gridlist.friends, eui:uiGridListAddRow(var0.gridlist.friends), 1, tocolor(0, 255, 0))
      eui:uiGridListSetItemColor(var0.gridlist.friends, eui:uiGridListAddRow(var0.gridlist.friends), 2, tocolor(0, 255, 0))
      eui:uiGridListSetItemColor(var0.gridlist.friends, eui:uiGridListAddRow(var0.gridlist.friends), 3, tocolor(0, 255, 0))
      eui:uiGridListSetItemColor(var0.gridlist.friends, eui:uiGridListAddRow(var0.gridlist.friends), 4, tocolor(0, 255, 0))
    elseif forvar4.status == "AFK" then
      eui:uiGridListSetItemColor(var0.gridlist.friends, eui:uiGridListAddRow(var0.gridlist.friends), 1, tocolor(255, 255, 0))
      eui:uiGridListSetItemColor(var0.gridlist.friends, eui:uiGridListAddRow(var0.gridlist.friends), 2, tocolor(255, 255, 0))
      eui:uiGridListSetItemColor(var0.gridlist.friends, eui:uiGridListAddRow(var0.gridlist.friends), 3, tocolor(255, 255, 0))
      eui:uiGridListSetItemColor(var0.gridlist.friends, eui:uiGridListAddRow(var0.gridlist.friends), 4, tocolor(255, 255, 0))
    end
  end
end
is_friend = {}
addEvent("onClientFriendsUpdate", false)
addEvent("friends:sync", true)
addEventHandler("friends:sync", localPlayer, function(arg0, arg1)
  if arg1 == 0 then
    for forvar5, forvar6 in ipairs(friends.list) do
      if forvar6.friend_account == arg0.friend_account then
        table.remove(friends.list, forvar5)
        break
      end
    end
  elseif arg1 == 1 then
    table.insert(friends.list, arg0)
  else
    friends.list = arg0
  end
  for forvar5, forvar6 in ipairs(friends.list) do
    friends.list[forvar5].Pic = ":roleplay/ProfilePics/" .. tostring(forvar6.Name) .. ".png"
  end
  is_friend = {}
  for forvar5, forvar6 in ipairs(friends.list) do
    if forvar6.friend_account then
      is_friend[forvar6.friend_account] = true
    end
  end
  triggerEvent("onClientFriendsUpdate", localPlayer)
end)
function isFriend(arg0)
  return is_friend[getElementData(arg0, "character:account")] or false
end
function isCharacterOnline(arg0)
  for forvar4, forvar5 in ipairs(getElementsByType("player")) do
    if (getElementData(forvar5, "character:account") or getElementData(forvar5, "account")) == arg0 then
      return true, forvar5
    end
  end
  return false, false
end
function getFriendsList()
  return friends.list or {}
end
function showFriendsList()
end
addEvent("onClientElementMenuShow", false)
addEventHandler("onClientElementMenuShow", root, function(arg0, arg1, arg2)
  if source == arg0 then
    return
  end
  if arg2 == "player" and arg1 <= 4 then
    if isFriend(arg0) then
      exports.interaction:addInteractOption(arg0, {
        text = "Remove friend"
      })
    else
      exports.interaction:addInteractOption(arg0, {
        text = "Add as friend"
      })
    end
  end
end)
