-- =============================================================
-- This database stores the original raw dataset.
-- It is used for initial data loading and cleaning operations.
-- =============================================================
CREATE DATABASE data_warehouse;

USE data_warehouse;

-- =============================================================
-- This database stores the cleaned and processed dataset.
-- It is used for further analysis and reporting, separate from raw data.
-- =============================================================
CREATE DATABASE data_analytics;

USE data_analytics;

-- =============================================================

SET GLOBAL local_infile = 'ON';

SHOW GLOBAL VARIABLES LIKE 'local_infile';

SET SQL_SAFE_UPDATES = 0;

SET SQL_SAFE_UPDATES = 1;

-- Just to copy exact same table and then update clean data
SET sql_mode = REPLACE(REPLACE(@@sql_mode,'NO_ZERO_DATE',''),'NO_ZERO_IN_DATE',''); 
