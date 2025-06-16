-- prototypes/mining-drills/technology.lua

-- Function to create a mining drill's technology with tier-specific properties
function create_mining_drill_technology(params)
    local mk = params.mk
    local prev_mk = mk == 2 and "electric-mining-drill" or "electric-mining-drill-mk" .. (mk - 1)

    local tech = {
        type = "technology",
        name = "electric-mining-drill-mk" .. mk,
        icon = "__TieredExpansions__/graphics/technology/mining-drills/electric-mining-drill-" .. mk .. ".png",
        icon_size = 256,
        icon_mipmaps = 4,
        effects = {
            {
                type = "unlock-recipe",
                recipe = "electric-mining-drill-mk" .. mk
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

local drill_technologies = {
    -- Mk2 Mining Drill Technology
    create_mining_drill_technology{
        mk = 2,
        count = 100,
        ingredients = {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1}
        },
        extra_prerequisites = {"advanced-circuit"}
    },
    -- Mk3 Mining Drill Technology
    create_mining_drill_technology{
        mk = 3,
        count = 200,
        ingredients = {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1},
            {"chemical-science-pack", 1}
        },
        extra_prerequisites = {"processing-unit"}
    },
    -- Mk4 Mining Drill Technology
    create_mining_drill_technology{
        mk = 4,
        count = 300,
        ingredients = {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1},
            {"chemical-science-pack", 1},
            {"production-science-pack", 1}
        },
        extra_prerequisites = {
            "low-density-structure",
            "production-science-pack",
            "hyperlogic-unit",
            "electric-engine"
        }
    },
    -- Mk5 Mining Drill Technology
    create_mining_drill_technology{
        mk = 5,
        count = 400,
        ingredients = {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1},
            {"chemical-science-pack", 1},
            {"production-science-pack", 1},
            {"utility-science-pack", 1}
        },
        extra_prerequisites = {
            "singularity-processor",
            "nuclear-power",
            "low-density-structure"
        }
    }
}

data:extend(drill_technologies)
