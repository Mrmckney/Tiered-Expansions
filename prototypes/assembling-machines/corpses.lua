-- prototypes/assembling-machines/corpses.lua
require("util/utilities")

-- Function to create remnants for assembling machines
function create_assembling_machine_remnants(mk)
    return {
        type = "corpse",
        name = "assembling-machine-mk" .. mk .. "-remnants",
        icons = {
            {
                icon = "__TieredExpansions__/graphics/entity/assembling-machines/assembling-machine-" .. mk .. "-recipe.png",
                icon_size = 64,
                icon_mipmaps = 1
            }
        },
        flags = { "placeable-neutral", "not-on-map" },
        subgroup = "production-machine-remnants",
        selection_box = { { -1.5, -1.5 }, { 1.5, 1.5 } },
        tile_width = 3,
        tile_height = 3,
        time_before_removed = 60 * 60 * 15, -- 15 minutes
        expires = false,
        final_render_layer = "remnants",
        animation = make_rotated_animation_variations_from_sheet(3, {
            filename = "__TieredExpansions__/graphics/entity/assembling-machines/assembling-machine-" .. mk .. "-remnants.png",
            line_length = 1,
            width = 328,
            height = 282,
            direction_count = 1,
            shift = util.by_pixel(0, 9.5),
            scale = 0.5
        })
    }
end

local assembling_machine_4_remnants = create_assembling_machine_remnants(4)
local assembling_machine_5_remnants = create_assembling_machine_remnants(5)

data:extend({
    assembling_machine_4_remnants,
    assembling_machine_5_remnants
})