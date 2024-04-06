function extractTime(timestampString) {
  var date = new Date(timestampString); // Convert the timestamp string to a Date object
  
  // Get the hours, minutes, and seconds from the Date object
  var hours = date.getHours();
  var minutes = date.getMinutes();
  var seconds = date.getSeconds();
  
  // Format the time as HH:mm:ss
  var timeFormatted = ("0" + hours).slice(-2) + ":" + ("0" + minutes).slice(-2) + ":" + ("0" + seconds).slice(-2);
  
  return timeFormatted; 
}


function fetchPrediction(syrup_level) {
  if (syrup_level === undefined) {
    Logger.log("Syrup level is undefined. Aborting fetch.");
    return;
  }
  if(syrup_level <30){
    return {"prediction":0}
  }
  try {
    var apiUrl = "https://1950-152-58-211-99.ngrok-free.app/get_schedule_prediction?syrup_level=" +syrup_level;

    var options = {
      'method': 'post',
      'contentType': 'application/json',
    };

    var response = UrlFetchApp.fetch(apiUrl, options);
    var responseData = response.getContentText();
    var parsedData = JSON.parse(responseData);
    return parsedData;// Log the response data
  } catch (error) {
    Logger.log("Error fetching prediction: " + error.toString());
  }
}



function writeDataToFirebase() {
  var ss = SpreadsheetApp.openById("1EX2AG-2kj42PIPrY9d4QhKYPfHS6xhJKOzVQ9Gs7zs8");
  var sheet = ss.getSheets()[0];
  var data = sheet.getDataRange().getValues();
  var dataImport = {};
  var firestore = FirestoreApp.getFirestore(
    "firebase-adminsdk-7kg2n@login-25hn6a.iam.gserviceaccount.com",
    "PRIVATEKEY",
    "login-25hn6a"
  );


  for (var i = data.length-1; i < data.length; i++) {
    var row = data[i];

    // Extract data from the row
    var timestamp = row[1]; // Assuming Time and Hive Temperature are in columns A and B
    var hiveTemperature; 
    if(row[2] == NaN || row[2] == "nan"){
      var hiveTemperature = 0; 
    }else{
      var hiveTemperature = row[2]; 
    }
    var hiveHumidity = ( row[3] > 100) ? 0: row[3];
    var supplementQuantity = row[4]; // Assuming Supplement Quantity is in column E
    var weight = row[5]; // Assuming Weight is in column F

    var existingData = firestore.getDocument('hiveDataCollection/' + 'hiveData1');
    var location = existingData['fields']['location']['geoPointValue'];

    var prediction = fetchPrediction(supplementQuantity)

    // Create a Firestore document with the extracted data
    var documentData = {
      HiveName: 'Hive1',
      status: status,
      timestamp: extractTime(timestamp),
      hiveTemperature: hiveTemperature,
      hiveHumidity: hiveHumidity,
      supplementQuantity: supplementQuantity,
      weight: weight,
      location: location,
      LocationName:'Vamanjoor',
      statusNumber:statusNumber,
      statusColor: statusColor,
      prediction:prediction["prediction"]
    };
    Logger.log(documentData)
    // Write the document to Firestore
    var documentId = timestamp.getTime().toString(); // Convert timestamp to milliseconds and use as string
    firestore.updateDocument('hiveDataCollection/' + 'hiveData1', documentData);
  }
}
