import '/flutter_flow/flutter_flow_util.dart';
import 'add_hive_widget.dart' show AddHiveWidget;
import 'package:flutter/material.dart';

class AddHiveModel extends FlutterFlowModel<AddHiveWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for projectName widget.
  FocusNode? projectNameFocusNode;
  TextEditingController? projectNameController;
  String? Function(BuildContext, String?)? projectNameControllerValidator;
  String? _projectNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'm5nyh8na' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for PlacePicker widget.
  var placePickerValue = const FFPlace();
  // State field(s) for Code widget.
  FocusNode? codeFocusNode;
  TextEditingController? codeController;
  String? Function(BuildContext, String?)? codeControllerValidator;

  @override
  void initState(BuildContext context) {
    projectNameControllerValidator = _projectNameControllerValidator;
  }

  @override
  void dispose() {
    projectNameFocusNode?.dispose();
    projectNameController?.dispose();

    codeFocusNode?.dispose();
    codeController?.dispose();
  }
}
