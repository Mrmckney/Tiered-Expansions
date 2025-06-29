-- prototypes/belts/entities.lua
require("util/utilities")

local belt_base = data.raw["transport-belt"]["transport-belt"]
if not belt_base then
    error("Base transport-belt not found!")
end

local belt_speeds = {
    ["hyper-transport-belt"] = has_space_age and 0.15625 or 0.125,
    ["ultimate-transport-belt"] = has_space_age and 0.1875 or 0.15625,
    ["quantum-transport-belt"] = has_space_age and 0.21875 or 0.1875
}

-- function to create graphics set for transport belts
function make_animation_set(icon)
   return {
        animation_set = {
            filename = "__TieredExpansions__/graphics/entity/belts/" .. icon .. ".png",
            priority = "extra-high",
            size = 128,
            scale = 0.5,
            frame_count = 32,
            direction_count = 20
        }
    }
end

-- Function to create a transport belt entity
function create_transport_belt_entity(name, max_health)
    local belt = table.deepcopy(belt_base)
    belt.name = name
    belt.minable = {
        mining_time = 0.1,
        result = name
    }
    belt.max_health = max_health
    belt.speed = belt_speeds[name]

    belt.belt_animation_set = make_animation_set(name)

    return belt
end

local transport_belts = {
    create_transport_belt_entity("hyper-transport-belt", 180),
    create_transport_belt_entity("ultimate-transport-belt", 190),
    create_transport_belt_entity("quantum-transport-belt", 200)
}


data:extend(transport_belts)