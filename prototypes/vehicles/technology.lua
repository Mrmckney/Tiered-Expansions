-- prototypes/vehicles/technology.lua

-- Function to create a vehicle technology with tier-specific properties
function create_vehicle_technology(params)
    local mk = params.mk
    local prev_mk = mk == 2 and "automobilism" or "car-" .. (mk - 1)

    local tech = {
        type = "technology",
        name = "car-" .. mk,
        icon = "__base__/graphics/technology/automobilism.png",
        icon_size = 256,
        icon_mipmaps = 4,
        effects = {
            {
                type = "unlock-recipe",
                recipe = "car-" .. mk
            }
        },
        prerequisites = {prev_mk},
        unit = {
            count = params.count,
            ingredients = params.ingredients,
            time = (30 + 10 * (mk - 1))
        },
        order = ("c-b-" .. string.char(96 + mk))
    }

    if params.extra_prerequisites then
        for _, prereq in ipairs(params.extra_prerequisites) do
            table.insert(tech.prerequisites, prereq)
        end
    end

    return tech
end

local vehicle_technologies = {
    -- Mk2 Vehicle Technology
    create_vehicle_technology{
        mk = 2,
        count = 100,
        ingredients = {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1}
        },
        extra_prerequisites = {"advanced-circuit"}
    },
    -- Mk3 Vehicle Technology
    create_vehicle_technology{
        mk = 3,
        count = 200,
        ingredients = {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1},
            {"chemical-science-pack", 1}
        },
        extra_prerequisites = {"processing-unit"}
    },
    -- Mk4 Vehicle Technology
    create_vehicle_technology{
        mk = 4,
        count = 300,
        ingredients = {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1},
            {"chemical-science-pack", 1},
            {"production-science-pack", 1}
        },
        extra_prerequisites = {"hyperlogic-unit"}
    }
}

data:extend(vehicle_technologies)