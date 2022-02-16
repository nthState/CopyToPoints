//
//  PathExtensionTests.swift
//  CopyToPoints
//
//  Copyright © 2022 Chris Davis, https://www.nthState.com
//
//  See https://github.com/nthState/CopyToPoints/blob/master/LICENSE for license information.
//


import XCTest
import SwiftUI
@testable import CopyToPoints

final class PathExtensionTests: XCTestCase {
  
  func test_path_returns_indexed_results() throws {
    
    let shape = Rectangle()
    let path = shape.path(in: .unit)
    
    let actual = path.indexedSegmentPoints
    let expected = [PointContainer(id: 0, point: .zero),
                    PointContainer(id: 1, point: CGPoint(x: 1, y: 0)),
                    PointContainer(id: 2, point: CGPoint(x: 1, y: 1)),
                    PointContainer(id: 3, point: CGPoint(x: 0, y: 1)),]
    
    XCTAssertEqual(actual, expected, "Elements should match")
  }
  
}

extension PointContainer: Equatable {
  public static func == (lhs: PointContainer, rhs: PointContainer) -> Bool {
    lhs.id == rhs.id && lhs.point == rhs.point
  }
}
