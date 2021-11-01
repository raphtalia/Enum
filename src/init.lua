local RBX_ENUM = Enum

local newEnum = require(script.Enum).new

--[=[
    @class Enums
    Entry-point for the Enum library.
]=]
local Enums = newproxy(true)
local meta = getmetatable(Enums)
local methods = {}
local enums = {}

--[=[
    @within Enums
    @return Enum
    Creates a new Enum. Overwrites existing Enums including Roblox Enums.
]=]
function methods.new(enumName, enumItemsList)
    -- If an enum with the same name is used it is overwritten
    local enum = newEnum(enumName, enumItemsList)
    enums[enumName] = enum
    return enum
end

--[=[
    @within Enums
    @return Enum
    Returns the standard Roblox Enum table defined globally. This is useful for
    when this library is imported under the name `Enum`.
]=]
function methods:GetStandardEnums()
    return RBX_ENUM
end

--[=[
    @within Enums
    @param enumName string -- The name of the Enum.
    @param enumValue any -- The value of the EnumItem.
    @return EnumItem
    Given an Enum's name and the EnumItem's value, returns the EnumItem.
]=]
function methods:FromValue(enumName, enumValue)
    for _,enumItem in ipairs(self[enumName]:GetEnumItems()) do
        if enumItem.Value == enumValue then
            return enumItem
        end
    end
end

--[=[
    @within Enums
    @param enumName string -- The name of the Enum.
    @return Enum
    Safe way of checking if an Enum exists and returns it if it does.
]=]
function methods:Find(enumName)
    local success, enum = pcall(function()
        return enums[enumName] or RBX_ENUM[enumName]
    end)

    if success then
        return enum
    end

    return nil
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