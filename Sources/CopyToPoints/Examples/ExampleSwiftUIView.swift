//
//  ExampleSwiftUIView.swift
//  CopyToPoints
//
//  Copyright © 2022 Chris Davis, https://www.nthState.com
//
//  See https://github.com/nthState/CopyToPoints/blob/master/LICENSE for license information.
//

import SwiftUI

struct ExampleSwiftUIView {}

extension ExampleSwiftUIView: View {
  
  var body: some View {
    VStack(spacing: 24) {
      rectangle
      triangle
      circle
    }
  }
  
  var rectangle: some View {
    Rectangle()
      .copyToPoints { index, point in
        
        let scaled = point * CGSize(width: 100, height: 100)
        
        Circle()
          .fill(index % 2 == 0 ? Color.blue : Color.red)
          .frame(width: 15, height: 15)
          .position(scaled)
      }
      .frame(width: 100, height: 100)
      .background(Color.yellow)
  }
  
  var triangle: some View {
    ZStack {
      
      Triangle()
        .fill(Color.yellow)
        .frame(width: 100, height: 100)
      
      Triangle()
        .copyToPoints { index, point in
          
          let scaled = point * CGSize(width: 100, height: 100)
          
          Circle()
            .fill(index % 2 == 0 ? Color.blue : Color.red)
            .frame(width: 15, height: 15)
            .position(scaled)
        }
        .frame(width: 100, height: 100)
    }
   
  }
  
  var circle: some View {
    ZStack {
      
      Circle()
        .fill(Color.yellow)
        .frame(width: 100, height: 100)
      
      Circle()
        .copyToPoints { index, point in
          
          let scaled = point * CGSize(width: 100, height: 100)
          
          Circle()
            .fill(index % 2 == 0 ? Color.blue : Color.red)
            .frame(width: 15, height: 15)
            .position(scaled)
        }
        .frame(width: 100, height: 100)
    }
   
  }
  
}

#if DEBUG

struct ExampleSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
      ExampleSwiftUIView()
    }
}

#endif
