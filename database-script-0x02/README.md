# Airbnb Clone – Sample Data Population

This document explains the SQL script used to **populate the Airbnb Clone database** with realistic sample data. The goal of this dataset is to simulate real-world usage for testing, development, and demonstration purposes.

---

## Overview

The script inserts records into the following tables:

- **Users**: Represents guests and hosts.
- **Properties**: Listings added by hosts.
- **Bookings**: Reservations made by guests.
- **Payments**: Transactions related to bookings.
- **Reviews**: Guest feedback on properties.
- **Messages**: Communication between hosts and guests.

Each insert reflects a realistic interaction in an Airbnb-like environment.

---

## Data Population Breakdown

### 1. Users
Four users are created with different roles:
- **Alice Johnson** – Guest  
- **David Smith** – Host  
- **Maria Gonzalez** – Host  
- **John Doe** – Guest  

> Passwords are stored as `hashed_pw` placeholders for security simulation. Phone numbers use Nigerian-style numbering (`+234...`).

---

### 2. Properties
Two properties are listed by hosts:
1. **Cozy Apartment in Lagos** – Owned by *David Smith*.  
   - Description: Modern 2-bedroom apartment with sea view and fast WiFi.  
   - Location: Lagos, Nigeria  
   - Price: $75 per night  

2. **Beachfront Villa** – Owned by *Maria Gonzalez*.  
   - Description: Spacious villa with private pool, perfect for families.  
   - Location: Accra, Ghana  
   - Price: $200 per night  

---

### 3. Bookings
Two reservations are added:
- **Alice Johnson** books the *Cozy Apartment in Lagos* (Sept 10–15, 2025).  
  - Total price: $375  
  - Status: Confirmed  

- **John Doe** books the *Beachfront Villa* (Sept 20–25, 2025).  
  - Total price: $1000  
  - Status: Pending  

---

### 4. Payments
Payments are linked to bookings:
- Alice fully pays **$375** by credit card.  
- John makes a **partial payment of $500** via PayPal for his $1000 booking.  

This demonstrates full and partial payment scenarios.

---

### 5. Reviews
Guests leave reviews after stays:
- Alice rates the Lagos apartment **5 stars**, praising cleanliness and location.  
- John rates the Beachfront Villa **4 stars**, noting WiFi could be better.  

---

### 6. Messages
Host–guest messaging examples are included:
- Alice messages David to confirm check-in details.  
- David replies with check-in instructions.  

This simulates the in-app communication system.

---

## Key Notes
- **Foreign Key References**:  
  Instead of hardcoding IDs, subqueries (`SELECT user_id FROM users WHERE email=...`) dynamically fetch the correct user or property ID.  
  This ensures relational integrity and avoids mismatched IDs.

- **Realism**:  
  Data simulates common Airbnb interactions:
  - Multiple hosts and guests.  
  - Confirmed and pending bookings.  
  - Full and partial payments.  
  - Reviews with varying ratings.  
  - Host–guest communication.  

- **Extensibility**:  
  Developers can easily expand the dataset by adding more users, properties, or bookings.

---

## Usage
1. Ensure the database schema (tables, constraints, indexes) is already created.  
2. Run the script in your PostgreSQL environment:
   ```sql
   \i sample_data.sql
