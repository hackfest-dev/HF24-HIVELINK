from ultralytics import YOLO
import os
import numpy as np
import matplotlib.pyplot as plt
import librosa.display
import requests
import tempfile
from urllib.parse import urlparse





def download_audio(url):
    try:
        response = requests.get(url)
        if response.status_code == 200:
            # Parse the URL to get the filename
            filename = os.path.basename(urlparse(url).path)

            # Create a temporary directory
            with tempfile.TemporaryDirectory() as temp_dir:
                # Construct the path to save the file
                file_path = os.path.join(temp_dir, filename)

                # Write the audio content to the file
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



"https://firebasestorage.googleapis.com/v0/b/login-25hn6a.appspot.com/o/users%2FhI4VKFFMydYxlAK8L9OdCOL1C5B3%2Fuploads%2F1712379587865980.m4a?alt=media&token=4ac5d45f-9fb6-4931-bed3-9505f532782b"



model = YOLO("/Users/joywinbennis/hackfest/ml_model/best.pt")


def plot_spectrogram_with_mfcc(file_path):
    y, sr = librosa.load(file_path)
    n_fft = 2048
    hop_length = 512
    spectrogram = np.abs(librosa.stft(y, n_fft=n_fft, hop_length=hop_length))

    mfccs = librosa.feature.mfcc(y=y, sr=sr, n_mfcc=13)

    plt.figure(figsize=(8, 8))
    librosa.display.specshow(
        mfccs, sr=sr, hop_length=hop_length, x_axis='time')
    plt.axis('off')  # Turn off axis
    plt.tight_layout()
    plt.show()


file_path = "/Users/joywinbennis/hackfest/fastapi/temp/2022-06-13--20-06-14_1__segment3.wav"
plot_spectrogram_with_mfcc(file_path)
