from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
from ultralytics import YOLO


app = FastAPI()

model = YOLO("../ml_model/best.pt")





@app.post("/hive")
async def hive(data: dict):
    print(data)
    return { "data": data }

@app.get("/")
def read_root():
    return {"Hello": "World"}