from ultralytics import YOLO


model = YOLO("/Users/joywinbennis/hackfest/ml_model/best.pt")

import os
import numpy as np
import matplotlib.pyplot as plt
import librosa.display

# Define function to plot spectrogram with MFCC overlay for one file
def plot_spectrogram_with_mfcc(file_path):
    # Load audio file
    y, sr = librosa.load(file_path)


    n_fft = 2048  
    hop_length = 512  
    spectrogram = np.abs(librosa.stft(y, n_fft=n_fft, hop_length=hop_length))

    mfccs = librosa.feature.mfcc(y=y, sr=sr, n_mfcc=13)  

    plt.figure(figsize=(8, 8))  
    librosa.display.specshow(mfccs, sr=sr, hop_length=hop_length, x_axis='time')
   
    plt.axis('off')  # Turn off axis
    plt.tight_layout()
    plt.show()

file_path = "/Users/joywinbennis/hackfest/fastapi/temp/2022-06-13--20-06-14_1__segment3.wav"


plot_spectrogram_with_mfcc(file_path)