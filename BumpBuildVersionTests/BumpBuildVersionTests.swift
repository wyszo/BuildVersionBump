import XCTest

class BumpBuildVersionTests: XCTestCase {
    func testStringByTrimmingWhitespaceEmptyString() {
        let emptyString = ""
        let trimmedString = emptyString.stringByTrimmingWhitespace()
        XCTAssertEqual(emptyString, trimmedString)
    }
}
