-- ====================================
-- Prevent Negative Sales Amount

DELIMITER //

CREATE TRIGGER trg_check_sales_amount
BEFORE INSERT ON sales
FOR EACH ROW
BEGIN
    IF NEW.sales_amount < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Sales amount cannot be negative';
    END IF;
END //

DELIMITER ;

-- =====================================
-- Prevent Invalid Quantity

DELIMITER //

CREATE TRIGGER trg_check_quantity
BEFORE INSERT ON sales
FOR EACH ROW
BEGIN
    IF NEW.quantity <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Quantity must be greater than zero';
    END IF;
END //

DELIMITER ;
