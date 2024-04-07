import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'data_simulation_page_widget.dart' show DataSimulationPageWidget;
import 'package:flutter/material.dart';

class DataSimulationPageModel
    extends FlutterFlowModel<DataSimulationPageWidget> {
  ///  Local state fields for this page.

  dynamic testingData;

  List<int> humidityList = [];
  void addToHumidityList(int item) => humidityList.add(item);
  void removeFromHumidityList(int item) => humidityList.remove(item);
  void removeAtIndexFromHumidityList(int index) => humidityList.removeAt(index);
  void insertAtIndexInHumidityList(int index, int item) =>
      humidityList.insert(index, item);
  void updateHumidityListAtIndex(int index, Function(int) updateFn) =>
      humidityList[index] = updateFn(humidityList[index]);

  List<double> temperatureList = [];
  void addToTemperatureList(double item) => temperatureList.add(item);
  void removeFromTemperatureList(double item) => temperatureList.remove(item);
  void removeAtIndexFromTemperatureList(int index) =>
      temperatureList.removeAt(index);
  void insertAtIndexInTemperatureList(int index, double item) =>
      temperatureList.insert(index, item);
  void updateTemperatureListAtIndex(int index, Function(double) updateFn) =>
      temperatureList[index] = updateFn(temperatureList[index]);

  String? abscond;

  String? health;

  String? weight;

  String? swarm;

  int? a1;

  int? h1;

  int? s1;

  int? w1;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - Read Document] action in DataSimulationPage widget.
  HiveDataCollectionRecord? hiveINFO;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  String? _textController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'qhjtq7i0' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  String? _textController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'p71fpoyd' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for CountController widget.
  int? countControllerValue;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // Stores action output result for [Backend Call - API (TestDataCall)] action in Button widget.
  ApiCallResponse? testDataCall;

  @override
  void initState(BuildContext context) {
    textController1Validator = _textController1Validator;
    textController2Validator = _textController2Validator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }

  /// Action blocks.
  Future input(BuildContext context) async {}
}
