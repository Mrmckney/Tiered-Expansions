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
    prerequisites = {"electronics"},
    count = 200,
    ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1}
    },
    time = 30,
    order = "c-b-h",
    icon = "__TieredExpansions__/graphics/icons/hyperlogic-unit.png",
    icon_size = 256,
}

-- Singularity Processor Technology
local singularity_processor_technology = create_electronics_technology{
    name = "singularity-processor",
    prerequisites = {"hyperlogic-unit"},
    count = 300,
    ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1}
    },
    time = 45,
    order = "c-b-s",
    icon = "__base__/graphics/technology/processing-unit.png",
}

data:extend({
    hyperlogic_unit_technology,
    singularity_processor_technology
})