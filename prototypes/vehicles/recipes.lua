-- prototypes/vehicles/recipes.lua

-- Function to create a vehicle recipe
function create_vehicle_recipe(mk, ingredients, name)
    return {
        type = "recipe",
        name = name,
        enabled = false,
        energy_required = 10 + (mk - 1) * 5,
        ingredients = ingredients,
        results = {
            {type = "item", name = name, amount = 1}
        }
    }
end

local vehicle_ingredients = {
    [2] = {
        {type = "item", name = "car", amount = 1},
        {type = "item", name = "steel-plate", amount = 10},
        {type = "item", name = "advanced-circuit", amount = 5},
        {type = "item", name = "iron-gear-wheel", amount = 15}
    },
    [3] = {
        {type = "item", name = "car-2", amount = 1},
        {type = "item", name = "steel-plate", amount = 20},
        {type = "item", name = "processing-unit", amount = 10},
        {type = "item", name = "iron-gear-wheel", amount = 30}
    },
    [4] = {
        {type = "item", name = "car-3", amount = 1},
        {type = "item", name = "steel-plate", amount = 40},
        {type = "item", name = "hyperlogic-unit", amount = 5},
        {type = "item", name = "electric-engine-unit", amount = 5}
    }
}

local vehicle_recipes = {}
for mk = 2, 4 do
    table.insert(vehicle_recipes, create_vehicle_recipe(
        mk,
        vehicle_ingredients[mk],
        "car-" .. mk
    ))
end

data:extend(vehicle_recipes)