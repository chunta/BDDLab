@testable import BDDLab

import Quick
import Nimble

class SimpleBDDTest: QuickSpec {
    override func spec() {
        describe("Basic test for integer and string") {
            it("1+1 equal to 2") {
                expect(1 + 1).to(equal(2))
            }
            it("The fullname of america president doesn't contain 'sex'") {
                expect("Joe Biden").toNot(contain("sex"))
            }
        }
    }
}

class SimpleQuickTestEg: QuickSpec {
    override func spec() {
        describe("basic arithmatic") {
            it("to equal three") {
                expect(1 + 1).to(equal(2))
                expect(3 + 1).to(equal(4), description: "Basics test of two numbers")
            }
            it("is great") {
                expect(3).to(beGreaterThan(2))
                expect(3) > 2
            }
            it("has a substring") {
                expect("javascript").to(contain("java"))
            }
            it("does not contain a string") {
                expect(["Paris", "London"]).toNot(contain("Delhi"))
            }
        }
    }
}
