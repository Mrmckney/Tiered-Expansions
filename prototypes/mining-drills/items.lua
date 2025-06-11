-- prototypes/mining-drills/items.lua

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

local mk2_tint = { r = 0.2, g = 0.6, b = 1.0, a = 0.3 }    -- Light Blue (Rare)
local mk3_tint = { r = 0.6, g = 0.3, b = 1.0, a = 0.3 }    -- Light Purple (Epic)
local mk4_tint = { r = 1.0, g = 0.7, b = 0.3, a = 0.3 }    -- Light Orange (Legendary)
local mk5_tint = { r = 1.0, g = 0.3, b = 0.3, a = 0.3 }    -- Light Red (Mythic)

local drill_items = {
    make_mining_drill_item(2, mk2_tint),   -- mk2 drill, Rare
    make_mining_drill_item(3, mk3_tint),   -- mk3 drill, Epic
    make_mining_drill_item(4, mk4_tint),   -- mk4 drill, Legendary
    make_mining_drill_item(5, mk5_tint)    -- mk5 drill, Mythic
}

data:extend(drill_items)

