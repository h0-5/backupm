
function applyBreakableState()
	for k, obj in pairs(getElementsByType("object", resourceRoot)) do
		local breakable = getElementData(obj, "breakable")
		if breakable then
			setObjectBreakable(obj, breakable == "true")
		end
		setElementDimension(obj, 65535)
	end
end
addEventHandler("onClientResourceStart", resourceRoot, applyBreakableState)

addEvent("onClientPlayerInteriorChange", true)
addEventHandler("onClientPlayerInteriorChange", localPlayer,
function (int, dim)
	if int == 21 then
		for k, obj in pairs(getElementsByType("object", resourceRoot)) do
			setElementDimension(obj, dim)
		end
	end
end
)
