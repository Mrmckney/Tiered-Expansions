-- prototypes/electronics/entities.lua

local electronics_base = data.raw["item"]["processing-unit"]
if not electronics_base then
    error("Base processing-unit not found!")
end

-- Function to create a tinted copy of the base item
function create_electronics_variant(params)
    local electronics = table.deepcopy(electronics_base)
    electronics.name = params.name

    return electronics

end

-- Hyperlogic Unit
local hyperlogic_unit = create_electronics_variant({
    name = "hyperlogic-unit",
})

-- Singularity Processor
local singularity_processor = create_electronics_variant({
    name = "singularity-processor",
})

-- Quantum Processor
local quantum_processor = create_electronics_variant({
    name = "quantum-processor",
})

data:extend({
    hyperlogic_unit,
    singularity_processor,
    quantum_processor
})