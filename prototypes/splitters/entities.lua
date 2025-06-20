-- prototypes/splitters/entities.lua
require("util/utilities")

local splitter_base = data.raw["splitter"]["splitter"]
if not splitter_base then
    error("Base splitter not found!")
end

local splitter_scale = 0.5
local splitter_path = "__TieredExpansions__/graphics/entity/splitters/"

local splitter_speeds = {
    ["hyper-splitter"] = has_space_age and 0.15625 or 0.125,
    ["turbo-splitter"] = has_space_age and 0.1875 or 0.15625,
    ["quantum-splitter"] = has_space_age and 0.21875 or 0.1875
}

-- Generates animation set per direction
function make_splitter_animation_set(icon)
   return {
        animation_set = {
            filename = "__TieredExpansions__/graphics/entity/belts/" .. icon .. ".png",
            priority = "extra-high",
            size = 128,
            scale = 0.5,
            frame_count = 32,
            direction_count = 20
        }
    }
end

function splitter_structure(name)
    return {
        north = {
            filename = "__TieredExpansions__/graphics/entity/splitters/" .. name .. "-north.png",
            frame_count = 32,
            line_length = 8,
            priority = "extra-high",
            width = 160,
            height = 70,
            shift = util.by_pixel(7, 0),
            scale = splitter_scale
        },
        east = {
            filename = "__TieredExpansions__/graphics/entity/splitters/" .. name .. "-east.png",
            frame_count = 32,
            line_length = 8,
            priority = "extra-high",
            width = 90,
            height = 84,
            shift = util.by_pixel(4, 13),
            scale = splitter_scale
        },
        south = {
            filename = "__TieredExpansions__/graphics/entity/splitters/" .. name .. "-south.png",
            frame_count = 32,
            line_length = 8,
            priority = "extra-high",
            width = 164,
            height = 64,
            shift = util.by_pixel(4, 0),
            scale = splitter_scale
        },
        west = {
            filename = "__TieredExpansions__/graphics/entity/splitters/" .. name .. "-west.png",
            frame_count = 32,
            line_length = 8,
            priority = "extra-high",
            width = 90,
            height = 86,
            shift = util.by_pixel(6, 12),
            scale = splitter_scale
        }
    }
end

function splitter_patch(name)
    return {
        north = util.empty_sprite(),
        east = {
            filename = "__TieredExpansions__/graphics/entity/splitters/" .. name .. "-east-top_patch.png",
            frame_count = 32,
            line_length = 8,
            priority = "extra-high",
            width = 90,
            height = 104,
            shift = util.by_pixel(4, -20),
            scale = splitter_scale
        },
        south = util.empty_sprite(),
        west = {
            filename = "__TieredExpansions__/graphics/entity/splitters/" .. name .. "-west-top_patch.png",
            frame_count = 32,
            line_length = 8,
            priority = "extra-high",
            width = 90,
            height = 96,
            shift = util.by_pixel(6, -18),
            scale = splitter_scale
        }
    }
end

-- Assembles the complete splitter entity
local function create_splitter_entity(name, max_health, related_belt)
    local splitter = table.deepcopy(splitter_base)
    splitter.name = name
    splitter.minable = { mining_time = 0.1, result = name }
    splitter.max_health = max_health
    splitter.speed = splitter_speeds[name]
    splitter.belt_animation_set = make_splitter_animation_set(related_belt)
    splitter.structure = splitter_structure(name)
    splitter.structure_patch = splitter_patch(name)
    splitter.related_transport_belt = related_belt
    return splitter
end

-- Define and register new splitters
local splitters = {
    create_splitter_entity("hyper-splitter", 180, "hyper-transport-belt"),
    create_splitter_entity("turbo-splitter", 190, "ultimate-transport-belt"),
    create_splitter_entity("quantum-splitter", 200, "quantum-transport-belt")
}

data:extend(splitters)