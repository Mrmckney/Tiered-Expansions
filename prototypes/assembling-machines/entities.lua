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

    assembling_machine.animation = {
        north = {
            layers = {
                {
                    filename = params.icon .. "-pipe-N.png",
                    width = 64,
                    height = 64,
                    frame_count = 1,
                    direction_count = 1,
                    shift = {0, 0}
                }
            }
        },
        east = {
            layers = {
                {
                    filename = params.icon .. "-pipe-E.png",
                    width = 64,
                    height = 64,
                    frame_count = 1,
                    direction_count = 1,
                    shift = {0, 0}
                }
            }
        },
        south = {
            layers = {
                {
                    filename = params.icon .. "-pipe-S.png",
                    width = 64,
                    height = 64,
                    frame_count = 1,
                    direction_count = 1,
                    shift = {0, 0}
                }
            }
        },
        west = {
            layers = {
                {
                    filename = params.icon .. "-pipe-W.png",
                    width = 64,
                    height = 64,
                    frame_count = 1,
                    direction_count = 1,
                    shift = {0, 0}
                }
            }
        }
    }
    
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
-- local assembling_machine_mk5 = create_assembling_machine_variant({
--     name = "assembling-machine-mk5",
-- })

data:extend({
    assembling_machine_mk4,
    -- assembling_machine_mk5
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