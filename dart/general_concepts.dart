// ==============================
/* 
! 📘 Dart Functions Cheat Sheet

*Function (بشكل عام)
ده اسم عام لأي دالة:
سواء كانت 
-Top-level function 
-Method // function جوه class
-Nested function
كل دول اسمهم functions 
*/

// ==============================
//
// ------------------------------
// 🟢 1. Top-level Function
// ------------------------------

//  function متعرفة برا => أي class أو function
// يعني موجودة على مستوى الملف مباشرة (global scope).
// ممكن تستخدمها في أي مكان في نفس الملف
//import ولو عايز تستخدمها في ملف تاني لازم تعمل .
//utils.dart && helper functions folder زي ما بنشوف في
String formatName(String name) {
  return name.toUpperCase();
}

// ------------------------------
// 🟢 2. Function Declaration vs Call
// ------------------------------

// Declaration / Definition
void greet(String name) {
  print("Hello $name");
}

// testCall is a top-level function
// greet is also a top-level function because it's defined outside of any class or function
/*Note: Being top-level depends ONLY on where the function is declared,
 NOT where it is called. It's completely normal to call a top-level
 function inside another function or inside a class, and it still
 remains a top-level function. */
void testCall() {
  // Function Call / Invocation
  greet("Alaa");
}

// ------------------------------
// 🟢 3. Parameters vs Arguments
// ------------------------------

// Parameters: في تعريف الدالة
void add(int a, int b) {
  print(a + b);
}

void testArguments() {
  // Arguments: في الاستدعاء
  add(3, 5);
}

// ------------------------------
// 🟢 4. Types of Parameters
// ------------------------------

// 1. Positional Parameters (ترتيبية)
void positionalExample(String name, int age) {
  print("$name is $age");
}

// 2. Optional Positional
void optionalPositional(String name, [int? age]) {
  print("$name is $age");
}

// 3. Named Parameters (الأهم في Flutter)
void namedExample({required String name, int? age}) {
  print("$name is $age");
}

// 4. Default Values
void defaultValueExample({String name = "Guest"}) {
  print(name);
}

// ------------------------------
// 🟢 5. Usage Examples
// ------------------------------

void usage() {
  positionalExample("Alaa", 22);

  optionalPositional("Alaa");
  optionalPositional("Alaa", 22);

  namedExample(name: "Alaa");
  namedExample(name: "Alaa", age: 22);

  defaultValueExample();
}

// ------------------------------
// 🟢 6. Nested Function
// ------------------------------

void outerFunction() {
  void innerFunction() {
    print("I'm inner"); // innerFunction مش top-level
  }

  innerFunction();
}

// ------------------------------
// 🟢 7. print Function
// ------------------------------

// print هي أصلاً Top-level function
void printExample() {
  print("Hello"); //function استخدامها جوه
  //top-level function مش بتغير من كونها
}

// ------------------------------
// 🟢 8. Important Notes
// ------------------------------

/*
✔️ Top-level function:
- متعرفة برا أي class أو function
- ينفع تستخدمها في أي مكان في نفس الملف
- عشان تستخدمها في ملف تاني لازم import

✔️ Method:
- function جوه class

✔️ Nested function:
- function جوه function تانية

✔️ Parameter:
- متغير في تعريف الدالة

✔️ Argument:
- القيمة اللي بتمريرها وقت الاستدعاء

✔️ الفرق بين [] و {}:
- [] => Optional Positional (ترتيب مهم)
- {} => Named Parameters (اسم مهم + أوضح + ينفع required)

✔️ أهم قاعدة:
- نوع الدالة بيتحدد من مكان تعريفها (declaration)
- مش من مكان استخدامها (call)
*/

// ------------------------------
// 🟢 9. Import Example (معلومة)
// ------------------------------

/*
لو عندك ملف تاني فيه function:

// utils.dart
String sayHi() => "Hi";

لازم تعملي import:

import 'utils.dart';

عشان تقدري تستخدميها هنا
*/
