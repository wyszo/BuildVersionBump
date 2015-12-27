import XCTest

class StringByTrimmingWhitespaceTests : XCTestCase {
    func testEmptyString() {
        let emptyString = ""
        let trimmedString = emptyString.stringByTrimmingWhitespace()
        XCTAssertEqual(emptyString, trimmedString, "empty string should not change after trimming whitespace")
    }

    func testSingleSpace() {
        let singleSpaceString = " "
        let trimmedString = singleSpaceString.stringByTrimmingWhitespace()
        XCTAssertEqual("", trimmedString, "string containing space should be empty after trimming whitespace")
    }

    func testSingleSpaceAndALetter() {
        let singleSpaceAndALetterString = " a"
        let trimmedString = singleSpaceAndALetterString.stringByTrimmingWhitespace()
        XCTAssertEqual("a", trimmedString, "string containing space and a letter should contain just a letter after trimming whitespace")
    }

    func testLetterAndSpace() {
        let singleLetterAndSpaceString = "b "
        let trimmedString = singleLetterAndSpaceString.stringByTrimmingWhitespace()
        XCTAssertEqual("b", trimmedString, "string containing letter and a space should just contain a letter after trimming whitespace")
    }

    func testMultipleLeadingSpacesAndAWord() {
        let multipleSpacesAndAWord = "    CAT"
        let trimmedString = multipleSpacesAndAWord.stringByTrimmingWhitespace()
        XCTAssertEqual("CAT", trimmedString, "string containing multiple leading spaces and a word should just contain the word after trimming whitespace")
    }

    func testAWordAndMultipleTrailingSpaces() {
        let aWordAndMultipleTrailingSpaces = "dog    "
        let trimmedString = aWordAndMultipleTrailingSpaces.stringByTrimmingWhitespace()
        XCTAssertEqual("dog", trimmedString, "string containing a word and multiple trailing spaces should just contain the word after trimming whitespace")
    }

    func testAWordAndLeadingAndTrailingSpace() {
        let aWordAndLeadingAndTrailingSpace = " Elephant "
        let trimmedString = aWordAndLeadingAndTrailingSpace.stringByTrimmingWhitespace()
        XCTAssertEqual("Elephant", trimmedString, "string containing a word and a leading and trailing space should just contain the word after trimming whitespace")
    }

    func testMultipleWordsAndLeadingAndTrailingSpace() {
        let aWordAndMultipleLeadingAndTrailingSpaces = "     House  "
        let trimmedString = aWordAndMultipleLeadingAndTrailingSpaces.stringByTrimmingWhitespace()
        XCTAssertEqual("House", trimmedString, "string containing a word and multiple leading and trailing spaces should just contain the word after trimming whitespace")
    }

    func testMultipleWordsAndMultipleTrailingSpaces() {
        let multipleWordsAndMultipleLeadingAndTrailingSpaces = "    Oven Digital    Rose   "
        let trimmedString = multipleWordsAndMultipleLeadingAndTrailingSpaces.stringByTrimmingWhitespace()
        XCTAssertEqual("Oven Digital    Rose", trimmedString, "string containing multiple words and multiple leading and trailing spaces should just contain those words after trimming whitespace")
    }

    func testTabulationTrimming() {
        let aWordAndTabulation = "\t    Tree    \t"
        let trimmedString = aWordAndTabulation.stringByTrimmingWhitespace()
        XCTAssertEqual("Tree", trimmedString, "string containing a word and tabulation should just contain this word after trimming whitespace")
    }

    func testNewlineNotTrimming() {
        let aWordAndNewline = "Champ \n"
        let trimmedString = aWordAndNewline.stringByTrimmingWhitespace()
        XCTAssertEqual("Champ \n", trimmedString, "string containing a word and a newline should not change after trimming whitespace")
    }
}
