-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

function setDiscordRichPresence()
  resetDiscordRichPresenceData()
  if setDiscordApplicationID("1009750848483635250") then
    setDiscordRichPresenceAsset("wt_logo", "WnashTime Roleplay | \217\136\217\134\216\167\216\179\216\169 \216\170\216\167\217\138\217\133 \216\167\217\132\216\173\217\138\216\167\216\169 \216\167\217\132\217\136\216\167\217\130\216\185\217\138\216\169")
    setDiscordRichPresenceSmallAsset("wt_s3", "Season 3 | \216\167\217\132\217\133\217\136\216\179\217\133 \216\167\217\132\216\171\216\167\217\132\216\171")
    setDiscordRichPresenceButton(1, "\216\175\216\174\217\136\217\132 \216\167\217\132\216\179\217\138\216\177\217\129\216\177", "mtasa://51.91.215.201:22003")
    setDiscordRichPresenceButton(2, "\216\175\216\174\217\136\217\132 \216\167\217\132\216\175\216\179\217\131\217\136\216\177\216\175", "https://discord.gg/wnashtime")
    setDiscordRichPresenceStartTime(1)
    if getElementData(localPlayer, "character:id") then
      setDiscordRichPresenceDetails("Playing as " .. getElementData(localPlayer, "character:name"))
      setDiscordRichPresenceState("ID: " .. exports.roleplay:getPlayerID(localPlayer) .. " - Players")
    else
      setDiscordRichPresenceDetails("")
      setDiscordRichPresenceState(getElementData(localPlayer, "loading:status") or "In Lobby")
    end
    setDiscordRichPresencePartySize(#getElementsByType("player"), 2048)
    addEventHandler("onClientPlayerJoin", root, updateDiscordRichPresencePartySize)
    addEventHandler("onClientPlayerQuit", root, updateDiscordRichPresencePartySize)
  end
end
addEventHandler("onClientResourceStart", resourceRoot, function()
  setDiscordRichPresence()
end)
addEventHandler("onClientElementDataChange", localPlayer, function(arg0, arg1, arg2)
  if arg0 == "loading:status" then
    if arg2 and not getElementData(localPlayer, "character:id") then
      setDiscordRichPresenceDetails("")
      setDiscordRichPresenceState(getElementData(localPlayer, "loading:status") or "In Lobby")
    end
  elseif arg0 == "character:name" and arg2 then
    setDiscordRichPresenceDetails("Playing as " .. getElementData(localPlayer, "character:name"))
    setDiscordRichPresenceState("ID: " .. exports.roleplay:getPlayerID(localPlayer) .. " - Players")
  end
end)
function updateDiscordRichPresenceState()
  if getElementData(localPlayer, "character:id") then
    setDiscordRichPresenceState("ID: " .. exports.roleplay:getPlayerID(localPlayer) .. " - Players")
  else
    setDiscordRichPresenceState(getElementData(localPlayer, "loading:status") or "In Lobby")
  end
  setDiscordRichPresencePartySize(#getElementsByType("player"), 2048)
end
function updateDiscordRichPresencePartySize()
  if isDiscordRichPresenceConnected() then
    updateDiscordRichPresenceState()
  end
end
