from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
from ultralytics import YOLO
import datetime
import pytz
from ultralytics import YOLO
import os
import numpy as np
import matplotlib.pyplot as plt
import librosa.display
import requests
import tempfile
from urllib.parse import urlparse


app = FastAPI()
model = YOLO(r"D:\Hivelink\runs\classify\train2\weights\best.pt")
status=0

def plot_spectrogram_with_mfcc(file_path):
    y, sr = librosa.load(file_path)
    n_fft = 2048
    hop_length = 512
    spectrogram = np.abs(librosa.stft(y, n_fft=n_fft, hop_length=hop_length))
    freqs = librosa.fft_frequencies(sr=sr)

        # Calculate mean amplitude over time
    mean_amplitude = np.mean(spectrogram, axis=1)

    max_freq_index = np.argmax(mean_amplitude)

        # Retrieve corresponding frequencies
    most_frequent_freq = freqs[max_freq_index]

    mfccs = librosa.feature.mfcc(y=y, sr=sr, n_mfcc=13)

    plt.figure(figsize=(8, 8))
    librosa.display.specshow(
        mfccs, sr=sr, hop_length=hop_length, x_axis='time')
    plt.axis('off')  # Turn off axis
    plt.tight_layout()
    # plt.show()
    plt.savefig(r'D:\Hivelink\runs\classify\temp\temp.png',bbox_inches='tight', pad_inches=0)
    return most_frequent_freq


def download_audio(url, temp_folder=r'D:\Hivelink\runs\classify\temp'):
    try:
        response = requests.get(url)
        if response.status_code == 200:
            filename = 'temp.wav'
            
            file_path = os.path.join(temp_folder, filename)

            with open(file_path, 'wb') as f:
                f.write(response.content)

            print(f"Audio downloaded successfully to: {file_path}")
            return file_path
        else:
            print(
                f"Failed to download audio. Status code: {response.status_code}")
            return None
    except Exception as e:
        print(f"Error downloading audio: {e}")
        return None


def unix_to_datetime(unix_timestamp):
    utc_datetime = datetime.datetime.utcfromtimestamp(unix_timestamp)
    indian_timezone = pytz.timezone('Asia/Kolkata')
    return pytz.utc.localize(utc_datetime).astimezone(indian_timezone)


@app.post("/hive")
async def hive(data: dict):
    print(data)
    var=0
    pred=0
    humidity = data["humidity"]
    temperature = data["temperature"]
    audioURL = data["audioURL"]
    var=    unix_to_datetime( data['dateTime'])

        
    file_name = download_audio(audioURL)
    plot_spectrogram_with_mfcc(file_name)
    results = model.predict(r"D:\Hivelink\runs\classify\temp\temp.png")
    for result in results:
        pred =result.probs.top1
    if pred==0:
        status=0
    else:
        status=1
    print(status)
    data['status'] = status  # Add status to data

    
    return {"data": data}


@app.get("/")
def read_root():
    return {"Hello": "World"}
