-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

function weapons_sounds(arg0)
  if var0 then
    return
  end
  if var1[arg0] then
    setAmbientSoundEnabled("gunfire", false)
    if getElementDimension(source) ~= getElementDimension(localPlayer) or getElementInterior(source) ~= getElementInterior(localPlayer) then
      return
    end
    if getDistanceBetweenPoints3D(getElementPosition(localPlayer)) > 90 then
      return
    end
    sound = playSound3D("sounds/" .. var1[arg0][1] .. ".mp3", getPedWeaponMuzzlePosition(source))
    setSoundMaxDistance(sound, 90)
    setElementDimension(sound, (getElementDimension(source)))
    setElementInterior(sound, (getElementInterior(source)))
    setSoundVolume(sound, 0.1)
  end
end
addEventHandler("onClientPlayerWeaponFire", root, weapons_sounds)
function loadWeapons()
  if var0 > 0 then
    return
  end
  if var1 then
    return
  end
  var2 = {}
  for forvar3, forvar4 in pairs(var3) do
    if not forvar4[3] then
      if exports["files-protection"]:loadTXD("models/" .. forvar4[1] .. ".txd", "WTENC") then
        table.insert(var2, (exports["files-protection"]:loadTXD("models/" .. forvar4[1] .. ".txd", "WTENC")))
        engineImportTXD(exports["files-protection"]:loadTXD("models/" .. forvar4[1] .. ".txd", "WTENC"), forvar4[2])
      end
      if exports["files-protection"]:loadDFF("models/" .. forvar4[1] .. ".dff", "WTENC") then
        engineReplaceModel(exports["files-protection"]:loadDFF("models/" .. forvar4[1] .. ".dff", "WTENC"), forvar4[2])
      end
    end
  end
  var1 = true
end
function unloadWeapons()
  if not var0 then
    return
  end
  for forvar3, forvar4 in pairs(var1) do
    if not forvar4[3] then
      engineRestoreModel(forvar4[2])
    end
  end
  var0 = true
end
addEventHandler("onClientResourceStart", resourceRoot, function()
  for forvar3, forvar4 in pairs(var0) do
    downloadFile("models/" .. forvar4[1] .. ".txd")
    downloadFile("models/" .. forvar4[1] .. ".dff")
  end
end)
addEventHandler("onClientSettingsReady", resourceRoot, function()
  if exports.settings:getSetting("weapons:realistic_sounds") then
    muteOriginalWeaponSounds(true)
  else
    var0 = true
    muteOriginalWeaponSounds(false)
  end
  if exports.settings:getSetting("weapons:new_models") then
    loadWeapons()
  end
end)
addEventHandler("onClientFileDownloadComplete", resourceRoot, function(arg0, arg1)
  var0 = var0 - 1
  if var0 <= 0 and exports.settings:getSetting("weapons:new_models") then
    loadWeapons()
  end
end)
addEventHandler("onClientSettingChange", localPlayer, function(arg0, arg1, arg2)
  if arg0 == "weapons:realistic_sounds" then
    if arg2 then
      var0 = false
      muteOriginalWeaponSounds(true)
    else
      var0 = true
      muteOriginalWeaponSounds(false)
    end
  elseif arg0 == "weapons:new_models" then
    if arg2 then
      loadWeapons()
    elseif var1 then
      for forvar6, forvar7 in ipairs(var2) do
        destroyElement(forvar7)
      end
      var2 = {}
      for forvar6, forvar7 in pairs(var3) do
        engineRestoreModel(forvar7[2])
      end
      var1 = false
    end
  end
end)
function muteOriginalWeaponSounds(arg0)
  setWorldSoundEnabled(5, not arg0)
  setWorldSoundEnabled(5, 3, not arg0)
  setWorldSoundEnabled(5, 4, not arg0)
  setWorldSoundEnabled(5, 5, not arg0)
  setWorldSoundEnabled(5, 6, not arg0)
  setWorldSoundEnabled(5, 7, not arg0)
  setWorldSoundEnabled(5, 8, not arg0)
  setWorldSoundEnabled(5, 11, not arg0)
  setWorldSoundEnabled(5, 12, not arg0)
  setWorldSoundEnabled(5, 13, not arg0)
  setWorldSoundEnabled(5, 14, not arg0)
  setWorldSoundEnabled(5, 15, not arg0)
  setWorldSoundEnabled(5, 16, not arg0)
  setWorldSoundEnabled(5, 17, not arg0)
  setWorldSoundEnabled(5, 18, not arg0)
  setWorldSoundEnabled(5, 21, not arg0)
  setWorldSoundEnabled(5, 22, not arg0)
  setWorldSoundEnabled(5, 23, not arg0)
  setWorldSoundEnabled(5, 24, not arg0)
  setWorldSoundEnabled(5, 26, not arg0)
  setWorldSoundEnabled(5, 27, not arg0)
  setWorldSoundEnabled(5, 29, not arg0)
  setWorldSoundEnabled(5, 32, not arg0)
  setWorldSoundEnabled(5, 33, not arg0)
  setWorldSoundEnabled(5, 52, not arg0)
  setWorldSoundEnabled(5, 55, not arg0)
  setWorldSoundEnabled(5, 63, not arg0)
  setWorldSoundEnabled(5, 73, not arg0)
  setWorldSoundEnabled(5, 76, not arg0)
  setWorldSoundEnabled(5, 83, not arg0)
end
