-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

function formatNumber(arg0)
  while true do
    k = string.gsub(arg0, "^(-?%d+)(%d%d%d)", "%1,%2")
    if k == 0 then
      break
    end
  end
  return string.gsub(arg0, "^(-?%d+)(%d%d%d)", "%1,%2")
end
function isASCII(arg0)
  for forvar4 = 1, #arg0 do
    if arg0:byte(forvar4) < 33 or arg0:byte(forvar4) > 126 then
      return false
    end
  end
  return _FOR_
end
