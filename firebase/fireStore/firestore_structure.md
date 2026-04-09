# Firestore 

## 🔹 How data is stored in Firestore:
Firestore is a flexible, scalable NoSQL cloud database to store and sync data.
Firestore uses a structure similar to JSON
This means data is organized as:

Collections → Documents → Fields

------------------------------------------------------------------------

## 🧱 1. Collection (similar to Table but not exactly)

A container that groups documents

Example:
users
products
orders

------------------------------------------------------------------------

## 📄 2. Document (similar to Row)

Each document is an object (Map in Flutter)
It has its own unique ID

Example document inside users:

``` json
{
  "name": "Alaa",
  "age": 25,
  "email": "alaa@test.com"
}
```

------------------------------------------------------------------------

## 🧩 3. Fields (the actual data)

Key → Value

Examples:
- String
- Number
- Boolean
- List
- Map (nested object)

------------------------------------------------------------------------

## 🧠 Full Structure Example:

    users (Collection)
      └── user_1 (Document)
            ├── name: "Alaa"
            ├── age: 24
            └── address:
                  ├── city: "Cairo"
                  └── street: "Nasr City"

------------------------------------------------------------------------

## 💡 1. No Relations like SQL

This means there is no:

-   JOIN
-   Foreign Keys

Instead:

-   You use Denormalization
    //explained in another file
-   Or store IDs

------------------------------------------------------------------------

## 💡 2. Data is handled in Flutter as Map

``` dart

Map<String, dynamic> data = {
  "name": "Alaa",
  "age": 25,
};

```

------------------------------------------------------------------------

## 💡 3. You can use Nested Collections

    users
      └── user_1
            └── posts (sub-collection)
                  └── post_1
    // Documents like user_1 can also contain nested collections(posts)

------------------------------------------------------------------------

## 🚀 Firestore:

👉 Collections → Documents → JSON-like data
