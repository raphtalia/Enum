local RBX_ENUM = Enum

local newEnum = require(script.Enum).new

local Enum = newproxy(true)
local meta = getmetatable(Enum)
local methods = {}
local enums = {}

function methods.new(enumName, enumItemsList)
    -- If an enum with the same name is used it is overwritten
    local enum = newEnum(enumName, enumItemsList)
    enums[enumName] = enum
    return enum
end

meta.__metatable = "The metatable is locked"
meta.__tostring = function()
    return "Enums"
end

function meta.__index(_, enumName)
    return methods[enumName] or enums[enumName] or RBX_ENUM[enumName]
end

function meta.__newindex(_, i)
    error(i.. " cannot be assigned to")
end

return Enum