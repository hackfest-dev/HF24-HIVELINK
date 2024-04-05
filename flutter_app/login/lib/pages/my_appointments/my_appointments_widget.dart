import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/book_appointment/book_appointment_widget.dart';
import '/components/empty_list/empty_list_widget.dart';
import '/components/hiveinformation/hiveinformation_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'my_appointments_model.dart';
export 'my_appointments_model.dart';

class MyAppointmentsWidget extends StatefulWidget {
  const MyAppointmentsWidget({super.key});

  @override
  State<MyAppointmentsWidget> createState() => _MyAppointmentsWidgetState();
}

class _MyAppointmentsWidgetState extends State<MyAppointmentsWidget> {
  late MyAppointmentsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyAppointmentsModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            barrierColor: const Color(0x00000000),
            context: context,
            builder: (context) {
              return Padding(
                padding: MediaQuery.viewInsetsOf(context),
                child: SizedBox(
                  height: double.infinity,
                  child: BookAppointmentWidget(
                    userProfile: currentUserReference,
                  ),
                ),
              );
            },
          ).then((value) => safeSetState(() {}));
        },
        backgroundColor: FlutterFlowTheme.of(context).primary,
        elevation: 8.0,
        child: Icon(
          Icons.add_rounded,
          color: FlutterFlowTheme.of(context).textColor,
          size: 36.0,
        ),
      ),
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        automaticallyImplyLeading: false,
        title: Text(
          'My Hives',
          style: FlutterFlowTheme.of(context).displaySmall.override(
                fontFamily: 'Outfit',
                letterSpacing: 0.0,
              ),
        ),
        actions: const [],
        centerTitle: false,
        elevation: 0.0,
      ),
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 12.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Check in on your Beehives',
                    style: FlutterFlowTheme.of(context).bodySmall.override(
                          fontFamily: 'Outfit',
                          letterSpacing: 0.0,
                        ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: PagedListView<DocumentSnapshot<Object?>?, HivesRecord>(
                pagingController: _model.setListViewController(
                  HivesRecord.collection.orderBy('name'),
                ),
                padding: EdgeInsets.zero,
                reverse: false,
                scrollDirection: Axis.vertical,
                builderDelegate: PagedChildBuilderDelegate<HivesRecord>(
                  // Customize what your widget looks like when it's loading the first page.
                  firstPageProgressIndicatorBuilder: (_) => Center(
                    child: SizedBox(
                      width: 40.0,
                      height: 40.0,
                      child: SpinKitPumpingHeart(
                        color: FlutterFlowTheme.of(context).primary,
                        size: 40.0,
                      ),
                    ),
                  ),
                  // Customize what your widget looks like when it's loading another page.
                  newPageProgressIndicatorBuilder: (_) => Center(
                    child: SizedBox(
                      width: 40.0,
                      height: 40.0,
                      child: SpinKitPumpingHeart(
                        color: FlutterFlowTheme.of(context).primary,
                        size: 40.0,
                      ),
                    ),
                  ),
                  noItemsFoundIndicatorBuilder: (_) => const Center(
                    child: EmptyListWidget(),
                  ),
                  itemBuilder: (context, _, listViewIndex) {
                    final listViewHivesRecord = _model
                        .listViewPagingController!.itemList![listViewIndex];
                    return wrapWithModel(
                      model: _model.hiveinformationModels.getModel(
                        listViewHivesRecord.status,
                        listViewIndex,
                      ),
                      updateCallback: () => setState(() {}),
                      updateOnChange: true,
                      child: HiveinformationWidget(
                        key: Key(
                          'Key5zr_${listViewHivesRecord.status}',
                        ),
                        parameter1: valueOrDefault<String>(
                          listViewHivesRecord.name,
                          'Hive',
                        ),
                        parameter2: listViewHivesRecord.location?.toString(),
                        parameter3: 'Status :',
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
