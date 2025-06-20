-- prototypes/splitters/recipes.lua

-- Function to create a splitter recipe
function create_splitter_recipe(name, ingredients, result, energy_required)
    return {
        type = "recipe",
        name = name,
        enabled = false,
        energy_required = energy_required or 1,
        ingredients = ingredients,
        results = {
            { type = "item", name = result, amount = 1 }
        }
    }
end

-- Ingredients for each splitter tier
local splitter_ingredients = {
    ["hyper-splitter"] = {
        { type = "item", name = "steel-plate", amount = 10 },
        { type = "item", name = "advanced-circuit", amount = 5 },
        { type = "item", name = "iron-gear-wheel", amount = 15 }
    },
    ["turbo-splitter"] = {
        { type = "item", name = "steel-plate", amount = 15 },
        { type = "item", name = "processing-unit", amount = 10 },
        { type = "item", name = "iron-gear-wheel", amount = 20 }
    },
    ["quantum-splitter"] = {
        { type = "item", name = "steel-plate", amount = 20 },
        { type = "item", name = "singularity-processor", amount = 5 },
        { type = "item", name = "electric-engine-unit", amount = 4 }
    }
}

-- Generate recipes for each splitter
local splitter_recipes = {}
for name, ingredients in pairs(splitter_ingredients) do
    local recipe = create_splitter_recipe(name, ingredients, name, 2)
    table.insert(splitter_recipes, recipe)
end

data:extend(splitter_recipes)