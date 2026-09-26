-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

mapped_models = {}
addEventHandler("onClientResourceStart", resourceRoot, function()
  engineReplaceCOL(exports["files-protection"]:loadCOL("models/sign.col"), 1899)
  engineImportTXD(exports["files-protection"]:loadTXD("models/forsale01.txd"), 1899)
  engineReplaceModel(exports["files-protection"]:loadDFF("models/forsale01.dff"), 1899)
  engineImportTXD(exports["files-protection"]:loadTXD("models/police_things.txd"), 1900)
  engineReplaceModel(exports["files-protection"]:loadDFF("models/handcuffs01.dff"), 1900)
  engineReplaceCOL(exports["files-protection"]:loadCOL("models/cuffs.col"), 1900)
  engineReplaceCOL(exports["files-protection"]:loadCOL("models/MedicCase.col"), 1902)
  engineImportTXD(exports["files-protection"]:loadTXD("models/MedicCase.txd"), 1902)
  engineReplaceModel(exports["files-protection"]:loadDFF("models/MedicCase.dff"), 1902)
  engineSetModelLODDistance(1902, 100)
  engineReplaceCOL(exports["files-protection"]:loadCOL("models/FishingRod.col"), 1903)
  engineImportTXD(exports["files-protection"]:loadTXD("models/FishingRod.txd"), 1903)
  engineReplaceModel(exports["files-protection"]:loadDFF("models/FishingRod.dff"), 1903)
  engineSetModelLODDistance(1903, 100)
  engineReplaceCOL(exports["files-protection"]:loadCOL("models/speed_bumps.col"), 1927)
  engineImportTXD(exports["files-protection"]:loadTXD("models/speed_bumps.txd"), 1927)
  engineReplaceModel(exports["files-protection"]:loadDFF("models/speed_bumps.dff"), 1927)
  engineSetModelLODDistance(1927, 300)
  obj = createObject(5137, 2005.25, -2137.4609, 16.515625)
  removeWorldModel(5137, 100, 2005.25, -2137.4609, 16.515625)
  dff = exports["files-protection"]:loadDFF("models/brkwrhus3_las2.dff")
  engineReplaceModel(dff, 5137)
  restoreWorldModel(4005, 100, 1402.5, -1682.0234, 25.5469)
  engineReplaceCOL(exports["files-protection"]:loadCOL("models/pushbar.col"), 1907)
  engineImportTXD(exports["files-protection"]:loadTXD("models/pushbar.txd"), 1907)
  engineReplaceModel(exports["files-protection"]:loadDFF("models/pushbar.dff"), 1907)
  engineReplaceCOL(exports["files-protection"]:loadCOL("models/ram_bar.col"), 1906)
  engineImportTXD(exports["files-protection"]:loadTXD("models/ram_bar.txd"), 1906)
  engineReplaceModel(exports["files-protection"]:loadDFF("models/ram_bar.dff"), 1906)
  engineImportTXD(exports["files-protection"]:loadTXD("models/radio2.txd"), 1934)
  engineReplaceModel(exports["files-protection"]:loadDFF("models/radio2.dff"), 1934)
  engineReplaceCOL(exports["files-protection"]:loadCOL("models/sfs.col"), 11008)
  engineReplaceModel(exports["files-protection"]:loadDFF("models/sfs.dff"), 11008)
  engineImportTXD(exports["files-protection"]:loadTXD("models/416.txd"), 416)
  engineReplaceModel(exports["files-protection"]:loadDFF("models/416.dff"), 416)
  engineReplaceModel(engineLoadDFF("models/3853.dff"), 3853)
  engineReplaceModel(engineLoadDFF("models/3855.dff"), 3855)
  if engineRequestModel("object") then
    mapped_models["20000"] = engineRequestModel("object")
    engineImportTXD(engineLoadTXD("models/MatTextures.txd"), (engineRequestModel("object")))
    engineReplaceCOL(engineLoadCOL("models/PoliceCap1.col"), (engineRequestModel("object")))
    engineReplaceModel(engineLoadDFF("models/PoliceCap1.dff"), (engineRequestModel("object")))
    engineSetModelLODDistance(engineRequestModel("object"), 300)
  end
  if engineRequestModel("object") then
    mapped_models["20001"] = engineRequestModel("object")
    engineImportTXD(engineLoadTXD("models/fish.txd"), (engineRequestModel("object")))
    engineReplaceCOL(engineLoadCOL("models/fish.col"), (engineRequestModel("object")))
    engineReplaceModel(engineLoadDFF("models/fish.dff"), (engineRequestModel("object")))
  end
  addCustomModel("20002", engineLoadTXD("models/MatTextures.txd"), engineLoadDFF("models/RedNeonTube1.dff"), engineLoadCOL("models/RedNeonTube1.col"))
  addCustomModel("20003", engineLoadTXD("models/MatTextures.txd"), engineLoadDFF("models/BlueNeonTube1.dff"), engineLoadCOL("models/BlueNeonTube1.col"))
  addCustomModel("20004", engineLoadTXD("models/MatTextures.txd"), engineLoadDFF("models/GreenNeonTube1.dff"), engineLoadCOL("models/GreenNeonTube1.col"))
  addCustomModel("20005", engineLoadTXD("models/MatTextures.txd"), engineLoadDFF("models/YellowNeonTube1.dff"), engineLoadCOL("models/YellowNeonTube1.col"))
  addCustomModel("20006", engineLoadTXD("models/MatTextures.txd"), engineLoadDFF("models/PinkNeonTube1.dff"), engineLoadCOL("models/PinkNeonTube1.col"))
  addCustomModel("20007", engineLoadTXD("models/MatTextures.txd"), engineLoadDFF("models/WhiteNeonTube1.dff"), engineLoadCOL("models/WhiteNeonTube1.col"))
  addCustomModel("20008", engineLoadTXD("models/MatClothes.txd"), engineLoadDFF("models/Bandana9.dff"), engineLoadCOL("models/Bandana9.col"))
  addCustomModel("20009", engineLoadTXD("models/SantaHat.txd"), engineLoadDFF("models/SantaHat.dff"), masks_col)
  addCustomModel("20010", engineLoadTXD("models/FireWood1.txd"), engineLoadDFF("models/FireWood1.dff"), masks_col)
  addCustomModel("20011", engineLoadTXD("models/XmasTree1.txd"), engineLoadDFF("models/XmasTree1.dff"), engineLoadCOL("models/XmasTree1.col"))
  addCustomModel("20012", engineLoadTXD("models/HoodyHats.txd"), engineLoadDFF("models/HoodyHat1.dff"), false)
  addCustomModel("20013", engineLoadTXD("models/HoodyHats.txd"), engineLoadDFF("models/HoodyHat2.dff"), false)
  addCustomModel("20014", engineLoadTXD("models/HoodyHats.txd"), engineLoadDFF("models/HoodyHat3.dff"), false)
  addCustomModel("20015", engineLoadTXD("models/MatLights.txd"), engineLoadDFF("models/LCSmallLight1.dff"), false)
  addCustomModel("20016", engineLoadTXD("models/Flashlight1.txd"), engineLoadDFF("models/Flashlight1.dff"), false)
  addCustomModel("20051", engineLoadTXD("models/masks/mask_devil.txd"), engineLoadDFF("models/masks/mask_devil.dff"), false)
  addCustomModel("20052", engineLoadTXD("models/masks/mask_guyfawkes.txd"), engineLoadDFF("models/masks/mask_guyfawkes.dff"), false)
  addCustomModel("20053", engineLoadTXD("models/masks/mask_darthvader.txd"), engineLoadDFF("models/masks/mask_darthvader.dff"), false)
  addCustomModel("20054", engineLoadTXD("models/masks/bordobereli.txd"), engineLoadDFF("models/masks/bordobereli.dff"), false)
  addCustomModel("20055", engineLoadTXD("models/masks/mask_dog.txd"), engineLoadDFF("models/masks/mask_dog.dff"), false)
  addCustomModel("20056", engineLoadTXD("models/masks/mask_bag.txd"), engineLoadDFF("models/masks/mask_bag.dff"), false)
  addCustomModel("20057", engineLoadTXD("models/masks/admin.txd"), engineLoadDFF("models/masks/admin.dff"), false)
  addCustomModel("20100", engineLoadTXD("models/all_walls.txd"), engineLoadDFF("models/walls/wall042.dff"), engineLoadCOL("models/walls/wall_col_2.col"))
  addCustomModel("20101", engineLoadTXD("models/all_walls.txd"), engineLoadDFF("models/walls/wall078.dff"), engineLoadCOL("models/walls/wall_col_4.col"))
  addCustomModel("20102", engineLoadTXD("models/all_walls.txd"), engineLoadDFF("models/walls/wall097.dff"), engineLoadCOL("models/walls/wall_col_5.col"))
  for forvar47, forvar48 in ipairs(getElementsByType("object", root, true)) do
    if var0(forvar48, "customModel") and mapped_models[var1((var0(forvar48, "customModel")))] then
      setElementModel(forvar48, mapped_models[var1((var0(forvar48, "customModel")))])
    end
  end
end)
function addCustomModel(arg0, arg1, arg2, arg3, arg4, arg5)
  if mapped_models[arg0] or engineRequestModel("object", arg4 or 1940) then
    mapped_models[arg0] = mapped_models[arg0] or engineRequestModel("object", arg4 or 1940)
    if arg1 then
      engineImportTXD(arg1, mapped_models[arg0] or engineRequestModel("object", arg4 or 1940))
    end
    if arg3 then
      engineReplaceCOL(arg3, mapped_models[arg0] or engineRequestModel("object", arg4 or 1940))
    end
    if arg2 then
      engineReplaceModel(arg2, mapped_models[arg0] or engineRequestModel("object", arg4 or 1940))
    end
    engineSetModelLODDistance(mapped_models[arg0] or engineRequestModel("object", arg4 or 1940), arg5 or 300)
    return mapped_models[arg0] or engineRequestModel("object", arg4 or 1940)
  end
end
_createObject = createObject
function createObject(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7)
  if mapped_models[var0(arg0)] then
  end
  if mapped_models[var0(arg0)] then
    setElementModel(_createObject(1940, arg1, arg2, arg3, arg4, arg5, arg6, arg7), mapped_models[var0(arg0)])
  end
  return (_createObject(1940, arg1, arg2, arg3, arg4, arg5, arg6, arg7))
end
addEventHandler("onClientElementStreamIn", root, function()
  if var0(source) == "object" and var1(source, "customModel") and mapped_models[var2((var1(source, "customModel")))] and var3(source) ~= mapped_models[var2((var1(source, "customModel")))] then
    setElementModel(source, mapped_models[var2((var1(source, "customModel")))])
  end
end, true, "low")
addEventHandler("onClientElementDataChange", root, function(arg0, arg1, arg2)
  if arg2 and arg0 == "customModel" and mapped_models[var0(arg2)] and var1(source) and var2(source) == "object" then
    setElementModel(source, mapped_models[var0(arg2)])
  end
end, true, "low")
loadedElement = {}
function loadCustomModel(arg0, arg1)
  if loadedElement[arg0] then
    return
  end
  setElementModel(source, arg1)
  loadedElement[arg0] = true
end
addEventHandler("onClientResourceStop", resourceRoot, function()
  for forvar3, forvar4 in pairs(mapped_models) do
    engineFreeModel(forvar4)
  end
end)
