-- prototypes/recipes.lua

-- Function to create a mining drill's recipe
function create_mining_drill_recipe(mk, ingredients, energy_required)
    return {
        type = "recipe",
        name = "electric-mining-drill-mk" .. mk,
        enabled = false,
        ingredients = ingredients,
        results = {
            {type = "item", name = "electric-mining-drill-mk" .. mk, amount = 1}
        },
        energy_required = energy_required or 2
    }
end

-- ingredients for MK2
local mk2_ingredients = {
    {type = "item", name = "steel-plate", amount = 20},
    {type = "item", name = "advanced-circuit", amount = 5},
    {type = "item", name = "electric-engine-unit", amount = 2},
    {type = "item", name = "iron-gear-wheel", amount = 10},
}

-- ingredients for MK3
local mk3_ingredients = {
    {type = "item", name = "steel-plate", amount = 40},
    {type = "item", name = "processing-unit", amount = 10},
    {type = "item", name = "electric-engine-unit", amount = 4},
    {type = "item", name = "iron-gear-wheel", amount = 20},
    {type = "item", name = "electric-mining-drill-mk2", amount = 1},
}

local drill_recipes = {
    create_mining_drill_recipe(2, mk2_ingredients, 5), -- MK2 recipe
    create_mining_drill_recipe(3, mk3_ingredients, 10) -- MK3 recipe
}

data:extend(drill_recipes)
