import XCTest

class OSTaskExecutorTests : XCTestCase {
    let taskExecutor = OSTaskExecutor()

    func testExcecuteEmptyPath() {
        let result = taskExecutor.systemCommandWithLaunchPath("", arguments: "")
        XCTAssertEqual("", result, "task executor should return nothing when launchPath and arguments empty")
    }

    func testExecuteLs() {
        XCTAssertFalse(true, "not implemented yet")
    }

    func testExecuteGitWithNoParameters() {
        XCTAssertFalse(true, "not implemented yet")
    }

    func testExecuteGitWithSomeParameters() {
        XCTAssertFalse(true, "not implemented yet")
    }
}