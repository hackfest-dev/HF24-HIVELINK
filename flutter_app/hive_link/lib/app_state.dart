import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  List<int> _indexCount = [];
  List<int> get indexCount => _indexCount;
  set indexCount(List<int> value) {
    _indexCount = value;
  }

  void addToIndexCount(int value) {
    _indexCount.add(value);
  }

  void removeFromIndexCount(int value) {
    _indexCount.remove(value);
  }

  void removeAtIndexFromIndexCount(int index) {
    _indexCount.removeAt(index);
  }

  void updateIndexCountAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    _indexCount[index] = updateFn(_indexCount[index]);
  }

  void insertAtIndexInIndexCount(int index, int value) {
    _indexCount.insert(index, value);
  }

  List<double> _weightList = [];
  List<double> get weightList => _weightList;
  set weightList(List<double> value) {
    _weightList = value;
  }

  void addToWeightList(double value) {
    _weightList.add(value);
  }

  void removeFromWeightList(double value) {
    _weightList.remove(value);
  }

  void removeAtIndexFromWeightList(int index) {
    _weightList.removeAt(index);
  }

  void updateWeightListAtIndex(
    int index,
    double Function(double) updateFn,
  ) {
    _weightList[index] = updateFn(_weightList[index]);
  }

  void insertAtIndexInWeightList(int index, double value) {
    _weightList.insert(index, value);
  }

  DocumentReference? _docRef =
      FirebaseFirestore.instance.doc('/hiveDataCollection/hiveData1');
  DocumentReference? get docRef => _docRef;
  set docRef(DocumentReference? value) {
    _docRef = value;
  }
}
