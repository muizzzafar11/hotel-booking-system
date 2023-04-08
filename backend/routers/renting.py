from fastapi import APIRouter, HTTPException
from pydantic import BaseModel
import mysql.connector

routes = APIRouter()

class RentRequest(BaseModel):
    ssn_customer: str
    first_name: str
    last_name: str
    room_number: int
    checkin_date: str
    checkout_date: str
    ssn_employee: str

@routes.post("/api/rent")
async def rentRoom(req: RentRequest):
    cnx = mysql.connector.connect(
        user='root',
        password='root',
        host='localhost',
        database='DBAssignment'
    )
    cursor = cnx.cursor()

    # Check if the room has been booked or not based on the checkin and checkout dates provided
    cursor = cnx.cursor()
    if req.checkin_date is not None and req.checkout_date is not None:
        query = """
            SELECT r.room_number
            FROM room r
            WHERE r.room_number = %s
            AND NOT EXISTS (
                SELECT 1
                FROM booking b
                WHERE b.room_number = r.room_number
                AND (
                    (b.checkin_date >= %s AND b.checkin_date < %s)
                    OR (b.checkout_date > %s AND b.checkout_date <= %s)
                    OR (%s >= b.checkin_date AND %s < b.checkout_date)
                    OR (%s > b.checkin_date AND %s <= b.checkout_date)
                )
            )
            AND NOT EXISTS (
                SELECT 1
                FROM renting rt
                WHERE rt.room_number = r.room_number
                AND (
                    (rt.checkin_date >= %s AND rt.checkin_date < %s)
                    OR (rt.checkout_date > %s AND rt.checkout_date <= %s)
                    OR (%s >= rt.checkin_date AND %s < rt.checkout_date)
                    OR (%s > rt.checkin_date AND %s <= rt.checkout_date)
                )
            )
        """
        cursor.execute(query, (req.room_number, req.checkin_date, req.checkout_date, req.checkin_date, req.checkout_date,
                            req.checkin_date, req.checkout_date, req.checkout_date, req.checkin_date,
                            req.checkin_date, req.checkout_date, req.checkin_date, req.checkout_date,
                            req.checkin_date, req.checkout_date, req.checkin_date, req.checkout_date))
        
        result = cursor.fetchone()
        
        # If the room has been booked, raise an exception
        if not result:
            raise HTTPException(status_code=400, detail="Room already booked for selected dates")
            # return {"error": "Booking Not Created"}

    cursor.execute("SELECT * FROM customer WHERE ssn_customer = %s", (req.ssn_customer,))
    customer = cursor.fetchone()
    
    if customer is None:
        # If customer doesn't exist, insert them into the customer table
        cursor.execute("INSERT INTO customer (ssn_customer, first_name, last_name, registration_date) VALUES (%s, %s, %s, CURDATE())", (req.ssn_customer, req.first_name, req.last_name))
    # Insert the booking details into the booking table
    cursor.execute("INSERT INTO renting (room_number, checkin_date, checkout_date, ssn_customer, ssn_employee) VALUES (%s, %s, %s, %s, %s)", (req.room_number, req.checkin_date, req.checkout_date, req.ssn_customer, req.ssn_employee))
    
    # Commit the changes to the database
    cnx.commit()

    cursor.close()
    cnx.close()
    return {"message": "Renting created successfully"}
