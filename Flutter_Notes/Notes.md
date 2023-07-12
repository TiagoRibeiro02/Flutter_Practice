Flutter run in both systems.

[[Widgets]] are the core of Flutter.

The `runApp()` function takes the given [[Widgets]] and makes it the root of the widget tree.

Many Material Design widgets need to be inside of a [`MaterialApp`](https://api.flutter.dev/flutter/material/MaterialApp-class.html) to display properly, in order to inherit theme data. Therefore, run the application with a `MaterialApp`.