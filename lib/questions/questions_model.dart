import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class QuestionsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for commentBox widget.
  TextEditingController? commentBoxController;
  String? Function(BuildContext, String?)? commentBoxControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    commentBoxController?.dispose();
  }

  /// Additional helper methods are added here.

}
