-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

addEvent("factions:playSound", true)
addEventHandler("factions:playSound", root, function(arg0)
end)
addEventHandler("onClientUIReady", resourceRoot, function()
  eui = exports.UIKit
  var0.window.examination = eui:uiCreateWindow(false, false, 700, 450, "Medical Examination")
  eui:uiSetVisible(var0.window.examination, false)
  var0.gridlist.body_parts = eui:uiCreateGridList(10, 40, 180, 300, tocolor(0, 0, 0, 0), var0.window.examination)
  eui:uiGridListAddColumn(var0.gridlist.body_parts, "Body Parts", 1)
  eui:uiSetAlign(var0.gridlist.body_parts, "left", "center")
  eui:uiSetProperty(var0.gridlist.body_parts, "row_height", 30)
  for forvar5, forvar6 in ipairs(var1) do
    eui:uiGridListSetItemText(var0.gridlist.body_parts, eui:uiGridListAddRow(var0.gridlist.body_parts), 1, forvar6[2])
    eui:uiGridListSetItemData(var0.gridlist.body_parts, eui:uiGridListAddRow(var0.gridlist.body_parts), 1, forvar6[1])
  end
  var0.button.examine = eui:uiCreateButton(10, 450 - 90, 180, 35, {en = "Examine", ar = "\217\129\216\173\216\181"}, _, var0.window.examination)
  var0.button.treat = eui:uiCreateButton(10, 450 - 45, 180, 35, {
    en = "Treat",
    ar = "\217\133\216\185\216\167\217\132\216\172\216\169"
  }, "primary", var0.window.examination)
  var0.image[1] = eui:uiCreateImage((700 - 138.29999999999998) / 2, (450 - 308.09999999999997) / 2, 138.29999999999998, 308.09999999999997, "images/health/body.png", var0.window.examination)
  var0.image[2] = eui:uiCreateImage((700 - 138.29999999999998) / 2, (450 - 308.09999999999997) / 2, 138.29999999999998, 308.09999999999997, "images/health/head.png", var0.window.examination)
  var0.image[3] = eui:uiCreateImage((700 - 138.29999999999998) / 2, (450 - 308.09999999999997) / 2, 138.29999999999998, 308.09999999999997, "images/health/torso.png", var0.window.examination)
  var0.image[4] = eui:uiCreateImage((700 - 138.29999999999998) / 2, (450 - 308.09999999999997) / 2, 138.29999999999998, 308.09999999999997, "images/health/left_arm.png", var0.window.examination)
  var0.image[5] = eui:uiCreateImage((700 - 138.29999999999998) / 2, (450 - 308.09999999999997) / 2, 138.29999999999998, 308.09999999999997, "images/health/right_arm.png", var0.window.examination)
  var0.image[6] = eui:uiCreateImage((700 - 138.29999999999998) / 2, (450 - 308.09999999999997) / 2, 138.29999999999998, 308.09999999999997, "images/health/left_leg.png", var0.window.examination)
  var0.image[7] = eui:uiCreateImage((700 - 138.29999999999998) / 2, (450 - 308.09999999999997) / 2, 138.29999999999998, 308.09999999999997, "images/health/right_leg.png", var0.window.examination)
  eui:uiSetColor(var0.image[2], 255, 0, 0, 0)
  eui:uiSetColor(var0.image[3], 255, 0, 0, 255)
  eui:uiSetColor(var0.image[4], 255, 0, 0, 255)
  eui:uiSetColor(var0.image[5], 255, 0, 0, 0)
  eui:uiSetColor(var0.image[6], 255, 0, 0, 255)
  eui:uiSetColor(var0.image[7], 255, 0, 0, 0)
  var2[9] = var0.image[2]
  var2[3] = var0.image[3]
  var2[5] = var0.image[4]
  var2[6] = var0.image[5]
  var2[7] = var0.image[6]
  var2[8] = var0.image[7]
  eui:uiCreateLabel(700 - 220, 50, 180, 20, "Health", tocolor(255, 255, 255), "left", "top", var0.window.examination)
  var0.progressbar.health = eui:uiCreateProgressBar(700 - 220, 70, 180, 5, tocolor(255, 0, 0), var0.window.examination)
  eui:uiSetProperty(var0.progressbar.health, "progress_animation", true)
  eui:uiSetProperty(var0.progressbar.health, "show_progress", false)
  var0.label.examination_result = eui:uiCreateLabel(700 - 220, 120, 180, 100, {
    en = "Examination Result:",
    ar = "\217\134\216\170\217\138\216\172\216\169 \216\167\217\132\217\129\216\173\216\181:"
  }, tocolor(255, 255, 255), "left", "top", var0.window.examination)
  var0.button.cancel = eui:uiCreateButton(700 - 155, 450 - 40, 150, 35, {en = "Cancel", ar = "\216\165\217\132\216\186\216\167\216\161"}, _, var0.window.examination)
end)
addEvent("onClientUIKitReady", true)
addEventHandler("onClientUIKitReady", root, function()
  eui = exports.UIKit
  var0.window.examination = eui:uiCreateWindow(false, false, 700, 450, "Medical Examination")
  eui:uiSetVisible(var0.window.examination, false)
  var0.gridlist.body_parts = eui:uiCreateGridList(10, 40, 180, 300, tocolor(0, 0, 0, 0), var0.window.examination)
  eui:uiGridListAddColumn(var0.gridlist.body_parts, "Body Parts", 1)
  eui:uiSetAlign(var0.gridlist.body_parts, "left", "center")
  eui:uiSetProperty(var0.gridlist.body_parts, "row_height", 30)
  for forvar5, forvar6 in ipairs(var1) do
    eui:uiGridListSetItemText(var0.gridlist.body_parts, eui:uiGridListAddRow(var0.gridlist.body_parts), 1, forvar6[2])
    eui:uiGridListSetItemData(var0.gridlist.body_parts, eui:uiGridListAddRow(var0.gridlist.body_parts), 1, forvar6[1])
  end
  var0.button.examine = eui:uiCreateButton(10, 450 - 90, 180, 35, {en = "Examine", ar = "\217\129\216\173\216\181"}, _, var0.window.examination)
  var0.button.treat = eui:uiCreateButton(10, 450 - 45, 180, 35, {
    en = "Treat",
    ar = "\217\133\216\185\216\167\217\132\216\172\216\169"
  }, "primary", var0.window.examination)
  var0.image[1] = eui:uiCreateImage((700 - 138.29999999999998) / 2, (450 - 308.09999999999997) / 2, 138.29999999999998, 308.09999999999997, "images/health/body.png", var0.window.examination)
  var0.image[2] = eui:uiCreateImage((700 - 138.29999999999998) / 2, (450 - 308.09999999999997) / 2, 138.29999999999998, 308.09999999999997, "images/health/head.png", var0.window.examination)
  var0.image[3] = eui:uiCreateImage((700 - 138.29999999999998) / 2, (450 - 308.09999999999997) / 2, 138.29999999999998, 308.09999999999997, "images/health/torso.png", var0.window.examination)
  var0.image[4] = eui:uiCreateImage((700 - 138.29999999999998) / 2, (450 - 308.09999999999997) / 2, 138.29999999999998, 308.09999999999997, "images/health/left_arm.png", var0.window.examination)
  var0.image[5] = eui:uiCreateImage((700 - 138.29999999999998) / 2, (450 - 308.09999999999997) / 2, 138.29999999999998, 308.09999999999997, "images/health/right_arm.png", var0.window.examination)
  var0.image[6] = eui:uiCreateImage((700 - 138.29999999999998) / 2, (450 - 308.09999999999997) / 2, 138.29999999999998, 308.09999999999997, "images/health/left_leg.png", var0.window.examination)
  var0.image[7] = eui:uiCreateImage((700 - 138.29999999999998) / 2, (450 - 308.09999999999997) / 2, 138.29999999999998, 308.09999999999997, "images/health/right_leg.png", var0.window.examination)
  eui:uiSetColor(var0.image[2], 255, 0, 0, 0)
  eui:uiSetColor(var0.image[3], 255, 0, 0, 255)
  eui:uiSetColor(var0.image[4], 255, 0, 0, 255)
  eui:uiSetColor(var0.image[5], 255, 0, 0, 0)
  eui:uiSetColor(var0.image[6], 255, 0, 0, 255)
  eui:uiSetColor(var0.image[7], 255, 0, 0, 0)
  var2[9] = var0.image[2]
  var2[3] = var0.image[3]
  var2[5] = var0.image[4]
  var2[6] = var0.image[5]
  var2[7] = var0.image[6]
  var2[8] = var0.image[7]
  eui:uiCreateLabel(700 - 220, 50, 180, 20, "Health", tocolor(255, 255, 255), "left", "top", var0.window.examination)
  var0.progressbar.health = eui:uiCreateProgressBar(700 - 220, 70, 180, 5, tocolor(255, 0, 0), var0.window.examination)
  eui:uiSetProperty(var0.progressbar.health, "progress_animation", true)
  eui:uiSetProperty(var0.progressbar.health, "show_progress", false)
  var0.label.examination_result = eui:uiCreateLabel(700 - 220, 120, 180, 100, {
    en = "Examination Result:",
    ar = "\217\134\216\170\217\138\216\172\216\169 \216\167\217\132\217\129\216\173\216\181:"
  }, tocolor(255, 255, 255), "left", "top", var0.window.examination)
  var0.button.cancel = eui:uiCreateButton(700 - 155, 450 - 40, 150, 35, {en = "Cancel", ar = "\216\165\217\132\216\186\216\167\216\161"}, _, var0.window.examination)
end)
addEvent("medical_examination:show", true)
addEventHandler("medical_examination:show", localPlayer, function(arg0, arg1)
  eui:uiSetVisible(var0.window.examination, true)
  showCursor(true)
  var1.damages = arg1
  var1.player = arg0
  for forvar5 = 2, 7 do
    eui:uiSetColor(var0.image[forvar5], 255, 0, 0, 0)
  end
  for forvar5 = 1, #var2 do
    eui:uiGridListSetItemColor(var0.gridlist.body_parts, forvar5 - 1, 1, tocolor(255, 255, 255))
  end
  if arg1 then
    for forvar5, forvar6 in pairs(arg1) do
      if forvar6 then
        if var3[forvar5] then
          eui:uiSetColor(var3[forvar5], 255, 0, 0, 255)
        end
        for forvar10, forvar11 in ipairs(var2) do
          if forvar11[1] == forvar5 then
            eui:uiGridListSetItemColor(var0.gridlist.body_parts, forvar10 - 1, 1, tocolor(255, 0, 0))
          end
        end
      end
    end
  end
  eui:uiProgressBarSetProgress(var0.progressbar.health, math.max(math.min(getElementHealth(arg0) / (0.232018558500192 * getPedStat(arg0, 24) - 32.018558511152), 1), 0) * 100)
  eui:uiSetText(var0.label.examination_result, "")
end)
addEventHandler("onClientUIClick", root, function()
  if source == var0.button.cancel then
    eui:uiSetVisible(var0.window.examination, false)
    showCursor(false)
  elseif source == var0.button.examine then
    if eui:uiGridListGetSelectedItem(var0.gridlist.body_parts) ~= -1 then
      if examine_timer and isTimer(examine_timer) then
        return
      end
      exports.notifications:output({
        en = "Examining in progress",
        ar = "\216\172\216\167\216\177\217\138 \216\167\217\132\217\129\216\173\216\181"
      }, 2000, "info", "bottom")
      exports.public:loading("medical_examination:examine", true)
      examine_timer = setTimer(function(arg0)
        exports.public:loading("medical_examination:examine", false)
        if var0.damages and var0.damages[arg0] then
          for forvar6, forvar7 in pairs(var0.damages[arg0]) do
            ({en = "", ar = ""}).en = ({en = "", ar = ""}).en .. "\n\226\128\162 " .. tostring(damage_types[forvar6].en) .. " (" .. tostring(math.floor(forvar7)) .. "%)"
            ;({en = "", ar = ""}).ar = ({en = "", ar = ""}).ar .. "\n\226\128\162 " .. tostring(damage_types[forvar6].ar) .. " (" .. tostring(math.floor(forvar7)) .. "%)"
            for forvar11, forvar12 in ipairs(damage_treatments[forvar6][arg0]) do
            end
          end
        end
        if ({en = "", ar = ""}).en == "" then
        end
        eui:uiSetText(var1.label.examination_result, {
          en = [[
						Examination Result:
						]] .. ({
            en = [[

There is no injury]],
            ar = "\n\217\132\216\167\216\170\217\136\216\172\216\175 \216\165\216\181\216\167\216\168\216\169"
          }).en .. [[



						Treatments:
						]] .. ("" .. "\226\128\162 x" .. (forvar12.quantity or 1) .. " " .. forvar12.name .. "\n") .. "\t\t\t\t\t",
          ar = "\t\t\t\t\t\t\217\134\216\170\217\138\216\172\216\169 \216\167\217\132\217\129\216\173\216\181:\n\t\t\t\t\t\t" .. ({
            en = [[

There is no injury]],
            ar = "\n\217\132\216\167\216\170\217\136\216\172\216\175 \216\165\216\181\216\167\216\168\216\169"
          }).ar .. "\n\n\n\t\t\t\t\t\t\217\133\216\170\216\183\217\132\216\168\216\167\216\170 \216\167\217\132\216\185\217\132\216\167\216\172:\n\t\t\t\t\t\t" .. ("" .. "\226\128\162 x" .. (forvar12.quantity or 1) .. " " .. forvar12.name .. "\n") .. "\t\t\t\t\t"
        })
      end, 2000, 1, (eui:uiGridListGetItemData(var0.gridlist.body_parts, eui:uiGridListGetSelectedItem(var0.gridlist.body_parts), 1)))
    end
  elseif source == var0.button.treat and eui:uiGridListGetSelectedItem(var0.gridlist.body_parts) ~= -1 then
    if not var1 then
      return
    end
    exports.public:loading("medical_examination:treat", true)
    triggerServerEvent("hospital:treatment", localPlayer, var1.player, (eui:uiGridListGetItemData(var0.gridlist.body_parts, eui:uiGridListGetSelectedItem(var0.gridlist.body_parts), 1)))
  end
end)
addEvent("hospital:treatment:callback", true)
addEventHandler("hospital:treatment:callback", root, function(arg0, arg1)
  exports.public:loading("medical_examination:treat", false)
end)
