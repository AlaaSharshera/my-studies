# Extensions in Dart

Extensions allow you to add new functionality to existing classes **without modifying their original source code**.

Instead of creating helper functions or subclasses, you can extend a class directly and use the new methods as if they were built-in.

📌 In short:

* Add new methods or getters to existing types (String, int, List, etc.).
* Keep your code clean and readable.
* Avoid utility classes and repeated helper functions.
* Improve code organization and reusability.

## Common Use Cases

* Adding formatting helpers to `String`
* Adding validation methods (email, password, etc.)
* Adding utility methods to `List`, `DateTime`, or `num`
* Improving readability in UI and business logic

📂 Check `example.dart` for simple examples using Dart extensions.
