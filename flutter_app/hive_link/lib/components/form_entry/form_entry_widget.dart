import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'form_entry_model.dart';
export 'form_entry_model.dart';

class FormEntryWidget extends StatefulWidget {
  const FormEntryWidget({super.key});

  @override
  State<FormEntryWidget> createState() => _FormEntryWidgetState();
}

class _FormEntryWidgetState extends State<FormEntryWidget> {
  late FormEntryModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FormEntryModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(
        controller: _model.textController,
        focusNode: _model.textFieldFocusNode,
        onFieldSubmitted: (_) async {
          setState(() {
            FFAppState()
                .addToWeightList(double.parse(_model.textController.text));
          });
        },
        autofocus: false,
        obscureText: false,
        decoration: InputDecoration(
          labelText: FFLocalizations.of(context).getText(
            'oosacwf4' /* Hive Weight */,
          ),
          hintText: FFLocalizations.of(context).getText(
            'x5mzjdqp' /* Enter Hive Weight */,
          ),
          hintStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                fontFamily: 'Poppins',
                letterSpacing: 0.0,
              ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xFFF9A61C),
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0x00000000),
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0x00000000),
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0x00000000),
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          contentPadding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
        ),
        style: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: 'Outfit',
              color: FlutterFlowTheme.of(context).primaryText,
              letterSpacing: 0.0,
            ),
        minLines: null,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        validator: _model.textControllerValidator.asValidator(context),
      ),
    );
  }
}
