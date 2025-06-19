-- prototypes/belts/recipes.lua

-- Function to create a transport belt recipe
function create_transport_belt_recipe(name, ingredients, energy_required)
    return {
        type = "recipe",
        name = name,
        enabled = false,
        energy_required = energy_required,
        ingredients = ingredients,
        results = {
            {type = "item", name = name, amount = 1}
        },
        category = "crafting-with-fluid"
    }
end

-- Ingredients for Hyper Transport Belt
local hyper_transport_belt_ingredients = {
    {type = "item", name = "express-transport-belt", amount = 1},
    {type = "item", name = "electric-engine-unit", amount = 2},
    {type = "item", name = "steel-plate", amount = 6},
    {type = "fluid", name = "lubricant", amount = 20}
}

-- Ingredients for Turbo Transport Belt
local turbo_transport_belt_ingredients = {
    {type = "item", name = "hyper-transport-belt", amount = 1},
    {type = "item", name = "advanced-circuit", amount = 3},
    {type = "item", name = "steel-plate", amount = 8},
    {type = "fluid", name = "lubricant", amount = 30}
}

-- Ingredients for Quantum Transport Belt
local quantum_transport_belt_ingredients = {
    {type = "item", name = "ultimate-transport-belt", amount = 1},
    {type = "item", name = "processing-unit", amount = 3},
    {type = "item", name = "low-density-structure", amount = 2},
    {type = "fluid", name = "lubricant", amount = 40}
}

local transport_belt_recipes = {
    create_transport_belt_recipe("hyper-transport-belt", hyper_transport_belt_ingredients, 5),
    create_transport_belt_recipe("ultimate-transport-belt", turbo_transport_belt_ingredients, 4),
    create_transport_belt_recipe("quantum-transport-belt", quantum_transport_belt_ingredients, 3)
}

data:extend(transport_belt_recipes)