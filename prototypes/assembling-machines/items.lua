-- prototypes/assembling-machines/items.lua

function make_assembling_machine_item(name, icon, order_suffix)
    return {
        type = "item",
        name = name,
        icons = {
            {
                icon = icon .. "-recipe.png",
                icon_size = 64,
                icon_mipmaps = 1,
            }
        },
        subgroup = "production-machine",
        order = "c[assembling-machine-3]-" .. order_suffix .. "[" .. name .. "]",
        place_result = name,
        stack_size = 50
    }
end

-- Icons
local assembling_machine_mk4_icon = "__TieredExpansions__/graphics/entity/assembling-machines/assembling-machine-4"
local assembling_machine_mk5_icon = "__TieredExpansions__/graphics/entity/assembling-machines/assembling-machine-5"

-- Assembling Machine Mk4
local assembling_machine_mk4_item = make_assembling_machine_item("assembling-machine-mk4", assembling_machine_mk4_icon, "a")

-- Assembling Machine Mk5
-- local assembling_machine_mk5_item = make_assembling_machine_item("assembling-machine-mk5", assembling_machine_mk5_icon, "b")

data:extend({
    assembling_machine_mk4_item,
    -- assembling_machine_mk5_item
})
