-- prototypes/assembling-machines/recipes.lua

function create_assembling_machine_recipe(name, ingredients, energy_required, icon)
    return {
        type = "recipe",
        name = name,
        enabled = false,
        ingredients = ingredients,
        results = {
            {type = "item", name = name, amount = 1}
        },
        energy_required = energy_required,
        category = "crafting",
        icon = icon .. "-recipe.png",
        icon_size = 64,
        icon_mipmaps = 1,
    }
end

-- Icons
local assembling_machine_mk4_icon = "__TieredExpansions__/graphics/entity/assembling-machines/assembling-machine-4"
local assembling_machine_mk5_icon = "__TieredExpansions__/graphics/entity/assembling-machines/assembling-machine-5"

-- Ingredients for Assembling Machine Mk4
local mk4_ingredients = {
    {type = "item", name = "assembling-machine-3", amount = 1},
    {type = "item", name = "hyperlogic-unit", amount = 2},
    {type = "item", name = "steel-plate", amount = 20},
    {type = "item", name = "electric-engine-unit", amount = 2}
}

-- Ingredients for Assembling Machine Mk5
local mk5_ingredients = {
    {type = "item", name = "assembling-machine-mk4", amount = 1},
    {type = "item", name = "singularity-processor", amount = 1},
    {type = "item", name = "steel-plate", amount = 30},
    {type = "item", name = "electric-engine-unit", amount = 4},
    {type = "item", name = "low-density-structure", amount = 2}
}

local assembling_machine_recipes = {
    create_assembling_machine_recipe("assembling-machine-mk4", mk4_ingredients, 15, assembling_machine_mk4_icon), -- Assembling Machine Mk4 recipe
    create_assembling_machine_recipe("assembling-machine-mk5", mk5_ingredients, 20, assembling_machine_mk5_icon)  -- Assembling Machine Mk5 recipe
}

data:extend(assembling_machine_recipes)