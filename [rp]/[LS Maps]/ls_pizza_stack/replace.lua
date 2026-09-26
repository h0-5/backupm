txd = engineLoadTXD ("models/twsp.txd", 5418)
engineImportTXD(txd, 5418)
dff = engineLoadDFF ("models/twsp.dff", 5418)
engineReplaceModel(dff, 5418, true)
col = engineLoadCOL("models/twsp.col")
engineReplaceCOL(col, 5418)

removeWorldModel(1522, 1.4567, 2105.92, -1807.25,12.5156, 0)

addEventHandler("onClientResourceStop", resourceRoot,
function ()
    restoreWorldModel(1522, 1.4567, 2105.92, -1807.25,12.5156, 0)
end
)
