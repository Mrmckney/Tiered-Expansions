-- prototypes/mining-drills/recipes.lua

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
    energy_required = energy_required,
  }
end

-- All ingredients mapped by tier
local drill_ingredients = {
  [2] = {
    {type = "item", name = "steel-plate", amount = 4},
    {type = "item", name = "advanced-circuit", amount = 7},
    {type = "item", name = "iron-gear-wheel", amount = 10},
    {type = "item", name = "electric-mining-drill", amount = 1},
  },
  [3] = {
    {type = "item", name = "steel-plate", amount = 8},
    {type = "item", name = "processing-unit", amount = 5},
    {type = "item", name = "iron-gear-wheel", amount = 15},
    {type = "item", name = "electric-mining-drill-mk2", amount = 1},
  },
  [4] = {
    {type = "item", name = "steel-plate", amount = 16},
    {type = "item", name = "hyperlogic-unit", amount = 2},
    {type = "item", name = "electric-engine-unit", amount = 2},
    {type = "item", name = "electric-mining-drill-mk3", amount = 1},
  },
  [5] = {
    {type = "item", name = "steel-plate", amount = 20},
    {type = "item", name = "singularity-processor", amount = 1},
    {type = "item", name = "electric-engine-unit", amount = 4},
    {type = "item", name = "low-density-structure", amount = 2},
    {type = "item", name = "electric-mining-drill-mk4", amount = 1},
  }
}

-- Generate all recipes
local drill_recipes = {}
for mk = 2, 5 do
  table.insert(drill_recipes, create_mining_drill_recipe(
    mk,
    drill_ingredients[mk],
    10 + (mk - 2) * 5
  ))
end

data:extend(drill_recipes)
