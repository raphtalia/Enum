local newEnumItem = require(script.Parent.EnumItem).new

local Enum = {}

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

    meta.__metatable = "The metatable is locked"
    meta.__tostring = function()
        return enumName
    end

    function meta.__index(_, i)
        local v = methods[i] or enumItems[i]

        if v then
            return v
        else
            error(("%s is not a valid member of \"%s\""):format(i, "Enum.".. enumName))
        end
    end

    function meta.__newindex(_, i)
        error(i.. " cannot be assigned to")
    end

    for enumItemName, enumItemValue in pairs(enumItemsList) do
        enumItems[enumItemName] = newEnumItem(enumItemName, enumItemValue, enum)
    end

    return enum
end

return Enum