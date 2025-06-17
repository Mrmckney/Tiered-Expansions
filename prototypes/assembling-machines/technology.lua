-- prototypes/assembling-machines/technology.lua

function create_assembling_machine_technology(params)
    return {
        type = "technology",
        name = params.name,
        icon = params.icon,
        icon_size = params.icon_size,
        icon_mipmaps = params.icon_mipmaps,
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

local assembling_machine_mk4_technology = create_assembling_machine_technology{
    name = "assembling-machine-mk4",
    prerequisites = {
        "automation-3",
        "advanced-circuit",
        "hyperlogic-unit",
        "speed-module-2"
    },
    count = 500,
    ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
    },
    time = 30,
    order = "c-c-a",
    icon = "__TieredExpansions__/graphics/technology/assembling-machines/automation-4.png",
    icon_size = 256,
    icon_mipmaps = 1
}

local assembling_machine_mk5_technology = create_assembling_machine_technology{
    name = "assembling-machine-mk5",
    prerequisites = {
        "assembling-machine-mk4",
        "singularity-processor",
        "speed-module-3"
    },
    count = 700,
    ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"utility-science-pack", 1},
    },
    time = 60,
    order = "c-c-b",
    icon = "__TieredExpansions__/graphics/technology/assembling-machines/automation-5.png",
    icon_size = 256,
    icon_mipmaps = 1
}

local assembling_machine_mk6_technology = create_assembling_machine_technology{
    name = "assembling-machine-mk6",
    prerequisites = {
        "assembling-machine-mk5",
        "quantum-processor",
        "speed-module-3"
    },
    count = 1000,
    ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"utility-science-pack", 1},
        {"space-science-pack", 1}
    },
    time = 90,
    order = "c-c-c",
    icon = "__TieredExpansions__/graphics/technology/assembling-machines/automation-6.png",
    icon_size = 256,
    icon_mipmaps = 1
}

data:extend({
    assembling_machine_mk4_technology,
    assembling_machine_mk5_technology,
    assembling_machine_mk6_technology
})