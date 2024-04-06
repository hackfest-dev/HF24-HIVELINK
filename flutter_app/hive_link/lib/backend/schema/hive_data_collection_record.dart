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

  // "hiveHumidity" field.
  double? _hiveHumidity;
  double get hiveHumidity => _hiveHumidity ?? 0.0;
  bool hasHiveHumidity() => _hiveHumidity != null;

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

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "timestamp" field.
  String? _timestamp;
  String get timestamp => _timestamp ?? '';
  bool hasTimestamp() => _timestamp != null;

  // "statusNumber" field.
  int? _statusNumber;
  int get statusNumber => _statusNumber ?? 0;
  bool hasStatusNumber() => _statusNumber != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "statusColor" field.
  Color? _statusColor;
  Color? get statusColor => _statusColor;
  bool hasStatusColor() => _statusColor != null;

  // "prediction" field.
  double? _prediction;
  double get prediction => _prediction ?? 0.0;
  bool hasPrediction() => _prediction != null;

  void _initializeFields() {
    _hiveName = snapshotData['HiveName'] as String?;
    _locationName = snapshotData['LocationName'] as String?;
    _uid = snapshotData['UID'] as String?;
    _hiveHumidity = castToType<double>(snapshotData['hiveHumidity']);
    _hiveTemperature = castToType<double>(snapshotData['hiveTemperature']);
    _supplementQuantity =
        castToType<double>(snapshotData['supplementQuantity']);
    _weight = castToType<double>(snapshotData['weight']);
    _status = snapshotData['status'] as String?;
    _timestamp = snapshotData['timestamp'] as String?;
    _statusNumber = castToType<int>(snapshotData['statusNumber']);
    _location = snapshotData['location'] as LatLng?;
    _statusColor = getSchemaColor(snapshotData['statusColor']);
    _prediction = castToType<double>(snapshotData['prediction']);
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
  double? hiveHumidity,
  double? hiveTemperature,
  double? supplementQuantity,
  double? weight,
  String? status,
  String? timestamp,
  int? statusNumber,
  LatLng? location,
  Color? statusColor,
  double? prediction,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'HiveName': hiveName,
      'LocationName': locationName,
      'UID': uid,
      'hiveHumidity': hiveHumidity,
      'hiveTemperature': hiveTemperature,
      'supplementQuantity': supplementQuantity,
      'weight': weight,
      'status': status,
      'timestamp': timestamp,
      'statusNumber': statusNumber,
      'location': location,
      'statusColor': statusColor,
      'prediction': prediction,
    }.withoutNulls,
  );

  return firestoreData;
}

class HiveDataCollectionRecordDocumentEquality
    implements Equality<HiveDataCollectionRecord> {
  const HiveDataCollectionRecordDocumentEquality();

  @override
  bool equals(HiveDataCollectionRecord? e1, HiveDataCollectionRecord? e2) {
    return e1?.hiveName == e2?.hiveName &&
        e1?.locationName == e2?.locationName &&
        e1?.uid == e2?.uid &&
        e1?.hiveHumidity == e2?.hiveHumidity &&
        e1?.hiveTemperature == e2?.hiveTemperature &&
        e1?.supplementQuantity == e2?.supplementQuantity &&
        e1?.weight == e2?.weight &&
        e1?.status == e2?.status &&
        e1?.timestamp == e2?.timestamp &&
        e1?.statusNumber == e2?.statusNumber &&
        e1?.location == e2?.location &&
        e1?.statusColor == e2?.statusColor &&
        e1?.prediction == e2?.prediction;
  }

  @override
  int hash(HiveDataCollectionRecord? e) => const ListEquality().hash([
        e?.hiveName,
        e?.locationName,
        e?.uid,
        e?.hiveHumidity,
        e?.hiveTemperature,
        e?.supplementQuantity,
        e?.weight,
        e?.status,
        e?.timestamp,
        e?.statusNumber,
        e?.location,
        e?.statusColor,
        e?.prediction
      ]);

  @override
  bool isValidKey(Object? o) => o is HiveDataCollectionRecord;
}
