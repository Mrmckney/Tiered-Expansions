-- prototypes/assembling-machines/entities.lua

local base = data.raw["assembling-machine"]["assembling-machine-3"]
if not base then
    error("Base assembling-machine-3 not found!")
end

function make_graphics_set(icon)
    return {
        animation = {
            layers = {
                {
                    filename = icon .. ".png",
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
end

function make_pipe_picture(icon)
    return {
        north = {
            filename = icon .. "-pipe-N.png",
            priority = "extra-high",
            width = 71,
            height = 38,
            shift = util.by_pixel(2.25, 13.5),
            scale = 0.5
        },
        east = {
            filename = icon .. "-pipe-E.png",
            priority = "extra-high",
            width = 42,
            height = 76,
            shift = util.by_pixel(-24.5, 1),
            scale = 0.5
        },
        south = {
            filename = icon .. "-pipe-S.png",
            priority = "extra-high",
            width = 88,
            height = 61,
            shift = util.by_pixel(0, -31.25),
            scale = 0.5
        },
        west = {
            filename = icon .. "-pipe-W.png",
            priority = "extra-high",
            width = 39,
            height = 73,
            shift = util.by_pixel(25.75, 1.25),
            scale = 0.5
        }
    }
end

function create_assembling_machine_variant(params)
    local machine = table.deepcopy(base)

    machine.name = params.name
    machine.minable = { mining_time = 0.5, result = params.name }
    machine.crafting_speed = params.crafting_speed
    machine.energy_usage = params.energy_usage
    machine.flags = {"placeable-neutral", "player-creation"}
    machine.max_health = params.max_health
    machine.dying_explosion = "medium-explosion"
    machine.resistances = {
        { type = "fire", percent = 70 },
        { type = "impact", percent = 30 }
    }
    machine.collision_box = {{-1.2, -1.2}, {1.2, 1.2}}
    machine.selection_box = {{-1.5, -1.5}, {1.5, 1.5}}
    machine.module_slots = params.module_slots

    machine.graphics_set = make_graphics_set(params.icon)

    if machine.fluid_boxes then
        local pipe_picture = make_pipe_picture(params.icon)
        for _, box in pairs(machine.fluid_boxes) do
            box.pipe_picture = pipe_picture
        end
    end

    machine.corpse = params.name .. "-remnants"

    return machine
end

local assembling_machine_mk4 = create_assembling_machine_variant{
    name = "assembling-machine-mk4",
    crafting_speed = 2,
    energy_usage = "600kW",
    icon = "__TieredExpansions__/graphics/entity/assembling-machines/assembling-machine-4",
    max_health = 800,
    module_slots = 6,
}

local assembling_machine_mk5 = create_assembling_machine_variant{
    name = "assembling-machine-mk5",
    crafting_speed = 3,
    energy_usage = "800kW",
    icon = "__TieredExpansions__/graphics/entity/assembling-machines/assembling-machine-5",
    max_health = 1000,
    module_slots = 8,
}

data:extend({
    assembling_machine_mk4,
    assembling_machine_mk5
})
