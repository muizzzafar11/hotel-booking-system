CREATE DATABASE IF NOT EXISTS DBAssignment;
USE DBAssignment;

CREATE TABLE hotel_chains (  
    chain_id INT PRIMARY KEY,
    chain_name VARCHAR(50) NOT NULL,
    number_hotels INT NOT NULL,
    email VARCHAR(50) NOT NULL,
    phone VARCHAR(50) NOT NULL
);

CREATE TABLE hotels(
    hotel_id INT PRIMARY KEY,
    hotel_name VARCHAR(50) NOT NULL,
    number_rooms INT NOT NULL,
    address VARCHAR(100) NOT NULL,
    area VARCHAR(100) NOT NULL,
    email VARCHAR(50) NOT NULL,
    phone VARCHAR(50) NOT NULL
);

CREATE TABLE category (
    category_id INT PRIMARY KEY,
    rating INT NOT NULL,
    chain_id INT NOT NULL,
    hotel_id INT NOT NULL,
    FOREIGN KEY (chain_id) REFERENCES hotel_chains(chain_id),
    FOREIGN KEY (hotel_id) REFERENCES hotels(hotel_id)
);

CREATE TABLE employee(
    ssn_employee VARCHAR(50) PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
);

CREATE TABLE role(
    role_id INT PRIMARY KEY AUTO_INCREMENT,
    hotel_id INT NOT NULL,
    role VARCHAR(50) NOT NULL,
    ssn_employee VARCHAR(50) NOT NULL,
    FOREIGN KEY (hotel_id) REFERENCES hotels(hotel_id),
    FOREIGN KEY (ssn_employee) REFERENCES employee(ssn_employee)
);

CREATE TABLE room (
    room_number INT PRIMARY KEY,
    hotel_id INT NOT NULL,
    price INT NOT NULL,
    amenities VARCHAR(100) NOT NULL,
    capacity INT NOT NULL,
    view VARCHAR(100),
    can_extend BOOLEAN NOT NULL,
    issues VARCHAR(50) NOT NULL,
    FOREIGN KEY (hotel_id) REFERENCES hotels(hotel_id)
);

CREATE TABLE customer(
    ssn_customer VARCHAR(50) PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    registration_date DATE NOT NULL
);

CREATE TABLE booking(
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    room_number INT NOT NULL,
    checkin_date DATE NOT NULL,
    checkout_date DATE NOT NULL,
    ssn_customer VARCHAR(50) NOT NULL,
    FOREIGN KEY (room_number) REFERENCES room(room_number),
    FOREIGN KEY (ssn_customer) REFERENCES customer(ssn_customer)
);

CREATE TABLE renting(
    renting_id INT PRIMARY KEY AUTO_INCREMENT,
    room_number INT NOT NULL,
    checkin_date DATE NOT NULL,
    checkout_date DATE NOT NULL,
    ssn_customer VARCHAR(50) NOT NULL,
    ssn_employee VARCHAR(50) NOT NULL,
    FOREIGN KEY (room_number) REFERENCES room(room_number),
    FOREIGN KEY (ssn_customer) REFERENCES customer(ssn_customer),
    FOREIGN KEY (ssn_employee) REFERENCES employee(ssn_employee)
);

USE DBAssignment;

-- Inserting data into the hotel_chains table
INSERT INTO hotel_chains (chain_id, chain_name, number_hotels, email, phone)
VALUES 
    (1, 'Marriott', 8, 'marriott@gmail.com', '555-1111'),
    (2, 'Hilton', 8, 'hilton@gmail.com', '555-2222'),
    (3, 'Accor', 8, 'accor@gmail.com', '555-3333'),
    (4, 'Capella Hotels Group', 8, 'Capella@gmail.com', '555-4444'),
    (5, 'Oberoi Hotels & Resorts', 8, 'Oberoi@gmail.com', '555-5555');

INSERT INTO hotels (hotel_id, hotel_name, number_rooms, address, area, email, phone)
VALUES 
    (1, 'Marriott Hotel 1', 100, '123 Main St, New York, NY', 'Downtown', 'marriott1@gmail.com', '555-1111'),
    (2, 'Marriott Hotel 2', 100, '456 Oak St, San Francisco, CA', 'Lowertown', 'marriott2@gmail.com', '555-1111'),
    (3, 'Marriott Hotel 3', 100, '789 Elm St, Chicago, IL', 'Downtown', 'marriott3@gmail.com', '555-1111'),
    (4, 'Marriott Hotel 4', 100, '234 Market St, Philadelphia, PA', 'Downtown', 'marriott4@gmail.com', '555-1111'),
    (5, 'Marriott Hotel 5', 100, '567 Oak St, Houston, TX', 'Midtown', 'marriott5@gmail.com', '555-1111'),
    (6, 'Marriott Hotel 6', 100, '890 Elm St, Atlanta, GA', 'Lowertown', 'marriott6@gmail.com', '555-1111'),
    (7, 'Marriott Hotel 7', 100, '345 Main St, Miami, FL', 'Lowertown', 'marriott7@gmail.com', '555-1111'),
    (8, 'Marriott Hotel 8', 100, '678 Oak St, Seattle, WA', 'Midtown', 'marriott8@gmail.com', '555-1111'),

    (9, 'Hilton Hotel 1', 100, '123 Main St, Boston, MA', 'Midtown', 'hilton1@gmail.com', '555-2222'),
    (10, 'Hilton Hotel 2', 100, '456 Oak St, Dallas, TX', 'Midtown', 'hilton2@gmail.com', '555-2222'),
    (11, 'Hilton Hotel 3', 100, '789 Elm St, Washington, DC', 'Lowertown', 'hilton3@gmail.com', '555-2222'),
    (12, 'Hilton Hotel 4', 100, '321 Market St, Denver, CO', 'Lowertown', 'hilton4@gmail.com', '555-2222'),
    (13, 'Hilton Hotel 5', 100, '654 Oak St, Los Angeles, CA', 'Downtown', 'hilton5@gmail.com', '555-2222'),
    (14, 'Hilton Hotel 6', 100, '987 Elm St, Austin, TX', 'Lowertown', 'hilton6@gmail.com', '555-2222'),
    (15, 'Hilton Hotel 7', 100, '456 Main St, Portland, OR', 'Lowertown', 'hilton7@gmail.com', '555-2222'),
    (16, 'Hilton Hotel 8', 100, '789 Oak St, Phoenix, AZ', 'Midtown', 'hilton8@gmail.com', '555-2222'),

    (17, 'Accor Hotel 1', 100, '123 Main St, New Orleans, LA', 'Midtown', 'Accor1@gmail.com', '555-3333'),
    (18, 'Accor Hotel 2', 100, '456 Oak St, Nashville, TN', 'Downtown', 'Accor2@gmail.com', '555-3333'),
    (19, 'Accor Hotel 3', 100, '789 Elm St, San Diego, CA', 'Lowertown', 'Accor3@gmail.com', '555-3333'),
    (20, 'Accor Hotel 4', 100, '408 Market St, Las Vegas, NV', 'Midtown', 'Accor4@gmail.com', '555-3333'),
    (21, 'Accor Hotel 5', 100, '567 Oak St, Orlando, FL', 'Downtown', 'Accor5@gmail.com', '555-3333'),
    (22, 'Accor Hotel 6', 100, '890 Elm St, Kansas City, MO', 'Midtown', 'Accor6@gmail.com', '555-3333'),
    (23, 'Accor Hotel 7', 100, '765 Main St, St. Louis, MO', 'Lowertown', 'Accor7@gmail.com', '555-3333'),
    (24, 'Accor Hotel 8', 100, '678 Oak St, Minneapolis, MN', 'Lowertown', 'Accor8@gmail.com', '555-3333'),

    (25, 'Capella Hotel 1', 100, '123 Main St, Baltimore, MD', 'Lowertown', 'Capella1@gmail.com', '555-4444'),
    (26, 'Capella Hotel 2', 100, '456 Oak St, Detroit, MI', 'Downtown', 'Capella2@gmail.com', '555-4444'),
    (27, 'Capella Hotel 3', 100, '789 Elm St, Salt Lake City, UT', 'Downtown', 'Capella3@gmail.com', '555-4444'),
    (28, 'Capella Hotel 4', 100, '234 Market St, Omaha, NE', 'Midtown', 'Capella4@gmail.com', '555-4444'),
    (29, 'Capella Hotel 5', 100, '567 Oak St, Indianapolis, IN', 'Downtown', 'Capella5@gmail.com', '555-4444'),
    (30, 'Capella Hotel 6', 100, '890 Elm St, Charlotte, NC', 'Midtown', 'Capella6@gmail.com', '555-4444'),
    (31, 'Capella Hotel 7', 100, '345 Main St, Tampa, FL', 'Downtown', 'Capella7@gmail.com', '555-4444'),
    (32, 'Capella Hotel 8', 100, '678 Oak St, San Antonio, TX', 'Lowertown', 'Capella8@gmail.com', '555-4444'),

    (33, 'Oberoi Hotel 1', 100, '123 Main St, Cleveland, OH', 'Downtown', 'Oberoi1@gmail.com', '555-5555'),
    (34, 'Oberoi Hotel 2', 100, '456 Oak St, Columbus, OH', 'Midtown', 'Oberoi2@gmail.com', '555-5555'),
    (35, 'Oberoi Hotel 3', 100, '789 Elm St, Milwaukee, WI', 'Midtown', 'Oberoi3@gmail.com', '555-5555'),
    (36, 'Oberoi Hotel 4', 100, '321 Market St, Cincinnati, OH', 'Midtown', 'Oberoi4@gmail.com', '555-5555'),
    (37, 'Oberoi Hotel 5', 100, '567 Oak St, Raleigh, NC', 'Downtown', 'Oberoi5@gmail.com', '555-5555'),
    (38, 'Oberoi Hotel 6', 100, '890 Elm St, Memphis, TN', 'Downtown', 'Oberoi6@gmail.com', '555-5555'),
    (39, 'Oberoi Hotel 7', 100, '765 Main St, Richmond, VA', 'Lowertown', 'Oberoi7@gmail.com', '555-5555'),
    (40, 'Oberoi Hotel 8', 100, '678 Oak St, Nashville, TN', 'Downtown', 'Oberoi8@gmail.com', '555-5555');

-- Inserting data into the categorie table
INSERT INTO category (category_id, rating, chain_id, hotel_id)
VALUES
    (1, 3, 1, 1),
    (2, 4, 1, 2),
    (3, 5, 1, 3),
    (4, 3, 1, 4),
    (5, 4, 1, 5),
    (6, 5, 1, 6),
    (7, 3, 1, 7),
    (8, 4, 1, 8),

    (9, 5, 2, 9),
    (10, 3, 2, 10),
    (11, 4, 2, 11),
    (12, 5, 2, 12),
    (13, 3, 2, 13),
    (14, 4, 2, 14),
    (15, 5, 2, 15),
    (16, 3, 2, 16),

    (17, 4, 3, 17),
    (18, 5, 3, 18),
    (19, 3, 3, 19),
    (20, 4, 3, 20),
    (21, 5, 3, 21),
    (22, 3, 3, 22),
    (23, 4, 3, 23),
    (24, 5, 3, 24),

    (25, 3, 4, 25),
    (26, 4, 4, 26),
    (27, 5, 4, 27),
    (28, 3, 4, 28),
    (29, 4, 4, 29),
    (30, 5, 4, 30),
    (31, 3, 4, 31),
    (32, 4, 4, 32),

    (33, 5, 5, 33),
    (34, 3, 5, 34),
    (35, 4, 5, 35),
    (36, 5, 5, 36),
    (37, 3, 5, 37),
    (38, 4, 5, 38),
    (39, 5, 5, 39),
    (40, 3, 5, 40);

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

DELIMITER //
CREATE PROCEDURE my_proc_employee()
BEGIN
	DECLARE hotel_id INT DEFAULT 1;
	WHILE hotel_id <= 40 DO
	    -- Insert 3 managers and 5 employees for hotel with current hotel_id
	    INSERT INTO employee (ssn_employee, first_name, last_name)
	    VALUES (CONCAT('m101', hotel_id), 'Manager', CONCAT('Hotel', hotel_id)),
	           (CONCAT('m102', hotel_id), 'Manager', CONCAT('Hotel', hotel_id)),
	           (CONCAT('m103', hotel_id), 'Manager', CONCAT('Hotel', hotel_id)),
	           (CONCAT('e101', hotel_id), 'Employee', CONCAT('Hotel', hotel_id)),
	           (CONCAT('e102', hotel_id), 'Employee', CONCAT('Hotel', hotel_id)),
	           (CONCAT('e103', hotel_id), 'Employee', CONCAT('Hotel', hotel_id)),
	           (CONCAT('e104', hotel_id), 'Employee', CONCAT('Hotel', hotel_id)),
	           (CONCAT('e105', hotel_id), 'Employee', CONCAT('Hotel', hotel_id));
	    
	    INSERT INTO role (hotel_id, role, ssn_employee)
	    VALUES (hotel_id, 'manager', CONCAT('m101', hotel_id)),
	           (hotel_id, 'manager', CONCAT('m102', hotel_id)),
	           (hotel_id, 'manager', CONCAT('m103', hotel_id)),
	           (hotel_id, 'employee', CONCAT('e101', hotel_id)),
	           (hotel_id, 'employee', CONCAT('e102', hotel_id)),
	           (hotel_id, 'employee', CONCAT('e103', hotel_id)),
	           (hotel_id, 'employee', CONCAT('e104', hotel_id)),
	           (hotel_id, 'employee', CONCAT('e105', hotel_id));
	    
	    SET hotel_id = hotel_id + 1;
	END WHILE;
END//
DELIMITER ;

CALL my_proc_employee();