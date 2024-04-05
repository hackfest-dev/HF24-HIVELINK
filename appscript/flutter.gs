function writeToFirestore() {
  var spreadsheetId = '1EX2AG-2kj42PIPrY9d4QhKYPfHS6xhJKOzVQ9Gs7zs8'; 
  var sheetName = 'Sheet1'; // Replace with your sheet name

  // Open the spreadsheet and select the sheet
  var spreadsheet = SpreadsheetApp.openById(spreadsheetId);
  var sheet = spreadsheet.getSheetByName(sheetName);

  if (!sheet) {
    Logger.log("Sheet '" + sheetName + "' not found in the spreadsheet.");
    return;
  }

  var dataRange = sheet.getDataRange();
  var data = dataRange.getValues();
  var firestore = FirestoreApp.getFirestore('login-25hn6a'); // Replace with your Firestore project ID

  for (var i = data.length-1; i < data.length; i++) {
    var row = data[i];
    var timestamp = new Date(row[0] + ' ' + row[1]); 
    var hiveTemperature = row[2]; 
    var hiveHumidity = row[3];
    var supplementQuantity = row[4]; 
    var weight = row[5]; 
    var status = (weight < 0 || weight > 1000) ? 'Inactive' : 'Healthy';

    var documentData = {
      HiveName: 'Hive1',
      status: status,
      timestamp: timestamp,
      hiveTemperature: hiveTemperature,
      hiveHumidity: hiveHumidity,
      supplementQuantity: supplementQuantity,
      weight: weight,
      location: new firebase.firestore.GeoPointGeoPoint(12.92186, 74.912331),
      LocationName:'Vamanjoor'
    };

    var documentId = 'hiveData' + i; // Generate a unique document ID
    firestore.createDocument('hiveDataCollection', documentId, documentData);
  }
}
