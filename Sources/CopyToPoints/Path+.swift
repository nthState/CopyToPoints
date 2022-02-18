//
//  Path+.swift
//  CopyToPoints
//
//  Copyright © 2022 Chris Davis, https://www.nthState.com
//
//  See https://github.com/nthState/CopyToPoints/blob/main/LICENSE for license information.
//

import SwiftUI

/// Container to hold an index and point
internal struct PointContainer: Identifiable {
  let id: Int
  let point: CGPoint
}

internal extension Path {
  
  /// Returns a list of indexed points
  var indexedSegmentPoints: [PointContainer] {
    var points: [PointContainer] = []
    var counter = 0
    self.forEach { Element in
      switch Element {
      case .move(to: let to):
        points.append(PointContainer(id: counter, point: to))
        counter += 1
      case .line(to: let to):
        points.append(PointContainer(id: counter, point: to))
        counter += 1
      case .quadCurve(to: let to, control: _):
        points.append(PointContainer(id: counter, point: to))
        counter += 1
      case .curve(to: let to, control1: _, control2: _):
        points.append(PointContainer(id: counter, point: to))
        counter += 1
      case .closeSubpath:
        break
      }
    }
    return points
  }
  
}
