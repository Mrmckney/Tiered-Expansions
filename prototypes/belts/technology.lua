-- prototypes/belts/technology.lua

-- Function to create a technology
function create_transport_belt_technology(name, prerequisites, unit_count, unit_time)
    return {
        type = "technology",
        name = name,
        icon = "__TieredExpansions__/graphics/icons/belts/" .. name .. "-recipe.png",
        icon_size = 64,
        icon_mipmaps = 1,
        effects = {
            {
                type = "unlock-recipe",
                recipe = name
            }
        },
        prerequisites = prerequisites,
        unit = {
            count = unit_count,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1}
            },
            time = unit_time
        },
        order = "c-b-" .. string.sub(name, 1, 1)
    }
end

local transport_belt_technologies = {
    create_transport_belt_technology("hyper-transport-belt", {"logistics"}, 100, 30),
    create_transport_belt_technology("turbo-transport-belt", {"logistics"}, 200, 40),
    create_transport_belt_technology("quantum-transport-belt", {"logistics"}, 300, 50)
}

data:extend(transport_belt_technologies)