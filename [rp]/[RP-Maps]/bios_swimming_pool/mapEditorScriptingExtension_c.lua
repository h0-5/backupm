
function applyBreakableState()
	for k, obj in pairs(getElementsByType("object", resourceRoot)) do
		local breakable = getElementData(obj, "breakable")
		if breakable then
			setObjectBreakable(obj, breakable == "true")
		end
	end
	local z = 3.3
	local water = createWater(1873.358, -2896.605, z, 1904.959, -2896.737, z, 1873.339, -2876.883, z, 1904.959, -2876.294, z)
	setElementInterior(water, 0)
	setElementDimension(resourceRoot, 65535)
	setElementData(resourceRoot, "custom.interior", 0, false)
end
addEventHandler("onClientResourceStart", resourceRoot, applyBreakableState)

addEvent("onClientPlayerInteriorChange", true)
addEventHandler("onClientPlayerInteriorChange", localPlayer,
function (int, dim)
	if int == 0 and dim ~= 0 then
		setElementDimension(resourceRoot, dim)
	end
end
)
-- local x, y, z = 1799.255, -1898.958, 16.5012
	-- local water = createWater(x-10, y-10, z, x+10, y-10, z, x-10, y+10, z, x+10, y+10, z)