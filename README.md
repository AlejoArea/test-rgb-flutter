# test-rgb-flutter
 Code base for test task to generate random colors when clicking anywhere on the app

# Decisions taken while developing
- folder structure for better separation of concerns (Model/States/UI)
- state management for changing the colors with value notifier
- use Random Class from dart:math for random numbers
- Used a Provider(based on InheritedNotifier) in the root of the project so the notifier is exposed
  to the widget tree and accessed via Provider.of<RandomColorNotifier>(context), instead of passing 
  it down through constructors. Keeping rebuilds at the minimum by consuming the provider only in the 
  widgets that depend on the color. In this example HelloText does not rebuild.
- As provider is related to the state management it lives on /states folder.
- Added a gesture detector for the app bar too as the request of changing color when "tapping anywhere on the screen"
- Added a widget to show each numeric value and its specific color.
- Created specific widget to avoid repeating the exact code (TextCard widget).
- I started with a row for the current RGB widget but then I realized that I wanted it to be responsive to use it on mobile too
  and for different screen sizes or changing screen sizes like desktop.
- Added tests for the model, for the state, and for the widgets. One issue I found here while testing MyApp 
  was accessing the correct ColoredBox to validate that the color changes, the solution with less friction I went for 
  was to add a Key for ColorBody widget.



# Documentation consulted while developing this
- https://api.flutter.dev/flutter/dart-math/Random-class.html
- https://www.hungrimind.com/articles/flutter-state-management (from https://docs.flutter.dev/data-and-backend/state-mgmt/options)
- https://api.flutter.dev/flutter/foundation/ValueNotifier-class.html
