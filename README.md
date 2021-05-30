# Enum

Roblox Lua Enum library for supporting custom Enum types. Much of the API is
based off of [EnumExtender](https://github.com/buildthomas/EnumExtender). The
key difference between this library and ExumExtender is values of EnumItems
can be assigned to anything rather than being limited to numbers.

Enums created under the same name will overwrite previous Enums. Custom Enums
take priority over Roblox Enums.

------

## API

* Enums
  * Enums.new(enumName: `string`, enumItems: `List|Dictionary`): `Enum`
  * Enums:GetStandardEnums(): `Enums`
  * Enums:FromValue(enumName: `string`, enumValue: `any`): `EnumItem`
  * Enums:Find(enumName: `string`): `Enum`
* Enum
  * Enums:GetEnumItems(): `{EnumItem}`
* EnumItem
  * `string`Name
  * `any`Value
  * `Enum`EnumType

## Examples

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
        Foo = 0,
        Bar = 1,
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

This style of defining arguments is supported for compatability with
EnumExtender.

```lua
local TestEnum = Enum.new(
    "TestEnum",
    {
        [0] = Foo,
        [1] = Bar,
    }
)
```
