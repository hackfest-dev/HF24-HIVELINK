import '/components/main_logo/main_logo_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'community_page_widget.dart' show CommunityPageWidget;
import 'package:flutter/material.dart';

class CommunityPageModel extends FlutterFlowModel<CommunityPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for main_Logo component.
  late MainLogoModel mainLogoModel;
  // State field(s) for searchField widget.
  FocusNode? searchFieldFocusNode;
  TextEditingController? searchFieldController;
  String? Function(BuildContext, String?)? searchFieldControllerValidator;

  @override
  void initState(BuildContext context) {
    mainLogoModel = createModel(context, () => MainLogoModel());
  }

  @override
  void dispose() {
    mainLogoModel.dispose();
    searchFieldFocusNode?.dispose();
    searchFieldController?.dispose();
  }
}
