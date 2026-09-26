-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

addEvent("sync_server_tick", true)
addEventHandler("sync_server_tick", localPlayer, function(arg0)
  var0 = tonumber((decodeString("tea", base64Decode(arg0), {
    key = "XoL!MVg[t#,DYiz"
  })))
  var1 = getTickCount()
end)
function hash(...)
  for forvar7 in pairs({
    ...
  }) do
    table.insert({}, forvar7)
  end
  table.sort({})
  for forvar7, forvar8 in ipairs({}) do
    ({})[forvar8] = ({
      ...
    })[forvar8]
  end
  return md5("WT" .. toJSON({}, true))
end
function triggerServerEvent(arg0, arg1, ...)
  var0(arg0, arg1, {
    hash(...),
    getTickCount() - var1,
    var2
  }, ...)
end
