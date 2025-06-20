-- prototypes/splitters/items.lua

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

local hyper_splitter_item = create_splitter_item("hyper-splitter", "hyper-splitter", "d[hyper-splitter]")
local ultimate_splitter_item = create_splitter_item("turbo-splitter", "turbo-splitter", "e[turbo-splitter]")
local quantum_splitter_item = create_splitter_item("quantum-splitter", "quantum-splitter", "f[quantum-splitter]")

data:extend({
    hyper_splitter_item,
    ultimate_splitter_item,
    quantum_splitter_item
})