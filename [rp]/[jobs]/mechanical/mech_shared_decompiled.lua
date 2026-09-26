-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

handlings = {
  {
    name = "Mas Weight (KG)",
    property = "mass",
    value_type = "float",
    min_value = 1,
    max_value = 100000
  },
  {
    name = "Max Speed (KM/H)",
    property = "maxVelocity",
    value_type = "float",
    min_value = 0.1,
    max_value = 200000
  },
  {
    name = "Acceleration",
    property = "engineAcceleration",
    value_type = "float",
    min_value = 0,
    max_value = 100000
  },
  {
    name = "Drive Type",
    property = "driveType",
    value_type = "string",
    values = {
      "rwd",
      "fwd",
      "awd"
    }
  },
  {
    name = "Braking Power",
    property = "brakeDeceleration",
    value_type = "float",
    min_value = 0.1,
    max_value = 100000
  }
}
handlings2 = {
  {
    "Engine Intertia",
    "engineIntertia"
  },
  {
    "Supension Height",
    "suspensionLowerLimit"
  },
  {
    "Suspension Bias",
    "suspensionFrontRearBias"
  },
  {
    "Suspension Force",
    "suspensionForceLevel"
  },
  {
    "Suspension Damping",
    "suspensionDamping"
  },
  {
    "Steering Lock",
    "steeringLock"
  },
  {
    "Center of Mass X",
    "centerOfMassX"
  },
  {
    "Center of Mass Y",
    "centerOfMassY"
  },
  {
    "Center of Mass Z",
    "centerOfMassZ"
  },
  {
    "Drag Coefficiency",
    "dragCoeff"
  },
  {
    "Braking Bias",
    "brakeBias"
  },
  {
    "Traction Multiplier",
    "tractionMultiplier"
  },
  {
    "Traction Bias",
    "tractionBias"
  },
  {
    "Engine Type (petrol, diesel, electric)",
    "engineType"
  }
}
function calculateRepairPrice(arg0, arg1)
  if arg1 == "Body" then
    return (math.floor(getVehicleDoorState(arg0, 0) * 100 + getVehicleDoorState(arg0, 1) * 100 + getVehicleDoorState(arg0, 2) * 100 + getVehicleDoorState(arg0, 3) * 100 + getVehicleDoorState(arg0, 4) * 100 + getVehicleDoorState(arg0, 5) * 100 + getVehiclePanelState(arg0, 0) * 100 + getVehiclePanelState(arg0, 1) * 100 + getVehiclePanelState(arg0, 2) * 100 + getVehiclePanelState(arg0, 3) * 100 + getVehiclePanelState(arg0, 4) * 100 + getVehiclePanelState(arg0, 5) * 100 + getVehiclePanelState(arg0, 6) * 100))
  elseif arg1 == "Engine" then
    return (math.floor((1 - getElementHealth(arg0) / 1000) * 2000))
  end
end
