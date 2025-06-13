-- prototypes/electronics/recipes.lua

-- Function to create a recipe for electronics
function create_electronics_recipe(name, ingredients, energy_required)
    return {
        type = "recipe",
        name = name,
        enabled = false,
        ingredients = ingredients,
        results = {
            {type = "item", name = name, amount = 1}
        },
        energy_required = energy_required,
        category = "crafting-with-fluid"
    }
end

-- Ingredients for Hyperlogic Unit
local hyperlogic_unit_ingredients = {
    {type = "item", name = "processing-unit", amount = 5},
    {type = "item", name = "low-density-structure", amount = 2},
    {type = "item", name = "plastic-bar", amount = 10},
    {type = "fluid", name = "sulfuric-acid", amount = 10}
}

-- Ingredients for Singularity Processor
local singularity_processor_ingredients = {
    {type = "item", name = "hyperlogic-unit", amount = 1},
    {type = "item", name = "processing-unit", amount = 10},
    {type = "item", name = "low-density-structure", amount = 5},
    {type = "item", name = "heat-pipe", amount = 2},
    {type = "fluid", name = "sulfuric-acid", amount = 20}
}

-- Create recipes for electronics
local electronics_recipes = {
    create_electronics_recipe("hyperlogic-unit", hyperlogic_unit_ingredients, 10), -- Hyperlogic Unit recipe
    create_electronics_recipe("singularity-processor", singularity_processor_ingredients, 20) -- Singularity Processor recipe
}

data:extend(electronics_recipes)