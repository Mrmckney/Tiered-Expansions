-- prototypes/technology.lua

-- Function to create a mining drill's technology
function create_mining_drill_technology(mk)
    local prev_mk = mk == 2 and "electric-mining-drill" or ("electric-mining-drill-mk" .. (mk - 1))
    local tech = {
        type = "technology",
        name = "electric-mining-drill-mk" .. mk,
        icon = "__base__/graphics/technology/electric-mining-drill.png",
        icon_size = 256,
        effects = {
            {
                type = "unlock-recipe",
                recipe = "electric-mining-drill-mk" .. mk
            }
        },
        prerequisites = {prev_mk},
        unit = {
            count = 100 * mk,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"chemical-science-pack", 1}
            },
            time = 30 + 10 * (mk - 1)
        },
    }
    return tech
end

local technologies = {}
for mk = 2, 5 do
    table.insert(technologies, create_mining_drill_technology(mk))
end

data:extend(technologies)
