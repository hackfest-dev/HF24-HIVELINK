import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

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

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _location = snapshotData['location'] as LatLng?;
    _status = snapshotData['status'] as String?;
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
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'location': location,
      'status': status,
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
        e1?.status == e2?.status;
  }

  @override
  int hash(HivesRecord? e) =>
      const ListEquality().hash([e?.name, e?.location, e?.status]);

  @override
  bool isValidKey(Object? o) => o is HivesRecord;
}
