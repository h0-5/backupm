-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

addEventHandler("onClientResourceStart", resourceRoot, function()
  for forvar5, forvar6 in pairs(var0) do
    for forvar10, forvar11 in pairs(forvar6) do
      engineImportTXD(exports["files-protection"]:loadTXD("walls/all_walls.txd"), forvar11)
      engineReplaceModel(exports["files-protection"]:loadDFF("walls/" .. forvar5 .. ".dff"), forvar11)
      engineReplaceCOL(exports["files-protection"]:loadCOL("walls/" .. forvar5 .. ".col"), forvar11)
    end
  end
  for forvar6, forvar7 in pairs(var1) do
    engineImportTXD(exports["files-protection"]:loadTXD("models/BIOS.txd"), forvar7)
    engineReplaceModel(exports["files-protection"]:loadDFF("models/" .. forvar6 .. ".dff"), forvar7)
    engineReplaceCOL(exports["files-protection"]:loadCOL("models/" .. forvar6 .. ".col"), forvar7)
  end
  engineImportTXD(exports["files-protection"]:loadTXD("models/BIOS.txd"), 1882)
  engineReplaceModel(exports["files-protection"]:loadDFF("models/4x4.dff"), 1882)
  engineReplaceCOL(exports["files-protection"]:loadCOL("models/4x4.col"), 1882)
  engineImportTXD(exports["files-protection"]:loadTXD("models/BIOS.txd"), 1246)
  engineReplaceModel(exports["files-protection"]:loadDFF("models/4x4.dff"), 1246)
  engineReplaceCOL(exports["files-protection"]:loadCOL("models/4x4.col"), 1246)
  engineImportTXD(engineLoadTXD("objects/ArrowType3.txd"), 1318)
  engineReplaceModel(exports["files-protection"]:loadDFF("objects/ArrowType3.dff"), 1318)
  engineImportTXD(exports["files-protection"]:loadTXD("objects/icons3.txd"), 1273)
  engineReplaceModel(exports["files-protection"]:loadDFF("objects/property_fsale.dff"), 1273)
  engineImportTXD(exports["files-protection"]:loadTXD("objects/icons4.txd"), 1272)
  engineReplaceModel(exports["files-protection"]:loadDFF("objects/property_locked.dff"), 1272)
  engineReplaceModel(exports["files-protection"]:loadDFF("objects/int3int_carupg_int.dff"), 14776)
end)
;({}).mp_gs_libwall = dxCreateTexture("mp_gs_libwall.png", "dxt1")
;({}).ab_clubloungewall = dxCreateTexture("ab_clubloungewall.png", "dxt1")
;({}).cl_of_wltemp = dxCreateTexture("cl_of_wltemp.png", "dxt1")
;({}).mp_diner_woodwall = dxCreateTexture("mp_diner_woodwall.png", "dxt1")
;({}).floor = dxCreateTexture("floor.jpg", "dxt1")
;({}).white_wood = dxCreateTexture("white_wood.png", "dxt1")
;({}).wall2 = dxCreateTexture("wall2.png", "dxt1")
;({}).floor_2 = dxCreateTexture("floor_2.png", "dxt1")
;({}).floor_3 = dxCreateTexture("floor_3.jpg", "dxt1")
;({}).floor_5 = dxCreateTexture("floor_5.png", "dxt1")
addEventHandler("onClientElementStreamIn", root, function()
  if var0[source] then
    return
  end
  if not getElementType(source) == "object" then
    return
  end
  if var1[getElementModel(source)] then
    engineApplyShaderToWorldTexture(dxCreateShader("replacement.fx", 0, 200, false, "object"), (getElementModel(source) == 1882 or getElementModel(source) == 1246) and "4" or "mp_motel_whitewall", source)
    dxSetShaderValue(dxCreateShader("replacement.fx", 0, 200, false, "object"), "gTexture", var2[var1[getElementModel(source)]])
    var0[source] = true
  end
end)
