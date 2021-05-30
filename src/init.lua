local RBX_ENUM = Enum

local newEnum = require(script.Enum).new

local Enums = newproxy(true)
local meta = getmetatable(Enums)
local methods = {}
local enums = {}

function methods.new(enumName, enumItemsList)
    -- If an enum with the same name is used it is overwritten
    local enum = newEnum(enumName, enumItemsList)
    enums[enumName] = enum
    return enum
end

function methods:GetStandardEnums()
    return RBX_ENUM
end

function methods:FromValue(enumName, enumValue)
    for _,enumItem in ipairs(self[enumName]:GetEnumItems()) do
        if enumItem.Value == enumValue then
            return enumItem
        end
    end
end

function methods:Find(enumName)
    return enums[enumName] or RBX_ENUM[enumName]
end

meta.__metatable = "The metatable is locked"
meta.__tostring = function()
    return "Enums"
end

function meta.__index(_, enumName)
    return methods[enumName] or enums[enumName] or RBX_ENUM[enumName]
end

function meta.__newindex(_, i)
    error(i.. " cannot be assigned to", 2)
end

return Enums