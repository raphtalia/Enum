local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TestEZ = require(ReplicatedStorage.TestEZ)
local Enum = require(ReplicatedStorage.Enum)

local extraOptions = {
    showTimingInfo = true,
    testNamePattern = nil,
    extraEnvironment = {
        Enums = Enum
    }
}

TestEZ.TestBootstrap:run(script:GetChildren(), nil, extraOptions)