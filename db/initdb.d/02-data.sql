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
-- INSERT INTO hotels (hotel_id, hotel_name, number_rooms, address, email, phone)
-- VALUES 
--     (1, 'Marriott Hotel 1', 100, '123 Main St, Anytown USA', 'marriott1@gmail.com', '555-1111'),
--     (2, 'Marriott Hotel 2', 100, '456 Oak St, Anytown USA', 'marriott2@gmail.com', '555-1111'),
--     (3, 'Marriott Hotel 3', 100, '789 Elm St, Anytown USA', 'marriott3@gmail.com', '555-1111'),
--     (4, 'Marriott Hotel 4', 100, '123 Main St, Anytown USA', 'marriott4@gmail.com', '555-1111'),
--     (5, 'Marriott Hotel 5', 100, '456 Oak St, Anytown USA', 'marriott5@gmail.com', '555-1111'),
--     (6, 'Marriott Hotel 6', 100, '789 Elm St, Anytown USA', 'marriott6@gmail.com', '555-1111'),
--     (7, 'Marriott Hotel 7', 100, '123 Main St, Anytown USA', 'marriott7@gmail.com', '555-1111'),
--     (8, 'Marriott Hotel 8', 100, '456 Oak St, Anytown USA', 'marriott8@gmail.com', '555-1111'),

--     (9, 'Hilton Hotel 1', 100, '123 Main St, Anytown USA', 'hilton1@gmail.com', '555-2222'),
--     (10, 'Hilton Hotel 2', 100, '456 Oak St, Anytown USA', 'hilton2@gmail.com', '555-2222'),
--     (11, 'Hilton Hotel 3', 100, '789 Elm St, Anytown USA', 'hilton3@gmail.com', '555-2222'),
--     (12, 'Hilton Hotel 4', 100, '123 Main St, Anytown USA', 'hilton4@gmail.com', '555-2222'),
--     (13, 'Hilton Hotel 5', 100, '456 Oak St, Anytown USA', 'hilton5@gmail.com', '555-2222'),
--     (14, 'Hilton Hotel 6', 100, '789 Elm St, Anytown USA', 'hilton6@gmail.com', '555-2222'),
--     (15, 'Hilton Hotel 7', 100, '123 Main St, Anytown USA', 'hilton7@gmail.com', '555-2222'),
--     (16, 'Hilton Hotel 8', 100, '456 Oak St, Anytown USA', 'hilton8@gmail.com', '555-2222'),

--     (17, 'Accor Hotel 1', 100, '123 Main St, Anytown USA', 'Accor1@gmail.com', '555-3333'),
--     (18, 'Accor Hotel 2', 100, '456 Oak St, Anytown USA', 'Accor2@gmail.com', '555-3333'),
--     (19, 'Accor Hotel 3', 100, '789 Elm St, Anytown USA', 'Accor3@gmail.com', '555-3333'),
--     (20, 'Accor Hotel 4', 100, '123 Main St, Anytown USA', 'Accor4@gmail.com', '555-3333'),
--     (21, 'Accor Hotel 5', 100, '456 Oak St, Anytown USA', 'Accor5@gmail.com', '555-3333'),
--     (22, 'Accor Hotel 6', 100, '789 Elm St, Anytown USA', 'Accor6@gmail.com', '555-3333'),
--     (23, 'Accor Hotel 7', 100, '123 Main St, Anytown USA', 'Accor7@gmail.com', '555-3333'),
--     (24, 'Accor Hotel 8', 100, '456 Oak St, Anytown USA', 'Accor8@gmail.com', '555-3333'),

--     (25, 'Capella Hotel 1', 100, '123 Main St, Anytown USA', 'Capella1@gmail.com', '555-4444'),
--     (26, 'Capella Hotel 2', 100, '456 Oak St, Anytown USA', 'Capella2@gmail.com', '555-4444'),
--     (27, 'Capella Hotel 3', 100, '789 Elm St, Anytown USA', 'Capella3@gmail.com', '555-4444'),
--     (28, 'Capella Hotel 4', 100, '123 Main St, Anytown USA', 'Capella4@gmail.com', '555-4444'),
--     (29, 'Capella Hotel 5', 100, '456 Oak St, Anytown USA', 'Capella5@gmail.com', '555-4444'),
--     (30, 'Capella Hotel 6', 100, '789 Elm St, Anytown USA', 'Capella6@gmail.com', '555-4444'),
--     (31, 'Capella Hotel 7', 100, '123 Main St, Anytown USA', 'Capella7@gmail.com', '555-4444'),
--     (32, 'Capella Hotel 8', 100, '456 Oak St, Anytown USA', 'Capella8@gmail.com', '555-4444'),

--     (33, 'Oberoi Hotel 1', 100, '123 Main St, Anytown USA', 'Oberoi1@gmail.com', '555-5555'),
--     (34, 'Oberoi Hotel 2', 100, '456 Oak St, Anytown USA', 'Oberoi2@gmail.com', '555-5555'),
--     (35, 'Oberoi Hotel 3', 100, '789 Elm St, Anytown USA', 'Oberoi3@gmail.com', '555-5555'),
--     (36, 'Oberoi Hotel 4', 100, '123 Main St, Anytown USA', 'Oberoi4@gmail.com', '555-5555'),
--     (37, 'Oberoi Hotel 5', 100, '456 Oak St, Anytown USA', 'Oberoi5@gmail.com', '555-5555'),
--     (38, 'Oberoi Hotel 6', 100, '789 Elm St, Anytown USA', 'Oberoi6@gmail.com', '555-5555'),
--     (39, 'Oberoi Hotel 7', 100, '123 Main St, Anytown USA', 'Oberoi7@gmail.com', '555-5555'),
--     (40, 'Oberoi Hotel 8', 100, '456 Oak St, Anytown USA', 'Oberoi8@gmail.com', '555-5555');
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