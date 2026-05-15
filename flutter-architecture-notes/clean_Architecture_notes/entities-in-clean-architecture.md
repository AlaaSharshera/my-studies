# Entity Should Not Contain Flutter UI Types

```dart
import 'package:flutter/material.dart';

/// ❌ Bad Example
///
/// The problem here is that the entity contains a Widget (`destinationSheet`),
/// which makes the Domain layer depend on Flutter UI.
class FilterEntity {
  final String title;

  /// The bottom sheet or screen to open when the user taps this filter.
  ///
  /// ❌ Wrong:
  /// Domain entities should not know anything about Flutter Widgets.
  final Widget destinationSheet;

  const FilterEntity({
    required this.title,
    required this.destinationSheet,
  });
}
```

> **An Entity should not contain any `Widget` or any Flutter UI type.**

The reason:

> **An Entity represents business data and business rules, not the UI.**

---

## What is an Entity?

An Entity is a class that contains the core data and rules of your application.

Example:

```dart
class User {
  final int id;
  final String name;
  final String email;

  const User({
    required this.id,
    required this.name,
    required this.email,
  });
}
```

This class knows nothing about:

* `Widget`
* `BuildContext`
* `Color`
* `Navigator`
* `TextStyle`

---

## Why Shouldn't We Put a Widget Inside an Entity?

If we do this:

```dart
class MenuItemEntity {
  final String title;
  final Widget screen;
}
```

Then the Entity becomes directly tied to Flutter UI.

This breaks several important principles.

---

## 1. Single Responsibility Principle (SRP)

The Entity is responsible for:

* Holding business data.

It is **not** responsible for:

* Deciding which screen to open.

---

## 2. Dependency Rule in Clean Architecture

Dependencies should point inward:

```text
Presentation → Domain ← Data
```

This means the Domain layer (where Entities live) should not depend on Flutter.

But `Widget` comes from Flutter (`package:flutter/widgets.dart`).

So if you use `Widget` inside an Entity, the Domain layer now depends on the UI framework.

---

## 3. Reusability

Entities should be reusable in:

* Flutter apps
* Web apps
* Backend applications
* Unit tests

If an Entity contains a `Widget`, it can only be used in Flutter.

---

## 4. Testability

Entities that contain only simple data are easier to test.

---

## Correct Design

```dart
class SettingItem {
  final String id;
  final String title;

  const SettingItem({
    required this.id,
    required this.title,
  });
}
```

In the Presentation layer:

```dart
Widget buildPage(SettingItem item) {
  switch (item.id) {
    case 'profile':
      return ProfileScreen();
    case 'settings':
      return SettingsScreen();
    default:
      return const SizedBox();
  }
}
```

---

## Why Is This Better?

The Entity says:

> "I am an item with title `Profile` and id `profile`."

The UI says:

> "If the id is `profile`, open `ProfileScreen`."

Each layer has one clear responsibility.

---

## Real API Example

The backend usually returns data like this:

```json
{
  "id": "profile",
  "title": "Profile"
}
```

The backend sends data only. It does not send Widgets.

---

## What If You Need to Know Which Screen to Open?

Store simple values such as:

* `id`
* `routeName`
* `type`
* `action`

Example:

```dart
class MenuItemEntity {
  final String title;
  final String route;
}
```

In the UI:

```dart
Navigator.pushNamed(context, item.route);
```

`route` is just a string, not a UI object.

---

## Is `routeName` Allowed in an Entity?

Yes, because:

```dart
final String route;
```

is just data.

But:

```dart
final Widget page;
```

is a UI object.

---

## Important Rule

> If your Entity needs this import:
>
> ```dart
> import 'package:flutter/...';
> ```
>
> then the design is probably wrong.

---

## Professional Project Structure

```text
Entity
  ↓
UI Mapper
  ↓
Widget
```

---

## Professional Example

```dart
class BottomNavItemEntity {
  final String id;
  final String label;
}
```

```dart
class BottomNavMapper {
  static Widget buildScreen(String id) {
    switch (id) {
      case 'home':
        return HomeScreen();
      case 'profile':
        return ProfileScreen();
      default:
        return const SizedBox();
    }
  }
}
```

---

## Trusted Resources

### Clean Architecture by Robert C. Martin

Core idea:

> “Entities encapsulate enterprise-wide business rules.”

This means Entities contain business rules only and know nothing about UI or data storage.

### Official Article

[Clean Architecture by Robert C. Martin](https://blog.cleancoder.com/uncle-bob/2011/11/22/Clean-Architecture.html?utm_source=chatgpt.com)

### Flutter Official Guide

[Flutter App Architecture Guide](https://docs.flutter.dev/app-architecture?utm_source=chatgpt.com)

---

## Golden Rule

> **Entity = Pure Dart Object**

It should not contain:

* Widget
* BuildContext
* Color
* ThemeData
* Navigator
* Dio
* SharedPreferences

---

# What If the Backend Returns `status` and `color`?

Sometimes the backend sends data like this:

```json
{
  "status": "Completed",
  "color": "#4CAF50"
}
```

Even in this case, the Entity should not contain Flutter's `Color` type.

---

## Correct Approach

Store the color as raw data:

```dart
class StatusEntity {
  final String status;
  final String colorHex;

  const StatusEntity({
    required this.status,
    required this.colorHex,
  });
}
```

Here:

* `status` is the status text.
* `colorHex` is a simple string such as `#4CAF50`.

---

## Convert to `Color` in the Presentation Layer

```dart
import 'package:flutter/material.dart';

Color parseColor(String hex) {
  final value = hex.replaceFirst('#', '');
  return Color(int.parse('FF$value', radix: 16));
}
```

Usage in UI:

```dart
Container(
  color: parseColor(status.colorHex),
  child: Text(status.status),
)
```

---

## Why Is This Better?

Because `Color` is a Flutter type.

The Entity should stay independent and reusable in:

* Unit tests
* Backend code
* Console applications
* Any Dart project

---

## Real Example

### API Response

```json
{
  "status": "Completed",
  "color": "#4CAF50"
}
```

### Model

```dart
class StatusModel {
  final String status;
  final String color;

  StatusEntity toEntity() {
    return StatusEntity(
      status: status,
      colorHex: color,
    );
  }
}
```

### Entity

```dart
class StatusEntity {
  final String status;
  final String colorHex;
}
```

### UI

```dart
final color = parseColor(status.colorHex);
```

---

## Can I Put `Color` Inside the Entity?

Technically yes.

Architecturally, it is better not to.

---

## When Might It Be Acceptable?

In a very small project or prototype, you may store `Color` directly to reduce code.

In large and scalable projects, keep raw data in the Entity and convert it in the UI.

---

## General Rule

> If a type comes from `package:flutter/...` or `dart:ui`, it is better not to place it inside an Entity.

---

## Summary

Even if the backend sends a color:

* ✅ Store it as `String` or `int`.
* ❌ Do not store it as Flutter `Color`.
* ✅ Convert it to `Color` in the Presentation layer.

---

## Good Example

```dart
class ProductEntity {
  final String title;
  final String backgroundColorHex;
}
```

## Avoid

```dart
class ProductEntity {
  final String title;
  final Color backgroundColor; // Not recommended
}
```

---

## Sentence to Remember

> **Entities should know nothing about Flutter, UI, databases, or APIs. They represent pure business data and rules only.**
