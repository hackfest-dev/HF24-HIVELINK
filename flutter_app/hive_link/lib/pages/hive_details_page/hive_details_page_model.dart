import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'hive_details_page_widget.dart' show HiveDetailsPageWidget;
import 'package:flutter/material.dart';

class HiveDetailsPageModel extends FlutterFlowModel<HiveDetailsPageWidget> {
  ///  Local state fields for this page.

  Color? pageStateColor;

  String? localStatus;

  int? statusNumber;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  HiveDataCollectionRecord? hiveDetailsPagePreviousSnapshot;
  // Stores action output result for [Backend Call - Read Document] action in hiveDetailsPage widget.
  HiveDataCollectionRecord? hiveRef;
  // Stores action output result for [Backend Call - API (TestDataCall)] action in hiveDetailsPage widget.
  ApiCallResponse? automaticCall;
  // Stores action output result for [Backend Call - Read Document] action in hiveDetailsPage widget.
  HiveDataCollectionRecord? loadhiveRef1;
  // Stores action output result for [Backend Call - API (TestDataCall)] action in hiveDetailsPage widget.
  ApiCallResponse? automaticCall1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
