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
                icon_mipmaps = 4
            }
        }
    }
end

local drill_items = {}

for mk = 2, 5 do
    table.insert(drill_items, make_mining_drill_item(mk))
end

data:extend(drill_items)

