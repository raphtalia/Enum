# Enum

Roblox Lua Enum library for supporting custom Enum types.

Enums created under the same name will overwrite previous Enums. Custom Enums take priority over Roblox Enums.

```lua
local Enum = require(script.Parent.Enum)

print(Enum) --> Enums
print(Enum.KeyCode) --> KeyCode
print(Enum.KeyCode.W) --> Enum.KeyCode.W
print(Enum.KeyCode.W.Name) --> W
print(Enum.KeyCode.W.Value) --> 119
print(Enum.KeyCode.W.EnumType) --> KeyCode

local TestEnum = Enum.new(
    "TestEnum",
    {
        Name = "Foo",
        Value = 0,
    },
    {
        Name = "Bar",
        Value = 1
    }
)
print(Enum.TestEnum == TestEnum) --> true

print(Enum.TestEnum) --> TestEnum
print(Enum.TestEnum.Foo) --> Enum.TestEnum.Foo
print(Enum.TestEnum.Foo.Name) --> Foo
print(Enum.TestEnum.Foo.Value) --> 0 
print(Enum.TestEnum.Foo.EnumType) --> TestEnum

print(Enum.TestEnum.Bar) --> Enum.TestEnum.Bar
print(Enum.TestEnum.Bar.Name) --> Bar
print(Enum.TestEnum.Bar.Value) --> 1
print(Enum.TestEnum.Bar.EnumType) --> TestEnum

print(Enum.TestEnum:GetEnumItems())
```
