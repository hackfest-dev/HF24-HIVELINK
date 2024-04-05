from fastapi import FastAPI, HTTPException
from pydantic import BaseModel

class HiveData(BaseModel):
    humidity: str
    temperature: str
    weight: str
    audioURI: str

app = FastAPI()

@app.post("/hive")
async def get_hive(data: HiveData):
        return { "data": data }

@app.get("/")
def read_root():
    return {"Hello": "World"}