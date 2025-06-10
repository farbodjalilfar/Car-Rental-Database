-- =============================================
-- Function: complete_rental
-- Marks a rental as 'Completed' based on rental_id
-- =============================================

CREATE OR REPLACE FUNCTION complete_rental(rid INT)
RETURNS VOID AS $$
BEGIN
    UPDATE rentals
    SET rental_status = 'Completed'
    WHERE rental_id = rid;

    RAISE NOTICE 'Rental ID % marked as Completed.', rid;
END;
$$ LANGUAGE plpgsql;
