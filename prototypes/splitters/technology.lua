-- prototypes/splitters/technology.lua

-- Function to create a technology for splitters (matching transport belt layout)
function create_splitter_technology(name, prerequisites, unit_count, unit_time, science_packs, icon)
    return {
        type = "technology",
        name = name,
        icon = "__TieredExpansions__/graphics/icons/splitters/" .. icon .. "-recipe.png",
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
        order = "c-c-" .. string.sub(name, 1, 1)
    }
end

-- Tech progression (ending in Quantum)
local splitter_technologies = {
    create_splitter_technology(
        "hyper-splitter",
        {"logistics-2"},
        100,
        30,
        {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1}
        },
        "hyper-splitter"
    ),
    create_splitter_technology(
        "ultimate-splitter",
        {"hyper-splitter"},
        200,
        45,
        {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1},
            {"chemical-science-pack", 1},
            {"production-science-pack", 1},
            {"utility-science-pack", 1}
        },
        "ultimate-splitter"
    ),
    create_splitter_technology(
        "quantum-splitter",
        {"ultimate-splitter", "space-science-pack"},
        300,
        60,
        {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1},
            {"chemical-science-pack", 1},
            {"production-science-pack", 1},
            {"utility-science-pack", 1},
            {"space-science-pack", 1}
        },
        "quantum-splitter"
    )
}

data:extend(splitter_technologies)