-- prototypes/assembling-machines/entities.lua

local assembling_machine_base = data.raw["assembling-machine"]["assembling-machine-3"]
if not assembling_machine_base then
    error("Base assembling-machine-3 not found!")
end

-- Function to create a copy of the base assembling machine
function create_assembling_machine_variant(params)
    local assembling_machine = table.deepcopy(assembling_machine_base)

    assembling_machine.name = params.name
    assembling_machine.minable = {
        mining_time = 0.5,
        result = params.name
    }
    assembling_machine.crafting_speed = params.crafting_speed
    assembling_machine.energy_usage = params.energy_usage
    assembling_machine.flags = {"placeable-neutral", "player-creation"}
    assembling_machine.max_health = 500
    assembling_machine.dying_explosion = "medium-explosion"
    assembling_machine.resistances = {
        { type = "fire", percent = 70 },
        { type = "impact", percent = 30 }
    }
    assembling_machine.collision_box = {{-1.2, -1.2}, {1.2, 1.2}}
    assembling_machine.selection_box = {{-1.5, -1.5}, {1.5, 1.5}}

    assembling_machine.graphics_set = {
        animation = {
           layers = {
                {
                    filename = params.icon .. ".png",
                    priority = "extra-high",
                    width = 214,
                    height = 237,
                    frame_count = 32,
                    line_length = 8,
                    shift = util.by_pixel(0, -0.75),
                    scale = 0.5
                }
            }
        }
    }

    local pipe_picture = {
        north = {
            filename = params.icon .. "-pipe-N.png",
            priority = "extra-high",
            width = 71,
            height = 38,
            shift = util.by_pixel(2.25, 13.5),
            scale = 0.5
        },
        east = {
            filename = params.icon .. "-pipe-E.png",
            priority = "extra-high",
            width = 42,
            height = 76,
            shift = util.by_pixel(-24.5, 1),
            scale = 0.5
        },
        south = {
            filename = params.icon .. "-pipe-S.png",
            priority = "extra-high",
            width = 88,
            height = 61,
            shift = util.by_pixel(0, -31.25),
            scale = 0.5
        },
        west = {
            filename = params.icon .. "-pipe-W.png",
            priority = "extra-high",
            width = 39,
            height = 73,
            shift = util.by_pixel(25.75, 1.25),
            scale = 0.5
        }
    }

    -- Assign custom pipe picture if fluid_boxes exist
    if assembling_machine.fluid_boxes then
        for _, box in pairs(assembling_machine.fluid_boxes) do
            box.pipe_picture = pipe_picture
        end
    end
    
    assembling_machine.corpse = "assembling-machine-mk4-remnants"

    return assembling_machine
end

-- Assembling Machine Mk4
local assembling_machine_mk4 = create_assembling_machine_variant({
    name = "assembling-machine-mk4",
    crafting_speed = 2.0,
    energy_usage = "300kW",
    icon = "__TieredExpansions__/graphics/entity/assembling-machines/assembling-machine-4",
})

-- Assembling Machine Mk5
local assembling_machine_mk5 = create_assembling_machine_variant({
    name = "assembling-machine-mk5",
    crafting_speed = 3.0,
    energy_usage = "400kW",
    icon = "__TieredExpansions__/graphics/entity/assembling-machines/assembling-machine-5",
})

data:extend({
    assembling_machine_mk4,
    assembling_machine_mk5
})

data:extend({
  {
    type = "corpse",
    name = "assembling-machine-mk4-remnants",
    icon = "__TieredExpansions__/graphics/entity/assembling-machines/assembling-machine-4-remnants.png",
    icon_size = 64,
    animation = {
      filename = "__TieredExpansions__/graphics/entity/assembling-machines/assembling-machine-4-remnants.png",
      width = 64,
      height = 64,
      frame_count = 1,
      direction_count = 1,
      shift = {0, 0}
    },
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    selectable_in_game = false
  }
})