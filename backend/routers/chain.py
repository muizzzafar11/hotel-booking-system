from fastapi import APIRouter
from pydantic import BaseModel
import mysql.connector

routes = APIRouter()

class Chain(BaseModel):
    chainName: str
    lastName: str
    numHotels: str
    email: str
    phoneNum: str

@routes.get("/api/getChainsList")
async def getChainsList():
    cnx = mysql.connector.connect(
        user='root',
        password='root',
        host='db',
        database='DBAssignment'
    )
    cursor = cnx.cursor()
    query = "SELECT * from hotel_chains"
    # data = (bookingData.firstName, bookingData.lastName, bookingData.phoneNum, bookingData.email)

    cursor.execute(query)
    result = cursor.fetchall()
    # cnx.commit()

    cursor.close()
    cnx.close()
    return result

@routes.get("/api/getChainsNameList")
async def getChainsNameList():
    cnx = mysql.connector.connect(
        user='root',
        password='root',
        host='db',
        database='DBAssignment'
    )
    cursor = cnx.cursor()
    query = "SELECT chain_name from hotel_chains"
    # data = (bookingData.firstName, bookingData.lastName, bookingData.phoneNum, bookingData.email)

    cursor.execute(query)
    result = cursor.fetchall()
    # cnx.commit()

    cursor.close()
    cnx.close()
    return result
