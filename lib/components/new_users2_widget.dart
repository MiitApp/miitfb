import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'new_users2_model.dart';
export 'new_users2_model.dart';

class NewUsers2Widget extends StatefulWidget {
  const NewUsers2Widget({Key? key}) : super(key: key);

  @override
  _NewUsers2WidgetState createState() => _NewUsers2WidgetState();
}

class _NewUsers2WidgetState extends State<NewUsers2Widget> {
  late NewUsers2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewUsers2Model());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
      child: Container(
        width: double.infinity,
        height: 270.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primary,
          borderRadius: BorderRadius.circular(0.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 0.0, 0.0),
              child: Text(
                'You quotes',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 12.0),
              child: Text(
                'You will find your quote options below.',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                    ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                primary: false,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 0.0, 12.0),
                    child: Container(
                      width: 270.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4.0,
                            color: Color(0x2B202529),
                            offset: Offset(0.0, 2.0),
                          )
                        ],
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            12.0, 12.0, 12.0, 12.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Text(
                                    'Company Name',
                                    style:
                                        FlutterFlowTheme.of(context).titleSmall,
                                  ),
                                ),
                                Icon(
                                  Icons.star_rounded,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 24.0,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 4.0, 0.0),
                                  child: Text(
                                    '4.5',
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ),
                                Text(
                                  '(242)',
                                  style: FlutterFlowTheme.of(context).bodySmall,
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 50.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    '\$194.25',
                                    style: FlutterFlowTheme.of(context)
                                        .displaySmall,
                                  ),
                                  Expanded(
                                    child: Text(
                                      '/mo',
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall,
                                    ),
                                  ),
                                  FlutterFlowIconButton(
                                    borderColor: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    borderRadius: 30.0,
                                    borderWidth: 2.0,
                                    buttonSize: 44.0,
                                    icon: Icon(
                                      Icons.arrow_forward_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                    onPressed: () {
                                      print('IconButton pressed ...');
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  Icons.local_fire_department_sharp,
                                  color: FlutterFlowTheme.of(context).alternate,
                                  size: 24.0,
                                ),
                                Text(
                                  '\$124.29 yearly savings',
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
                    child: Container(
                      width: 270.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4.0,
                            color: Color(0x2B202529),
                            offset: Offset(0.0, 2.0),
                          )
                        ],
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            12.0, 12.0, 12.0, 12.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Text(
                                    'Company Name',
                                    style:
                                        FlutterFlowTheme.of(context).titleSmall,
                                  ),
                                ),
                                Icon(
                                  Icons.star_rounded,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 24.0,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 4.0, 0.0),
                                  child: Text(
                                    '4.5',
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ),
                                Text(
                                  '(242)',
                                  style: FlutterFlowTheme.of(context).bodySmall,
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 50.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    '\$194.25',
                                    style: FlutterFlowTheme.of(context)
                                        .displaySmall,
                                  ),
                                  Expanded(
                                    child: Text(
                                      '/mo',
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall,
                                    ),
                                  ),
                                  FlutterFlowIconButton(
                                    borderColor: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    borderRadius: 30.0,
                                    borderWidth: 2.0,
                                    buttonSize: 44.0,
                                    icon: Icon(
                                      Icons.arrow_forward_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                    onPressed: () {
                                      print('IconButton pressed ...');
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  Icons.local_fire_department_sharp,
                                  color: FlutterFlowTheme.of(context).alternate,
                                  size: 24.0,
                                ),
                                Text(
                                  '\$124.29 yearly savings',
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
