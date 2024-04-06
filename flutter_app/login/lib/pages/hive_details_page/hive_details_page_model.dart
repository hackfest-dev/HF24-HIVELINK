import '/flutter_flow/flutter_flow_util.dart';
import 'hive_details_page_widget.dart' show HiveDetailsPageWidget;
import 'package:flutter/material.dart';

class HiveDetailsPageModel extends FlutterFlowModel<HiveDetailsPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
