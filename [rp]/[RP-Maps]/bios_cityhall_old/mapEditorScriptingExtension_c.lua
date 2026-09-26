
function applyBreakableState()
	for k, obj in pairs(getElementsByType("object", resourceRoot)) do
		local breakable = getElementData(obj, "breakable")
		if breakable then
			setObjectBreakable(obj, breakable == "true")
		end
		setElementDimension(obj, 65535)
		setElementData(obj, "custom.interior", 25, false)
	end
end
addEventHandler("onClientResourceStart", resourceRoot, applyBreakableState)

addEvent("onClientPlayerInteriorChange", true)
addEventHandler("onClientPlayerInteriorChange", localPlayer,
function (int, dim)
	if int == 25 then
		--for k, obj in pairs(getElementsByType("object", resourceRoot)) do
			setElementDimension(resourceRoot, dim)
		--end
	end
end
)
