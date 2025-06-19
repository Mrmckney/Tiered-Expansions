-- prototypes/belts/technology.lua

-- Function to create a technology for transport belts
function create_transport_belt_technology(name, prerequisites, unit_count, unit_time, science_packs)
    return {
        type = "technology",
        name = name,
        icon = "__TieredExpansions__/graphics/icons/belts/" .. name .. "-recipe.png",
        icon_size = 64,
        icon_mipmaps = 1,
        effects = {
            {
                type = "unlock-recipe",
                recipe = name
            }
        },
        prerequisites = prerequisites,
        unit = {
            count = unit_count,
            ingredients = science_packs,
            time = unit_time
        },
        order = "c-b-" .. string.sub(name, 1, 1)
    }
end

-- Tech progression (ending in Quantum)
local transport_belt_technologies = {
    create_transport_belt_technology(
        "hyper-transport-belt",
        {"logistics-3"},
        200,
        30,
        {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1},
            {"chemical-science-pack", 1}
        }
    ),
    create_transport_belt_technology(
        "ultimate-transport-belt",
        {"hyper-transport-belt"},
        400,
        45,
        {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1},
            {"chemical-science-pack", 1},
            {"production-science-pack", 1},
            {"utility-science-pack", 1}
        }
    ),
    create_transport_belt_technology(
        "quantum-transport-belt",
        {"ultimate-transport-belt", "space-science-pack"},
        600,
        60,
        {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1},
            {"chemical-science-pack", 1},
            {"production-science-pack", 1},
            {"utility-science-pack", 1},
            {"space-science-pack", 1}
        }
    )
}

data:extend(transport_belt_technologies)