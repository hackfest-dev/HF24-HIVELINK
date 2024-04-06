import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HivesRecord extends FirestoreRecord {
  HivesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "weight" field.
  int? _weight;
  int get weight => _weight ?? 0;
  bool hasWeight() => _weight != null;

  // "humidity" field.
  int? _humidity;
  int get humidity => _humidity ?? 0;
  bool hasHumidity() => _humidity != null;

  // "temperature" field.
  double? _temperature;
  double get temperature => _temperature ?? 0.0;
  bool hasTemperature() => _temperature != null;

  // "suppliment_quantity" field.
  int? _supplimentQuantity;
  int get supplimentQuantity => _supplimentQuantity ?? 0;
  bool hasSupplimentQuantity() => _supplimentQuantity != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _location = snapshotData['location'] as LatLng?;
    _status = snapshotData['status'] as String?;
    _weight = castToType<int>(snapshotData['weight']);
    _humidity = castToType<int>(snapshotData['humidity']);
    _temperature = castToType<double>(snapshotData['temperature']);
    _supplimentQuantity = castToType<int>(snapshotData['suppliment_quantity']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('hives');

  static Stream<HivesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HivesRecord.fromSnapshot(s));

  static Future<HivesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => HivesRecord.fromSnapshot(s));

  static HivesRecord fromSnapshot(DocumentSnapshot snapshot) => HivesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HivesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HivesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HivesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HivesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHivesRecordData({
  String? name,
  LatLng? location,
  String? status,
  int? weight,
  int? humidity,
  double? temperature,
  int? supplimentQuantity,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'location': location,
      'status': status,
      'weight': weight,
      'humidity': humidity,
      'temperature': temperature,
      'suppliment_quantity': supplimentQuantity,
    }.withoutNulls,
  );

  return firestoreData;
}

class HivesRecordDocumentEquality implements Equality<HivesRecord> {
  const HivesRecordDocumentEquality();

  @override
  bool equals(HivesRecord? e1, HivesRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.location == e2?.location &&
        e1?.status == e2?.status &&
        e1?.weight == e2?.weight &&
        e1?.humidity == e2?.humidity &&
        e1?.temperature == e2?.temperature &&
        e1?.supplimentQuantity == e2?.supplimentQuantity;
  }

  @override
  int hash(HivesRecord? e) => const ListEquality().hash([
        e?.name,
        e?.location,
        e?.status,
        e?.weight,
        e?.humidity,
        e?.temperature,
        e?.supplimentQuantity
      ]);

  @override
  bool isValidKey(Object? o) => o is HivesRecord;
}
