local newEnumItem = require(script.Parent.EnumItem).new

--[=[
    @class Enum
    Mirror of Roblox's
    [Enum](https://developer.roblox.com/en-us/api-reference/datatype/Enum)
    DataType.
]=]
local Enum = {}

--[=[
    @within Enum
    @private
    @return Enum
    Creates a new Enum.
]=]
--[=[
    @within Enum
    @function GetEnumItems
    @return EnumItem[]
    Returns an array containing all of the EnumItem options available for
    this enum.
]=]
function Enum.new(enumName, enumItemsList)
    local enum = newproxy(true)
    local meta = getmetatable(enum)

    local methods = {}
    local enumItems = {}

    function methods:GetEnumItems()
        local list = {}

        for _,enumItem in pairs(enumItems) do
            table.insert(list, enumItem)
        end

        return list
    end

    --[[
    Not compatible with Roblox Enums

    function methods:FromValue(enumValue)
        for _,enumItem in pairs(enumItems) do
            if enumItem.Value == enumValue then
                return enumItem
            end
        end
    end
    ]]

    meta.__metatable = "The metatable is locked"
    meta.__tostring = function()
        return enumName
    end

    function meta.__index(_, i)
        local v = methods[i] or enumItems[i]

        if v then
            return v
        else
            error(("%s is not a valid member of \"%s\""):format(i, "Enum.".. enumName), 2)
        end
    end

    function meta.__newindex(_, i)
        error(i.. " cannot be assigned to", 2)
    end

    for i, v in pairs(enumItemsList) do
        local enumItemName, enumItemValue

        local t = type(i)
        if t == "number" then
            enumItemName = v
            enumItemValue = i

            if type(v) ~= "string" then
                error("Expected string as value when key is a number", 4)
            end
        elseif t == "string" then
            enumItemName = i
            enumItemValue = v
        else
            error("Expected number or string as key", 4)
        end

        enumItems[enumItemName] = newEnumItem(enumItemName, enumItemValue, enum)
    end

    return enum
end

return Enum