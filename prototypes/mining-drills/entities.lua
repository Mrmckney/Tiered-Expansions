-- prototypes/mining-drills/entities.lua

local mining_drill_base = data.raw["mining-drill"]["electric-mining-drill"]
if not mining_drill_base then
    error("Base electric-mining-drill not found!")
end

function set_mining_drill_tint(entity, tint)
    -- Tint the main animation layers if they exist
    if entity.graphics_set and entity.graphics_set.animation then
        for _, animation in pairs(entity.graphics_set.animation) do
            if animation.layers and animation.layers[1] then
                animation.layers[1].tint = tint
                if animation.layers[1].hr_version then
                    animation.layers[1].hr_version.tint = tint
                end
            end
        end
    end
end

-- Function to create a mining drill variant with specific parameters
function create_mining_drill_variant(params)
    local drill = table.deepcopy(mining_drill_base)
    drill.name = params.name
    drill.mining_speed = params.mining_speed
    drill.energy_usage = params.energy_usage
    drill.minable = {
        mining_time = 0.5,
        result = params.name
    }
    drill.module_slots = params.module_slots

    set_mining_drill_tint(drill, params.tint)
    return drill
end

-- Tints
local mk2_tint = { r = 1.0, g = 0.0, b = 0.0, a = 1.0 }    -- Deep Bright Red
local mk3_tint = { r = 0.0, g = 0.4, b = 1.0, a = 1.0 }    -- Deep Bright Blue
local mk4_tint = { r = 0.5, g = 0.0, b = 1.0, a = 1.0 }    -- Deep Bright Purple
local mk5_tint = { r = 1.0, g = 0.5, b = 0.0, a = 1.0 }    -- Deep Bright Orange

-- MK2 drill entity
local electric_mining_drill_mk2 = create_mining_drill_variant{
    name = "electric-mining-drill-mk2",
    tint = mk2_tint,
    mining_speed = 1.0,
    energy_usage = "120kW",
    module_slots = 4
}

-- MK3 drill entity
local electric_mining_drill_mk3 = create_mining_drill_variant{
    name = "electric-mining-drill-mk3",
    tint = mk3_tint,
    mining_speed = 1.75,
    energy_usage = "180kW",
    module_slots = 5
}

-- MK4 drill entity
local electric_mining_drill_mk4 = create_mining_drill_variant{
    name = "electric-mining-drill-mk4",
    tint = mk4_tint,
    mining_speed = 2.5,
    energy_usage = "240kW",
    module_slots = 6
}

-- MK5 drill entity
local electric_mining_drill_mk5 = create_mining_drill_variant{
    name = "electric-mining-drill-mk5",
    tint = mk5_tint,
    mining_speed = 3.5,
    energy_usage = "360kW",
    module_slots = 7
}

local drill_entities = {
    electric_mining_drill_mk2,
    electric_mining_drill_mk3,
    electric_mining_drill_mk4,
    electric_mining_drill_mk5,
}

data:extend(drill_entities)
