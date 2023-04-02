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
    role_id INT PRIMARY KEY,
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
    booking_id INT PRIMARY KEY,
    room_number INT NOT NULL,
    checkin_date DATE NOT NULL,
    checkout_date DATE NOT NULL,
    ssn_customer VARCHAR(50) NOT NULL,
    FOREIGN KEY (room_number) REFERENCES room(room_number),
    FOREIGN KEY (ssn_customer) REFERENCES customer(ssn_customer)
);

CREATE TABLE renting(
    renting_id INT PRIMARY KEY,
    room_number INT NOT NULL,
    checkin_date DATE NOT NULL,
    checkout_date DATE NOT NULL,
    ssn_customer VARCHAR(50) NOT NULL,
    FOREIGN KEY (room_number) REFERENCES room(room_number),
    FOREIGN KEY (ssn_customer) REFERENCES customer(ssn_customer)
);