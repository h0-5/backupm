-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

(function()
  ({
    _VERSION = "Slither 20140904",
    _DESCRIPTION = "Slither is a pythonic class library for lua",
    _URL = "http://bitbucket.org/bartbes/slither",
    _LICENSE = [[
    Copyright (c) 2011-2014 Bart van Strien
    This software is provided 'as-is', without any express or implied
    warranty. In no event will the authors be held liable for any damages
    arising from the use of this software.
    Permission is granted to anyone to use this software for any purpose,
    including commercial applications, and to alter it and redistribute it
    freely, subject to the following restrictions:
      1. The origin of this software must not be misrepresented; you must not
      claim that you wrote the original software. If you use this software
      in a product, an acknowledgment in the product documentation would be
      appreciated but is not required.
      2. Altered source versions must be plainly marked as such, and must not be
      misrepresented as being the original software.
      3. This notice may not be removed or altered from any source
      distribution.
    ]]
  }).private = function(arg0)
    return function(...)
      return var0(false, var1, ...)
    end
  end
  setmetatable({
    _VERSION = "Slither 20140904",
    _DESCRIPTION = "Slither is a pythonic class library for lua",
    _URL = "http://bitbucket.org/bartbes/slither",
    _LICENSE = [[
    Copyright (c) 2011-2014 Bart van Strien
    This software is provided 'as-is', without any express or implied
    warranty. In no event will the authors be held liable for any damages
    arising from the use of this software.
    Permission is granted to anyone to use this software for any purpose,
    including commercial applications, and to alter it and redistribute it
    freely, subject to the following restrictions:
      1. The origin of this software must not be misrepresented; you must not
      claim that you wrote the original software. If you use this software
      in a product, an acknowledgment in the product documentation would be
      appreciated but is not required.
      2. Altered source versions must be plainly marked as such, and must not be
      misrepresented as being the original software.
      3. This notice may not be removed or altered from any source
      distribution.
    ]]
  }, {
    __call = function(arg0, arg1)
      return function(...)
        return var0(true, var1, ...)
      end
    end
  }).issubclass = function(arg0, arg1)
    if arg1.__class__ then
      arg1 = {arg1}
    end
    for forvar5, forvar6 in ipairs(arg1) do
      if forvar6 ~= arg0 then
        for forvar11, forvar12 in ipairs(arg0.__parents__) do
          if forvar6 == forvar12 then
            break
          end
        end
      end
      if not true then
        return false
      end
    end
    return true
  end
  setmetatable({
    _VERSION = "Slither 20140904",
    _DESCRIPTION = "Slither is a pythonic class library for lua",
    _URL = "http://bitbucket.org/bartbes/slither",
    _LICENSE = [[
    Copyright (c) 2011-2014 Bart van Strien
    This software is provided 'as-is', without any express or implied
    warranty. In no event will the authors be held liable for any damages
    arising from the use of this software.
    Permission is granted to anyone to use this software for any purpose,
    including commercial applications, and to alter it and redistribute it
    freely, subject to the following restrictions:
      1. The origin of this software must not be misrepresented; you must not
      claim that you wrote the original software. If you use this software
      in a product, an acknowledgment in the product documentation would be
      appreciated but is not required.
      2. Altered source versions must be plainly marked as such, and must not be
      misrepresented as being the original software.
      3. This notice may not be removed or altered from any source
      distribution.
    ]]
  }, {
    __call = function(arg0, arg1)
      return function(...)
        return var0(true, var1, ...)
      end
    end
  }).isinstance = function(arg0, arg1)
    return type(arg0) == "table" and arg0.__class__ and var0.issubclass(arg0.__class__, arg1)
  end
  if common_class ~= false then
    common = {}
    function common.class(arg0, arg1, arg2)
      arg1.__init__ = arg1.init
      return var0(arg0, {arg2}, arg1)
    end
    function common.instance(arg0, ...)
      return arg0(...)
    end
  end
  return (setmetatable({
    _VERSION = "Slither 20140904",
    _DESCRIPTION = "Slither is a pythonic class library for lua",
    _URL = "http://bitbucket.org/bartbes/slither",
    _LICENSE = [[
    Copyright (c) 2011-2014 Bart van Strien
    This software is provided 'as-is', without any express or implied
    warranty. In no event will the authors be held liable for any damages
    arising from the use of this software.
    Permission is granted to anyone to use this software for any purpose,
    including commercial applications, and to alter it and redistribute it
    freely, subject to the following restrictions:
      1. The origin of this software must not be misrepresented; you must not
      claim that you wrote the original software. If you use this software
      in a product, an acknowledgment in the product documentation would be
      appreciated but is not required.
      2. Altered source versions must be plainly marked as such, and must not be
      misrepresented as being the original software.
      3. This notice may not be removed or altered from any source
      distribution.
    ]]
  }, {
    __call = function(arg0, arg1)
      return function(...)
        return var0(true, var1, ...)
      end
    end
  }))
end)()("_Async")({
  __init__ = function(arg0)
    arg0.threads = {}
    arg0.resting = 50
    arg0.maxtime = 200
    arg0.current = 0
    arg0.state = "suspended"
    arg0.debug = false
    arg0.priority = {
      low = {1500, 150},
      normal = {200, 200},
      high = {50, 500}
    }
    arg0:setPriority("normal")
  end,
  switch = function(arg0, arg1)
    arg0.state = "running"
    if arg0.current + 1 <= #arg0.threads then
      arg0.current = arg0.current + 1
      arg0:execute(arg0.current)
    else
      arg0.current = 0
      if #arg0.threads <= 0 then
        arg0.state = "suspended"
        return
      end
      setTimer(function()
        var0:switch()
      end, arg0.resting, 1)
    end
  end,
  execute = function(arg0, arg1)
    if arg0.threads[arg1] == nil or coroutine.status(arg0.threads[arg1]) == "dead" then
      table.remove(arg0.threads, arg1)
      arg0:switch()
    else
      coroutine.resume(arg0.threads[arg1])
      arg0:switch()
    end
  end,
  add = function(arg0, arg1)
    table.insert(arg0.threads, (coroutine.create(arg1)))
  end,
  setPriority = function(arg0, arg1, arg2)
    if type(arg1) == "string" then
      if arg0.priority[arg1] ~= nil then
        arg0.resting = arg0.priority[arg1][1]
        arg0.maxtime = arg0.priority[arg1][2]
      end
    else
      arg0.resting = arg1
      arg0.maxtime = arg2
    end
  end,
  setDebug = function(arg0, arg1)
    arg0.debug = arg1
  end,
  iterate = function(arg0, arg1, arg2, arg3, arg4)
    arg0:add(function()
      for forvar5 = var0, var1 do
        var2(forvar5)
        if getTickCount() > getTickCount() + var3.maxtime then
          coroutine.yield()
        end
      end
      if _FOR_.debug then
        print("[DEBUG]Async iterate: " .. getTickCount() - getTickCount() .. "ms")
      end
      if var4 then
        var4()
      end
    end)
    arg0:switch()
  end,
  foreach = function(arg0, arg1, arg2, arg3)
    arg0:add(function()
      for forvar5, forvar6 in ipairs(var0) do
        var1(forvar6, forvar5)
        if getTickCount() > getTickCount() + var2.maxtime then
          coroutine.yield()
        end
      end
      if var2.debug then
        print("[DEBUG]Async foreach: " .. getTickCount() - getTickCount() .. "ms")
      end
      if var3 then
        var3()
      end
    end)
    arg0:switch()
  end
})
Async = {instance = nil}
function Async.setDebug(arg0, ...)
  var0():setDebug(...)
end
function Async.setPriority(arg0, ...)
  var0():setPriority(...)
end
function Async.iterate(arg0, ...)
  var0():iterate(...)
end
function Async.foreach(arg0, ...)
  var0():foreach(...)
end
