-- prototypes/assembling-machines/technology.lua

function create_assembling_machine_technology(name, prerequisites, unit_count, unit_time)
    return {
        type = "technology",
        name = name,
        icon_size = 256,
        icon = "__base__/graphics/technology/automation-3.png",
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
                {"chemical-science-pack", 1}
            },
            time = unit_time
        },
        order = "c-c-a"
    }
end

local assembling_machine_mk4_technology = create_assembling_machine_technology(
    "assembling-machine-mk4",
    {"automation-3", "advanced-circuit"},
    200,
    30
)

-- local assembling_machine_mk5_technology = create_assembling_machine_technology(
--     "assembling-machine-mk5",
--     {"assembling-machine-mk4", "processing-unit"},
--     300,
--     40
-- )

data:extend({
    assembling_machine_mk4_technology,
    -- assembling_machine_mk5_technology
})