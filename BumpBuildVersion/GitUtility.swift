import Foundation

struct GitUtility {
  func tagBranchWithTagName(tagName: String) -> String? {
    return executeGitCommandWithArguments("tag " + tagName.stringByTrimmingWhitespaceAndNewline())
  }
  
  func createBranchNamed(branchName: String) {
    executeGitCommandWithArguments("branch " + branchName)
  }
  
  func deleteBranchNamed(branchName: String) {
    executeGitCommandWithArguments("branch -D " + branchName)
  }
  
  func switchToBranchNamed(branchName: String) {
    executeGitCommandWithArguments("checkout " + branchName)
  }
  
  func currentGitBranch() -> String? {
    return executeGitCommandWithArguments("rev-parse --abbrev-ref HEAD")?.stringByTrimmingWhitespaceAndNewline()
  }
  
  // MARK: private
  
  private func executeGitCommandWithArguments(arguments: String) -> String? {
    let taskExecutor = OSTaskExecutor()
    return taskExecutor.systemCommandWithLaunchPath(Constants.Paths.gitPath, arguments:arguments).0
  }
}
