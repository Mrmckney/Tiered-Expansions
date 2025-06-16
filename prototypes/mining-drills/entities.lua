-- prototypes/mining-drills/entities.lua

local mining_drill_base = data.raw["mining-drill"]["electric-mining-drill"]
if not mining_drill_base then
    error("Base electric-mining-drill not found!")
end

-- Tint the animation layers
function set_mining_drill_tint(entity, tint)
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

-- Create drill from base, customize icon, tint, parameters
function create_mining_drill_entity(mk, mining_speed, energy_usage, module_slots, tint)
    local drill = table.deepcopy(mining_drill_base)
    local name = "electric-mining-drill-mk" .. mk

    drill.name = name
    drill.minable = {
        mining_time = 0.5,
        result = name
    }
    drill.mining_speed = mining_speed
    drill.energy_usage = energy_usage
    drill.module_slots = module_slots
    drill.icon = "__TieredExpansions__/graphics/icons/mining-drills/" .. name .. ".png"
    drill.icon_size = 64
    drill.icon_mipmaps = 4

    set_mining_drill_tint(drill, tint)

    return drill
end

-- Tints per tier
local tints = {
    { r = 1.0, g = 0.0, b = 0.0, a = 1.0 },    -- Red
    { r = 0.0, g = 0.4, b = 1.0, a = 1.0 },    -- Blue
    { r = 0.5, g = 0.0, b = 1.0, a = 1.0 },    -- Purple
    { r = 1.0, g = 0.5, b = 0.0, a = 1.0 }     -- Orange
}

-- Drill list
local drill_entities = {}

for mk = 2, 5 do
    table.insert(drill_entities, create_mining_drill_entity(
        mk,
        1 + 0.75 * (mk - 2),        -- mining speed
        (70 * mk) .. "kW",          -- energy usage
        2 + mk,                     -- module slots
        tints[mk - 1]               -- tint
    ))
end

data:extend(drill_entities)
