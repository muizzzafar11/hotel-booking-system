from fastapi import APIRouter, Query
from pydantic import BaseModel
import mysql.connector
from typing import Optional

routes = APIRouter()

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
    if filters['number_rooms'] is not None:
        where_clause.append(f"h.number_rooms >= '{filters['number_rooms']}'")
    if filters['area'] is not None:
        where_clause.append(f"h.area = '{filters['area']}'")
    if filters['checkin_date'] is not None and filters['checkout_date'] is not None:
        where_clause.append(f'''
        NOT EXISTS (
            SELECT 1
            FROM booking b
            WHERE b.room_number = r.room_number
            AND (
                (b.checkin_date >= '{filters['checkin_date']}' AND b.checkin_date < '{filters['checkout_date']}')
                OR (b.checkout_date > {filters['checkin_date']} AND b.checkout_date <= '{filters['checkout_date']}')
                OR ('{filters['checkin_date']}' >= b.checkin_date AND '{filters['checkin_date']}' < b.checkout_date)
                OR ('{filters['checkout_date']}' > b.checkin_date AND '{filters['checkout_date']}' <= b.checkout_date)
            )
        )
        AND NOT EXISTS (
            SELECT 1
            FROM renting rt
            WHERE rt.room_number = r.room_number
            AND (
                (rt.checkin_date >= '{filters['checkin_date']}' AND rt.checkin_date < '{filters['checkout_date']}')
                OR (rt.checkout_date > '{filters['checkin_date']}' AND rt.checkout_date <= '{filters['checkout_date']}')
                OR ('{filters['checkin_date']}' >= rt.checkin_date AND '{filters['checkin_date']}' < rt.checkout_date)
                OR ('{filters['checkout_date']}' > rt.checkin_date AND '{filters['checkout_date']}' <= rt.checkout_date)
            )
        )
        ''')
    if filters['rating'] is not None:
        where_clause.append(f"c.rating = '{int(filters['rating'])}'")
    if where_clause:
        return 'WHERE ' + ' AND '.join(where_clause)
    else:
        return ''


@routes.get("/api/getRoomList")
async def getRoomList(
              chainNameFilter: str = Query(None),
              ratingFilter: int = Query(None), 
              roomCapacityFilter: int = Query(None),  
              viewFilter: str = Query(None),          
              priceFilter: int = Query(None),
              canExtendFilter: bool = Query(None),
              amenitiesFilter: str = Query(None),
              checkinDateFilter: str = Query(None),
              checkoutDateFilter: str = Query(None),
              areaFilter: str = Query(None),
              roomNumberFilter: int = Query(None),
              ):
    cnx = mysql.connector.connect(
        user='root',
        password='root',
        host='localhost',
        database='DBAssignment'
    )
    cursor = cnx.cursor()
    print('CheckinDateFilter', checkinDateFilter, checkoutDateFilter)
    filterDict = {
        'price': priceFilter,
        'view': viewFilter,
        'amenities': amenitiesFilter,
        'capacity': roomCapacityFilter,
        'can_extend': canExtendFilter,
        'chain_name': chainNameFilter,
        'rating': ratingFilter,
        'checkin_date': checkinDateFilter,
        'checkout_date': checkoutDateFilter,
        'area': areaFilter,
        'number_rooms': roomNumberFilter
    }

    print('filterDict', filterDict['checkin_date'])
    where_clause = build_where_clause(filterDict)

    query = f'''
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
    c.rating 
    FROM room r 
    JOIN hotels h ON r.hotel_id = h.hotel_id 
    JOIN category c ON c.hotel_id = r.hotel_id 
    JOIN hotel_chains hc ON c.chain_id = hc.chain_id 
    {where_clause};'''
    
    print('query',query)

    # cursor.execute(query, where_params)
    cursor.execute(query)
    result = cursor.fetchall()
    # cnx.commit()

    cursor.close()
    cnx.close()
    return result
    # return "success"

