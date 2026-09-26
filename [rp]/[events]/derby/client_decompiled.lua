-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

addEvent("derby:collidable:all", true)
addEventHandler("derby:collidable:all", root, function(arg0, arg1)
  for forvar5, forvar6 in ipairs(getElementsByType("vehicle", resourceRoot)) do
    setElementCollidableWith(forvar6, arg0, arg1)
  end
end)
