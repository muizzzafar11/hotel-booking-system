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
        host='db',
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

@routes.post("/api/changeBookingType/{booking_id}/{ssn_employee}")
async def change_booking_type(booking_id: int, ssn_employee: str):
    # connect to the database
    cnx = mysql.connector.connect(
        user='root',
        password='root',
        host='db',
        database='DBAssignment'
    )

    # prepare the SQL query
    select_query = """
        SELECT * FROM booking WHERE booking_id = %s
    """
    insert_query = """
        INSERT INTO renting (room_number, checkin_date, checkout_date, ssn_customer, ssn_employee)
        VALUES (%s, %s, %s, %s, %s)
    """

    cursor = cnx.cursor()

    # select the booking with the given booking_id
    cursor.execute(select_query, (booking_id,))
    booking = cursor.fetchone()

    if not booking:
        return "Booking not found"

    # insert a new row into the renting table
    cursor.execute(insert_query, (booking[1], booking[2], booking[3], booking[4], ssn_employee))

    # commit the changes
    cnx.commit()

    # close the database connection
    cursor.close()
    cnx.close()
    
    return ""
