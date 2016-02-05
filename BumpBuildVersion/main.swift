#!/usr/bin/swift

import Foundation

func tagNameFromBranchName(branchName: String) -> String {
    let safeBranchName = branchName.stringByTrimmingWhitespaceAndNewline()
    return String(safeBranchName.characters.dropFirst())
}

func executeArgvtoolWithArguments(arguments: String) -> String? {
    return OSTaskExecutor().systemCommandWithLaunchPath(Constants.Paths.agvtoolPath, arguments: arguments).0
}

func bumpBuildVersionNumber() {
    if let currentBuildVersionNumber = executeArgvtoolWithArguments("what-version -terse") {
        let nextBuildVersionNumber = VersionStringTransformer().nextBuildVersionNumber(currentBuildVersionNumber)
        executeArgvtoolWithArguments("new-version -all " + nextBuildVersionNumber)
    }
}

func main() {
    let gitUtility = GitUtility()
    let branch = gitUtility.currentGitBranch()

    if let currentBranch = branch {
        gitUtility.tagBranchWithTagName(tagNameFromBranchName(currentBranch))

        let newBranchName = VersionStringTransformer().nextBranchName(currentBranch)
        gitUtility.createBranchNamed(newBranchName)
        gitUtility.switchToBranchNamed(newBranchName)

        let oldBranchName = currentBranch
        gitUtility.deleteBranchNamed(oldBranchName)

        bumpBuildVersionNumber()

        print("\nCurrently the script only places a tag in the repo")
        print("Things on the list to implement:")
        print("\t- missing unit tests")
        print("\t- abort execution if there are local changes in the repo (you don't want to release if there are some local changes!)")
        print("\t- automatically make a commit updating version number in the info.plist file")
        print("\t- print more verbose information about what's happening behind the scenes")
    }
}
main();
