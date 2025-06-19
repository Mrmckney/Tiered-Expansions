-- prototypes/belts/items.lua

-- Function to create a transport belt item
function create_transport_belt_item(name, icon_suffix, order_suffix)
    return {
        type = "item",
        name = name,
        icons = {
            {
                icon = "__TieredExpansions__/graphics/icons/belts/" .. name .. icon_suffix .. ".png",
                icon_size = 64,
                icon_mipmaps = 1
            }
        },
        subgroup = "belt",
        order = "a[transport-belt]-" .. order_suffix .. "[" .. name .. "]",
        stackable = true,
        place_result = name,
        stack_size = 100
    }
end

local transport_belts_items = {
    create_transport_belt_item("hyper-transport-belt", "-recipe", "d"),
    create_transport_belt_item("turbo-transport-belt", "-recipe", "e"),
    create_transport_belt_item("quantum-transport-belt", "-recipe", "f")
}

data:extend(transport_belts_items)