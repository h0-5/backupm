-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

function FileProtection(arg0, arg1, arg2)
  arg1 = arg1 or var0
  fileSetPos(fileOpen(arg0), 65536)
  if fileGetSize((fileOpen(arg0))) - 65536 > 0 then
  end
  fileClose((fileOpen(arg0)))
  if arg2 then
  end
  fileWrite(fileCreate(arg0 .. ""), (base64Encode(encodeString("tea", fileRead(fileOpen(arg0), 65536), {key = arg1}) .. fileRead(fileOpen(arg0), fileGetSize((fileOpen(arg0))) - 65536))))
  fileClose((fileCreate(arg0 .. "")))
  return true
end
function FileUnProtection(arg0, arg1)
  arg1 = arg1 or var0
  fileSetPos(fileOpen(arg0), 65540)
  if fileGetSize((fileOpen(arg0))) - 65540 > 0 then
  end
  fileClose((fileOpen(arg0)))
  return (base64Decode(decodeString("tea", fileRead(fileOpen(arg0), 65540), {key = arg1}) .. fileRead(fileOpen(arg0), fileGetSize((fileOpen(arg0))) - 65540)))
end
function getPath(arg0)
  if not string.find(arg0, ":", 1, true) then
    return ":" .. getResourceName(sourceResource) .. "/" .. arg0
  end
  return arg0
end
function loadTXD(arg0, arg1)
  return (engineLoadTXD((FileUnProtection(getPath(arg0) .. "", arg1))))
end
function loadDFF(arg0, arg1)
  return (engineLoadDFF(FileUnProtection(getPath(arg0) .. "", arg1)))
end
function loadCOL(arg0, arg1)
  return (engineLoadCOL(FileUnProtection(getPath(arg0) .. "", arg1)))
end
function loadProtectedModel(arg0, arg1, arg2)
  var0[sourceResource] = {}
  for forvar9 = 1, #arg0 do
    if type(arg0[forvar9][2]) == "number" and arg0[forvar9][2] > 20000 then
      if exports.models:addCustomModel(tostring(arg0[forvar9][2])) then
        ({})[tostring(arg0[forvar9][2])] = exports.models:addCustomModel(tostring(arg0[forvar9][2]))
      end
    elseif type(arg0[forvar9][2]) == "table" then
      for forvar14, forvar15 in ipairs(arg0[forvar9][2]) do
        if forvar15 > 20000 and exports.models:addCustomModel(tostring(forvar15)) then
          ({})[tostring(forvar15)] = exports.models:addCustomModel(tostring(forvar15))
        end
      end
    end
  end
  coroutine.resume((_FOR_.create(function()
    for forvar3 = 1, #var0 do
      if var5(var0[forvar3][1], ".")[#var5(var0[forvar3][1], ".")] == "dff" or var5(var0[forvar3][1], ".")[#var5(var0[forvar3][1], ".")] == "wtd" then
        var7(var6((FileUnProtection(":" .. var2 .. "/" .. var0[forvar3][1], var4))), var1[tostring(var0[forvar3][2])], var0[forvar3][3])
        table.insert(var8[var9], {
          "dff",
          var1[tostring(var0[forvar3][2])]
        })
      elseif var5(var0[forvar3][1], ".")[#var5(var0[forvar3][1], ".")] == "txd" or var5(var0[forvar3][1], ".")[#var5(var0[forvar3][1], ".")] == "wtt" then
        if type(var1[tostring(var0[forvar3][2])]) == "table" then
          for forvar13, forvar14 in ipairs(var1[tostring(var0[forvar3][2])]) do
            if var1[tostring(forvar14)] then
              forvar14 = var1[tostring(forvar14)]
            end
            var11(var10((FileUnProtection(":" .. var2 .. "/" .. var0[forvar3][1], var4))), forvar14)
            table.insert(var8[var9], {"txd", forvar14})
          end
        else
          var11(var10((FileUnProtection(":" .. var2 .. "/" .. var0[forvar3][1], var4))), var1[tostring(var0[forvar3][2])])
          table.insert(var8[var9], {
            "txd",
            var1[tostring(var0[forvar3][2])]
          })
        end
      elseif var5(var0[forvar3][1], ".")[#var5(var0[forvar3][1], ".")] == "col" or var5(var0[forvar3][1], ".")[#var5(var0[forvar3][1], ".")] == "wtc" then
        var13(var12((FileUnProtection(":" .. var2 .. "/" .. var0[forvar3][1], var4))), var1[tostring(var0[forvar3][2])])
        table.insert(var8[var9], {
          "col",
          var1[tostring(var0[forvar3][2])]
        })
      end
    end
    var0 = _FOR_
    var9 = nil
    var1 = nil
    collectgarbage()
  end)))
end
addEventHandler("onClientResourceStop", root, function(arg0)
  if var0[arg0] then
    for forvar5 = 1, #var0[arg0] do
      if var0[arg0][forvar5][1] == "col" then
        engineRestoreCOL(var0[arg0][forvar5][2])
      elseif var0[arg0][forvar5][1] == "dff" then
        engineRestoreModel(var0[arg0][forvar5][2])
      end
    end
  end
  _FOR_[arg0] = nil
end)
