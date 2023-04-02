DELIMITER //
CREATE PROCEDURE my_proc()
BEGIN
	DECLARE i INT DEFAULT 1;
	DECLARE max_count INT DEFAULT 40;
	DECLARE random_value INT;
	WHILE i <= max_count DO
		SET random_value = FLOOR(RAND() * (100 - 1) + 50);
	    INSERT INTO room (room_number, hotel_id, price, amenities, capacity, view, can_extend, issues)
	    VALUES
	        (i*100+1, i, random_value*i, 'AC, TV, Mini Bar', 2, 'City View', true, 'None'),
	        (i*100+2, i, random_value*i, 'AC, TV, Mini Bar, Sofa', 3, 'Pool View', true, 'None'),
	        (i*100+3, i, random_value*i, 'AC, TV, Mini Bar, Sofa', 5, 'City View', true, 'None'),
	        (i*100+4, i, random_value*i, 'AC, TV, Mini Bar, Sofa, Jacuzzi', 1, 'Pool View', true, 'None'),
	        (i*100+5, i, random_value*i, 'AC, TV, Mini Bar, Sofa, Jacuzzi', 4, 'City View', true, 'None');
	        SET i = i + 1;
	END WHILE;
END//
DELIMITER ;

CALL my_proc();