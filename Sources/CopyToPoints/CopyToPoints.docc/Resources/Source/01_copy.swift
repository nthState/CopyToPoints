import SwiftUI

struct ExampleSwiftUIView {}

extension ExampleSwiftUIView: View {
  
  var body: some View {
    content
  }
  
  var rectangle: some View {
    Rectangle()
      .fill(Color.yellow)
      .frame(width: 100, height: 100)
  }
}
