from fastapi import APIRouter, HTTPException
from pydantic import BaseModel
import mysql.connector

routes = APIRouter()

@routes.get("/api/bookingRooms/{ssn_customer}")
async def get_customer_rooms(ssn_customer: str):
    # connect to the database
    cnx = mysql.connector.connect(
        user='root',
        password='root',
        host='localhost',
        database='DBAssignment'
    )

    # prepare the SQL query
    query = """
        SELECT 
            h.hotel_name, 
            h.address, 
            h.email, 
            h.phone, 
            r.room_number, 
            r.price, 
            r.amenities, 
            r.capacity, 
            r.view, 
            hc.chain_name, 
            c.rating,
            b.booking_id
        FROM 
            booking b
            INNER JOIN room r ON b.room_number = r.room_number
            INNER JOIN hotels h ON r.hotel_id = h.hotel_id
            INNER JOIN category c ON h.hotel_id = c.hotel_id
            INNER JOIN hotel_chains hc ON c.chain_id = hc.chain_id
            INNER JOIN customer cu ON b.ssn_customer = cu.ssn_customer
        WHERE 
            b.ssn_customer = %s
    """

    # print(query)
    # execute the query with the given ssn_customer
    cursor = cnx.cursor()
    cursor.execute(query, (ssn_customer,))

    # fetch the results and store them in a list of dictionaries
    rooms = []
    for row in cursor:
        rooms.append(row)

    # close the database connection
    cursor.close()
    cnx.close()
    print(rooms)
    # return the list of rooms as JSON
    return rooms

@routes.post("/api/changeBookingType/{booking_id}")
async def change_booking_type(booking_id: int):
    # connect to the database
    cnx = mysql.connector.connect(
        user='root',
        password='root',
        host='localhost',
        database='DBAssignment'
    )

    # prepare the SQL query
    query = """
        SELECT * from booking b WHERE b.booking_id = %i
        INSERT INTO renting (room_number, checkin_date, checkout_date, ssn_customer)
        VALUES (b.room_number, b.checkin_date, b.checkout_date, b.ssn_customer);
    """
    cursor = cnx.cursor()

    cursor.execute(query, booking_id)
    # close the database connection
    cursor.close()
    cnx.close()
    # return the list of rooms as JSON
    return ""