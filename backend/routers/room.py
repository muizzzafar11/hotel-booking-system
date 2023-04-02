from fastapi import APIRouter, Query
from pydantic import BaseModel
import mysql.connector
from typing import Optional

routes = APIRouter()

class Room(BaseModel):
    RoomNum: int
    HotelID: int
    Price: int
    amenities: str
    capacity: str
    view: str
    can_extend: bool
    issues: str

# class Filters(BaseModel):
#     chainName: str
#     hotelName: str
#     canExtend: str
#     amneties: str
#     view: str
#     capacity: str
#     price: str

def build_where_clause(filters):
    where_clause = []
    if filters['price'] is not None:
        where_clause.append(f"r.price <= {int(filters['price'])}")
    if filters['view'] is not None:
        where_clause.append(f"r.view LIKE '{filters['view']}'")
    if filters['amenities'] is not None:
        where_clause.append(f"r.amenities LIKE '{filters['amenities']}'")
    if filters['capacity'] is not None:
        where_clause.append(f"r.capacity >= {int(filters['capacity'])}")
    if filters['can_extend'] is not None:
        where_clause.append(f"r.can_extend = {bool(filters['can_extend'])}")
    if filters['chain_name'] is not None:
        where_clause.append(f"hc.chain_name = '{filters['chain_name']}'")
    if filters['rating'] is not None:
        where_clause.append(f"c.rating = '{int(filters['rating'])}'")
    if where_clause:
        return 'WHERE ' + ' AND '.join(where_clause)
    else:
        return ''


@routes.get("/api/getRoomList")
async def getRoomList(
              chainNameFilter: str = Query(None),
              ratingFiler: int = Query(None), 
              roomCapacityFilter: int = Query(None),  
              viewFilter: str = Query(None),          
              priceFilter: int = Query(None),
              canExtendFilter: bool = Query(None),
              amenitiesFilter: str = Query(None),
              ):
    cnx = mysql.connector.connect(
        user='root',
        password='root',
        host='localhost',
        database='DBAssignment'
    )
    cursor = cnx.cursor()
    filterDict = {
        'price': priceFilter,
        'view': viewFilter,
        'amenities': amenitiesFilter,
        'capacity': roomCapacityFilter,
        'can_extend': canExtendFilter,
        'chain_name': chainNameFilter,
        'rating': ratingFiler,
    }
    print('filterDict', )
    where_clause = build_where_clause(filterDict)

    query = f"SELECT * FROM room r JOIN hotels h ON r.hotel_id = h.hotel_id JOIN category c ON c.hotel_id = r.hotel_id JOIN hotel_chains hc ON c.chain_id = hc.chain_id {where_clause};"
    
    print(query)

    # cursor.execute(query, where_params)
    cursor.execute(query)
    result = cursor.fetchall()
    # cnx.commit()

    cursor.close()
    cnx.close()
    return result
    # return "success"

