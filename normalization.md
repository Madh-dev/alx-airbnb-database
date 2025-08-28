### 1NF

Atomic attributes (no repeating groups). All scalar columns (names, prices, dates). No arrays inside base tables.

### 2NF

No partial dependencies on a composite key. Every table uses a single-column primary key (UUID); non-key attributes depend on the whole key.

### 3NF

No transitive dependencies: e.g., total_price depends only on the booking (dates/pricing) and is kept as a derived-but-stored value for performance while business logic ensures consistency. host_id is kept only in Property, not copied into Booking to avoid redundancy.

### BCNF considerations

ENUMs used for role, status, payment_method avoid lookup tables while still constraining values. If you need dynamic runtime changes, replace ENUMs with lookup tables roles, booking_statuses, payment_methods.

location is a single string for simplicity; for analytics/search, consider splitting into city, state, country, lat, lng (still normalized). Index them separately.

### Other design notes

- Review has a unique constraint per (property_id, user_id) to prevent duplicate reviews by the same user for the same property.

- end_date > start_date and non-negative pricing are enforced via CHECK constraints.

- Cascading deletes on child rows ensure referential integrity when a parent is removed.