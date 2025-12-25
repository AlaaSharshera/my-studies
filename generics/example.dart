void main() {
  // =========================================
  // 1️⃣ Built-in Generics in Dart
  // =========================================
  // Dart uses generics heavily in its built-in classes.
  // Example: List
  // List is a generic class.
  // <int> or <String> defines the type of elements inside the list.

  List<int> numbers = [1, 2, 3];
  List<String> names = ["Alaa", "Ahmed"];

  // Adding a wrong type will cause a compile-time error:
  // numbers.add("text"); // ❌ Error

  // ✅ Benefit: Type safety is ensured by generics.

  // =========================================
  // 2️⃣ Simple Example WITHOUT Generics (Not Recommended ❌)
  // =========================================
  BoxWithoutGeneric box = BoxWithoutGeneric();

  // dynamic accepts any type
  box.value = "hello";
  box.value = 10; // Allowed ❌ (no type safety)

  // Problems:
  // - Errors only appear at runtime
  // - No type safety

  // =========================================
  // 3️⃣ Same Example USING Generics ✅
  // =========================================
  Box<int> intBox = Box(10);
  Box<String> stringBox = Box("Hello");

  // intBox.value = "text"; // ❌ Compile-time error (type safety)

  // 🔥 Benefit of Generics:
  // - Reusable code for different types
  // - Compiler catches type errors early
  // - Reduces runtime bugs

  // =========================================
  // 4️⃣ Generic Function Example
  // =========================================
  List<int> nums = [10, 20, 30];
  int firstNumber = getFirst(nums); // Works with int

  List<String> words = ["Alaa", "Flutter"];
  String firstWord = getFirst(words); // Works with String

  print(firstNumber); // 10
  print(firstWord); // Alaa
}

// A class without generics
class BoxWithoutGeneric {
  dynamic value;
}

// A generic class
// T represents a generic type
class Box<T> {
  T value;
  Box(this.value);
}

// Generic function: returns the first element of a list
T getFirst<T>(List<T> list) {
  return list.first;
}
