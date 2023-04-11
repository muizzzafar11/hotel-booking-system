# hotel-booking-system
## BEFORE RUNNING THE APPLICATION
Make sure ports `8080`, `3306`, and `0.0.0.0:8000` for frontend, db, and backend are free. You might have to stop the local mysql server running on your computer

## TO RUN THE APPLICATION:
```
docker-compose up
```
in the root directory to run all the docker containers and navigate to http://localhost:8080 for the website

## TO STOP THE APPLICATION:
```
docker-compose down
```
in the root directory to stop the containers, and their volumes

## Tech Stack
- Frontend -> Vue, NPM
- Backend -> Python, FastAPI
- Database -> MySQL
- Docker for containerization
