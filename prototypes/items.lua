-- prototypes/items.lua

-- Function to create mining drill's item with tier-specific properties
function make_mining_drill_item(mk, tint)
    return {
        type = "item",
        name = "electric-mining-drill-mk" .. mk, -- Unique name for each tier
        order = "b[items]-b[electric-mining-drill-mk" .. mk .. "]", -- Sorting order in inventory
        place_result = "electric-mining-drill-mk" .. mk, -- Entity placed when item is used
        stack_size = 50, -- Maximum stack size
        subgroup = "extraction-machine", -- Inventory subgroup
        icons = {
            {
                icon = "__base__/graphics/icons/electric-mining-drill.png", -- Base icon
                icon_size = 64,
                icon_mipmaps = 4,
                tint = tint -- Apply tier-specific tint to icon
            }
        }
    }
end

local drill_items = {
    make_mining_drill_item(2, {r = 1, g = 1, b = 0, a = 0.7}), -- mk2 drill, yellow tint
    make_mining_drill_item(3, {r = 1, g = 0.2, b = 0.2, a = 0.7}), -- mk3 drill, red tint
}

data:extend(drill_items)

