-- prototypes/mining-drills/items.lua

-- Function to create mining drill's item with tier-specific properties
function make_mining_drill_item(mk)
    return {
        type = "item",
        name = "electric-mining-drill-mk" .. mk,
        order = "b[electric-mining-drill]-" .. string.char(96 + mk) .. "[electric-mining-drill-mk" .. mk .. "]",
        place_result = "electric-mining-drill-mk" .. mk,
        stack_size = 50,
        subgroup = "extraction-machine",
        icons = {
            {
                icon = "__TieredExpansions__/graphics/icons/mining-drills/electric-mining-drill-mk" ..mk.. ".png", -- Base icon
                icon_size = 64,
                icon_mipmaps = 1
            }
        }
    }
end

local drill_items = {
    make_mining_drill_item(2),  -- mk2 drill
    make_mining_drill_item(3),  -- mk3 drill
    make_mining_drill_item(4),  -- mk4 drill
    make_mining_drill_item(5)   -- mk5 drill
}

data:extend(drill_items)

