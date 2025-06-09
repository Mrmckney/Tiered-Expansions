-- prototypes/items.lua

-- Function to create mining drill's item with tier-specific properties
function make_mining_drill_item(mk, tint)
    return {
        type = "item",
        name = "electric-mining-drill-mk" .. mk, -- Unique name for each tier
        order = "b[electric-mining-drill]-" .. string.char(96 + mk) .. "[electric-mining-drill-mk" .. mk .. "]", -- Sorting order in inventory
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
    make_mining_drill_item(2, {r = 1.0, g = 0.84, b = 0.0, a = 0.9}),  -- mk2 drill, gold-yellow tint
    make_mining_drill_item(3, {r = 1.0, g = 0.25, b = 0.25, a = 0.9}), -- mk3 drill, crimson red tint
    make_mining_drill_item(4, {r = 0.4, g = 0.6, b = 1.0, a = 0.9}),   -- mk4 drill, tech blue tint
    make_mining_drill_item(5, {r = 0.3, g = 1.0, b = 0.5, a = 0.9})    -- mk5 drill, emerald green tint
}

data:extend(drill_items)

