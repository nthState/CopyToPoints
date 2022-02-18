//
//  CGPoint+.swift
//  CopyToPoints
//
//  Copyright © 2022 Chris Davis, https://www.nthState.com
//
//  See https://github.com/nthState/CopyToPoints/blob/main/LICENSE for license information.
//

import CoreGraphics

public extension CGPoint {

  static func * (point: CGPoint, size: CGSize) -> CGPoint {
    return CGPoint(x: point.x * size.width, y: point.y * size.height)
  }
  
}
