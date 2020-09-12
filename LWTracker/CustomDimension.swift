import Foundation

/// For more information on custom dimensions visit https://LW.org/docs/custom-dimensions/
public struct CustomDimension: Codable {
    /// The index of the dimension. A dimension with this index must be setup in the LW backend.
    let index: Int
    
    /// The value you want to set for this dimension.
    let value: String
    
    public init(index: Int, value: String) {
      self.index = index
      self.value = value
    }
}
