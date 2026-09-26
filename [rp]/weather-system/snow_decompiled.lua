-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

settings = {
  type = "real",
  density = 700,
  wind_direction = {0.01, 0.01},
  wind_speed = 1,
  snowflake_min_size = 1,
  snowflake_max_size = 3,
  fall_speed_min = 1,
  fall_speed_max = 4,
  jitter = true
}
sx, sy = guiGetScreenSize()
sx2, sy2 = sx / 2, sy / 2
function random(arg0, arg1)
  return arg0 + math.random() * (arg1 - arg0)
end
function startSnow()
  if not var0 then
    var1 = {}
    var2 = getDistanceBetweenPoints3D(getWorldFromScreenPosition(0, 0, 1)) + 3
    var3 = var2
    var4 = var2 * 2
    var5 = var3 * 2
    var6 = {
      getWorldFromScreenPosition(sx2, sy2, var3)
    }
    for forvar9 = 1, settings.density do
      createFlake(random(0, var2 * 2) - var2, random(0, var3 * 2) - var3, random(0, var7 * 2) - var7, 0)
    end
    addEventHandler("onClientRender", root, drawSnow)
    var0 = true
    return true
  else
    return false
  end
  return false
end
function toggleSnow()
  if var0 then
    stopSnow()
  else
    startSnow()
  end
end
addEvent("weather:snow:sync", true)
addEventHandler("weather:snow:sync", localPlayer, function(arg0)
  var0 = arg0
  if arg0 then
    if exports.settings:getSetting("snow_fall") then
      startSnow()
    end
  else
    stopSnow()
  end
end)
addEventHandler("onClientSettingsReady", resourceRoot, function()
  if var0 and exports.settings:getSetting("snow_fall") then
    startSnow()
  end
end)
addEvent("onClientSettingChange", false)
addEventHandler("onClientSettingChange", localPlayer, function(arg0, arg1, arg2)
  if arg0 == "snow_fall" then
    if arg2 then
      if var0 then
        startSnow()
      end
    else
      stopSnow()
    end
  end
end)
function stopSnow()
  if var0 then
    removeEventHandler("onClientRender", root, drawSnow)
    for forvar3, forvar4 in pairs(var1) do
      var1[forvar3] = nil
    end
    var1 = nil
    var2 = nil
    var0 = false
    return true
  end
  return false
end
addEventHandler("onClientResourceStop", resourceRoot, stopSnow)
function updateSnowType(arg0)
  if arg0 then
    settings.type = arg0
    return true
  end
  return false
end
function updateSnowDensity(arg0, arg1, arg2)
  if arg0 and tonumber(arg0) then
    arg0 = tonumber(arg0)
    if var0 then
      if arg1 then
        if arg0 > settings.density then
          if not tonumber(arg2) then
            arg2 = 300
          end
          setTimer(function(arg0, arg1)
            for forvar5 = 1, (arg1 - arg0) / 20 do
              createFlake(random(0, var0 * 2) - var0, random(0, var1 * 2) - var1, var2, 0)
            end
          end, tonumber(arg2), 20, settings.density, arg0)
        elseif arg0 < settings.density then
          if not tonumber(arg2) then
            arg2 = 10
          end
          var4 = {
            settings.density - arg0,
            0,
            tonumber(arg2)
          }
        end
        if not tonumber(arg2) then
          arg2 = 0
        end
      else
        arg2 = 0
        if arg0 > settings.density then
          for forvar6 = settings.density + 1, arg0 do
            createFlake(random(0, var1 * 2) - var1, random(0, var2 * 2) - var2, var3, 0)
          end
        elseif arg0 < settings.density then
          for forvar6 = density, arg0 + 1, -1 do
            table.remove(var5, forvar6)
          end
        end
      end
    else
      arg2 = 0
    end
    settings.density = tonumber(arg0)
    return true
  end
  return false
end
function updateSnowWindDirection(arg0, arg1)
  if arg0 and tonumber(arg0) and arg1 and tonumber(arg1) then
    settings.wind_direction = {
      tonumber(arg0) / 100,
      tonumber(arg1) / 100
    }
    return true
  end
  return false
end
function updateSnowWindSpeed(arg0)
  if arg0 and tonumber(arg0) then
    settings.wind_speed = tonumber(arg0)
    return true
  end
  return false
end
function updateSnowflakeSize(arg0, arg1)
  if arg0 and tonumber(arg0) and arg1 and tonumber(arg1) then
    settings.snowflake_min_size = tonumber(arg0)
    settings.snowflake_max_size = tonumber(arg1)
    return true
  end
  return false
end
function updateSnowFallSpeed(arg0, arg1)
  if arg0 and tonumber(arg0) and arg1 and tonumber(arg1) then
    settings.fall_speed_min = tonumber(arg0)
    settings.fall_speed_max = tonumber(arg1)
    return true
  end
  return false
end
function updateSnowAlphaFadeIn(arg0)
  if arg0 and tonumber(arg0) then
    var0 = tonumber(arg0)
    return true
  end
  return false
end
function updateSnowJitter(arg0)
  settings.jitter = arg0
end
function createFlake(arg0, arg1, arg2, arg3, arg4)
  if var0 then
    if var0[2] % var0[3] == 0 then
      var0[1] = var0[1] - 1
      if var0[1] == 0 then
        var0 = nil
      end
      table.remove(var1, arg4)
      return
    else
      var0[2] = var0[2] + 1
    end
  end
  var2 = var2 % 4 + 1
  if arg4 then
    var1[arg4] = {
      x = arg0,
      y = arg1,
      z = arg2,
      speed = math.random(settings.fall_speed_min, settings.fall_speed_max) / 100,
      size = 2 ^ math.random(settings.snowflake_min_size, settings.snowflake_max_size),
      section = {
        var2 % 2 == 1 and 0 or 32,
        var2 < 3 and 0 or 32
      },
      rot = math.random(0, 180),
      alpha = arg3,
      jitter_direction = {
        math.cos(math.rad(math.random(0, 180) * 2)),
        -math.sin(math.rad(math.random(0, 360)))
      },
      jitter_cycle = math.random(0, 180) * 2,
      jitter_speed = 8
    }
  else
    table.insert(var1, {
      x = arg0,
      y = arg1,
      z = arg2,
      speed = math.random(settings.fall_speed_min, settings.fall_speed_max) / 100,
      size = 2 ^ math.random(settings.snowflake_min_size, settings.snowflake_max_size),
      section = {
        var2 % 2 == 1 and 0 or 32,
        var2 < 3 and 0 or 32
      },
      rot = math.random(0, 180),
      alpha = arg3,
      jitter_direction = {
        math.cos(math.rad(math.random(0, 180) * 2)),
        -math.sin(math.rad(math.random(0, 360)))
      },
      jitter_cycle = math.random(0, 180) * 2,
      jitter_speed = 8
    })
  end
end
function drawSnow()
  if isLineOfSightClear(getCameraMatrix()) or isLineOfSightClear(getWorldFromScreenPosition(sx2, sy2, var0)) then
    if testLineAgainstWater(getCameraMatrix()) then
    end
    for forvar14 = 1, 3 do
      ({})[forvar14] = {
        getWaterLevel(getWorldFromScreenPosition(sx2, sy2, var0) + -var1 + var2 * (forvar14 * 0.25), getWorldFromScreenPosition(sx2, sy2, var0) + -var0 + var3 * 0.25, getWorldFromScreenPosition(sx2, sy2, var0) + 15),
        getWaterLevel(getWorldFromScreenPosition(sx2, sy2, var0) + -var1 + var2 * (forvar14 * 0.25), getWorldFromScreenPosition(sx2, sy2, var0) + -var0 + var3 * 0.5, getWorldFromScreenPosition(sx2, sy2, var0) + 15),
        getWaterLevel(getWorldFromScreenPosition(sx2, sy2, var0) + -var1 + var2 * (forvar14 * 0.25), getWorldFromScreenPosition(sx2, sy2, var0) + -var0 + var3 * 0.75, getWorldFromScreenPosition(sx2, sy2, var0) + 15)
      }
    end
    for forvar17, forvar18 in pairs(var5) do
      if forvar18 then
        if forvar18.z < -var6 then
          createFlake(random(0, var1 * 2) - var1, random(0, var0 * 2) - var0, var6, 0, forvar17)
        else
          if forvar18.x <= var2 * 0.33 - var1 then
          else
          end
          if forvar18.y <= var3 * 0.33 - var0 then
          else
          end
          if ({})[3][3] and forvar18.z + getWorldFromScreenPosition(sx2, sy2, var0) > ({})[3][3] then
            if getScreenFromWorldPosition(forvar18.x + getWorldFromScreenPosition(sx2, sy2, var0) + forvar18.jitter_direction[1] * (math.cos(forvar18.jitter_cycle) / forvar18.jitter_speed), forvar18.y + getWorldFromScreenPosition(sx2, sy2, var0) + forvar18.jitter_direction[2] * (math.cos(forvar18.jitter_cycle) / forvar18.jitter_speed), forvar18.z + getWorldFromScreenPosition(sx2, sy2, var0), 15, false) and getScreenFromWorldPosition(forvar18.x + getWorldFromScreenPosition(sx2, sy2, var0) + forvar18.jitter_direction[1] * (math.cos(forvar18.jitter_cycle) / forvar18.jitter_speed), forvar18.y + getWorldFromScreenPosition(sx2, sy2, var0) + forvar18.jitter_direction[2] * (math.cos(forvar18.jitter_cycle) / forvar18.jitter_speed), forvar18.z + getWorldFromScreenPosition(sx2, sy2, var0), 15, false) then
              dxDrawImageSection(getScreenFromWorldPosition(forvar18.x + getWorldFromScreenPosition(sx2, sy2, var0) + forvar18.jitter_direction[1] * (math.cos(forvar18.jitter_cycle) / forvar18.jitter_speed), forvar18.y + getWorldFromScreenPosition(sx2, sy2, var0) + forvar18.jitter_direction[2] * (math.cos(forvar18.jitter_cycle) / forvar18.jitter_speed), forvar18.z + getWorldFromScreenPosition(sx2, sy2, var0), 15, false))
              forvar18.rot = forvar18.rot + settings.wind_speed
              if 255 > forvar18.alpha then
                forvar18.alpha = forvar18.alpha + var7
                if 255 < forvar18.alpha then
                  forvar18.alpha = 255
                end
              end
            end
          else
          end
          if settings.jitter then
            forvar18.jitter_cycle = forvar18.jitter_cycle % 360 + 0.1
          end
          forvar18.x = forvar18.x + settings.wind_direction[1] * settings.wind_speed
          forvar18.y = forvar18.y + settings.wind_direction[2] * settings.wind_speed
          forvar18.z = forvar18.z - forvar18.speed
          forvar18.x = forvar18.x + (_FOR_[1] - getWorldFromScreenPosition(sx2, sy2, var0))
          forvar18.y = forvar18.y + (var4[2] - getWorldFromScreenPosition(sx2, sy2, var0))
          forvar18.z = forvar18.z + (var4[3] - getWorldFromScreenPosition(sx2, sy2, var0))
          if forvar18.x < -var1 or forvar18.x > var1 or forvar18.y < -var0 or forvar18.y > var0 or forvar18.z > var6 then
            forvar18.x = forvar18.x - (_FOR_[1] - getWorldFromScreenPosition(sx2, sy2, var0))
            forvar18.y = forvar18.y - (var4[2] - getWorldFromScreenPosition(sx2, sy2, var0))
            if not (0 < forvar18.x) or not -forvar18.x then
            end
            if not (0 < forvar18.y) or not -forvar18.y then
            end
            createFlake(math.abs(forvar18.x), math.abs(forvar18.y), random(0, var6 * 2) - var6, 255, forvar17)
          end
        end
      end
    end
  else
  end
  var4 = {
    getWorldFromScreenPosition(sx2, sy2, var0)
  }
end
