Before we begin building our GVCourse app, let's ensure your development environment is set up correctly.

# Software Requirements

## macOS

SwiftUI requires macOS 10.15 Catalina or later. To check your macOS version, click the Apple icon in the top left corner of your screen and select **About This Mac**.

<p align="center">
  <img src="screenshots/catalina.png" alt="Catalina" width="200" height="200">
</p>

## Xcode and Simulator

Install the latest version of Xcode from the [Mac App Store](https://apps.apple.com/us/app/xcode/id497799835?mt=12).

Simulator is a tool that allows you to run your app on a virtual device. To open Simulator, open Xcode and select **Xcode** > **Open Developer Tool** > **Simulator**.

<p align="center">
  <img src="https://github.com/minhtran241/gvcourses/blob/main/screenshots/xcode_icon.png" alt="Xcode" width="200" height="200">
  <img src="https://github.com/minhtran241/gvcourses/blob/main/screenshots/simulator.png" alt="Simulator" width="200" height="200">
</p>

## SF Symbols

SF Symbols is a set of over 3,100 symbols that you can use in your app. To install SF Symbols, open Xcode and select **File** > **Swift Packages** > **Add Package Dependency**. In the search bar, type *"SF Symbols"* and click **Next**. Select the latest version and click **Next**. Finally, click **Finish**.

<p align="center">
  <img src="https://github.com/minhtran241/gvcourses/blob/main/screenshots/sf_icon.png" alt="SFSymbols" width="200" height="200">
</p>

In this tutorial, we will use SF Symbols to display icons in our app. For example, we will use the following code snippet to display a user icon:

```swift
Image(systemName: "person.circle")
```
