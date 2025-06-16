-- prototypes/vehicles/items.lua

-- Function to create a vehicle item
function create_vehicle_item(mk, name, order)
    return {
        type = "item",
        name = name,
        icon = "__TieredExpansions__/graphics/icons/vehicles/" .. name .. ".png",
        icon_size = 64,
        icon_mipmaps = 4,
        subgroup = "transport",
        order = order,
        place_result = name,
        stack_size = 1
    }
end

local vehicle_items = {
    create_vehicle_item(2, "car-2", "b[car]-a[car-2]"),
    create_vehicle_item(3, "car-3", "b[car]-b[car-3]"),
    create_vehicle_item(4, "car-4", "b[car]-c[car-4]"),
}

data:extend(vehicle_items)