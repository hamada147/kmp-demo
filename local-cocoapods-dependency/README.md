# Using Local Cocopads as iOS Dependency

Demo project for using local cocopads as iOS dependency

## Make sure of the following

* `Java` version as 1.8
* `Gradle` version 7.4.2
* `Kotlin` version 1.8.0

## Tips for iOS project

* To make a class, method, function, variable, etc available in KMP through the iOS you need two things:
  * Have `@objc` annotation
  * Have them as `public`
* You can have as many functions, classes, variables as you want then use one class like the one in the demo project as a wrapper for all your functionalities
