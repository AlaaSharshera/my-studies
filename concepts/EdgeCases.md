
# Edge Cases in Flutter

## What is an Edge Case?

An edge case is:

> A rare, special, or unexpected situation that may cause bugs, crashes, or incorrect behavior if it is not handled properly.

يعني:
حالة خاصة أو غير متوقعة ممكن تكسر التطبيق لو البرنامج متعاملش معاها بشكل صحيح.

---

# Simple Example

## ❌ Without handling the edge case

```dart
int counter = 0;

void decrement() {
  counter--;
}
```

Problem:
The counter may become:

```txt
0
-1
-2
```

Sometimes this behavior is invalid according to the business rules.

---

## ✅ Handling the edge case

```dart
void decrement() {
  if (counter > 0) {
    counter--;
  }
}
```

Now the counter will never go below zero.

---

# Common Edge Cases in Flutter

## 1. Preventing values from going below limits

```dart
if (counter > 0)
```

Example:
- Counter should not go below 0
- Quantity should not become negative

---

## 2. Handling Empty Lists

```dart
if(items.isNotEmpty)
```

Without checking:
```dart
items[0]
```

May cause:
```txt
RangeError
```

---

## 3. Handling Null Values

```dart
if(user != null)
```

Without checking null:
```dart
Text(user.name)
```

May cause app crash.

---

## 4. No Internet Connection

Always handle network failures using:

```dart
try-catch
```

Example:
- Show error message
- Retry request
- Show offline state

---

## 5. Invalid User Input

Examples:
- Empty email
- Weak password
- Invalid phone number

Validation helps prevent invalid data.

---

## 6. Preventing Duplicate API Requests

Sometimes the user taps multiple times quickly.

Solution:
- Disable button while loading
- Use loading state

Example:

```dart
if(isLoading) return;
```

---

# Interview Answer


 handled several edge cases such as:
- Preventing the counter from going below zero
- Handling empty API responses or empty lists
- Showing error handling when there is no internet connection
- Preventing null value crashes
- Adding validation for invalid user input
- Preventing duplicate API requests when the user taps multiple times quickly
```


---

# Important Note

Thinking about edge cases shows that:
- You care about app stability
- You think like a real developer
- You test unusual scenarios
- You understand business rules

````
