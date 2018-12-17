import XCTest
@testable import jeu

final class jeuTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(jeu().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
