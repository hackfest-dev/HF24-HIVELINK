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

function parseDateTime(dateObject, timeString) {
    // Check if dateObject is a Date object
    if (!(dateObject instanceof Date)) {
        throw new Error('Invalid input: dateString must be a Date object.');
    }

    // Extract year, month, and day components from the date object
    var year = dateObject.getFullYear();
    var month = dateObject.getMonth();
    var day = dateObject.getDate();
  
    var hour = timeString.getHours();
    var minute = timeString.getMinutes()
  
    // Create a new Date object with the combined date and time components
    var datetime = new Date(year, month, day, hour, minute);
  
    return datetime;
}

function writeDataToFirebase() {
  var ss = SpreadsheetApp.openById("1EX2AG-2kj42PIPrY9d4QhKYPfHS6xhJKOzVQ9Gs7zs8");
  var sheet = ss.getSheets()[0];
  var data = sheet.getDataRange().getValues();
  var dataImport = {};
  var firestore = FirestoreApp.getFirestore(
    "firebase-adminsdk-7kg2n@login-25hn6a.iam.gserviceaccount.com",
    "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDjdBV/Ruyet/Aj\noVZtueLm3BpIig2zJ/doZFcZIlfKPO6YybHxc40TKp6hhnKqBRc40m3X3trDvmlN\nQdvlTG6U06N8p4aLII/VI//Z738tBikKjozHnlUKAZlpLmZjvQGEePsaxDtGV4eH\nqXriLvYD0AN+ExkIkMxMoitvzvGDnju11nr3sXpPgUxmfary/WUgbqYQO3t63M5Y\npyqq8X8i1fe1jZ3MxVZO0xCmDVc4Rh6ua8+tViCsVDtRKSY8DJCUlDlVBPDSjLRg\nzjI61SxJcaG3Va7mvqzOzQf8Zo7nMqHh48hYtLAB42tfjkZikfUXGYcYm5UEXmIJ\neZaldX1vAgMBAAECggEAGS7JEoZvvELxO4CpaQyjqpvD7TQbwDI0mkJBwm6i+ak1\nYYUzRmBcxjp5xbh1CY32vDvQHY52+iUi04LvLbwAokmsWCjUJKM+SYLq2N5DXmDI\nOnr96zwEfk8fBR42B+TtPhWG97eyOF+IieShzlkUs+db+6FxrBkcBYAO/xoSc1fk\nGJA+ZAVze+pAjLVXUP0Pg+c0jKFozi/egPfQnSuFeN6p5RQi0d6XI673H/5mdOlP\nvTuhP9TCiL+07Pv6iVKFpusQ4kOFPDG/CqEt62EiYlZgYoi+7fZ5ihq+SYsXBJRM\niPhliLCcVUKPWMwQl+zdxStPrEgAYXs96RogOm7XgQKBgQD8DO2ATyiq7ehlRLhC\nRz+xLKMcpE7JqmtE5Jww6ojCiOYogXN4rBik16+fxbULbA85Wm/0uTP2YH4MkB9g\ne+qJHya6mpJKBQ+6sIBKK/3rXDD51grow/lgbYsTA2IMmPf13z5jMV2oSJF9nX1z\n+w0709u7HUL4flT6Xdys3nzN+QKBgQDnBHzqIy1g+T61NeKe6/B9cbkstWGi3og7\nziPB+P7M0RyW52ZbG4taK5AB/Ti9JSGQI+HxIRTQ6UCsMH6j+dDHDhlkSoWUd3Ao\n88ELdeUpqOvijkVcDkIR7xPvvbJazWgTIKw4zV4xAeWqLpx8dbh04vTOQRK7PIYu\nOHQ47awgpwKBgQC6+EAJyS6qtTaKQJLKn52wqSMKMRw83o0aGtd+NcxjOjg5XeWx\nY0AYr+KYi4mEQpF8gwi/qc7Q+b0nRpXv9ZwCQbhx/g18mQqU+y7/VmjSeZ3fBpcr\nGYzYqgnbfcvy+lod6o+V9125YrOCUhxot5eWhM7fm5I9UUFqQ8xZ8+TyyQKBgBsB\nRkzkcdCNMkxikSw8rm8rlRbp2RD97HT5QurQ3ZA5vZrST//Ed4TB5OKmpDRQG91K\npIXYdSN6sMmwHY2zjTlHp6Y2o+jYEW9oFx/s1y4IhhKEyQzaydRo2y7CQRAmRM0/\nm4JEV4dpDlzXeAmAhWB8i1t09eiXSaQri0KAXgevAoGACEWdq/iqub8tY/HbK7Xn\nW/LZE08aU69Ney48rM/Fk1mNQehkURltjp5R2KdG+WsGonqYuLs5Wu1EgLrjb2fH\n5jRtgoZQcIXP0o6LF//63cL9eYpi2yqRga+5vK94UFkrvB7NMwuKDn1dd4u106hl\n0dazr83BLhfw5CBSQuyWJ5o=\n-----END PRIVATE KEY-----\n",
    "login-25hn6a"
  );


  for (var i = data.length-1; i < data.length; i++) {
    var row = data[i];

    // Extract data from the row
    var date = row[0]
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
    // var oldTimeList = existingData['fields']['timeList'];
    var oldHumidityList = existingData['fields']['humidityList'];
    var oldTempList = existingData['fields']['temperatureList'];
    var oldWeightList = existingData['fields']['weightList'];
    var existingStatus = existingData['fields']['status'].stringValue;
    Logger.log(existingStatus)
    



// Function to convert Firestore values to numbers
function toNumber(value) {
  if (value === null || value === undefined) {
    return null;
  }
  // Check if the value is already a number
  if (typeof value === 'number') {
    return value;
  }
  // If not, try converting it to a number
  var numValue = parseFloat(value);
  // Check if the conversion was successful
  if (!isNaN(numValue)) {
    return numValue;
  }
  // If conversion failed, return null
  return null;
}


// Initialize lists as arrays if they are not already arrays
if (!Array.isArray(oldHumidityList)) {
  // Check if oldHumidityList exists in existingData and is an array
  if (existingData.fields.humidityList && existingData.fields.humidityList.arrayValue.values) {
    oldHumidityList = existingData.fields.humidityList.arrayValue.values
      .map(function(item) {
        return toNumber(item.integerValue);
      })
      .filter(function(value) {
        return value !== null;
      });
  } else {
    oldHumidityList = [];
  }
}

if (!Array.isArray(oldTempList)) {
  // Check if oldTempList exists in existingData and is an array
  if (existingData.fields.temperatureList && existingData.fields.temperatureList.arrayValue.values) {
    oldTempList = existingData.fields.temperatureList.arrayValue.values
      .map(function(item) {
        return toNumber(item.doubleValue);
      })
      .filter(function(value) {
        return value !== null;
      });
  } else {
    oldTempList = [];
  }
}

// if (!Array.isArray(oldTimeList)) {
//   // Check if oldTimeList exists in existingData and is an array
//   if (existingData.fields.timeList && existingData.fields.timeList.arrayValue.values) {
//     oldTimeList = existingData.fields.timeList.arrayValue.values
//       .map(function(item) {
//         return new Date(item.stringValue); // Convert time values to Date objects
//       })
//       .filter(function(value) {
//         return value !== null && !isNaN(value.getTime()); // Filter out invalid dates
//       });
//   } else {
//     oldTimeList = [];
//   }
// }
  
  if (!Array.isArray(oldWeightList)) {
  // Check if oldWeightList exists in existingData and is an array
  if (existingData.fields.weightList && existingData.fields.weightList.arrayValue.values) {
    oldWeightList = existingData.fields.weightList.arrayValue.values
      .map(function(item) {
        return toNumber(item.doubleValue);
      })
      .filter(function(value) {
        return value !== null;
      });
  } else {
    oldWeightList = [];
  }
}

  // oldHumidityList.push(hiveHumidity);
  // oldTempList.push(hiveTemperature);
  // // oldTimeList.push(timestamp)
  // oldWeightList.push(weight)
  Logger.log(typeof timestamp)



    // Create a Firestore document with the extracted data
    var documentData = {
      HiveName: 'Hive1',
      status: existingStatus,
      timestamp: parseDateTime(date,timestamp),
      hiveTemperature: hiveTemperature,
      hiveHumidity: hiveHumidity,
      supplementQuantity: supplementQuantity,
      weight: weight,
      location: location,
      LocationName:'Vamanjoor',
      temperatureList:oldTempList,
      humidityList:oldHumidityList,
      // timeList:oldTimeList,
      weightList:oldWeightList

    };
    Logger.log(documentData)
    // Write the document to Firestore
    var documentId = timestamp.getTime().toString(); // Convert timestamp to milliseconds and use as string
    firestore.updateDocument('hiveDataCollection/' + 'hiveData1', documentData);
  }
}
