# HiveLink - Detection of Swarming and Absconding events

HiveLink is a comprehensive solution for monitoring and managing bee colonies in traditional beekeeping practices. Our innovative approach leverages technology to address common challenges such as swarming, absconding, hive fall, viral infections, and pest infestations. By providing real-time hive monitoring, early threat detection, scientific feeding recommendations, pest management, market linkage for honey sales, and the creation of a centralized database, HiveLink aims to promote environmental sustainability and support the livelihoods of beekeepers.

## Problem Statement

Traditional beekeeping practices often face challenges in monitoring and managing colonies, leading to issues such as swarming, absconding, hive fall, viral infections, and pest infestations. These challenges can significantly impact honey production, environmental sustainability, and beekeeper livelihoods.

Swarming occurs when a queen bee leaves the hive with a large group of worker bees to establish a new colony, leaving behind a smaller population in the original hive. This natural behavior can lead to a loss of honey production and weaken the parent colony.

Absconding is when the entire bee colony, including the queen and worker bees, leaves the hive due to unfavorable conditions such as disease, pest infestations, or environmental stressors. Absconding events can result in complete loss of the colony and disrupt beekeeping operations.


## Technology Stack

- Flutterflow
- Firebase
- AppScript
- TensorFlow
- Librosa
- Ultralytics
- FastAPI

## Architecture

1. Data Transmission: Sensor data is transmitted to the system via IoT devices, ensuring continuous data flow for analysis.
2. Data Flow:
   - Google Sheets Integration: Sensor data is initially collected and stored in Google Sheets using Google Apps Script.
   - Firebase Integration: Data seamlessly integrates with  Firebase, offering structured and scalable storage.
   - Software Application: The Flutterflow application provides a simple UI for farmers and beekeepers to access data and receive recommendations.
3. Software Infrastructure: FastAPI serves as the backend server, facilitating communication between the Flutter application and the machine learning models.
4. Machine Learning Models:
   - Custom Trained ML Model for Predictive Analysis: Custom-trained to predict events such as absconding and swarming in beehives based on input factors such as temperature, humidity, weight, and buzzing frequency.

## Contributors

- Team Name: HiveLink
- College Name: St Joseph Engineering College, Karnataka
- Track: Sustainable Development
- HACKFEST - 2024

## License

© 2025 HiveLink. All rights reserved.
Unauthorized copying, modification, distribution, or use of this project, in whole or in part, without prior written permission from the author is strictly prohibited.
