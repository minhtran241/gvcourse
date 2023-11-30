
Let's discuss further about the advantages and disadvantages of SwiftUI and alternative approaches.

# Performance

SwiftUI uses a technologies called [Metal](https://developer.apple.com/metal/) to render the UI, which makes the UI more performant. The most important thing is that **SwiftUI's rendering engine efficiently updates only the parts of the UI that have changed, reducing unnecessary work**. This is a huge improvement over UIKit, which being older, has a lot of legacy code that is not optimized for performance.

# Third party components

Because SwiftUI is quite new, there are not many third party components available compared to UIKit. However, it is still growing rapidly.

# Use cases

SwiftUI is recommended for:

- New projects that target the latest iOS and macOS versions.

- Prototyping and quickly creating user interfaces.

- Cross-platform development, including Apple Watch and Apple TV.

- Developers who prefer a declarative and Swift-based approach.

# Alternative approaches

[SwiftUIX](https://github.com/SwiftUIX/SwiftUIX) is an open source library of extensions to the standard SwiftUI library. It provides developers with a set of components to help them build apps faster. It is a great alternative approach to implement the same functionality.

# Related platform features

SwiftUI is a framework that provides views, controls, and layout structures for declaring your app's user interface. The framework provides event handlers for delivering taps, gestures, and other types of input to your app. SwiftUI also provides APIs for managing your app's user interface in different ways, such as adapting the layout to different platforms, displaying different UI elements based on the size of the screen, and localizing your app's interface into different languages.

# Conclusion

In this tutorial, we have explored how to implement the GVCourse app using SwiftUI. We have explored the basic concepts in SwiftUI, how to build the views, how to build the models, how to interact with the database, how to implement authentication, how to navigate between views, and how to implement search functionality. If you have any questions, feel free to reach out to me at [my email](mailto:tranmq@mail.gvsu.edu). Thank you for reading!

Source code can be found [here](https://github.com/minhtran241/gvcourses).
