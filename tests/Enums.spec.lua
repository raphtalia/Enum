return function()
    local testEnum

    describe("Enums.new()", function()
        it("should throw", function()
            expect(function()
                return Enums.new(
                    "TestEnum",
                    {
                        [20] = Vector3.new()
                    }
                )
            end).to.throw()
        end)

        it("should return userdata", function()
            expect(Enums.new(
                "TestEnum",
                {
                    "Foo", -- Foo = 1
                    Bar = 10, -- Bar = 10
                    [20] = "Baz", -- Baz = 20
                }
            )).to.be.a("userdata")
        end)
    end)

    describe("Enums:GetStandardEnums()", function()
        it("should return standard Enums instance", function()
            expect(Enums:GetStandardEnums()).to.equal(Enum)
        end)
    end)

    describe("Enums:FromValue()", function()
        it("should return KeyCode.W", function()
            expect(Enums:FromValue("KeyCode", 119)).to.equal(Enum.KeyCode.W)
        end)

        it("should return TestEnum.Foo", function()
            expect(Enums:FromValue("TestEnum", 1)).to.equal(Enums.TestEnum.Foo)
        end)
    end)

    describe("Enums:Find()", function()
        it("should return KeyCode", function()
            expect(Enums:Find("KeyCode")).to.equal(Enum.KeyCode)
        end)

        it("should return TestEnum", function()
            expect(Enums:Find("TestEnum")).to.equal(Enums.TestEnum)
        end)
    end)

    describe("Enums.__metatable", function()
        it("should return string", function()
            expect(getmetatable(Enums)).to.be.a("string")
        end)
    end)

    describe("Enums.__index", function()
        it("should return KeyCode", function()
            expect(Enums.KeyCode).to.equal(Enum.KeyCode)
        end)

        it("should return TestEnum", function()
            expect(Enums.TestEnum).to.equal(Enums.TestEnum)
        end)

        it("should throw", function()
            expect(function()
                _ = Enums.nosuchenum
            end).to.throw()
        end)
    end)

    describe("Enums.__newindex", function()
        it("should throw", function()
            expect(function()
                Enums.TestEnum = nil
            end).to.throw()
        end)
    end)
end