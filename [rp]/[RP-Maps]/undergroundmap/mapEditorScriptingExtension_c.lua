
function applyBreakableState()
	for k, obj in pairs(getElementsByType("object", resourceRoot)) do
		local breakable = getElementData(obj, "breakable")
		if breakable then
			setObjectBreakable(obj, breakable == "true")
		end
		local x, y, z = getElementPosition(obj)
		setElementPosition(obj, x, y, z)
	end
	setElementDimension(resourceRoot, 65535)
	setElementData(resourceRoot, "custom.interior", 26, false)
end
addEventHandler("onClientResourceStart", resourceRoot, applyBreakableState)

addEvent("onClientPlayerInteriorChange", true)
addEventHandler("onClientPlayerInteriorChange", localPlayer,
function (int, dim)
	if int == 26 then
		setElementDimension(resourceRoot, dim)
	end
end
)
