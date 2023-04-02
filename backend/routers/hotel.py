from fastapi import APIRouter
from pydantic import BaseModel
import mysql.connector

routes = APIRouter()

class Hotel(BaseModel):
    chainName: str
    lastName: str
    numHotels: str
    email: str
    phoneNum: str

@routes.get("/api/getHotelList")
async def getHotelList(rating: int, chain_id: int):
    cnx = mysql.connector.connect(
        user='root',
        password='root',
        host='localhost',
        database='DBAssignment'
    )
    cursor = cnx.cursor()
    # query = "SELECT * FROM hotels JOIN category ON hotels.hotel_id = category.hotel_id WHERE category.chain_id = %i AND category.rating = %i"
    query = "SELECT * FROM hotels JOIN category ON hotels.hotel_id = category.hotel_id WHERE category.chain_id = %i AND category.rating = %i"
    data = (chain_id, rating)

    cursor.execute(query, data)
    result = cursor.fetchall()
    # cnx.commit()

    cursor.close()
    cnx.close()
    return result
