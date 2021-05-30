return function()
    local testEnum = Enums.new("TestEnum", {"A", "B", "C"})

    describe("Enum:GetEnumItems()", function()
        it("should return a table", function()
            expect(testEnum:GetEnumItems()).to.be.a("table")
        end)

        it("should contain 3 EnumItems", function()
            expect(#testEnum:GetEnumItems()).to.equal(3)
        end)
    end)

    describe("Enum:FromValue()", function()
        it("should return A", function()
            expect(testEnum:FromValue(1)).to.equal(testEnum.A)
        end)

        it("should return nil", function()
            expect(testEnum:FromValue(4)).to.equal(nil)
        end)
    end)

    describe("Enum.__metatable", function()
        it("should return string", function()
            expect(getmetatable(testEnum)).to.be.a("string")
        end)
    end)

    describe("Enum.__index", function()
        it("should throw", function()
            expect(function()
                _ = testEnum._
            end).to.throw()
        end)
    end)

    describe("Enum.__newindex", function()
        it("should throw", function()
            expect(function()
                testEnum._ = nil
            end).to.throw()
        end)
    end)
end