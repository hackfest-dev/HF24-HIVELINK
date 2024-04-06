from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
from ultralytics import YOLO
import datetime
import pytz


app = FastAPI()
model = YOLO("../ml_model/best.pt")


def unix_to_datetime(unix_timestamp):
    utc_datetime = datetime.datetime.fromtimestamp(unix_timestamp)
    indian_timezone = pytz.timezone('Asia/Kolkata')
    return pytz.utc.localize(utc_datetime).astimezone(indian_timezone)


@app.post("/hive")
async def hive(data: dict):
    humidity = data["humidity"]
    temperature = data["temperature"]
    audioURL = data["audioURL"]
    dateTime = unix_to_datetime(data["dateTime"])
    return {"data": dateTime}


@app.get("/")
def read_root():
    return {"Hello": "World"}
