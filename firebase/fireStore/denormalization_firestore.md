# Denormalization in Firestore

## 📌 What is Denormalization?

**Denormalization** means duplicating
the same data in more than one place instead of linking it with
relationships like SQL.

------------------------------------------------------------------------

## 🧠 Main Idea

In traditional databases (SQL): 
- We reduce duplication
- We use relationships (JOIN)

In Firestore (NoSQL): 
- There is no JOIN
- So we duplicate data to speed up reads

------------------------------------------------------------------------

## ⚖️ Quick Comparison

  SQL (Normalization)    Firestore (Denormalization)
  ---------------------- -----------------------------
  Relationships (JOIN)   No JOIN
  Reduce duplication     Data duplication
  Complex queries        Simple and fast queries

------------------------------------------------------------------------

## Example:-

### 🟢 SQL (Normalization)

``` sql
users table:
id | name

orders table:
id | user_id
```

### Query:

``` sql
SELECT * FROM orders
JOIN users ON orders.user_id = users.id;
```

------------------------------------------------------------------------

### 🔴 Firestore (Denormalization)

🧱 Full Structure (Users + Orders)
🔹 users collection
users (collection)
├── user_123
│ {
│ "name": "Alaa",
│ "email": "alaa@test.com",
│ "image": "https://image-url"
│ }
├── user_456
{
"name": "Sara",
"email": "sara@test.com",
"image": "https://image-url"
}

🔹 orders collection (Denormalized)
orders (collection)
├── order_1
│ {
│ "userId": "user_123",
│ "userName": "Alaa",
│ "userImage": "https://image-url",
│ "total": 500
│ }
├── order_2
{
"userId": "user_456",
"userName": "Sara",
"userImage": "https://image-url",
"total": 300
}

📌Denormalization here we did:

the main data exists in users
but we duplicated (name + image)
inside orders for speed

📌here we stored the user name inside the order even
though it already exists in users collection 

------------------------------------------------------------------------

## (Real-world) Example:

### Chat App

### Without Denormalization

``` json
message:
{
  "senderId": "123"
}
```

📌 The problem:
 - Needs an extra query to get the user name and image

------------------------------------------------------------------------

### ✅ Using Denormalization

//we will duplicate data

``` json
message:
{
  "senderId": "123",
  "senderName": "Alaa",
  "senderImage": "https://image-url"
}
```

The result:
- UI becomes faster
- No extra calls

------------------------------------------------------------------------

## ⚠️ disAdvantages:

- Data duplication
- If original data changes (like name), it must be updated everywhere

------------------------------------------------------------------------

## 💡 Solutions

1.  Use Cloud Functions to update data automatically
2.  Do manual updates in all places
3.  Reduce duplication as much as possible for frequently changing data

------------------------------------------------------------------------

## 🎯 Finally

-   Denormalization = duplicating data instead of linking.
-   Suitable for NoSQL and Firestore.
-   Improves performance significantly.
