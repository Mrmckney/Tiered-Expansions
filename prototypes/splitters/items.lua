-- prototypes/splitters/items.lua
require("util/utilities")

-- Function to create a splitter item
function create_splitter_item(name, icon, order)
    return {
        type = "item",
        name = name,
        icons = {
            {
                icon = "__TieredExpansions__/graphics/icons/splitters/" .. icon .. "-recipe.png",
                icon_size = 64,
                icon_mipmaps = 1
            }
        },
        subgroup = "belt",
        order = order,
        place_result = name,
        stack_size = 50
    }
end

local splitter_orders = {
    with_space_age = {
        hyper = "e[hyper-splitter]",
        ultimate = "f[ultimate-splitter]",
        quantum = "g[quantum-splitter]"
    },
    without_space_age = {
        hyper = "d[hyper-splitter]",
        ultimate = "e[ultimate-splitter]",
        quantum = "f[quantum-splitter]"
    }
}

local orders = has_space_age and splitter_orders.with_space_age or splitter_orders.without_space_age

local hyper_splitter_item = create_splitter_item("hyper-splitter", "hyper-splitter", orders.hyper)
local ultimate_splitter_item = create_splitter_item("ultimate-splitter", "ultimate-splitter", orders.ultimate)
local quantum_splitter_item = create_splitter_item("quantum-splitter", "quantum-splitter", orders.quantum)

data:extend({
    hyper_splitter_item,
    ultimate_splitter_item,
    quantum_splitter_item
})