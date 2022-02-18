//
//  CopyToPoints.swift
//  CopyToPoints
//
//  Copyright © 2022 Chris Davis, https://www.nthState.com
//
//  See https://github.com/nthState/CopyToPoints/blob/main/LICENSE for license information.
//

import SwiftUI

public extension Shape {
  
  func copyToPoints<ContentToCopy>(@ViewBuilder contentToCopy: @escaping (Int, CGPoint) -> ContentToCopy) -> some View where ContentToCopy: View {
    modifier(CopyToPoints(shape: self, contentToCopy: contentToCopy))
  }
  
}

/// Copy a view to each Path Joint 
public struct CopyToPoints<S, NewContent>: ViewModifier, ShapeStyle where S: Shape, NewContent: View {
  
  private let path: Path
  private let innerContent: (Int, CGPoint) -> NewContent
  
  public init(shape: S, @ViewBuilder contentToCopy: @escaping (Int, CGPoint) -> NewContent) {
    self.path = shape.path(in: CGRect.unit)
    self.innerContent = contentToCopy
  }
  
  public func body(content: Content) -> some View {
    
    let points = path.indexedSegmentPoints
    
    ZStack {
      ForEach(points) { item in
        innerContent(item.id, item.point)
      }
    }
    
  }
}
