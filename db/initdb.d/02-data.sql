USE DBAssignment;

-- Inserting data into the hotel_chains table
INSERT INTO hotel_chains (chain_id, chain_name, number_hotels, email, phone)
VALUES 
    (1, 'Marriott', 8, 'marriott@gmail.com', '555-1111'),
    (2, 'Hilton', 8, 'hilton@gmail.com', '555-2222'),
    (3, 'Accor', 8, 'accor@gmail.com', '555-3333'),
    (4, 'Capella Hotels Group', 8, 'Capella@gmail.com', '555-4444'),
    (5, 'Oberoi Hotels & Resorts', 8, 'Oberoi@gmail.com', '555-5555');

-- Inserting data into the hotels table
INSERT INTO hotels (hotel_id, hotel_name, number_rooms, address, email, phone)
VALUES 
    (1, 'Marriott Hotel 1', 100, '123 Main St, Anytown USA', 'marriott1@gmail.com', '555-1111'),
    (2, 'Marriott Hotel 2', 100, '456 Oak St, Anytown USA', 'marriott2@gmail.com', '555-1111'),
    (3, 'Marriott Hotel 3', 100, '789 Elm St, Anytown USA', 'marriott3@gmail.com', '555-1111'),
    (4, 'Marriott Hotel 4', 100, '123 Main St, Anytown USA', 'marriott4@gmail.com', '555-1111'),
    (5, 'Marriott Hotel 5', 100, '456 Oak St, Anytown USA', 'marriott5@gmail.com', '555-1111'),
    (6, 'Marriott Hotel 6', 100, '789 Elm St, Anytown USA', 'marriott6@gmail.com', '555-1111'),
    (7, 'Marriott Hotel 7', 100, '123 Main St, Anytown USA', 'marriott7@gmail.com', '555-1111'),
    (8, 'Marriott Hotel 8', 100, '456 Oak St, Anytown USA', 'marriott8@gmail.com', '555-1111'),

    (9, 'Hilton Hotel 1', 100, '123 Main St, Anytown USA', 'hilton1@gmail.com', '555-2222'),
    (10, 'Hilton Hotel 2', 100, '456 Oak St, Anytown USA', 'hilton2@gmail.com', '555-2222'),
    (11, 'Hilton Hotel 3', 100, '789 Elm St, Anytown USA', 'hilton3@gmail.com', '555-2222'),
    (12, 'Hilton Hotel 4', 100, '123 Main St, Anytown USA', 'hilton4@gmail.com', '555-2222'),
    (13, 'Hilton Hotel 5', 100, '456 Oak St, Anytown USA', 'hilton5@gmail.com', '555-2222'),
    (14, 'Hilton Hotel 6', 100, '789 Elm St, Anytown USA', 'hilton6@gmail.com', '555-2222'),
    (15, 'Hilton Hotel 7', 100, '123 Main St, Anytown USA', 'hilton7@gmail.com', '555-2222'),
    (16, 'Hilton Hotel 8', 100, '456 Oak St, Anytown USA', 'hilton8@gmail.com', '555-2222'),

    (17, 'Accor Hotel 1', 100, '123 Main St, Anytown USA', 'Accor1@gmail.com', '555-3333'),
    (18, 'Accor Hotel 2', 100, '456 Oak St, Anytown USA', 'Accor2@gmail.com', '555-3333'),
    (19, 'Accor Hotel 3', 100, '789 Elm St, Anytown USA', 'Accor3@gmail.com', '555-3333'),
    (20, 'Accor Hotel 4', 100, '123 Main St, Anytown USA', 'Accor4@gmail.com', '555-3333'),
    (21, 'Accor Hotel 5', 100, '456 Oak St, Anytown USA', 'Accor5@gmail.com', '555-3333'),
    (22, 'Accor Hotel 6', 100, '789 Elm St, Anytown USA', 'Accor6@gmail.com', '555-3333'),
    (23, 'Accor Hotel 7', 100, '123 Main St, Anytown USA', 'Accor7@gmail.com', '555-3333'),
    (24, 'Accor Hotel 8', 100, '456 Oak St, Anytown USA', 'Accor8@gmail.com', '555-3333'),

    (25, 'Capella Hotel 1', 100, '123 Main St, Anytown USA', 'Capella1@gmail.com', '555-4444'),
    (26, 'Capella Hotel 2', 100, '456 Oak St, Anytown USA', 'Capella2@gmail.com', '555-4444'),
    (27, 'Capella Hotel 3', 100, '789 Elm St, Anytown USA', 'Capella3@gmail.com', '555-4444'),
    (28, 'Capella Hotel 4', 100, '123 Main St, Anytown USA', 'Capella4@gmail.com', '555-4444'),
    (29, 'Capella Hotel 5', 100, '456 Oak St, Anytown USA', 'Capella5@gmail.com', '555-4444'),
    (30, 'Capella Hotel 6', 100, '789 Elm St, Anytown USA', 'Capella6@gmail.com', '555-4444'),
    (31, 'Capella Hotel 7', 100, '123 Main St, Anytown USA', 'Capella7@gmail.com', '555-4444'),
    (32, 'Capella Hotel 8', 100, '456 Oak St, Anytown USA', 'Capella8@gmail.com', '555-4444'),

    (33, 'Oberoi Hotel 1', 100, '123 Main St, Anytown USA', 'Oberoi1@gmail.com', '555-5555'),
    (34, 'Oberoi Hotel 2', 100, '456 Oak St, Anytown USA', 'Oberoi2@gmail.com', '555-5555'),
    (35, 'Oberoi Hotel 3', 100, '789 Elm St, Anytown USA', 'Oberoi3@gmail.com', '555-5555'),
    (36, 'Oberoi Hotel 4', 100, '123 Main St, Anytown USA', 'Oberoi4@gmail.com', '555-5555'),
    (37, 'Oberoi Hotel 5', 100, '456 Oak St, Anytown USA', 'Oberoi5@gmail.com', '555-5555'),
    (38, 'Oberoi Hotel 6', 100, '789 Elm St, Anytown USA', 'Oberoi6@gmail.com', '555-5555'),
    (39, 'Oberoi Hotel 7', 100, '123 Main St, Anytown USA', 'Oberoi7@gmail.com', '555-5555'),
    (40, 'Oberoi Hotel 8', 100, '456 Oak St, Anytown USA', 'Oberoi8@gmail.com', '555-5555');

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

    (9, 5, 2, 1),
    (10, 3, 2, 2),
    (11, 4, 2, 3),
    (12, 5, 2, 4),
    (13, 3, 2, 5),
    (14, 4, 2, 6),
    (15, 5, 2, 7),
    (16, 3, 2, 8),

    (17, 4, 3, 1),
    (18, 5, 3, 2),
    (19, 3, 3, 3),
    (20, 4, 3, 4),
    (21, 5, 3, 5),
    (22, 3, 3, 6),
    (23, 4, 3, 7),
    (24, 5, 3, 8),

    (25, 3, 4, 1),
    (26, 4, 4, 2),
    (27, 5, 4, 3),
    (28, 3, 4, 4),
    (29, 4, 4, 5),
    (30, 5, 4, 6),
    (31, 3, 4, 7),
    (32, 4, 4, 8),

    (33, 5, 5, 1),
    (34, 3, 5, 2),
    (35, 4, 5, 3),
    (36, 5, 5, 4),
    (37, 3, 5, 5),
    (38, 4, 5, 6),
    (39, 5, 5, 7),
    (40, 3, 5, 8);