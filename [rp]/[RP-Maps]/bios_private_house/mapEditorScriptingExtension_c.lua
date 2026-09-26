
function applyBreakableState()
	for k, obj in pairs(getElementsByType("object", resourceRoot)) do
		local breakable = getElementData(obj, "breakable")
		if breakable then
			setObjectBreakable(obj, breakable == "true")
		end
	end
	setElementDimension(resourceRoot, 65535)
	setElementInterior(resourceRoot, 98)
	setElementData(resourceRoot, "custom.interior", 98, false)
end
addEventHandler("onClientResourceStart", resourceRoot, applyBreakableState)

addEvent("onClientPlayerInteriorChange", true)
addEventHandler("onClientPlayerInteriorChange", localPlayer,
function (int, dim)
	if int == 98 then
		setElementDimension(resourceRoot, dim)
	end
end
)
