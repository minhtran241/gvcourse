Before we begin building our GVCourse app, let's ensure your development environment is set up correctly.

# Software Requirements

## macOS

SwiftUI requires macOS 10.15 Catalina or later. To check your macOS version, click the Apple icon in the top left corner of your screen and select **About This Mac**.

## Xcode

Install the latest version of Xcode from the [Mac App Store](https://apps.apple.com/us/app/xcode/id497799835?mt=12).

# Basic Knowledge of Swift

SwiftUI is a declarative UI framework built with the Swift programming language. While SwiftUI is a relatively new framework, it is built on top of Swift, which has been around for a while. If you are new to Swift, consider going through the [official Swift tutorials](https://developer.apple.com/tutorials/swiftui) to get familiar with the basics.

# Basic Knowledge of SwiftUI

## Main components

SwiftUI is built with three main components: **Views**, **Modifiers** and **State**.

### Views

#### View protocol

Views are the building blocks of your app's UI. In SwiftUI, a view is a struct that conforms to the View protocol. For example, the following code snippet defines a view that displays a text:

```swift
struct CourseRowView: View {
    // Properties declaration goes here...
    
    var body: some View {
  // View body goes here...
  Text("Course Row View")
    }
}
```

#### HSack, VStack and ZStack

One of the mose common concepts in SwiftUI is HStack, VStack and ZStack. So let's explore them in more detail.

**HStack**: HStack is a view container that arranges its child views in a horizontal line

```swift
HStack {
    Text(name).foregroundStyle(.black)
    Text(title).foregroundStyle(.gray)
}
```

As you can see in the code snippet above, we use HStack to arrange the course name and course title in a horizontal line. We can also group multiple views together using Group:

```swift
HStack {
    Text(name).foregroundStyle(.black)
    Group {
        Text(title).foregroundStyle(.gray) +
        Text("(\(credits))").foregroundColor(Color(.brandPrimary))
    }
}
```

**VStack**: VStack is a view container that arranges its child views in a vertical line

```swift
VStack(alignment: .leading, spacing: 5) {
    Text(news.title!)
    Text(news.createdAt!, style: .date)
}
```

As you can see in the code snippet above, we use VStack to arrange the news title and news creation date in a vertical line.

**ZStack**: ZStack is a view container that arranges its child views in a Z-axis, which means the views are stacked on top of each other.

```swift
ZStack {
 Image(uiImage: UIImage(data: news.image!)!)
  .resizable()
  .aspectRatio(contentMode: .fill)
  .frame(width: 100, height: 100)
  .cornerRadius(10)
 Text(news.title!)
  .font(.title3)
  .fontWeight(.bold)
  .foregroundColor(.white)
}
```

As you can see in the code snippet above, we use ZStack to stack the news image and news title on top of each other.

We can also use one of the view containers inside another view container, for example, we can use VStack inside HStack:

```swift
HStack {
 VStack(alignment: .leading, spacing: 5) {
  Text(news.title!)
  Text(news.createdAt!, style: .date)
 }
 Spacer()
 Image(uiImage: UIImage(data: news.image!)!)
  .resizable()
  .aspectRatio(contentMode: .fill)
  .frame(width: 100, height: 100)
  .cornerRadius(10)
}
```

### Modifiers

#### View modifiers

In SwiftUI, we can use modifiers to style the views. For example, we can use *foregroundStyle* to change the text color:

```swift
Text(name).foregroundStyle(.black)
```

We also can chain multiple modifiers together:

```swift
Text(title).foregroundStyle(.gray).font(.title3)
```

In order to know what modifiers are available for a view, we can use Xcode's code completion feature. For example, if we want to know what modifiers are available for Text view, we can type *"Text."* and Xcode will show a list of available modifiers:

![Styling in SwiftUI](https://github.com/minhtran241/gvcourses/blob/main/screenshots/styling.png)

### State

In SwiftUI, we can use state to store the state of a view. The concept of state in SwiftUI is quite similar to the concept of state in React. For example, we can use *@State* to store the state of a text field:

```Swift
@State var name: String = ""
```

#### Property wrappers

In SwiftUI, we can use property wrappers to store the state of a view. There are many property wrappers available in SwiftUI, in this tutorial, we will use *@State*, *@Binding*, *@EnvironmentObject* and *@Published*. Let's explore when to use each property wrapper:

**@State**: when your view needs to mutate one of its own properties.

```swift
@State var name: String = ""
```

**@Binding**: when your view needs to mutate a property owned by an ancestor view, or owned by an observable object that an ancestor has a reference to, you should use *@Binding*. For example, we can use *@Binding* to bind the state of a boolean to a variable:

```swift
@Binding var isBeingPresented: Bool
```

**@EnvironmentObject**: when it would be too cumbersome to pass an observable object through all the initializers of all your view’s ancestors. For example, we can use *@EnvironmentObject* to pass the CourseStore to all the views:

```swift
@EnvironmentObject var store: CourseStore
```

**@Published**: when you want to observe changes to a property of an observable object.

```swift
@Published var courseList: [Course] = []
```

That's it for all the basic concepts in SwiftUI that we will use in this tutorial to build the GVCourse app. If you want to learn more about SwiftUI, you can check out the [official SwiftUI documentation](https://developer.apple.com/documentation/swiftui). Apple also provides a [great tutorial](https://developer.apple.com/tutorials/swiftui) to get started with SwiftUI. Now let's start building the GVCourse app!
