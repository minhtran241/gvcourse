<p align="center">
  <img src="https://github.com/minhtran241/gvcourses/blob/main/screenshots/swiftui2.png" alt="SwiftUI" width="800" height="530">
</p>

Welcome to the SwiftUI tutorial! In this guide, we'll dive into the world of SwiftUI, Apple's modern UI framework, as we embark on the journey to build a comprehensive application—GVCourse.

# What is SwiftUI?

SwiftUI is a declarative UI framework built with the Swift programming language. While SwiftUI is a relatively new framework, it is built on top of Swift, which has been around for a while. If you are new to Swift, consider going through the [official Swift tutorials](https://developer.apple.com/tutorials/swiftui) to get familiar with the basics.

# Why SwiftUI?

SwiftUI is a powerful framework that allows developers to build sophisticated and visually appealing user interfaces with significantly less boilerplate code. SwiftUI's declarative syntax empowers developers to focus on the *what* rather than the *how* of UI creation, fostering a more user-friendly and efficient approach to UI development. SwiftUI also offers a wide range of features such as data binding, seamless integration, and cross-platform capabilities that make it a great choice for building modern applications. From my experience with other UI frameworks, I find SwiftUI to be quite intuitive and easy to use. I hope that you will find it to be the same.

# GVCourse App

GVCourse serves as a centralized hub for exploring all the courses and information offered by Grand Valley State University. The motivation behind developing the GVCourse application stems from the observation that, at Grand Valley State University school of Computing, the dissemination of information about new courses often relies on social platforms like Discord or email. While these methods are effective, occasional oversight occurs as Discord messages may go unnoticed, and a barrage of emails can lead to missed announcements. In response, GVCourse offers a streamlined solution, providing users with a centralized platform to access information about both new and existing courses.

## Course Catalog with Search and Filter

The course catalog is a list of courses offered by Grand Valley State University that users can search and filter. When users type in the search bar, the list is updated in real-time to display courses that match the search query. User can explore details about a course by tapping on the card.

## Course News and Announcements

Every information relating to course (new courses, course changes, etc.) is displayed in the course news and announcements section. The course news and announcements section is updated in real-time, ensuring that users are always up to date with the latest information. Users can read the full article by tapping on the card. Here is also the place to present posters for new courses.

## Authentication

The authentication feature allows users to create accounts and log in using third-party authentication services like Google. Users can also log out of their accounts.

# GVCourse App Screenshots

## Authentication

Sign In | Sign Up
--- | ---
![Sign In](https://github.com/minhtran241/gvcourses/blob/main/screenshots/signin.png) | ![Sign Up](https://github.com/minhtran241/gvcourses/blob/main/screenshots/signup.png)

## Course News and Announcements

News List | News Details
--- | ---
![News List](https://github.com/minhtran241/gvcourses/blob/main/screenshots/news_list.png) | ![News Details](https://github.com/minhtran241/gvcourses/blob/main/screenshots/news_details.png)

## Course Catalog

Courses List | Course Details
--- | ---
![Courses List](https://github.com/minhtran241/gvcourses/blob/main/screenshots/courses_list.png) | ![Course Details](https://github.com/minhtran241/gvcourses/blob/main/screenshots/course_details.png)

## Settings

<!-- ![Settings](https://github.com/minhtran241/gvcourses/blob/main/screenshots/settings.png) -->
<p align="center">
  <img src="https://github.com/minhtran241/gvcourses/blob/main/screenshots/settings.png" alt="Settings">
</p>

**Demo Video:**

<https://github.com/minhtran241/gvcourse/assets/98200886/21a407cf-9d93-47dd-b627-b46187c47ac8>

# Why GVCourse is a Great Example of a SwiftUI App?

GVCourse utilizes many of SwiftUI's features to create a seamless user experience. For example, the course catalog is a list of courses that users can search and filter. SwiftUI's data binding feature allows us to update the list in real-time as users type in the search bar. SwiftUI also offers a wide range of UI components that we can use to build the GVCourse app. For example, we can use the `List` component to display the course catalog.

Throughout the tutorial, we'll leverage SwiftUI's powerful features such as declarative UI, data binding, and seamless integration to bring the GVCourse app to life. Screenshots and code snippets will be seamlessly integrated to enhance your understanding of the app's functionality, making this tutorial an immersive learning experience.
