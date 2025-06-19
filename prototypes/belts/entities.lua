-- prototypes/belts/entities.lua

local belt_base = data.raw["transport-belt"]["transport-belt"]
if not belt_base then
    error("Base transport-belt not found!")
end

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
function create_transport_belt_entity(name, speed, energy_usage, max_health, icon_suffix)
    local belt = table.deepcopy(belt_base)
    belt.name = name
    belt.minable = {
        mining_time = 0.1,
        result = name
    }
    belt.max_health = max_health
    belt.speed = speed
    belt.energy_per_movement = energy_usage

    belt.belt_animation_set = make_animation_set(name)

    return belt
end

local transport_belts = {
    create_transport_belt_entity("hyper-transport-belt", 0.125, "50kW", 500),
    create_transport_belt_entity("turbo-transport-belt", 0.15625, "40kW", 400),
    create_transport_belt_entity("quantum-transport-belt", 0.1875, "30kW", 300)
}
data:extend(transport_belts)