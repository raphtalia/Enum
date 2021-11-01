return function()
    local testEnumItem = Enums.new("TestEnum", {"A", "B", "C"}).A

    describe("EnumItem.Name", function()
        it("should be a string", function()
            expect(testEnumItem.Name).to.be.a("string")
        end)
    end)

    describe("EnumItem.Value", function()
        it("should not be nil", function()
            expect(testEnumItem.Value).to.never.be.a("nil")
        end)
    end)

    describe("EnumItem.EnumType", function()
        it("should be a userdata", function()
            expect(testEnumItem.EnumType).to.be.a("userdata")
        end)
    end)

    describe("EnumItem:IsA()", function()
        it("should be true", function()
            expect(testEnumItem:IsA("TestEnum")).to.be.equal(true)
        end)

        it("should be false", function()
            expect(testEnumItem:IsA("Material")).to.be.equal(false)
        end)
    end)

    describe("Enums.__metatable", function()
        it("should return string", function()
            expect(getmetatable(testEnumItem)).to.be.a("string")
        end)
    end)

    describe("Enums.__index", function()
        it("should throw", function()
            expect(function()
                _ = testEnumItem._
            end).to.throw()
        end)
    end)

    describe("Enums.__newindex", function()
        it("should throw", function()
            expect(function()
                testEnumItem._ = nil
            end).to.throw()
        end)
    end)
end