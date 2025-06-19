-- prototypes/belts/corpses.lua
require("util/utilities")

-- Function to create remnants for belts
function create_belt_remnants(name, alt_name)
    return {
        type = "corpse",
        name = name .. "-remnants",
        icons = {
            {
                icon = "__TieredExpansions__/graphics/icons/belts/" .. (alt_name or name) .. "-recipe.png",
                icon_size = 64,
                icon_mipmaps = 1
            }
        },
        flags = { "placeable-neutral", "not-on-map" },
        subgroup = "belt-remnants",
        selection_box = { { -0.5, -0.5 }, { 0.5, 0.5 } },
        tile_width = 1,
        tile_height = 1,
        time_before_removed = 60 * 60 * 15, -- 15 minutes
        expires = false,
        final_render_layer = "remnants",
        animation = make_rotated_animation_variations_from_sheet(3, {
            filename = "__TieredExpansions__/graphics/entity/belts/" .. name .. "-remnants.png",
            line_length = 1,
            width = 64,
            height = 64,
            direction_count = 1,
            shift = util.by_pixel(0, 0),
            scale = 0.5
        })
    }
end

local hyper_transport_belt_remnants = create_belt_remnants("hyper-transport-belt")
local turbo_transport_belt_remnants = create_belt_remnants("turbo-transport-belt", "ultimate-transport-belt")
local quantum_transport_belt_remnants = create_belt_remnants("quantum-transport-belt")

data:extend({
    hyper_transport_belt_remnants,
    turbo_transport_belt_remnants,
    quantum_transport_belt_remnants
})
