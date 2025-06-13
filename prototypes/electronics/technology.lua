-- prototypes/electronics/technology.lua

-- Function to create a technology for electronics
function create_electronics_technology(params)
    return {
        type = "technology",
        name = params.name,
        icon = params.icon,
        icon_size = params.icon_size,
        effects = {
            {
                type = "unlock-recipe",
                recipe = params.name
            }
        },
        prerequisites = params.prerequisites,
        unit = {
            count = params.count,
            ingredients = params.ingredients,
            time = params.time
        },
        order = params.order
    }
end

-- Hyperlogic Unit Technology
local hyperlogic_unit_technology = create_electronics_technology{
    name = "hyperlogic-unit",
    prerequisites = {
        "processing-unit",
        "production-science-pack",
        "low-density-structure",
        "battery"
    },
    count = 250,
    ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1}
    },
    time = 30,
    order = "c-b-h",
    icon = "__TieredExpansions__/graphics/icons/electronics/hyperlogic-unit-technology.png",
    icon_size = 256,
    icon_mipmaps = 1
}

-- Singularity Processor Technology
local singularity_processor_technology = create_electronics_technology{
    name = "singularity-processor",
    prerequisites = {
        "hyperlogic-unit",
        "utility-science-pack",
        "low-density-structure",
        "nuclear-power"
    },
    count = 350,
    ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"utility-science-pack", 1}
    },
    time = 45,
    order = "c-b-s",
    icon = "__TieredExpansions__/graphics/icons/electronics/singularity-processor-technology.png",
    icon_size = 256,
    icon_mipmaps = 1
}

data:extend({
    hyperlogic_unit_technology,
    singularity_processor_technology
})