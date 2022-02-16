import SwiftUI

struct ExampleSwiftUIView {}

extension ExampleSwiftUIView: View {
  
  var body: some View {
    content
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
}
