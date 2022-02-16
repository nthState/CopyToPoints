# Chris's SwiftUI Copy To Points

If you've ever used an amazing piece of software called [Houdini](https://www.sidefx.com), you may
know about a control node that can take in a list of points, and then for
each point, perform an action. In this case we'll copy a `View` to points
on a shape

```
import CopyToPoints
import SwiftUI

struct SwiftUIView {}

extension SwiftUIView: View {
  
  var body: some View {
    Rectangle()
      .copyToPoints { index, point in
        Circle()
          .frame(width: 5, height: 5)
          .position(point)
      }
  }
  
}

struct SwiftUIView_Previews: PreviewProvider {
  static var previews: some View {
    SwiftUIView()
  }
}

```

I also provide an extension

```
public extension Shape {
  
  func copyToPoints<ContentToCopy>(@ViewBuilder contentToCopy: @escaping (Int, CGPoint) -> ContentToCopy) -> some View where ContentToCopy: View {
    modifier(CopyToPoints(shape: self, contentToCopy: contentToCopy))
  }
  
}
```
