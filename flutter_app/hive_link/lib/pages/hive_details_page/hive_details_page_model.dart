import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'hive_details_page_widget.dart' show HiveDetailsPageWidget;
import 'package:flutter/material.dart';

class HiveDetailsPageModel extends FlutterFlowModel<HiveDetailsPageWidget> {
  ///  Local state fields for this page.

  Color? pageStateColor;

  String? localStatus;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  HiveDataCollectionRecord? hiveDetailsPagePreviousSnapshot;
  // Stores action output result for [Backend Call - Read Document] action in hiveDetailsPage widget.
  HiveDataCollectionRecord? hiveRef;
  // Stores action output result for [Backend Call - Read Document] action in hiveDetailsPage widget.
  HiveDataCollectionRecord? loadhiveRef;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
