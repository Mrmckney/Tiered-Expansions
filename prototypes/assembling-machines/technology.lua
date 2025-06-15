-- prototypes/assembling-machines/technology.lua

function create_assembling_machine_technology(name, prerequisites, unit_count, unit_time, mk)
    return {
        type = "technology",
        name = name,
        icon_size = 256,
        icon = "__TieredExpansions__/graphics/technology/assembling-machines/automation-" ..mk.. ".png",
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
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"chemical-science-pack", 1},
                {"production-science-pack", 1},
                {"utility-science-pack", 1}
            },
            time = unit_time
        },
        order = "c-c-a"
    }
end

local assembling_machine_mk4_technology = create_assembling_machine_technology(
    "assembling-machine-mk4",
    {"automation-3", "advanced-circuit", "hyperlogic-unit", "speed-module-2"},
    300,
    30,
    4
)

local assembling_machine_mk5_technology = create_assembling_machine_technology(
    "assembling-machine-mk5",
    {"assembling-machine-mk4", "singularity-processor", "speed-module-3"},
    1000,
    60,
    5
)

data:extend({
    assembling_machine_mk4_technology,
    assembling_machine_mk5_technology
})