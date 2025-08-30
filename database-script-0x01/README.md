# Airbnb Clone Database Schema

This project provides the **database design and implementation** for an Airbnb-like platform. It includes entity-relationship modeling, normalization, SQL schema creation, indexing for performance, and relationships between entities such as users, properties, bookings, payments, reviews, and messages.

---

## 📌 Overview
The schema is designed to support:
- **User management** (guests, hosts, admins)  
- **Property listings** by hosts  
- **Bookings and reservations** made by users  
- **Payments** tracking  
- **Reviews and ratings** for properties  
- **Messaging system** between users  

PostgreSQL is used as the relational database, with **UUIDs** for primary keys to ensure global uniqueness across distributed systems.

---

## 📐 Entity-Relationship Design
The main entities and relationships are:

- **Users**: Guests, hosts, and admins.  
- **Properties**: Listed by hosts.  
- **Bookings**: Created by guests for properties.  
- **Payments**: Associated with bookings.  
- **Reviews**: Submitted by users for properties.  
- **Messages**: Communication between users.  

Relationships:
- One host ➝ Many properties  
- One property ➝ Many bookings  
- One booking ➝ One payment  
- One property ➝ Many reviews  
- One user ➝ Many messages (sent/received)  

---

## 🛠️ Normalization
The schema was normalized to **3rd Normal Form (3NF)**:
1. **No repeating groups** – Each attribute is atomic (e.g., `first_name`, `last_name` instead of `full_name`).  
2. **Eliminated partial dependencies** – Non-key attributes depend only on the primary key.  
3. **Eliminated transitive dependencies** – Attributes depend only on their entity (e.g., payment method belongs only to payments).  

This ensures **data integrity**, reduces redundancy, and improves maintainability.

---

## 🗄️ Database Schema (DDL)
The schema includes:
- **Primary keys**: UUIDs generated with `uuid_generate_v4()`.  
- **Foreign keys**: Enforce referential integrity with cascading deletes.  
- **Indexes**: Added to optimize query performance for frequent lookups (e.g., emails, host properties, bookings, messages).  

### Example: Users Table
```sql
CREATE TABLE users (
    user_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    phone_number VARCHAR(20),
    role VARCHAR(20) CHECK (role IN ('guest', 'host', 'admin')) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_users_email ON users(email);
