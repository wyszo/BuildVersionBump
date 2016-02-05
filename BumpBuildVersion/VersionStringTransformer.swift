import Foundation

struct VersionStringTransformer {
  func nextBranchName(branchName: String) -> String {
    return nextMajorMinorInternalVersion(branchName, separator: "_")
  }
  
  func nextBuildVersionNumber(version: String) -> String {
    return nextMajorMinorInternalVersion(version, separator: ".")
  }
  
  // MARK: private
  
  private func nextMajorMinorInternalVersion(previousVersion: String, separator: Character) -> String {
    assert(previousVersion.characters.count > 0)
    
    func componentsOfString(string : String, withSeparator separator: Character) -> [String] {
      return string.characters.split{$0 == separator}.map(String.init)
    }
    
    func componentsByIncrementingLastComponentValue(var components: [String]) -> [String] {
      if let lastComponent = components.last {
        if let lastNumber = Int(lastComponent) {
          let incrementedNumber = Int(lastNumber + 1)
          let lastIndex = (components.count - 1)
          
          components[lastIndex] = String(incrementedNumber)
        }
      }
      return components
    }
    
    let versionComponents = componentsOfString(previousVersion.stringByTrimmingWhitespaceAndNewline(), withSeparator: separator)
    if versionComponents.count > 0 {
      return componentsByIncrementingLastComponentValue(versionComponents).joinWithSeparator(String(separator))
    }
    return previousVersion
  }
}