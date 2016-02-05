import Foundation

struct VersionStringTransformer {
  func nextBranchName(branchName: String) -> String {
    return nextMajorMinorInternalVersion(branchName, separator: "_")
  }
  
  func nextBuildVersionNumber(version: String) -> String {
    return nextMajorMinorInternalVersion(version, separator: ".")
  }
  
  // MARK: private
  
  private func nextMajorMinorInternalVersion(version: String, separator: Character) -> String {
    assert(version.characters.count > 0)
    
    var nextVersionString = version
    var versionComponents = version.stringByTrimmingWhitespaceAndNewline().characters.split{$0 == separator}.map(String.init)
    
    if let lastVersionComponent = versionComponents.last {
      let lastNumber = Int(lastVersionComponent)
      
      if let safeLastNumber = lastNumber {
        let nextVersionNumber = Int(safeLastNumber + 1)
        
        let lastIndex = (versionComponents.count - 1)
        versionComponents[lastIndex] = String(nextVersionNumber)
      }
      nextVersionString = versionComponents.joinWithSeparator(String(separator))
    }
    return nextVersionString
  }
}