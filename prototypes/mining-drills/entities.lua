-- prototypes/mining-drills/entities.lua

local util = require("util")
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
    -- Tint the working visualisation animations if they exist
    if entity.working_visualisations then
        for _, vis in pairs(entity.working_visualisations) do
            if vis.animation then
                vis.animation.tint = tint
                if vis.animation.hr_version then
                    vis.animation.hr_version.tint = tint
                end
            end
        end
    end
end

-- Function to create a mining drill variant with specific parameters
function create_mining_drill_variant(params)
    local drill = util.table.deepcopy(mining_drill_base)
    drill.name = params.name
    drill.icons = {
        {
            icon = "__base__/graphics/icons/electric-mining-drill.png",
            icon_size = 64,
            tint = params.tint,
        }
    }
    drill.mining_speed = params.mining_speed
    drill.energy_usage = params.energy_usage
    drill.minable = {
        mining_time = 0.5,
        result = params.name
    }

    set_mining_drill_tint(drill, params.tint)
    return drill
end

-- Tints
local mk2_tint = { r = 0.0, g = 0.4, b = 1.0, a = 1.0 }    -- Deep Bright Blue (Rare)
local mk3_tint = { r = 0.5, g = 0.0, b = 1.0, a = 1.0 }    -- Deep Bright Purple (Epic)
local mk4_tint = { r = 1.0, g = 0.5, b = 0.0, a = 1.0 }    -- Deep Bright Orange (Legendary)
local mk5_tint = { r = 1.0, g = 0.0, b = 0.0, a = 1.0 }    -- Deep Bright Red (Mythic)

-- MK2 drill entity
local electricMiningDrillMK2 = create_mining_drill_variant{
    name = "electric-mining-drill-mk2",
    tint = mk2_tint,
    mining_speed = 1.0,
    energy_usage = "120kW",
}

-- MK3 drill entity
local electricMiningDrillMK3 = create_mining_drill_variant{
    name = "electric-mining-drill-mk3",
    tint = mk3_tint,
    mining_speed = 1.75,
    energy_usage = "180kW",
}

-- MK4 drill entity
local electricMiningDrillMK4 = create_mining_drill_variant{
    name = "electric-mining-drill-mk4",
    tint = mk4_tint,
    mining_speed = 2.5,
    energy_usage = "240kW",
}

-- MK5 drill entity
local electricMiningDrillMK5 = create_mining_drill_variant{
    name = "electric-mining-drill-mk5",
    tint = mk5_tint,
    mining_speed = 3.5,
    energy_usage = "360kW",
}

local drill_entities = {
    electricMiningDrillMK2,
    electricMiningDrillMK3,
    electricMiningDrillMK4,
    electricMiningDrillMK5,
}

data:extend(drill_entities)
