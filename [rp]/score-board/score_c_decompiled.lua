-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

ScoreBoard = {
  state = false,
  columns = {
    {
      "ID",
      70 * (guiGetScreenSize() / 1080),
      true
    },
    {
      "",
      120 * (guiGetScreenSize() / 1080)
    },
    {
      "Name",
      280 * (guiGetScreenSize() / 1080),
      true
    },
    {
      "Rank",
      190 * (guiGetScreenSize() / 1080),
      true
    },
    {
      "Playtime",
      140 * (guiGetScreenSize() / 1080)
    },
    {
      "Ping",
      100 * (guiGetScreenSize() / 1080)
    }
  },
  isHoverScrolbar = false,
  isClickScrolbar = false,
  clickPositionRelatedToScroll = 0,
  scrollY = (guiGetScreenSize() - 550 * (guiGetScreenSize() / 1080)) / 2 + 71 * (guiGetScreenSize() / 1080),
  pos = {
    (guiGetScreenSize() - 1000 * (guiGetScreenSize() / 1080)) / 2,
    (guiGetScreenSize() - (guiGetScreenSize() - 400 * (guiGetScreenSize() / 1080))) / 2,
    1000 * (guiGetScreenSize() / 1080),
    guiGetScreenSize() - 400 * (guiGetScreenSize() / 1080)
  },
  scroll = 0,
  scrollPos = {},
  drawScroll = false,
  friends = {},
  friendstate = false,
  players = {},
  filtered_players = false,
  cursorStatus = false
}
function UIKitReady()
  eui = exports.UIKit
  var0 = eui:getUIFont("default-large")
  var1 = eui:getUIFont("ui-default")
  var2 = exports.UIKit:uiGetThemeColor("primary")
  var3 = bitExtract(var2, 0, 8)
  var4 = bitExtract(var2, 8, 8)
  var5 = bitExtract(var2, 16, 8)
  scoreboard_container = eui:uiCreateContainer(false, false, 900, eui:uiGetReferenceScreenSize() - 360)
  eui:uiSetVisible(scoreboard_container, false)
  eui:uiSetColor(eui:uiCreateImage(130, 22, 16, 16, ":assets/icons/search.png", scoreboard_container), var5, var4, var3, 255)
  search_edit = eui:uiCreateEdit(160, 10, 300, 30, "", {en = "Search...", ar = "\216\168\216\173\216\171..."}, _, scoreboard_container)
end
addEventHandler("onClientUIReady", resourceRoot, UIKitReady)
addEventHandler("onClientUIKitReady", root, UIKitReady)
addEventHandler("onClientUIChanged", root, function()
  if source == search_edit then
    filterPlayersList((eui:uiGetText(source)))
  end
end)
function filterPlayersList(arg0)
  arg0 = string.lower(arg0)
  if arg0 == "" then
    ScoreBoard.filtered_players = false
  else
    ScoreBoard.filtered_players = {}
    for forvar5 = math.max(1, math.ceil(ScoreBoard.scroll * #ScoreBoard.players / 100)), #ScoreBoard.players do
      for forvar10, forvar11 in ipairs(ScoreBoard.columns) do
      end
      if forvar11[3] and string.find(string.lower(getColumnData(forvar11[1], ScoreBoard.players[forvar5])), arg0, 1, true) and true then
        ScoreBoard.filtered_players[forvar5] = true
      end
    end
  end
end
addEventHandler("onClientResourceStart", resourceRoot, function()
  for forvar3, forvar4 in ipairs({
    "premium",
    "booster",
    "classic",
    "plus",
    "verified",
    "youtuber"
  }) do
    var0[forvar4] = dxCreateTexture("icons/" .. forvar4 .. ".png", "dxt5", true, "clamp")
    fileDelete("icons/" .. forvar4 .. ".png")
  end
end)
addEvent("scoreboard:highestPlayerCount:sync", true)
addEventHandler("scoreboard:highestPlayerCount:sync", root, function(arg0)
  var0 = arg0
end)
function ScoreBoard.draw()
  dxDrawRectangle(unpack(ScoreBoard.pos) - 5, unpack(ScoreBoard.pos) - 5, unpack(ScoreBoard.pos) + 10, unpack(ScoreBoard.pos) + 10, tocolor(3, 6, 11, 150), true)
  dxDrawRectangle(unpack(ScoreBoard.pos))
  dxDrawRectangle(unpack(ScoreBoard.pos))
  dxDrawRectangle(unpack(ScoreBoard.pos) + var0, unpack(ScoreBoard.pos))
  dxDrawImage(unpack(ScoreBoard.pos) + (var0 - var3) / 2, unpack(ScoreBoard.pos) + (var0 - var3) / 2, var3, var3, ":assets/images/logo-circle.png", 0, 0, 0, var4, true)
  dxDrawImage(unpack(ScoreBoard.pos) + (var0 - var5) / 2, unpack(ScoreBoard.pos) + unpack(ScoreBoard.pos) - 300 * var1, var5, var5 * var6, ":assets/images/logo_text.png", -90, 0, 0, tocolor(255, 255, 255, 40), true)
  dxDrawImage(unpack(ScoreBoard.pos) + var0 + 600 * var1, unpack(ScoreBoard.pos) + 25 * var1, 16 * var1, 16 * var1, ":assets/icons/group.png", 0, 0, 0, var4, true)
  dxDrawText(ScoreBoard.players_count .. "           ( " .. var7 .. " : \216\163\216\185\217\132\217\137 \216\170\217\136\216\167\216\172\216\175 )", unpack(ScoreBoard.pos) + var0 + 630 * var1, var8, unpack(ScoreBoard.pos) + var0 + (unpack(ScoreBoard.pos) - var0) - 20 * var1, var8 + var3, tocolor(255, 255, 255, 180), 1, var9, "left", "center", true, false, true)
  ScoreBoard.hovered = -1
  dxDrawRectangle(unpack(ScoreBoard.pos) + var0, unpack(ScoreBoard.pos) + 65 * var1 - 2, unpack(ScoreBoard.pos) - var0, 1, tocolor(255, 255, 255, 25), true)
  dxDrawRectangle(unpack(ScoreBoard.pos) + var0, unpack(ScoreBoard.pos) + 65 * var1 + var2, unpack(ScoreBoard.pos) - var0, 1, tocolor(255, 255, 255, 50), true)
  dxDrawRectangle(unpack(ScoreBoard.pos) + var0, unpack(ScoreBoard.pos) + unpack(ScoreBoard.pos) - 10, unpack(ScoreBoard.pos) - var0, 1, tocolor(255, 255, 255, 25), true)
  ScoreBoard.drawScroll = false
  if unpack(ScoreBoard.pos) + 65 * var1 + var2 + 5 + var10 * #ScoreBoard.players > unpack(ScoreBoard.pos) + unpack(ScoreBoard.pos) then
    ScoreBoard.drawScroll = true
  end
  dxDrawRectangle(unpack(ScoreBoard.pos) + var0, unpack(ScoreBoard.pos) + 65 * var1 + var2 + 5, unpack(ScoreBoard.pos) - var0, var10 + 5, tocolor(0, 0, 0, 230), true)
  dxDrawRectangle(unpack(ScoreBoard.pos) + var0, unpack(ScoreBoard.pos) + 65 * var1 + var2 + 5, 4, var10 + 5, tocolor(var11, var12, var13, 230), true)
  for forvar12, forvar13 in ipairs(ScoreBoard.columns) do
    dxDrawText(forvar13[1], unpack(ScoreBoard.pos) + var0 + 10 * var1, unpack(ScoreBoard.pos) + 65 * var1, unpack(ScoreBoard.pos) + var0 + 10 * var1 + forvar13[2], unpack(ScoreBoard.pos) + 65 * var1 + var2, tocolor(255, 255, 255, 230), 1, var9, "left", "center", true, false, true)
    if getColumnData(forvar13[1], localPlayer) then
      for forvar20 = 1, #getColumnData(forvar13[1], localPlayer) do
        dxDrawImage(unpack(ScoreBoard.pos) + var0 + 10 * var1 + var14 * (forvar20 - 1), unpack(ScoreBoard.pos) + 65 * var1 + var2 + 5 + 2, var15, var15, var16[getColumnData(forvar13[1], localPlayer)[forvar20]], 0, 0, 0, tocolor(255, 255, 255, 255), true)
      end
    elseif forvar12 == 1 then
      dxDrawText(getColumnData(forvar13[1], localPlayer))
    else
      dxDrawText(getColumnData(forvar13[1], localPlayer))
    end
  end
  for forvar12 = var17(1, var18(ScoreBoard.scroll * #ScoreBoard.players / 100)), #ScoreBoard.players do
    if not ScoreBoard.filtered_players or ScoreBoard.filtered_players[forvar12] then
      if unpack(ScoreBoard.pos) + 65 * var1 + var2 + 5 + var10 + 5 + 3 + var10 <= unpack(ScoreBoard.pos) + unpack(ScoreBoard.pos) - 5 then
        if forvar12 % 2 == 0 then
        end
        dxDrawRectangle(unpack(ScoreBoard.pos) + var0, unpack(ScoreBoard.pos) + 65 * var1 + var2 + 5 + var10 + 5 + 3, unpack(ScoreBoard.pos) - var0, var10, tocolor(0, 0, 0, 180), true)
        dxDrawRectangle(unpack(ScoreBoard.pos) + var0, unpack(ScoreBoard.pos) + 65 * var1 + var2 + 5 + var10 + 5 + 3 + var10 - 1, unpack(ScoreBoard.pos) - var0, 1, tocolor(255, 255, 255, 10), true)
        for forvar18, forvar19 in ipairs(ScoreBoard.columns) do
          if unpack(ScoreBoard.pos) + 65 * var1 + var2 + 5 + var10 + 5 + 3 + var10 <= unpack(ScoreBoard.pos) + unpack(ScoreBoard.pos) then
            if getColumnData(forvar19[1], ScoreBoard.players[forvar12]) then
              for forvar26 = 1, #getColumnData(forvar19[1], ScoreBoard.players[forvar12]) do
                dxDrawImage(unpack(ScoreBoard.pos) + var0 + 10 + var14 * (forvar26 - 1), unpack(ScoreBoard.pos) + 65 * var1 + var2 + 5 + var10 + 5 + 3 + 2, var15, var15, var16[getColumnData(forvar19[1], ScoreBoard.players[forvar12])[forvar26]], 0, 0, 0, tocolor(255, 255, 255, 255), true)
              end
            else
              dxDrawText(getColumnData(forvar19[1], ScoreBoard.players[forvar12]))
            end
          else
            break
          end
        end
        if isMouseInPosition(unpack(ScoreBoard.pos) + var0, unpack(ScoreBoard.pos) + 65 * var1 + var2 + 5 + var10 + 5 + 3, unpack(ScoreBoard.pos) - var0, var10) then
          dxDrawRectangle(unpack(ScoreBoard.pos) + var0, unpack(ScoreBoard.pos) + 65 * var1 + var2 + 5 + var10 + 5 + 3, unpack(ScoreBoard.pos) - var0, var10, tocolor(255, 255, 255, 50), true)
        end
      end
    end
  end
  if _FOR_.drawScroll then
    drawScrollbar(unpack(ScoreBoard.pos) + var0 + (unpack(ScoreBoard.pos) - var0) - 10, unpack(ScoreBoard.pos) + 65 * var1 + var2 + 5 + var10 + 5 + 3, 8, unpack(ScoreBoard.pos) - (unpack(ScoreBoard.pos) + 65 * var1 + var2 - unpack(ScoreBoard.pos)) - 10 - (var10 + 5 + 3))
  end
end
function dxDrawEmptyLine(arg0, arg1, arg2, arg3, arg4, arg5, arg6)
  dxDrawLine(arg0, arg1, arg0 + arg2, arg1, arg4, arg5, arg6)
  dxDrawLine(arg0, arg1, arg0, arg1 + arg3, arg4, arg5, arg6)
  dxDrawLine(arg0, arg1 + arg3, arg0 + arg2, arg1 + arg3, arg4, arg5, arg6)
  dxDrawLine(arg0 + arg2, arg1, arg0 + arg2, arg1 + arg3, arg4, arg5, arg6)
end
function drawScrollbar(arg0, arg1, arg2, arg3)
  ScoreBoard.scrollPos = {
    arg0,
    arg1,
    arg2,
    arg3
  }
  dxDrawRectangle(arg0 + 1, ScoreBoard.scrollY, arg2 - 2, arg3 / 5, tocolor(var0, var1, var2, 210), true)
  if isMouseInPosition(arg0 + 1, ScoreBoard.scrollY, arg2 - 2, arg3 / 5) then
    ScoreBoard.isHoverScrolbar = true
  else
    ScoreBoard.isHoverScrolbar = false
  end
  if ScoreBoard.isClickScrolbar and isCursorShowing() then
    ScoreBoard.scrollY = getCursorPosition() * var4 - ScoreBoard.clickPositionRelatedToScroll
    ScoreBoard.scrollY = var5(var6(arg1 + 1, ScoreBoard.scrollY), arg1 + arg3 - arg3 / 4 - 1)
    ScoreBoard.scroll = var7((ScoreBoard.scrollY - arg1 - 1) / (arg3 - arg3 / 5) * 100)
  end
end
function ScoreBoard.click(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7)
  if arg0 == "left" then
    if arg1 == "down" then
      if ScoreBoard.isHoverScrolbar then
        ScoreBoard.clickPositionRelatedToScroll = arg3 - ScoreBoard.scrollY
        ScoreBoard.isClickScrolbar = true
      end
    else
      ScoreBoard.isClickScrolbar = false
      if ScoreBoard.hovered ~= -1 and ScoreBoard.hovered == 0 then
        ScoreBoard.friendstate = not ScoreBoard.friendstate
      else
      end
      ScoreBoard.hovered = -1
    end
  end
end
addEvent("scoreboard:getFriendsList:callback", true)
addEventHandler("scoreboard:getFriendsList:callback", root, function(arg0)
  ScoreBoard.friends = arg0
end)
function isMouseInPosition(arg0, arg1, arg2, arg3)
  if isCursorShowing() and arg0 <= getCursorPosition() * var0 and arg1 <= getCursorPosition() * var1 and getCursorPosition() * var0 <= arg0 + arg2 and getCursorPosition() * var1 <= arg1 + arg3 then
    return true
  end
end
function getColumnData(arg0, arg1)
  if not isElement(arg1) then
    return "-", tocolor(255, 255, 255, 120)
  end
  if arg0 == "ID" then
    return tostring(exports.roleplay:getPlayerID(arg1)), var0[arg1] and var0[arg1].color or tocolor(255, 255, 255, 120)
  elseif arg0 == "" then
    return "", var0[arg1] and var0[arg1].color or tocolor(255, 255, 255, 120), var0[arg1] and var0[arg1].icon or false
  elseif arg0 == "Name" then
    if getElementData(arg1, "character:id") then
      if exports.hud:getHudSetting("admintag") then
        return tostring(getElementData(arg1, "character:name")) .. " (" .. tostring(getElementData(arg1, "character:account")) .. ")", var0[arg1] and var0[arg1].color or tocolor(255, 255, 255, 120)
      else
        return tostring(getElementData(arg1, "character:name")) .. "", var0[arg1] and var0[arg1].color or tocolor(255, 255, 255, 120)
      end
    elseif exports.hud:getHudSetting("admintag") then
      return tostring(getElementData(arg1, "loading:status") or getPlayerName(arg1)) .. " (" .. tostring(getElementData(arg1, "account")) .. ")" or tostring(getPlayerName(arg1)), var0[arg1] and var0[arg1].color or tocolor(255, 255, 255, 120)
    else
      return getElementData(arg1, "loading:status") or tostring(getPlayerName(arg1)), var0[arg1] and var0[arg1].color or tocolor(255, 255, 255, 120)
    end
  elseif arg0 == "Ping" then
    return getPlayerPing(arg1), var0[arg1] and var0[arg1].color or tocolor(255, 255, 255, 120)
  elseif arg0 == "Playtime" then
    if getElementData(arg1, "character:id") then
      return convertTimeToString(exports["play-time"]:getPlayerPlayTime(arg1) or 0), var0[arg1] and var0[arg1].color or tocolor(255, 255, 255, 120)
    else
      return convertTimeToString(0), var0[arg1] and var0[arg1].color or tocolor(255, 255, 255, 120)
    end
  elseif arg0 == "Rank" then
    if getElementData(arg1, "admin:hideadmin") then
      return "-", var0[arg1] and var0[arg1].color or tocolor(255, 255, 255, 120)
    elseif getElementData(arg1, "temp:rank") then
      return getElementData(arg1, "temp:rank"), var0[arg1] and var0[arg1].color or tocolor(255, 255, 255, 120)
    else
      return "-", var0[arg1] and var0[arg1].color or tocolor(255, 255, 255, 120)
    end
  else
    return "-", var0[arg1] and var0[arg1].color or tocolor(255, 255, 255, 120)
  end
end
function convertTimeToString(arg0)
  arg0 = tonumber(arg0)
  if var0(arg0 / (24 * (60 * 60))) == 0 then
    if var0(arg0 % (24 * (60 * 60)) / (60 * 60)) == 0 then
      return var0(arg0 % (24 * (60 * 60)) % (60 * 60) / 60) .. "m " .. var1(arg0 % (24 * (60 * 60)) % (60 * 60) % 60) .. "s"
    else
      return var0(arg0 % (24 * (60 * 60)) / (60 * 60)) .. "h " .. var0(arg0 % (24 * (60 * 60)) % (60 * 60) / 60) .. "m"
    end
  else
    return var0(arg0 % (24 * (60 * 60)) / (60 * 60)) + var0(arg0 / (24 * (60 * 60))) * 24 .. "h " .. var0(arg0 % (24 * (60 * 60)) % (60 * 60) / 60) .. "m"
  end
end
bindKey("tab", "both", function(arg0, arg1)
  if arg1 == "down" and ScoreBoard.state and ScoreBoard.cursorStatus then
    showScoreboard(false)
    return
  end
  showScoreboard(arg1 == "down" or ScoreBoard.cursorStatus)
end)
function MouseWheel(arg0, arg1)
  if not ScoreBoard.drawScroll then
    return false
  end
  if arg0 ~= "mouse_wheel_up" or not var0(ScoreBoard.scroll - 5, 0) then
  end
  ScoreBoard.scroll = var1(ScoreBoard.scroll + 5, 100)
  ScoreBoard.scrollY = (ScoreBoard.scroll * (unpack(ScoreBoard.scrollPos) - 2 - unpack(ScoreBoard.scrollPos) / 4) + 100 * unpack(ScoreBoard.scrollPos) + 100) / 100
end
function showScoreboard(arg0)
  if arg0 and not getElementData(localPlayer, "character:id") then
    return false
  end
  if ScoreBoard.state == arg0 then
    return
  end
  ScoreBoard.state = arg0
  if arg0 then
    eui:uiSetVisible(scoreboard_container, true)
    exports.public:setBlurShaderVisible(true, true, 5)
    ScoreBoard.cursorStatus = false
    addEventHandler("onClientPreRender", root, ScoreBoard.draw)
    addEventHandler("onClientClick", root, ScoreBoard.click)
    addEventHandler("onClientKey", root, ScoreBoard.key)
    bindKey("mouse2", "down", CursorVisible)
    ScoreBoard.hovered = -1
    ScoreBoard.players = getElementsByType("player")
    for forvar8, forvar9 in ipairs(ScoreBoard.players) do
      if getElementData(forvar9, "character:id") then
        if exports.hud:isPlayerHudItemOfCategoryExists(forvar9, "special_membership") then
          for forvar20, forvar21 in ipairs((exports.hud:getPlayerHudItemsByCategory(forvar9, "special_membership"))) do
            table.insert({}, forvar21[5].type:lower())
            forvar21[5].priority = forvar21[5].priority or 0
            if 100 > forvar21[5].priority and forvar21[5].color and not (exports.hud:getPlayerHudSetting(forvar9, "admintag") and not getElementData(forvar9, "admin:hideadmin")) then
            end
          end
        end
        if exports.hud:getPlayerHudSetting(forvar9, "admintag") and not getElementData(forvar9, "admin:hideadmin") then
        end
      end
      var0[forvar9] = {
        color = tocolor((exports.hud:getPlayerHudItemData(forvar9, "admintag") or {
          255,
          0,
          0,
          255
        })[1] or 255, (exports.hud:getPlayerHudItemData(forvar9, "admintag") or {
          255,
          0,
          0,
          255
        })[2] or 0, (exports.hud:getPlayerHudItemData(forvar9, "admintag") or {
          255,
          0,
          0,
          255
        })[3] or 0, 255),
        icon = {}
      }
    end
    table.remove(ScoreBoard.players, 1)
    table.sort(ScoreBoard.players, function(arg0, arg1)
      return (tonumber(exports.roleplay:getPlayerID(arg0)) or 9999999) < (tonumber(exports.roleplay:getPlayerID(arg1)) or 9999999)
    end)
    ScoreBoard.players_count = #ScoreBoard.players + 1 .. " Player" .. (#ScoreBoard.players + 1 == 1 and "" or "s")
  else
    eui:uiSetVisible(scoreboard_container, false)
    exports.public:setBlurShaderVisible(false, true, 10, _, 200)
    showCursor(false)
    ScoreBoard.cursorStatus = false
    removeEventHandler("onClientPreRender", root, ScoreBoard.draw)
    removeEventHandler("onClientClick", root, ScoreBoard.click)
    removeEventHandler("onClientKey", root, ScoreBoard.key)
    unbindKey("mouse2", "down", CursorVisible)
  end
end
function CursorVisible(arg0, arg1)
  ScoreBoard.cursorStatus = not ScoreBoard.cursorStatus
  showCursor(ScoreBoard.cursorStatus)
  if not ScoreBoard.cursorStatus and not getKeyState("tab") then
    showScoreboard(false)
  end
end
function ScoreBoard.key(arg0, arg1)
  if arg0 == "mouse_wheel_up" or arg0 == "mouse_wheel_down" then
    if ScoreBoard.state then
      MouseWheel(arg0, "both")
    end
    cancelEvent()
  end
end
function updatePlayersList()
  if ScoreBoard.state then
    ScoreBoard.players = getElementsByType("player")
    table.remove(ScoreBoard.players, 1)
    table.sort(ScoreBoard.players, function(arg0, arg1)
      return (tonumber(exports.roleplay:getPlayerID(arg0)) or 9999999) < (tonumber(exports.roleplay:getPlayerID(arg1)) or 9999999)
    end)
    ScoreBoard.players_count = #ScoreBoard.players + 1 .. " Player" .. (#ScoreBoard.players + 1 == 1 and "" or "s")
  end
  var0[source] = nil
end
addEventHandler("onClientPlayerJoin", root, updatePlayersList)
addEventHandler("onClientPlayerQuit", root, updatePlayersList)
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
