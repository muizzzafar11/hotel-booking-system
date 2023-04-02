from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
# from pydantic import BaseModel
# import mysql.connector
from routers import chain, hotel, room

app = FastAPI()

origins = ["http://localhost", "http://localhost:8080"]
app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

app.include_router(chain.routes)
app.include_router(hotel.routes)
app.include_router(room.routes)
# class Booking(BaseModel):
#     firstName: str
#     lastName: str
#     phoneNum: str
#     email: str

# def insertData(bookingData: Booking):
#     cnx = mysql.connector.connect(
#         user='root',
#         password='root
#         host='localhost',
#         database='sys'
#     )
#     cursor = cnx.cursor()

#     query = "INSERT INTO bookings (firstName, lastName, phoneNum, email) VALUES (%s, %s, %s, %s)"
#     data = (bookingData.firstName, bookingData.lastName, bookingData.phoneNum, bookingData.email)

#     cursor.execute(query, data)
#     cnx.commit()

#     cursor.close()
#     cnx.close()

# @app.post("/api/bookings")
# async def addBooking(data: Booking):
#     insertData(data)
#     print(data.firstName)
#     return {"message": "Contact data added to database"}

