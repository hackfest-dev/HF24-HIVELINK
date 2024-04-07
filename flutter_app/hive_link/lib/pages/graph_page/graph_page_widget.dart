import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'graph_page_model.dart';
export 'graph_page_model.dart';

class GraphPageWidget extends StatefulWidget {
  const GraphPageWidget({
    super.key,
    required this.hiveInfo,
  });

  final DocumentReference? hiveInfo;

  @override
  State<GraphPageWidget> createState() => _GraphPageWidgetState();
}

class _GraphPageWidgetState extends State<GraphPageWidget> {
  late GraphPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GraphPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<HiveDataCollectionRecord>(
      stream: HiveDataCollectionRecord.getDocument(widget.hiveInfo!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 40.0,
                height: 40.0,
                child: SpinKitThreeBounce(
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 40.0,
                ),
              ),
            ),
          );
        }
        final graphPageHiveDataCollectionRecord = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 30.0,
                ),
                onPressed: () async {
                  context.pop();
                },
              ),
              title: Text(
                FFLocalizations.of(context).getText(
                  'u3jqyg4h' /* Advanced Details */,
                ),
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Outfit',
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: 22.0,
                      letterSpacing: 0.0,
                    ),
              ),
              actions: const [],
              centerTitle: true,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'kns7i841' /* Humidity */,
                        ),
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Outfit',
                              fontSize: 25.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                        child: SizedBox(
                          width: double.infinity,
                          height: double.infinity,
                          child: FlutterFlowLineChart(
                            data: [
                              FFLineChartData(
                                xData:
                                    graphPageHiveDataCollectionRecord.timeList,
                                yData: graphPageHiveDataCollectionRecord
                                    .temperatureList,
                                settings: LineChartBarData(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  barWidth: 2.0,
                                  isCurved: true,
                                  preventCurveOverShooting: true,
                                ),
                              )
                            ],
                            chartStylingInfo: ChartStylingInfo(
                              enableTooltip: true,
                              backgroundColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              showGrid: true,
                              borderColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                              borderWidth: 1.0,
                            ),
                            axisBounds: const AxisBounds(),
                            xAxisLabelInfo: AxisLabelInfo(
                              title: FFLocalizations.of(context).getText(
                                'm93y8qhf' /* TIme */,
                              ),
                              titleTextStyle: const TextStyle(
                                fontSize: 14.0,
                              ),
                              showLabels: true,
                              labelInterval: 100000.0,
                              labelFormatter: LabelFormatter(
                                numberFormat: (val) => formatNumber(
                                  val,
                                  formatType: FormatType.decimal,
                                  decimalType: DecimalType.periodDecimal,
                                ),
                              ),
                            ),
                            yAxisLabelInfo: AxisLabelInfo(
                              title: FFLocalizations.of(context).getText(
                                'zlnzkzyy' /* Temperature */,
                              ),
                              titleTextStyle: const TextStyle(
                                fontSize: 14.0,
                              ),
                              showLabels: true,
                              labelInterval: 10.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 5.0,
                      indent: 25.0,
                      endIndent: 25.0,
                      color: FlutterFlowTheme.of(context).primaryText,
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'ltw0bci4' /* Temperature */,
                        ),
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Outfit',
                              fontSize: 25.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                        child: SizedBox(
                          width: double.infinity,
                          height: double.infinity,
                          child: FlutterFlowLineChart(
                            data: [
                              FFLineChartData(
                                xData:
                                    graphPageHiveDataCollectionRecord.timeList,
                                yData: graphPageHiveDataCollectionRecord
                                    .temperatureList,
                                settings: LineChartBarData(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  barWidth: 2.0,
                                  isCurved: true,
                                  preventCurveOverShooting: true,
                                ),
                              )
                            ],
                            chartStylingInfo: ChartStylingInfo(
                              backgroundColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              showGrid: true,
                              borderColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                              borderWidth: 1.0,
                            ),
                            axisBounds: const AxisBounds(),
                            xAxisLabelInfo: AxisLabelInfo(
                              title: FFLocalizations.of(context).getText(
                                'h0i6ohd7' /* TIme */,
                              ),
                              titleTextStyle: const TextStyle(
                                fontSize: 14.0,
                              ),
                              showLabels: true,
                              labelInterval: 10.0,
                            ),
                            yAxisLabelInfo: AxisLabelInfo(
                              title: FFLocalizations.of(context).getText(
                                'y6mgzj3i' /* Temperature */,
                              ),
                              titleTextStyle: const TextStyle(
                                fontSize: 14.0,
                              ),
                              showLabels: true,
                              labelInterval: 10.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    FFButtonWidget(
                      onPressed: () async {
                        context.pushNamed('DataSimulationPage');
                      },
                      text: FFLocalizations.of(context).getText(
                        'rjipk2o7' /* Test Input */,
                      ),
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: const Color(0xFFFBD17C),
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Outfit',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                        elevation: 3.0,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ].addToStart(const SizedBox(height: 16.0)),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
