<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages).
-->

Swiftify brings the simplicity and elegance of SwiftUI's modifier-style syntax to Flutter! With Swiftify, you can create beautiful UIs with cleaner and more readable code by using chainable, declarative methods to modify widgets.
## Features

SwiftUI-like Modifiers: Apply common widget properties (e.g., padding, textstyles etc) with intuitive .modifier() methods.
Chainable Methods: Combine multiple modifications into a single statement for a clean and declarative style.
Cleaner Codebase: Reduce widget nesting and improve code readability.
Support for Common Widgets: Includes extensions for Text and more.

```dart
"Hello World"
    .txt
    .bold()
    .fontSize(16)
    .color(Colors.blue)
    .align(TextAlign.center)
    .ellipsis()
    .build();

Image.asset('assets/person.png')
    .respectSafeArea()
```

## Getting started

To start using Swiftify, add the package to your Flutter project.

```dart
dependencies:
  swiftify: ^1.4.0
```

Run flutter pub get to fetch the package.

Import the package in your Dart file:

```dart
import 'package:swiftify/swiftify.dart';
```
## Usage
Text Modifier Example
```dart
"Hello World"
    .txt
    .bold()
    .fontSize(16)
    .color(Colors.blue)
    .align(TextAlign.center)
    .ellipsis()
    .build()
    .onGesture(
        onTap() => print("Hello world"),
    );
```

List Modifier Example
```dart
final values = ["Hello", "World"];

values.asListViewBuilder(
    itemBuilder: (BuildContext context, int index, dynamic item) {
        return const SizedBox();
    },
);
```

## Additional information

Contributing: Contributions are welcome! Feel free to open issues or submit pull requests on GitHub.
