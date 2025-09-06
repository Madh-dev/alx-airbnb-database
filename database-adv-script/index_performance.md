-- Index on bookings start_date for partitioning/queries
CREATE INDEX idx_bookings_start_date ON bookings(start_date);

-- Composite index for frequent joins
CREATE INDEX idx_bookings_property_user ON bookings(property_id, user_id);
