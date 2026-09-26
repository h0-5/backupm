
function applyBreakableState()
	local objectsTable = getElementsByType("object", resourceRoot)

	for objectID = 1, #objectsTable do
		local objectElement = objectsTable[objectID]
		local objectBreakable = getElementData(objectElement, "breakable")

		if objectBreakable then
			setObjectBreakable(objectElement, objectBreakable == "true")
		end
	end
	setElementDimension(resourceRoot, 65535)
	setElementData(resourceRoot, "custom.interior", 123, false)
end
addEventHandler("onClientResourceStart", resourceRoot, applyBreakableState)

addEvent("onClientPlayerInteriorChange", true)
addEventHandler("onClientPlayerInteriorChange", localPlayer,
function (int, dim)
	if int == 123 then
		setElementDimension(resourceRoot, dim)
	end
end
)
