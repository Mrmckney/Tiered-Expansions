-- prototypes/splitters/corpses.lua
require("util/utilities")

-- Function to create a corpse entity for splitters
function create_splitter_corpse(name, icon, max_health)
    return {
        type = "corpse",
        name = name .. "-remnants",
        icons = {
            {
                icon = "__TieredExpansions__/graphics/icons/splitters/" .. name .. "-recipe.png",
                icon_size = 64,
                icon_mipmaps = 1
            }
        },
        flags = { "placeable-neutral", "not-on-map" },
        subgroup = "remnants",
        selection_box = { { -0.5, -0.5 }, { 0.5, 0.5 } },
        tile_width = 1,
        tile_height = 1,
        time_before_removed = 60 * 60 * 15, -- 15 minutes
        expires = false,
        final_render_layer = "remnants",
        animation = make_rotated_animation_variations_from_sheet(3, {
            filename = "__TieredExpansions__/graphics/entity/splitters/" .. name .. "-remnants.png",
            line_length = 1,
            width = 64,
            height = 64,
            direction_count = 1,
            shift = util.by_pixel(0, 0),
            scale = 0.5
        })
    }
end

local hyper_splitter_remnants = create_splitter_corpse("hyper-splitter")
local ultimate_splitter_remnants = create_splitter_corpse("ultimate-splitter")
local quantum_splitter_remnants = create_splitter_corpse("quantum-splitter")

data:extend({
    hyper_splitter_remnants,
    ultimate_splitter_remnants,
    quantum_splitter_remnants
})