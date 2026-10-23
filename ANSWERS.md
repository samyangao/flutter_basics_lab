
# IT 120 Flutter Lab — Answers

**Subject:** IT 120 — Integrative Programming and Technologies 2  
**Project:** Flutter Architecture, Widgets and Basic UI

**Student Name:** Sam C. Yangao  
**Student ID:** 241-01803  
**Section:** 3 B1 ILDV3

---

## 1. GitHub Repository

**Repository Link:** (https://github.com/samyangao/flutter_basics_lab.git)

Repository name: `flutter_basics_lab`

---

## 2. Activity 2 — Debug Console Output

Copy the last three actual `build() called` lines from the VS Code Debug Console below.

build() called
build() called
build() called

---

## 3. Experiment Observations

### Activity 2 — Changing `_glasses` Outside `setState()`

When I moved `_glasses++` outside the `setState()` callback but still called `setState(() {})`, the counter continued to update because the empty `setState()` callback still triggered a rebuild. If I changed `_glasses` without calling `setState()`, the displayed interface would not automatically rebuild to reflect the new value.

### Activity 3 — Removing `Expanded`

When I removed `Expanded` from one `StatBox`, that box no longer shared the available row width equally with the other expanded boxes. Its width depended more on its contents, which could make the layout uneven or cause overflow on a narrow screen. Restoring `Expanded` allowed the boxes to share the available horizontal space.

### Activity 4 — Changing `crossAxisCount`

When I changed `crossAxisCount` from 2 to 3, the menu displayed three columns instead of two. Each card became narrower because more cards shared the available width. I restored the value to 2 for the final layout.

### Activity 5 — Changing the Button Corner Radius

I changed the button corner radius from 8 to 20 in `buildTheme()`. The button became more rounded. This demonstrates how changing a theme setting can affect the appearance of a UI component.

---

## 4. Review Questions and Answers

### 1. What is the difference between a StatelessWidget and a StatefulWidget? Give one example of each from this lab.

A `StatelessWidget` displays content that does not manage changing state within itself. A `StatefulWidget` is used when the interface needs to respond to changing data. The Profile Card is an example of a stateless interface, while the Water Tracker uses a `StatefulWidget` because its glass count changes when buttons are pressed.

### 2. Why is a StatefulWidget written as two classes? What does each class do?

A `StatefulWidget` uses two classes to separate the widget's configuration from its changing state. The widget class creates the state object, while the `State` class stores the changing values and builds the interface. For example, `_WaterTrackerPageState` stores `_glasses` and updates the screen.

### 3. In Activity 2, what happened when you changed `_glasses` outside `setState()`? Why?

When I moved `_glasses++` outside the callback but still called `setState(() {})`, the interface continued to update because `setState()` triggered a rebuild. If I changed `_glasses` without calling `setState()`, Flutter would not automatically know that it needed to rebuild the interface.

### 4. Looking at the Debug Console in Activity 2, when is `build()` called?

The `build()` method is called when Flutter first creates the interface and may be called again when a state change or another framework update requires a rebuild. In the Water Tracker, calling `setState()` after changing the glass count causes the interface to rebuild.

### 5. Explain the main axis and the cross axis of a Row and of a Column.

For a `Row`, the main axis is horizontal and the cross axis is vertical. For a `Column`, the main axis is vertical and the cross axis is horizontal. These axes determine how widgets are aligned and spaced.

### 6. In Activity 3, what happened when you removed Expanded from a StatBox? What does Expanded do?

Without `Expanded`, the affected `StatBox` no longer shared the available row width equally with the other expanded boxes. `Expanded` allows a child of a `Row` or `Column` to take a proportional share of the remaining available space.

### 7. Why do we use GridView.builder for the menu instead of a Column with many children?

`GridView.builder` arranges items in a grid and builds items as they are needed for display. This is useful for a menu with multiple items because it supports scrolling and avoids building every item in a long list at once. A `Column` simply arranges its children vertically and does not provide the same grid layout or built-in scrolling behavior.

### 8. How do Stack and Positioned create the Best seller badge in Activity 4?

`Stack` allows widgets to overlap. `Positioned` places a widget at a specified location within the stack, such as the top-left corner of a menu card. Together, they can place a Best seller badge over the menu item without moving the main item content.

### 9. What is the difference between customizing with ThemeData and with a style on one widget? Give one example of each from Activity 5.

`ThemeData` configures the overall appearance of an app and can influence multiple widgets. A widget-specific style customizes an individual component. In Activity 5, `buildTheme()` sets the button corner radius through `elevatedButtonTheme`, while the `TextStyle` of a particular text widget can customize that text's font size or weight.

### 10. When you flip the dark-mode switch in Activity 5, which widget holds the state, and how does the change reach MaterialApp?

The `_SettingsAppState` class holds the `_darkMode` boolean. When the switch changes, its callback updates the value using `setState()`. Flutter rebuilds the app, and `MaterialApp` receives the updated theme configuration so the page can change between light and dark appearance.

---

## 5. Final Submission Checklist

- [ ] `student.dart` contains my correct student details.
- [ ] All five activity files are saved in `lib/`.
- [ ] All five activities run without errors.
- [ ] All seven required screenshots are saved in `screenshots/`.
- [ ] The actual last three Debug Console lines are recorded above.
- [ ] The experiment observations are complete.
- [ ] All ten review questions are answered.
- [ ] The GitHub repository link is added.
- [ ] The project is pushed to GitHub.
- [ ] The final ZIP file follows `SECTION_LASTNAME_FIRSTNAME.zip`.