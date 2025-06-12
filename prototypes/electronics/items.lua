-- prototypes/electronics/items.lua

function make_electronics_item(name, icon, order_suffix)
    return {
        type = "item",
        name = name,
        icons = {
            {
                icon = icon,
                icon_size = 64,
                icon_mipmaps = 1,
            }
        },
        subgroup = "intermediate-product",
        order = "b[processing-unit]-" .. order_suffix .. "[" .. name .. "]",
        stack_size = 200,
    }
end

-- Icons
local hyperlogic_unit_icon = "__TieredExpansions__/graphics/icons/hyperlogic-unit.png"
local singularity_processor_icon = "__TieredExpansions__/graphics/icons/singularity-processor.png"

-- Hyperlogic Unit
local hyperlogic_unit_item = make_electronics_item("hyperlogic-unit", hyperlogic_unit_icon, "a")

-- Singularity Processor
local singularity_processor_item = make_electronics_item("singularity-processor", singularity_processor_icon, "b")

data:extend({
    hyperlogic_unit_item,
    singularity_processor_item
})
