import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HiveDataCollectionRecord extends FirestoreRecord {
  HiveDataCollectionRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "HiveName" field.
  String? _hiveName;
  String get hiveName => _hiveName ?? '';
  bool hasHiveName() => _hiveName != null;

  // "LocationName" field.
  String? _locationName;
  String get locationName => _locationName ?? '';
  bool hasLocationName() => _locationName != null;

  // "UID" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "hiveTemperature" field.
  double? _hiveTemperature;
  double get hiveTemperature => _hiveTemperature ?? 0.0;
  bool hasHiveTemperature() => _hiveTemperature != null;

  // "supplementQuantity" field.
  double? _supplementQuantity;
  double get supplementQuantity => _supplementQuantity ?? 0.0;
  bool hasSupplementQuantity() => _supplementQuantity != null;

  // "weight" field.
  double? _weight;
  double get weight => _weight ?? 0.0;
  bool hasWeight() => _weight != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "prediction" field.
  double? _prediction;
  double get prediction => _prediction ?? 0.0;
  bool hasPrediction() => _prediction != null;

  // "temperatureList" field.
  List<double>? _temperatureList;
  List<double> get temperatureList => _temperatureList ?? const [];
  bool hasTemperatureList() => _temperatureList != null;

  // "hiveHumidity" field.
  int? _hiveHumidity;
  int get hiveHumidity => _hiveHumidity ?? 0;
  bool hasHiveHumidity() => _hiveHumidity != null;

  // "humidityList" field.
  List<int>? _humidityList;
  List<int> get humidityList => _humidityList ?? const [];
  bool hasHumidityList() => _humidityList != null;

  // "timeList" field.
  List<String>? _timeList;
  List<String> get timeList => _timeList ?? const [];
  bool hasTimeList() => _timeList != null;

  // "weightList" field.
  List<double>? _weightList;
  List<double> get weightList => _weightList ?? const [];
  bool hasWeightList() => _weightList != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  void _initializeFields() {
    _hiveName = snapshotData['HiveName'] as String?;
    _locationName = snapshotData['LocationName'] as String?;
    _uid = snapshotData['UID'] as String?;
    _hiveTemperature = castToType<double>(snapshotData['hiveTemperature']);
    _supplementQuantity =
        castToType<double>(snapshotData['supplementQuantity']);
    _weight = castToType<double>(snapshotData['weight']);
    _location = snapshotData['location'] as LatLng?;
    _prediction = castToType<double>(snapshotData['prediction']);
    _temperatureList = getDataList(snapshotData['temperatureList']);
    _hiveHumidity = castToType<int>(snapshotData['hiveHumidity']);
    _humidityList = getDataList(snapshotData['humidityList']);
    _timeList = getDataList(snapshotData['timeList']);
    _weightList = getDataList(snapshotData['weightList']);
    _status = snapshotData['status'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('hiveDataCollection');

  static Stream<HiveDataCollectionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HiveDataCollectionRecord.fromSnapshot(s));

  static Future<HiveDataCollectionRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => HiveDataCollectionRecord.fromSnapshot(s));

  static HiveDataCollectionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      HiveDataCollectionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HiveDataCollectionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HiveDataCollectionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HiveDataCollectionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HiveDataCollectionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHiveDataCollectionRecordData({
  String? hiveName,
  String? locationName,
  String? uid,
  double? hiveTemperature,
  double? supplementQuantity,
  double? weight,
  LatLng? location,
  double? prediction,
  int? hiveHumidity,
  String? status,
  DateTime? timestamp,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'HiveName': hiveName,
      'LocationName': locationName,
      'UID': uid,
      'hiveTemperature': hiveTemperature,
      'supplementQuantity': supplementQuantity,
      'weight': weight,
      'location': location,
      'prediction': prediction,
      'hiveHumidity': hiveHumidity,
      'status': status,
      'timestamp': timestamp,
    }.withoutNulls,
  );

  return firestoreData;
}

class HiveDataCollectionRecordDocumentEquality
    implements Equality<HiveDataCollectionRecord> {
  const HiveDataCollectionRecordDocumentEquality();

  @override
  bool equals(HiveDataCollectionRecord? e1, HiveDataCollectionRecord? e2) {
    const listEquality = ListEquality();
    return e1?.hiveName == e2?.hiveName &&
        e1?.locationName == e2?.locationName &&
        e1?.uid == e2?.uid &&
        e1?.hiveTemperature == e2?.hiveTemperature &&
        e1?.supplementQuantity == e2?.supplementQuantity &&
        e1?.weight == e2?.weight &&
        e1?.location == e2?.location &&
        e1?.prediction == e2?.prediction &&
        listEquality.equals(e1?.temperatureList, e2?.temperatureList) &&
        e1?.hiveHumidity == e2?.hiveHumidity &&
        listEquality.equals(e1?.humidityList, e2?.humidityList) &&
        listEquality.equals(e1?.timeList, e2?.timeList) &&
        listEquality.equals(e1?.weightList, e2?.weightList) &&
        e1?.status == e2?.status &&
        e1?.timestamp == e2?.timestamp;
  }

  @override
  int hash(HiveDataCollectionRecord? e) => const ListEquality().hash([
        e?.hiveName,
        e?.locationName,
        e?.uid,
        e?.hiveTemperature,
        e?.supplementQuantity,
        e?.weight,
        e?.location,
        e?.prediction,
        e?.temperatureList,
        e?.hiveHumidity,
        e?.humidityList,
        e?.timeList,
        e?.weightList,
        e?.status,
        e?.timestamp
      ]);

  @override
  bool isValidKey(Object? o) => o is HiveDataCollectionRecord;
}
