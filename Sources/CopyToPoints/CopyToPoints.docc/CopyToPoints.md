# ``CopyToPoints``

Copp to Points, will call it's viewbuilder with an index/point that indicate the position of a joint on a path.
THe result is you can place views at the joints along a path.

## Overview

```
import CopyToPoints
import SwiftUI

struct SwiftUIView {}

extension SwiftUIView: View {
  
  var body: some View {
    Rectangle()
      .copyToPoints { index, point in
        Circle()
          .fill(Color.blue)
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


## Topics

### Group

- ``CopyToPoints/CopyToPoints``
