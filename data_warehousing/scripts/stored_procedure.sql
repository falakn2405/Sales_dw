-- ===================================================
-- Check which tables/columns contain extra spaces:

CALL FixOrCheckSpaces(FALSE);

-- =====================================
-- Actually trim spaces in all tables:

CALL FixOrCheckSpaces(TRUE);

