-- prototypes/vehicles/entities.lua

local base_vehicle = data.raw["car"]["car"]
if not base_vehicle then
    error("Base vehicle 'car' not found!")
end

-- Function to create a vehicle entity
function create_vehicle_entity(mk, speed, health, energy_usage, name)
    local vehicle = table.deepcopy(base_vehicle)

    vehicle.name = name
    vehicle.icon = "__TieredExpansions__/graphics/icons/vehicles/" .. name .. ".png"
    vehicle.icon_size = 64
    vehicle.icon_mipmaps = 4
    vehicle.minable = { mining_time = 0.5, result = name }
    vehicle.max_health = health
    vehicle.energy_per_move = energy_usage
    vehicle.braking_force = 10 + (mk - 1) * 5
    vehicle.friction = 0.002 + (mk - 1) * 0.001

    return vehicle
end

local vehicle_entities = {
    create_vehicle_entity(2, 0.5, 200, 50000, "car-2"),
    create_vehicle_entity(3, 0.75, 300, 70000, "car-3"),
    create_vehicle_entity(4, 1.0, 400, 100000, "car-4")
}

data:extend(vehicle_entities)