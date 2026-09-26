-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

addEventHandler("onClientGUIFocus", root, function()
  if getElementType(source) == "gui-edit" or getElementType(source) == "gui-memo" then
    guiSetInputEnabled(true)
  end
end)
addEventHandler("onClientGUIBlur", root, function()
  guiSetInputEnabled(false)
end)
