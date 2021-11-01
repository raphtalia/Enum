--[=[
    @class EnumItem
    Mirror of Roblox's
    [EnumItem](https://developer.roblox.com/en-us/api-reference/datatype/EnumItem)
    DataType.
]=]
local EnumItem = {}

--[=[
    @within EnumItem
    @private
    @return EnumItem
    Creates a new EnumItem.
]=]
--[=[
    @within EnumItem
    @readonly
    @prop Name string
    The name of the EnumItem.
]=]
--[=[
    @within EnumItem
    @readonly
    @prop Value any
    The value of the EnumItem.
]=]
--[=[
    @within EnumItem
    @readonly
    @prop EnumType string
    The type of the EnumItem.
]=]
--[=[
    @within EnumItem
    @function IsA
    @param EnumType string
    @return boolean
    Returns if the EnumItem is of the given EnumType.
]=]
function EnumItem.new(name, value, type)
    local enumItem = newproxy(true)
    local meta = getmetatable(enumItem)

    local typeName = tostring(type)
    local props = {
        Name = name,
        Value = value,
        EnumType = type,
    }

    function props:IsA(enumType)
        return typeName == enumType
    end

    meta.__metatable = "The metatable is locked"
    meta.__tostring = function()
        return ("Enum.%s.%s"):format(typeName, name)
    end

    function meta.__index(_, i)
        local v = props[i]

        if v then
            return v
        else
            error(("%s is not a valid member of \"%s\""):format(i, tostring(enumItem)), 2)
        end
    end

    function meta.__newindex(_, i)
        error(i.. " cannot be assigned to", 2)
    end

    return enumItem
end

return EnumItem